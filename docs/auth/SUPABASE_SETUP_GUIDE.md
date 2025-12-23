# Supabase Setup Guide for Pro Features

## Quick Setup Steps

### 1. Create Database Tables

Go to your Supabase dashboard → SQL Editor and run this SQL:

```sql
-- Create user_profiles table
CREATE TABLE IF NOT EXISTS user_profiles (
    id UUID REFERENCES auth.users(id) PRIMARY KEY,
    email TEXT,
    full_name TEXT,
    plan TEXT DEFAULT 'free' CHECK (plan IN ('free', 'pro')),
    subscription_status TEXT DEFAULT 'inactive' CHECK (subscription_status IN ('active', 'inactive', 'cancelled', 'expired')),
    subscription_expires_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;

-- Create policy: Users can read their own profile
CREATE POLICY "Users can view own profile"
    ON user_profiles
    FOR SELECT
    USING (auth.uid() = id);

-- Create policy: Users can update their own profile
CREATE POLICY "Users can update own profile"
    ON user_profiles
    FOR UPDATE
    USING (auth.uid() = id);

-- Create policy: Users can insert their own profile
CREATE POLICY "Users can insert own profile"
    ON user_profiles
    FOR INSERT
    WITH CHECK (auth.uid() = id);

-- Create function to automatically create profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.user_profiles (id, email, full_name)
    VALUES (
        NEW.id,
        NEW.email,
        COALESCE(NEW.raw_user_meta_data->>'full_name', '')
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create trigger to run function on new user signup
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION public.handle_new_user();
```

### 2. Grant Yourself Pro Access (For Testing)

After you've logged in, run this SQL in Supabase SQL Editor:

```sql
-- Replace 'your-email@example.com' with your actual email
UPDATE user_profiles
SET 
    plan = 'pro',
    subscription_status = 'active',
    subscription_expires_at = NOW() + INTERVAL '1 year'
WHERE email = 'your-email@example.com';
```

Or to grant pro access to all users (for testing):

```sql
UPDATE user_profiles
SET 
    plan = 'pro',
    subscription_status = 'active',
    subscription_expires_at = NOW() + INTERVAL '1 year';
```

### 3. Verify It Works

1. Log out and log back in to your account
2. Open browser console (F12)
3. Type: `checkProAccess()` and press Enter
4. It should return `true` if you have pro access

## Alternative: Manual Pro Access via Admin Panel

If you have an admin panel set up, you can also grant pro access through the UI.

## Troubleshooting

### "Table user_profiles does not exist"
- Make sure you ran the SQL above in Supabase SQL Editor
- Check that the table was created in the Table Editor

### "Permission denied"
- Make sure Row Level Security policies are set up correctly
- Check that you're logged in with the correct account

### Still showing as free user
- Clear browser cache and localStorage
- Log out and log back in
- Check the `user_profiles` table in Supabase to verify your plan is set to 'pro'

## Production Setup

For production, you'll want to:
1. Set up a payment processor (Stripe, PayPal, etc.)
2. Create webhooks to update subscription status when payments are made
3. Add subscription management UI
4. Set up email notifications for subscription changes

For now, the manual SQL update above will let you test pro features!

