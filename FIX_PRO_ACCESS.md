# Fix Pro Access - Quick Guide

## 🔍 The Problem

You can log in, but pro features aren't unlocking because your user profile in Supabase doesn't have `plan = 'pro'` set.

## ✅ Solution: Update Your Profile in Supabase

### Step 1: Open Supabase SQL Editor

1. Go to [app.supabase.com](https://app.supabase.com)
2. Select your project
3. Click **"SQL Editor"** in the left sidebar
4. Click **"New query"**

### Step 2: Find Your User Email

Run this query to see all users:

```sql
SELECT id, email, plan, subscription_status, subscription_expires_at
FROM user_profiles
ORDER BY created_at DESC;
```

**Note your email address** from the results.

### Step 3: Grant Yourself Pro Access

Replace `YOUR_EMAIL_HERE` with your actual email and run:

```sql
UPDATE user_profiles 
SET 
    plan = 'pro',
    subscription_status = 'active',
    subscription_expires_at = NOW() + INTERVAL '1 year'
WHERE email = 'YOUR_EMAIL_HERE';
```

### Step 4: Verify It Worked

Run this to check:

```sql
SELECT email, plan, subscription_status, subscription_expires_at
FROM user_profiles
WHERE email = 'YOUR_EMAIL_HERE';
```

You should see:
- `plan`: `pro`
- `subscription_status`: `active`
- `subscription_expires_at`: A date 1 year from now

### Step 5: Test on Your Site

1. **Log out** of your website
2. **Log back in**
3. **Refresh the page**
4. **Try accessing:**
   - Full AKT question bank (275 questions)
   - All clinical topics
   - All mock cases/priming exercises

They should now be unlocked! 🎉

---

## 🐛 If It Still Doesn't Work

### Check Browser Console

1. Open your website
2. Press **F12** (or right-click → Inspect)
3. Go to **Console** tab
4. Type this and press Enter:

```javascript
getUserSubscription().then(result => console.log(result));
```

**What you should see:**
```javascript
{
  isPro: true,
  plan: "pro",
  subscriptionStatus: "active",
  expiresAt: "2026-01-XX..."
}
```

**If you see `isPro: false`, then:**
- Make sure you logged out and back in
- Check that the SQL update actually worked
- Check browser console for errors

### Common Issues

**Issue:** "Cannot read property 'plan' of undefined"
- **Fix:** Your profile might not exist. Run this first:
```sql
-- This will create a profile if it doesn't exist
INSERT INTO user_profiles (id, email, plan, subscription_status, subscription_expires_at)
SELECT 
    id,
    email,
    'pro',
    'active',
    NOW() + INTERVAL '1 year'
FROM auth.users
WHERE email = 'YOUR_EMAIL_HERE'
ON CONFLICT (id) DO UPDATE
SET 
    plan = 'pro',
    subscription_status = 'active',
    subscription_expires_at = NOW() + INTERVAL '1 year';
```

**Issue:** Still showing as free after update
- **Fix:** Clear browser cache and localStorage:
  1. Open browser console (F12)
  2. Go to **Application** tab (Chrome) or **Storage** tab (Firefox)
  3. Find **Local Storage** → your site URL
  4. Delete `oncallprep_plan` if it exists
  5. Refresh the page

---

## 📝 Quick Reference

**What the code checks:**
- `plan === 'pro'` ✅
- AND (`subscription_status === 'active'` OR no expiration OR expiration in future) ✅

**Required fields:**
- `plan`: Must be `'pro'`
- `subscription_status`: Must be `'active'`
- `subscription_expires_at`: Optional, but set it to avoid issues

---

## 🎯 Next Steps After Fixing

Once pro access works:
1. ✅ Test all pro features
2. ✅ Link your custom domain (see `LINK_CUSTOM_DOMAIN.md`)
3. ✅ Set up Stripe for real payments (see `STRIPE_QUICK_SETUP.md`)

