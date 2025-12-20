-- ============================================
-- COMPLETE USER_PROFILES TABLE SETUP
-- Run this entire script in Supabase SQL Editor
-- This will recreate the table with all columns and settings
-- ============================================

-- Step 1: Drop existing table if it exists (WARNING: This deletes all user profile data!)
-- If you want to keep existing data, comment out this line and the table will be updated instead
-- DROP TABLE IF EXISTS user_profiles CASCADE;

-- Step 2: Create the user_profiles table with all columns
CREATE TABLE IF NOT EXISTS user_profiles (
    id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
    email TEXT,
    full_name TEXT,
    plan TEXT DEFAULT 'free' CHECK (plan IN ('free', 'pro', 'trainer')),
    subscription_status TEXT DEFAULT 'inactive' CHECK (subscription_status IN ('active', 'inactive', 'cancelled', 'expired')),
    subscription_expires_at TIMESTAMPTZ,
    role TEXT DEFAULT 'user' CHECK (role IN ('user', 'admin')),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Step 3: Add any missing columns (safe - won't delete data)
DO $$ 
BEGIN
    -- Add plan column if missing
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'user_profiles' AND column_name = 'plan'
    ) THEN
        ALTER TABLE user_profiles ADD COLUMN plan TEXT DEFAULT 'free';
        ALTER TABLE user_profiles ADD CONSTRAINT check_plan CHECK (plan IN ('free', 'pro', 'trainer'));
    END IF;
    
    -- Add subscription_status column if missing
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'user_profiles' AND column_name = 'subscription_status'
    ) THEN
        ALTER TABLE user_profiles ADD COLUMN subscription_status TEXT DEFAULT 'inactive';
        ALTER TABLE user_profiles ADD CONSTRAINT check_subscription_status 
            CHECK (subscription_status IN ('active', 'inactive', 'cancelled', 'expired'));
    END IF;
    
    -- Add subscription_expires_at column if missing
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'user_profiles' AND column_name = 'subscription_expires_at'
    ) THEN
        ALTER TABLE user_profiles ADD COLUMN subscription_expires_at TIMESTAMPTZ;
    END IF;
    
    -- Add role column if missing
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'user_profiles' AND column_name = 'role'
    ) THEN
        ALTER TABLE user_profiles ADD COLUMN role TEXT DEFAULT 'user';
        ALTER TABLE user_profiles ADD CONSTRAINT check_role CHECK (role IN ('user', 'admin'));
    END IF;
    
    -- Add created_at if missing
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'user_profiles' AND column_name = 'created_at'
    ) THEN
        ALTER TABLE user_profiles ADD COLUMN created_at TIMESTAMPTZ DEFAULT NOW();
    END IF;
    
    -- Add updated_at if missing
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'user_profiles' AND column_name = 'updated_at'
    ) THEN
        ALTER TABLE user_profiles ADD COLUMN updated_at TIMESTAMPTZ DEFAULT NOW();
    END IF;
END $$;

-- Step 4: Enable Row Level Security
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;

-- Step 5: Drop existing policies if they exist (to avoid conflicts)
DROP POLICY IF EXISTS "Users can view own profile" ON user_profiles;
DROP POLICY IF EXISTS "Users can update own profile" ON user_profiles;
DROP POLICY IF EXISTS "Users can insert own profile" ON user_profiles;
DROP POLICY IF EXISTS "Admins can view all profiles" ON user_profiles;
DROP POLICY IF EXISTS "Admins can update all profiles" ON user_profiles;

-- Step 6: Create Row Level Security Policies

-- Policy: Users can view their own profile
CREATE POLICY "Users can view own profile"
    ON user_profiles
    FOR SELECT
    USING (auth.uid() = id);

-- Policy: Users can update their own profile
CREATE POLICY "Users can update own profile"
    ON user_profiles
    FOR UPDATE
    USING (auth.uid() = id);

-- Policy: Users can insert their own profile
CREATE POLICY "Users can insert own profile"
    ON user_profiles
    FOR INSERT
    WITH CHECK (auth.uid() = id);

-- Policy: Admins can view all profiles
CREATE POLICY "Admins can view all profiles"
    ON user_profiles
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM user_profiles
            WHERE id = auth.uid() AND role = 'admin'
        )
    );

-- Policy: Admins can update all profiles
CREATE POLICY "Admins can update all profiles"
    ON user_profiles
    FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM user_profiles
            WHERE id = auth.uid() AND role = 'admin'
        )
    );

-- Step 7: Create function to automatically create profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.user_profiles (id, email, full_name, plan, role)
    VALUES (
        NEW.id,
        NEW.email,
        COALESCE(NEW.raw_user_meta_data->>'full_name', ''),
        'free',
        'user'
    )
    ON CONFLICT (id) DO NOTHING;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Step 8: Create trigger to run function on new user signup
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION public.handle_new_user();

-- Step 9: Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Step 10: Create trigger to auto-update updated_at
DROP TRIGGER IF EXISTS update_user_profiles_updated_at ON user_profiles;
CREATE TRIGGER update_user_profiles_updated_at
    BEFORE UPDATE ON user_profiles
    FOR EACH ROW
    EXECUTE FUNCTION public.update_updated_at_column();

-- Step 11: Verify table structure
SELECT 
    column_name, 
    data_type, 
    is_nullable, 
    column_default
FROM information_schema.columns
WHERE table_name = 'user_profiles'
ORDER BY ordinal_position;

-- Step 12: Show current policies
SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual
FROM pg_policies
WHERE tablename = 'user_profiles';

-- ============================================
-- OPTIONAL: Grant yourself admin access
-- Uncomment and replace email with your email
-- ============================================

-- UPDATE user_profiles
-- SET role = 'admin'
-- WHERE email = 'your-email@example.com';  -- ⚠️ CHANGE THIS TO YOUR EMAIL

-- ============================================
-- OPTIONAL: Grant yourself pro access
-- Uncomment and replace email with your email
-- ============================================

-- UPDATE user_profiles
-- SET 
--     plan = 'pro',
--     subscription_status = 'active',
--     subscription_expires_at = NOW() + INTERVAL '1 year'
-- WHERE email = 'your-email@example.com';  -- ⚠️ CHANGE THIS TO YOUR EMAIL

-- ============================================
-- DONE! Your table is now set up with:
-- - All required columns (plan, subscription_status, subscription_expires_at, role)
-- - Row Level Security enabled
-- - Policies for users and admins
-- - Auto-create profile on signup
-- - Auto-update timestamp
-- ============================================

