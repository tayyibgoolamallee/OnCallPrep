# Stripe Integration Setup Guide

This guide will walk you through setting up Stripe payments for OnCallPrep.

## Prerequisites

- Stripe account created
- Vercel project deployed
- Supabase project set up with `user_profiles` table

## Step 1: Get Your Stripe API Keys

1. Go to [Stripe Dashboard](https://dashboard.stripe.com)
2. Make sure you're in **Test Mode** (toggle in top right)
3. Go to **Developers → API keys**
4. Copy your:
   - **Publishable key** (starts with `pk_test_`)
   - **Secret key** (starts with `sk_test_`) - Click "Reveal test key"

## Step 2: Set Up Stripe Webhook

1. In Stripe Dashboard, go to **Developers → Webhooks**
2. Click **Add endpoint**
3. Set the endpoint URL to:
   ```
   https://your-domain.vercel.app/api/stripe-webhook
   ```
   (Replace `your-domain` with your actual Vercel domain)
4. Select events to listen for:
   - `checkout.session.completed`
   - `customer.subscription.updated`
   - `customer.subscription.deleted`
   - `invoice.payment_failed`
5. Click **Add endpoint**
6. Copy the **Signing secret** (starts with `whsec_`)

## Step 3: Configure Vercel Environment Variables

1. Go to your Vercel project dashboard
2. Navigate to **Settings → Environment Variables**
3. Add the following variables:

### Required Variables:

```
STRIPE_SECRET_KEY=sk_test_xxxxx (your Stripe secret key)
STRIPE_WEBHOOK_SECRET=whsec_xxxxx (your webhook signing secret)
SUPABASE_URL=https://xxxxx.supabase.co (your Supabase URL)
SUPABASE_SERVICE_KEY=xxxxx (your Supabase service role key - NOT the anon key!)
```

### Optional Variables (if using pre-created prices):

```
STRIPE_PRICE_MONTHLY=price_xxxxx
STRIPE_PRICE_3MONTH=price_xxxxx
STRIPE_PRICE_6MONTH=price_xxxxx
STRIPE_PRICE_12MONTH=price_xxxxx
```

**Important Notes:**
- Use **Test Mode** keys for testing (`sk_test_` and `pk_test_`)
- Use **Live Mode** keys for production (`sk_live_` and `pk_live_`)
- The `SUPABASE_SERVICE_KEY` is different from the anon key - get it from Supabase Dashboard → Settings → API → `service_role` key
- Set these for **Production**, **Preview**, and **Development** environments

## Step 4: Update Supabase Table Schema

Make sure your `user_profiles` table has these columns:

```sql
ALTER TABLE user_profiles
ADD COLUMN IF NOT EXISTS stripe_customer_id TEXT,
ADD COLUMN IF NOT EXISTS stripe_subscription_id TEXT;
```

## Step 5: Deploy to Vercel

1. Commit your changes:
   ```bash
   git add .
   git commit -m "Add Stripe integration"
   git push
   ```

2. Vercel will automatically deploy

3. After deployment, update your webhook URL in Stripe Dashboard to use the new deployment URL

## Step 6: Test the Integration

### Test Mode Cards:

Use these test card numbers in Stripe Checkout:

- **Success:** `4242 4242 4242 4242`
- **Decline:** `4000 0000 0000 0002`
- **Requires Authentication:** `4000 0025 0000 3155`

Use any:
- Future expiry date (e.g., 12/25)
- Any 3-digit CVC
- Any postal code

### Test Flow:

1. Go to your pricing page
2. Click "Start Free Trial" or any subscription button
3. Complete checkout with test card
4. Check Stripe Dashboard → Customers to see the customer
5. Check Stripe Dashboard → Webhooks to see webhook events
6. Verify user profile in Supabase is updated to `plan = 'pro'`

## Step 7: Go Live

When ready for production:

1. Switch Stripe Dashboard to **Live Mode**
2. Get your live API keys
3. Update Vercel environment variables with live keys
4. Create a new webhook endpoint for production
5. Update webhook URL to production domain
6. Redeploy

## Troubleshooting

### Webhook Not Working

1. Check Vercel function logs: Vercel Dashboard → Your Project → Functions → `stripe-webhook`
2. Check Stripe webhook logs: Stripe Dashboard → Developers → Webhooks → Your endpoint → Recent events
3. Verify webhook secret matches in Vercel environment variables
4. Make sure you're using the correct webhook URL (test vs live)

### Checkout Not Creating Sessions

1. Check browser console for errors
2. Check Vercel function logs for `create-checkout-session`
3. Verify `STRIPE_SECRET_KEY` is set correctly
4. Check that the API endpoint is accessible: `https://your-domain.vercel.app/api/create-checkout-session`

### Users Not Getting Pro Access

1. Check webhook is receiving events (Stripe Dashboard)
2. Check Supabase `user_profiles` table for updates
3. Verify `SUPABASE_SERVICE_KEY` has proper permissions
4. Check Vercel function logs for errors

### Common Issues

- **"Webhook Error: No signature found"** - Make sure webhook secret is set correctly
- **"Payment service not configured"** - Check `STRIPE_SECRET_KEY` environment variable
- **"Database not configured"** - Check `SUPABASE_URL` and `SUPABASE_SERVICE_KEY`

## Statement Descriptor

The statement descriptor shown on customer bank statements is configured in your Stripe Dashboard:
1. Go to **Settings → Branding**
2. Set **Statement descriptor** to: `ONCALLPREP TRAINING`
3. Set **Short descriptor** to: `ONCALLPREP`

## Support

If you encounter issues:
1. Check Vercel function logs
2. Check Stripe Dashboard webhook logs
3. Verify all environment variables are set
4. Test with Stripe test mode first


