-- ============================================
-- Fix/Update user_profiles Table
-- Run this in Supabase SQL Editor if columns are missing
-- ============================================

-- First, check if table exists and what columns it has
-- (This won't change anything, just shows you the structure)
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'user_profiles'
ORDER BY ordinal_position;

-- If the table doesn't exist, create it:
CREATE TABLE IF NOT EXISTS user_profiles (
    id UUID REFERENCES auth.users(id) PRIMARY KEY,
    email TEXT,
    full_name TEXT,
    plan TEXT DEFAULT 'free' CHECK (plan IN ('free', 'pro', 'trainer')),
    subscription_status TEXT DEFAULT 'inactive' CHECK (subscription_status IN ('active', 'inactive', 'cancelled', 'expired')),
    subscription_expires_at TIMESTAMPTZ,
    role TEXT DEFAULT 'user' CHECK (role IN ('user', 'admin')),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- If table exists but columns are missing, add them:
-- (These are safe - they won't delete existing data)

-- Add plan column if it doesn't exist
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'user_profiles' AND column_name = 'plan'
    ) THEN
        ALTER TABLE user_profiles ADD COLUMN plan TEXT DEFAULT 'free';
        ALTER TABLE user_profiles ADD CONSTRAINT check_plan CHECK (plan IN ('free', 'pro', 'trainer'));
    END IF;
END $$;

-- Add subscription_status column if it doesn't exist
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'user_profiles' AND column_name = 'subscription_status'
    ) THEN
        ALTER TABLE user_profiles ADD COLUMN subscription_status TEXT DEFAULT 'inactive';
        ALTER TABLE user_profiles ADD CONSTRAINT check_subscription_status 
            CHECK (subscription_status IN ('active', 'inactive', 'cancelled', 'expired'));
    END IF;
END $$;

-- Add subscription_expires_at column if it doesn't exist
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'user_profiles' AND column_name = 'subscription_expires_at'
    ) THEN
        ALTER TABLE user_profiles ADD COLUMN subscription_expires_at TIMESTAMPTZ;
    END IF;
END $$;

-- Add role column if it doesn't exist
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'user_profiles' AND column_name = 'role'
    ) THEN
        ALTER TABLE user_profiles ADD COLUMN role TEXT DEFAULT 'user';
        ALTER TABLE user_profiles ADD CONSTRAINT check_role CHECK (role IN ('user', 'admin'));
    END IF;
END $$;

-- Verify the table structure after running
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_name = 'user_profiles'
ORDER BY ordinal_position;

