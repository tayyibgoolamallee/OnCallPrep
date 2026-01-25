/**
 * Vercel Serverless Function for Creating Stripe Checkout Sessions
 * 
 * This function creates a Stripe checkout session for subscription payments
 * API keys are stored in Vercel environment variables
 */

export default async function handler(req, res) {
  // Only allow POST requests
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  // Get plan and user info from request
  const { plan, userId, userEmail } = req.body;

  if (!plan) {
    return res.status(400).json({ error: 'Plan is required' });
  }

  // Check for Stripe secret key
  const stripeSecretKey = process.env.STRIPE_SECRET_KEY;
  if (!stripeSecretKey) {
    console.error('STRIPE_SECRET_KEY not configured');
    return res.status(500).json({ error: 'Payment service not configured. Please contact support.' });
  }

  // Get base URL for success/cancel redirects
  const baseUrl = process.env.VERCEL_URL 
    ? `https://${process.env.VERCEL_URL}` 
    : (req.headers.origin || 'http://localhost:3000');

  try {
    // Import Stripe SDK dynamically (for serverless)
    const stripe = (await import('stripe')).default;
    const stripeClient = new stripe(stripeSecretKey);

    // Map plan to Stripe price IDs (you'll need to create these in Stripe Dashboard)
    // For now, we'll use the plan name and create prices on the fly or use existing ones
    const planConfig = {
      'monthly': {
        priceId: process.env.STRIPE_PRICE_MONTHLY, // e.g., price_xxxxx
        amount: 1500, // £15.00 in pence
        currency: 'gbp',
        interval: 'month',
        intervalCount: 1
      },
      '3month': {
        priceId: process.env.STRIPE_PRICE_3MONTH,
        amount: 3600, // £36.00 in pence
        currency: 'gbp',
        interval: 'month',
        intervalCount: 3
      },
      '6month': {
        priceId: process.env.STRIPE_PRICE_6MONTH,
        amount: 6300, // £63.00 in pence
        currency: 'gbp',
        interval: 'month',
        intervalCount: 6
      },
      '12month': {
        priceId: process.env.STRIPE_PRICE_12MONTH,
        amount: 9900, // £99.00 in pence
        currency: 'gbp',
        interval: 'month',
        intervalCount: 12
      }
    };

    const selectedPlan = planConfig[plan];
    if (!selectedPlan) {
      return res.status(400).json({ error: 'Invalid plan selected' });
    }

    // Create checkout session
    const sessionParams = {
      payment_method_types: ['card'],
      mode: 'subscription',
      line_items: [
        {
          price_data: {
            currency: selectedPlan.currency,
            product_data: {
              name: 'OnCallPrep Pro',
              description: `Pro subscription - ${plan === 'monthly' ? 'Monthly' : plan === '3month' ? '3 Months' : plan === '6month' ? '6 Months' : '12 Months'}`,
            },
            unit_amount: selectedPlan.amount,
            recurring: {
              interval: selectedPlan.interval,
              interval_count: selectedPlan.intervalCount,
            },
          },
          quantity: 1,
        },
      ],
      success_url: `${baseUrl}/pages/success.html?session_id={CHECKOUT_SESSION_ID}`,
      cancel_url: `${baseUrl}/pages/cancel.html`,
      client_reference_id: userId || undefined,
      customer_email: userEmail || undefined,
      metadata: {
        plan: plan,
        userId: userId || 'unknown',
      },
      subscription_data: {
        metadata: {
          plan: plan,
          userId: userId || 'unknown',
        },
      },
      // Allow promotion codes
      allow_promotion_codes: true,
    };

    // If you have pre-created price IDs in Stripe, use them instead:
    // if (selectedPlan.priceId) {
    //   sessionParams.line_items = [{
    //     price: selectedPlan.priceId,
    //     quantity: 1,
    //   }];
    // }

    const session = await stripeClient.checkout.sessions.create(sessionParams);

    // Return session ID to frontend
    res.status(200).json({ 
      sessionId: session.id,
      url: session.url
    });

  } catch (error) {
    console.error('Stripe API error:', error);
    
    // Handle specific Stripe errors
    if (error.type === 'StripeCardError') {
      return res.status(400).json({ error: error.message });
    } else if (error.type === 'StripeInvalidRequestError') {
      return res.status(400).json({ error: 'Invalid request. Please check your plan selection.' });
    }
    
    // Generic error
    return res.status(500).json({ error: 'Failed to create checkout session. Please try again.' });
  }
}


