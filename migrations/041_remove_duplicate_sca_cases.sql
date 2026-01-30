-- Migration 041: Remove duplicate SCA cases from live database
-- Use this when you ran 037 twice (original 34 cases, then 037 again with 59 cases),
-- so the first 34 cases exist twice. This keeps one row per (title, category_code),
-- retaining the newer row (from the second run) and deleting the older duplicate.

-- Delete duplicate rows: keep the one with the latest created_at per (title, category_code)
DELETE FROM sca_cases
WHERE id IN (
  SELECT id
  FROM (
    SELECT id,
           ROW_NUMBER() OVER (
             PARTITION BY title, COALESCE(category_code, '')
             ORDER BY created_at DESC NULLS LAST
           ) AS rn
    FROM sca_cases
  ) t
  WHERE rn > 1
);
