-- Migration: Create Question Feedback Table
-- Enables users to provide feedback on AKT questions

CREATE TABLE IF NOT EXISTS akt_question_feedback (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  question_id UUID NOT NULL REFERENCES akt_questions(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  
  -- Core feedback
  sentiment TEXT NOT NULL CHECK (sentiment IN ('helpful', 'needs_improvement')),
  
  -- Structured feedback (stored as JSONB for flexibility)
  positive_feedback JSONB,  -- For 'helpful' sentiment
  negative_feedback JSONB,  -- For 'needs_improvement' sentiment
  
  -- Free text
  free_text TEXT,
  
  -- Auto-captured metadata
  topic TEXT,
  difficulty TEXT,
  time_spent_seconds INTEGER,  -- If we track this in the future
  
  -- Status
  reviewed BOOLEAN DEFAULT false,
  action_taken TEXT,  -- 'updated', 'dismissed', 'pending', etc.
  reviewed_by UUID REFERENCES auth.users(id),
  reviewed_at TIMESTAMPTZ,
  
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  
  -- Prevent duplicate feedback from same user on same question
  UNIQUE(user_id, question_id)
);

-- Indexes for efficient querying
CREATE INDEX IF NOT EXISTS idx_feedback_question_id ON akt_question_feedback(question_id);
CREATE INDEX IF NOT EXISTS idx_feedback_user_id ON akt_question_feedback(user_id);
CREATE INDEX IF NOT EXISTS idx_feedback_sentiment ON akt_question_feedback(sentiment);
CREATE INDEX IF NOT EXISTS idx_feedback_reviewed ON akt_question_feedback(reviewed);
CREATE INDEX IF NOT EXISTS idx_feedback_created_at ON akt_question_feedback(created_at DESC);

-- RLS Policies
ALTER TABLE akt_question_feedback ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist (for idempotency)
DROP POLICY IF EXISTS "Users can insert own feedback" ON akt_question_feedback;
DROP POLICY IF EXISTS "Users can read own feedback" ON akt_question_feedback;
DROP POLICY IF EXISTS "Admins can read all feedback" ON akt_question_feedback;
DROP POLICY IF EXISTS "Admins can update feedback" ON akt_question_feedback;

-- Users can insert their own feedback
CREATE POLICY "Users can insert own feedback"
  ON akt_question_feedback FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Users can read their own feedback
CREATE POLICY "Users can read own feedback"
  ON akt_question_feedback FOR SELECT
  USING (auth.uid() = user_id);

-- Admins can read all feedback (we'll add admin check later)
CREATE POLICY "Admins can read all feedback"
  ON akt_question_feedback FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM user_profiles
      WHERE id = auth.uid() AND is_admin = true
    )
  );

-- Admins can update feedback (for marking as reviewed)
CREATE POLICY "Admins can update feedback"
  ON akt_question_feedback FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM user_profiles
      WHERE id = auth.uid() AND is_admin = true
    )
  );

-- Function to update updated_at timestamp (idempotent - CREATE OR REPLACE)
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Drop trigger if exists (for idempotency)
DROP TRIGGER IF EXISTS update_feedback_updated_at ON akt_question_feedback;

CREATE TRIGGER update_feedback_updated_at
  BEFORE UPDATE ON akt_question_feedback
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();
