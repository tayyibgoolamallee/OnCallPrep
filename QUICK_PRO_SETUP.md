# Quick Pro Feature Setup Guide

## ✅ Yes, it's through Supabase!

Here's the simplest way to get pro features working:

## Step 1: Set Up Database (One Time)

1. Go to your Supabase dashboard: https://supabase.com/dashboard
2. Select your project
3. Go to **SQL Editor** (left sidebar)
4. Copy and paste the SQL from `SUPABASE_SETUP_GUIDE.md` (the big SQL block)
5. Click **Run**

This creates the `user_profiles` table that stores subscription info.

## Step 2: Grant Yourself Pro Access

### ✅ EASIEST METHOD: One-Click Button

1. **Log in** to your site
2. Go to: **`grant-pro.html`** (or visit `/grant-pro.html` in your browser)
3. Click the **"Grant Myself Pro Access"** button
4. Done! The page will refresh and you'll have pro access

This button will:
- Create your profile if it doesn't exist
- Set you to pro plan
- Set subscription to active
- Set expiration to 1 year from now

### Alternative: Via Admin Panel

1. Log in to your site
2. Go to **`admin.html`**
3. Click the **"Grant Myself Pro Access"** button at the top
4. Done!

### If You Have Supabase Dashboard Access

**Option A: Via Table Editor**
1. In Supabase, go to **Table Editor**
2. Find the `user_profiles` table
3. Find your user (by email)
4. Click to edit
5. Change:
   - `plan` → `pro`
   - `subscription_status` → `active`
   - `subscription_expires_at` → Set to a future date (e.g., 1 year from now)
6. Save

**Option B: Via SQL**
1. Go to **SQL Editor** in Supabase
2. Run this (replace with your email):

```sql
UPDATE user_profiles
SET 
    plan = 'pro',
    subscription_status = 'active',
    subscription_expires_at = NOW() + INTERVAL '1 year'
WHERE email = 'your-email@example.com';
```

## Step 3: Refresh and Test

1. Log out and log back in
2. Pro features should now be unlocked!

## What Gets Unlocked?

- Full AKT question bank (275+ questions)
- All clinical topics (50+)
- Additional SCA mock cases
- Progress tracking
- IMG tips section
- EBP & PCOM questions

## Troubleshooting

**Still showing as free?**
- Clear browser cache (Cmd+Shift+R on Mac)
- Check Supabase table - make sure `plan = 'pro'`
- Log out and log back in

**Can't see user_profiles table?**
- Make sure you ran the SQL setup from Step 1
- Check you're in the right Supabase project

**Need help?**
- Check `SUPABASE_SETUP_GUIDE.md` for detailed instructions
- The SQL is already written for you - just copy and paste!

