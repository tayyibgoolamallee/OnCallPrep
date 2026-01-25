-- Analysis Queries for Question Quality Issues
-- Run these queries directly in Supabase SQL Editor (not as a migration)
-- Copy and paste each query separately to see results

-- ============================================
-- Query 1: Check Answer Distribution
-- ============================================
-- This shows if answers are balanced (A, B, C, D, E) or if there's bias
SELECT 
  correct_option,
  COUNT(*) as count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentage
FROM akt_questions
WHERE published = true
GROUP BY correct_option
ORDER BY correct_option;

-- ============================================
-- Query 2: Find Potential Duplicate Questions
-- ============================================
-- This finds questions with very similar wording
SELECT 
  a.id,
  a.question,
  a.topic,
  a.correct_option,
  b.id as duplicate_id,
  b.question as duplicate_question
FROM akt_questions a
INNER JOIN akt_questions b 
  ON a.id != b.id 
  AND a.question ILIKE '%' || SUBSTRING(b.question FROM 1 FOR 50) || '%'
  AND a.topic = b.topic
WHERE a.published = true
ORDER BY a.topic, a.question
LIMIT 50;

-- ============================================
-- Query 3: Find Questions with Answer 'B' (Check for Bias)
-- ============================================
-- This shows which topics have the most 'B' answers
SELECT 
  topic,
  COUNT(*) as count
FROM akt_questions
WHERE correct_option = 'B' AND published = true
GROUP BY topic
ORDER BY count DESC;

-- ============================================
-- Query 4: Find Questions That Might Be Too Simple
-- ============================================
-- This finds questions with short explanations (<200 chars) that may need improvement
SELECT 
  id,
  topic,
  question,
  LENGTH(explanation) as explanation_length,
  difficulty
FROM akt_questions
WHERE published = true
  AND LENGTH(explanation) < 200
ORDER BY explanation_length
LIMIT 50;

-- ============================================
-- Query 5: Overall Statistics
-- ============================================
-- Get total question count and breakdown
SELECT 
  COUNT(*) as total_questions,
  COUNT(DISTINCT topic) as total_topics,
  COUNT(CASE WHEN difficulty = 'easy' THEN 1 END) as easy_count,
  COUNT(CASE WHEN difficulty = 'medium' THEN 1 END) as medium_count,
  COUNT(CASE WHEN difficulty = 'hard' THEN 1 END) as hard_count,
  COUNT(CASE WHEN difficulty = 'high' THEN 1 END) as high_count
FROM akt_questions
WHERE published = true;
