-- Migration 065: Allow admins to delete any study profile for moderation
-- Admins are identified by user_profiles.is_admin = true.

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
