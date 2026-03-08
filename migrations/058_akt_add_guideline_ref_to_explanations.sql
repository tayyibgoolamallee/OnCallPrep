-- Migration 058: Append guideline reference text to explanations.
-- Fixes ~400 questions flagged with "No link in explanation text".
-- Appends a topic-appropriate reference line to the end of the explanation
-- ONLY for questions that don't already mention a recognised guideline.
-- Safe to re-run (WHERE clause prevents double-appending).

-- Allergy
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Anaphylaxis — https://cks.nice.org.uk/topics/angio-oedema-and-anaphylaxis/',
    updated_at = now()
WHERE topic = 'Allergy' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Allergy & Immunology
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Allergic Rhinitis — https://cks.nice.org.uk/topics/allergic-rhinitis/',
    updated_at = now()
WHERE topic = 'Allergy & Immunology' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Cardiovascular
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS CVD Risk Assessment — https://cks.nice.org.uk/topics/cvd-risk-assessment-and-management/',
    updated_at = now()
WHERE topic = 'Cardiovascular' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Dermatology
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Dermatology topics — https://cks.nice.org.uk/specialities/dermatology/',
    updated_at = now()
WHERE topic = 'Dermatology' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- ENT
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS ENT topics — https://cks.nice.org.uk/specialities/ear-nose-and-throat/',
    updated_at = now()
WHERE topic = 'ENT' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Endocrinology
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Endocrinology topics — https://cks.nice.org.uk/specialities/endocrinology/',
    updated_at = now()
WHERE topic = 'Endocrinology' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Evidence-Based Practice
UPDATE akt_questions
SET explanation = explanation || ' Reference: RCGP AKT Content Guide — https://www.rcgp.org.uk/mrcgp-exams/applied-knowledge-test',
    updated_at = now()
WHERE topic = 'Evidence-Based Practice' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Gastroenterology
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Gastroenterology topics — https://cks.nice.org.uk/specialities/gastroenterology-and-hepatology/',
    updated_at = now()
WHERE topic = 'Gastroenterology' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Geriatrics
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Older Adults — https://cks.nice.org.uk/specialities/older-adults/',
    updated_at = now()
WHERE topic = 'Geriatrics' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Haematology
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Haematology topics — https://cks.nice.org.uk/specialities/haematology/',
    updated_at = now()
WHERE topic = 'Haematology' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Infectious Diseases
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Infections — https://cks.nice.org.uk/specialities/infections/',
    updated_at = now()
WHERE topic = 'Infectious Diseases' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Mental Health
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Mental Health — https://cks.nice.org.uk/specialities/mental-health/',
    updated_at = now()
WHERE topic = 'Mental Health' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Musculoskeletal
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Musculoskeletal — https://cks.nice.org.uk/specialities/musculoskeletal/',
    updated_at = now()
WHERE topic = 'Musculoskeletal' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Neurology
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Neurology — https://cks.nice.org.uk/specialities/neurology/',
    updated_at = now()
WHERE topic = 'Neurology' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Oncology
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE NG12 Suspected Cancer — https://www.nice.org.uk/guidance/ng12',
    updated_at = now()
WHERE topic = 'Oncology' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Ophthalmology
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Ophthalmology — https://cks.nice.org.uk/specialities/ophthalmology/',
    updated_at = now()
WHERE topic = 'Ophthalmology' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Paediatrics
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Paediatrics — https://cks.nice.org.uk/specialities/child-health/',
    updated_at = now()
WHERE topic = 'Paediatrics' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Palliative Care
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE NG31 Care of Dying Adults — https://www.nice.org.uk/guidance/ng31',
    updated_at = now()
WHERE topic = 'Palliative Care' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Prescribing
UPDATE akt_questions
SET explanation = explanation || ' Reference: BNF — https://bnf.nice.org.uk/',
    updated_at = now()
WHERE topic = 'Prescribing' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Primary Care Organisation & Management
UPDATE akt_questions
SET explanation = explanation || ' Reference: GMC Good Medical Practice — https://www.gmc-uk.org/ethical-guidance/ethical-guidance-for-doctors/good-medical-practice',
    updated_at = now()
WHERE topic = 'Primary Care Organisation & Management' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Renal
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Renal/Urology — https://cks.nice.org.uk/specialities/renal-medicine-and-urology/',
    updated_at = now()
WHERE topic = 'Renal' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Respiratory
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Respiratory — https://cks.nice.org.uk/specialities/respiratory/',
    updated_at = now()
WHERE topic = 'Respiratory' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Sexual Health
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Sexual Health — https://cks.nice.org.uk/specialities/sexual-health/',
    updated_at = now()
WHERE topic = 'Sexual Health' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Surgery
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Surgical topics — https://cks.nice.org.uk/specialities/surgery/',
    updated_at = now()
WHERE topic = 'Surgery' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Women's Health
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS Women''s Health — https://cks.nice.org.uk/specialities/womens-health/',
    updated_at = now()
WHERE topic = 'Women''s Health' AND published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');

-- Catch-all: any other topic not listed above
UPDATE akt_questions
SET explanation = explanation || ' Reference: NICE CKS — https://cks.nice.org.uk/',
    updated_at = now()
WHERE published = true
  AND NOT (explanation ~* 'https?://')
  AND NOT (explanation ~* 'nice\s+(cks|ng|cg|qs|ta|dg)')
  AND NOT (explanation ~* 'bts|sign|bnf|rcgp|bmj|who|bhiva');
