-- Migration: SQL Queries to Identify Question Quality Issues
-- Run these queries in Supabase to identify:
-- 1. Answer distribution bias
-- 2. Potential duplicates
-- 3. Questions that may need improvement

-- Query 1: Check answer distribution
-- Run this to see if answers are balanced:
/*
SELECT 
  correct_option,
  COUNT(*) as count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentage
FROM akt_questions
WHERE published = true
GROUP BY correct_option
ORDER BY correct_option;
*/

-- Query 2: Find potential duplicate questions (similar question text)
-- Run this to find questions with very similar wording:
/*
SELECT 
  a.id,
  a.question,
  a.topic,
  a.correct_option
FROM akt_questions a
INNER JOIN akt_questions b 
  ON a.id != b.id 
  AND a.question ILIKE '%' || SUBSTRING(b.question FROM 1 FOR 50) || '%'
  AND a.topic = b.topic
WHERE a.published = true
ORDER BY a.topic, a.question
LIMIT 50;
*/

-- Query 3: Find questions with answer 'B' (to check for bias)
/*
SELECT 
  topic,
  COUNT(*) as count
FROM akt_questions
WHERE correct_option = 'B' AND published = true
GROUP BY topic
ORDER BY count DESC;
*/

-- Query 4: Find questions that might be too simple (short explanations)
/*
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
*/

-- Note: These are analysis queries. After identifying issues, you can:
-- 1. Update specific questions using UPDATE statements
-- 2. Delete duplicates
-- 3. Replace simpler questions with more complex versions

-- The improved questions in migrations 022-025 can serve as templates
-- for updating existing questions to improve quality.
