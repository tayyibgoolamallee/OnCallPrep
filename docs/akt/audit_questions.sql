-- AKT Question Quality Audit — comprehensive 4-pillar check.
-- Run in Supabase SQL Editor (single query → one table). No data is changed.
--
-- PILLARS:
-- 1. REFERENCES  — every question must have at least one clickable URL
-- 2. STEMS       — must contain adequate clinical context
-- 3. OPTIONS     — structural integrity (count, duplicates, correct answer match)
-- 4. EXPLANATIONS — must be substantive and reference-backed
--
-- Issue types flagged:
-- • No guideline_refs
-- • No link in guideline_refs (must include at least one URL)
-- • No link in explanation text
-- • Short explanation (<200 chars)
-- • Short stem (<80 chars)
-- • Very long stem (>500 chars)
-- • Stem lacks clinical context (no age/gender/presents/history)
-- • correct_option not A/B/C/D/E
-- • correct_option not in options (label/id mismatch)
-- • Option count not 4 or 5
-- • Empty or whitespace option text
-- • Duplicate option text
-- • Invalid difficulty (use easy/medium/hard)
-- • Empty or missing topic
-- • Possible duplicate stem

WITH issues AS (

  -- PILLAR 1: REFERENCES -----------------------------------------------

  SELECT id, topic, difficulty, 'No guideline_refs' AS issue
  FROM akt_questions
  WHERE published = true
    AND (guideline_refs IS NULL OR array_length(guideline_refs, 1) IS NULL OR array_length(guideline_refs, 1) = 0)

  UNION ALL

  SELECT id, topic, difficulty, 'No link in guideline_refs (must include at least one URL)'
  FROM akt_questions
  WHERE published = true
    AND guideline_refs IS NOT NULL
    AND array_length(guideline_refs, 1) > 0
    AND NOT (array_to_string(guideline_refs, ' ') ~* 'https?://')

  UNION ALL

  SELECT id, topic, difficulty, 'No link in explanation text'
  FROM akt_questions
  WHERE published = true
    AND NOT (explanation ~* 'https?://')
    AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
    AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva')

  -- PILLAR 2: STEMS -----------------------------------------------------

  UNION ALL

  SELECT id, topic, difficulty, 'Short stem (<80 chars)'
  FROM akt_questions
  WHERE published = true AND length(question) < 80

  UNION ALL

  SELECT id, topic, difficulty, 'Very long stem (>500 chars)'
  FROM akt_questions
  WHERE published = true AND length(question) > 500

  UNION ALL

  SELECT id, topic, difficulty, 'Stem lacks clinical context (no age/gender/presents/scenario)'
  FROM akt_questions
  WHERE published = true
    AND NOT (question ~* '\d+-year-old|\d+ year old|presents with|history of|complains of|reports|attends|referred')
    AND NOT (question ~* '\bgp\b|\bpractice\b|\btrainee\b|\bregistrar\b|\bpatient\b|\bcolleague\b|\bnurse\b|\bpharmacist\b|\bhealth visitor|\bwoman\b|\bman\b|\bchild\b|\bmother\b|\bfather\b|\bbaby\b|\bboy\b|\bgirl\b|\bconsultant\b|\blocum\b')

  -- PILLAR 3: OPTIONS ---------------------------------------------------

  UNION ALL

  SELECT id, topic, difficulty, 'correct_option not A/B/C/D/E'
  FROM akt_questions
  WHERE published = true
    AND correct_option NOT IN ('A', 'B', 'C', 'D', 'E', 'a', 'b', 'c', 'd', 'e')

  UNION ALL

  SELECT id, topic, difficulty, 'correct_option not in options (label/id mismatch)'
  FROM akt_questions q
  WHERE published = true
    AND NOT EXISTS (
      SELECT 1 FROM jsonb_array_elements(q.options) AS o
      WHERE upper(trim(coalesce(o->>'label', o->>'id', ''))) = upper(trim(q.correct_option))
    )

  UNION ALL

  SELECT id, topic, difficulty, 'Option count not 4 or 5'
  FROM akt_questions
  WHERE published = true
    AND jsonb_array_length(options) IS NOT NULL
    AND jsonb_array_length(options) NOT IN (4, 5)

  UNION ALL

  SELECT id, topic, difficulty, 'Empty or whitespace option text'
  FROM akt_questions q
  WHERE published = true
    AND EXISTS (
      SELECT 1 FROM jsonb_array_elements(q.options) AS o
      WHERE trim(coalesce(o->>'text', '')) = ''
    )

  UNION ALL

  SELECT id, topic, difficulty, 'Duplicate option text'
  FROM akt_questions q
  WHERE published = true
    AND EXISTS (
      SELECT 1
      FROM (SELECT trim(o->>'text') AS t FROM jsonb_array_elements(q.options) o) sub
      GROUP BY t
      HAVING count(*) > 1
    )

  -- PILLAR 4: EXPLANATIONS ---------------------------------------------

  UNION ALL

  SELECT id, topic, difficulty, 'Short explanation (<200 chars)'
  FROM akt_questions
  WHERE published = true AND length(explanation) < 200

  -- STRUCTURAL ----------------------------------------------------------

  UNION ALL

  SELECT id, topic, difficulty, 'Invalid difficulty (use easy/medium/hard)'
  FROM akt_questions
  WHERE published = true
    AND (difficulty IS NULL OR trim(difficulty) NOT IN ('easy', 'medium', 'hard'))

  UNION ALL

  SELECT id, topic, difficulty, 'Empty or missing topic'
  FROM akt_questions
  WHERE published = true
    AND (topic IS NULL OR trim(topic) = '')

  UNION ALL

  SELECT a.id, a.topic, a.difficulty, 'Possible duplicate stem'
  FROM akt_questions a
  JOIN akt_questions b ON a.question = b.question AND a.id > b.id
  WHERE a.published = true AND b.published = true

  UNION ALL

  SELECT b.id, b.topic, b.difficulty, 'Possible duplicate stem'
  FROM akt_questions a
  JOIN akt_questions b ON a.question = b.question AND a.id > b.id
  WHERE a.published = true AND b.published = true
)
SELECT id, topic, difficulty,
       count(*) AS issue_count,
       string_agg(issue, ' | ' ORDER BY issue) AS issues
FROM issues
GROUP BY id, topic, difficulty
ORDER BY count(*) DESC, topic, id;
