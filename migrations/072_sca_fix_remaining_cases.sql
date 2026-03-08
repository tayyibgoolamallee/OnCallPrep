-- Migration 072: Fix remaining cases with 1-2 issues

-- =============================================
-- Cases with 2 issues (specific domain fixes)
-- =============================================

-- Abdominal Pain Consultation (GI-004) - Domain 1 and Domain 2 under 5 items
UPDATE sca_cases SET marking_criteria = jsonb_set(
  jsonb_set(
    marking_criteria,
    '{domain1}',
    '{"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored abdominal pain systematically (SOCRATES: site, onset, character, radiation, associations, timing, exacerbating/relieving, severity)", "Asked about associated GI symptoms (nausea, vomiting, change in bowel habit, blood in stool)", "Screened for red flags (weight loss, PR bleeding, iron deficiency, night sweats)", "Assessed urinary and gynaecological symptoms if relevant", "Explored dietary factors, medications (NSAIDs), and alcohol", "Explored ICE (concern about serious disease, impact on daily life)", "Completed data gathering within approximately 6 minutes", "Consultation was structured and thorough"]}'::jsonb
  ),
  '{domain2}',
  '{"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Formulated appropriate differential diagnosis based on findings", "Arranged appropriate investigations (bloods, stool tests, imaging)", "Applied 2-week wait criteria if red flags present (NICE NG12)", "Prescribed appropriate symptom management", "Discussed dietary and lifestyle modifications", "Made appropriate referral if indicated", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making"]}'::jsonb
) WHERE id = '2c821d75-9e5f-408a-89c7-c7aa1fa2eca1';

-- Health Visitor - Infant Feeding (PAED-003) - Domain 1 and Domain 3 under 5 items
UPDATE sca_cases SET marking_criteria = jsonb_set(
  jsonb_set(
    marking_criteria,
    '{domain1}',
    '{"title": "Domain 1: Data Gathering & Interpretation", "items": ["Clarified the health visitor''s specific concerns about the infant", "Asked about current feeding method (breast/formula/mixed) and volumes", "Explored growth trajectory and weight concerns", "Asked about feeding difficulties (poor latch, vomiting, reflux, tongue-tie)", "Assessed for dehydration signs or red flags", "Explored maternal wellbeing and support", "Communication was professional and collaborative", "Gathered information efficiently"]}'::jsonb
  ),
  '{domain3}',
  '{"title": "Domain 3: Relating to Others", "items": ["Was polite and professional with the health visitor", "Demonstrated collaborative working and valued the HV''s input", "Used appropriate clinical language", "Showed concern for both infant and mother", "Maintained confidentiality appropriately", "Confirmed the plan and next steps clearly"]}'::jsonb
) WHERE id = '2e70b31b-443d-44ab-b117-5cf939e46714';

-- Itching Consultation (DERM-003) - Domain 1 and Domain 2 under 5 items
UPDATE sca_cases SET marking_criteria = jsonb_set(
  jsonb_set(
    marking_criteria,
    '{domain1}',
    '{"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the itch in detail (onset, location, severity, timing, aggravating factors)", "Asked about associated rash or skin changes", "Screened for systemic causes (jaundice, thyroid, renal, lymphoma, iron deficiency)", "Asked about new medications, detergents, or exposures", "Explored psychosocial impact (sleep, work, mood)", "Explored ICE (concern about the cause, impact on daily life)", "Completed data gathering within approximately 6 minutes", "Consultation was well-structured"]}'::jsonb
  ),
  '{domain2}',
  '{"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Generated appropriate differential diagnosis (dermatological vs systemic)", "Arranged relevant investigations if systemic cause suspected (LFTs, TFTs, FBC, ferritin, renal)", "Prescribed appropriate treatment (antihistamines, emollients, topical therapy)", "Addressed skin care advice (avoid irritants, cool baths, moisturise)", "Made appropriate referral if diagnosis unclear or refractory", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making"]}'::jsonb
) WHERE id = 'bcf5d9d1-3ef6-4f5d-80b8-4ebfd9a9f723';

-- Recurrent Abdominal Pain (GI-005) - Domain 1 and Domain 2 under 5 items
UPDATE sca_cases SET marking_criteria = jsonb_set(
  jsonb_set(
    marking_criteria,
    '{domain1}',
    '{"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the pattern of recurrent abdominal pain (frequency, duration, triggers, character)", "Asked about associated GI symptoms (change in bowel habit, bloating, blood, mucus)", "Screened for red flags (weight loss, nocturnal symptoms, PR bleeding, family history of GI cancer)", "Explored dietary factors (fibre, lactose, gluten, FODMAPs)", "Assessed psychosocial factors (stress, anxiety, IBS link)", "Explored ICE (concern about serious disease, impact on quality of life)", "Completed data gathering within approximately 6 minutes", "Consultation was thorough and empathetic"]}'::jsonb
  ),
  '{domain2}',
  '{"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Generated appropriate differential (IBS, coeliac, IBD, functional)", "Applied NICE guidelines for IBS diagnosis if appropriate", "Arranged targeted investigations (coeliac screen, bloods, faecal calprotectin)", "Discussed dietary modifications (fibre, FODMAP, exclusion diets)", "Considered referral if red flags or refractory symptoms", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making"]}'::jsonb
) WHERE id = '7151023a-9f12-41c7-b994-9f13d13694d0';

-- =============================================
-- Cases with 1 issue (targeted fixes)
-- =============================================

-- Advance Care Planning Discussion (ETH-002) - Domain 2 under 5 items
UPDATE sca_cases SET marking_criteria = jsonb_set(
  marking_criteria,
  '{domain2}',
  '{"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Discussed advance care planning sensitively and at the patient''s pace", "Explored treatment preferences (resuscitation, hospital admission, escalation)", "Discussed preferred place of care and death", "Considered and discussed advance decisions to refuse treatment (ADRT)", "Discussed lasting power of attorney for health and welfare", "Ensured documentation and sharing of advance care plan (GP record, ambulance service)", "Engaged the patient and any family members in shared decision-making"]}'::jsonb
) WHERE id = 'c3bda4ba-5c15-4e5c-9352-d717aa2a590e';

-- Child Protection Concerns (SAF-002) - Domain 3 under 5 items
UPDATE sca_cases SET marking_criteria = jsonb_set(
  marking_criteria,
  '{domain3}',
  '{"title": "Domain 3: Relating to Others", "items": ["Was polite and professional throughout", "Maintained a non-judgemental approach", "Demonstrated understanding of safeguarding responsibilities", "Handled sensitive disclosures with appropriate gravity", "Balanced empathy with professional boundaries", "Confirmed the plan and next steps clearly"]}'::jsonb
) WHERE id = '93b61da5-c123-47ea-99c7-db2471d43a1d';

-- Epilepsy Medication Review (NEURO-002) - Domain 2 under 5 items
UPDATE sca_cases SET marking_criteria = jsonb_set(
  marking_criteria,
  '{domain2}',
  '{"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Reviewed current AED regimen and seizure control", "Assessed medication adherence and side effects", "Discussed AED blood level monitoring if appropriate", "Reviewed driving restrictions and DVLA requirements", "Discussed contraception and pregnancy planning in women of childbearing age (sodium valproate PPP)", "Considered referral to epilepsy specialist nurse or neurology if poorly controlled", "Provided specific safety-netting (status epilepticus, prolonged seizures, midazolam use)", "Engaged the patient in shared decision-making"]}'::jsonb
) WHERE id = 'ff2bbe21-1c69-4a74-8eda-4ebef164c6dd';

-- LEARNING-001: Health Check Adjustment - ICE missing from actor_info
UPDATE sca_cases SET actor_info = jsonb_set(
  COALESCE(actor_info, '{}'::jsonb),
  '{ice}',
  '{"ideas": "You think the health check might find something wrong and you are not sure what they are checking for.", "concerns": "You are worried about having blood taken because you do not like needles. You are also worried about being told you need to change things you enjoy, like your favourite foods.", "expectations": "You would like the doctor to explain everything clearly and in simple language. You want to feel comfortable and not rushed."}'::jsonb
) WHERE id = 'fb5912e0-11c5-44ad-96de-70457331743d';

-- Prescription Request (GP-003) - Domain 3 under 5 items
UPDATE sca_cases SET marking_criteria = jsonb_set(
  marking_criteria,
  '{domain3}',
  '{"title": "Domain 3: Relating to Others", "items": ["Was polite and professional throughout", "Demonstrated clear and efficient communication", "Explained any changes to the prescription clearly", "Addressed any questions or concerns from the caller", "Maintained patient safety as a priority", "Confirmed the plan and next steps clearly"]}'::jsonb
) WHERE id = '16ea0bfc-6b87-4888-9a49-dd87c05738c9';

-- STI Results Discussion (SH-001) - Domain 1 under 5 items
UPDATE sca_cases SET marking_criteria = jsonb_set(
  marking_criteria,
  '{domain1}',
  '{"title": "Domain 1: Data Gathering & Interpretation", "items": ["Confirmed the patient''s identity and right to receive results", "Delivered the results clearly and sensitively", "Explored current symptoms (discharge, pain, lesions)", "Took a focused sexual history (recent partners, condom use, other STI risk)", "Asked about partner notification and treatment", "Explored ICE (fears about the diagnosis, concern about telling partner, stigma)", "Completed data gathering within approximately 6 minutes", "Consultation was sensitive and non-judgemental"]}'::jsonb
) WHERE id = 'bb77bb1b-46e9-4f2e-9387-5248cfc67adb';
