-- Migration 064: Add contact_email to study_profiles
-- Lets users provide a specific contact email for the study buddy directory,
-- removing the need for the RPC function to look up auth emails.

ALTER TABLE study_profiles
  ADD COLUMN IF NOT EXISTS contact_email TEXT;

COMMENT ON COLUMN study_profiles.contact_email IS 'Optional contact email shown to other users when share_email_with_study_buddies is true.';
