# Supabase Setup Guide for OnCallPrep

This guide will walk you through setting up Supabase for authentication and subscription management.

## Step 1: Create a Supabase Project

1. Go to [https://supabase.com](https://supabase.com)
2. Sign up or log in
3. Click "New Project"
4. Fill in:
   - **Project Name**: `oncallprep` (or your preferred name)
   - **Database Password**: Choose a strong password (save this!)
   - **Region**: Choose closest to your users
   - **Pricing Plan**: Free tier is fine to start

5. Wait for the project to be created (takes 1-2 minutes)

## Step 2: Get Your API Keys

1. In your Supabase dashboard, go to **Settings** → **API**
2. You'll see:
   - **Project URL**: Copy this (e.g., `https://xxxxx.supabase.co`)
   - **anon/public key**: Copy this (starts with `eyJ...`)

3. Update `scripts/supabase-config.js`:
   ```javascript
   const SUPABASE_URL = 'https://yzdnyvkijztevppdecub.supabase.co';
   const SUPABASE_ANON_KEY = 'sb_publishable_Fm0gAah8dnW6aAXXgglXGA_U8hl2yiX';
   ```

## Step 3: Set Up Authentication

1. In Supabase dashboard, go to **Authentication** → **Providers**
2. **Email** provider should be enabled by default
3. Configure email settings:
   - Go to **Authentication** → **Email Templates**
   - Customize the confirmation email if desired
   - Set **Site URL** in **Authentication** → **URL Configuration**:
     - Site URL: `http://localhost:8000` (for local development)
     - Redirect URLs: Add `http://localhost:8000/**` and your production URL

## Step 4: Create Database Tables

Go to **SQL Editor** in Supabase dashboard and run this SQL:

```sql
-- Create profiles table to store user subscription info
CREATE TABLE IF NOT EXISTS profiles (
    id UUID REFERENCES auth.users(id) PRIMARY KEY,
    email TEXT,
    full_name TEXT,
    subscription_tier TEXT DEFAULT 'free' CHECK (subscription_tier IN ('free', 'pro', 'premium')),
    subscription_status TEXT DEFAULT 'inactive' CHECK (subscription_status IN ('active', 'inactive', 'cancelled', 'past_due')),
    subscription_expires_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security (RLS)
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- Create policy: Users can read their own profile
CREATE POLICY "Users can view own profile" ON profiles
    FOR SELECT USING (auth.uid() = id);

-- Create policy: Users can update their own profile
CREATE POLICY "Users can update own profile" ON profiles
    FOR UPDATE USING (auth.uid() = id);

-- Create function to automatically create profile on user signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.profiles (id, email, full_name)
    VALUES (
        NEW.id,
        NEW.email,
        COALESCE(NEW.raw_user_meta_data->>'full_name', '')
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create trigger to call function on new user
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Create subscription_history table (optional, for tracking subscription changes)
CREATE TABLE IF NOT EXISTS subscription_history (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    subscription_tier TEXT,
    subscription_status TEXT,
    changed_at TIMESTAMPTZ DEFAULT NOW(),
    changed_by TEXT DEFAULT 'system'
);

-- Enable RLS on subscription_history
ALTER TABLE subscription_history ENABLE ROW LEVEL SECURITY;

-- Policy: Users can view their own subscription history
CREATE POLICY "Users can view own subscription history" ON subscription_history
    FOR SELECT USING (auth.uid() = user_id);
```

## Step 5: Test Authentication

1. Start your local server:
   ```bash
   python3 -m http.server 8000
   ```

2. Navigate to `http://localhost:8000/signup.html`
3. Create a test account
4. Check your email for confirmation (or check Supabase dashboard → Authentication → Users)
5. Log in at `http://localhost:8000/login.html`

## Step 6: Set Up Subscription Management (For Pro/Premium Features)

### Option A: Manual Subscription Management (For Testing)

You can manually update subscriptions in Supabase:

```sql
-- Grant Pro access to a user
UPDATE profiles
SET 
    subscription_tier = 'pro',
    subscription_status = 'active',
    subscription_expires_at = NOW() + INTERVAL '1 month'
WHERE email = 'user@example.com';
```

### Option B: Integrate with Stripe (Recommended for Production)

1. Set up Stripe account
2. Create webhook endpoint to update Supabase when payments occur
3. Use Stripe's subscription API to manage billing

## Step 7: Configure Email (Optional but Recommended)

1. In Supabase dashboard, go to **Settings** → **Auth** → **SMTP Settings**
2. Configure SMTP for custom email sending (or use Supabase's default)
3. For production, set up a proper email service

## Troubleshooting

### "Supabase client not initialized" error
- Make sure you've updated `SUPABASE_URL` and `SUPABASE_ANON_KEY` in `scripts/supabase-config.js`
- Make sure the Supabase CDN script is loaded before `supabase-config.js`

### Login doesn't redirect
- Check browser console for errors
- Verify your Site URL in Supabase dashboard matches your local URL
- Make sure email confirmation is not required (or confirm your email first)

### "User already registered" error
- User exists but may not be confirmed
- Check Supabase dashboard → Authentication → Users
- Resend confirmation email or manually confirm user

### Subscription check not working
- Verify the `profiles` table exists and has data
- Check RLS policies are set correctly
- Verify user is logged in (check `auth.users` table)

## Next Steps

1. ✅ Authentication is working
2. ✅ User profiles are created automatically
3. ⏭️ Set up payment integration (Stripe)
4. ⏭️ Add subscription management UI
5. ⏭️ Implement feature gating on protected pages

## Security Notes

- Never commit your Supabase keys to version control
- Use environment variables in production
- The `anon` key is safe to use in client-side code (RLS protects your data)
- Always use Row Level Security (RLS) on your tables

