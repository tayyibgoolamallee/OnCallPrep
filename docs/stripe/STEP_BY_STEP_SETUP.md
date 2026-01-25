# Step-by-Step Stripe Integration Guide

Follow these steps in order. Each step builds on the previous one.

---

## ✅ Step 1: Install Dependencies (DONE)

You've already installed Node.js. The dependencies will be installed automatically by Vercel when you deploy, but if you want to install them locally:

```bash
cd "/Users/ty/oncallprep project"
npm install
```

**You can skip this if you're just deploying to Vercel** - Vercel will handle it automatically.

---

## 📋 Step 2: Get Your Stripe API Keys

### 2.1. Go to Stripe Dashboard
1. Open [https://dashboard.stripe.com](https://dashboard.stripe.com)
2. **Make sure you're in TEST MODE** (toggle in top right should say "Test mode" - if it says "Live mode", click it to switch)

### 2.2. Get Your API Keys
1. In the left sidebar, click **"Developers"** (you may need to scroll down)
2. Click **"API keys"**
3. You'll see two keys:
   - **Publishable key** (starts with `pk_test_...`) - Copy this, you'll need it later
   - **Secret key** (starts with `sk_test_...`) - Click "Reveal test key" and copy it

**Keep these keys safe!** You'll need them in Step 4.

---

## 🔗 Step 3: Create Stripe Webhook

### 3.1. Find Your Vercel Domain
1. Go to [https://vercel.com](https://vercel.com)
2. Log in and click on your **OnCallPrep** project
3. Look at the top of the page - you'll see your domain, something like:
   - `oncallprep.vercel.app` or
   - `oncallprep-xxxxx.vercel.app`
4. **Copy this domain** - you'll need it in the next step

### 3.2. Create the Webhook in Stripe
1. Go back to [Stripe Dashboard](https://dashboard.stripe.com)
2. Make sure you're still in **Test mode**
3. In the left sidebar, click **"Developers"**
4. Click **"Webhooks"**
5. Click the **"Add endpoint"** button (or "Add destination" in newer UI)
6. In the "Endpoint URL" field, enter:
   ```
   https://YOUR-VERCEL-DOMAIN.vercel.app/api/stripe-webhook
   ```
   Replace `YOUR-VERCEL-DOMAIN` with your actual domain from Step 3.1
   
   Example: `https://oncallprep.vercel.app/api/stripe-webhook`

7. Under "Select events to listen to", click **"Select events"**
8. Check these 4 events:
   - ✅ `checkout.session.completed`
   - ✅ `customer.subscription.updated`
   - ✅ `customer.subscription.deleted`
   - ✅ `invoice.payment_failed`

9. Click **"Add endpoint"** at the bottom

### 3.3. Get Your Webhook Secret
1. After creating the endpoint, click on it in the list
2. Find the **"Signing secret"** section
3. Click **"Reveal"** or **"Click to reveal"**
4. Copy the secret (it starts with `whsec_...`)
5. **Save this somewhere safe** - you'll need it in Step 4

---

## 🔐 Step 4: Set Up Vercel Environment Variables

### 4.1. Go to Vercel Project Settings
1. In your Vercel dashboard, click on your **OnCallPrep** project
2. Click **"Settings"** in the top menu
3. Click **"Environment Variables"** in the left sidebar

### 4.2. Add Each Variable
Click **"Add New"** for each of these variables:

#### Variable 1: STRIPE_SECRET_KEY
- **Name:** `STRIPE_SECRET_KEY`
- **Value:** Paste your Stripe Secret Key (the `sk_test_...` one from Step 2.2)
- **Environment:** Select all three: ☑️ Production ☑️ Preview ☑️ Development
- Click **"Save"**

#### Variable 2: STRIPE_WEBHOOK_SECRET
- **Name:** `STRIPE_WEBHOOK_SECRET`
- **Value:** Paste your Webhook Signing Secret (the `whsec_...` one from Step 3.3)
- **Environment:** Select all three: ☑️ Production ☑️ Preview ☑️ Development
- Click **"Save"**

#### Variable 3: SUPABASE_URL
- **Name:** `SUPABASE_URL`
- **Value:** Your Supabase URL (from your `config.js` file - it's `https://yzdnyvkijztevppdecub.supabase.co`)
- **Environment:** Select all three: ☑️ Production ☑️ Preview ☑️ Development
- Click **"Save"**

#### Variable 4: SUPABASE_SERVICE_KEY
- **Name:** `SUPABASE_SERVICE_KEY`
- **Value:** This is DIFFERENT from your anon key! To get it:
  1. Go to [Supabase Dashboard](https://supabase.com/dashboard)
  2. Click on your project
  3. Click **"Settings"** (gear icon) in left sidebar
  4. Click **"API"**
  5. Scroll down to **"Project API keys"**
  6. Find **"service_role"** key (NOT the "anon" key!)
  7. Click the eye icon to reveal it
  8. Copy it (it's very long)
- **Environment:** Select all three: ☑️ Production ☑️ Preview ☑️ Development
- Click **"Save"**

**Important:** Make sure you selected all three environments (Production, Preview, Development) for each variable!

---

## 🚀 Step 5: Deploy to Vercel

### 5.1. Commit and Push Your Changes
1. Open Terminal
2. Navigate to your project:
   ```bash
   cd "/Users/ty/oncallprep project"
   ```

3. Check what files changed:
   ```bash
   git status
   ```

4. Add all the new files:
   ```bash
   git add .
   ```

5. Commit the changes:
   ```bash
   git commit -m "Add Stripe payment integration"
   ```

6. Push to GitHub:
   ```bash
   git push
   ```

### 5.2. Vercel Will Auto-Deploy
- Vercel will automatically detect the push and start deploying
- Go to your Vercel dashboard to watch the deployment
- Wait for it to finish (usually 1-2 minutes)

### 5.3. Update Webhook URL (If Domain Changed)
If your Vercel domain changed after deployment:
1. Go back to Stripe Dashboard → Developers → Webhooks
2. Click on your webhook endpoint
3. Click **"Edit"** or the pencil icon
4. Update the URL to match your new domain
5. Save

---

## 🧪 Step 6: Test the Integration

### 6.1. Test with Stripe Test Card
1. Go to your live site: `https://YOUR-VERCEL-DOMAIN.vercel.app/pages/pricing.html`
2. Click any subscription button (e.g., "Start Free Trial")
3. You should be redirected to Stripe Checkout
4. Use this test card:
   - **Card number:** `4242 4242 4242 4242`
   - **Expiry:** Any future date (e.g., `12/25`)
   - **CVC:** Any 3 digits (e.g., `123`)
   - **Postal code:** Any (e.g., `12345`)
5. Click **"Pay"** or **"Subscribe"**

### 6.2. Verify It Worked
1. **Check Stripe Dashboard:**
   - Go to Stripe Dashboard → **"Customers"** - you should see a new customer
   - Go to **"Developers" → "Webhooks"** → Click your endpoint → **"Recent events"** - you should see `checkout.session.completed`

2. **Check Supabase:**
   - Go to Supabase Dashboard → **"Table Editor"** → `user_profiles`
   - Find the user (by email you used in checkout)
   - Check that `plan` = `pro` and `subscription_status` = `active`

3. **Check Your Site:**
   - Log in with the email you used
   - You should now have Pro access!

---

## ❌ Troubleshooting

### Problem: "Payment service not configured"
**Solution:** Check that `STRIPE_SECRET_KEY` is set in Vercel environment variables

### Problem: Webhook not receiving events
**Solution:** 
1. Check webhook URL is correct in Stripe
2. Check `STRIPE_WEBHOOK_SECRET` is set in Vercel
3. Check Vercel function logs: Vercel Dashboard → Your Project → Functions → `stripe-webhook`

### Problem: User not getting Pro access
**Solution:**
1. Check Stripe webhook events (Stripe Dashboard → Webhooks → Your endpoint → Recent events)
2. Check Vercel function logs for errors
3. Verify `SUPABASE_SERVICE_KEY` is correct (must be service_role key, not anon key)

### Problem: Checkout page not loading
**Solution:**
1. Check browser console for errors (F12 → Console tab)
2. Check Vercel function logs for `create-checkout-session`
3. Verify all environment variables are set

---

## ✅ You're Done!

Once testing works, you're all set! When you're ready to go live:
1. Switch Stripe to **Live mode**
2. Get your live API keys
3. Update Vercel environment variables with live keys
4. Create a new webhook for production
5. Redeploy

---

## 📞 Need Help?

If you get stuck at any step, let me know which step and what error message you're seeing!


