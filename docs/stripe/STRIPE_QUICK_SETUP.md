# Stripe Quick Setup Guide

## 🚀 Fastest Way to Accept Payments (No Backend Required)

For MVP, use **Stripe Payment Links** - it's the simplest way to start accepting payments without writing any backend code.

---

## Step 1: Create Stripe Account (5 minutes)

1. Go to [stripe.com](https://stripe.com)
2. Sign up (use test mode first)
3. Complete account setup
4. Go to Dashboard → Developers → API keys
5. Copy your **Publishable Key** (starts with `pk_test_` or `pk_live_`)

---

## Step 2: Create Product & Price (5 minutes)

1. **Dashboard → Products → Add Product**
2. Fill in:
   - **Name:** OnCallPrep Pro
   - **Description:** Full access to all GP training resources
   - **Pricing:** 
     - Type: Recurring
     - Price: £9.99 (or your price)
     - Billing period: Monthly
3. **Save Product**

---

## Step 3: Create Payment Link (2 minutes)

1. **Dashboard → Payment Links → Create Payment Link**
2. Select your "OnCallPrep Pro" product
3. **Settings:**
   - Success URL: `https://your-site.vercel.app/success`
   - Cancel URL: `https://your-site.vercel.app/pricing`
4. **Copy the Payment Link** (looks like: `https://buy.stripe.com/xxxxx`)

---

## Step 4: Add to Your Pricing Page (5 minutes)

Update `pricing.html` - find the "Subscribe" button and replace with:

```html
<a href="https://buy.stripe.com/YOUR_LINK_HERE" 
   class="btn btn-primary btn-lg" 
   target="_blank">
    Subscribe to Pro - £9.99/month
</a>
```

**That's it!** Users can now click and pay. No backend code needed.

---

## Step 5: Activate Pro Access (Manual for MVP)

### Option A: Manual (Simplest for MVP)

1. **Check Stripe Dashboard** for new customers
2. **Get their email** from Stripe
3. **Update Supabase:**
   ```sql
   UPDATE user_profiles 
   SET 
       plan = 'pro',
       subscription_status = 'active',
       subscription_expires_at = NOW() + INTERVAL '1 month'
   WHERE email = 'customer@example.com';
   ```

### Option B: Semi-Automated with Zapier/Make.com

1. **Set up Zapier/Make.com:**
   - Trigger: New Stripe customer
   - Action: Update Supabase (via API)
   - Map email from Stripe to Supabase

2. **Takes 15 minutes to set up** and automates everything!

---

## Step 6: Create Success Page (10 minutes)

Create `success.html`:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful | OnCallPrep</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <div class="container" style="max-width: 600px; margin: 4rem auto; padding: 2rem; text-align: center;">
        <h1 style="color: var(--color-success-700);">✅ Payment Successful!</h1>
        <p style="font-size: 1.125rem; margin: 2rem 0;">
            Thank you for subscribing to OnCallPrep Pro!
        </p>
        <p style="color: var(--color-gray-600); margin-bottom: 2rem;">
            Your account will be upgraded within the next few minutes. 
            If you're already logged in, please refresh the page to see your Pro features.
        </p>
        <div style="display: flex; gap: 1rem; justify-content: center;">
            <a href="index.html" class="btn btn-primary">Go to Dashboard</a>
            <a href="pricing.html" class="btn btn-outline">View Plans</a>
        </div>
    </div>
</body>
</html>
```

---

## 🔄 Later: Automate with Webhooks (When You Have Time)

### Set Up Stripe Webhook:

1. **Stripe Dashboard → Developers → Webhooks → Add Endpoint**
2. **Endpoint URL:** `https://your-site.vercel.app/api/stripe-webhook`
3. **Events to listen for:**
   - `checkout.session.completed`
   - `customer.subscription.created`
   - `customer.subscription.updated`
   - `customer.subscription.deleted`
4. **Copy Webhook Signing Secret**

### Create Webhook Handler:

Create `api/stripe-webhook.js` (Vercel serverless function):

```javascript
const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);
const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_KEY // Use service key, not anon key
);

export default async function handler(req, res) {
  const sig = req.headers['stripe-signature'];
  let event;

  try {
    event = stripe.webhooks.constructEvent(
      req.body,
      sig,
      process.env.STRIPE_WEBHOOK_SECRET
    );
  } catch (err) {
    return res.status(400).send(`Webhook Error: ${err.message}`);
  }

  // Handle the event
  switch (event.type) {
    case 'checkout.session.completed':
      const session = event.data.object;
      const customerEmail = session.customer_details.email;
      
      // Update user in Supabase
      await supabase
        .from('user_profiles')
        .update({
          plan: 'pro',
          subscription_status: 'active',
          subscription_expires_at: new Date(Date.now() + 30 * 24 * 60 * 60 * 1000).toISOString()
        })
        .eq('email', customerEmail);
      
      break;
      
    case 'customer.subscription.deleted':
      // Handle cancellation
      const subscription = event.data.object;
      // Update user back to 'free'
      break;
  }

  res.json({ received: true });
}
```

### Add Environment Variables in Vercel:
- `STRIPE_SECRET_KEY`
- `STRIPE_WEBHOOK_SECRET`
- `SUPABASE_SERVICE_KEY` (get from Supabase Dashboard → Settings → API)

---

## ✅ Testing

### Test Mode:
1. Use test card: `4242 4242 4242 4242`
2. Any future expiry date
3. Any 3-digit CVC
4. Any postal code

### Test the Flow:
1. Click "Subscribe" button
2. Complete test payment
3. Check Stripe Dashboard for customer
4. Manually activate pro (or wait for webhook)
5. Verify pro features work

---

## 💡 Pro Tips

1. **Start with test mode** - Test everything before going live
2. **Use Payment Links for MVP** - Add webhooks later
3. **Monitor Stripe Dashboard** - See all payments in real-time
4. **Set up email notifications** - Get notified of new customers
5. **Add analytics** - Track conversion rates

---

## 🎉 You're Done!

Users can now:
1. Click "Subscribe" on pricing page
2. Pay via Stripe
3. Get pro access (manually or via webhook)

**Total setup time: ~20 minutes** (without webhooks)


