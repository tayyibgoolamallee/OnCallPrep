-- Migration 064: Add contact email, availability fields, and admin delete policy
-- Run this ONCE — combines the contact_email column, availability preferences,
-- and admin moderation policy into a single migration.

-- 1. Contact email
ALTER TABLE study_profiles
  ADD COLUMN IF NOT EXISTS contact_email TEXT;

-- 2. Availability preferences
ALTER TABLE study_profiles
  ADD COLUMN IF NOT EXISTS available_days TEXT[] DEFAULT '{}',
  ADD COLUMN IF NOT EXISTS available_times TEXT[] DEFAULT '{}',
  ADD COLUMN IF NOT EXISTS study_frequency TEXT,
  ADD COLUMN IF NOT EXISTS study_duration TEXT;

COMMENT ON COLUMN study_profiles.contact_email IS 'Optional email shown when share_email_with_study_buddies is true.';
COMMENT ON COLUMN study_profiles.available_days IS 'Days available, e.g. {monday,wednesday,saturday}.';
COMMENT ON COLUMN study_profiles.available_times IS 'Time slots, e.g. {AM,PM}.';
COMMENT ON COLUMN study_profiles.study_frequency IS 'How often, e.g. 1-2 times a week.';
COMMENT ON COLUMN study_profiles.study_duration IS 'How long, e.g. 1-3 months.';

-- 3. Admin moderation: allow admins to delete any study profile
CREATE POLICY "Admins can delete any study_profile"
  ON study_profiles FOR DELETE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM user_profiles
      WHERE user_profiles.id = auth.uid()
        AND user_profiles.is_admin = true
    )
  );
