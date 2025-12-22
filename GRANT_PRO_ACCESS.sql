-- ============================================
-- GRANT PRO ACCESS - Quick Setup Script
-- ============================================
-- Replace 'your-email@example.com' with your actual email address

-- Step 1: Fix the plan column default (if it's malformed)
ALTER TABLE user_profiles 
    ALTER COLUMN plan DROP DEFAULT;

ALTER TABLE user_profiles 
    ALTER COLUMN plan SET DEFAULT 'free';

-- Add constraint if it doesn't exist
DO $$ 
BEGIN
    ALTER TABLE user_profiles DROP CONSTRAINT IF EXISTS check_plan;
    ALTER TABLE user_profiles ADD CONSTRAINT check_plan 
        CHECK (plan IN ('free', 'pro', 'trainer'));
END $$;

-- Step 2: Grant yourself pro access
-- REPLACE 'your-email@example.com' with your actual email
UPDATE user_profiles 
SET 
    plan = 'pro',
    subscription_status = 'active',
    subscription_expires_at = NOW() + INTERVAL '1 year'
WHERE email = 'your-email@example.com';

-- Step 3: Verify your pro access
SELECT 
    email,
    plan,
    subscription_status,
    subscription_expires_at,
    role,
    full_name
FROM user_profiles
WHERE email = 'your-email@example.com';

-- ============================================
-- ALTERNATIVE: Grant pro access by user ID
-- ============================================
-- If you know your user ID (from auth.users), you can use this instead:
-- UPDATE user_profiles 
-- SET 
--     plan = 'pro',
--     subscription_status = 'active',
--     subscription_expires_at = NOW() + INTERVAL '1 year'
-- WHERE id = 'your-user-id-here';


