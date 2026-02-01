-- Migration 050: Add pro_until for time-limited Pro access (e.g. beta trials)
-- Also documents how to grant Pro or Admin to a user by email.

-- Add column for time-limited Pro (e.g. 1-month beta). User is treated as Pro
-- if subscription_tier = 'pro' OR (pro_until IS NOT NULL AND pro_until > NOW()).
ALTER TABLE user_profiles
  ADD COLUMN IF NOT EXISTS pro_until TIMESTAMPTZ DEFAULT NULL;

COMMENT ON COLUMN user_profiles.pro_until IS 'If set, user has Pro access until this time (for trials/beta). App treats as Pro when subscription_tier = ''pro'' OR (pro_until > NOW()).';

-- =============================================================================
-- HOW TO GRANT ACCESS (run in Supabase SQL Editor)
-- =============================================================================
-- Replace 'friend@example.com' with the actual email.

-- 1) Give a user full Pro access (e.g. your friend for content review):
--    UPDATE user_profiles SET subscription_tier = 'pro' WHERE email = 'friend@example.com';

-- 2) Make a user an Admin (can access /admin – SCA, AKT, Portfolio management):
--    UPDATE user_profiles SET is_admin = true WHERE email = 'friend@example.com';

-- 3) Give a user Pro + Admin (reviewer):
--    UPDATE user_profiles SET subscription_tier = 'pro', is_admin = true WHERE email = 'friend@example.com';

-- 4) Give 1-month free Pro access for beta testers (no payment; auto-expires):
--    UPDATE user_profiles SET pro_until = NOW() + INTERVAL '1 month' WHERE email = 'beta@example.com';
--    (Leave subscription_tier as 'free'; app grants Pro until pro_until passes.)

-- 5) Revoke trial early (optional):
--    UPDATE user_profiles SET pro_until = NULL WHERE email = 'beta@example.com';

-- List current Pro/Admin/trial users:
-- SELECT email, subscription_tier, is_admin, pro_until FROM user_profiles ORDER BY email;
