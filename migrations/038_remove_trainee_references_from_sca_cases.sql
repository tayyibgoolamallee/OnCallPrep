-- Migration to remove "trainee" and "GP trainee" references from existing SCA cases
-- This ensures all cases assume the candidate is acting as a GP (not a trainee)

-- Update scenarios that start with "You are a GP trainee."
UPDATE sca_cases
SET scenario = REGEXP_REPLACE(
  scenario,
  '^You are a GP trainee\.\s*',
  '',
  'g'
)
WHERE scenario ~ '^You are a GP trainee\.';

-- Update scenarios that contain "You are a GP trainee in a busy practice" (handle capitalization)
UPDATE sca_cases
SET scenario = REGEXP_REPLACE(
  scenario,
  'You are a GP trainee in a busy practice\.\s*',
  '',
  'g'
)
WHERE scenario ~ 'You are a GP trainee in a busy practice';

-- Update scenarios that contain "You are a GP trainee" anywhere
UPDATE sca_cases
SET scenario = REGEXP_REPLACE(
  scenario,
  'You are a GP trainee\s+',
  '',
  'g'
)
WHERE scenario ~ 'You are a GP trainee\s+';

-- Update scenarios that contain "GP trainee" (standalone or in context)
UPDATE sca_cases
SET scenario = REGEXP_REPLACE(
  scenario,
  'GP trainee',
  '',
  'g'
)
WHERE scenario ~ 'GP trainee';

-- Update scenarios that contain "trainee" when referring to the candidate being a trainee
-- This is more careful - we'll replace "You are a trainee" or "as a trainee" patterns
UPDATE sca_cases
SET scenario = REGEXP_REPLACE(
  scenario,
  'You are a trainee\.\s*',
  '',
  'g'
)
WHERE scenario ~ 'You are a trainee\.';

UPDATE sca_cases
SET scenario = REGEXP_REPLACE(
  scenario,
  'You are a trainee\s+',
  '',
  'g'
)
WHERE scenario ~ 'You are a trainee\s+';

-- Remove redundant "GP" references that are now unnecessary
-- Only remove if it's at the start and followed by context that makes it clear
-- Be careful not to remove "GP" from other contexts (like "GP practice", "GP surgery")
UPDATE sca_cases
SET scenario = REGEXP_REPLACE(
  scenario,
  '^You are a GP\.\s*',
  '',
  'g'
)
WHERE scenario ~ '^You are a GP\.';

UPDATE sca_cases
SET scenario = REGEXP_REPLACE(
  scenario,
  '^You are a GP\s+',
  '',
  'g'
)
WHERE scenario ~ '^You are a GP\s+';

-- Clean up any double spaces or leading/trailing whitespace that may have been created
UPDATE sca_cases
SET scenario = TRIM(REGEXP_REPLACE(scenario, '\s+', ' ', 'g'));

-- Capitalize the first letter of scenarios that now start with a lowercase letter
-- (e.g., if it was "You are a GP trainee. a 45-year-old..." and became "a 45-year-old...")
UPDATE sca_cases
SET scenario = UPPER(LEFT(scenario, 1)) || SUBSTRING(scenario, 2)
WHERE scenario ~ '^[a-z]';

-- Update the updated_at timestamp for all cases (since we've potentially modified them)
UPDATE sca_cases
SET updated_at = NOW();
