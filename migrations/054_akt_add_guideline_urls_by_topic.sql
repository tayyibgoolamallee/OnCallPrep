-- Migration 054: Add NICE CKS / guideline URLs to guideline_refs by topic.
-- Fixes ~825 questions flagged with "No link in guideline_refs".
-- Appends the URL only to questions that don't already have any http link.
-- Run in Supabase SQL Editor. Safe to re-run (won't add duplicate links).

-- Allergy
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/angio-oedema-and-anaphylaxis/'),
    updated_at = now()
WHERE topic = 'Allergy'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Allergy & Immunology
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/allergic-rhinitis/'),
    updated_at = now()
WHERE topic = 'Allergy & Immunology'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Cardiovascular
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/cvd-risk-assessment-and-management/'),
    updated_at = now()
WHERE topic = 'Cardiovascular'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Dermatology
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/acne-vulgaris/'),
    updated_at = now()
WHERE topic = 'Dermatology'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- ENT
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/allergic-rhinitis/'),
    updated_at = now()
WHERE topic = 'ENT'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Endocrinology
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/diabetes-type-2/'),
    updated_at = now()
WHERE topic = 'Endocrinology'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Evidence-Based Practice
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://www.nice.org.uk/process/pmg20/chapter/introduction'),
    updated_at = now()
WHERE topic = 'Evidence-Based Practice'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Gastroenterology
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/irritable-bowel-syndrome/'),
    updated_at = now()
WHERE topic = 'Gastroenterology'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Geriatrics
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/dementia/'),
    updated_at = now()
WHERE topic = 'Geriatrics'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Haematology
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/anaemia-iron-deficiency/'),
    updated_at = now()
WHERE topic = 'Haematology'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Infectious Diseases
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/chest-infections-adult/'),
    updated_at = now()
WHERE topic = 'Infectious Diseases'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Men's Health
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/prostatitis-acute/'),
    updated_at = now()
WHERE topic = 'Men''s Health'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Mental Health
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/depression/'),
    updated_at = now()
WHERE topic = 'Mental Health'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Musculoskeletal
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/osteoarthritis/'),
    updated_at = now()
WHERE topic = 'Musculoskeletal'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Neurology
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/headache-tension-type/'),
    updated_at = now()
WHERE topic = 'Neurology'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Oncology
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://www.nice.org.uk/guidance/ng12'),
    updated_at = now()
WHERE topic = 'Oncology'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Ophthalmology
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/conjunctivitis-infective/'),
    updated_at = now()
WHERE topic = 'Ophthalmology'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Paediatrics
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/feverish-children-risk-assessment/'),
    updated_at = now()
WHERE topic = 'Paediatrics'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Palliative Care
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/palliative-care-general-issues/'),
    updated_at = now()
WHERE topic = 'Palliative Care'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Prescribing
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://bnf.nice.org.uk/'),
    updated_at = now()
WHERE topic = 'Prescribing'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Primary Care Organisation & Management
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://www.nice.org.uk/about/nice-communities/nice-and-the-nhs'),
    updated_at = now()
WHERE topic = 'Primary Care Organisation & Management'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Renal
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/chronic-kidney-disease/'),
    updated_at = now()
WHERE topic = 'Renal'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Respiratory
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/asthma/'),
    updated_at = now()
WHERE topic = 'Respiratory'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Sexual Health
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/chlamydia-uncomplicated-genital/'),
    updated_at = now()
WHERE topic = 'Sexual Health'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Surgery
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/hernia-inguinal/'),
    updated_at = now()
WHERE topic = 'Surgery'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');

-- Women's Health
UPDATE akt_questions
SET guideline_refs = array_append(guideline_refs, 'https://cks.nice.org.uk/topics/contraception-assessment/'),
    updated_at = now()
WHERE topic = 'Women''s Health'
  AND published = true
  AND NOT (array_to_string(coalesce(guideline_refs, ARRAY[]::text[]), ' ') ~* 'https?://');
