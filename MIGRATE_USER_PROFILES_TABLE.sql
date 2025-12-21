-- ============================================
-- MIGRATION: Update user_profiles table structure
-- This script aligns your table with what the code expects
-- ============================================

-- Step 1: Add missing columns that the code expects
ALTER TABLE user_profiles 
    ADD COLUMN IF NOT EXISTS subscription_status TEXT DEFAULT 'inactive',
    ADD COLUMN IF NOT EXISTS subscription_expires_at TIMESTAMPTZ,
    ADD COLUMN IF NOT EXISTS full_name TEXT;

-- Step 2: Combine first_name and last_name into full_name (if they exist)
-- This preserves existing data
UPDATE user_profiles 
SET full_name = CONCAT(
    COALESCE(first_name, ''), 
    CASE WHEN first_name IS NOT NULL AND last_name IS NOT NULL THEN ' ' ELSE '' END,
    COALESCE(last_name, '')
)
WHERE full_name IS NULL OR full_name = '';

-- Step 3: Add constraints for subscription_status
DO $$ 
BEGIN
    -- Drop existing constraint if it exists
    ALTER TABLE user_profiles DROP CONSTRAINT IF EXISTS check_subscription_status;
    
    -- Add new constraint
    ALTER TABLE user_profiles ADD CONSTRAINT check_subscription_status 
        CHECK (subscription_status IN ('active', 'inactive', 'cancelled', 'expired'));
END $$;

-- Step 4: Add constraints for plan (if not already exists)
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'check_plan'
    ) THEN
        ALTER TABLE user_profiles ADD CONSTRAINT check_plan 
            CHECK (plan IN ('free', 'pro', 'trainer'));
    END IF;
END $$;

-- Step 5: Add constraints for role (if not already exists)
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'check_role'
    ) THEN
        ALTER TABLE user_profiles ADD CONSTRAINT check_role 
            CHECK (role IN ('user', 'admin'));
    END IF;
END $$;

-- Step 6: Set default values for any NULL values
UPDATE user_profiles 
SET plan = 'free' 
WHERE plan IS NULL;

UPDATE user_profiles 
SET subscription_status = 'inactive' 
WHERE subscription_status IS NULL;

UPDATE user_profiles 
SET role = 'user' 
WHERE role IS NULL;

-- Step 7: Verify the migration
SELECT 'Migration complete! Current table structure:' as status;
SELECT 
    column_name, 
    data_type, 
    column_default,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'user_profiles'
ORDER BY ordinal_position;

-- Note: 
-- - first_name and last_name are kept (not deleted) in case you want to use them
-- - full_name is now populated from first_name + last_name
-- - training_stage is kept (not deleted) if you want to use it
-- - subscription_status and subscription_expires_at are now available for the code

