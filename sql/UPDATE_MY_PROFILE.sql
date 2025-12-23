-- ============================================
-- Update YOUR Profile to Pro (Safe - No Data Deletion)
-- Replace 'your-email@example.com' with your actual email
-- ============================================

-- Option 1: Update by email (safest)
UPDATE user_profiles
SET 
    plan = 'pro',
    subscription_status = 'active',
    subscription_expires_at = NOW() + INTERVAL '1 year',
    updated_at = NOW()
WHERE email = 'your-email@example.com';  -- ⚠️ CHANGE THIS TO YOUR EMAIL

-- Option 2: Update by user ID (if you know your user ID)
-- First, find your user ID:
-- SELECT id, email FROM auth.users WHERE email = 'your-email@example.com';
-- Then use that ID:
-- UPDATE user_profiles
-- SET 
--     plan = 'pro',
--     subscription_status = 'active',
--     subscription_expires_at = NOW() + INTERVAL '1 year',
--     updated_at = NOW()
-- WHERE id = 'your-user-id-here';

-- Verify the update worked
SELECT id, email, plan, subscription_status, subscription_expires_at
FROM user_profiles
WHERE email = 'your-email@example.com';  -- ⚠️ CHANGE THIS TO YOUR EMAIL

