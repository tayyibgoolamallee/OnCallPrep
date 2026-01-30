-- Migration 043: Remove "Your task is to..." from doctor's brief (scenario) in sca_cases
-- The exam task is always the same; explicit task statements defeat the purpose.

UPDATE sca_cases
SET scenario = TRIM(REGEXP_REPLACE(scenario, ' Your task is to [^.]*\.', '', 'g'))
WHERE scenario ~ ' Your task is to [^.]*\.';

-- Clean up any double spaces left after removal
UPDATE sca_cases
SET scenario = REGEXP_REPLACE(scenario, '  +', ' ', 'g')
WHERE scenario ~ '  +';
