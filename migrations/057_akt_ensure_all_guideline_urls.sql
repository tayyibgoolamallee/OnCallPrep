-- Migration 057: Ensure EVERY published question has at least one URL in guideline_refs.
-- Catches any questions that migration 054 missed (new questions, edge cases, NULL arrays).
-- Uses topic-to-URL mapping. Safe to re-run (only updates questions without any URL).

-- Helper: only targets questions where guideline_refs has no http link at all.
-- This includes NULL, empty array, and arrays with text-only refs (no URLs).

-- Allergy
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/angio-oedema-and-anaphylaxis/'],
    updated_at = now()
WHERE topic = 'Allergy' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/allergic-rhinitis/'],
    updated_at = now()
WHERE topic = 'Allergy & Immunology' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Cardiovascular
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/cvd-risk-assessment-and-management/'],
    updated_at = now()
WHERE topic = 'Cardiovascular' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Dermatology
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/acne-vulgaris/'],
    updated_at = now()
WHERE topic = 'Dermatology' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- ENT
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/benign-paroxysmal-positional-vertigo/'],
    updated_at = now()
WHERE topic = 'ENT' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Endocrinology
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/diabetes-type-2/'],
    updated_at = now()
WHERE topic = 'Endocrinology' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Evidence-Based Practice
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://www.rcgp.org.uk/mrcgp-exams/applied-knowledge-test'],
    updated_at = now()
WHERE topic = 'Evidence-Based Practice' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Gastroenterology
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/dyspepsia-unvestigated/'],
    updated_at = now()
WHERE topic = 'Gastroenterology' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Geriatrics
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/delirium/'],
    updated_at = now()
WHERE topic = 'Geriatrics' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Haematology
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/anaemia-iron-deficiency/'],
    updated_at = now()
WHERE topic = 'Haematology' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Infectious Diseases
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/sepsis/'],
    updated_at = now()
WHERE topic = 'Infectious Diseases' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Mental Health
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/depression/'],
    updated_at = now()
WHERE topic = 'Mental Health' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Musculoskeletal
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/osteoarthritis/'],
    updated_at = now()
WHERE topic = 'Musculoskeletal' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Neurology
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/stroke-and-tia/'],
    updated_at = now()
WHERE topic = 'Neurology' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Oncology
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://www.nice.org.uk/guidance/ng12'],
    updated_at = now()
WHERE topic = 'Oncology' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Ophthalmology
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/glaucoma/'],
    updated_at = now()
WHERE topic = 'Ophthalmology' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Paediatrics
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/child-maltreatment-recognition-and-management/'],
    updated_at = now()
WHERE topic = 'Paediatrics' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Palliative Care
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://www.nice.org.uk/guidance/ng31'],
    updated_at = now()
WHERE topic = 'Palliative Care' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Prescribing
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://bnf.nice.org.uk/'],
    updated_at = now()
WHERE topic = 'Prescribing' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Primary Care Organisation & Management
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://www.gmc-uk.org/ethical-guidance/ethical-guidance-for-doctors/good-medical-practice'],
    updated_at = now()
WHERE topic = 'Primary Care Organisation & Management' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Renal
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/chronic-kidney-disease/'],
    updated_at = now()
WHERE topic = 'Renal' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Respiratory
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/asthma/'],
    updated_at = now()
WHERE topic = 'Respiratory' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Sexual Health
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/chlamydia-uncomplicated-genital/'],
    updated_at = now()
WHERE topic = 'Sexual Health' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Women's Health
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/topics/menopause/'],
    updated_at = now()
WHERE topic = 'Women''s Health' AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Catch-all: any topic not listed above that still has no URL
UPDATE akt_questions
SET guideline_refs = coalesce(guideline_refs, ARRAY[]::text[]) || ARRAY['https://cks.nice.org.uk/'],
    updated_at = now()
WHERE published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');
