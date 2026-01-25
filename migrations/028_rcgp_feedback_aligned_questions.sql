-- Migration: RCGP Feedback-Aligned High-Yield Questions
-- Based on official RCGP AKT feedback reports and difficulty drivers
-- Focus: Applied decision-making, data interpretation, prescribing safety, professional practice

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro) VALUES

-- ============================================
-- DATA INTERPRETATION & STATISTICS
-- ============================================

(
  'A screening test for a condition has a sensitivity of 90% and specificity of 85%. In a population with a prevalence of 5%, what does a positive test result mean?',
  '[
    {"label": "A", "text": "The patient definitely has the condition"},
    {"label": "B", "text": "The probability the patient has the condition is approximately 24%"},
    {"label": "C", "text": "The probability the patient has the condition is approximately 90%"},
    {"label": "D", "text": "The test is unreliable and should be repeated"},
    {"label": "E", "text": "The patient should be referred immediately"}
  ]'::jsonb,
  'B',
  'With sensitivity 90%, specificity 85%, and prevalence 5%, the positive predictive value (PPV) is approximately 24%. This is calculated using Bayes'' theorem. Even with good sensitivity and specificity, low prevalence means most positive tests are false positives. This is why screening tests need high specificity, and why positive screening tests require confirmatory testing.',
  'Evidence-Based Practice',
  'hard',
  ARRAY['RCGP AKT Feedback: Data interpretation', 'Positive predictive value depends on prevalence', 'Low prevalence = many false positives', 'Screening tests require confirmatory testing'],
  false
),

(
  'A study reports that a new treatment reduces the risk of cardiovascular events with a relative risk of 0.75 (95% CI 0.60-0.90). What is the correct interpretation?',
  '[
    {"label": "A", "text": "The treatment increases risk by 25%"},
    {"label": "B", "text": "The treatment reduces risk by 25%, and we are 95% confident the true effect is between 10% and 40% reduction"},
    {"label": "C", "text": "The treatment reduces risk by 75%"},
    {"label": "D", "text": "The confidence interval includes 1.0, so the result is not statistically significant"},
    {"label": "E", "text": "The treatment is not effective"}
  ]'::jsonb,
  'B',
  'Relative risk (RR) of 0.75 means a 25% reduction in risk. The 95% confidence interval (0.60-0.90) does not include 1.0, so the result is statistically significant. The CI tells us we are 95% confident the true relative risk lies between 0.60 (40% reduction) and 0.90 (10% reduction). This is a significant protective effect.',
  'Evidence-Based Practice',
  'hard',
  ARRAY['RCGP AKT Feedback: Data interpretation', 'Relative risk interpretation', 'Confidence intervals', 'Statistical significance when CI excludes 1.0'],
  false
),

(
  'A diagnostic test has a sensitivity of 95% and specificity of 80%. What is the most appropriate use of this test?',
  '[
    {"label": "A", "text": "As a screening test in the general population"},
    {"label": "B", "text": "To rule out disease in patients with high pre-test probability"},
    {"label": "C", "text": "To confirm diagnosis in patients with high pre-test probability"},
    {"label": "D", "text": "The test is not useful with these characteristics"},
    {"label": "E", "text": "Only in combination with other tests"}
  ]'::jsonb,
  'B',
  'High sensitivity (95%) means few false negatives - a negative test effectively rules out disease. This is best used as a "rule-out" test in patients with high pre-test probability. High specificity is needed to "rule in" disease. For screening, you need high specificity to avoid false positives. This test is better for ruling out than ruling in.',
  'Evidence-Based Practice',
  'medium',
  ARRAY['RCGP AKT Feedback: Data interpretation', 'Sensitivity = rule out', 'Specificity = rule in', 'High sensitivity useful for ruling out disease'],
  false
),

-- ============================================
-- PRESCRIBING SAFETY & MONITORING
-- ============================================

(
  'A 45-year-old woman with rheumatoid arthritis is started on methotrexate 15mg weekly. What monitoring is required BEFORE starting treatment?',
  '[
    {"label": "A", "text": "No monitoring needed before starting"},
    {"label": "B", "text": "FBC, LFTs, U&Es, and chest X-ray"},
    {"label": "C", "text": "FBC and LFTs only"},
    {"label": "D", "text": "FBC, LFTs, U&Es, and hepatitis B/C serology"},
    {"label": "E", "text": "FBC only"}
  ]'::jsonb,
  'D',
  'Before starting methotrexate, baseline investigations include: FBC (for baseline), LFTs (hepatotoxicity risk), U&Es (renal function affects excretion), and hepatitis B/C serology (reactivation risk). Chest X-ray is not routinely required before starting. Monitoring continues during treatment (FBC, LFTs, U&Es every 2-4 weeks initially, then every 3 months).',
  'Prescribing',
  'high',
  ARRAY['RCGP AKT Feedback: DMARD monitoring', 'NICE CKS: Rheumatoid arthritis', 'Methotrexate baseline: FBC, LFTs, U&Es, hepatitis serology', 'Ongoing monitoring required'],
  false
),

(
  'A 60-year-old man on warfarin for atrial fibrillation is prescribed trimethoprim for a UTI. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Prescribe trimethoprim as normal - no interaction"},
    {"label": "B", "text": "Prescribe trimethoprim but increase warfarin dose"},
    {"label": "C", "text": "Prescribe trimethoprim but monitor INR more frequently and consider reducing warfarin dose"},
    {"label": "D", "text": "Avoid trimethoprim - use alternative antibiotic"},
    {"label": "E", "text": "Stop warfarin temporarily"}
  ]'::jsonb,
  'C',
  'Trimethoprim increases warfarin effect (inhibits metabolism, displaces from protein binding) leading to increased INR and bleeding risk. Monitor INR more frequently (e.g., weekly) during trimethoprim course and for 1-2 weeks after. May need to reduce warfarin dose. Do not stop warfarin (stroke risk). Alternative antibiotics (e.g., nitrofurantoin) may be preferred if available.',
  'Prescribing',
  'high',
  ARRAY['RCGP AKT Feedback: Drug interactions', 'BNF: Trimethoprim increases warfarin effect', 'Monitor INR more frequently', 'May need dose reduction'],
  false
),

(
  'A 70-year-old woman with heart failure (LVEF 30%) is started on spironolactone 25mg OD. What monitoring is essential?',
  '[
    {"label": "A", "text": "No specific monitoring required"},
    {"label": "B", "text": "U&Es and eGFR at 1 week, 4 weeks, then 3-monthly"},
    {"label": "C", "text": "FBC monthly"},
    {"label": "D", "text": "LFTs at 1 month"},
    {"label": "E", "text": "ECG at baseline only"}
  ]'::jsonb,
  'B',
  'Spironolactone is a potassium-sparing diuretic - risk of hyperkalaemia, especially with reduced eGFR. Monitor U&Es (especially potassium) and eGFR: at 1 week, 4 weeks, then 3-monthly. If eGFR <30 or potassium >5.5, consider stopping or reducing dose. Hyperkalaemia is a serious risk, especially in elderly with CKD.',
  'Prescribing',
  'high',
  ARRAY['RCGP AKT Feedback: Medicines monitoring', 'NICE CKS: Heart failure', 'Spironolactone: monitor U&Es and eGFR', 'Risk of hyperkalaemia'],
  false
),

(
  'A 50-year-old woman with depression is on sertraline 100mg OD. She is prescribed sumatriptan for migraines. What is the most important consideration?',
  '[
    {"label": "A", "text": "No interaction - safe to prescribe together"},
    {"label": "B", "text": "Increased risk of serotonin syndrome - avoid sumatriptan"},
    {"label": "C", "text": "Sumatriptan will reduce sertraline effectiveness"},
    {"label": "D", "text": "Sertraline will reduce sumatriptan effectiveness"},
    {"label": "E", "text": "Both drugs cause drowsiness - warn patient"}
  ]'::jsonb,
  'B',
  'Sertraline (SSRI) + sumatriptan (triptan) = increased risk of serotonin syndrome (rare but serious). Both increase serotonin. Avoid combination if possible. If sumatriptan needed, use with caution, lowest effective dose, and warn patient about symptoms (agitation, confusion, hyperthermia, tachycardia). Consider alternative migraine treatment (e.g., NSAIDs) or alternative antidepressant if sumatriptan essential.',
  'Prescribing',
  'high',
  ARRAY['RCGP AKT Feedback: Antidepressant drugs and serious interactions', 'BNF: Serotonin syndrome risk', 'SSRI + triptan = avoid combination', 'Warn patient if used together'],
  false
),

(
  'A 75-year-old man with CKD Stage 3b (eGFR 32) is prescribed metformin 500mg BD for type 2 diabetes. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Prescribe metformin as normal - no dose adjustment needed"},
    {"label": "B", "text": "Prescribe metformin but reduce dose to 500mg OD"},
    {"label": "C", "text": "Avoid metformin - use alternative (e.g., gliclazide)"},
    {"label": "D", "text": "Prescribe metformin but monitor eGFR and stop if eGFR <30"},
    {"label": "E", "text": "Prescribe metformin but increase monitoring frequency"}
  ]'::jsonb,
  'D',
  'Metformin is contraindicated if eGFR <30 (risk of lactic acidosis). With eGFR 32 (Stage 3b), metformin can be used but monitor eGFR regularly. Stop if eGFR falls below 30. Do not use if eGFR <30. Dose reduction not needed - it''s about eGFR threshold, not dose. Alternative agents (e.g., DPP-4 inhibitors) may be preferred if eGFR borderline.',
  'Prescribing',
  'high',
  ARRAY['RCGP AKT Feedback: Safe prescribing for older adults', 'NICE CKS: Type 2 diabetes', 'Metformin contraindicated if eGFR <30', 'Monitor eGFR regularly'],
  false
),

-- ============================================
-- APPLIED DECISION-MAKING (Next Best Step)
-- ============================================

(
  'A 55-year-old man presents with chest pain on exertion, relieved by rest. ECG shows ST depression in leads V4-V6. He has no cardiovascular risk factors. What is the NEXT BEST STEP?',
  '[
    {"label": "A", "text": "Refer for urgent cardiology assessment (2-week wait)"},
    {"label": "B", "text": "Start aspirin and atorvastatin, arrange exercise tolerance test"},
    {"label": "C", "text": "Prescribe GTN spray and review in 1 month"},
    {"label": "D", "text": "Request advice and guidance from cardiology"},
    {"label": "E", "text": "Reassure and discharge"}
  ]'::jsonb,
  'A',
  'ECG showing ST depression in chest leads with exertional chest pain suggests ischaemia. This is not stable angina - ECG changes indicate active ischaemia. Urgent 2-week wait referral to cardiology is appropriate for suspected coronary artery disease. Do not delay with primary care management or A&G. This needs specialist assessment and likely angiography.',
  'Cardiovascular',
  'high',
  ARRAY['RCGP AKT Feedback: Diagnosis and management of CVS problems', 'ECG interpretation', 'ST depression + chest pain = urgent referral', '2-week wait for suspected CAD'],
  false
),

(
  'A 30-year-old woman with known asthma presents with increased wheeze and using salbutamol 6 times daily. She takes beclomethasone 200mcg BD. Peak flow is 60% of her best. What is the NEXT BEST STEP?',
  '[
    {"label": "A", "text": "Increase beclomethasone to 400mcg BD"},
    {"label": "B", "text": "Start oral prednisolone 40mg daily for 5 days"},
    {"label": "C", "text": "Add salmeterol (LABA)"},
    {"label": "D", "text": "Refer to hospital"},
    {"label": "E", "text": "Add montelukast"}
  ]'::jsonb,
  'B',
  'Peak flow 60% of best + increased SABA use indicates moderate-severe exacerbation. Next best step is oral prednisolone (40-50mg daily for 5 days) to treat the acute exacerbation. Then review and consider stepping up maintenance therapy. Do not just increase maintenance ICS - need to treat the acute episode first. Hospital referral if severe (peak flow <50%, severe symptoms).',
  'Respiratory',
  'high',
  ARRAY['RCGP AKT Feedback: Asthma diagnosis and management', 'NICE CKS: Asthma', 'Moderate-severe exacerbation = oral prednisolone', 'Peak flow <60% = moderate exacerbation'],
  false
),

(
  'A 65-year-old woman presents with a 2-week history of progressive memory problems and word-finding difficulties. MMSE is 24/30. She has no red flag features. What is the NEXT BEST STEP?',
  '[
    {"label": "A", "text": "Prescribe donepezil immediately"},
    {"label": "B", "text": "Refer for urgent neurology assessment (2-week wait)"},
    {"label": "C", "text": "Refer for routine memory clinic appointment"},
    {"label": "D", "text": "Arrange CT head as outpatient"},
    {"label": "E", "text": "Reassure - normal ageing"}
  ]'::jsonb,
  'C',
  'Progressive memory problems with MMSE 24 (borderline) and no red flags suggests possible dementia but not urgent. Next best step is routine referral to memory clinic for comprehensive assessment (cognitive testing, bloods, imaging if indicated). Do not start donepezil without diagnosis. Urgent 2-week wait is for red flags (rapid progression, focal signs, young age, head injury).',
  'Neurology',
  'medium',
  ARRAY['RCGP AKT Feedback: Interpretation of neurological symptoms', 'NICE CKS: Dementia', 'Routine referral for memory problems without red flags', 'Comprehensive assessment before treatment'],
  false
),

-- ============================================
-- PROFESSIONAL PRACTICE
-- ============================================

(
  'A GP receives a request from a solicitor for a patient''s full medical records for a personal injury claim. The patient has not given explicit consent. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Send all records immediately as requested"},
    {"label": "B", "text": "Refuse to send any records without patient consent"},
    {"label": "C", "text": "Contact the patient to obtain explicit consent before releasing records"},
    {"label": "D", "text": "Send a summary only without consent"},
    {"label": "E", "text": "Send records to the solicitor directly"}
  ]'::jsonb,
  'C',
  'For third-party requests (solicitors, insurers), explicit patient consent is required before releasing medical records. Contact the patient to obtain written consent specifying what can be released. Do not send records without consent - this breaches confidentiality and GDPR. Patient should specify what information can be shared.',
  'Primary Care Organisation & Management',
  'high',
  ARRAY['RCGP AKT Feedback: Access to medical records', 'Confidentiality and data protection', 'Third-party requests require explicit consent', 'GDPR compliance'],
  false
),

(
  'A practice manager asks a GP to review a patient complaint about a colleague. The complaint alleges inappropriate prescribing. What is the most appropriate FIRST action?',
  '[
    {"label": "A", "text": "Dismiss the complaint as unfounded"},
    {"label": "B", "text": "Contact the colleague immediately to discuss"},
    {"label": "C", "text": "Review the complaint following practice complaints procedure"},
    {"label": "D", "text": "Refer directly to GMC"},
    {"label": "E", "text": "Ignore the complaint"}
  ]'::jsonb,
  'C',
  'All complaints should be handled through the practice complaints procedure. Review the complaint objectively, gather relevant information (notes, prescriptions), and follow the procedure. Do not dismiss without investigation. Do not contact colleague first - follow procedure. Only refer to GMC if serious concerns after investigation. Document everything.',
  'Primary Care Organisation & Management',
  'medium',
  ARRAY['RCGP AKT Feedback: Leadership and Management', 'Practice complaints procedure', 'Objective review required', 'Document everything'],
  false
),

(
  'A practice is reviewing its antibiotic prescribing. They find 60% of sore throat consultations result in antibiotic prescriptions, but NICE guidance suggests only 10-20% should. What quality improvement tool is most appropriate?',
  '[
    {"label": "A", "text": "No action needed - current practice is acceptable"},
    {"label": "B", "text": "Plan-Do-Study-Act (PDSA) cycle"},
    {"label": "C", "text": "Randomised controlled trial"},
    {"label": "D", "text": "Systematic review"},
    {"label": "E", "text": "Case-control study"}
  ]'::jsonb,
  'B',
  'PDSA (Plan-Do-Study-Act) cycle is a quality improvement methodology for testing changes in healthcare. Plan: identify problem and plan intervention (e.g., delayed prescribing, patient information). Do: implement on small scale. Study: measure outcomes. Act: adopt, adapt, or abandon. This is appropriate for improving antibiotic stewardship. RCTs are for research, not QI.',
  'Primary Care Organisation & Management',
  'medium',
  ARRAY['RCGP AKT Feedback: Quality improvement tools and methodologies', 'Antimicrobial stewardship', 'PDSA cycle for QI', 'Test changes on small scale'],
  false
),

-- ============================================
-- SPECIFIC RCGP FEEDBACK TOPICS
-- ============================================

-- Eyelid problems
(
  'A 60-year-old woman presents with a painless, slowly enlarging nodule on her upper eyelid margin. It has been present for 3 months. What is the most likely diagnosis and action?',
  '[
    {"label": "A", "text": "Chalazion - warm compress and review"},
    {"label": "B", "text": "Stye - prescribe antibiotic eye ointment"},
    {"label": "C", "text": "Basal cell carcinoma - refer for urgent ophthalmology assessment (2-week wait)"},
    {"label": "D", "text": "Blepharitis - prescribe lid hygiene"},
    {"label": "E", "text": "Allergic conjunctivitis - prescribe antihistamine eye drops"}
  ]'::jsonb,
  'C',
  'Painless, slowly enlarging nodule on eyelid margin in an older patient is suspicious for basal cell carcinoma (BCC). Eyelid BCCs require urgent 2-week wait referral to ophthalmology for excision. Do not delay with conservative management. Chalazion is usually more central, stye is painful and acute, blepharitis is bilateral and chronic.',
  'Ophthalmology',
  'high',
  ARRAY['RCGP AKT Feedback: Eyelid problems', 'NICE CKS: Skin cancer', 'Eyelid nodule in older patient = suspect BCC', '2-week wait referral to ophthalmology'],
  false
),

-- HRT
(
  'A 52-year-old woman presents with hot flushes and night sweats affecting her sleep. She had a hysterectomy 5 years ago. She has no contraindications to HRT. What is the most appropriate HRT regimen?',
  '[
    {"label": "A", "text": "Combined HRT (oestrogen + progestogen)"},
    {"label": "B", "text": "Oestrogen-only HRT"},
    {"label": "C", "text": "Tibolone"},
    {"label": "D", "text": "Raloxifene"},
    {"label": "E", "text": "No HRT needed - use alternatives"}
  ]'::jsonb,
  'B',
  'After hysterectomy (no uterus), oestrogen-only HRT is appropriate - no need for progestogen (which is only needed to protect endometrium). Combined HRT is for women with intact uterus. Tibolone and raloxifene are alternatives but oestrogen-only is standard. Start with lowest effective dose and review.',
  'Women''s Health',
  'medium',
  ARRAY['RCGP AKT Feedback: HRT e.g. indications, management of side effects', 'NICE CKS: Menopause', 'After hysterectomy = oestrogen-only HRT', 'No progestogen needed'],
  false
),

-- Contraception with teratogenic drugs
(
  'A 25-year-old woman with severe acne is prescribed isotretinoin. She is currently using a copper IUD. What is the most important action?',
  '[
    {"label": "A", "text": "No action needed - copper IUD is sufficient"},
    {"label": "B", "text": "Advise to use condoms in addition to IUD"},
    {"label": "C", "text": "Change to combined oral contraceptive pill"},
    {"label": "D", "text": "Isotretinoin is not teratogenic - no special precautions"},
    {"label": "E", "text": "Advise abstinence during treatment"}
  ]'::jsonb,
  'A',
  'Isotretinoin is highly teratogenic. Copper IUD is effective contraception and is acceptable. However, many clinicians recommend two forms of contraception (e.g., IUD + condoms) for extra protection given the severity of teratogenicity. Combined OCP is also acceptable but IUD alone is effective. The key is ensuring effective contraception is in place before starting isotretinoin.',
  'Sexual Health',
  'high',
  ARRAY['RCGP AKT Feedback: Contraception e.g. serious adverse effects, contraception with teratogenic drugs', 'NICE CKS: Acne', 'Isotretinoin highly teratogenic', 'Effective contraception essential'],
  false
),

-- ECG interpretation
(
  'A 70-year-old man presents with palpitations. ECG shows an irregular rhythm with no P waves, and QRS complexes are narrow. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Atrial fibrillation"},
    {"label": "B", "text": "Atrial flutter"},
    {"label": "C", "text": "Sinus arrhythmia"},
    {"label": "D", "text": "Ventricular tachycardia"},
    {"label": "E", "text": "Complete heart block"}
  ]'::jsonb,
  'A',
  'Irregular rhythm + no P waves + narrow QRS = atrial fibrillation. Atrial flutter has sawtooth flutter waves. Sinus arrhythmia has P waves. VT has wide QRS. Complete heart block has regular P waves and QRS but dissociated. AF is the most common arrhythmia in elderly.',
  'Cardiovascular',
  'medium',
  ARRAY['RCGP AKT Feedback: ECG interpretation including rhythm abnormalities', 'Irregular + no P waves + narrow QRS = AF', 'Most common arrhythmia in elderly'],
  false
),

-- Safeguarding
(
  'A 3-year-old child presents with a burn on their hand. The parent says the child touched a hot radiator. The burn pattern is consistent with this. However, you notice the child is withdrawn and has multiple bruises of different ages. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Treat the burn and discharge"},
    {"label": "B", "text": "Treat the burn and arrange follow-up"},
    {"label": "C", "text": "Refer to social services/children''s services for safeguarding concern"},
    {"label": "D", "text": "Prescribe antibiotics for the burn"},
    {"label": "E", "text": "Reassure the parent"}
  ]'::jsonb,
  'C',
  'Multiple bruises of different ages + withdrawn child + injury = possible non-accidental injury (NAI). Even if the current injury has a plausible explanation, the pattern of injuries raises safeguarding concerns. Refer to children''s services/social services for assessment. Do not delay. Document findings clearly. This is a child protection issue.',
  'Paediatrics',
  'high',
  ARRAY['RCGP AKT Feedback: Safeguarding/non-accidental injury', 'Multiple bruises different ages = red flag', 'Withdrawn child + injuries = safeguarding concern', 'Refer to children''s services'],
  false
);

-- This migration adds 18 high-yield questions aligned with RCGP feedback:
-- - Data interpretation (3 questions)
-- - Prescribing safety & monitoring (5 questions)
-- - Applied decision-making (3 questions)
-- - Professional practice (3 questions)
-- - Specific RCGP feedback topics (4 questions)

-- All questions emphasize:
-- - Applied decision-making ("next best step", "what is safest")
-- - Nuanced distractors (plausible but incorrect answers)
-- - Real-world clinical scenarios
-- - Evidence-based practice
