-- Migration 066: SCA Bulk Quality Fixes
-- Applies universal fixes across all published SCA cases:
--   1. Strip "You are a GP" / "You are a GP trainee" from scenarios
--   2. Remove revealing social_summary and family_summary from case_notes
--   3. Ensure all full cases without marking_criteria get the default criteria

-- =============================================
-- 1. Remove "You are a GP" variants from all scenarios
-- =============================================
UPDATE sca_cases
SET scenario = REGEXP_REPLACE(
  scenario,
  'You are a GP trainee[^.]*\.\s*',
  '',
  'gi'
)
WHERE published = true
  AND scenario ~* 'you are a gp trainee';

UPDATE sca_cases
SET scenario = REGEXP_REPLACE(
  scenario,
  'You are a GP\.\s*',
  '',
  'gi'
)
WHERE published = true
  AND scenario ~* 'you are a gp\.';

UPDATE sca_cases
SET scenario = REGEXP_REPLACE(
  scenario,
  'You are a GP\s',
  '',
  'gi'
)
WHERE published = true
  AND scenario ~* 'you are a gp\s';

UPDATE sca_cases
SET scenario = REGEXP_REPLACE(
  scenario,
  'You are a general practitioner[^.]*\.\s*',
  '',
  'gi'
)
WHERE published = true
  AND scenario ~* 'you are a general practitioner';

-- =============================================
-- 2. Remove revealing social_summary from case_notes
-- =============================================
UPDATE sca_cases
SET case_notes = case_notes - 'social_summary'
WHERE published = true
  AND case_type = 'full'
  AND case_notes IS NOT NULL
  AND case_notes::text <> 'null'
  AND case_notes->>'social_summary' IS NOT NULL
  AND case_notes->>'social_summary' <> ''
  AND case_notes->>'social_summary' <> 'None'
  AND case_notes->>'social_summary' <> 'N/A';

-- =============================================
-- 3. Remove revealing family_summary from case_notes
-- =============================================
UPDATE sca_cases
SET case_notes = case_notes - 'family_summary'
WHERE published = true
  AND case_type = 'full'
  AND case_notes IS NOT NULL
  AND case_notes::text <> 'null'
  AND case_notes->>'family_summary' IS NOT NULL
  AND case_notes->>'family_summary' <> ''
  AND case_notes->>'family_summary' <> 'None'
  AND case_notes->>'family_summary' <> 'N/A';

-- =============================================
-- 4. Remove presenting_complaint from patient_info
--    (candidates should elicit this themselves)
-- =============================================
UPDATE sca_cases
SET patient_info = patient_info - 'presenting_complaint'
WHERE published = true
  AND case_type = 'full'
  AND patient_info IS NOT NULL
  AND patient_info->>'presenting_complaint' IS NOT NULL;

-- =============================================
-- 5. Set default marking_criteria for full cases missing it
-- =============================================
UPDATE sca_cases
SET marking_criteria = '{
  "domain1": {
    "title": "Domain 1: Data Gathering & Interpretation",
    "items": [
      "Explored the presenting complaint in appropriate detail",
      "Gathered relevant secondary history (PMH, medications, allergies)",
      "Screened for relevant red flags specific to this case",
      "Explored ideas, concerns, and expectations (ICE)",
      "Completed data gathering within approximately 6 minutes",
      "Summarised the clinical history clearly",
      "Maintained a comfortable pace throughout",
      "Consultation had clear direction and structure"
    ]
  },
  "domain2": {
    "title": "Domain 2: Clinical Management (Weighted 1.5x)",
    "items": [
      "Provided a provisional or suspected diagnosis",
      "Incorporated ICE into the management plan",
      "Offered specific and appropriate clinical management",
      "Provided opportunistic or promotional health advice where relevant",
      "Was mindful of holistic, social, or non-medical issues",
      "Demonstrated up-to-date clinical knowledge",
      "Used investigations appropriately and explained their relevance",
      "Made appropriate use of services (referral, A&G, community)",
      "Engaged the patient in shared decision-making",
      "Provided specific and clear safety-netting advice"
    ]
  },
  "domain3": {
    "title": "Domain 3: Relating to Others",
    "items": [
      "Was polite and respectful throughout",
      "Avoided inappropriate gestures, facial expressions, or remarks",
      "Signposted before asking sensitive questions",
      "Contextualised symptoms to the patient and diagnosis",
      "Allowed the patient to make their own decisions",
      "Asked the patient to confirm the plan and next steps"
    ]
  }
}'::jsonb
WHERE published = true
  AND case_type = 'full'
  AND (marking_criteria IS NULL OR marking_criteria::text = '{}' OR marking_criteria::text = 'null');
