# Authentication & Subscription Setup - Quick Start

## ✅ What I've Implemented

I've created a complete authentication system for your OnCallPrep project:

### Files Created/Updated:

1. **`scripts/supabase-config.js`** - Supabase client configuration
2. **`scripts/auth.js`** - Authentication utilities (login, signup, logout, session management)
3. **`scripts/subscription.js`** - Subscription checking and feature gating
4. **`login.html`** - Complete login page with form validation
5. **`signup.html`** - Complete signup page with form validation
6. **`scripts/main.js`** - Updated with navigation support
7. **`index.html`** - Updated to load Supabase scripts

### Features Implemented:

✅ User registration with email/password  
✅ User login with email/password  
✅ Session management (automatic session checking)  
✅ Navigation updates based on auth state  
✅ Subscription tier checking (free/pro/premium)  
✅ Feature access gating utilities  
✅ Automatic profile creation on signup  
✅ Error handling and user-friendly messages  

## 🚀 What You Need to Do in Supabase

### Step 1: Create Supabase Project (5 minutes)

1. Go to [https://supabase.com](https://supabase.com) and create a free account
2. Click "New Project"
3. Fill in project details and wait for it to be created

### Step 2: Get Your API Keys (2 minutes)

1. In Supabase dashboard → **Settings** → **API**
2. Copy your **Project URL** (looks like `https://xxxxx.supabase.co`)
3. Copy your **anon/public key** (long string starting with `eyJ...`)

### Step 3: Update Configuration (1 minute)

Open `scripts/supabase-config.js` and replace:

```javascript
const SUPABASE_URL = 'https://yzdnyvkijztevppdecub.supabase.co'; // Replace with your Project URL
const SUPABASE_ANON_KEY = 'sb_publishable_Fm0gAah8dnW6aAXXgglXGA_U8hl2yiX'; // Replace with your anon key
```

### Step 4: Set Up Database Tables (5 minutes)

1. In Supabase dashboard, go to **SQL Editor**
2. Copy and paste the SQL from `SUPABASE_SETUP.md` (Step 4)
3. Click "Run" to create the tables

This creates:
- `profiles` table for user subscription info
- Automatic profile creation when users sign up
- Row Level Security policies

### Step 5: Configure Authentication (2 minutes)

1. Go to **Authentication** → **URL Configuration**
2. Set **Site URL** to: `http://localhost:8000` (for local testing)
3. Add **Redirect URLs**: `http://localhost:8000/**`

### Step 6: Test It! (2 minutes)

1. Start your local server:
   ```bash
   python3 -m http.server 8000
   ```

2. Go to `http://localhost:8000/signup.html`
3. Create a test account
4. Check Supabase dashboard → **Authentication** → **Users** to see your user
5. Log in at `http://localhost:8000/login.html`

## 🔒 How Pro/Premium Features Work

### Current Setup:

- All users start with `subscription_tier = 'free'`
- Pro features are gated using the `hasFeatureAccess()` function
- Navigation automatically shows user's subscription status

### To Grant Pro Access (For Testing):

Run this SQL in Supabase SQL Editor:

```sql
UPDATE profiles
SET 
    subscription_tier = 'pro',
    subscription_status = 'active',
    subscription_expires_at = NOW() + INTERVAL '1 month'
WHERE email = 'your-test-email@example.com';
```

### To Use Feature Gating in Your Pages:

Add this to any page that needs pro features:

```html
<script src="scripts/subscription.js"></script>
<script>
// Check access before showing feature
async function loadProFeature() {
    const hasAccess = await checkProAccess();
    if (!hasAccess) {
        // Show upgrade message or redirect
        alert('This feature requires Pro. Upgrade at pricing.html');
        return;
    }
    // Load the pro feature
}
</script>
```

Or use the `gateFeature()` function:

```javascript
const canAccess = await gateFeature('sca_practice', 
    'SCA Practice requires Pro. Upgrade now?');
if (canAccess) {
    // Show the feature
}
```

## 🐛 Troubleshooting Login Issues

### Issue: "Nothing happens when I login"

**Possible causes:**

1. **Supabase not configured**
   - Check that you've updated `SUPABASE_URL` and `SUPABASE_ANON_KEY` in `scripts/supabase-config.js`
   - Open browser console (F12) and look for errors

2. **Email confirmation required**
   - Check Supabase dashboard → **Authentication** → **Users**
   - If user shows "Unconfirmed", either:
     - Disable email confirmation in **Authentication** → **Providers** → **Email** → Uncheck "Confirm email"
     - Or confirm the email manually in the dashboard

3. **Redirect URL mismatch**
   - Check **Authentication** → **URL Configuration**
   - Make sure your Site URL matches where you're testing

4. **Database tables not created**
   - Run the SQL from `SUPABASE_SETUP.md` Step 4
   - Check that `profiles` table exists in **Table Editor**

### Quick Debug Steps:

1. Open browser console (F12)
2. Try logging in
3. Look for error messages
4. Check Network tab for failed requests
5. Verify Supabase dashboard shows the login attempt

## 📋 Checklist

Before testing, make sure:

- [ ] Supabase project created
- [ ] API keys copied to `scripts/supabase-config.js`
- [ ] Database tables created (SQL from SUPABASE_SETUP.md)
- [ ] Site URL configured in Supabase dashboard
- [ ] Email confirmation disabled (for testing) or email confirmed
- [ ] Local server running on port 8000

## 🎯 Next Steps After Authentication Works

1. **Test login/signup flow** - Make sure users can register and log in
2. **Test subscription checking** - Manually set a user to "pro" and verify navigation updates
3. **Add feature gating** - Protect pro features on your pages
4. **Set up payment integration** - Connect Stripe to automatically update subscriptions
5. **Add password reset** - Implement forgot password functionality

## 📚 More Information

See `SUPABASE_SETUP.md` for detailed setup instructions and advanced configuration.

---

**Need Help?** Check the browser console for errors and verify all steps above are completed.

