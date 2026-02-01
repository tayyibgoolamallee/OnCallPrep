-- Migration 051: Study buddy / community profile (optional, visibility-controlled)
-- Lets users show exam date, "looking for study buddy", VTS/area; contact via opt-in email only.
-- No message storage – contact is mailto: to the email they choose to reveal.

-- =============================================
-- Study profiles table (one row per user, optional)
-- =============================================
CREATE TABLE IF NOT EXISTS study_profiles (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  display_name TEXT,  -- optional name to show (e.g. first name); if null, show "Study buddy"
  exam_date DATE,
  looking_for_study_buddy BOOLEAN DEFAULT false,
  vts_or_area TEXT,
  show_exam_date BOOLEAN DEFAULT false,
  show_looking_for_study_buddy BOOLEAN DEFAULT false,
  show_vts_or_area BOOLEAN DEFAULT false,
  share_email_with_study_buddies BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

COMMENT ON TABLE study_profiles IS 'Optional study buddy / community profile. All fields and visibilities are user-controlled. No messages stored – contact is direct (email) when user opts in.';

-- =============================================
-- RLS: users manage own row; authenticated users can read directory (for find study buddies)
-- =============================================
ALTER TABLE study_profiles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read all study_profiles (for directory)"
  ON study_profiles FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Users can insert own study_profile"
  ON study_profiles FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own study_profile"
  ON study_profiles FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own study_profile"
  ON study_profiles FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);

-- =============================================
-- Function: return another user's email only if they opted in to share with study buddies
-- (avoids exposing email in directory; used by API when "Contact" is clicked)
-- =============================================
CREATE OR REPLACE FUNCTION public.get_contact_email_for_study_buddy(target_user_id UUID)
RETURNS TEXT
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  share_ok BOOLEAN;
  out_email TEXT;
BEGIN
  IF auth.uid() IS NULL THEN
    RETURN NULL;
  END IF;
  SELECT share_email_with_study_buddies INTO share_ok
  FROM study_profiles
  WHERE user_id = target_user_id;
  IF NOT share_ok THEN
    RETURN NULL;
  END IF;
  SELECT email INTO out_email
  FROM user_profiles
  WHERE id = target_user_id;
  RETURN out_email;
END;
$$;

COMMENT ON FUNCTION public.get_contact_email_for_study_buddy(UUID) IS 'Returns target user email only if they have share_email_with_study_buddies = true. Used when a logged-in user clicks Contact on a study buddy profile.';

-- =============================================
-- Trigger: keep updated_at in sync
-- =============================================
CREATE OR REPLACE FUNCTION study_profiles_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS study_profiles_updated_at ON study_profiles;
CREATE TRIGGER study_profiles_updated_at
  BEFORE UPDATE ON study_profiles
  FOR EACH ROW EXECUTE FUNCTION study_profiles_updated_at();
