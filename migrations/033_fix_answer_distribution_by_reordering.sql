-- Migration: Fix Answer Distribution by Reordering Options
-- Current: B=50.54%, A=9.65%, C=32.06%, D=6.20%, E=1.55%
-- Strategy: Reorder options so B answers become A, D, or E (maintains clinical accuracy)
-- This is safer than changing correct_option - we keep the same options, just move them

-- This migration reorders the options JSON array to redistribute answers
-- Target: Move ~170 B answers to A, ~85 to D, ~85 to E to achieve ~20% each

-- Function to reorder options: move option at current position to new position
-- We'll use PostgreSQL JSON functions to manipulate the options array

-- Step 1: Move some B answers to A (target: ~170 questions)
-- Reorder options so current B becomes A, and shift others
UPDATE akt_questions
SET 
  options = jsonb_build_array(
    jsonb_build_object('label', 'A', 'text', (options->1->>'text')),  -- Current B becomes A
    jsonb_build_object('label', 'B', 'text', (options->0->>'text')),  -- Current A becomes B
    jsonb_build_object('label', 'C', 'text', (options->2->>'text')),  -- Keep C
    jsonb_build_object('label', 'D', 'text', (options->3->>'text')),  -- Keep D
    jsonb_build_object('label', 'E', 'text', (options->4->>'text'))  -- Keep E
  ),
  correct_option = 'A'
WHERE correct_option = 'B'
  AND published = true
  AND jsonb_array_length(options) = 5
  AND id IN (
    SELECT id FROM akt_questions
    WHERE correct_option = 'B'
      AND published = true
      AND jsonb_array_length(options) = 5
      AND topic IN (
        'Primary Care Organisation & Management',
        'Geriatrics',
        'Renal',
        'Cardiovascular',
        'Women''s Health',
        'Gastroenterology',
        'Evidence-Based Practice',
        'Dermatology'
      )
    ORDER BY id
    LIMIT 170
  );

-- Step 2: Move some B answers to D (target: ~85 questions)
-- Reorder options so current B becomes D
UPDATE akt_questions
SET 
  options = jsonb_build_array(
    jsonb_build_object('label', 'A', 'text', (options->0->>'text')),  -- Keep A
    jsonb_build_object('label', 'B', 'text', (options->2->>'text')),  -- Current C becomes B
    jsonb_build_object('label', 'C', 'text', (options->3->>'text')),  -- Current D becomes C
    jsonb_build_object('label', 'D', 'text', (options->1->>'text')),  -- Current B becomes D
    jsonb_build_object('label', 'E', 'text', (options->4->>'text'))  -- Keep E
  ),
  correct_option = 'D'
WHERE correct_option = 'B'
  AND published = true
  AND jsonb_array_length(options) = 5
  AND id IN (
    SELECT id FROM akt_questions
    WHERE correct_option = 'B'
      AND published = true
      AND jsonb_array_length(options) = 5
      AND topic IN (
        'Respiratory',
        'Surgery',
        'Sexual Health',
        'Haematology',
        'Neurology',
        'Prescribing',
        'Endocrinology',
        'Paediatrics'
      )
    ORDER BY id
    LIMIT 85
  );

-- Step 3: Move some B answers to E (target: ~85 questions)
-- Reorder options so current B becomes E
UPDATE akt_questions
SET 
  options = jsonb_build_array(
    jsonb_build_object('label', 'A', 'text', (options->0->>'text')),  -- Keep A
    jsonb_build_object('label', 'B', 'text', (options->2->>'text')),  -- Current C becomes B
    jsonb_build_object('label', 'C', 'text', (options->3->>'text')),  -- Current D becomes C
    jsonb_build_object('label', 'D', 'text', (options->4->>'text')),  -- Current E becomes D
    jsonb_build_object('label', 'E', 'text', (options->1->>'text'))  -- Current B becomes E
  ),
  correct_option = 'E'
WHERE correct_option = 'B'
  AND published = true
  AND jsonb_array_length(options) = 5
  AND id IN (
    SELECT id FROM akt_questions
    WHERE correct_option = 'B'
      AND published = true
      AND jsonb_array_length(options) = 5
      AND topic IN (
        'Mental Health',
        'ENT',
        'Musculoskeletal',
        'Men''s Health',
        'Palliative Care',
        'Allergy & Immunology',
        'Oncology',
        'Ophthalmology',
        'Infectious Diseases'
      )
    ORDER BY id
    LIMIT 85
  );

-- After running this migration:
-- Expected distribution: B should be ~20-25% (down from 50.54%)
-- A should be ~25-30% (up from 9.65%)
-- D should be ~15-20% (up from 6.20%)
-- E should be ~10-15% (up from 1.55%)
-- C should remain ~30% (already balanced)

-- Note: This maintains clinical accuracy - same options, just reordered
-- The correct answer text remains the same, just moved to a different position
