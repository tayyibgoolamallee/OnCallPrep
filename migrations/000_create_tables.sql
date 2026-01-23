-- =============================================
-- OnCallPrep Database Schema
-- Run this FIRST before any data migrations
-- =============================================

-- Enable UUID extension if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =============================================
-- 1. SCA Cases Table
-- =============================================
CREATE TABLE IF NOT EXISTS sca_cases (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  case_type TEXT NOT NULL,  -- 'diagnosis', 'priming', 'full'
  title TEXT NOT NULL,
  scenario TEXT NOT NULL,
  patient_info JSONB NOT NULL,
  key_points TEXT[] NOT NULL,
  model_answer TEXT NOT NULL,
  time_limit INTEGER NOT NULL,  -- in seconds
  difficulty TEXT DEFAULT 'medium',  -- 'easy', 'medium', 'hard'
  is_pro BOOLEAN DEFAULT false,
  published BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =============================================
-- 2. AKT Questions Table
-- =============================================
CREATE TABLE IF NOT EXISTS akt_questions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  question TEXT NOT NULL,
  options JSONB NOT NULL,
  correct_option TEXT NOT NULL,
  explanation TEXT NOT NULL,
  topic TEXT NOT NULL,
  difficulty TEXT DEFAULT 'medium',
  guideline_refs TEXT[],
  is_pro BOOLEAN DEFAULT false,
  published BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =============================================
-- 3. Portfolio Guides Table
-- =============================================
CREATE TABLE IF NOT EXISTS portfolio_guides (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  stage TEXT NOT NULL,  -- 'st1', 'st2', 'st3'
  category TEXT NOT NULL,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  is_pro BOOLEAN DEFAULT false,
  published BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =============================================
-- 4. User Profiles Table
-- =============================================
CREATE TABLE IF NOT EXISTS user_profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  full_name TEXT,
  subscription_tier TEXT DEFAULT 'free',  -- 'free', 'pro'
  stripe_customer_id TEXT,
  stripe_subscription_id TEXT,
  is_admin BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =============================================
-- 5. User Progress Table
-- =============================================
CREATE TABLE IF NOT EXISTS user_progress (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  content_type TEXT NOT NULL,  -- 'sca', 'akt', 'portfolio'
  content_id UUID NOT NULL,
  score INTEGER,
  time_taken INTEGER,  -- in seconds
  user_response TEXT,
  completed BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, content_type, content_id)
);

-- =============================================
-- Row Level Security (RLS) Policies
-- =============================================

-- Enable RLS on all tables
ALTER TABLE sca_cases ENABLE ROW LEVEL SECURITY;
ALTER TABLE akt_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE portfolio_guides ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_progress ENABLE ROW LEVEL SECURITY;

-- SCA Cases: Anyone can read published cases
CREATE POLICY "Anyone can read published sca_cases"
  ON sca_cases FOR SELECT
  USING (published = true);

-- AKT Questions: Anyone can read published questions
CREATE POLICY "Anyone can read published akt_questions"
  ON akt_questions FOR SELECT
  USING (published = true);

-- Portfolio Guides: Anyone can read published guides
CREATE POLICY "Anyone can read published portfolio_guides"
  ON portfolio_guides FOR SELECT
  USING (published = true);

-- User Profiles: Users can read and update their own profile
CREATE POLICY "Users can read own profile"
  ON user_profiles FOR SELECT
  USING (auth.uid() = id);

CREATE POLICY "Users can update own profile"
  ON user_profiles FOR UPDATE
  USING (auth.uid() = id);

-- User Progress: Users can manage their own progress
CREATE POLICY "Users can read own progress"
  ON user_progress FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own progress"
  ON user_progress FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own progress"
  ON user_progress FOR UPDATE
  USING (auth.uid() = user_id);

-- =============================================
-- Trigger to auto-create user profile on signup
-- =============================================
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.user_profiles (id, email, full_name)
  VALUES (
    NEW.id,
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'full_name', '')
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Drop trigger if exists and recreate
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- =============================================
-- Indexes for better performance
-- =============================================
CREATE INDEX IF NOT EXISTS idx_sca_cases_case_type ON sca_cases(case_type);
CREATE INDEX IF NOT EXISTS idx_sca_cases_difficulty ON sca_cases(difficulty);
CREATE INDEX IF NOT EXISTS idx_sca_cases_is_pro ON sca_cases(is_pro);

CREATE INDEX IF NOT EXISTS idx_akt_questions_topic ON akt_questions(topic);
CREATE INDEX IF NOT EXISTS idx_akt_questions_difficulty ON akt_questions(difficulty);
CREATE INDEX IF NOT EXISTS idx_akt_questions_is_pro ON akt_questions(is_pro);

CREATE INDEX IF NOT EXISTS idx_portfolio_guides_stage ON portfolio_guides(stage);
CREATE INDEX IF NOT EXISTS idx_portfolio_guides_is_pro ON portfolio_guides(is_pro);

CREATE INDEX IF NOT EXISTS idx_user_progress_user_id ON user_progress(user_id);
CREATE INDEX IF NOT EXISTS idx_user_progress_content_type ON user_progress(content_type);

-- =============================================
-- Verify tables created
-- =============================================
SELECT 
  table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
  AND table_name IN ('sca_cases', 'akt_questions', 'portfolio_guides', 'user_profiles', 'user_progress');
