-- Migration 071: Fix marking criteria for comprehensive cases (3 issues = all 3 domains under 5 items)
-- These cases have good content but their marking criteria need expanding to minimum 5 per domain

-- =============================================
-- Allergy Reaction (ALL-001)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the allergic reaction in detail (timing, trigger, symptoms, severity)", "Assessed for features of anaphylaxis (airway, breathing, circulation)", "Asked about previous allergic reactions and known allergies", "Explored medication history and recent new exposures", "Explored atopic history (eczema, asthma, hay fever)", "Explored ICE (fear of recurrence, concern about severity)", "Completed data gathering within approximately 6 minutes", "Consultation was structured and thorough"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Prescribed appropriate treatment (antihistamines, consider EpiPen)", "Discussed adrenaline auto-injector if anaphylaxis risk", "Made appropriate allergy clinic referral for testing", "Provided an allergy action plan", "Advised on allergen avoidance strategies", "Provided specific safety-netting (999 if throat swelling, breathing difficulty)", "Engaged the patient in shared decision-making"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Acknowledged the frightening nature of the reaction", "Explained the management plan clearly", "Used accessible language", "Allowed the patient to express their fears", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = 'a4a4bddf-d820-49f5-b148-e7001bb0abc2';

-- =============================================
-- Breathlessness (RESP-002)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored breathlessness systematically (onset, duration, severity, exertional vs rest)", "Asked about associated symptoms (cough, wheeze, chest pain, ankle swelling)", "Screened for red flags (acute onset, haemoptysis, pleuritic pain)", "Assessed exercise tolerance and MRC dyspnoea scale", "Explored cardiac and respiratory history", "Explored ICE (concern about lung disease, impact on daily life)", "Completed data gathering within approximately 6 minutes", "Consultation was well-structured"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Formulated appropriate differential diagnosis", "Arranged appropriate investigations (CXR, spirometry, bloods, ECG)", "Managed acutely if needed (oxygen, nebuliser, admission)", "Discussed the likely diagnosis and next steps", "Made appropriate referral if indicated", "Provided specific safety-netting (999 if worsening breathlessness)", "Engaged the patient in shared decision-making"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Acknowledged the impact of breathlessness on quality of life", "Used clear and reassuring language", "Explained investigations and their purpose", "Allowed the patient to express their concerns", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = '9ab25b18-34f4-4a81-a74b-173045f003dd';

-- =============================================
-- Breathlessness (RESP-005)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored breathlessness in detail (onset, progression, severity, triggers)", "Assessed associated respiratory symptoms (cough, sputum, wheeze, haemoptysis)", "Screened for cardiac causes (orthopnoea, PND, ankle swelling)", "Explored smoking history and occupational exposures", "Assessed functional impact and exercise tolerance", "Explored ICE (fears about diagnosis, impact on independence)", "Completed data gathering within approximately 6 minutes", "Consultation was systematic and thorough"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Generated appropriate differential diagnosis", "Arranged relevant investigations (spirometry, CXR, bloods, BNP)", "Applied NICE guidelines for the suspected diagnosis", "Offered appropriate initial treatment", "Discussed lifestyle modifications (smoking cessation, exercise)", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Addressed the patient''s fears about their diagnosis empathetically", "Used clear and jargon-free language", "Explained the investigation process step by step", "Allowed the patient to express concerns", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = 'fd9a88c4-0090-49ea-9e3d-b3192fbbf6bf';

-- =============================================
-- Follow-up After Discharge (GP-005)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Reviewed the hospital admission details and discharge summary", "Asked about current symptoms and recovery", "Checked medication changes made during admission", "Assessed understanding of new diagnoses or findings", "Explored follow-up requirements from discharge letter", "Explored ICE (concerns about going home, fears about recurrence)", "Completed data gathering within approximately 6 minutes", "Consultation was structured around discharge needs"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Reconciled medications appropriately (new, changed, stopped)", "Arranged follow-up investigations as per discharge plan", "Made appropriate referrals flagged in discharge letter", "Addressed any unresolved issues from the admission", "Provided clear sick note if needed", "Provided specific safety-netting for readmission indicators", "Engaged the patient in shared decision-making about ongoing care"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Acknowledged the patient''s experience of hospitalisation", "Checked understanding of the discharge plan", "Used clear language when explaining medication changes", "Allowed the patient to express any ongoing concerns", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = '600a1cd9-682f-4ddf-b9a6-b8ea2bbf63b7';

-- =============================================
-- Headache (NEUR-001)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored headache characteristics (location, character, duration, severity, frequency)", "Screened for red flag features (thunderclap, new >50, progressive, with fever, papilloedema)", "Assessed for migraine features (aura, nausea, photophobia)", "Asked about medication overuse (analgesics ≥15 days/month, triptans ≥10 days/month)", "Explored triggers and aggravating/relieving factors", "Explored ICE (concern about brain tumour, impact on daily life)", "Completed data gathering within approximately 6 minutes", "Consultation was systematic and thorough"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Formulated appropriate diagnosis (tension-type, migraine, cluster, medication overuse)", "Prescribed appropriate acute treatment for the headache type", "Considered prophylaxis if frequent or disabling", "Addressed medication overuse if present", "Explained when imaging is and is not indicated per NICE CG150", "Provided specific safety-netting (thunderclap, new neurological symptoms)", "Engaged the patient in shared decision-making"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Addressed the patient''s brain tumour concern sensitively", "Provided reassurance without being dismissive of symptoms", "Used clear and accessible language", "Allowed the patient to express their concerns", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = '3fab7bad-8b08-4ad5-be78-adabb9108c3d';

-- =============================================
-- Hospice Nurse - Medication Review (PC-002)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Clarified the reason for the medication review request", "Gathered current medication list and recent changes", "Assessed current symptom burden (pain, nausea, breathlessness, agitation)", "Asked about patient''s current functional status and prognosis understanding", "Explored any medication side effects or interactions", "Explored the hospice nurse''s specific concerns and observations", "Maintained professional communication with the nurse", "Gathered relevant clinical information efficiently"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Rationalised medications appropriately (deprescribing non-essential)", "Ensured adequate symptom control (pain, nausea, secretions, agitation)", "Prescribed anticipatory medications appropriately (just-in-case box)", "Considered route of administration changes if swallowing difficulty", "Discussed ceiling of treatment and escalation decisions", "Provided clear safety-netting and review plan", "Engaged the nurse in shared decision-making about the care plan"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful to the hospice nurse", "Demonstrated collaborative working with the MDT", "Listened to the nurse''s clinical observations and concerns", "Used appropriate clinical language with a fellow professional", "Was supportive of the nursing team''s role", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = 'd181b595-b20a-4a29-a08a-e861aecba6a8';

-- =============================================
-- NOK - Spouse Capacity Concern (GER-004)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the spouse''s specific concerns about capacity", "Asked about changes in cognition, behaviour, and function", "Gathered information about safety concerns (finances, driving, wandering)", "Asked about the patient''s current support and care arrangements", "Explored the impact on the carer/spouse", "Explored the spouse''s ICE (fears about the future, guilt, expectations)", "Addressed confidentiality considerations sensitively", "Consultation was empathetic and well-structured"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Discussed the need for formal capacity assessment (Mental Capacity Act)", "Explained that capacity is decision-specific and time-specific", "Offered to arrange a cognitive assessment (GP cognitive screen, memory clinic referral)", "Discussed safeguarding if safety concerns identified", "Discussed power of attorney and advance care planning", "Signposted to carer support services (Carers UK, local carers'' hub)", "Provided specific safety-netting and follow-up plan", "Engaged the spouse in shared decision-making"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful to the spouse", "Handled a distressing topic with empathy and sensitivity", "Balanced the patient''s autonomy with the spouse''s concerns", "Explained confidentiality boundaries clearly", "Allowed the spouse to express their fears and frustrations", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = 'b1e16892-ddb4-4dbb-ba4d-3934b4837cea';

-- =============================================
-- OOH Doctor - Handover (GP-006)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Gathered essential handover information (patient details, presentation, assessment)", "Asked about investigations done and results", "Clarified what treatment has been given", "Established what follow-up is needed and urgency", "Asked about the patient''s response to treatment", "Clarified any outstanding safety concerns", "Communication was efficient and structured (SBAR/ISBAR)", "Gathered information within the time available"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Formulated an appropriate follow-up plan based on the handover", "Identified any urgent actions needed", "Arranged appropriate next-day follow-up or review", "Updated the patient record accurately", "Considered medication reconciliation", "Provided appropriate safety-netting plan for the patient", "Demonstrated safe handover practice"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and professional with the OOH colleague", "Listened actively to the handover information", "Asked clarifying questions appropriately", "Demonstrated collaborative working", "Acknowledged the OOH doctor''s management", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = 'eae14ef6-64fa-435f-90a8-944466630c77';

-- =============================================
-- Pharmacist - Medication Query (GP-004)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Clarified the specific medication query from the pharmacist", "Reviewed the patient''s medication record", "Assessed the clinical indication for the medication", "Checked for drug interactions or contraindications", "Asked about any patient-reported concerns relayed by the pharmacist", "Gathered relevant clinical context (allergies, renal function, recent changes)", "Communication was professional and efficient", "Gathered information within appropriate time"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Resolved the medication query appropriately", "Made a safe prescribing decision", "Considered alternative medications if current one problematic", "Updated the patient record with the decision", "Discussed monitoring requirements if relevant", "Provided clear communication back to the pharmacist", "Demonstrated safe prescribing practice"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and professional with the pharmacist", "Demonstrated respect for the pharmacist''s clinical expertise", "Listened to the pharmacist''s concerns", "Explained the clinical reasoning for the decision", "Engaged in collaborative decision-making", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = '2b003570-e304-423d-9db5-ec48e8b4c093';

-- =============================================
-- Request for Sick Note (GP-007)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the reason for the sick note request", "Assessed the patient''s current symptoms and functional limitations", "Asked about the nature of their work and duties", "Explored underlying issues (stress, bullying, mental health)", "Asked about duration already off work and previous sick leave", "Explored ICE (what they hope the note will achieve, fears about job)", "Completed data gathering within approximately 6 minutes", "Consultation was non-judgemental and empathetic"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Understood the fit note system (not fit vs may be fit with adjustments)", "Considered workplace adjustments before certifying as unfit", "Issued appropriate duration certification", "Addressed underlying health conditions alongside certification", "Signposted to occupational health or ACAS if workplace issues", "Provided specific safety-netting and follow-up plan", "Engaged the patient in shared decision-making about return to work"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Avoided being dismissive or judgemental of the request", "Showed understanding of the patient''s work situation", "Used clear and supportive language", "Allowed the patient to express their concerns", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = 'b222f866-627a-431f-894b-20977731fefd';

-- =============================================
-- School Nurse - Asthma Concern (PAED-004)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Clarified the school nurse''s specific concerns about the child", "Asked about symptoms observed at school (wheeze, cough, breathlessness, exercise limitation)", "Gathered information about reliever inhaler use at school", "Asked about triggers at school (PE, cold air, allergens)", "Explored whether parents are aware of concerns", "Clarified current asthma management plan", "Communication was professional and collaborative", "Gathered information efficiently"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Reviewed the child''s current asthma management", "Considered stepping up treatment if poorly controlled", "Updated or provided a school asthma action plan", "Discussed the need to review inhaler technique", "Arranged a clinic review with parent and child", "Provided clear safety-netting about emergency symptoms", "Engaged the nurse in collaborative care planning"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and professional with the school nurse", "Valued the nurse''s observations and concerns", "Demonstrated collaborative working across settings", "Used appropriate clinical language", "Maintained confidentiality appropriately", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = '2e13b7bf-9c90-4dbf-9f34-6ad45c2948d9';

-- =============================================
-- School Nurse - Asthma Concern (PAED-007)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Clarified the school nurse''s concerns about the child''s asthma", "Asked about frequency and severity of symptoms at school", "Gathered information about current medication use and technique", "Explored triggers identified at school", "Asked about school absences due to asthma", "Explored parental engagement and awareness", "Communication was professional", "Gathered information within appropriate time"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Reviewed current asthma treatment and considered optimisation", "Discussed updating the asthma action plan for school", "Arranged a comprehensive asthma review with the child and parent", "Considered environmental factors at school", "Discussed emergency medication access at school", "Provided clear safety-netting about when to call 999", "Engaged the nurse in collaborative care"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and professional with the school nurse", "Demonstrated appreciation for the nurse''s role in monitoring", "Collaborated effectively across healthcare settings", "Maintained appropriate confidentiality", "Used clear communication", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = 'be2ca209-737f-4132-ae1e-4dd4f0774eab';

-- =============================================
-- Skin Rash - Child (DERM-002)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the rash in detail (onset, distribution, evolution, itch)", "Asked about blanching vs non-blanching (glass test)", "Assessed for systemic symptoms (fever, coryzal, malaise)", "Asked about recent illness contacts and nursery/school attendance", "Explored atopic history (eczema, asthma, food allergies)", "Explored ICE (parent''s concern about the rash, worry about infection)", "Checked vaccination history", "Consultation was well-structured"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made an appropriate working diagnosis", "Identified when urgent assessment is needed (non-blanching rash + fever)", "Prescribed appropriate treatment for the diagnosis", "Educated the parent on the glass test", "Advised on school/nursery exclusion if appropriate", "Provided specific safety-netting for the parent", "Engaged the parent in shared decision-making"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful to the parent", "Acknowledged parental anxiety", "Used clear jargon-free language", "Demonstrated warmth towards the child", "Allowed the parent to ask questions", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = '343a93a4-1273-41ca-8249-8a6170dc8a16';

-- =============================================
-- Skin Rash - Child (DERM-003)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored rash characteristics comprehensively (morphology, distribution, evolution)", "Asked about associated symptoms (itch, pain, systemic features)", "Screened for serious causes (non-blanching, fever, unwell child)", "Explored triggers and exacerbating factors", "Asked about atopic history and family history", "Explored ICE (parent''s concerns, impact on child''s wellbeing)", "Completed data gathering within approximately 6 minutes", "Consultation was thorough and child-centred"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Formulated appropriate differential diagnosis", "Prescribed appropriate treatment", "Discussed skin care and emollient use if eczema", "Advised on nursery/school exclusion if infectious", "Considered allergy referral if indicated", "Provided specific safety-netting advice", "Engaged the parent in shared decision-making"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Communicated sensitively with the parent", "Used clear and reassuring language", "Demonstrated care for the child''s comfort", "Allowed the parent to express concerns", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = 'ef8ef18e-fec9-4d9f-9d29-ed99b7867f97';

-- =============================================
-- Social Worker - Safeguarding (SG-001)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Clarified the safeguarding concern raised by the social worker", "Gathered relevant clinical information about the patient/child", "Asked about the nature and evidence of concern (physical, emotional, neglect, sexual)", "Explored any previous safeguarding alerts or concerns", "Asked about the current living situation and support", "Explored the social worker''s specific request of the GP", "Maintained professional communication", "Handled sensitive information appropriately"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Followed local safeguarding procedures", "Provided appropriate clinical information within confidentiality boundaries", "Discussed the need for a safeguarding referral or MARAC/MASH involvement", "Offered to examine the patient if clinically indicated", "Documented the conversation and actions taken", "Considered the patient''s safety as the primary concern", "Engaged in collaborative safeguarding practice with the social worker"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and professional with the social worker", "Demonstrated understanding of safeguarding responsibilities", "Listened carefully to the social worker''s concerns", "Balanced confidentiality with duty to protect", "Demonstrated collaborative multi-agency working", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = 'a7bdc0ef-2c20-43cc-906c-a3b8290dba04';

-- =============================================
-- Urinary Symptoms (URO-001)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored urinary symptoms in detail (frequency, urgency, nocturia, hesitancy, poor stream)", "Distinguished between storage and voiding symptoms", "Asked about associated symptoms (haematuria, pain, discharge)", "Screened for red flags (haematuria, weight loss, bone pain)", "Assessed impact on quality of life (IPSS score if prostate)", "Explored ICE (concern about prostate cancer, impact on sleep)", "Completed data gathering within approximately 6 minutes", "Consultation was thorough and sensitive"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Formulated appropriate differential (BPH, UTI, prostate cancer, OAB)", "Arranged appropriate investigations (urine dipstick, PSA discussion, flow rate)", "Discussed PSA testing with informed consent (benefits and limitations)", "Prescribed appropriate initial management", "Made appropriate referral if indicated (urology)", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the sensitive topic with tact", "Addressed cancer concerns sensitively", "Used clear and accessible language", "Allowed the patient to express their concerns", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = 'd60bacc6-5b30-4bfb-b68e-fff28bbfb597';

-- =============================================
-- Urinary Symptoms (URO-003)
-- =============================================
UPDATE sca_cases SET marking_criteria = '{
  "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored urinary symptoms comprehensively", "Differentiated storage from voiding symptoms", "Screened for red flag symptoms (visible haematuria, weight loss)", "Asked about impact on daily life and sleep", "Explored previous investigations and treatments", "Explored ICE (fears about cancer, impact on lifestyle)", "Completed data gathering within approximately 6 minutes", "Consultation was well-structured and sensitive"]},
  "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Generated appropriate differential diagnosis", "Arranged relevant investigations (dipstick, bloods, PSA with consent)", "Discussed PSA testing appropriately (informed choice)", "Offered appropriate first-line management", "Made appropriate referral if needed", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making"]},
  "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the sensitive topic appropriately", "Addressed the patient''s fears with empathy", "Used clear language", "Allowed the patient to express concerns", "Confirmed the plan and next steps clearly"]}
}'::jsonb WHERE id = '77493215-da2d-4e86-a7ef-c7ec9ddbaefe';
