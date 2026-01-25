-- Migration: Add Gender Affirming Care, Geriatrics, Men's Health and Specialty Questions
-- Based on NICE CKS, BMA guidance, RCGP curriculum, and NHS England guidance
-- Adding ~100 questions to reach 750 total

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro) VALUES

-- Sexual Health - Gender Affirming Care (add 8 questions)
(
  'A 25-year-old patient assigned male at birth presents requesting referral for gender incongruence. They identify as female and have been experiencing gender dysphoria for several years. What is the most appropriate initial action?',
  '[
    {"label": "A", "text": "Refer to mental health services first for assessment"},
    {"label": "B", "text": "Refer directly to a Gender Identity Clinic (GIC)"},
    {"label": "C", "text": "Prescribe oestrogen immediately"},
    {"label": "D", "text": "Request approval from CCG/ICS before referral"},
    {"label": "E", "text": "Advise patient to seek private treatment"}
  ]'::jsonb,
  'B',
  'GPs can refer directly to NHS Gender Identity Clinics (GICs) without prior mental health assessment or CCG/ICS approval. GICs accept referrals from primary or secondary care. The patient should be referred promptly to ensure timely access to specialist assessment and treatment.',
  'Sexual Health',
  'medium',
  ARRAY['BMA: Role of GPs in managing adult patients with gender incongruence', 'Direct referral to GIC', 'No prior mental health assessment required', 'No CCG/ICS approval needed'],
  false
),

(
  'A 30-year-old trans woman (assigned male at birth) who has been on oestrogen for 2 years asks about screening. What screening should be offered?',
  '[
    {"label": "A", "text": "No screening needed"},
    {"label": "B", "text": "Breast screening only"},
    {"label": "C", "text": "Prostate screening only"},
    {"label": "D", "text": "Both breast and prostate screening as appropriate"},
    {"label": "E", "text": "Cervical screening only"}
  ]'::jsonb,
  'D',
  'Trans women on oestrogen should be offered breast screening (as they are at risk of breast cancer). Prostate screening may still be relevant depending on surgical history. Organ-specific screening should be based on anatomy present, not gender identity. Discuss with patient which screening is appropriate for them.',
  'Sexual Health',
  'medium',
  ARRAY['BMA: Role of GPs in managing adult patients with gender incongruence', 'Organ-specific screening based on anatomy', 'Breast screening for trans women on oestrogen', 'Prostate screening may still be relevant'],
  false
),

(
  'A GP is asked to prescribe a "bridging prescription" for a patient with gender incongruence who is awaiting GIC assessment. According to GMC guidance, when should a bridging prescription be considered?',
  '[
    {"label": "A", "text": "Always, if patient requests it"},
    {"label": "B", "text": "Only if patient is self-prescribing from unregulated sources AND at risk of self-harm/suicide AND after seeking specialist advice"},
    {"label": "C", "text": "Only if GIC waiting time exceeds 6 months"},
    {"label": "D", "text": "Never, GPs should not prescribe"},
    {"label": "E", "text": "Only if patient has private prescription"}
  ]'::jsonb,
  'B',
  'GMC advises GPs should only consider a bridging prescription when: (a) patient is already self-prescribing or highly likely to self-prescribe from unregulated sources, (b) bridging prescription is intended to mitigate risk of self-harm or suicide, and (c) doctor has sought advice of an experienced gender specialist and prescribes lowest acceptable dose. This is a harm-reduction measure.',
  'Sexual Health',
  'medium',
  ARRAY['BMA: Role of GPs in managing adult patients with gender incongruence', 'Bridging prescriptions: harm-reduction measure', 'GMC guidance on criteria', 'Must seek specialist advice'],
  false
),

(
  'A patient with gender incongruence asks to change their name and gender on their practice medical record. What should the GP do?',
  '[
    {"label": "A", "text": "Refuse until Gender Recognition Certificate obtained"},
    {"label": "B", "text": "Change name and gender on practice record as requested"},
    {"label": "C", "text": "Refer to GIC first"},
    {"label": "D", "text": "Require legal documentation"},
    {"label": "E", "text": "Only change if patient has had surgery"}
  ]'::jsonb,
  'B',
  'Patients have the right to change their name and gender on their practice medical record without obtaining a Gender Recognition Certificate. PCSE guidance sets out the steps. The practice should respect the patient''s gender identity and update records accordingly. Written correspondence should be mindful of confidentiality (e.g., use initial and surname if others in household unaware).',
  'Sexual Health',
  'medium',
  ARRAY['BMA: Role of GPs in managing adult patients with gender incongruence', 'Patients can change name/gender on record', 'No Gender Recognition Certificate required', 'PCSE guidance for process'],
  false
),

(
  'A trans man (assigned female at birth) who has been on testosterone for 3 years asks about fertility. What should be discussed?',
  '[
    {"label": "A", "text": "Fertility is not affected by testosterone"},
    {"label": "B", "text": "Testosterone may affect fertility; discuss gamete storage options before starting treatment"},
    {"label": "C", "text": "Fertility will definitely be lost"},
    {"label": "D", "text": "No discussion needed"},
    {"label": "E", "text": "Only discuss if patient asks"}
  ]'::jsonb,
  'B',
  'Gender affirming hormones (testosterone for trans men, oestrogen for trans women) may affect fertility. Before starting treatment, discuss future family plans and options for gamete storage (egg/sperm retrieval and storage via licensed NHS fertility service). This should be discussed proactively, not just if patient asks.',
  'Sexual Health',
  'medium',
  ARRAY['BMA: Role of GPs in managing adult patients with gender incongruence', 'GAH may affect fertility', 'Discuss gamete storage before starting', 'Refer to licensed NHS fertility service'],
  false
),

(
  'A patient with gender incongruence is referred to a GIC. The GIC asks the GP to review the patient and confirm they still need the service due to long waiting times. What should the GP do?',
  '[
    {"label": "A", "text": "Conduct the review as requested"},
    {"label": "B", "text": "Decline - GICs should manage their own waiting lists"},
    {"label": "C", "text": "Refer to mental health services instead"},
    {"label": "D", "text": "Prescribe hormones directly"},
    {"label": "E", "text": "Advise patient to go private"}
  ]'::jsonb,
  'B',
  'It is the responsibility of GICs to manage their waiting lists, not practices. GICs should approach patients directly to explore whether they still want access to services. This work is not part of GMS services and adds significant workload. Practices should decline such requests and advocate for proper commissioning of GID services.',
  'Sexual Health',
  'medium',
  ARRAY['BMA: Role of GPs in managing adult patients with gender incongruence', 'GICs responsible for managing waiting lists', 'Not part of GMS services', 'Advocate for proper commissioning'],
  false
),

(
  'A GP is prescribing oestrogen for a trans woman under shared care with a GIC. What monitoring is typically required?',
  '[
    {"label": "A", "text": "No monitoring needed"},
    {"label": "B", "text": "Blood pressure, weight, and hormone levels"},
    {"label": "C", "text": "Hormone levels only"},
    {"label": "D", "text": "Chest X-ray"},
    {"label": "E", "text": "ECG only"}
  ]'::jsonb,
  'B',
  'Monitoring for gender affirming hormone therapy typically includes: blood pressure, weight, hormone levels (oestradiol, testosterone), and may include monitoring for side effects (e.g., VTE risk with oestrogen, polycythaemia with testosterone). Follow GIC recommendations for monitoring. Shared care requires clear communication and defined responsibilities.',
  'Sexual Health',
  'medium',
  ARRAY['BMA: Role of GPs in managing adult patients with gender incongruence', 'Monitoring: BP, weight, hormone levels', 'Follow GIC recommendations', 'Shared care requires clear communication'],
  false
),

(
  'Under the Gender Recognition Act 2004, when can "protected information" about a person''s gender history be disclosed?',
  '[
    {"label": "A", "text": "Never"},
    {"label": "B", "text": "To any healthcare professional"},
    {"label": "C", "text": "To another health professional for a medical purpose with reasonable belief of patient consent"},
    {"label": "D", "text": "To family members if asked"},
    {"label": "E", "text": "In all medical records"}
  ]'::jsonb,
  'C',
  'The Gender Recognition Act 2004 restricts disclosure of "protected information" (gender history after gender change under the Act). It can only be disclosed to another health professional, for a medical purpose, with reasonable belief that the patient has consented. Patients in the process of transitioning are also entitled to protection against disclosure.',
  'Sexual Health',
  'medium',
  ARRAY['BMA: Role of GPs in managing adult patients with gender incongruence', 'Gender Recognition Act 2004', 'Protected information disclosure restrictions', 'Only to health professional for medical purpose with consent'],
  false
),

-- Geriatrics (add 15 questions)
(
  'An 85-year-old woman presents with recurrent falls over the past 3 months. On assessment, she has postural hypotension and is on multiple medications. What is the most important intervention?',
  '[
    {"label": "A", "text": "Prescribe vitamin D supplements"},
    {"label": "B", "text": "Review medications and reduce if possible"},
    {"label": "C", "text": "Refer to physiotherapy"},
    {"label": "D", "text": "Prescribe bisphosphonates"},
    {"label": "E", "text": "Arrange bone density scan"}
  ]'::jsonb,
  'B',
  'Medication review is crucial in falls prevention, especially in elderly patients on multiple medications. Polypharmacy increases fall risk. Consider reducing or stopping medications that cause postural hypotension, sedation, or dizziness. Other interventions (vitamin D, exercise, home modifications) are also important but medication review is often the most impactful.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Falls', 'Medication review crucial', 'Polypharmacy increases fall risk', 'Reduce medications causing postural hypotension'],
  false
),

(
  'An 80-year-old man presents with acute confusion over 2 days. He has no fever. On examination, he is disorientated and has a tremor. What is the most likely cause?',
  '[
    {"label": "A", "text": "Dementia"},
    {"label": "B", "text": "Delirium"},
    {"label": "C", "text": "Depression"},
    {"label": "D", "text": "Stroke"},
    {"label": "E", "text": "Normal ageing"}
  ]'::jsonb,
  'B',
  'Acute confusion with rapid onset (hours to days) suggests delirium, not dementia. Delirium is often caused by infection, medications, dehydration, or other acute illness. Dementia is gradual onset. Key features: acute onset, fluctuating course, inattention, disorganised thinking. Investigate for underlying cause.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Delirium', 'Acute onset = delirium', 'Fluctuating course characteristic', 'Investigate for underlying cause'],
  false
),

(
  'A 90-year-old woman with advanced dementia is admitted to hospital with pneumonia. Her family asks about resuscitation status. What is the most appropriate approach?',
  '[
    {"label": "A", "text": "Always attempt resuscitation"},
    {"label": "B", "text": "Discuss DNACPR with patient and family"},
    {"label": "C", "text": "Family decides without medical input"},
    {"label": "D", "text": "No discussion needed, assume full resuscitation"},
    {"label": "E", "text": "Only discuss if patient asks"}
  ]'::jsonb,
  'B',
  'DNACPR (Do Not Attempt Cardiopulmonary Resuscitation) decisions should be discussed with patients (if they have capacity) and families. In advanced dementia, CPR is unlikely to be successful and may cause harm. Discussion should be sensitive, involve family, and document clearly. This is a clinical decision, not just a family preference.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: DNACPR', 'Sensitive discussion with patient/family', 'CPR unlikely successful in advanced dementia', 'Document clearly'],
  false
),

(
  'An 82-year-old woman presents with unintentional weight loss (5kg over 3 months) and reduced appetite. She lives alone. What is the most important initial assessment?',
  '[
    {"label": "A", "text": "Prescribe nutritional supplements"},
    {"label": "B", "text": "Assess for underlying medical causes and social factors"},
    {"label": "C", "text": "Refer to dietitian"},
    {"label": "D", "text": "Arrange swallowing assessment"},
    {"label": "E", "text": "Reassure, normal for age"}
  ]'::jsonb,
  'B',
  'Unintentional weight loss in elderly requires comprehensive assessment: medical causes (malignancy, depression, dementia, medications, chronic disease), social factors (isolation, poverty, difficulty shopping/cooking), and functional decline. Nutritional supplements are supportive but addressing underlying cause is key.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Frailty', 'Assess medical and social causes', 'Consider isolation, poverty, functional decline', 'Address underlying cause'],
  false
),

(
  'An 87-year-old woman with dementia is brought in by her family. They report she has become increasingly agitated and is wandering at night. What is the most appropriate initial approach?',
  '[
    {"label": "A", "text": "Prescribe antipsychotics immediately"},
    {"label": "B", "text": "Assess for underlying causes (pain, infection, constipation)"},
    {"label": "C", "text": "Increase dementia medication"},
    {"label": "D", "text": "Refer to psychiatry"},
    {"label": "E", "text": "Reassure, normal progression"}
  ]'::jsonb,
  'B',
  'Agitation and wandering in dementia often have underlying causes: pain, infection (UTI), constipation, medication side effects, environmental factors. Assess and address these before considering antipsychotics. Antipsychotics only if severe and non-pharmacological measures fail, with clear discussion of risks.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Dementia', 'Agitation often has underlying cause', 'Assess for pain, infection, constipation', 'Antipsychotics last resort'],
  false
),

(
  'An 83-year-old man presents with a fall. He reports tripping over a rug. On assessment, he has poor vision and is on multiple medications. What is the most important intervention?',
  '[
    {"label": "A", "text": "Prescribe vitamin D"},
    {"label": "B", "text": "Home safety assessment and medication review"},
    {"label": "C", "text": "Refer to ophthalmology"},
    {"label": "D", "text": "Prescribe bisphosphonates"},
    {"label": "E", "text": "Advise to use walking frame"}
  ]'::jsonb,
  'B',
  'Falls prevention requires multifactorial approach: home safety (remove hazards like rugs, improve lighting), medication review (reduce fall-risk medications), vision assessment, exercise/balance training. Medication review is often most impactful. Vitamin D and bisphosphonates are for fracture prevention, not primary falls prevention.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Falls', 'Multifactorial approach', 'Home safety + medication review', 'Exercise and balance training'],
  false
),

(
  'An 88-year-old man with dementia is on multiple medications including benzodiazepines, anticholinergics, and opioids. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Continue all medications"},
    {"label": "B", "text": "Review medications using STOPP/START criteria and consider deprescribing"},
    {"label": "C", "text": "Add more medications to manage side effects"},
    {"label": "D", "text": "Refer to geriatrician"},
    {"label": "E", "text": "No changes needed"}
  ]'::jsonb,
  'B',
  'Polypharmacy in elderly, especially with high-risk medications (benzodiazepines, anticholinergics, opioids), requires medication review using STOPP/START criteria. Consider deprescribing medications that are inappropriate, cause side effects, or are no longer needed. Benzodiazepines and anticholinergics can worsen cognitive impairment and increase fall risk.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Multimorbidity', 'STOPP/START criteria for medication review', 'Benzodiazepines and anticholinergics high-risk in elderly', 'Deprescribing principles'],
  false
),

(
  'An 85-year-old woman presents with a Clinical Frailty Scale (CFS) score of 7. What does this indicate?',
  '[
    {"label": "A", "text": "Mild frailty"},
    {"label": "B", "text": "Moderate frailty"},
    {"label": "C", "text": "Severe frailty"},
    {"label": "D", "text": "Very severe frailty"},
    {"label": "E", "text": "Not frail"}
  ]'::jsonb,
  'C',
  'Clinical Frailty Scale: CFS 1-3 = fit/well, CFS 4-5 = mild frailty, CFS 6 = moderate frailty, CFS 7 = severely frail (completely dependent for personal care), CFS 8 = very severely frail (completely dependent, approaching end of life), CFS 9 = terminally ill. CFS 7 indicates severe frailty requiring comprehensive geriatric assessment.',
  'Geriatrics',
  'medium',
  ARRAY['NHS England: Toolkit for general practice in supporting older people living with frailty', 'CFS 7 = severe frailty', 'Completely dependent for personal care', 'Requires comprehensive geriatric assessment'],
  false
),

(
  'An 80-year-old man with multiple comorbidities is on 12 different medications. He presents with confusion and falls. What is the most important initial step?',
  '[
    {"label": "A", "text": "Add more medications"},
    {"label": "B", "text": "Comprehensive medication review using STOPP/START"},
    {"label": "C", "text": "Refer to all specialists"},
    {"label": "D", "text": "Admit to hospital"},
    {"label": "E", "text": "No changes needed"}
  ]'::jsonb,
  'B',
  'Polypharmacy (>10 medications) in elderly with confusion and falls requires comprehensive medication review. Use STOPP/START criteria to identify potentially inappropriate prescriptions (STOPP) and omissions (START). High-risk medications in elderly: benzodiazepines, anticholinergics, opioids, NSAIDs. Consider deprescribing.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Multimorbidity', 'STOPP/START for medication review', 'Polypharmacy increases adverse effects', 'High-risk medications in elderly'],
  false
),

(
  'An 86-year-old woman with dementia presents with worsening confusion over 1 week. On examination, she has a distended abdomen and is constipated. What is the most likely contributing factor?',
  '[
    {"label": "A", "text": "Progression of dementia"},
    {"label": "B", "text": "Constipation causing delirium"},
    {"label": "C", "text": "Normal ageing"},
    {"label": "D", "text": "Medication side effect only"},
    {"label": "E", "text": "No cause needed"}
  ]'::jsonb,
  'B',
  'Acute worsening of confusion in dementia suggests delirium. Constipation is a common cause of delirium in elderly. Other causes: infection (UTI), medications, dehydration, pain. Address constipation (laxatives, review medications causing constipation) and assess for other causes. Do not attribute to dementia progression without excluding reversible causes.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Delirium', 'Constipation can cause delirium', 'Acute worsening = delirium', 'Address reversible causes'],
  false
),

(
  'An 84-year-old man with heart failure is on ramipril, bisoprolol, furosemide, and digoxin. He presents with nausea and visual disturbance. What is the most likely cause?',
  '[
    {"label": "A", "text": "Heart failure worsening"},
    {"label": "B", "text": "Digoxin toxicity"},
    {"label": "C", "text": "ACE inhibitor side effect"},
    {"label": "D", "text": "Beta-blocker side effect"},
    {"label": "E", "text": "Normal for age"}
  ]'::jsonb,
  'B',
  'Nausea + visual disturbance (yellow/green vision) in a patient on digoxin suggests digoxin toxicity. Check digoxin level and potassium (hypokalaemia increases toxicity). Common in elderly due to reduced renal function, drug interactions, or electrolyte imbalances. Stop digoxin and treat hyperkalaemia if present.',
  'Geriatrics',
  'high',
  ARRAY['BNF: Prescribing in the elderly', 'Digoxin toxicity: nausea + visual disturbance', 'Check digoxin level and potassium', 'Hypokalaemia increases toxicity'],
  false
),

(
  'An 81-year-old woman presents with a gait speed of 6 seconds to walk 4 metres. What does this indicate?',
  '[
    {"label": "A", "text": "Normal for age"},
    {"label": "B", "text": "Indication of frailty"},
    {"label": "C", "text": "Requires immediate hospital admission"},
    {"label": "D", "text": "No significance"},
    {"label": "E", "text": "Indicates only muscle weakness"}
  ]'::jsonb,
  'B',
  'Gait speed >5 seconds to walk 4 metres is an indication of frailty. Gait speed is a simple, validated test for frailty assessment. Slower gait speed is associated with increased risk of falls, disability, and mortality. Should prompt comprehensive geriatric assessment.',
  'Geriatrics',
  'medium',
  ARRAY['NHS England: Toolkit for general practice in supporting older people living with frailty', 'Gait speed >5 seconds = frailty indicator', 'Simple validated test', 'Associated with falls and disability risk'],
  false
),

(
  'An 79-year-old man presents with a PRISMA7 score of 4. What does this indicate?',
  '[
    {"label": "A", "text": "Not frail"},
    {"label": "B", "text": "Mild frailty"},
    {"label": "C", "text": "Frailty (score ≥3)"},
    {"label": "D", "text": "Severe frailty"},
    {"label": "E", "text": "Terminal illness"}
  ]'::jsonb,
  'C',
  'PRISMA7 is a 7-item questionnaire for frailty screening. A score of 3 or more indicates frailty. Questions cover: age >85, male gender, health problems limiting activities, need for regular help, health problems requiring staying at home, social support, use of walking aids. Score of 4 indicates frailty requiring further assessment.',
  'Geriatrics',
  'medium',
  ARRAY['NHS England: Toolkit for general practice in supporting older people living with frailty', 'PRISMA7 score ≥3 = frailty', '7-item screening questionnaire', 'Requires further assessment'],
  false
),

(
  'An 88-year-old woman with advanced dementia is experiencing pain. She is unable to communicate verbally. What is the most appropriate approach to pain assessment?',
  '[
    {"label": "A", "text": "No pain assessment possible"},
    {"label": "B", "text": "Use observational pain scales (e.g., Abbey Pain Scale)"},
    {"label": "C", "text": "Assume no pain"},
    {"label": "D", "text": "Only treat if family reports pain"},
    {"label": "E", "text": "Refer to pain clinic"}
  ]'::jsonb,
  'B',
  'For patients with advanced dementia who cannot communicate, use observational pain assessment tools (e.g., Abbey Pain Scale, PAINAD). Look for: facial expressions, vocalisations, body movements, changes in behaviour, physiological changes. Pain is often under-recognised and under-treated in dementia. Consider trial of analgesia if pain suspected.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Dementia', 'Observational pain scales for non-communicative patients', 'Abbey Pain Scale, PAINAD', 'Pain often under-recognised in dementia'],
  false
),

(
  'An 82-year-old man with multiple comorbidities is on warfarin. He develops a UTI and requires antibiotics. Which antibiotic is least likely to interact with warfarin?',
  '[
    {"label": "A", "text": "Trimethoprim"},
    {"label": "B", "text": "Ciprofloxacin"},
    {"label": "C", "text": "Amoxicillin"},
    {"label": "D", "text": "Co-amoxiclav"},
    {"label": "E", "text": "Metronidazole"}
  ]'::jsonb,
  'C',
  'Amoxicillin has minimal interaction with warfarin. Trimethoprim, ciprofloxacin, and metronidazole can increase INR significantly and require closer monitoring. Co-amoxiclav also has minimal interaction. When prescribing antibiotics to elderly patients on warfarin, always check for interactions and consider closer INR monitoring.',
  'Geriatrics',
  'medium',
  ARRAY['BNF: Prescribing in the elderly', 'Amoxicillin minimal warfarin interaction', 'Trimethoprim and ciprofloxacin increase INR', 'Monitor INR more closely with any antibiotic'],
  false
),

(
  'An 85-year-old woman presents with unintentional weight loss. On comprehensive geriatric assessment, she scores 6 on the Clinical Frailty Scale. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Reassure, normal for age"},
    {"label": "B", "text": "Code as moderate frailty and arrange comprehensive geriatric assessment"},
    {"label": "C", "text": "Refer to hospital"},
    {"label": "D", "text": "Prescribe nutritional supplements only"},
    {"label": "E", "text": "No action needed"}
  ]'::jsonb,
  'B',
  'CFS score of 6 indicates moderate frailty. Patients with moderate or severe frailty should have their frailty diagnosis coded in their electronic health record. Arrange comprehensive geriatric assessment including: medication review, falls assessment, functional assessment, social circumstances, and care planning.',
  'Geriatrics',
  'medium',
  ARRAY['NHS England: Toolkit for general practice in supporting older people living with frailty', 'CFS 6 = moderate frailty', 'Code frailty diagnosis', 'Comprehensive geriatric assessment'],
  false
),

-- Men''s Health (add 10 questions)
(
  'A 60-year-old man presents with lower urinary tract symptoms. IPSS score is 18. Digital rectal examination reveals an enlarged, smooth prostate. PSA is 3.8ng/mL. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Refer to urology for suspected prostate cancer"},
    {"label": "B", "text": "Start tamsulosin (alpha-blocker)"},
    {"label": "C", "text": "Start finasteride (5-alpha reductase inhibitor)"},
    {"label": "D", "text": "Start combination therapy"},
    {"label": "E", "text": "Advise lifestyle measures only"}
  ]'::jsonb,
  'B',
  'IPSS 18 indicates moderate-severe LUTS. With enlarged smooth prostate and normal PSA, this is benign prostatic hyperplasia (BPH). First-line treatment is alpha-blocker (tamsulosin) for symptom relief. Finasteride is for large prostates (>30g) or if PSA >1.5. Combination is for severe symptoms or if alpha-blocker alone insufficient.',
  'Men''s Health',
  'medium',
  ARRAY['NICE CKS: LUTS in men', 'IPSS for symptom severity', 'Alpha-blocker first-line for BPH', 'Finasteride for large prostate or PSA >1.5'],
  false
),

(
  'A 55-year-old man presents with erectile dysfunction. He has type 2 diabetes and hypertension. What is the first-line treatment?',
  '[
    {"label": "A", "text": "Sildenafil 50mg as required"},
    {"label": "B", "text": "Testosterone replacement"},
    {"label": "C", "text": "Psychosexual counselling only"},
    {"label": "D", "text": "Refer to urology"},
    {"label": "E", "text": "No treatment available"}
  ]'::jsonb,
  'A',
  'For erectile dysfunction, first-line is PDE5 inhibitor (sildenafil, tadalafil). Sildenafil 50mg as required (can increase to 100mg if needed). Check for contraindications (nitrates, severe cardiac disease). Address underlying causes (diabetes control, cardiovascular risk). Testosterone only if hypogonadism confirmed.',
  'Men''s Health',
  'medium',
  ARRAY['NICE CKS: Erectile dysfunction', 'PDE5 inhibitor first-line', 'Sildenafil 50mg as required', 'Check contraindications (nitrates)'],
  false
),

(
  'A 50-year-old man presents with fatigue, low libido, and reduced muscle mass. Testosterone is 8nmol/L (normal 8-30). What is the diagnosis?',
  '[
    {"label": "A", "text": "Normal testosterone"},
    {"label": "B", "text": "Hypogonadism - requires treatment"},
    {"label": "C", "text": "Borderline - repeat test"},
    {"label": "D", "text": "Hypergonadism"},
    {"label": "E", "text": "No diagnosis possible"}
  ]'::jsonb,
  'C',
  'Testosterone 8nmol/L is at the lower end of normal range. If symptoms suggest hypogonadism, repeat testosterone test (preferably morning sample, as levels are highest). Also check LH/FSH to distinguish primary (high LH/FSH) vs secondary (low/normal LH/FSH) hypogonadism. Consider other causes of symptoms (depression, thyroid, sleep apnoea).',
  'Men''s Health',
  'medium',
  ARRAY['NICE CKS: Testosterone deficiency', 'Borderline testosterone: repeat test', 'Morning sample for accuracy', 'Check LH/FSH to distinguish primary vs secondary'],
  false
),

(
  'A 25-year-old man presents with acute severe testicular pain. On examination, the testis is tender, swollen, and lies horizontally. What is the most likely diagnosis and urgent action?',
  '[
    {"label": "A", "text": "Epididymitis - prescribe antibiotics"},
    {"label": "B", "text": "Testicular torsion - urgent surgical referral"},
    {"label": "C", "text": "Orchitis - prescribe antibiotics"},
    {"label": "D", "text": "Testicular cancer - refer to urology"},
    {"label": "E", "text": "Varicocele - reassure"}
  ]'::jsonb,
  'B',
  'Acute severe testicular pain + horizontal lie is classic for testicular torsion. This is a surgical emergency requiring immediate referral (within 6 hours) for surgical exploration and detorsion to save the testis. Do not delay with antibiotics or imaging. Epididymitis is more gradual onset and testis lies normally.',
  'Men''s Health',
  'high',
  ARRAY['NICE CKS: Testicular torsion', 'Acute pain + horizontal lie = torsion', 'Surgical emergency - within 6 hours', 'Do not delay with imaging'],
  false
),

(
  'A 30-year-old man and his partner present with infertility. Semen analysis shows low sperm count. What is the most appropriate initial GP investigation?',
  '[
    {"label": "A", "text": "Refer directly to fertility clinic"},
    {"label": "B", "text": "Check FSH, LH, testosterone, and prolactin"},
    {"label": "C", "text": "No investigation needed"},
    {"label": "D", "text": "Prescribe testosterone"},
    {"label": "E", "text": "Arrange testicular ultrasound"}
  ]'::jsonb,
  'B',
  'For male infertility with low sperm count, initial GP investigations include: FSH, LH, testosterone (to assess for hypogonadism), and prolactin (prolactinoma can cause infertility). Also consider: testicular examination, history (undescended testis, mumps, trauma), lifestyle factors (smoking, alcohol, heat exposure). Refer to fertility clinic if abnormal or if no cause found.',
  'Men''s Health',
  'medium',
  ARRAY['NICE CKS: Male infertility', 'Initial investigations: FSH, LH, testosterone, prolactin', 'Assess for hypogonadism', 'Refer to fertility clinic if abnormal'],
  false
),

(
  'A 65-year-old man with BPH on tamsulosin presents with acute urinary retention. What is the most appropriate immediate management?',
  '[
    {"label": "A", "text": "Increase tamsulosin dose"},
    {"label": "B", "text": "Urgent catheterisation"},
    {"label": "C", "text": "Prescribe antibiotics"},
    {"label": "D", "text": "Refer to urology (routine)"},
    {"label": "E", "text": "Prescribe finasteride"}
  ]'::jsonb,
  'B',
  'Acute urinary retention requires immediate catheterisation to relieve obstruction and prevent complications (bladder damage, infection). After catheterisation, can attempt trial without catheter (TWOC) after 24-48 hours. If fails, consider TURP or other surgical options. Do not delay catheterisation.',
  'Men''s Health',
  'high',
  ARRAY['NICE CKS: LUTS in men', 'Acute retention = immediate catheterisation', 'TWOC after 24-48 hours', 'TURP if TWOC fails'],
  false
),

(
  'A 70-year-old man asks about PSA testing for prostate cancer screening. What is the most appropriate advice?',
  '[
    {"label": "A", "text": "Routine PSA screening is recommended for all men"},
    {"label": "B", "text": "PSA testing is not offered as a population screening programme"},
    {"label": "C", "text": "PSA testing only if symptoms present"},
    {"label": "D", "text": "PSA testing only if family history"},
    {"label": "E", "text": "PSA testing only if >80 years"}
  ]'::jsonb,
  'B',
  'PSA testing is not offered as a population screening programme in the UK due to concerns about over-diagnosis and over-treatment. However, men can request PSA testing after informed discussion about benefits and risks. If PSA raised, consider age-adjusted ranges and refer if concerning. Shared decision-making is key.',
  'Men''s Health',
  'medium',
  ARRAY['NICE CKS: Prostate cancer', 'PSA not offered as population screening', 'Can request after informed discussion', 'Shared decision-making important'],
  false
),

(
  'A 45-year-old man presents with a painless testicular lump. On examination, there is a hard, irregular mass. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Reassure and review in 3 months"},
    {"label": "B", "text": "Prescribe antibiotics"},
    {"label": "C", "text": "Refer for urgent urology assessment (2-week wait)"},
    {"label": "D", "text": "Arrange ultrasound only"},
    {"label": "E", "text": "Advise to monitor"}
  ]'::jsonb,
  'C',
  'Painless testicular lump with hard, irregular mass is suspicious for testicular cancer. This requires urgent 2-week wait referral to urology. Do not delay with monitoring or antibiotics. Testicular cancer is most common in young men (15-35) but can occur at any age. Early diagnosis improves outcomes.',
  'Men''s Health',
  'high',
  ARRAY['NICE CKS: Testicular cancer', 'Painless hard testicular lump = 2-week wait', 'Most common 15-35 years', 'Early diagnosis improves outcomes'],
  false
),

(
  'A 60-year-old man with erectile dysfunction has a normal testosterone level. He has type 2 diabetes. What is the most likely cause?',
  '[
    {"label": "A", "text": "Testosterone deficiency"},
    {"label": "B", "text": "Vascular (diabetes-related)"},
    {"label": "C", "text": "Psychogenic"},
    {"label": "D", "text": "Medication-induced only"},
    {"label": "E", "text": "Normal ageing"}
  ]'::jsonb,
  'B',
  'Erectile dysfunction in men with diabetes is commonly vascular (diabetes causes endothelial dysfunction and microvascular disease affecting penile blood flow). Other causes: neuropathy, psychological factors, medications. PDE5 inhibitors are first-line. Address cardiovascular risk factors (diabetes control, blood pressure, lipids).',
  'Men''s Health',
  'medium',
  ARRAY['NICE CKS: Erectile dysfunction', 'Diabetes commonly causes vascular ED', 'Endothelial dysfunction and microvascular disease', 'PDE5 inhibitors first-line'],
  false
),

(
  'A 55-year-old man presents with lower urinary tract symptoms. He has a PSA of 6.5ng/mL (age-adjusted normal <3.5 for 50-59). What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Reassure, PSA is normal"},
    {"label": "B", "text": "Refer to urology for further assessment"},
    {"label": "C", "text": "Prescribe tamsulosin only"},
    {"label": "D", "text": "Repeat PSA in 6 months"},
    {"label": "E", "text": "No action needed"}
  ]'::jsonb,
  'B',
  'Raised PSA (above age-adjusted normal) with LUTS requires referral to urology for further assessment. Consider: DRE findings, PSA velocity, free/total PSA ratio. May need prostate biopsy. Do not delay referral. However, raised PSA can also be due to BPH, prostatitis, or recent procedures (catheter, cystoscopy).',
  'Men''s Health',
  'medium',
  ARRAY['NICE CKS: Prostate cancer', 'Raised PSA = refer to urology', 'Age-adjusted PSA ranges', 'Consider DRE, PSA velocity'],
  false
),

-- Allergy & Immunology (add 8 questions)
(
  'A 30-year-old woman presents with seasonal sneezing, rhinorrhoea, and itchy eyes. Symptoms occur in spring and summer. What is the first-line treatment?',
  '[
    {"label": "A", "text": "Oral antihistamines"},
    {"label": "B", "text": "Intranasal corticosteroid spray"},
    {"label": "C", "text": "Oral corticosteroids"},
    {"label": "D", "text": "Antibiotics"},
    {"label": "E", "text": "No treatment needed"}
  ]'::jsonb,
  'B',
  'For allergic rhinitis, first-line treatment is intranasal corticosteroid spray (e.g., beclomethasone, fluticasone). Oral antihistamines can be added for additional symptom control. Intranasal corticosteroids are more effective than antihistamines alone for nasal symptoms. Avoidance of allergens and barrier methods (nasal filters) can also help.',
  'Allergy & Immunology',
  'medium',
  ARRAY['NICE CKS: Allergic rhinitis', 'Intranasal corticosteroid first-line', 'More effective than antihistamines alone', 'Oral antihistamines can be added'],
  false
),

(
  'A 25-year-old man presents with anaphylaxis after eating peanuts. He has urticaria, angioedema, and difficulty breathing. What is the most appropriate immediate management?',
  '[
    {"label": "A", "text": "Oral antihistamine"},
    {"label": "B", "text": "Intramuscular adrenaline (epinephrine) 0.5mg"},
    {"label": "C", "text": "Oral corticosteroids"},
    {"label": "D", "text": "Inhaled salbutamol"},
    {"label": "E", "text": "Wait and observe"}
  ]'::jsonb,
  'B',
  'Anaphylaxis is a medical emergency. Immediate management: IM adrenaline 0.5mg (0.5ml of 1:1000) into anterolateral thigh. Then: call 999, lie patient flat with legs raised, give oxygen if available, consider second dose after 5 minutes if no improvement. Antihistamines and steroids are second-line, not first-line.',
  'Allergy & Immunology',
  'high',
  ARRAY['NICE CKS: Anaphylaxis', 'IM adrenaline first-line for anaphylaxis', '0.5mg (0.5ml 1:1000) into thigh', 'Call 999, lie flat, legs raised'],
  false
),

(
  'A 40-year-old woman reports a penicillin allergy. She requires antibiotics for a chest infection. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Prescribe amoxicillin anyway"},
    {"label": "B", "text": "Use alternative antibiotic (e.g., clarithromycin, doxycycline)"},
    {"label": "C", "text": "Refer to allergy clinic first"},
    {"label": "D", "text": "Prescribe co-amoxiclav"},
    {"label": "E", "text": "No antibiotics needed"}
  ]'::jsonb,
  'B',
  'If patient reports penicillin allergy, use alternative antibiotic (e.g., clarithromycin, doxycycline for respiratory infections). Do not prescribe penicillin or related antibiotics (amoxicillin, co-amoxiclav, flucloxacillin) without allergy testing. Document the allergy clearly. Consider referral to allergy clinic for testing if frequent antibiotic use needed.',
  'Allergy & Immunology',
  'medium',
  ARRAY['NICE CKS: Drug allergy', 'Avoid penicillin if allergy reported', 'Use alternative antibiotics', 'Document allergy clearly'],
  false
),

(
  'A 35-year-old woman presents with chronic urticaria (wheals lasting >6 weeks). She has tried standard-dose antihistamines without improvement. What is the next step?',
  '[
    {"label": "A", "text": "Increase antihistamine dose (up to 4x standard dose)"},
    {"label": "B", "text": "Prescribe oral corticosteroids"},
    {"label": "C", "text": "Prescribe antibiotics"},
    {"label": "D", "text": "Refer to dermatology"},
    {"label": "E", "text": "No further treatment"}
  ]'::jsonb,
  'A',
  'For chronic urticaria unresponsive to standard-dose antihistamines, increase dose up to 4x standard dose (e.g., cetirizine 10mg up to 40mg daily). If still unresponsive, consider adding H2-receptor antagonist or leukotriene receptor antagonist. Oral corticosteroids only for short-term control of flares. Refer to dermatology/allergy if severe or unresponsive.',
  'Allergy & Immunology',
  'medium',
  ARRAY['NICE CKS: Urticaria', 'Increase antihistamine dose up to 4x standard', 'Add H2-receptor antagonist if needed', 'Oral steroids only for short-term flares'],
  false
),

(
  'A 20-year-old woman presents with angioedema of the lips and tongue after eating shellfish. She has no urticaria. What is the most appropriate immediate action?',
  '[
    {"label": "A", "text": "Prescribe oral antihistamine"},
    {"label": "B", "text": "Assess airway and consider IM adrenaline if airway compromise"},
    {"label": "C", "text": "Prescribe oral corticosteroids"},
    {"label": "D", "text": "Reassure and discharge"},
    {"label": "E", "text": "Prescribe antibiotics"}
  ]'::jsonb,
  'B',
  'Angioedema affecting lips and tongue can progress to airway obstruction - this is a medical emergency. Assess airway immediately. If airway compromise or signs of anaphylaxis, give IM adrenaline and call 999. Angioedema without urticaria can be hereditary angioedema (C1 esterase inhibitor deficiency) or ACE inhibitor-induced, but food-induced angioedema can also occur.',
  'Allergy & Immunology',
  'high',
  ARRAY['NICE CKS: Anaphylaxis', 'Angioedema of tongue/lips = airway risk', 'Assess airway immediately', 'IM adrenaline if airway compromise'],
  false
),

(
  'A 15-year-old boy presents with suspected food allergy. He had an immediate reaction (within minutes) to eating eggs with urticaria and vomiting. What type of allergy is this most likely to be?',
  '[
    {"label": "A", "text": "Non-IgE mediated"},
    {"label": "B", "text": "IgE-mediated"},
    {"label": "C", "text": "Delayed hypersensitivity"},
    {"label": "D", "text": "Food intolerance"},
    {"label": "E", "text": "Cannot determine"}
  ]'::jsonb,
  'B',
  'Immediate reaction (within minutes to 2 hours) with urticaria and vomiting suggests IgE-mediated food allergy. Non-IgE mediated reactions are delayed (hours to days) and typically cause GI symptoms (e.g., food protein-induced enterocolitis). IgE-mediated allergies can be confirmed with skin prick testing or specific IgE blood tests.',
  'Allergy & Immunology',
  'medium',
  ARRAY['NICE CKS: Food allergy', 'Immediate reaction = IgE-mediated', 'Urticaria and vomiting characteristic', 'Skin prick test or specific IgE for confirmation'],
  false
),

(
  'A 30-year-old woman with known penicillin allergy requires treatment for syphilis. What is the most appropriate alternative?',
  '[
    {"label": "A", "text": "Amoxicillin"},
    {"label": "B", "text": "Doxycycline 100mg BD for 14 days"},
    {"label": "C", "text": "Azithromycin"},
    {"label": "D", "text": "Ceftriaxone"},
    {"label": "E", "text": "No alternative available"}
  ]'::jsonb,
  'B',
  'For syphilis in penicillin-allergic patients, doxycycline 100mg BD for 14 days is the alternative. Azithromycin is not recommended due to resistance. Ceftriaxone has cross-reactivity with penicillin. For primary/secondary syphilis, benzathine penicillin is first-line, but doxycycline is acceptable alternative if penicillin allergic.',
  'Allergy & Immunology',
  'medium',
  ARRAY['NICE CKS: Syphilis', 'Doxycycline alternative if penicillin allergic', '100mg BD for 14 days', 'Azithromycin not recommended due to resistance'],
  false
),

(
  'A 25-year-old man presents with anaphylaxis and is prescribed an adrenaline auto-injector. What should be discussed?',
  '[
    {"label": "A", "text": "How to use it and when to seek emergency help"},
    {"label": "B", "text": "Only how to use it"},
    {"label": "C", "text": "No discussion needed"},
    {"label": "D", "text": "Only when to seek help"},
    {"label": "E", "text": "Prescribe but no education"}
  ]'::jsonb,
  'A',
  'When prescribing adrenaline auto-injector, provide education on: how to use it (into anterolateral thigh, hold for 10 seconds), when to use it (signs of anaphylaxis), always call 999 after use, carry two devices, check expiry dates, replace before expiry. Refer to allergy clinic for further assessment and management.',
  'Allergy & Immunology',
  'medium',
  ARRAY['NICE CKS: Anaphylaxis', 'Education on auto-injector use essential', 'Into thigh, hold 10 seconds', 'Always call 999 after use'],
  false
),

-- Ophthalmology (add 8 questions)
(
  'A 60-year-old man presents with sudden painless loss of vision in one eye. On examination, there is a relative afferent pupillary defect. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Central retinal artery occlusion"},
    {"label": "B", "text": "Central retinal vein occlusion"},
    {"label": "C", "text": "Retinal detachment"},
    {"label": "D", "text": "Age-related macular degeneration"},
    {"label": "E", "text": "Cataract"}
  ]'::jsonb,
  'A',
  'Sudden painless vision loss + RAPD suggests central retinal artery occlusion (CRAO) - a medical emergency. This is a stroke equivalent. Immediate referral to ophthalmology and stroke team required. Time-critical for potential treatment. Other causes: CRVO (less acute), retinal detachment (flashes/floaters), AMD (gradual), cataract (gradual).',
  'Ophthalmology',
  'high',
  ARRAY['NICE CKS: Visual loss', 'Sudden painless loss + RAPD = CRAO', 'Medical emergency - stroke equivalent', 'Immediate referral required'],
  false
),

(
  'A 55-year-old woman presents with a red, painful eye with photophobia and reduced vision. The pupil is mid-dilated and fixed. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Conjunctivitis"},
    {"label": "B", "text": "Acute angle-closure glaucoma"},
    {"label": "C", "text": "Uveitis"},
    {"label": "D", "text": "Corneal abrasion"},
    {"label": "E", "text": "Blepharitis"}
  ]'::jsonb,
  'B',
  'Red painful eye + photophobia + reduced vision + mid-dilated fixed pupil suggests acute angle-closure glaucoma - a medical emergency. Other features: halos around lights, nausea/vomiting, headache. Requires immediate referral to ophthalmology for treatment to prevent permanent vision loss. Conjunctivitis has normal vision and no pain. Uveitis has constricted pupil.',
  'Ophthalmology',
  'high',
  ARRAY['NICE CKS: Glaucoma', 'Acute angle-closure: red + painful + reduced vision + fixed pupil', 'Medical emergency', 'Immediate ophthalmology referral'],
  false
),

(
  'A 70-year-old woman presents with gradual visual loss and distortion of central vision. She reports straight lines appearing wavy. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Cataract"},
    {"label": "B", "text": "Age-related macular degeneration (wet)"},
    {"label": "C", "text": "Glaucoma"},
    {"label": "D", "text": "Diabetic retinopathy"},
    {"label": "E", "text": "Retinal detachment"}
  ]'::jsonb,
  'B',
  'Gradual visual loss + distortion (metamorphopsia - straight lines appearing wavy) suggests wet age-related macular degeneration (AMD). This requires urgent referral to ophthalmology (within days) for anti-VEGF treatment to prevent further vision loss. Dry AMD causes gradual loss without distortion. Amsler grid can help detect distortion.',
  'Ophthalmology',
  'high',
  ARRAY['NICE CKS: Age-related macular degeneration', 'Distortion (metamorphopsia) = wet AMD', 'Urgent referral for anti-VEGF treatment', 'Amsler grid for detection'],
  false
),

(
  'A 25-year-old man presents with a red eye, sticky discharge, and mild discomfort. Vision is normal. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Bacterial conjunctivitis"},
    {"label": "B", "text": "Viral conjunctivitis"},
    {"label": "C", "text": "Allergic conjunctivitis"},
    {"label": "D", "text": "Acute angle-closure glaucoma"},
    {"label": "E", "text": "Uveitis"}
  ]'::jsonb,
  'A',
  'Red eye + sticky discharge + normal vision suggests bacterial conjunctivitis. Treatment: chloramphenicol eye drops/ointment. Viral conjunctivitis has watery discharge. Allergic conjunctivitis has itching and bilateral involvement. Red flags: pain, photophobia, reduced vision, fixed pupil (glaucoma, uveitis) - these require urgent referral.',
  'Ophthalmology',
  'medium',
  ARRAY['NICE CKS: Conjunctivitis', 'Sticky discharge = bacterial', 'Chloramphenicol treatment', 'Red flags: pain, photophobia, reduced vision'],
  false
),

(
  'A 65-year-old man with type 2 diabetes asks about diabetic eye screening. How often should he be screened?',
  '[
    {"label": "A", "text": "Annually"},
    {"label": "B", "text": "Every 2 years"},
    {"label": "C", "text": "Only if vision problems"},
    {"label": "D", "text": "Every 6 months"},
    {"label": "E", "text": "No screening needed"}
  ]'::jsonb,
  'A',
  'Diabetic eye screening (retinal photography) should be offered annually to all people with diabetes aged 12 and over. This detects diabetic retinopathy before vision is affected. If retinopathy detected, may need more frequent screening or referral to ophthalmology. Do not wait for vision problems - screening is preventive.',
  'Ophthalmology',
  'medium',
  ARRAY['NICE CKS: Diabetic retinopathy', 'Annual diabetic eye screening', 'For all people with diabetes aged 12+', 'Detects retinopathy before vision affected'],
  false
),

(
  'A 60-year-old woman presents with sudden onset of flashes and floaters, followed by a curtain-like shadow across her vision. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Migraine with aura"},
    {"label": "B", "text": "Retinal detachment"},
    {"label": "C", "text": "Vitreous haemorrhage"},
    {"label": "D", "text": "Posterior vitreous detachment"},
    {"label": "E", "text": "Cataract"}
  ]'::jsonb,
  'B',
  'Sudden flashes + floaters + curtain-like shadow suggests retinal detachment - a medical emergency. Requires urgent referral to ophthalmology (same day) for possible surgical repair. Posterior vitreous detachment causes flashes and floaters but no shadow. Vitreous haemorrhage causes sudden vision loss. Delay can result in permanent vision loss.',
  'Ophthalmology',
  'high',
  ARRAY['NICE CKS: Retinal detachment', 'Flashes + floaters + shadow = retinal detachment', 'Medical emergency', 'Urgent same-day ophthalmology referral'],
  false
),

(
  'A 70-year-old man is found to have an intraocular pressure of 28mmHg on routine screening. He has no symptoms. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Reassure, normal"},
    {"label": "B", "text": "Refer to ophthalmology for further assessment"},
    {"label": "C", "text": "Prescribe eye drops immediately"},
    {"label": "D", "text": "Repeat in 6 months"},
    {"label": "E", "text": "No action needed"}
  ]'::jsonb,
  'B',
  'Raised intraocular pressure (>21mmHg) requires referral to ophthalmology for assessment of open-angle glaucoma. IOP alone is not diagnostic - need assessment of optic disc, visual fields, and corneal thickness. Open-angle glaucoma is often asymptomatic until advanced. Early detection and treatment can prevent vision loss.',
  'Ophthalmology',
  'medium',
  ARRAY['NICE CKS: Glaucoma', 'Raised IOP = refer to ophthalmology', 'IOP alone not diagnostic', 'Assess optic disc, visual fields, corneal thickness'],
  false
),

(
  'A 45-year-old woman presents with a red eye, pain, and photophobia. The pupil is constricted. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Conjunctivitis"},
    {"label": "B", "text": "Acute angle-closure glaucoma"},
    {"label": "C", "text": "Anterior uveitis (iritis)"},
    {"label": "D", "text": "Corneal abrasion"},
    {"label": "E", "text": "Blepharitis"}
  ]'::jsonb,
  'C',
  'Red eye + pain + photophobia + constricted pupil suggests anterior uveitis (iritis). May be associated with autoimmune conditions (ankylosing spondylitis, inflammatory bowel disease, sarcoidosis). Requires urgent referral to ophthalmology for steroid eye drops to prevent complications. Acute angle-closure has mid-dilated fixed pupil. Conjunctivitis has no pain/photophobia.',
  'Ophthalmology',
  'high',
  ARRAY['NICE CKS: Uveitis', 'Red + painful + photophobia + constricted pupil = uveitis', 'Urgent ophthalmology referral', 'May be associated with autoimmune conditions'],
  false
),

-- ENT (add 8 questions)
(
  'A 45-year-old woman presents with sudden onset of vertigo, worse on head movement, lasting 30 seconds. She has no hearing loss or tinnitus. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Ménière''s disease"},
    {"label": "B", "text": "Benign paroxysmal positional vertigo (BPPV)"},
    {"label": "C", "text": "Vestibular neuritis"},
    {"label": "D", "text": "Stroke"},
    {"label": "E", "text": "Migraine-associated vertigo"}
  ]'::jsonb,
  'B',
  'Sudden vertigo triggered by head movement, lasting seconds, with no hearing loss suggests BPPV. Hallpike test confirms (nystagmus and vertigo on head positioning). Treatment is Epley manoeuvre. Ménière''s has hearing loss and tinnitus. Vestibular neuritis lasts days. Stroke would have other neurological signs.',
  'ENT',
  'medium',
  ARRAY['NICE CKS: Vertigo', 'BPPV: head movement triggered, seconds duration', 'Hallpike test diagnostic', 'Epley manoeuvre treatment'],
  false
),

(
  'A 30-year-old man presents with sudden sensorineural hearing loss in one ear over 24 hours. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Prescribe antibiotics"},
    {"label": "B", "text": "Refer for urgent ENT assessment (same day)"},
    {"label": "C", "text": "Prescribe decongestants"},
    {"label": "D", "text": "Arrange hearing test as outpatient"},
    {"label": "E", "text": "Reassure and review"}
  ]'::jsonb,
  'B',
  'Sudden sensorineural hearing loss is a medical emergency requiring urgent same-day ENT referral. May be due to viral infection, vascular event, or other causes. Early treatment (within 48-72 hours) with steroids may improve outcomes. Do not delay with antibiotics or outpatient appointments.',
  'ENT',
  'high',
  ARRAY['NICE CKS: Hearing loss', 'Sudden sensorineural loss = medical emergency', 'Urgent same-day ENT referral', 'Early steroid treatment may help'],
  false
),

(
  'A 25-year-old woman presents with a sore throat, fever, and difficulty swallowing. On examination, there is unilateral tonsillar swelling with uvula deviation. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Tonsillitis"},
    {"label": "B", "text": "Peritonsillar abscess (quinsy)"},
    {"label": "C", "text": "Pharyngitis"},
    {"label": "D", "text": "Epiglottitis"},
    {"label": "E", "text": "Laryngitis"}
  ]'::jsonb,
  'B',
  'Unilateral tonsillar swelling + uvula deviation suggests peritonsillar abscess (quinsy). This requires urgent ENT referral for drainage. Tonsillitis is bilateral. Epiglottitis is rare in adults and would have stridor. Do not delay - quinsy can cause airway compromise.',
  'ENT',
  'high',
  ARRAY['NICE CKS: Sore throat', 'Unilateral swelling + uvula deviation = quinsy', 'Urgent ENT referral for drainage', 'Can cause airway compromise'],
  false
),

(
  'A 40-year-old man presents with hoarseness for 4 weeks. He is a smoker. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Reassure and review if persists"},
    {"label": "B", "text": "Prescribe voice rest"},
    {"label": "C", "text": "Refer for urgent ENT assessment (2-week wait)"},
    {"label": "D", "text": "Prescribe antibiotics"},
    {"label": "E", "text": "Prescribe steroids"}
  ]'::jsonb,
  'C',
  'Hoarseness >3 weeks, especially in a smoker, requires urgent 2-week wait referral to ENT to exclude laryngeal cancer. Red flags: persistent hoarseness >3 weeks, smoking, dysphagia, otalgia, neck lump. Do not delay with symptomatic treatment.',
  'ENT',
  'high',
  ARRAY['NICE CKS: Hoarseness', 'Hoarseness >3 weeks = 2-week wait', 'Especially if smoker', 'Exclude laryngeal cancer'],
  false
),

(
  'A 35-year-old woman presents with otitis externa. The ear canal is swollen and there is discharge. What is the first-line treatment?',
  '[
    {"label": "A", "text": "Oral antibiotics"},
    {"label": "B", "text": "Topical antibiotic/steroid ear drops"},
    {"label": "C", "text": "Oral steroids"},
    {"label": "D", "text": "Ear syringing"},
    {"label": "E", "text": "No treatment needed"}
  ]'::jsonb,
  'B',
  'For otitis externa, first-line treatment is topical antibiotic/steroid ear drops (e.g., Otomize, Sofradex). Ensure ear canal is clear of debris first. Oral antibiotics only if severe, spreading cellulitis, or immunocompromised. Avoid ear syringing if active infection. Keep ear dry.',
  'ENT',
  'medium',
  ARRAY['NICE CKS: Otitis externa', 'Topical antibiotic/steroid first-line', 'Clear debris first', 'Oral antibiotics only if severe or spreading'],
  false
),

(
  'A 50-year-old man presents with epistaxis. The bleeding is profuse and not stopping with simple pressure. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Continue pressure for longer"},
    {"label": "B", "text": "Refer for urgent ENT assessment"},
    {"label": "C", "text": "Prescribe tranexamic acid"},
    {"label": "D", "text": "Prescribe antibiotics"},
    {"label": "E", "text": "Reassure and discharge"}
  ]'::jsonb,
  'B',
  'Profuse epistaxis not stopping with pressure requires urgent ENT referral. May need nasal packing or cautery. Anterior bleeds (most common) usually stop with pressure. Posterior bleeds are more serious and may require hospital admission. Check BP (hypertension can cause epistaxis).',
  'ENT',
  'high',
  ARRAY['NICE CKS: Epistaxis', 'Profuse bleeding not stopping = urgent ENT referral', 'May need nasal packing or cautery', 'Check BP'],
  false
),

(
  'A 30-year-old woman presents with vertigo, hearing loss, and tinnitus in one ear. Symptoms are episodic, lasting hours. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "BPPV"},
    {"label": "B", "text": "Ménière''s disease"},
    {"label": "C", "text": "Vestibular neuritis"},
    {"label": "D", "text": "Stroke"},
    {"label": "E", "text": "Migraine"}
  ]'::jsonb,
  'B',
  'Episodic vertigo + hearing loss + tinnitus suggests Ménière''s disease. Attacks last hours to days. BPPV has no hearing loss. Vestibular neuritis has no hearing loss and lasts days continuously. Stroke would have other neurological signs. Treatment: betahistine, salt restriction, diuretics.',
  'ENT',
  'medium',
  ARRAY['NICE CKS: Ménière''s disease', 'Episodic vertigo + hearing loss + tinnitus', 'Attacks last hours to days', 'Betahistine, salt restriction, diuretics'],
  false
),

(
  'A 20-year-old man presents with acute otitis media. He has ear pain, fever, and a bulging red tympanic membrane. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Prescribe amoxicillin immediately"},
    {"label": "B", "text": "Analgesia and safety-netting, consider antibiotics if no improvement in 2-3 days"},
    {"label": "C", "text": "Refer to ENT"},
    {"label": "D", "text": "Prescribe decongestants"},
    {"label": "E", "text": "No treatment needed"}
  ]'::jsonb,
  'B',
  'For acute otitis media, NICE recommends analgesia (paracetamol/ibuprofen) and safety-netting. Consider antibiotics if: <2 years with bilateral AOM, otorrhoea, systemically unwell, high-risk of complications. Most cases resolve without antibiotics. If antibiotics needed, amoxicillin first-line.',
  'ENT',
  'medium',
  ARRAY['NICE CKS: Otitis media', 'Analgesia and safety-netting first-line', 'Consider antibiotics if <2 years, otorrhoea, or systemically unwell', 'Most resolve without antibiotics'],
  false
),

-- More Dermatology (add 6 questions)
(
  'A 18-year-old woman presents with moderate acne affecting her face and back. She has tried topical benzoyl peroxide without improvement. What is the next step?',
  '[
    {"label": "A", "text": "Prescribe oral antibiotics (e.g., lymecycline)"},
    {"label": "B", "text": "Refer to dermatology for isotretinoin"},
    {"label": "C", "text": "Prescribe combined oral contraceptive pill"},
    {"label": "D", "text": "Prescribe topical retinoid"},
    {"label": "E", "text": "No further treatment"}
  ]'::jsonb,
  'A',
  'For moderate acne unresponsive to topical treatment, next step is oral antibiotic (e.g., lymecycline, doxycycline) for 3-6 months. Combine with topical treatment (benzoyl peroxide or topical retinoid). For women, COCP can be considered. Isotretinoin is reserved for severe acne or if oral antibiotics fail.',
  'Dermatology',
  'medium',
  ARRAY['NICE CKS: Acne', 'Oral antibiotics for moderate acne', '3-6 month course', 'Combine with topical treatment'],
  false
),

(
  'A 30-year-old man presents with a scaly, erythematous rash on his scalp, elbows, and knees. On examination, there are well-demarcated plaques with silvery scales. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Eczema"},
    {"label": "B", "text": "Psoriasis"},
    {"label": "C", "text": "Seborrhoeic dermatitis"},
    {"label": "D", "text": "Tinea corporis"},
    {"label": "E", "text": "Lichen planus"}
  ]'::jsonb,
  'B',
  'Well-demarcated erythematous plaques with silvery scales on extensor surfaces (elbows, knees) and scalp is classic psoriasis. First-line treatment is topical steroids (moderate potency) and vitamin D analogues (calcipotriol). For more extensive disease, consider phototherapy or systemic agents.',
  'Dermatology',
  'medium',
  ARRAY['NICE CKS: Psoriasis', 'Well-demarcated plaques + silvery scales = psoriasis', 'Topical steroids + vitamin D analogues first-line', 'Extensor surfaces typical'],
  false
),

(
  'A 25-year-old woman presents with a widespread morbilliform rash that started 5 days after starting amoxicillin. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Viral exanthem"},
    {"label": "B", "text": "Drug rash (morbilliform)"},
    {"label": "C", "text": "Urticaria"},
    {"label": "D", "text": "Eczema"},
    {"label": "E", "text": "Psoriasis"}
  ]'::jsonb,
  'B',
  'Widespread morbilliform (measles-like) rash starting days after starting a new medication suggests drug rash. Stop the medication. Most drug rashes are mild and resolve after stopping. Red flags: Stevens-Johnson syndrome (blisters, mucosal involvement), DRESS (fever, eosinophilia, organ involvement) - these require urgent referral.',
  'Dermatology',
  'medium',
  ARRAY['NICE CKS: Drug rashes', 'Morbilliform rash after medication = drug rash', 'Stop the medication', 'Red flags: SJS, DRESS'],
  false
),

(
  'A 40-year-old man presents with shingles affecting his forehead and eye. What is the most important consideration?',
  '[
    {"label": "A", "text": "No special considerations"},
    {"label": "B", "text": "Urgent ophthalmology referral if eye involved"},
    {"label": "C", "text": "Prescribe antibiotics"},
    {"label": "D", "text": "Prescribe steroids only"},
    {"label": "E", "text": "No treatment needed"}
  ]'::jsonb,
  'B',
  'Shingles affecting the ophthalmic division of trigeminal nerve (forehead, eye) requires urgent ophthalmology referral to assess for ocular involvement (herpes zoster ophthalmicus). Can cause keratitis, uveitis, and vision loss. Treatment: aciclovir (oral or IV if severe) and ophthalmology assessment.',
  'Dermatology',
  'high',
  ARRAY['NICE CKS: Shingles', 'Ophthalmic shingles = urgent ophthalmology referral', 'Can cause keratitis, uveitis', 'Aciclovir treatment'],
  false
),

(
  'A 35-year-old woman presents with chronic urticaria. She has tried standard-dose antihistamines without improvement. What is the next step?',
  '[
    {"label": "A", "text": "Increase antihistamine dose up to 4x standard"},
    {"label": "B", "text": "Prescribe oral corticosteroids long-term"},
    {"label": "C", "text": "Prescribe antibiotics"},
    {"label": "D", "text": "Refer to dermatology immediately"},
    {"label": "E", "text": "No further treatment"}
  ]'::jsonb,
  'A',
  'For chronic urticaria unresponsive to standard-dose antihistamines, increase dose up to 4x standard (e.g., cetirizine 10mg up to 40mg daily). If still unresponsive, consider adding H2-receptor antagonist or leukotriene receptor antagonist. Oral corticosteroids only for short-term control of flares. Refer to dermatology/allergy if severe.',
  'Dermatology',
  'medium',
  ARRAY['NICE CKS: Urticaria', 'Increase antihistamine dose up to 4x standard', 'Add H2-receptor antagonist if needed', 'Oral steroids only for short-term flares'],
  false
),

(
  'A 50-year-old man presents with a non-healing ulcer on his leg that has been present for 3 months. On examination, there is a rolled edge and telangiectasia. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Venous ulcer"},
    {"label": "B", "text": "Basal cell carcinoma"},
    {"label": "C", "text": "Squamous cell carcinoma"},
    {"label": "D", "text": "Arterial ulcer"},
    {"label": "E", "text": "Traumatic ulcer"}
  ]'::jsonb,
  'B',
  'Non-healing ulcer with rolled edge and telangiectasia suggests basal cell carcinoma (BCC). BCCs can present as ulcers (rodent ulcers). Requires 2-week wait referral to dermatology for excision. Venous ulcers have irregular edges and are usually on gaiter area. Arterial ulcers are painful and have punched-out appearance.',
  'Dermatology',
  'high',
  ARRAY['NICE CKS: Skin cancers - recognition and referral', 'Rolled edge + telangiectasia = BCC', '2-week wait referral', 'Rodent ulcer presentation'],
  false
),

-- Oncology (add 8 questions)
(
  'A 60-year-old smoker presents with a 3-week history of hoarseness. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Reassure and review if persists"},
    {"label": "B", "text": "Prescribe voice rest"},
    {"label": "C", "text": "Refer for urgent ENT assessment (2-week wait)"},
    {"label": "D", "text": "Prescribe antibiotics"},
    {"label": "E", "text": "Prescribe steroids"}
  ]'::jsonb,
  'C',
  'Hoarseness >3 weeks, especially in a smoker, requires urgent 2-week wait referral to ENT to exclude laryngeal cancer. Red flags: persistent hoarseness >3 weeks, smoking, dysphagia, otalgia, neck lump. Do not delay with symptomatic treatment.',
  'Oncology',
  'high',
  ARRAY['NICE CKS: Hoarseness', 'Hoarseness >3 weeks = 2-week wait', 'Especially if smoker', 'Exclude laryngeal cancer'],
  false
),

(
  'A 55-year-old woman presents with post-menopausal bleeding. She has no other symptoms. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Reassure, normal"},
    {"label": "B", "text": "Prescribe HRT"},
    {"label": "C", "text": "Refer for urgent gynaecology assessment (2-week wait)"},
    {"label": "D", "text": "Arrange ultrasound only"},
    {"label": "E", "text": "Prescribe tranexamic acid"}
  ]'::jsonb,
  'C',
  'Post-menopausal bleeding is a red flag for endometrial cancer and requires urgent 2-week wait referral to gynaecology. Do not delay with symptomatic treatment. Investigation typically includes transvaginal ultrasound and possibly endometrial biopsy.',
  'Oncology',
  'high',
  ARRAY['NICE CKS: Endometrial cancer', 'Post-menopausal bleeding = 2-week wait', 'Red flag for endometrial cancer', 'Do not delay'],
  false
),

(
  'A 65-year-old man presents with weight loss, jaundice, and epigastric pain radiating to the back. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Gallstones"},
    {"label": "B", "text": "Pancreatic cancer"},
    {"label": "C", "text": "Peptic ulcer"},
    {"label": "D", "text": "Hepatitis"},
    {"label": "E", "text": "Gastritis"}
  ]'::jsonb,
  'B',
  'Weight loss + jaundice + epigastric pain radiating to back suggests pancreatic cancer. This requires urgent 2-week wait referral for CT scan and further assessment. Other features: new-onset diabetes, steatorrhoea, Courvoisier''s sign (palpable gallbladder). Do not delay.',
  'Oncology',
  'high',
  ARRAY['NICE CKS: Pancreatic cancer', 'Weight loss + jaundice + back pain = pancreatic cancer', '2-week wait referral', 'Courvoisier''s sign'],
  false
),

(
  'A 50-year-old woman asks about breast cancer screening. At what age does the NHS Breast Screening Programme start?',
  '[
    {"label": "A", "text": "40 years"},
    {"label": "B", "text": "50 years"},
    {"label": "C", "text": "45 years"},
    {"label": "D", "text": "55 years"},
    {"label": "E", "text": "60 years"}
  ]'::jsonb,
  'B',
  'The NHS Breast Screening Programme invites women aged 50-70 years for mammography every 3 years. Women over 70 can self-refer. Screening aims to detect breast cancer early before symptoms develop. Women should be informed about benefits and limitations of screening.',
  'Oncology',
  'medium',
  ARRAY['NICE CKS: Breast cancer', 'NHS Breast Screening: 50-70 years', 'Every 3 years', 'Women over 70 can self-refer'],
  false
),

(
  'A 60-year-old man presents with bone pain, fatigue, and renal impairment. Blood tests show hypercalcaemia. What is the most likely cause?',
  '[
    {"label": "A", "text": "Primary hyperparathyroidism"},
    {"label": "B", "text": "Hypercalcaemia of malignancy"},
    {"label": "C", "text": "Vitamin D excess"},
    {"label": "D", "text": "Sarcoidosis"},
    {"label": "E", "text": "Thyrotoxicosis"}
  ]'::jsonb,
  'B',
  'Hypercalcaemia + bone pain + renal impairment in an elderly patient suggests hypercalcaemia of malignancy (most commonly lung, breast, myeloma, renal cell carcinoma). This is a medical emergency requiring urgent hospital admission for IV fluids and bisphosphonates. Primary hyperparathyroidism is usually asymptomatic or mild.',
  'Oncology',
  'high',
  ARRAY['NICE CKS: Hypercalcaemia', 'Hypercalcaemia of malignancy: bone pain + renal impairment', 'Medical emergency', 'IV fluids and bisphosphonates'],
  false
),

(
  'A 55-year-old woman with known breast cancer presents with back pain and leg weakness. On examination, there is reduced sensation in her legs. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Musculoskeletal back pain"},
    {"label": "B", "text": "Spinal cord compression"},
    {"label": "C", "text": "Sciatica"},
    {"label": "D", "text": "Osteoporosis"},
    {"label": "E", "text": "Arthritis"}
  ]'::jsonb,
  'B',
  'Back pain + leg weakness + reduced sensation in a patient with known cancer suggests spinal cord compression - a medical emergency. Requires immediate hospital admission (999) for urgent MRI and possible surgical decompression or radiotherapy. Delay can result in permanent paralysis.',
  'Oncology',
  'high',
  ARRAY['NICE CKS: Spinal cord compression', 'Back pain + weakness + cancer = spinal cord compression', 'Medical emergency', 'Immediate hospital admission for MRI'],
  false
),

(
  'A 45-year-old man presents with a change in bowel habit, rectal bleeding, and weight loss over 3 months. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Prescribe laxatives"},
    {"label": "B", "text": "Arrange faecal occult blood test"},
    {"label": "C", "text": "Refer for urgent colonoscopy (2-week wait)"},
    {"label": "D", "text": "Prescribe mesalazine"},
    {"label": "E", "text": "Reassure and review"}
  ]'::jsonb,
  'C',
  'This meets 2-week wait criteria for suspected colorectal cancer: change in bowel habit + rectal bleeding + unexplained weight loss. Urgent referral for colonoscopy is required. Do not delay with symptomatic treatment.',
  'Oncology',
  'high',
  ARRAY['NICE CKS: Colorectal cancer', '2-week wait: change in bowel habit + bleeding + weight loss', 'Urgent colonoscopy referral', 'Do not delay'],
  false
),

(
  'A 70-year-old woman with a history of breast cancer treated 5 years ago presents with fatigue and bone pain. What is the most appropriate investigation?',
  '[
    {"label": "A", "text": "Full blood count only"},
    {"label": "B", "text": "Bone scan and tumour markers"},
    {"label": "C", "text": "X-ray of painful area only"},
    {"label": "D", "text": "No investigation needed"},
    {"label": "E", "text": "Reassure, normal"}
  ]'::jsonb,
  'B',
  'Bone pain + fatigue in a patient with previous breast cancer suggests possible metastatic disease. Investigation: bone scan (to detect bone metastases), tumour markers (CA 15-3 for breast cancer), and imaging of primary site. Requires urgent oncology referral. Do not delay.',
  'Oncology',
  'high',
  ARRAY['NICE CKS: Breast cancer', 'Bone pain + previous cancer = possible metastases', 'Bone scan and tumour markers', 'Urgent oncology referral'],
  false
),

-- Add remaining questions to reach 100 total (currently 72, need 28 more)
-- More Geriatrics questions
(
  'An 85-year-old woman with dementia is experiencing pain but cannot communicate verbally. What observational signs might indicate pain?',
  '[
    {"label": "A", "text": "No signs possible"},
    {"label": "B", "text": "Facial expressions, vocalisations, body movements, changes in behaviour"},
    {"label": "C", "text": "Only if family reports it"},
    {"label": "D", "text": "Only physiological changes"},
    {"label": "E", "text": "Cannot assess pain"}
  ]'::jsonb,
  'B',
  'For non-communicative patients with dementia, use observational pain assessment tools (e.g., Abbey Pain Scale, PAINAD). Look for: facial expressions (grimacing, frowning), vocalisations (moaning, crying), body movements (restlessness, guarding), changes in behaviour (agitation, withdrawal), and physiological changes (tachycardia, sweating).',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Dementia', 'Observational pain scales for non-communicative patients', 'Facial expressions, vocalisations, body movements', 'Pain often under-recognised in dementia'],
  false
),

(
  'An 80-year-old man with multiple comorbidities is on 15 different medications. He presents with falls and confusion. What is the most important intervention?',
  '[
    {"label": "A", "text": "Add more medications"},
    {"label": "B", "text": "Comprehensive medication review and deprescribing"},
    {"label": "C", "text": "Refer to all specialists"},
    {"label": "D", "text": "Admit to hospital"},
    {"label": "E", "text": "No changes needed"}
  ]'::jsonb,
  'B',
  'Polypharmacy (>10 medications) in elderly with falls and confusion requires comprehensive medication review using STOPP/START criteria. Identify potentially inappropriate prescriptions (e.g., benzodiazepines, anticholinergics, opioids) and consider deprescribing. High-risk medications in elderly can cause falls, confusion, and adverse effects.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Multimorbidity', 'STOPP/START for medication review', 'Polypharmacy increases adverse effects', 'Deprescribing high-risk medications'],
  false
),

(
  'An 83-year-old woman presents with a fall. On assessment, she has postural hypotension. She is on amlodipine, ramipril, and bendroflumethiazide. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Add more antihypertensives"},
    {"label": "B", "text": "Review and reduce antihypertensive medications"},
    {"label": "C", "text": "Prescribe fludrocortisone"},
    {"label": "D", "text": "Refer to cardiology"},
    {"label": "E", "text": "No changes needed"}
  ]'::jsonb,
  'B',
  'Postural hypotension in elderly on multiple antihypertensives is a common cause of falls. Review medications - consider reducing or stopping one, especially if BP well controlled. In elderly, slightly higher BP targets may be acceptable to reduce fall risk. Medication review is key.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Falls', 'Postural hypotension common cause', 'Review antihypertensives', 'Higher BP targets may be acceptable in elderly'],
  false
),

-- More Men''s Health questions
(
  'A 55-year-old man presents with lower urinary tract symptoms. IPSS score is 22. Digital rectal examination reveals an enlarged, smooth prostate. PSA is 4.5ng/mL. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Refer to urology for suspected prostate cancer"},
    {"label": "B", "text": "Start tamsulosin (alpha-blocker)"},
    {"label": "C", "text": "Start finasteride (5-alpha reductase inhibitor)"},
    {"label": "D", "text": "Start combination of tamsulosin and finasteride"},
    {"label": "E", "text": "Advise lifestyle measures only"}
  ]'::jsonb,
  'B',
  'IPSS 22 indicates severe LUTS. With enlarged smooth prostate and PSA 4.5 (slightly raised but may be normal for age), first-line treatment is alpha-blocker (tamsulosin) for symptom relief. If PSA concerning or symptoms severe, may consider referral. Finasteride is for large prostates (>30g) or if PSA >1.5.',
  'Men''s Health',
  'medium',
  ARRAY['NICE CKS: LUTS in men', 'IPSS for symptom severity', 'Alpha-blocker first-line for BPH', 'Consider referral if PSA concerning'],
  false
),

(
  'A 50-year-old man with erectile dysfunction has a testosterone level of 6nmol/L (normal 8-30). What is the most appropriate next investigation?',
  '[
    {"label": "A", "text": "Start testosterone replacement immediately"},
    {"label": "B", "text": "Check LH and FSH to distinguish primary vs secondary hypogonadism"},
    {"label": "C", "text": "No further investigation needed"},
    {"label": "D", "text": "Prescribe sildenafil only"},
    {"label": "E", "text": "Reassure, normal"}
  ]'::jsonb,
  'B',
  'Low testosterone (<8nmol/L) requires further investigation. Check LH and FSH: high LH/FSH suggests primary hypogonadism (testicular failure), low/normal LH/FSH suggests secondary hypogonadism (pituitary/hypothalamic). Also check prolactin (prolactinoma). Do not start testosterone without identifying cause.',
  'Men''s Health',
  'medium',
  ARRAY['NICE CKS: Testosterone deficiency', 'Low testosterone: check LH/FSH', 'High LH/FSH = primary, low/normal = secondary', 'Check prolactin'],
  false
),

-- More Allergy & Immunology questions
(
  'A 20-year-old woman presents with anaphylaxis after a bee sting. She recovers with treatment. What should be discussed?',
  '[
    {"label": "A", "text": "No further action needed"},
    {"label": "B", "text": "Prescribe adrenaline auto-injector and refer to allergy clinic"},
    {"label": "C", "text": "Prescribe antihistamines only"},
    {"label": "D", "text": "Prescribe steroids only"},
    {"label": "E", "text": "Advise to avoid bees only"}
  ]'::jsonb,
  'B',
  'After anaphylaxis, prescribe two adrenaline auto-injectors and provide education on use. Refer to allergy clinic for further assessment, possible venom immunotherapy, and management plan. Advise avoidance of trigger and always carry auto-injectors. Check expiry dates regularly.',
  'Allergy & Immunology',
  'high',
  ARRAY['NICE CKS: Anaphylaxis', 'Prescribe two auto-injectors', 'Refer to allergy clinic', 'Consider venom immunotherapy'],
  false
),

(
  'A 30-year-old woman presents with seasonal allergic rhinitis. She has tried intranasal corticosteroids without complete relief. What can be added?',
  '[
    {"label": "A", "text": "Oral corticosteroids"},
    {"label": "B", "text": "Oral antihistamines"},
    {"label": "C", "text": "Antibiotics"},
    {"label": "D", "text": "Decongestants long-term"},
    {"label": "E", "text": "No additional treatment"}
  ]'::jsonb,
  'B',
  'For allergic rhinitis, intranasal corticosteroid is first-line. If symptoms persist, can add oral antihistamines for additional symptom control (especially for eye symptoms). Antihistamine eye drops can also help. Avoid long-term oral corticosteroids or decongestants. Consider allergen avoidance.',
  'Allergy & Immunology',
  'medium',
  ARRAY['NICE CKS: Allergic rhinitis', 'Intranasal corticosteroid first-line', 'Add oral antihistamines if needed', 'Antihistamine eye drops for eye symptoms'],
  false
),

-- More Ophthalmology questions
(
  'A 65-year-old diabetic man presents with sudden painless vision loss in one eye. On examination, there are dot and blot haemorrhages and hard exudates. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Diabetic retinopathy"},
    {"label": "B", "text": "Retinal vein occlusion"},
    {"label": "C", "text": "Retinal artery occlusion"},
    {"label": "D", "text": "Age-related macular degeneration"},
    {"label": "E", "text": "Cataract"}
  ]'::jsonb,
  'A',
  'Dot and blot haemorrhages + hard exudates in a diabetic patient suggests diabetic retinopathy. Sudden vision loss may indicate diabetic maculopathy or proliferative retinopathy. Requires urgent ophthalmology referral. All diabetics should have annual retinal screening to detect retinopathy before vision loss.',
  'Ophthalmology',
  'high',
  ARRAY['NICE CKS: Diabetic retinopathy', 'Dot/blot haemorrhages + hard exudates = diabetic retinopathy', 'Urgent ophthalmology referral', 'Annual diabetic eye screening'],
  false
),

(
  'A 70-year-old woman presents with gradual bilateral visual loss and difficulty reading. On examination, the lenses appear cloudy. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Glaucoma"},
    {"label": "B", "text": "Cataract"},
    {"label": "C", "text": "Age-related macular degeneration"},
    {"label": "D", "text": "Diabetic retinopathy"},
    {"label": "E", "text": "Retinal detachment"}
  ]'::jsonb,
  'B',
  'Gradual bilateral visual loss + cloudy lens appearance suggests cataract. Cataracts cause gradual vision loss, glare, and difficulty reading. Treatment is surgical removal when vision affects daily activities. Glaucoma causes peripheral vision loss first. AMD causes central vision loss and distortion.',
  'Ophthalmology',
  'medium',
  ARRAY['NICE CKS: Cataract', 'Gradual bilateral loss + cloudy lens = cataract', 'Surgical removal when affects daily activities', 'Glare and reading difficulty'],
  false
),

-- More ENT questions
(
  'A 35-year-old woman presents with acute sinusitis. She has facial pain, nasal congestion, and purulent nasal discharge for 5 days. What is the first-line treatment?',
  '[
    {"label": "A", "text": "Amoxicillin immediately"},
    {"label": "B", "text": "Analgesia and nasal decongestants, consider antibiotics if no improvement"},
    {"label": "C", "text": "Oral corticosteroids"},
    {"label": "D", "text": "Refer to ENT"},
    {"label": "E", "text": "No treatment needed"}
  ]'::jsonb,
  'B',
  'For acute sinusitis, NICE recommends analgesia (paracetamol/ibuprofen) and nasal decongestants initially. Consider antibiotics (amoxicillin or doxycycline) if: symptoms for >10 days, severe symptoms, or no improvement after initial management. Most cases are viral and resolve without antibiotics.',
  'ENT',
  'medium',
  ARRAY['NICE CKS: Sinusitis', 'Analgesia and decongestants first-line', 'Consider antibiotics if >10 days or severe', 'Most cases viral'],
  false
),

(
  'A 50-year-old man presents with unilateral hearing loss and tinnitus. On examination, there is a mass visible in the external ear canal. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Otitis externa"},
    {"label": "B", "text": "Cerumen impaction"},
    {"label": "C", "text": "Cholesteatoma"},
    {"label": "D", "text": "Acoustic neuroma"},
    {"label": "E", "text": "Normal"}
  ]'::jsonb,
  'C',
  'Unilateral hearing loss + tinnitus + mass in ear canal suggests cholesteatoma (abnormal skin growth in middle ear). This requires urgent ENT referral as it can cause complications (hearing loss, infection, facial nerve damage). Acoustic neuroma causes sensorineural hearing loss but no visible mass.',
  'ENT',
  'high',
  ARRAY['NICE CKS: Hearing loss', 'Cholesteatoma: mass + hearing loss + tinnitus', 'Urgent ENT referral', 'Can cause complications'],
  false
),

-- More Dermatology questions
(
  'A 25-year-old woman presents with severe acne affecting her face, chest, and back. She has tried oral antibiotics and topical treatment without improvement. What is the next step?',
  '[
    {"label": "A", "text": "Continue oral antibiotics longer"},
    {"label": "B", "text": "Refer to dermatology for isotretinoin"},
    {"label": "C", "text": "Prescribe higher dose antibiotics"},
    {"label": "D", "text": "Prescribe oral steroids"},
    {"label": "E", "text": "No further treatment"}
  ]'::jsonb,
  'B',
  'For severe acne unresponsive to oral antibiotics and topical treatment, refer to dermatology for consideration of isotretinoin. Isotretinoin is highly effective but requires careful monitoring (pregnancy prevention, LFTs, lipids) due to side effects. Only prescribed by specialists.',
  'Dermatology',
  'medium',
  ARRAY['NICE CKS: Acne', 'Severe acne unresponsive to antibiotics = refer for isotretinoin', 'Requires specialist monitoring', 'Pregnancy prevention essential'],
  false
),

(
  'A 40-year-old man presents with a scaly, erythematous rash in his groin and armpits. On examination, there are well-demarcated plaques. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Tinea cruris"},
    {"label": "B", "text": "Inverse psoriasis"},
    {"label": "C", "text": "Eczema"},
    {"label": "D", "text": "Seborrhoeic dermatitis"},
    {"label": "E", "text": "Contact dermatitis"}
  ]'::jsonb,
  'B',
  'Well-demarcated plaques in flexural areas (groin, armpits) suggest inverse psoriasis (psoriasis affecting skin folds). Treatment: mild-moderate potency topical steroids, calcipotriol, or combination. Tinea would have scaling at edges and positive microscopy. Eczema would be more eczematous.',
  'Dermatology',
  'medium',
  ARRAY['NICE CKS: Psoriasis', 'Flexural plaques = inverse psoriasis', 'Mild-moderate topical steroids', 'Calcipotriol or combination'],
  false
),

-- More Oncology questions
(
  'A 60-year-old woman presents with bloating, early satiety, and increased abdominal girth over 3 months. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Irritable bowel syndrome"},
    {"label": "B", "text": "Ovarian cancer"},
    {"label": "C", "text": "Constipation"},
    {"label": "D", "text": "Functional dyspepsia"},
    {"label": "E", "text": "Gastritis"}
  ]'::jsonb,
  'B',
  'Bloating + early satiety + increased abdominal girth in a post-menopausal woman suggests ovarian cancer. This requires urgent 2-week wait referral to gynaecology. CA-125 may be checked but should not delay referral. Ovarian cancer often presents late with non-specific symptoms.',
  'Oncology',
  'high',
  ARRAY['NICE CKS: Ovarian cancer', 'Bloating + early satiety + increased girth = ovarian cancer', '2-week wait referral', 'CA-125 may be checked'],
  false
),

(
  'A 55-year-old man presents with dysphagia and weight loss. Upper GI endoscopy shows an oesophageal stricture. Biopsy confirms adenocarcinoma. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Prescribe omeprazole"},
    {"label": "B", "text": "Refer to upper GI MDT (2-week wait)"},
    {"label": "C", "text": "Arrange CT scan only"},
    {"label": "D", "text": "Prescribe analgesia"},
    {"label": "E", "text": "Reassure"}
  ]'::jsonb,
  'B',
  'Confirmed oesophageal cancer requires urgent referral to upper GI MDT (multidisciplinary team) via 2-week wait pathway. MDT will arrange staging (CT, PET scan, EUS) and determine treatment (surgery, chemotherapy, radiotherapy, or palliative stenting). Do not delay with symptomatic treatment.',
  'Oncology',
  'high',
  ARRAY['NICE CKS: Oesophageal cancer', 'Confirmed cancer = urgent MDT referral', 'Staging required (CT, PET, EUS)', 'MDT determines treatment'],
  false
),

-- More questions across categories to reach 100
-- Cardiovascular (add 2 more)
(
  'A 65-year-old man with heart failure (LVEF 30%) is on ramipril 5mg BD and bisoprolol 5mg OD. He is stable. What additional medication should be considered?',
  '[
    {"label": "A", "text": "Add digoxin"},
    {"label": "B", "text": "Add spironolactone"},
    {"label": "C", "text": "Add amlodipine"},
    {"label": "D", "text": "Add furosemide"},
    {"label": "E", "text": "No additional medication"}
  ]'::jsonb,
  'B',
  'For heart failure with LVEF <35% (HFrEF) on ACE inhibitor and beta-blocker, add spironolactone if NYHA class II-IV and still symptomatic. Spironolactone reduces mortality and hospitalisation. Monitor potassium and renal function. SGLT2 inhibitors (e.g., dapagliflozin) are now also recommended.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Heart failure - chronic', 'Spironolactone for HFrEF with LVEF <35%', 'If NYHA class II-IV and symptomatic', 'Monitor potassium and renal function'],
  false
),

-- Respiratory (add 2 more)
(
  'A 55-year-old smoker with COPD has FEV1 45% predicted and 3 exacerbations in the past year. He is on tiotropium (LAMA). What should be added?',
  '[
    {"label": "A", "text": "Salmeterol (LABA)"},
    {"label": "B", "text": "Combination LABA/ICS"},
    {"label": "C", "text": "Theophylline"},
    {"label": "D", "text": "Oral corticosteroids"},
    {"label": "E", "text": "No additional treatment"}
  ]'::jsonb,
  'B',
  'For COPD with FEV1 <50% and ≥2 exacerbations/year, add combination LABA/ICS (e.g., Symbicort, Seretide). This reduces exacerbation frequency. LAMA + LABA/ICS = triple therapy. If still uncontrolled, consider roflumilast or referral for consideration of biologics.',
  'Respiratory',
  'medium',
  ARRAY['NICE CKS: Chronic obstructive pulmonary disease', 'FEV1 <50% + ≥2 exacerbations/year = add LABA/ICS', 'Triple therapy: LAMA + LABA/ICS', 'Reduces exacerbation frequency'],
  false
),

-- Endocrinology (add 2 more)
(
  'A 45-year-old woman with type 2 diabetes has an HbA1c of 68mmol/mol (8.4%) despite metformin 1g BD. She has a BMI of 32 and established cardiovascular disease. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Add gliclazide"},
    {"label": "B", "text": "Add SGLT2 inhibitor"},
    {"label": "C", "text": "Add DPP-4 inhibitor"},
    {"label": "D", "text": "Add pioglitazone"},
    {"label": "E", "text": "Start insulin"}
  ]'::jsonb,
  'B',
  'For type 2 diabetes with established CVD, SGLT2 inhibitors or GLP-1 agonists are preferred due to proven cardiovascular benefits. SGLT2 inhibitors reduce cardiovascular events and heart failure hospitalisation. DPP-4 inhibitors are neutral for CV outcomes. Gliclazide may cause weight gain and hypoglycaemia.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Type 2 diabetes', 'SGLT2 inhibitor for CVD benefits', 'Reduces CV events and HF hospitalisation', 'GLP-1 agonist also option'],
  false
),

-- Gastroenterology (add 2 more)
(
  'A 50-year-old woman presents with a 3-month history of lower abdominal pain, bloating, and alternating diarrhoea and constipation. Blood tests are normal. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Inflammatory bowel disease"},
    {"label": "B", "text": "Irritable bowel syndrome"},
    {"label": "C", "text": "Colorectal cancer"},
    {"label": "D", "text": "Coeliac disease"},
    {"label": "E", "text": "Diverticular disease"}
  ]'::jsonb,
  'B',
  'This is classic irritable bowel syndrome (IBS): abdominal pain associated with change in bowel habit, bloating. Rome IV criteria: recurrent abdominal pain ≥1 day/week for 3 months, associated with ≥2 of: related to defaecation, change in frequency, change in form. No red flags here.',
  'Gastroenterology',
  'medium',
  ARRAY['NICE CKS: Irritable bowel syndrome', 'Rome IV criteria for IBS', 'Pain + change in bowel habit + bloating', 'No red flags in this case'],
  false
),

-- Neurology (add 2 more)
(
  'A 55-year-old woman presents with a 6-month history of progressive memory problems, particularly for recent events. She has difficulty finding words and has become withdrawn. MMSE is 20/30. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Reassure, normal ageing"},
    {"label": "B", "text": "Prescribe donepezil 5mg daily"},
    {"label": "C", "text": "Refer to memory clinic"},
    {"label": "D", "text": "Arrange CT head"},
    {"label": "E", "text": "Prescribe memantine"}
  ]'::jsonb,
  'C',
  'This presentation suggests dementia (progressive memory problems, cognitive decline, MMSE <24). Referral to memory clinic or old age psychiatry is appropriate for comprehensive assessment (cognitive testing, bloods to exclude reversible causes, neuroimaging). Donepezil or memantine may be started after diagnosis of Alzheimer''s, but assessment comes first.',
  'Neurology',
  'medium',
  ARRAY['NICE CKS: Dementia', 'Progressive memory problems + cognitive decline', 'Refer to memory clinic', 'Comprehensive assessment before treatment'],
  false
),

-- Musculoskeletal (add 2 more)
(
  'A 65-year-old man presents with acute onset of severe pain and swelling in his right first metatarsophalangeal joint. He has a history of hypertension and takes bendroflumethiazide. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Rheumatoid arthritis"},
    {"label": "B", "text": "Osteoarthritis"},
    {"label": "C", "text": "Gout"},
    {"label": "D", "text": "Septic arthritis"},
    {"label": "E", "text": "Psoriatic arthritis"}
  ]'::jsonb,
  'C',
  'Acute monoarthritis of the first MTP joint (podagra) is classic for gout. Thiazide diuretics are a common cause of hyperuricaemia and gout. The acute onset and severity are characteristic. Septic arthritis is possible but less likely without fever/systemic symptoms. RA and OA are typically more chronic.',
  'Musculoskeletal',
  'medium',
  ARRAY['NICE CKS: Gout', 'First MTP joint = podagra', 'Thiazides cause hyperuricaemia', 'Acute monoarthritis presentation'],
  false
),

-- Renal (add 2 more)
(
  'A 60-year-old woman with type 2 diabetes and hypertension has an eGFR of 32mL/min/1.73m² and urine ACR of 28mg/mmol. What stage of CKD is this?',
  '[
    {"label": "A", "text": "CKD Stage 2"},
    {"label": "B", "text": "CKD Stage 3a"},
    {"label": "C", "text": "CKD Stage 3b"},
    {"label": "D", "text": "CKD Stage 4"},
    {"label": "E", "text": "CKD Stage 5"}
  ]'::jsonb,
  'C',
  'CKD staging: Stage 1 (eGFR ≥90), Stage 2 (60-89), Stage 3a (45-59), Stage 3b (30-44), Stage 4 (15-29), Stage 5 (<15 or dialysis). eGFR 32 = Stage 3b. ACR 28mg/mmol indicates A2 (moderately increased albuminuria). This requires ACE inhibitor/ARB, close monitoring, and preparation for potential progression.',
  'Renal',
  'medium',
  ARRAY['NICE CKS: Chronic kidney disease', 'Stage 3b: eGFR 30-44', 'ACR >30 = A3 (severe albuminuria)', 'ACE inhibitor/ARB indicated'],
  false
),

-- Women''s Health (add 2 more)
(
  'A 50-year-old woman presents with hot flushes, night sweats, and mood changes for 6 months. Her last period was 8 months ago. She has no contraindications to HRT. What is the first-line treatment?',
  '[
    {"label": "A", "text": "SSRI (fluoxetine)"},
    {"label": "B", "text": "Hormone replacement therapy (HRT)"},
    {"label": "C", "text": "Clonidine"},
    {"label": "D", "text": "Black cohosh"},
    {"label": "E", "text": "Lifestyle measures only"}
  ]'::jsonb,
  'B',
  'This is perimenopause/menopause with vasomotor symptoms. HRT is first-line treatment for menopausal symptoms if no contraindications. Consider risks vs benefits (breast cancer, VTE, stroke). SSRI is second-line if HRT contraindicated. Lifestyle measures can help but are not first-line for moderate-severe symptoms.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Menopause', 'HRT first-line for vasomotor symptoms', 'Consider risks vs benefits', 'SSRI second-line if HRT contraindicated'],
  false
),

-- Mental Health (add 2 more)
(
  'A 48-year-old man presents with low mood, anhedonia, poor sleep, and reduced appetite for 7 weeks. PHQ-9 score is 16. He has no suicidal ideation. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Watchful waiting"},
    {"label": "B", "text": "Prescribe sertraline 50mg daily"},
    {"label": "C", "text": "Refer for CBT only"},
    {"label": "D", "text": "Offer SSRI or psychological therapy (CBT)"},
    {"label": "E", "text": "Refer to mental health services"}
  ]'::jsonb,
  'D',
  'PHQ-9 score 15-19 indicates moderately severe depression. NICE guidelines recommend offering either an SSRI (sertraline first-line) or psychological therapy (CBT). Patient choice is important. For moderate-severe depression, watchful waiting is not appropriate.',
  'Mental Health',
  'medium',
  ARRAY['NICE CKS: Depression', 'PHQ-9 15-19 = moderately severe', 'Offer SSRI or psychological therapy', 'Sertraline first-line SSRI'],
  false
),

-- Infectious Diseases (add 2 more)
(
  'A 30-year-old woman presents with a 3-day history of dysuria and frequency. Dipstick shows nitrites positive, leukocytes positive. She has no allergies and is not pregnant. What is the first-line treatment?',
  '[
    {"label": "A", "text": "Trimethoprim 200mg BD for 3 days"},
    {"label": "B", "text": "Nitrofurantoin 100mg BD for 3 days"},
    {"label": "C", "text": "Ciprofloxacin 500mg BD for 3 days"},
    {"label": "D", "text": "Amoxicillin 500mg TDS for 7 days"},
    {"label": "E", "text": "Co-amoxiclav 625mg TDS for 7 days"}
  ]'::jsonb,
  'A',
  'For uncomplicated lower UTI in non-pregnant women, trimethoprim is first-line (if local resistance <20%). Nitrofurantoin is an alternative first-line option. Ciprofloxacin should be reserved for resistant cases. Amoxicillin has high resistance rates.',
  'Infectious Diseases',
  'medium',
  ARRAY['NICE CKS: Urinary tract infection (lower) - women', 'Trimethoprim first-line if resistance <20%', 'Nitrofurantoin alternative first-line', 'Reserve ciprofloxacin for resistant cases'],
  false
),

-- Haematology (add 2 more)
(
  'A 70-year-old man presents with fatigue. FBC shows: Hb 92g/L, MCV 74fL, ferritin 11μg/L. What is the most important next step?',
  '[
    {"label": "A", "text": "Prescribe iron supplements only"},
    {"label": "B", "text": "Prescribe iron and investigate for cause"},
    {"label": "C", "text": "Refer to haematology"},
    {"label": "D", "text": "Check B12 and folate"},
    {"label": "E", "text": "Reassure, normal for age"}
  ]'::jsonb,
  'B',
  'This is iron deficiency anaemia (microcytic, low ferritin). In an elderly man, the most important step is to investigate for the cause - commonly GI blood loss (upper or lower GI cancer, peptic ulcer, angiodysplasia). Prescribe iron supplements but also arrange upper and lower GI investigations.',
  'Haematology',
  'high',
  ARRAY['NICE CKS: Anaemia - iron deficiency', 'Microcytic + low ferritin = iron deficiency', 'In elderly men, investigate for GI blood loss', 'Upper and lower GI investigations'],
  false
),

-- Prescribing (add 2 more)
(
  'A 60-year-old woman on ramipril 5mg BD for heart failure presents with a persistent dry cough. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Add codeine linctus for cough"},
    {"label": "B", "text": "Stop ramipril and switch to losartan"},
    {"label": "C", "text": "Reduce ramipril dose"},
    {"label": "D", "text": "Refer to respiratory specialist"},
    {"label": "E", "text": "Continue ramipril, cough will resolve"}
  ]'::jsonb,
  'B',
  'ACE inhibitor cough is a common side effect (up to 20% of patients). The solution is to switch to an ARB (angiotensin receptor blocker) like losartan, which has similar efficacy but does not cause cough. Do not just treat the cough symptomatically.',
  'Prescribing',
  'medium',
  ARRAY['NICE CKS: Hypertension', 'ACE inhibitor cough: switch to ARB', 'ARB similar efficacy, no cough', 'Monitor BP after switch'],
  false
),

-- Evidence-Based Practice (add 2 more)
(
  'A study reports a relative risk reduction of 25% for a new treatment. The control event rate is 20%. What is the absolute risk reduction?',
  '[
    {"label": "A", "text": "5%"},
    {"label": "B", "text": "15%"},
    {"label": "C", "text": "20%"},
    {"label": "D", "text": "25%"},
    {"label": "E", "text": "Cannot calculate from given information"}
  ]'::jsonb,
  'A',
  'ARR = CER - TER. RRR = (CER - TER) / CER = 0.25. So (CER - TER) = 0.25 × CER = 0.25 × 0.20 = 0.05 = 5%. Therefore ARR = 5%. The treatment reduces risk from 20% to 15%. NNT = 1/ARR = 1/0.05 = 20.',
  'Evidence-Based Practice',
  'medium',
  ARRAY['ARR = CER - TER', 'RRR = (CER - TER) / CER', 'NNT = 1 / ARR', 'ARR more clinically meaningful than RRR'],
  false
),

-- Primary Care Organisation & Management (add 2 more)
(
  'A GP practice is implementing a new clinical system. What is the most important consideration regarding data governance?',
  '[
    {"label": "A", "text": "Cost of the system"},
    {"label": "B", "text": "Data security and GDPR compliance"},
    {"label": "C", "text": "Ease of use"},
    {"label": "D", "text": "Integration with other systems"},
    {"label": "E", "text": "Training requirements"}
  ]'::jsonb,
  'B',
  'Data governance is paramount in healthcare. Any clinical system must comply with GDPR, ensure patient data security, have appropriate access controls, and maintain confidentiality. Data breaches can result in significant penalties and loss of patient trust.',
  'Primary Care Organisation & Management',
  'medium',
  ARRAY['GDPR compliance essential', 'Data security paramount', 'Access controls required', 'Patient confidentiality'],
  false
);
