-- Migration: Final Category Consolidation
-- Move PCOM and Ethics to Primary Care Organisation & Management
-- Move Calcium and Vitamin D to Musculoskeletal/Rheumatology
-- Create Surgery category for surgical topics

-- Step 1: Move PCOM and Ethics to Primary Care Organisation & Management
UPDATE akt_questions 
SET topic = 'Primary Care Organisation & Management' 
WHERE topic IN ('Pcom', 'PCOM', 'Ethics');

-- Step 2: Move Calcium and Vitamin D to Musculoskeletal
UPDATE akt_questions 
SET topic = 'Musculoskeletal' 
WHERE topic IN ('Calcium', 'Vitamin D', 'Osteoporosis');

-- Step 3: Create Surgery category - move urology topics that are surgical
-- Note: Some urology topics may stay in Renal/Urology if they're medical management
-- We'll move surgical urology topics to Surgery

-- Step 4: Identify and move surgical topics to Surgery category
-- This will be done in the next migration when we add new surgery questions
-- For now, we'll prepare the structure
