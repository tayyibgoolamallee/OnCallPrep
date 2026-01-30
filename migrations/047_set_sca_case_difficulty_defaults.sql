-- Migration 047: Ensure all SCA cases have a valid difficulty (easy, medium, hard, advanced)
-- Sets NULL or invalid values to 'medium'; maps 'intermediate' to 'medium'.
-- Run after any SCA case migrations. Safe to run multiple times.

-- Map 'intermediate' to 'medium'
UPDATE sca_cases
SET difficulty = 'medium'
WHERE LOWER(TRIM(difficulty)) = 'intermediate';

-- Set NULL or empty to 'medium'
UPDATE sca_cases
SET difficulty = 'medium'
WHERE difficulty IS NULL OR TRIM(difficulty) = '';

-- Set any other non-standard value to 'medium' (e.g. typos, legacy values)
UPDATE sca_cases
SET difficulty = 'medium'
WHERE LOWER(TRIM(difficulty)) NOT IN ('easy', 'medium', 'hard', 'advanced');
