-- Migration 041: Remove duplicate SCA cases from live database
-- WARNING: This migration dedupes by (title, category_code) only. Category codes
-- are NOT unique across cases, so this may have deleted unique cases that shared
-- a code. Do not run again. Use 042 instead (dedupes by title + category_code + scenario).
--
-- Original intent: keep one row per (title, category_code), retaining the newer row.

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
