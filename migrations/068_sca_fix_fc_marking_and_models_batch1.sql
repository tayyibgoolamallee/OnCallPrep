-- Migration 068: Fix marking criteria and model answers for FC-xxx cases (batch 1: FC-001 to FC-021)
-- These cases have 4 issues: all 3 domains under 5 items + model answer too short

-- =============================================
-- Joint Pain Multiple (FC-046) - marking + model
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of polyarthralgia, considering inflammatory vs mechanical causes, appropriate investigations, and holistic care.

**Data Gathering:**
- Pattern of joint involvement: small vs large joints, symmetry, morning stiffness duration
- Associated features: swelling, redness, warmth, skin changes (psoriasis), eye symptoms
- Systemic symptoms: fatigue, weight loss, fever
- Functional impact: work, daily activities, sleep
- PMH, FHx: autoimmune conditions, inflammatory arthritis

**Clinical Management:**
- If suspected inflammatory arthritis (morning stiffness >30 mins, joint swelling): urgent rheumatology referral (NICE NG100 - within 3 weeks of persistent synovitis)
- Bloods: FBC, ESR/CRP, RF, anti-CCP, ANA, urate
- X-rays of affected joints
- Interim analgesia while awaiting assessment
- Address psychological impact

**References:**
- NICE NG100: Rheumatoid arthritis - https://www.nice.org.uk/guidance/ng100
- NICE CKS: Rheumatoid arthritis - https://cks.nice.org.uk/topics/rheumatoid-arthritis/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the pattern of joint involvement (which joints, symmetry, timing)", "Asked about morning stiffness and its duration", "Screened for inflammatory features (swelling, warmth, redness)", "Asked about associated features (skin changes, eye symptoms, systemic symptoms)", "Explored the functional impact on work and daily life", "Explored ICE (worries about the future, impact on livelihood)", "Gathered relevant FHx (autoimmune conditions)", "Completed data gathering within approximately 6 minutes"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Formulated appropriate differential (inflammatory vs mechanical arthropathy)", "Arranged appropriate bloods (inflammatory markers, RF, anti-CCP)", "Recognised need for urgent rheumatology referral if inflammatory arthritis suspected", "Provided appropriate interim analgesia", "Addressed the impact on work and mental wellbeing", "Gave specific safety-netting advice", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Acknowledged the patient''s frustration and impact on quality of life", "Validated concerns about work and future", "Used clear language without jargon", "Allowed the patient to express concerns fully", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '83d743b9-3c96-4e37-a720-9de89913b561';

-- =============================================
-- Kidney Stone Follow-up (FC-047)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Follow-up management after renal colic, prevention strategies, metabolic workup, and appropriate referral.

**Data Gathering:**
- How the acute episode was managed (A&E, admission, self-managed)
- Current symptoms: residual pain, haematuria, urinary symptoms
- Stone analysis if done, imaging results
- Fluid intake, dietary habits, family history of stones
- PMH: recurrent UTIs, gout, hyperparathyroidism

**Clinical Management:**
- Review imaging/results and explain findings
- Lifestyle advice: increase fluid intake to 2.5-3L/day, reduce salt and animal protein
- If recurrent: metabolic workup (24hr urine collection, serum calcium, urate, PTH)
- Consider referral to urology if recurrent or large residual stones
- Dietary advice based on stone type if known

**References:**
- NICE NG118: Renal and ureteric stones - https://www.nice.org.uk/guidance/ng118
- NICE CKS: Renal colic - https://cks.nice.org.uk/topics/renal-or-ureteric-colic-acute/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Reviewed the acute episode in detail (when, how managed, imaging)", "Asked about current residual symptoms", "Explored fluid intake and dietary habits", "Asked about family history of renal stones", "Screened for underlying causes (gout, hyperparathyroidism, recurrent UTIs)", "Explored ICE (anxiety about recurrence, desire for prevention)", "Completed data gathering within approximately 6 minutes", "Consultation was well-structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Reviewed and explained imaging and investigation results", "Provided specific fluid intake advice (2.5-3L/day)", "Gave tailored dietary advice based on stone type", "Considered metabolic workup for recurrent stones", "Discussed referral to urology if appropriate", "Provided specific safety-netting (return if pain, haematuria, or fever)", "Engaged the patient in shared decision-making about prevention"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Acknowledged the patient''s anxiety about recurrence", "Explained investigations and results in accessible language", "Gave practical and achievable lifestyle advice", "Allowed the patient to ask questions", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '352423af-5798-4f76-b90b-a58325667281';

-- =============================================
-- Lump in Neck (FC-048)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of a neck lump, differentiation between benign and sinister causes, appropriate referral using 2-week wait criteria.

**Data Gathering:**
- Duration, size changes, location of the lump
- Associated symptoms: night sweats, weight loss, fever, fatigue
- ENT symptoms: voice changes, dysphagia, ear pain, sore throat
- Thyroid symptoms: heat/cold intolerance, tremor, weight changes
- PMH: previous lumps, thyroid disease, malignancy, smoking, alcohol

**Clinical Management:**
- Unexplained neck lump in adult: consider 2-week wait referral (NICE NG12)
- If thyroid nodule suspected: USS thyroid and TFTs
- If lymphadenopathy: consider FBC, ESR/CRP, LDH, film
- Persistent unexplained lymphadenopathy >3 weeks in adults: warrants investigation
- Safety-net: return if lump grows, new lumps, or B symptoms develop

**References:**
- NICE NG12: Suspected cancer - https://www.nice.org.uk/guidance/ng12
- NICE CKS: Neck lump - https://cks.nice.org.uk/topics/neck-lump/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the lump in detail (duration, size changes, location, consistency)", "Asked about B symptoms (night sweats, weight loss, fever)", "Screened for ENT symptoms (voice changes, dysphagia, ear pain)", "Considered thyroid-related symptoms", "Explored risk factors (smoking, alcohol, occupational exposures)", "Explored ICE (cancer fears, partner''s insistence to attend)", "Gathered relevant PMH and FHx", "Completed data gathering within approximately 6 minutes"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Formulated appropriate differential (reactive, thyroid, lymphoma, metastatic)", "Applied NICE NG12 criteria correctly", "Arranged appropriate investigations (bloods, USS)", "Discussed referral pathway and urgency clearly", "Incorporated the patient''s fears into the management plan", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the patient''s cancer anxiety sensitively", "Acknowledged the effort of coming despite avoidance", "Used clear language without medical jargon", "Allowed the patient to express their concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '819e4d1d-f612-452d-b62f-b11072e8f0d8';

-- =============================================
-- New AF (FC-025)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Diagnosis and initial management of new atrial fibrillation, stroke risk assessment with CHA2DS2-VASc, rate vs rhythm control discussion.

**Data Gathering:**
- Symptoms: palpitations, breathlessness, dizziness, chest pain, exercise tolerance
- Onset and pattern: paroxysmal vs persistent, triggers
- Previous ECG or heart tests, how the AF was detected
- Risk factors: hypertension, diabetes, heart failure, thyroid disease, alcohol
- ICE: concern about the heart racing, reluctance about blood thinners

**Clinical Management:**
- Confirm diagnosis with ECG if not already done
- CHA2DS2-VASc score to assess stroke risk and guide anticoagulation
- Rate control first-line (beta-blocker or rate-limiting CCB) per NICE NG196
- Bloods: TFTs, FBC, U&Es, LFTs (baseline for anticoagulant)
- Discuss anticoagulation options (DOACs) and address reluctance
- Referral to cardiology if symptomatic, young, or rhythm control considered

**References:**
- NICE NG196: Atrial fibrillation - https://www.nice.org.uk/guidance/ng196
- NICE CKS: Atrial fibrillation - https://cks.nice.org.uk/topics/atrial-fibrillation/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored symptoms of AF (palpitations, breathlessness, dizziness, chest pain)", "Established onset and pattern of symptoms", "Gathered CHA2DS2-VASc components (age, sex, HTN, DM, stroke/TIA, vascular disease, HF)", "Asked about thyroid symptoms and alcohol intake", "Explored ICE (concern about the heart, reluctance about blood thinners)", "Reviewed how the AF was detected and any previous cardiac investigations", "Completed data gathering within approximately 6 minutes", "Consultation was well-structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Calculated or discussed CHA2DS2-VASc score", "Discussed anticoagulation appropriately based on stroke risk", "Addressed the patient''s reluctance about blood thinners with balanced information", "Recommended rate control as first-line per NICE NG196", "Arranged appropriate baseline investigations (TFTs, bloods)", "Considered cardiology referral if appropriate", "Provided specific safety-netting (return if chest pain, severe breathlessness, TIA symptoms)", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Explained AF in clear and understandable terms", "Acknowledged the patient''s worries about the heart", "Respected the patient''s initial reluctance about medication without being dismissive", "Allowed the patient to express their concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'a7320af6-9750-456c-b121-c0dac2aed297';

-- =============================================
-- Thyroid Nodule (FC-030)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of a thyroid nodule, differentiation between benign and malignant, appropriate investigation and referral.

**Data Gathering:**
- Duration, size changes, rate of growth
- Compressive symptoms: dysphagia, voice changes, breathing difficulty
- Thyroid function symptoms: weight changes, tremor, heat/cold intolerance, palpitations
- FHx: thyroid cancer, MEN syndrome
- Radiation exposure history
- ICE: cancer fears, wanting quick investigation

**Clinical Management:**
- TFTs and thyroid USS as initial investigations
- If suspicious features on USS: fine needle aspiration (FNA)
- If thyrotoxic features: manage hyperthyroidism first
- 2-week wait if features of thyroid cancer (NICE NG12): unexplained thyroid lump in association with voice changes, cervical lymphadenopathy, rapid growth
- Reassure that most thyroid nodules are benign but require investigation

**References:**
- NICE NG12: Suspected cancer - https://www.nice.org.uk/guidance/ng12
- NICE CKS: Thyroid disease assessment - https://cks.nice.org.uk/topics/thyroid-disease-assessment/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the thyroid lump in detail (duration, size changes, rate of growth)", "Asked about compressive symptoms (dysphagia, voice changes, breathing)", "Screened for thyroid function symptoms (hyper and hypothyroid)", "Explored risk factors (family history of thyroid cancer, radiation exposure)", "Explored ICE (cancer fears, desire for quick investigation)", "Gathered relevant PMH", "Completed data gathering within approximately 6 minutes", "Consultation had clear structure and direction"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Arranged TFTs and thyroid USS as initial investigations", "Applied NICE NG12 criteria for 2-week wait referral if red flags present", "Reassured that most nodules are benign while still taking concerns seriously", "Discussed the investigation pathway (USS, possible FNA)", "Addressed the patient''s desire for speed appropriately", "Provided specific safety-netting (return if rapid growth, voice changes, breathing difficulty)", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the patient''s cancer anxiety sensitively", "Acknowledged the delay in presenting", "Balanced reassurance with appropriate seriousness", "Used clear language without jargon", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '74d8e788-f284-41a9-bb94-75fb3ae7dce6';

-- =============================================
-- Zoster/Shingles (FC-036)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Diagnosis and management of herpes zoster, appropriate antiviral treatment, pain management, and awareness of complications.

**Data Gathering:**
- Rash distribution: dermatomal, unilateral, vesicular
- Pain: character (burning, stabbing), severity, impact on sleep
- Duration of rash, when vesicles appeared
- Eye involvement (ophthalmic zoster): visual symptoms, periorbital rash
- Immunocompromised status, age, vaccination history
- ICE: frustration about diagnosis, pain relief expectations

**Clinical Management:**
- Antiviral (aciclovir or valaciclovir) within 72 hours of rash onset, or if active vesicles still forming
- Pain management: paracetamol, NSAIDs, consider neuropathic pain agents (amitriptyline, gabapentin) if needed
- If ophthalmic involvement: same-day ophthalmology referral
- Advise on infectivity: contagious to those not immune to varicella until crusted
- Discuss postherpetic neuralgia risk and management
- Safety-net: return if eye symptoms, spreading rash, or worsening pain

**References:**
- NICE CKS: Shingles - https://cks.nice.org.uk/topics/shingles/
- BNF: Aciclovir dosing - https://bnf.nice.org.uk/drugs/aciclovir/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Identified the rash as dermatomal and vesicular", "Established the timeline of rash and pain onset", "Asked about severity and impact on sleep", "Screened for ophthalmic involvement (eye symptoms, periorbital rash)", "Asked about immunocompromised status", "Explored ICE (frustration about diagnosis, want for strong pain relief)", "Completed data gathering within approximately 6 minutes", "Consultation was well-paced and structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Prescribed antivirals appropriately (within 72 hours or if active vesicles)", "Provided appropriate analgesia for neuropathic pain", "Discussed postherpetic neuralgia risk", "Advised on infectivity to non-immune individuals", "Considered ophthalmology referral if eye involvement", "Provided specific safety-netting advice (eye symptoms, spreading rash)", "Engaged the patient in shared decision-making about treatment"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Acknowledged the patient''s frustration and pain empathetically", "Addressed misconception about shingles only affecting elderly without being dismissive", "Used clear language when explaining the condition", "Allowed the patient to express their concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '3c1dcedf-b334-4b13-8bfa-888cacf71a72';

-- =============================================
-- Acne in Teenager (FC-011)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Management of acne in adolescence, stepped approach to treatment, awareness of psychosocial impact, and when to refer.

**Data Gathering:**
- Duration, severity, distribution of acne (face, back, chest)
- Previous treatments tried (over-the-counter and prescription)
- Psychosocial impact: self-esteem, bullying, mood, school attendance
- Menstrual history if female (PCOS screen)
- PMH, medications, allergies, family history of acne
- ICE: impact on confidence, expectation about treatment options

**Clinical Management:**
- Mild: topical retinoids (adapalene) +/- benzoyl peroxide
- Moderate: add topical antibiotics (clindamycin) or oral antibiotics (lymecycline/doxycycline)
- Severe or scarring: consider dermatology referral for isotretinoin
- In females: consider COCP if appropriate (Dianette/co-cyprindiol)
- Counsel on treatment duration (6-8 weeks to see improvement)
- Address psychosocial impact

**References:**
- NICE CKS: Acne vulgaris - https://cks.nice.org.uk/topics/acne-vulgaris/
- NICE NG198: Acne vulgaris management - https://www.nice.org.uk/guidance/ng198',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed the severity and distribution of acne", "Asked about previous treatments tried", "Explored the psychosocial impact (self-esteem, bullying, mood)", "Asked about menstrual history if female (PCOS screen)", "Explored ICE (impact on confidence, expectations about treatment)", "Gathered relevant PMH, medications, and allergies", "Completed data gathering within approximately 6 minutes", "Consultation was sensitive and age-appropriate"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Applied NICE stepped approach to acne treatment", "Prescribed appropriately for the severity", "Counselled on expected treatment duration (6-8 weeks)", "Addressed psychological impact and considered referral if needed", "Discussed lifestyle advice (skin care, non-comedogenic products)", "Considered dermatology referral criteria (scarring, severe, non-responsive)", "Provided safety-netting (return if no improvement, worsening mood)", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Communicated in an age-appropriate manner", "Validated the impact of acne on self-esteem", "Avoided minimising the concern", "Allowed the teenager to express their concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '675a8721-3fb9-49a3-ab85-74baa50c552f';

-- =============================================
-- Alcohol Concern (FC-037)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Sensitive exploration of alcohol use, AUDIT-C/AUDIT screening, brief intervention, and awareness of alcohol-related harm.

**Data Gathering:**
- Establish current alcohol consumption: units/week, pattern, binge drinking
- Use validated screening tool (AUDIT-C or full AUDIT)
- Explore reasons for drinking: stress, low mood, social, habit
- Impact on daily life: work, relationships, physical health, sleep
- Features of dependence: morning drinking, withdrawal symptoms, tolerance
- PMH: liver disease, mental health, previous attempts to cut down
- ICE: what prompted attendance, readiness to change

**Clinical Management:**
- Brief intervention using FRAMES or motivational interviewing principles
- If AUDIT score suggests hazardous/harmful: structured brief advice
- If dependent: refer to local alcohol services, consider pharmacological support (chlordiazepoxide for withdrawal only under supervision)
- Bloods: LFTs, GGT, MCV, FBC
- Address underlying drivers (stress, mental health)
- Safety-net: follow-up appointment, signpost to support services

**References:**
- NICE CG115: Alcohol-use disorders - https://www.nice.org.uk/guidance/cg115
- NICE PH24: Alcohol-use disorders prevention - https://www.nice.org.uk/guidance/ph24
- AUDIT screening tool - https://www.who.int/publications/i/item/audit',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Quantified alcohol consumption accurately (units, pattern, frequency)", "Used or referenced AUDIT-C/AUDIT screening", "Explored reasons and triggers for drinking", "Assessed for features of alcohol dependence", "Screened for physical complications (liver disease, neuropathy)", "Explored impact on work, relationships, and mental health", "Explored ICE (what prompted attendance, readiness to change)", "Consultation was sensitive and non-judgemental"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Delivered a brief intervention or motivational interviewing approach", "Assessed readiness to change and worked with the patient''s stage", "Arranged appropriate investigations (LFTs, GGT, FBC)", "Discussed referral to alcohol services if dependent", "Addressed underlying drivers (stress, mental health)", "Provided practical harm reduction advice", "Provided safety-netting and arranged follow-up", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Remained non-judgemental about alcohol use", "Signposted sensitively before asking about consumption levels", "Used motivational language rather than lecturing", "Allowed the patient to express their concerns and barriers", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'ca1dd886-e820-4d9f-8397-04c0a692e16c';

-- =============================================
-- Asthma Review (FC-012)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Structured asthma review using BTS/SIGN guidelines, inhaler technique assessment, step-up/step-down approach.

**Data Gathering:**
- Current symptoms: frequency of day and night symptoms, exercise limitation
- Exacerbations: oral steroid courses, A&E attendances, hospital admissions
- Current medications: preventer and reliever use, adherence, technique
- Triggers: allergens, exercise, cold air, occupational
- Smoking status, occupational history
- Peak flow or spirometry results
- ICE: understanding of asthma, concerns about medication

**Clinical Management:**
- Assess asthma control using RCP 3 questions or ACT score
- Check and correct inhaler technique (most common reason for poor control)
- Step up treatment per BTS/SIGN stepwise approach if poorly controlled
- Provide or update personalised asthma action plan
- Annual review: flu vaccination, smoking cessation, trigger avoidance
- Safety-net: when to use reliever, when to seek urgent help

**References:**
- BTS/SIGN: British guideline on asthma - https://www.brit-thoracic.org.uk/quality-improvement/guidelines/asthma/
- NICE NG80: Asthma - https://www.nice.org.uk/guidance/ng80',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed current symptom control (day symptoms, night waking, exercise limitation)", "Asked about recent exacerbations and oral steroid use", "Reviewed current medications and adherence", "Asked about inhaler technique", "Identified triggers (allergens, exercise, occupation)", "Explored ICE (concerns about long-term medication, understanding of asthma)", "Completed data gathering within approximately 6 minutes", "Used a structured review framework (RCP 3 questions or ACT)"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Assessed and corrected inhaler technique", "Applied BTS/SIGN stepwise approach appropriately", "Provided or discussed personalised asthma action plan", "Offered appropriate opportunistic health advice (flu vaccine, smoking)", "Considered stepping down treatment if well controlled", "Provided specific safety-netting (when to seek urgent help)", "Arranged appropriate follow-up", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Used clear and accessible language about asthma management", "Checked understanding of medication purpose (preventer vs reliever)", "Avoided lecturing about adherence", "Allowed the patient to express concerns about medications", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'a7aad768-755f-4508-8291-6c299903ac06';

-- =============================================
-- Breast Lump (FC-013)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of a breast lump in a woman, triple assessment pathway, appropriate use of 2-week wait referral.

**Data Gathering:**
- Lump characteristics: duration, size changes, pain, skin changes, nipple changes
- Menstrual history: relation to cycle, menopausal status
- Breast cancer risk factors: FHx (first-degree relatives), HRT use, age at menarche/menopause
- Screening history: mammogram attendance
- Other symptoms: axillary lumps, weight loss, bone pain, breathlessness
- ICE: cancer fears, impact on daily life

**Clinical Management:**
- All new breast lumps in women: 2-week wait referral to breast clinic (NICE NG12)
- Triple assessment at breast clinic: clinical examination, imaging (USS if <40, mammogram if >40), biopsy
- Do not reassure and delay referral based on age or perceived low risk
- Address emotional impact while awaiting referral
- Safety-net: urgent review if skin changes, nipple inversion, or rapidly growing

**References:**
- NICE NG12: Suspected cancer - https://www.nice.org.uk/guidance/ng12
- NICE CKS: Breast cancer recognition and referral - https://cks.nice.org.uk/topics/breast-cancer-recognition-and-referral/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the breast lump in detail (duration, size changes, pain, skin/nipple changes)", "Asked about relationship to menstrual cycle", "Gathered breast cancer risk factors (FHx, HRT, reproductive history)", "Asked about screening history (mammograms)", "Screened for metastatic symptoms (bone pain, breathlessness, weight loss)", "Explored ICE (cancer fears, emotional impact)", "Completed data gathering within approximately 6 minutes", "Consultation was sensitive and structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised the need for 2-week wait referral per NICE NG12", "Did not inappropriately reassure or delay referral", "Explained the triple assessment process clearly", "Addressed the emotional impact while awaiting referral", "Discussed what to expect at the breast clinic", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the topic with appropriate sensitivity", "Acknowledged and validated the patient''s fears", "Signposted before breast examination discussion", "Used clear language without medical jargon", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '6ea8df94-7d60-45a4-8016-43839ff0d324';

-- =============================================
-- Child with Earache (FC-005)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Management of acute otitis media in children, appropriate antibiotic prescribing, and parental reassurance.

**Data Gathering:**
- Duration and severity of ear pain, which ear
- Associated symptoms: fever, coryzal symptoms, pulling at ear, irritability
- Discharge from ear (perforation)
- Hearing concerns from parent
- Red flags: unwell child, mastoid tenderness, bilateral in <2 years
- Previous ear infections, grommets, hearing tests
- ICE: parent concern about hearing damage, expectation of antibiotics

**Clinical Management:**
- Most AOM in children resolves spontaneously within 3 days
- Analgesia first-line: paracetamol and/or ibuprofen
- Consider delayed antibiotic prescription (amoxicillin) to use if not improving after 3 days
- Immediate antibiotics if: systemically unwell, <2 years with bilateral AOM, or perforation with discharge
- Reassure about hearing (temporary conductive loss is common)
- Safety-net: return if fever persists >3 days, child becoming more unwell, or mastoid tenderness

**References:**
- NICE NG91: Otitis media acute - https://www.nice.org.uk/guidance/ng91
- NICE CKS: Otitis media acute - https://cks.nice.org.uk/topics/otitis-media-acute/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the ear pain in detail (onset, severity, which ear, duration)", "Asked about associated symptoms (fever, coryzal symptoms, discharge)", "Screened for red flags (systemically unwell, mastoid tenderness)", "Asked about previous ear infections and hearing concerns", "Explored ICE (parent''s concern about hearing, expectation of antibiotics)", "Gathered relevant medical history (previous infections, allergies)", "Completed data gathering within approximately 6 minutes", "Communicated clearly with the parent"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recommended appropriate analgesia (paracetamol/ibuprofen)", "Applied NICE guidance on antibiotic prescribing (delayed prescription approach)", "Identified indications for immediate antibiotics correctly", "Reassured about the natural history of AOM", "Addressed parent''s concern about hearing impact", "Provided specific safety-netting (return if fever >3 days, worsening)", "Engaged the parent in shared decision-making about antibiotics"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful to the parent throughout", "Acknowledged the parent''s concern and worry", "Used clear and accessible language", "Avoided being dismissive of the request for antibiotics", "Allowed the parent to express concerns and ask questions", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '4b728f0d-ae55-4a5e-ab1e-0e63e6fa9302';

-- =============================================
-- Chronic Low Back Pain (FC-003)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Management of chronic low back pain, biopsychosocial approach, appropriate imaging decisions, and avoiding over-medicalisation.

**Data Gathering:**
- Pain characteristics: duration (>12 weeks = chronic), location, radiation, severity
- Red flags: cauda equina symptoms (saddle anaesthesia, bladder/bowel dysfunction), progressive neurological deficit, weight loss, night pain
- Yellow flags: catastrophising, fear-avoidance behaviour, mood, work dissatisfaction
- Functional impact: work, mobility, sleep, daily activities
- Previous treatments: physiotherapy, medication, injections, surgery
- PMH, medications, expectations about imaging

**Clinical Management:**
- Reassure: no red flags, imaging not routinely indicated for non-specific LBP (NICE NG59)
- Encourage staying active, avoid bed rest
- First-line: self-management, exercise programmes, consider group exercise
- Pharmacological: NSAIDs short course if needed; avoid opioids for chronic non-specific LBP
- Consider referral to MSK physiotherapy or multidisciplinary pain programme
- Address psychological and social factors

**References:**
- NICE NG59: Low back pain and sciatica - https://www.nice.org.uk/guidance/ng59
- NICE CKS: Back pain low (without radiculopathy) - https://cks.nice.org.uk/topics/back-pain-low-without-radiculopathy/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the back pain in detail (duration, location, radiation, severity)", "Screened for red flag symptoms (cauda equina, malignancy, fracture, infection)", "Assessed for yellow flags (psychosocial risk factors)", "Explored functional impact on work, mobility, and daily life", "Asked about previous treatments and their effectiveness", "Explored ICE (expectation of imaging, concerns about disability)", "Completed data gathering within approximately 6 minutes", "Consultation was structured and comprehensive"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Reassured appropriately in the absence of red flags", "Explained why imaging is not routinely indicated per NICE NG59", "Encouraged staying active and avoiding bed rest", "Recommended appropriate exercise and physiotherapy referral", "Avoided prescribing opioids for chronic non-specific LBP", "Addressed psychosocial factors and their role in chronic pain", "Provided specific safety-netting (return if new neurological symptoms)", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Validated the patient''s pain experience", "Avoided dismissing the request for imaging without explanation", "Explained the rationale for management plan clearly", "Allowed the patient to express concerns and frustrations", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'b7f4326c-c4c5-4f8c-a5ba-3851e2cf7b4d';

-- =============================================
-- Contraception Switch (FC-039)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Discussion of contraceptive options, ability to tailor advice to patient needs, shared decision-making, and safe switching.

**Data Gathering:**
- Current method: type, duration, reason for wanting to switch
- Side effects experienced with current method
- Reproductive plans: future pregnancy intentions
- Medical eligibility: migraine with aura, VTE history, BMI, BP, smoking, breastfeeding
- Sexual health: STI risk, cervical screening
- ICE: what they are hoping for from a new method, concerns about specific methods

**Clinical Management:**
- Discuss options appropriate to UKMEC criteria (COCP, POP, implant, IUD/IUS, injection)
- Tailor discussion to patient''s preferences and medical eligibility
- Explain switching protocols (overlap, gap, or immediate switch depending on methods)
- Discuss efficacy, side effects, and non-contraceptive benefits
- Offer STI screening if appropriate
- Provide written information or direct to SH:24/Brook

**References:**
- FSRH: UK Medical Eligibility Criteria - https://www.fsrh.org/standards-and-guidance/uk-medical-eligibility-criteria-for-contraceptive-use/
- NICE CKS: Contraception assessment - https://cks.nice.org.uk/topics/contraception-assessment/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored current contraceptive method and reason for wanting to switch", "Asked about side effects experienced", "Assessed medical eligibility (UKMEC criteria)", "Asked about reproductive plans and pregnancy intentions", "Explored sexual health and STI risk", "Explored ICE (what they want from a new method, concerns)", "Completed data gathering within approximately 6 minutes", "Consultation was patient-centred and non-judgemental"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Discussed appropriate contraceptive options tailored to the patient", "Applied UKMEC criteria correctly", "Explained switching protocol for safe transition between methods", "Discussed efficacy, side effects, and non-contraceptive benefits", "Offered STI screening if appropriate", "Provided clear information and signposted to resources", "Provided safety-netting and arranged follow-up", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Maintained a non-judgemental approach", "Respected the patient''s autonomy in choosing their method", "Used clear language appropriate to the patient", "Allowed the patient to ask questions and express preferences", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'e8f84344-4aa0-47f8-b7e9-de4eabbfa6c7';

-- =============================================
-- COPD Exacerbation (FC-014)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Management of a COPD exacerbation in primary care, rescue pack use, recognition of when to admit, and optimisation of long-term management.

**Data Gathering:**
- Current symptoms: increased breathlessness, sputum volume, sputum purulence, wheeze
- Severity: able to complete sentences, eating/drinking, confusion
- Baseline function: usual exercise tolerance, MRC dyspnoea scale
- Current medications: inhalers, rescue pack, home oxygen
- Exacerbation frequency and previous admissions/NIV
- Smoking status and cessation attempts
- ICE: fears about worsening, concerns about hospital admission

**Clinical Management:**
- Acute management: oral prednisolone 30mg OD for 5 days, antibiotics if purulent sputum (amoxicillin or doxycycline)
- Inhaler optimisation per NICE NG115 (SABA > LAMA > LAMA+LABA > triple therapy)
- If frequent exacerbations (≥2/year): consider adding ICS, azithromycin prophylaxis, pulmonary rehab referral
- Smoking cessation if still smoking
- Check inhaler technique
- Safety-net: attend A&E if worsening breathlessness, confusion, unable to cope at home

**References:**
- NICE NG115: COPD in over 16s - https://www.nice.org.uk/guidance/ng115
- GOLD 2024: COPD management - https://goldcopd.org/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed severity of the exacerbation (breathlessness, sputum changes, wheeze)", "Established baseline function and usual exercise tolerance", "Reviewed current medications and rescue pack availability", "Asked about exacerbation frequency and admission history", "Assessed smoking status", "Explored ICE (fears about deterioration, hospital avoidance)", "Completed data gathering within approximately 6 minutes", "Consultation was structured and focused"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Prescribed appropriate acute treatment (prednisolone, antibiotics if indicated)", "Applied NICE NG115 stepwise inhaler approach", "Checked and optimised inhaler technique", "Discussed pulmonary rehabilitation referral if appropriate", "Offered smoking cessation support if applicable", "Considered azithromycin prophylaxis if frequent exacerbations", "Provided specific safety-netting (A&E if worsening, confusion, unable to cope)", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Acknowledged the patient''s fears about worsening disease", "Avoided being judgemental about smoking", "Used clear and accessible language", "Allowed the patient to express their concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'f10d66e1-753c-4fc1-87ab-c5148e992800';

-- =============================================
-- Depression Follow-up (FC-015)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Follow-up of a patient on antidepressants, assessing treatment response, monitoring side effects, risk assessment, and ongoing support.

**Data Gathering:**
- Current mood: PHQ-9 or similar validated tool, comparison to baseline
- Medication: which antidepressant, dose, duration, adherence, side effects
- Response to treatment: improvement in sleep, appetite, concentration, motivation
- Risk assessment: suicidal ideation, self-harm, plans, protective factors
- Social support: relationships, work, hobbies, isolation
- ICE: how they feel about the medication, concerns about long-term use

**Clinical Management:**
- If improving: continue at current dose, plan for minimum 6 months after remission
- If not improving after 4-6 weeks at adequate dose: consider dose increase or switch
- If significant side effects: discuss switching to alternative SSRI or class
- Discuss psychological therapy (CBT, counselling) if not already engaged
- Address social factors and self-management strategies
- Risk management plan if needed
- Safety-net: crisis contacts, return sooner if worsening

**References:**
- NICE CG90: Depression in adults - https://www.nice.org.uk/guidance/cg90
- NICE CKS: Depression - https://cks.nice.org.uk/topics/depression/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed current mood using PHQ-9 or validated tool", "Asked about medication adherence and side effects", "Assessed treatment response (sleep, appetite, concentration, motivation)", "Conducted an appropriate risk assessment (suicidal ideation, self-harm)", "Explored social support and functioning", "Explored ICE (feelings about medication, concerns about long-term use)", "Completed data gathering within approximately 6 minutes", "Consultation was sensitively paced"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made an appropriate decision about continuing, adjusting, or switching medication", "Discussed psychological therapy options (CBT, counselling)", "Addressed social and lifestyle factors", "Provided a clear management plan with follow-up timeline", "Discussed crisis contacts and safety plan", "Provided specific safety-netting (return sooner if worsening)", "Engaged the patient in shared decision-making about treatment"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Conducted the consultation with sensitivity and warmth", "Normalised the experience of depression without minimising it", "Used clear and accessible language", "Allowed the patient to express how they are feeling", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'f565e2cb-f051-4bf9-a043-9cd495eb688b';
