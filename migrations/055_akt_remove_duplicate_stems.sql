-- Migration 055: Remove duplicate-stem questions.
-- Keeps the OLDEST (earliest created_at) version of each duplicate and deletes newer copies.
-- Run in Supabase SQL Editor. Check the SELECT first to see what will be deleted.

-- Preview what will be deleted (run this first to check):
-- SELECT id, topic, difficulty, left(question, 80) AS question_start, created_at
-- FROM akt_questions
-- WHERE published = true
--   AND id NOT IN (
--     SELECT min(id::text)::uuid
--     FROM akt_questions
--     WHERE published = true
--     GROUP BY question
--   )
-- ORDER BY question;

-- Delete newer duplicates (keeping the oldest):
DELETE FROM akt_questions
WHERE id IN (
  SELECT a.id
  FROM akt_questions a
  JOIN (
    SELECT question, min(created_at) AS first_created
    FROM akt_questions
    WHERE published = true
    GROUP BY question
    HAVING count(*) > 1
  ) dups ON a.question = dups.question AND a.created_at > dups.first_created
  WHERE a.published = true
);
