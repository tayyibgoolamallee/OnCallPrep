# OnCallPrep - MVP Deployment Plan

## 🎯 MVP Goals

Get OnCallPrep live and accepting payments as quickly as possible while maintaining quality.

**MVP Definition:**
- ✅ Website deployed and accessible
- ✅ User authentication working (Supabase)
- ✅ Pro subscription payments (Stripe)
- ✅ Pro features gated correctly
- ✅ Core content accessible (free tier)
- ✅ Mobile-responsive

---

## 📋 Pre-Deployment Checklist

### 1. Code & Files
- [x] All code committed to Git
- [x] Login/signup working
- [x] Pro features gating working
- [ ] Test all pages load correctly
- [ ] Test on mobile devices
- [ ] Check all links work

### 2. Supabase Setup
- [x] User authentication working
- [x] `user_profiles` table created
- [x] RLS policies configured
- [ ] Add production domain to Supabase allowed URLs
- [ ] Test pro access after deployment

### 3. Content
- [x] Core pages complete
- [x] Free content accessible
- [ ] Pro content clearly marked
- [ ] All images/assets optimized

---

## 🚀 Step 1: Deploy to Vercel (30 minutes)

### Why Vercel?
- Free tier for static sites
- Automatic deployments from Git
- Fast global CDN
- Easy environment variable management
- Perfect for Supabase + Stripe

### Steps:

1. **Push to GitHub** (if not already):
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/oncallprep.git
   git push -u origin main
   ```

2. **Sign up for Vercel:**
   - Go to [vercel.com](https://vercel.com)
   - Sign up with GitHub (easiest)

3. **Deploy:**
   - Click "Add New Project"
   - Import your GitHub repository
   - Framework Preset: **Other** (it's a static site)
   - Root Directory: `./` (or leave default)
   - Build Command: Leave empty (static site)
   - Output Directory: Leave empty
   - Click "Deploy"

4. **Your site is live!** 
   - URL: `your-project.vercel.app`
   - You can add a custom domain later

---

## 🔐 Step 2: Configure Environment Variables (10 minutes)

### In Vercel Dashboard:

1. Go to your project → **Settings** → **Environment Variables**

2. Add these variables:
   ```
   SUPABASE_URL = https://yzdnyvkijztevppdecub.supabase.co
   SUPABASE_ANON_KEY = sb_publishable_Fm0gAah8dnW6aAXXgglXGA_U8hl2yiX
   ```

3. **Redeploy** (Vercel will auto-redeploy when you add env vars)

### Update `scripts/config.js` to use environment variables:

```javascript
const SUPABASE_CONFIG = {
    url: window.SUPABASE_URL || 'https://yzdnyvkijztevppdecub.supabase.co',
    anonKey: window.SUPABASE_ANON_KEY || 'sb_publishable_Fm0gAah8dnW6aAXXgglXGA_U8hl2yiX'
};
```

**Note:** For static sites, we'll need to inject these at build time or use a different approach. See Step 2.5 below.

### Step 2.5: Alternative - Keep Config in Code (Simpler for MVP)

For MVP, it's fine to keep Supabase credentials in `scripts/config.js` since:
- The anon key is meant to be public (it's in your HTML/JS anyway)
- RLS policies protect your data
- You can move to env vars later

**Just make sure:**
- Add your Vercel domain to Supabase allowed URLs (Settings → API → Allowed URLs)

---

## 💳 Step 3: Stripe Integration (2-3 hours)

### Why Stripe?
- Best for subscriptions
- Easy integration
- Great documentation
- Handles webhooks automatically
- Free to start (2.9% + 30¢ per transaction)

### Setup:

#### 3.1 Create Stripe Account
1. Go to [stripe.com](https://stripe.com)
2. Sign up (use test mode first)
3. Get your **Publishable Key** and **Secret Key** from Dashboard → Developers → API keys

#### 3.2 Install Stripe.js

Add to `pricing.html` (before closing `</body>`):
```html
<script src="https://js.stripe.com/v3/"></script>
```

#### 3.3 Create Stripe Checkout Page

Create `checkout.html`:
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout | OnCallPrep</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <div class="container" style="max-width: 600px; margin: 4rem auto; padding: 2rem;">
        <h1>Upgrade to Pro</h1>
        <div id="checkout-form">
            <button id="checkout-button" class="btn btn-primary btn-lg">
                Subscribe to Pro - £9.99/month
            </button>
        </div>
    </div>

    <script src="https://js.stripe.com/v3/"></script>
    <script>
        const stripe = Stripe('YOUR_PUBLISHABLE_KEY'); // Replace with your key
        
        document.getElementById('checkout-button').addEventListener('click', async () => {
            // Create checkout session (you'll need a backend for this)
            // For MVP, we'll use Stripe Checkout hosted page
            const response = await fetch('/create-checkout-session', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ plan: 'pro', priceId: 'price_xxxxx' })
            });
            
            const session = await response.json();
            stripe.redirectToCheckout({ sessionId: session.id });
        });
    </script>
</body>
</html>
```

#### 3.4 Backend for Stripe (Simplest: Supabase Edge Functions)

**Option A: Supabase Edge Functions (Recommended for MVP)**

1. Create `supabase/functions/create-checkout-session/index.ts`:
```typescript
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import Stripe from "https://esm.sh/stripe@12.0.0?target=deno"

const stripe = new Stripe(Deno.env.get('STRIPE_SECRET_KEY') || '', {
  apiVersion: '2023-10-16',
})

serve(async (req) => {
  const { plan, userId } = await req.json()
  
  const session = await stripe.checkout.sessions.create({
    payment_method_types: ['card'],
    line_items: [{
      price: 'price_xxxxx', // Your Stripe Price ID
      quantity: 1,
    }],
    mode: 'subscription',
    success_url: `${Deno.env.get('SITE_URL')}/success?session_id={CHECKOUT_SESSION_ID}`,
    cancel_url: `${Deno.env.get('SITE_URL')}/pricing`,
    client_reference_id: userId,
  })
  
  return new Response(JSON.stringify({ id: session.id }), {
    headers: { 'Content-Type': 'application/json' },
  })
})
```

2. Deploy function:
```bash
supabase functions deploy create-checkout-session
```

**Option B: Vercel Serverless Function (Easier for MVP)**

Create `api/create-checkout-session.js`:
```javascript
const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { plan, userId } = req.body;

  const session = await stripe.checkout.sessions.create({
    payment_method_types: ['card'],
    line_items: [{
      price: process.env.STRIPE_PRICE_ID, // Your Pro plan price ID
      quantity: 1,
    }],
    mode: 'subscription',
    success_url: `${process.env.SITE_URL}/success?session_id={CHECKOUT_SESSION_ID}`,
    cancel_url: `${process.env.SITE_URL}/pricing`,
    client_reference_id: userId,
  });

  res.json({ id: session.id });
}
```

#### 3.5 Handle Stripe Webhooks

Create `api/stripe-webhook.js` (Vercel) or use Supabase webhook:
```javascript
const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);

export default async function handler(req, res) {
  const sig = req.headers['stripe-signature'];
  let event;

  try {
    event = stripe.webhooks.constructEvent(req.body, sig, process.env.STRIPE_WEBHOOK_SECRET);
  } catch (err) {
    return res.status(400).send(`Webhook Error: ${err.message}`);
  }

  // Handle the event
  if (event.type === 'checkout.session.completed') {
    const session = event.data.object;
    // Update user in Supabase to 'pro'
    // Use Supabase client to update user_profiles table
  }

  res.json({ received: true });
}
```

#### 3.6 Update User After Payment

After successful payment, update Supabase:
```javascript
// In success.html or via webhook
async function activateProAccess(sessionId) {
  const { data: { user } } = await supabase.auth.getUser();
  
  // Verify payment with Stripe
  const session = await stripe.checkout.sessions.retrieve(sessionId);
  
  if (session.payment_status === 'paid') {
    // Update user profile
    await supabase
      .from('user_profiles')
      .update({
        plan: 'pro',
        subscription_status: 'active',
        subscription_expires_at: new Date(Date.now() + 30 * 24 * 60 * 60 * 1000) // 30 days
      })
      .eq('id', user.id);
  }
}
```

---

## 🎯 Step 4: MVP Simplifications (Optional but Recommended)

### For Fastest MVP Launch:

1. **Skip Stripe initially** - Use manual pro access:
   - Users email you to request pro
   - You manually grant access via Supabase
   - Add Stripe later

2. **Or use Stripe Payment Links** (Easiest):
   - Create a payment link in Stripe Dashboard
   - No backend needed!
   - Link directly from pricing page
   - Manually activate pro after payment (or use Zapier/Make.com)

3. **Minimal content for launch:**
   - 6 free clinical topics (done ✅)
   - 5 free mock cases (done ✅)
   - Portfolio guides (done ✅)
   - Add more content post-launch

---

## 📝 Step 5: Post-Deployment Tasks

### Immediate (Day 1):
- [ ] Test login/signup on live site
- [ ] Test pro feature gating
- [ ] Test on mobile
- [ ] Check all pages load
- [ ] Set up custom domain (optional)

### Week 1:
- [ ] Add Google Analytics
- [ ] Set up error tracking (Sentry)
- [ ] Test payment flow end-to-end
- [ ] Get first paying customer! 🎉

### Week 2:
- [ ] Add more content based on feedback
- [ ] Optimize performance
- [ ] Add SEO meta tags
- [ ] Set up email notifications

---

## 🔧 Quick Stripe Setup (Simplest Method)

### Using Stripe Payment Links (No Backend Required):

1. **Create Product in Stripe:**
   - Dashboard → Products → Add Product
   - Name: "OnCallPrep Pro"
   - Price: £9.99/month (recurring)
   - Copy the Payment Link

2. **Add to Pricing Page:**
   ```html
   <a href="https://buy.stripe.com/YOUR_LINK" class="btn btn-primary">
       Subscribe to Pro
   </a>
   ```

3. **Manual Activation:**
   - Check Stripe Dashboard for new customers
   - Manually update their Supabase profile to 'pro'
   - Or use Zapier/Make.com to automate

4. **Later:** Add webhook automation when you have time

---

## 🚨 Common Issues & Fixes

### Issue: "CORS error" after deployment
**Fix:** Add your Vercel domain to Supabase allowed URLs:
- Supabase Dashboard → Settings → API → Allowed URLs
- Add: `https://your-project.vercel.app`

### Issue: "Pro features not working"
**Fix:** 
1. Check browser console
2. Verify user profile in Supabase
3. Clear browser cache
4. Check RLS policies

### Issue: "Stripe checkout not working"
**Fix:**
- Make sure you're using test mode keys for testing
- Check Stripe Dashboard for errors
- Verify webhook endpoint is accessible

---

## 📊 MVP Success Metrics

Track these from day 1:
- User signups
- Free → Pro conversions
- Most visited pages
- Common user paths
- Support requests

---

## 🎉 Launch Checklist

- [ ] Deployed to Vercel
- [ ] Environment variables set
- [ ] Supabase domain whitelisted
- [ ] Stripe account created
- [ ] Payment link added to pricing page
- [ ] Test login/signup
- [ ] Test pro access
- [ ] Mobile tested
- [ ] Analytics installed
- [ ] Ready to share! 🚀

---

## 💡 Next Steps After MVP

1. **Automate Stripe webhooks** (when you have time)
2. **Add more content** (questions, topics)
3. **Improve UX** based on feedback
4. **Add features** (progress tracking, analytics)
5. **Marketing** (SEO, social media, partnerships)

---

## 🆘 Need Help?

1. Check browser console (F12)
2. Check Vercel deployment logs
3. Check Supabase logs
4. Check Stripe Dashboard
5. Test locally first, then deploy

**You've got this!** 🚀


