-- Run this to restore profiles for existing auth users
-- This creates a profile for any auth user who doesn't have one

INSERT INTO user_profiles (id, email, full_name, subscription_tier)
SELECT 
  au.id,
  au.email,
  COALESCE(au.raw_user_meta_data->>'full_name', ''),
  'free'
FROM auth.users au
WHERE NOT EXISTS (
  SELECT 1 FROM user_profiles up WHERE up.id = au.id
);

-- If you want to give yourself Pro access, run this after finding your email:
-- UPDATE user_profiles SET subscription_tier = 'pro' WHERE email = 'your-email@example.com';

-- Check which users now have profiles:
SELECT email, subscription_tier, is_admin FROM user_profiles;
