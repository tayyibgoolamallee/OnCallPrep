-- SCA Case Quality Audit
-- Run in Supabase SQL Editor. Returns one row per case with pipe-separated issues.
-- A clean case returns zero issues. Target: zero rows.

WITH issues AS (

  -- 1. Scenario contains "You are a GP" (should be removed)
  SELECT id, title, category, category_code, difficulty, case_type,
         'Scenario says You are a GP' AS issue
  FROM sca_cases
  WHERE published = true
    AND scenario ~* 'you are a gp|you are a general practitioner'

  UNION ALL

  -- 2. Missing category
  SELECT id, title, category, category_code, difficulty, case_type,
         'Missing category' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND (category IS NULL OR category = '')

  UNION ALL

  -- 3. Missing category_code
  SELECT id, title, category, category_code, difficulty, case_type,
         'Missing category_code' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND (category_code IS NULL OR category_code = '')

  UNION ALL

  -- 4. Actor info missing entirely
  SELECT id, title, category, category_code, difficulty, case_type,
         'No actor_info' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND (actor_info IS NULL OR actor_info::text = '{}' OR actor_info::text = 'null')

  UNION ALL

  -- 5. No opening statement
  SELECT id, title, category, category_code, difficulty, case_type,
         'No opening_statement in actor_info' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND actor_info IS NOT NULL
    AND actor_info::text <> 'null'
    AND (actor_info->>'opening_statement' IS NULL OR actor_info->>'opening_statement' = '')

  UNION ALL

  -- 6. No freely_given_history
  SELECT id, title, category, category_code, difficulty, case_type,
         'No freely_given_history in actor_info' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND actor_info IS NOT NULL
    AND actor_info::text <> 'null'
    AND (actor_info->'freely_given_history' IS NULL OR actor_info->>'freely_given_history' = 'null')

  UNION ALL

  -- 7. No history_on_direct_questioning
  SELECT id, title, category, category_code, difficulty, case_type,
         'No history_on_direct_questioning' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND actor_info IS NOT NULL
    AND actor_info::text <> 'null'
    AND (actor_info->'history_on_direct_questioning' IS NULL OR actor_info->>'history_on_direct_questioning' = 'null')

  UNION ALL

  -- 8. ICE missing from actor_info (not top-level or nested)
  SELECT id, title, category, category_code, difficulty, case_type,
         'ICE missing from actor_info' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND actor_info IS NOT NULL
    AND actor_info::text <> 'null'
    AND (actor_info->'ice' IS NULL OR actor_info->>'ice' = 'null')
    AND (actor_info->'freely_given_history'->'ice' IS NULL
         OR actor_info->'freely_given_history'->>'ice' = 'null')

  UNION ALL

  -- 9. Actor behaviour missing or very short
  SELECT id, title, category, category_code, difficulty, case_type,
         'Actor behaviour missing or too short (<30 chars)' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND (actor_behaviour IS NULL OR LENGTH(actor_behaviour) < 30)

  UNION ALL

  -- 10. Marking criteria missing
  SELECT id, title, category, category_code, difficulty, case_type,
         'No marking_criteria' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND (marking_criteria IS NULL OR marking_criteria::text = '{}' OR marking_criteria::text = 'null')

  UNION ALL

  -- 11. Domain 1 has fewer than 5 items
  SELECT id, title, category, category_code, difficulty, case_type,
         'Domain 1 has fewer than 5 marking items' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND marking_criteria IS NOT NULL
    AND marking_criteria::text <> 'null'
    AND jsonb_array_length(COALESCE(marking_criteria->'domain1'->'items', '[]'::jsonb)) < 5

  UNION ALL

  -- 12. Domain 2 has fewer than 5 items
  SELECT id, title, category, category_code, difficulty, case_type,
         'Domain 2 has fewer than 5 marking items' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND marking_criteria IS NOT NULL
    AND marking_criteria::text <> 'null'
    AND jsonb_array_length(COALESCE(marking_criteria->'domain2'->'items', '[]'::jsonb)) < 5

  UNION ALL

  -- 13. Domain 3 has fewer than 5 items
  SELECT id, title, category, category_code, difficulty, case_type,
         'Domain 3 has fewer than 5 marking items' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND marking_criteria IS NOT NULL
    AND marking_criteria::text <> 'null'
    AND jsonb_array_length(COALESCE(marking_criteria->'domain3'->'items', '[]'::jsonb)) < 5

  UNION ALL

  -- 14. Model answer too short
  SELECT id, title, category, category_code, difficulty, case_type,
         'Model answer too short (<300 chars)' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND LENGTH(model_answer) < 300

  UNION ALL

  -- 15. Case notes missing (full cases should have them)
  SELECT id, title, category, category_code, difficulty, case_type,
         'No case_notes' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND (case_notes IS NULL OR case_notes::text = '{}' OR case_notes::text = 'null')

  UNION ALL

  -- 16. Case notes reveal social history (may give away key info)
  SELECT id, title, category, category_code, difficulty, case_type,
         'Case notes reveal social_summary (may give away info)' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND case_notes IS NOT NULL
    AND case_notes::text <> 'null'
    AND case_notes->>'social_summary' IS NOT NULL
    AND case_notes->>'social_summary' <> ''
    AND case_notes->>'social_summary' <> 'None'
    AND case_notes->>'social_summary' <> 'N/A'

  UNION ALL

  -- 17. Case notes reveal family history
  SELECT id, title, category, category_code, difficulty, case_type,
         'Case notes reveal family_summary (may give away info)' AS issue
  FROM sca_cases
  WHERE published = true
    AND case_type = 'full'
    AND case_notes IS NOT NULL
    AND case_notes::text <> 'null'
    AND case_notes->>'family_summary' IS NOT NULL
    AND case_notes->>'family_summary' <> ''
    AND case_notes->>'family_summary' <> 'None'
    AND case_notes->>'family_summary' <> 'N/A'

)

SELECT
  i.id,
  i.title,
  i.category_code,
  i.category,
  i.difficulty,
  i.case_type,
  COUNT(*) AS issue_count,
  STRING_AGG(i.issue, ' | ' ORDER BY i.issue) AS issues
FROM issues i
GROUP BY i.id, i.title, i.category_code, i.category, i.difficulty, i.case_type
ORDER BY issue_count DESC, i.title;
