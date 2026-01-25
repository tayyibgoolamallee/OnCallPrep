/**
 * Vercel Serverless Function for Handling Stripe Webhooks
 * 
 * This function processes Stripe webhook events to automatically
 * grant/revoke Pro access based on subscription status
 */

export default async function handler(req, res) {
  // Only allow POST requests
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const stripeSecretKey = process.env.STRIPE_SECRET_KEY;
  const webhookSecret = process.env.STRIPE_WEBHOOK_SECRET;

  if (!stripeSecretKey || !webhookSecret) {
    console.error('Stripe keys not configured');
    return res.status(500).json({ error: 'Webhook not configured' });
  }

  // Get Supabase credentials
  const supabaseUrl = process.env.SUPABASE_URL;
  const supabaseServiceKey = process.env.SUPABASE_SERVICE_KEY;

  if (!supabaseUrl || !supabaseServiceKey) {
    console.error('Supabase keys not configured');
    return res.status(500).json({ error: 'Database not configured' });
  }

  try {
    // Import Stripe and Supabase SDKs
    const stripe = (await import('stripe')).default;
    const { createClient } = await import('@supabase/supabase-js');
    
    const stripeClient = new stripe(stripeSecretKey);
    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Get the signature from headers
    const sig = req.headers['stripe-signature'];
    if (!sig) {
      return res.status(400).json({ error: 'No signature found' });
    }

    // For Vercel, the body might be a string or buffer
    let body = req.body;
    if (typeof body === 'string') {
      body = Buffer.from(body);
    }

    // Verify webhook signature
    let event;
    try {
      event = stripeClient.webhooks.constructEvent(body, sig, webhookSecret);
    } catch (err) {
      console.error('Webhook signature verification failed:', err.message);
      return res.status(400).json({ error: `Webhook Error: ${err.message}` });
    }

    // Handle the event
    switch (event.type) {
      case 'checkout.session.completed': {
        const session = event.data.object;
        
        // Get customer email and metadata
        const customerEmail = session.customer_details?.email;
        const userId = session.metadata?.userId || session.client_reference_id;
        const plan = session.metadata?.plan || 'monthly';

        if (!customerEmail && !userId) {
          console.error('No email or userId in checkout session');
          break;
        }

        // Calculate expiration date based on plan
        const planMonths = {
          'monthly': 1,
          '3month': 3,
          '6month': 6,
          '12month': 12
        };
        const months = planMonths[plan] || 1;
        const expiresAt = new Date();
        expiresAt.setMonth(expiresAt.getMonth() + months);

        // Update user profile in Supabase
        const updateData = {
          plan: 'pro',
          subscription_status: 'active',
          subscription_expires_at: expiresAt.toISOString(),
          stripe_customer_id: session.customer || null,
          stripe_subscription_id: session.subscription || null,
        };

        let updateResult;
        if (userId && userId !== 'unknown') {
          // Update by user ID
          updateResult = await supabase
            .from('user_profiles')
            .update(updateData)
            .eq('id', userId);
        } else if (customerEmail) {
          // Update by email (fallback)
          updateResult = await supabase
            .from('user_profiles')
            .update(updateData)
            .eq('email', customerEmail);
        }

        if (updateResult?.error) {
          console.error('Error updating user profile:', updateResult.error);
        } else {
          console.log(`Pro access granted: ${customerEmail || userId}`);
        }
        break;
      }

      case 'customer.subscription.updated': {
        const subscription = event.data.object;
        const customerId = subscription.customer;
        const status = subscription.status;

        // Get customer email from Stripe
        const customer = await stripeClient.customers.retrieve(customerId);
        const customerEmail = customer.email;

        if (!customerEmail) {
          console.error('No email found for customer:', customerId);
          break;
        }

        // Update subscription status
        const updateData = {
          subscription_status: status === 'active' ? 'active' : 'inactive',
        };

        if (status === 'canceled' || status === 'unpaid') {
          // Calculate expiration based on current_period_end
          const expiresAt = new Date(subscription.current_period_end * 1000);
          updateData.subscription_expires_at = expiresAt.toISOString();
        } else if (status === 'active') {
          // Extend expiration
          const expiresAt = new Date(subscription.current_period_end * 1000);
          updateData.subscription_expires_at = expiresAt.toISOString();
        }

        const updateResult = await supabase
          .from('user_profiles')
          .update(updateData)
          .eq('stripe_customer_id', customerId);

        if (updateResult?.error) {
          console.error('Error updating subscription:', updateResult.error);
        }
        break;
      }

      case 'customer.subscription.deleted': {
        const subscription = event.data.object;
        const customerId = subscription.customer;

        // Get customer email from Stripe
        const customer = await stripeClient.customers.retrieve(customerId);
        const customerEmail = customer.email;

        if (!customerEmail) {
          console.error('No email found for customer:', customerId);
          break;
        }

        // Downgrade user to free
        const updateResult = await supabase
          .from('user_profiles')
          .update({
            plan: 'free',
            subscription_status: 'canceled',
            subscription_expires_at: null,
          })
          .eq('stripe_customer_id', customerId);

        if (updateResult?.error) {
          console.error('Error downgrading user:', updateResult.error);
        } else {
          console.log(`User downgraded to free: ${customerEmail}`);
        }
        break;
      }

      case 'invoice.payment_failed': {
        const invoice = event.data.object;
        const customerId = invoice.customer;

        // Update subscription status to indicate payment issue
        const updateResult = await supabase
          .from('user_profiles')
          .update({
            subscription_status: 'past_due',
          })
          .eq('stripe_customer_id', customerId);

        if (updateResult?.error) {
          console.error('Error updating payment status:', updateResult.error);
        }
        break;
      }

      case 'invoice.paid': {
        // Handle successful invoice payment (renewals)
        const invoice = event.data.object;
        const customerId = invoice.customer;
        const subscriptionId = invoice.subscription;

        if (subscriptionId) {
          // Get subscription to calculate expiration
          const subscription = await stripeClient.subscriptions.retrieve(subscriptionId);
          const expiresAt = new Date(subscription.current_period_end * 1000);

          const updateResult = await supabase
            .from('user_profiles')
            .update({
              subscription_status: 'active',
              subscription_expires_at: expiresAt.toISOString(),
            })
            .eq('stripe_customer_id', customerId);

          if (updateResult?.error) {
            console.error('Error updating subscription renewal:', updateResult.error);
          } else {
            console.log(`Subscription renewed for customer: ${customerId}`);
          }
        }
        break;
      }

      case 'invoice.payment_action_required': {
        // Handle 3D Secure or other payment authentication required
        const invoice = event.data.object;
        const customerId = invoice.customer;

        const updateResult = await supabase
          .from('user_profiles')
          .update({
            subscription_status: 'payment_action_required',
          })
          .eq('stripe_customer_id', customerId);

        if (updateResult?.error) {
          console.error('Error updating payment action required:', updateResult.error);
        } else {
          console.log(`Payment action required for customer: ${customerId}`);
        }
        break;
      }

      case 'customer.subscription.created': {
        // Handle new subscription creation
        const subscription = event.data.object;
        const customerId = subscription.customer;

        // Get customer email
        const customer = await stripeClient.customers.retrieve(customerId);
        const customerEmail = customer.email;

        if (customerEmail) {
          const expiresAt = new Date(subscription.current_period_end * 1000);
          const updateResult = await supabase
            .from('user_profiles')
            .update({
              plan: 'pro',
              subscription_status: 'active',
              subscription_expires_at: expiresAt.toISOString(),
              stripe_customer_id: customerId,
              stripe_subscription_id: subscription.id,
            })
            .eq('email', customerEmail);

          if (updateResult?.error) {
            console.error('Error updating subscription creation:', updateResult.error);
          } else {
            console.log(`Subscription created for: ${customerEmail}`);
          }
        }
        break;
      }

      case 'customer.subscription.trial_will_end': {
        // Handle trial ending soon (you can use this to send reminder emails)
        const subscription = event.data.object;
        const customerId = subscription.customer;
        
        console.log(`Trial ending soon for customer: ${customerId}`);
        // You can add email notification logic here later
        break;
      }

      case 'charge.refunded': {
        // Handle refunds - optionally downgrade user
        const charge = event.data.object;
        const customerId = charge.customer;

        if (customerId) {
          // Check if this is a full refund that should downgrade the user
          // For now, just log it - you can add logic to check refund amount
          console.log(`Refund processed for customer: ${customerId}`);
          // You might want to check if it's a full refund and downgrade accordingly
        }
        break;
      }

      case 'customer.created': {
        // Log new customer creation
        const customer = event.data.object;
        console.log(`New customer created: ${customer.email || customer.id}`);
        break;
      }

      case 'customer.updated': {
        // Handle customer updates (email changes, etc.)
        const customer = event.data.object;
        
        // If email changed, update Supabase
        if (customer.email) {
          const updateResult = await supabase
            .from('user_profiles')
            .update({ email: customer.email })
            .eq('stripe_customer_id', customer.id);

          if (updateResult?.error) {
            console.error('Error updating customer email:', updateResult.error);
          }
        }
        break;
      }

      default:
        console.log(`Unhandled event type: ${event.type}`);
    }

    // Return success
    res.status(200).json({ received: true });

  } catch (error) {
    console.error('Webhook processing error:', error);
    return res.status(500).json({ error: 'Webhook processing failed' });
  }
}

