-- Migration 042: Remove ONLY true duplicate SCA cases (same title + category_code + scenario)
-- Use this AFTER re-running 037 and 039 to restore cases that were wrongly removed by 041.
--
-- 041 removed rows by (title, category_code) only, so it may have deleted unique cases
-- that shared a category_code with another case. This migration only deletes rows where
-- (title, category_code, scenario) are all identical (same row inserted twice).

-- Delete only true duplicates: same title, category_code, and scenario; keep newest.
DELETE FROM sca_cases
WHERE id IN (
  SELECT id
  FROM (
    SELECT id,
           ROW_NUMBER() OVER (
             PARTITION BY title, COALESCE(category_code, ''), scenario
             ORDER BY created_at DESC NULLS LAST
           ) AS rn
    FROM sca_cases
  ) t
  WHERE rn > 1
);
