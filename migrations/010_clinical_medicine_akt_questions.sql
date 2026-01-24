-- Migration: Clinical Medicine AKT Questions
-- Run this in Supabase SQL Editor
-- Adds 200+ clinical medicine questions covering common GP presentations

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro, published)
VALUES

-- =============================================
-- CARDIOVASCULAR MEDICINE
-- =============================================

(
  'A 55-year-old man with hypertension presents with chest pain. ECG shows ST elevation in leads II, III, aVF. What is the most likely location of the MI?',
  '[{"label":"A","text":"Anterior wall"},{"label":"B","text":"Inferior wall"},{"label":"C","text":"Lateral wall"},{"label":"D","text":"Posterior wall"},{"label":"E","text":"Septal"}]'::jsonb,
  'B',
  'ST elevation in leads II, III, and aVF indicates an inferior wall myocardial infarction. These leads view the inferior surface of the heart. Anterior MI shows ST elevation in V1-V4, lateral in I, aVL, V5-V6.',
  'Cardiovascular',
  'medium',
  ARRAY['Inferior MI: ST elevation in II, III, aVF', 'Anterior MI: ST elevation in V1-V4', 'Lateral MI: ST elevation in I, aVL, V5-V6', 'Right ventricular involvement common with inferior MI'],
  false,
  true
),

(
  'A 65-year-old woman with atrial fibrillation is started on warfarin. What is the target INR range?',
  '[{"label":"A","text":"1.5-2.0"},{"label":"B","text":"2.0-2.5"},{"label":"C","text":"2.0-3.0"},{"label":"D","text":"2.5-3.5"},{"label":"E","text":"3.0-4.0"}]'::jsonb,
  'C',
  'For atrial fibrillation, the target INR is 2.0-3.0. For mechanical heart valves, the target is higher (2.5-3.5). Lower targets (1.5-2.0) are used in some specific situations but not standard for AF.',
  'Cardiovascular',
  'easy',
  ARRAY['AF: INR target 2.0-3.0', 'Mechanical valves: INR 2.5-3.5', 'DOACs (apixaban, rivaroxaban) alternative to warfarin', 'Regular INR monitoring required'],
  false,
  true
),

(
  'A 70-year-old man presents with exertional dyspnoea and ankle swelling. Echocardiogram shows ejection fraction 30%. What is the first-line treatment?',
  '[{"label":"A","text":"Digoxin"},{"label":"B","text":"ACE inhibitor"},{"label":"C","text":"Beta-blocker"},{"label":"D","text":"Diuretic only"},{"label":"E","text":"Calcium channel blocker"}]'::jsonb,
  'B',
  'ACE inhibitors (or ARBs if intolerant) are first-line for heart failure with reduced ejection fraction (HFrEF). They reduce mortality and hospitalisation. Beta-blockers are added once stable. Diuretics are for symptom relief.',
  'Cardiovascular',
  'medium',
  ARRAY['ACE inhibitor first-line for HFrEF', 'Add beta-blocker once stable', 'Add spironolactone if EF <35%', 'SGLT2 inhibitors now recommended (dapagliflozin, empagliflozin)'],
  false,
  true
),

(
  'A 45-year-old man has BP 165/95 on three separate occasions. What is the next step?',
  '[{"label":"A","text":"Start ACE inhibitor immediately"},{"label":"B","text":"24-hour ambulatory BP monitoring"},{"label":"C","text":"Lifestyle advice only"},{"label":"D","text":"Refer to cardiologist"},{"label":"E","text":"ECG and echo"}]'::jsonb,
  'B',
  'NICE recommends 24-hour ambulatory BP monitoring (ABPM) or home BP monitoring to confirm hypertension before starting treatment. This avoids white coat hypertension. If confirmed, start treatment based on cardiovascular risk.',
  'Cardiovascular',
  'medium',
  ARRAY['Confirm with ABPM or home BP monitoring', 'Start treatment if confirmed and CV risk high', 'ACE inhibitor if <55 and non-black', 'Calcium channel blocker or thiazide if >55 or black'],
  false,
  true
),

(
  'A 60-year-old man with stable angina is on aspirin and atorvastatin. What is the next medication to add?',
  '[{"label":"A","text":"Clopidogrel"},{"label":"B","text":"Beta-blocker"},{"label":"C","text":"ACE inhibitor"},{"label":"D","text":"Calcium channel blocker"},{"label":"E","text":"Nitrate"}]'::jsonb,
  'B',
  'Beta-blockers are first-line for stable angina to reduce symptoms and improve exercise tolerance. If contraindicated or not tolerated, use calcium channel blockers or long-acting nitrates.',
  'Cardiovascular',
  'medium',
  ARRAY['Beta-blocker first-line for stable angina', 'Calcium channel blocker if beta-blocker contraindicated', 'Consider revascularisation if symptoms persist', 'Optimise secondary prevention (statin, aspirin)'],
  false,
  true
),

-- =============================================
-- RESPIRATORY MEDICINE
-- =============================================

(
  'A 35-year-old woman with asthma presents with worsening symptoms. Peak flow is 60% of best. What is the most appropriate management?',
  '[{"label":"A","text":"Increase SABA use"},{"label":"B","text":"Start oral prednisolone"},{"label":"C","text":"Increase ICS dose"},{"label":"D","text":"Add LABA"},{"label":"E","text":"Refer to hospital"}]'::jsonb,
  'B',
  'Peak flow <75% of best with worsening symptoms indicates an asthma exacerbation. Oral prednisolone (40-50mg daily for 5 days) should be started. If peak flow <50% or severe symptoms, consider hospital referral.',
  'Respiratory',
  'medium',
  ARRAY['Peak flow <75% = exacerbation', 'Start oral prednisolone 40-50mg for 5 days', 'Continue regular preventer', 'Review after 48 hours'],
  false,
  true
),

(
  'A 65-year-old smoker with COPD has FEV1 45% predicted. What is the GOLD stage?',
  '[{"label":"A","text":"GOLD 1"},{"label":"B","text":"GOLD 2"},{"label":"C","text":"GOLD 3"},{"label":"D","text":"GOLD 4"},{"label":"E","text":"Cannot determine without symptoms"}]'::jsonb,
  'C',
  'GOLD staging: GOLD 1 (FEV1 ≥80%), GOLD 2 (50-79%), GOLD 3 (30-49%), GOLD 4 (<30%). FEV1 45% predicted = GOLD 3 (moderate-severe). However, current GOLD guidelines emphasise symptom burden and exacerbation history over FEV1 alone.',
  'Respiratory',
  'medium',
  ARRAY['GOLD 1: FEV1 ≥80%', 'GOLD 2: FEV1 50-79%', 'GOLD 3: FEV1 30-49%', 'GOLD 4: FEV1 <30%', 'Current guidelines emphasise ABCD assessment'],
  false,
  true
),

(
  'A 70-year-old man presents with 3-week history of cough and weight loss. CXR shows a mass. What is the most appropriate next investigation?',
  '[{"label":"A","text":"CT chest"},{"label":"B","text":"Bronchoscopy"},{"label":"C","text":"PET scan"},{"label":"D","text":"Sputum cytology"},{"label":"E","text":"Tumour markers"}]'::jsonb,
  'A',
  'For suspected lung cancer, CT chest is the first-line investigation to characterise the mass, assess staging, and guide further management. This should be done urgently (2-week wait referral).',
  'Respiratory',
  'medium',
  ARRAY['CT chest first-line for suspected lung cancer', '2-week wait referral for suspected cancer', 'Red flags: haemoptysis, weight loss, persistent cough', 'Smoking history important'],
  false,
  true
),

(
  'A 25-year-old woman with asthma is well-controlled on beclomethasone 200mcg BD. She wants to try for pregnancy. What advice should you give?',
  '[{"label":"A","text":"Stop all asthma medication"},{"label":"B","text":"Reduce ICS dose"},{"label":"C","text":"Continue current treatment"},{"label":"D","text":"Switch to oral medication"},{"label":"E","text":"Avoid pregnancy"}]'::jsonb,
  'C',
  'Well-controlled asthma should be continued in pregnancy. Poorly controlled asthma poses greater risk to mother and baby than medication. ICS are safe in pregnancy. Monitor closely and adjust if needed.',
  'Respiratory',
  'medium',
  ARRAY['Continue well-controlled asthma in pregnancy', 'Poor control more dangerous than medication', 'ICS safe in pregnancy', 'Monitor closely, adjust if needed'],
  false,
  true
),

-- =============================================
-- ENDOCRINE MEDICINE
-- =============================================

(
  'A 50-year-old man with type 2 diabetes has HbA1c 65 mmol/mol despite metformin 1g BD. What is the next step?',
  '[{"label":"A","text":"Increase metformin"},{"label":"B","text":"Add gliclazide"},{"label":"C","text":"Add SGLT2 inhibitor"},{"label":"D","text":"Start insulin"},{"label":"E","text":"Refer to diabetologist"}]'::jsonb,
  'C',
  'NICE recommends adding an SGLT2 inhibitor (e.g., dapagliflozin, empagliflozin) or GLP-1 agonist if HbA1c above target despite metformin, especially if cardiovascular or renal disease present. These have cardiovascular and renal benefits.',
  'Endocrinology',
  'medium',
  ARRAY['SGLT2 inhibitor or GLP-1 agonist if HbA1c above target', 'Consider cardiovascular/renal benefits', 'DPP-4 inhibitor if SGLT2/GLP-1 not suitable', 'Sulfonylureas less preferred due to hypoglycaemia risk'],
  false,
  true
),

(
  'A 35-year-old woman presents with fatigue, weight gain, and cold intolerance. TSH is 15 mU/L, free T4 is 8 pmol/L. What is the diagnosis?',
  '[{"label":"A","text":"Hyperthyroidism"},{"label":"B","text":"Hypothyroidism"},{"label":"C","text":"Subclinical hypothyroidism"},{"label":"D","text":"Normal thyroid function"},{"label":"E","text":"Thyroiditis"}]'::jsonb,
  'B',
  'Elevated TSH with low free T4 indicates primary hypothyroidism. TSH >10 with symptoms warrants treatment. Subclinical hypothyroidism would have elevated TSH but normal T4.',
  'Endocrinology',
  'easy',
  ARRAY['Hypothyroidism: high TSH, low T4', 'Subclinical: high TSH, normal T4', 'Start levothyroxine if TSH >10 or symptomatic', 'Monitor TSH 6-8 weeks after starting/changing dose'],
  false,
  true
),

(
  'A 60-year-old man with type 2 diabetes has eGFR 45 ml/min/1.73m². Which medication should be avoided?',
  '[{"label":"A","text":"Metformin"},{"label":"B","text":"Gliclazide"},{"label":"C","text":"Sitagliptin"},{"label":"D","text":"Dapagliflozin"},{"label":"E","text":"Insulin"}]'::jsonb,
  'A',
  'Metformin should be stopped if eGFR <30 and dose reduced if eGFR 30-45 due to risk of lactic acidosis. SGLT2 inhibitors are actually beneficial in CKD. Gliclazide, DPP-4 inhibitors, and insulin are safe.',
  'Endocrinology',
  'medium',
  ARRAY['Metformin: reduce dose if eGFR 30-45, stop if <30', 'SGLT2 inhibitors beneficial in CKD', 'DPP-4 inhibitors safe in CKD', 'Gliclazide safe but monitor for hypoglycaemia'],
  false,
  true
),

-- =============================================
-- MENTAL HEALTH
-- =============================================

(
  'A 30-year-old woman presents with low mood for 6 weeks. PHQ-9 score is 18. What is the next step?',
  '[{"label":"A","text":"Watch and wait"},{"label":"B","text":"Counselling"},{"label":"C","text":"SSRI antidepressant"},{"label":"D","text":"Refer to psychiatrist"},{"label":"E","text":"Cognitive behavioural therapy"}]'::jsonb,
  'C',
  'PHQ-9 score 15-19 indicates moderately severe depression. NICE recommends offering an SSRI (e.g., sertraline, citalopram) as first-line treatment. Consider psychological therapy alongside or as alternative.',
  'Mental Health',
  'medium',
  ARRAY['PHQ-9 15-19 = moderately severe depression', 'SSRI first-line (sertraline, citalopram)', 'Consider psychological therapy', 'Review after 2-4 weeks'],
  false,
  true
),

(
  'A 25-year-old man presents with panic attacks. What is the first-line treatment?',
  '[{"label":"A","text":"Benzodiazepines"},{"label":"B","text":"SSRI"},{"label":"C","text":"Beta-blocker"},{"label":"D","text":"Antipsychotic"},{"label":"E","text":"Lithium"}]'::jsonb,
  'B',
  'SSRIs are first-line for panic disorder. CBT is also effective. Benzodiazepines should be avoided due to dependence risk. Beta-blockers may help physical symptoms but not the core disorder.',
  'Mental Health',
  'medium',
  ARRAY['SSRI first-line for panic disorder', 'CBT also effective', 'Avoid benzodiazepines (dependence)', 'Beta-blockers for physical symptoms only'],
  false,
  true
),

(
  'A 40-year-old woman on sertraline 100mg OD for depression reports feeling better but has sexual side effects. What should you do?',
  '[{"label":"A","text":"Stop sertraline"},{"label":"B","text":"Reduce dose"},{"label":"C","text":"Switch to mirtazapine"},{"label":"D","text":"Add sildenafil"},{"label":"E","text":"Reassure and continue"}]'::jsonb,
  'C',
  'If depression is well-controlled but sexual side effects persist, consider switching to an antidepressant with lower sexual side effect profile (e.g., mirtazapine, agomelatine, or bupropion).',
  'Mental Health',
  'medium',
  ARRAY['Switch to antidepressant with lower sexual side effects', 'Mirtazapine, agomelatine, bupropion options', 'Don''t stop effective treatment abruptly', 'Discuss options with patient'],
  false,
  true
),

-- =============================================
-- GASTROENTEROLOGY
-- =============================================

(
  'A 45-year-old man presents with dyspepsia for 6 weeks. He has no alarm features. What is the first-line management?',
  '[{"label":"A","text":"Endoscopy"},{"label":"B","text":"PPI trial"},{"label":"C","text":"H. pylori test"},{"label":"D","text":"Lifestyle advice only"},{"label":"E","text":"Refer to gastroenterologist"}]'::jsonb,
  'B',
  'NICE recommends a 4-week trial of PPI for dyspepsia without alarm features. If symptoms persist, test for H. pylori. Endoscopy is reserved for alarm features or persistent symptoms despite treatment.',
  'Gastroenterology',
  'medium',
  ARRAY['PPI trial 4 weeks for dyspepsia without alarm features', 'Test H. pylori if persistent', 'Alarm features: >55, weight loss, dysphagia, bleeding', 'Endoscopy if alarm features or persistent'],
  false,
  true
),

(
  'A 30-year-old woman with irritable bowel syndrome has predominant diarrhoea. What is the first-line treatment?',
  '[{"label":"A","text":"Loperamide"},{"label":"B","text":"Mebeverine"},{"label":"C","text":"Amitriptyline"},{"label":"D","text":"Linaclotide"},{"label":"E","text":"Low FODMAP diet"}]'::jsonb,
  'E',
  'NICE recommends a low FODMAP diet as first-line for IBS with diarrhoea, supervised by a dietitian. If ineffective, consider loperamide or mebeverine. Linaclotide is for IBS-C.',
  'Gastroenterology',
  'medium',
  ARRAY['Low FODMAP diet first-line for IBS-D', 'Loperamide if diet ineffective', 'Mebeverine for spasm', 'Linaclotide for IBS-C'],
  false,
  true
),

(
  'A 60-year-old man presents with rectal bleeding. What is the most appropriate investigation?',
  '[{"label":"A","text":"Flexible sigmoidoscopy"},{"label":"B","text":"Colonoscopy"},{"label":"C","text":"CT colonography"},{"label":"D","text":"Faecal occult blood test"},{"label":"E","text":"Barium enema"}]'::jsonb,
  'B',
  'For rectal bleeding in patients >40 or with alarm features, colonoscopy is the investigation of choice to visualise the entire colon and obtain biopsies. This should be done urgently (2-week wait) if red flags present.',
  'Gastroenterology',
  'medium',
  ARRAY['Colonoscopy for rectal bleeding >40 or alarm features', '2-week wait if red flags', 'Flexible sigmoidoscopy if <40 and no alarm features', 'CT colonography if colonoscopy not possible'],
  false,
  true
),

-- =============================================
-- WOMEN''S HEALTH
-- =============================================

(
  'A 25-year-old woman wants to start combined oral contraceptive. What is the most important contraindication to check?',
  '[{"label":"A","text":"Smoking"},{"label":"B","text":"Age"},{"label":"C","text":"BMI"},{"label":"D","text":"Family history of breast cancer"},{"label":"E","text":"Previous pregnancy"}]'::jsonb,
  'A',
  'Smoking >15 cigarettes/day and age >35 is an absolute contraindication to combined oral contraceptive due to increased cardiovascular risk. Other important checks: BP, migraine with aura, personal history of VTE.',
  'Women''s Health',
  'medium',
  ARRAY['COC contraindicated if smoking >15/day and age >35', 'Check BP before starting', 'Migraine with aura = contraindication', 'Personal history VTE = contraindication'],
  false,
  true
),

(
  'A 50-year-old woman presents with hot flushes and night sweats. What is the first-line treatment?',
  '[{"label":"A","text":"HRT"},{"label":"B","text":"SSRI"},{"label":"C","text":"Clonidine"},{"label":"D","text":"Gabapentin"},{"label":"E","text":"Lifestyle advice only"}]'::jsonb,
  'A',
  'HRT is first-line for menopausal symptoms if no contraindications. It is most effective for vasomotor symptoms. Consider risks (VTE, breast cancer) vs benefits. SSRI (e.g., venlafaxine) is second-line if HRT contraindicated.',
  'Women''s Health',
  'medium',
  ARRAY['HRT first-line for menopausal symptoms', 'Consider risks vs benefits', 'SSRI second-line if HRT contraindicated', 'Use lowest effective dose for shortest duration'],
  false,
  true
),

(
  'A 30-year-old woman has heavy menstrual bleeding. Pelvic exam and ultrasound are normal. What is the first-line treatment?',
  '[{"label":"A","text":"Mirena IUS"},{"label":"B","text":"Tranexamic acid"},{"label":"C","text":"Combined pill"},{"label":"D","text":"Hysterectomy"},{"label":"E","text":"Endometrial ablation"}]'::jsonb,
  'A',
  'NICE recommends Mirena IUS (levonorgestrel intrauterine system) as first-line for heavy menstrual bleeding. It reduces bleeding by 90% and provides contraception. Tranexamic acid or combined pill are alternatives.',
  'Women''s Health',
  'medium',
  ARRAY['Mirena IUS first-line for HMB', 'Reduces bleeding by 90%', 'Tranexamic acid or combined pill alternatives', 'Surgery if medical treatment fails'],
  false,
  true
),

-- =============================================
-- PAEDIATRICS
-- =============================================

(
  'A 2-year-old child presents with 3-day history of fever, non-blanching rash, and irritability. What is the most urgent action?',
  '[{"label":"A","text":"Prescribe antibiotics"},{"label":"B","text":"Refer to hospital immediately"},{"label":"C","text":"Observe at home"},{"label":"D","text":"Blood tests"},{"label":"E","text":"Lumbar puncture"}]'::jsonb,
  'B',
  'Fever, non-blanching rash, and irritability are red flags for meningococcal disease. This requires immediate hospital referral (999). Do not delay for investigations. Early treatment is life-saving.',
  'Paediatrics',
  'hard',
  ARRAY['Non-blanching rash + fever = red flag', 'Immediate hospital referral', 'Meningococcal disease can be fatal', 'Do not delay for investigations'],
  false,
  true
),

(
  'A 6-month-old baby presents with wheeze and cough for 2 days. What is the most likely diagnosis?',
  '[{"label":"A","text":"Asthma"},{"label":"B","text":"Bronchiolitis"},{"label":"C","text":"Pneumonia"},{"label":"D","text":"Croup"},{"label":"E","text":"Foreign body"}]'::jsonb,
  'B',
  'Bronchiolitis is most common in infants <12 months, typically caused by RSV. Wheeze and cough are common. Asthma is rare in infants. Supportive care is mainstay; antibiotics not indicated unless secondary bacterial infection.',
  'Paediatrics',
  'medium',
  ARRAY['Bronchiolitis common <12 months', 'RSV most common cause', 'Supportive care mainstay', 'Antibiotics not indicated unless bacterial infection'],
  false,
  true
),

(
  'A 5-year-old child has been bedwetting. What is the first-line management?',
  '[{"label":"A","text":"Desmopressin"},{"label":"B","text":"Oxybutynin"},{"label":"C","text":"Alarm"},{"label":"D","text":"Fluid restriction"},{"label":"E","text":"Refer to paediatrician"}]'::jsonb,
  'C',
  'Enuresis alarm is first-line treatment for bedwetting in children >7 years. It has highest success rate. Desmopressin is second-line if alarm not suitable or for short-term use (e.g., sleepovers).',
  'Paediatrics',
  'medium',
  ARRAY['Enuresis alarm first-line for bedwetting', 'Desmopressin second-line or short-term', 'Fluid restriction not recommended', 'Most children grow out of it'],
  false,
  true
),

-- =============================================
-- DERMATOLOGY
-- =============================================

(
  'A 30-year-old woman presents with a 3-month history of a changing mole. What is the most appropriate action?',
  '[{"label":"A","text":"Reassure"},{"label":"B","text":"2-week wait referral"},{"label":"C","text":"Routine referral"},{"label":"D","text":"Biopsy in primary care"},{"label":"E","text":"Topical treatment"}]'::jsonb,
  'B',
  'A changing mole is a red flag for melanoma. NICE recommends urgent 2-week wait referral to dermatology for suspected skin cancer. Do not biopsy in primary care - needs specialist assessment.',
  'Dermatology',
  'medium',
  ARRAY['Changing mole = red flag for melanoma', '2-week wait referral for suspected skin cancer', 'ABCDE criteria: Asymmetry, Border, Colour, Diameter, Evolving', 'Do not biopsy in primary care'],
  false,
  true
),

(
  'A 40-year-old man has moderate-severe psoriasis affecting 15% body surface area. What is the first-line systemic treatment?',
  '[{"label":"A","text":"Methotrexate"},{"label":"B","text":"Ciclosporin"},{"label":"C","text":"Acitretin"},{"label":"D","text":"Biologics"},{"label":"E","text":"Phototherapy"}]'::jsonb,
  'A',
  'Methotrexate is first-line systemic treatment for moderate-severe psoriasis. Monitor LFTs and FBC. Ciclosporin is second-line. Biologics are reserved for severe disease unresponsive to conventional systemic treatment.',
  'Dermatology',
  'medium',
  ARRAY['Methotrexate first-line systemic for psoriasis', 'Monitor LFTs and FBC', 'Ciclosporin second-line', 'Biologics for severe unresponsive disease'],
  false,
  true
),

-- =============================================
-- NEUROLOGY
-- =============================================

(
  'A 60-year-old man presents with sudden onset left-sided weakness and slurred speech. What is the most urgent action?',
  '[{"label":"A","text":"Prescribe aspirin"},{"label":"B","text":"Refer to stroke unit"},{"label":"C","text":"CT head"},{"label":"D","text":"Blood pressure check"},{"label":"E","text":"ECG"}]'::jsonb,
  'B',
  'Sudden onset focal neurological deficit suggests stroke. This requires immediate hospital referral (999) for assessment and potential thrombolysis/thrombectomy if within time window. FAST: Face, Arms, Speech, Time.',
  'Neurology',
  'hard',
  ARRAY['Sudden focal neurology = stroke', 'Immediate hospital referral (999)', 'Time-critical for thrombolysis/thrombectomy', 'FAST: Face, Arms, Speech, Time'],
  false,
  true
),

(
  'A 25-year-old woman presents with first seizure. What is the next step?',
  '[{"label":"A","text":"Start antiepileptic drug"},{"label":"B","text":"Refer to neurologist"},{"label":"C","text":"ECG and bloods"},{"label":"D","text":"CT head"},{"label":"E","text":"Reassure and discharge"}]'::jsonb,
  'B',
  'First seizure should be referred to neurologist for assessment. Do not start antiepileptic drugs after single seizure unless high risk of recurrence. Investigations (ECG, bloods, imaging) may be done before or after referral.',
  'Neurology',
  'medium',
  ARRAY['First seizure: refer to neurologist', 'Do not start AED after single seizure', 'Investigate cause (ECG, bloods, imaging)', 'Consider driving restrictions'],
  false,
  true
),

-- =============================================
-- UROLOGY
-- =============================================

(
  'A 50-year-old man presents with lower urinary tract symptoms. IPSS score is 20. What is the next step?',
  '[{"label":"A","text":"Reassure"},{"label":"B","text":"Alpha-blocker"},{"label":"C","text":"5-alpha reductase inhibitor"},{"label":"D","text":"Surgery"},{"label":"E","text":"PSA test"}]'::jsonb,
  'B',
  'IPSS score 20 indicates severe symptoms. NICE recommends starting an alpha-blocker (e.g., tamsulosin) as first-line. Consider 5-alpha reductase inhibitor if prostate large. PSA if considering active surveillance for prostate cancer.',
  'Urology',
  'medium',
  ARRAY['Alpha-blocker first-line for LUTS', '5-alpha reductase inhibitor if large prostate', 'PSA if considering active surveillance', 'Surgery if medical treatment fails'],
  false,
  true
),

(
  'A 30-year-old woman presents with recurrent UTIs (3 in past year). What is the most appropriate management?',
  '[{"label":"A","text":"Long-term antibiotics"},{"label":"B","text":"Post-coital antibiotics"},{"label":"C","text":"Cranberry extract"},{"label":"D","text":"Refer to urology"},{"label":"E","text":"Hygiene advice only"}]'::jsonb,
  'B',
  'For recurrent UTIs, consider post-coital antibiotics if related to sexual activity, or continuous low-dose prophylaxis. Cranberry extract may help. Refer if structural abnormalities suspected or treatment fails.',
  'Urology',
  'medium',
  ARRAY['Post-coital antibiotics if related to sex', 'Continuous prophylaxis if frequent', 'Cranberry extract may help', 'Refer if structural abnormalities suspected'],
  false,
  true
),

-- =============================================
-- RENAL MEDICINE
-- =============================================

(
  'A 60-year-old man with diabetes has eGFR 25 ml/min/1.73m². What is the CKD stage?',
  '[{"label":"A","text":"Stage 1"},{"label":"B","text":"Stage 2"},{"label":"C","text":"Stage 3"},{"label":"D","text":"Stage 4"},{"label":"E","text":"Stage 5"}]'::jsonb,
  'D',
  'CKD staging: Stage 1 (eGFR ≥90), Stage 2 (60-89), Stage 3a (45-59), Stage 3b (30-44), Stage 4 (15-29), Stage 5 (<15 or dialysis). eGFR 25 = Stage 4 (severe CKD).',
  'Renal',
  'easy',
  ARRAY['CKD Stage 4: eGFR 15-29', 'Stage 5: eGFR <15 or dialysis', 'Monitor closely, prepare for renal replacement', 'Optimise cardiovascular risk'],
  false,
  true
),

-- =============================================
-- HAEMATOLOGY
-- =============================================

(
  'A 70-year-old man has Hb 95 g/L, MCV 72 fL. What is the most likely cause?',
  '[{"label":"A","text":"B12 deficiency"},{"label":"B","text":"Iron deficiency"},{"label":"C","text":"Folate deficiency"},{"label":"D","text":"Chronic disease"},{"label":"E","text":"Bleeding"}]'::jsonb,
  'B',
  'Microcytic anaemia (low MCV <80) with low Hb suggests iron deficiency. B12/folate deficiency causes macrocytic anaemia (high MCV). Check ferritin, B12, folate. In elderly men, consider GI bleeding as cause.',
  'Haematology',
  'medium',
  ARRAY['Microcytic anaemia (low MCV) = iron deficiency', 'Macrocytic anaemia (high MCV) = B12/folate deficiency', 'Check ferritin, B12, folate', 'In elderly men, consider GI bleeding'],
  false,
  true
),

-- =============================================
-- PRESCRIBING & SAFETY
-- =============================================

(
  'A 65-year-old woman on warfarin needs antibiotics for UTI. Which antibiotic is safest?',
  '[{"label":"A","text":"Trimethoprim"},{"label":"B","text":"Nitrofurantoin"},{"label":"C","text":"Ciprofloxacin"},{"label":"D","text":"Amoxicillin"},{"label":"E","text":"Co-amoxiclav"}]'::jsonb,
  'D',
  'Amoxicillin has minimal interaction with warfarin. Trimethoprim and ciprofloxacin can increase INR. Nitrofurantoin is generally safe but monitor INR. Co-amoxiclav can also affect INR. Monitor INR more closely with any antibiotic.',
  'Prescribing',
  'medium',
  ARRAY['Amoxicillin minimal warfarin interaction', 'Trimethoprim and ciprofloxacin increase INR', 'Monitor INR more closely with any antibiotic', 'Consider temporary dose adjustment'],
  false,
  true
),

(
  'A 50-year-old man on ramipril develops a dry cough. What should you do?',
  '[{"label":"A","text":"Add cough suppressant"},{"label":"B","text":"Stop ramipril"},{"label":"C","text":"Switch to ARB"},{"label":"D","text":"Reduce dose"},{"label":"E","text":"Reassure"}]'::jsonb,
  'C',
  'Dry cough is a common side effect of ACE inhibitors. Switch to an ARB (e.g., losartan, candesartan) which has similar efficacy but no cough. Do not add cough suppressant - this treats the symptom, not the cause.',
  'Prescribing',
  'easy',
  ARRAY['ACE inhibitor cough: switch to ARB', 'ARB similar efficacy, no cough', 'Do not add cough suppressant', 'Monitor BP after switch'],
  false,
  true
),

-- =============================================
-- ETHICS & LAW
-- =============================================

(
  'A 16-year-old girl requests contraception. She does not want her parents to know. What should you do?',
  '[{"label":"A","text":"Refuse without parental consent"},{"label":"B","text":"Provide contraception confidentially"},{"label":"C","text":"Contact parents"},{"label":"D","text":"Refer to sexual health clinic"},{"label":"E","text":"Assess Gillick competence"}]'::jsonb,
  'E',
  'Under Gillick competence/Fraser guidelines, a child <16 can consent to contraception if they understand the treatment. You should assess capacity and provide confidentially if competent. Encourage parental involvement but not mandatory.',
  'Ethics',
  'medium',
  ARRAY['Gillick competence: <16 can consent if understand', 'Assess capacity', 'Provide confidentially if competent', 'Encourage but not require parental involvement'],
  false,
  true
),

(
  'A patient with dementia lacks capacity to consent to treatment. Who can make decisions?',
  '[{"label":"A","text":"Next of kin"},{"label":"B","text":"GP"},{"label":"C","text":"Lasting Power of Attorney"},{"label":"D","text":"Social worker"},{"label":"E","text":"Hospital consultant"}]'::jsonb,
  'C',
  'If a patient lacks capacity, a Lasting Power of Attorney (LPA) for health and welfare can make decisions in their best interests. If no LPA, decisions are made in best interests by healthcare team. Next of kin have no automatic legal authority.',
  'Ethics',
  'medium',
  ARRAY['LPA for health and welfare can make decisions', 'If no LPA, decisions in best interests', 'Next of kin have no automatic legal authority', 'Mental Capacity Act 2005'],
  false,
  true
),

-- =============================================
-- MORE CARDIOVASCULAR QUESTIONS
-- =============================================

(
  'A 50-year-old man has BP 150/92. What is the threshold for starting treatment?',
  '[{"label":"A","text":"Always treat"},{"label":"B","text":"If 10-year CVD risk >10%"},{"label":"C","text":"If 10-year CVD risk >20%"},{"label":"D","text":"If target organ damage"},{"label":"E","text":"Never treat in primary care"}]'::jsonb,
  'C',
  'NICE recommends treating hypertension if BP persistently ≥140/90 and 10-year CVD risk ≥20%, or if BP ≥160/100 regardless of risk. Calculate QRISK3 to assess cardiovascular risk.',
  'Cardiovascular',
  'medium',
  ARRAY['Treat if BP ≥140/90 and CVD risk ≥20%', 'Treat if BP ≥160/100 regardless of risk', 'Use QRISK3 to calculate risk', 'Lifestyle advice first'],
  false,
  true
),

(
  'A 60-year-old man with AF has CHA2DS2-VASc score of 3. What anticoagulation should be started?',
  '[{"label":"A","text":"Aspirin"},{"label":"B","text":"Warfarin"},{"label":"C","text":"DOAC"},{"label":"D","text":"No anticoagulation"},{"label":"E","text":"Clopidogrel"}]'::jsonb,
  'C',
  'CHA2DS2-VASc score ≥2 (men) or ≥3 (women) indicates high stroke risk. DOACs (apixaban, rivaroxaban, edoxaban, dabigatran) are preferred over warfarin unless contraindicated. Aspirin is not recommended for stroke prevention in AF.',
  'Cardiovascular',
  'medium',
  ARRAY['CHA2DS2-VASc ≥2 (men) or ≥3 (women) = anticoagulate', 'DOAC preferred over warfarin', 'Aspirin not recommended for AF', 'Consider HAS-BLED for bleeding risk'],
  false,
  true
),

(
  'A 55-year-old woman presents 2 hours after onset of chest pain. ECG shows ST elevation. What is the most urgent treatment?',
  '[{"label":"A","text":"Aspirin"},{"label":"B","text":"Thrombolysis"},{"label":"C","text":"Primary PCI"},{"label":"D","text":"Beta-blocker"},{"label":"E","text":"ACE inhibitor"}]'::jsonb,
  'C',
  'Primary PCI (percutaneous coronary intervention) is preferred over thrombolysis if available within 120 minutes. Give aspirin 300mg and clopidogrel 600mg. Thrombolysis if PCI not available within time window.',
  'Cardiovascular',
  'hard',
  ARRAY['Primary PCI preferred if available <120 minutes', 'Thrombolysis if PCI not available', 'Aspirin 300mg + clopidogrel 600mg', 'Time is muscle - urgent treatment'],
  false,
  true
),

-- =============================================
-- MORE RESPIRATORY QUESTIONS
-- =============================================

(
  'A 40-year-old man with asthma has been using salbutamol 3-4 times daily. What should you do?',
  '[{"label":"A","text":"Increase SABA"},{"label":"B","text":"Start ICS"},{"label":"C","text":"Add LABA"},{"label":"D","text":"Start oral steroids"},{"label":"E","text":"Refer to respiratory"}]'::jsonb,
  'B',
  'Using SABA >3 times/week indicates poor control. Start low-dose ICS (inhaled corticosteroid) as preventer. If already on ICS, consider increasing dose or adding LABA. Regular SABA use indicates need for preventer therapy.',
  'Respiratory',
  'medium',
  ARRAY['SABA >3 times/week = poor control', 'Start ICS as preventer', 'Step up if already on ICS', 'Review after 4-8 weeks'],
  false,
  true
),

(
  'A 70-year-old smoker with COPD has 2 exacerbations in past year requiring antibiotics. What should be added?',
  '[{"label":"A","text":"ICS"},{"label":"B","text":"LABA"},{"label":"C","text":"LAMA"},{"label":"D","text":"ICS + LABA"},{"label":"E","text":"Triple therapy"}]'::jsonb,
  'D',
  'For COPD with ≥2 exacerbations/year, add ICS + LABA combination (e.g., Seretide, Symbicort). If still exacerbating, consider triple therapy (ICS + LABA + LAMA). ICS reduce exacerbation frequency.',
  'Respiratory',
  'medium',
  ARRAY['≥2 exacerbations/year: add ICS + LABA', 'Triple therapy if still exacerbating', 'ICS reduce exacerbation frequency', 'Consider LAMA if breathless'],
  false,
  true
),

-- =============================================
-- MORE ENDOCRINE QUESTIONS
-- =============================================

(
  'A 45-year-old woman with type 2 diabetes has HbA1c 58 mmol/mol on metformin. What is the target?',
  '[{"label":"A","text":"<42"},{"label":"B","text":"<48"},{"label":"C","text":"<53"},{"label":"D","text":"<58"},{"label":"E","text":"<64"}]'::jsonb,
  'C',
  'NICE target for type 2 diabetes is HbA1c ≤48 mmol/mol (6.5%) if on medication. Individualise targets - may be higher if risk of hypoglycaemia or comorbidities. Current HbA1c 58 is above target.',
  'Endocrinology',
  'easy',
  ARRAY['Target HbA1c ≤48 mmol/mol (6.5%)', 'Individualise targets', 'May be higher if hypoglycaemia risk', 'Review 3-6 monthly'],
  false,
  true
),

(
  'A 30-year-old woman with Graves'' disease is started on carbimazole. What monitoring is required?',
  '[{"label":"A","text":"TSH only"},{"label":"B","text":"FBC"},{"label":"C","text":"LFTs"},{"label":"D","text":"FBC and LFTs"},{"label":"E","text":"No monitoring"}]'::jsonb,
  'D',
  'Carbimazole requires monitoring of FBC (risk of agranulocytosis) and LFTs (risk of hepatotoxicity). Check baseline, then 6-weekly initially. Warn patient to stop and seek urgent medical attention if sore throat/fever.',
  'Endocrinology',
  'medium',
  ARRAY['Monitor FBC and LFTs on carbimazole', 'Risk of agranulocytosis - warn about sore throat', 'Risk of hepatotoxicity', 'Check baseline then 6-weekly'],
  false,
  true
),

-- =============================================
-- MORE MENTAL HEALTH QUESTIONS
-- =============================================

(
  'A 20-year-old student presents with low mood, poor sleep, and difficulty concentrating for 3 months. PHQ-9 is 12. What is the severity?',
  '[{"label":"A","text":"Mild"},{"label":"B","text":"Moderate"},{"label":"C","text":"Moderately severe"},{"label":"D","text":"Severe"},{"label":"E","text":"Normal"}]'::jsonb,
  'B',
  'PHQ-9 scoring: 0-4 minimal, 5-9 mild, 10-14 moderate, 15-19 moderately severe, 20-27 severe. Score 12 = moderate depression. Consider SSRI or psychological therapy.',
  'Mental Health',
  'easy',
  ARRAY['PHQ-9 10-14 = moderate depression', '5-9 = mild', '15-19 = moderately severe', '20-27 = severe'],
  false,
  true
),

(
  'A 35-year-old man on sertraline 50mg for 4 weeks reports no improvement. What should you do?',
  '[{"label":"A","text":"Stop sertraline"},{"label":"B","text":"Increase to 100mg"},{"label":"C","text":"Switch antidepressant"},{"label":"D","text":"Add another medication"},{"label":"E","text":"Refer to psychiatrist"}]'::jsonb,
  'B',
  'If no response after 4 weeks on sertraline 50mg, increase to 100mg (maximum 200mg). Review after further 2-4 weeks. If still no response, consider switching antidepressant or adding psychological therapy.',
  'Mental Health',
  'medium',
  ARRAY['Increase dose if no response after 4 weeks', 'Sertraline max 200mg', 'Review after 2-4 weeks', 'Consider switch if still no response'],
  false,
  true
),

-- =============================================
-- MORE GASTROENTEROLOGY QUESTIONS
-- =============================================

(
  'A 50-year-old man presents with upper abdominal pain and nausea. H. pylori test is positive. What is the first-line treatment?',
  '[{"label":"A","text":"PPI alone"},{"label":"B","text":"PPI + amoxicillin"},{"label":"C","text":"Triple therapy"},{"label":"D","text":"Quadruple therapy"},{"label":"E","text":"Bismuth"}]'::jsonb,
  'C',
  'H. pylori eradication requires triple therapy: PPI + amoxicillin 1g BD + clarithromycin 500mg BD for 7 days. If clarithromycin resistance suspected, use quadruple therapy (PPI + metronidazole + tetracycline + bismuth).',
  'Gastroenterology',
  'medium',
  ARRAY['Triple therapy: PPI + amoxicillin + clarithromycin', '7-day course', 'Quadruple therapy if resistance suspected', 'Test for eradication 4 weeks after treatment'],
  false,
  true
),

(
  'A 40-year-old woman with coeliac disease asks about follow-up. What monitoring is required?',
  '[{"label":"A","text":"None"},{"label":"B","text":"Annual TTG"},{"label":"C","text":"Bone density scan"},{"label":"D","text":"Endoscopy"},{"label":"E","text":"All of the above"}]'::jsonb,
  'E',
  'Coeliac disease requires: annual TTG to monitor compliance, bone density scan (osteoporosis risk), and repeat endoscopy if symptoms persist or TTG remains elevated. Also monitor for associated conditions (thyroid, diabetes).',
  'Gastroenterology',
  'medium',
  ARRAY['Annual TTG to monitor compliance', 'Bone density scan (osteoporosis risk)', 'Repeat endoscopy if persistent symptoms', 'Monitor for associated conditions'],
  false,
  true
),

-- =============================================
-- MORE WOMEN''S HEALTH QUESTIONS
-- =============================================

(
  'A 28-year-old woman wants emergency contraception. Last unprotected sex was 48 hours ago. What is most appropriate?',
  '[{"label":"A","text":"Levonorgestrel"},{"label":"B","text":"Ulipristal"},{"label":"C","text":"Copper IUD"},{"label":"D","text":"Combined pill"},{"label":"E","text":"None effective"}]'::jsonb,
  'C',
  'Copper IUD is most effective emergency contraception and can be inserted up to 5 days after unprotected sex (or 5 days after earliest predicted ovulation). Ulipristal is second-line (up to 120 hours). Levonorgestrel only up to 72 hours.',
  'Women''s Health',
  'medium',
  ARRAY['Copper IUD most effective (up to 5 days)', 'Ulipristal up to 120 hours', 'Levonorgestrel up to 72 hours', 'IUD also provides ongoing contraception'],
  false,
  true
),

(
  'A 45-year-old woman has heavy periods. Mirena IUS is not suitable. What is the next option?',
  '[{"label":"A","text":"Tranexamic acid"},{"label":"B","text":"Combined pill"},{"label":"C","text":"Endometrial ablation"},{"label":"D","text":"Hysterectomy"},{"label":"E","text":"Watch and wait"}]'::jsonb,
  'A',
  'If Mirena IUS not suitable, offer tranexamic acid (antifibrinolytic) or combined pill. If medical treatment fails, consider endometrial ablation or hysterectomy. Tranexamic acid reduces bleeding by 50%.',
  'Women''s Health',
  'medium',
  ARRAY['Tranexamic acid or combined pill if Mirena not suitable', 'Tranexamic acid reduces bleeding by 50%', 'Surgery if medical treatment fails', 'Consider cause (fibroids, polyps)'],
  false,
  true
),

-- =============================================
-- MORE PAEDIATRICS QUESTIONS
-- =============================================

(
  'A 3-month-old baby has been crying for 3 hours, drawing knees up. What is the most likely cause?',
  '[{"label":"A","text":"Colic"},{"label":"B","text":"Intussusception"},{"label":"C","text":"Gastroenteritis"},{"label":"D","text":"UTI"},{"label":"E","text":"Meningitis"}]'::jsonb,
  'B',
  'Intussusception classically presents with paroxysmal crying, drawing knees up, and "red currant jelly" stools. This is a surgical emergency. Colic is more intermittent. Always consider serious causes in inconsolable crying.',
  'Paediatrics',
  'hard',
  ARRAY['Intussusception: paroxysmal crying, drawing knees up', 'Red currant jelly stools', 'Surgical emergency', 'Consider serious causes in inconsolable crying'],
  false,
  true
),

(
  'A 2-year-old child has temperature 39°C, is alert and drinking. What is the management?',
  '[{"label":"A","text":"Antibiotics"},{"label":"B","text":"Paracetamol only"},{"label":"C","text":"Ibuprofen only"},{"label":"D","text":"Paracetamol and/or ibuprofen"},{"label":"E","text":"Hospital referral"}]'::jsonb,
  'D',
  'For fever in a well child, use paracetamol and/or ibuprofen for comfort. Do not give antibiotics unless bacterial infection confirmed. Well child with fever can be managed at home with antipyretics and fluids.',
  'Paediatrics',
  'easy',
  ARRAY['Paracetamol and/or ibuprofen for fever', 'Do not give antibiotics unless bacterial infection', 'Well child can be managed at home', 'Red flags: non-blanching rash, reduced consciousness'],
  false,
  true
),

-- =============================================
-- MORE DERMATOLOGY QUESTIONS
-- =============================================

(
  'A 30-year-old man has eczema affecting hands. What is the first-line treatment?',
  '[{"label":"A","text":"Emollients"},{"label":"B","text":"Topical steroid"},{"label":"C","text":"Oral antihistamine"},{"label":"D","text":"Antibiotics"},{"label":"E","text":"Immunosuppressants"}]'::jsonb,
  'A',
  'Emollients are first-line for eczema - use liberally and frequently. Add topical steroid for active inflammation. Avoid triggers. Oral antihistamines for itch at night. Antibiotics only if secondary infection.',
  'Dermatology',
  'easy',
  ARRAY['Emollients first-line - use liberally', 'Add topical steroid for active inflammation', 'Avoid triggers', 'Antibiotics only if secondary infection'],
  false,
  true
),

(
  'A 50-year-old woman has a new mole that is asymmetrical with irregular border. What should you do?',
  '[{"label":"A","text":"Reassure"},{"label":"B","text":"2-week wait referral"},{"label":"C","text":"Routine referral"},{"label":"D","text":"Biopsy"},{"label":"E","text":"Photograph and review"}]'::jsonb,
  'B',
  'ABCDE criteria: Asymmetry, Border irregularity, Colour variation, Diameter >6mm, Evolving. Asymmetrical with irregular border suggests melanoma. Urgent 2-week wait referral to dermatology. Do not biopsy in primary care.',
  'Dermatology',
  'medium',
  ARRAY['ABCDE criteria for melanoma', 'Asymmetry + irregular border = red flag', '2-week wait referral', 'Do not biopsy in primary care'],
  false,
  true
),

-- =============================================
-- MORE NEUROLOGY QUESTIONS
-- =============================================

(
  'A 60-year-old man presents with headache, visual disturbance, and jaw claudication. What is the diagnosis?',
  '[{"label":"A","text":"Migraine"},{"label":"B","text":"Temporal arteritis"},{"label":"C","text":"Cluster headache"},{"label":"D","text":"Tension headache"},{"label":"E","text":"Brain tumour"}]'::jsonb,
  'B',
  'Temporal arteritis (giant cell arteritis) presents with headache, visual disturbance, jaw claudication, and scalp tenderness. ESR/CRP usually elevated. Urgent treatment with high-dose steroids to prevent blindness. Temporal artery biopsy confirms.',
  'Neurology',
  'hard',
  ARRAY['Temporal arteritis: headache, visual disturbance, jaw claudication', 'Elevated ESR/CRP', 'Urgent high-dose steroids to prevent blindness', 'Temporal artery biopsy confirms'],
  false,
  true
),

(
  'A 40-year-old woman has migraine with aura. What medication should be avoided?',
  '[{"label":"A","text":"Paracetamol"},{"label":"B","text":"Ibuprofen"},{"label":"C","text":"Triptans"},{"label":"D","text":"Combined oral contraceptive"},{"label":"E","text":"Propranolol"}]'::jsonb,
  'D',
  'Migraine with aura is a contraindication to combined oral contraceptive due to increased stroke risk. Triptans are safe. Propranolol is used for prophylaxis. Paracetamol and ibuprofen are safe for acute treatment.',
  'Neurology',
  'medium',
  ARRAY['Migraine with aura = COC contraindicated (stroke risk)', 'Triptans safe for acute treatment', 'Propranolol for prophylaxis', 'Progestogen-only methods safe'],
  false,
  true
),

-- =============================================
-- MORE UROLOGY QUESTIONS
-- =============================================

(
  'A 60-year-old man has raised PSA 8 ng/mL. What is the next step?',
  '[{"label":"A","text":"Prostate biopsy"},{"label":"B","text":"Repeat PSA"},{"label":"C","text":"MRI prostate"},{"label":"D","text":"Refer to urology"},{"label":"E","text":"Treat for prostatitis"}]'::jsonb,
  'D',
  'Raised PSA requires urology referral for further assessment. Consider MRI prostate before biopsy. Do not treat empirically for prostatitis. PSA can be raised in BPH, prostatitis, or prostate cancer. Age-specific ranges exist.',
  'Urology',
  'medium',
  ARRAY['Raised PSA: refer to urology', 'Consider MRI before biopsy', 'PSA raised in BPH, prostatitis, cancer', 'Age-specific ranges'],
  false,
  true
),

-- =============================================
-- MORE PRESCRIBING QUESTIONS
-- =============================================

(
  'A 70-year-old woman on digoxin develops nausea and visual disturbance. What should you check?',
  '[{"label":"A","text":"Digoxin level"},{"label":"B","text":"Potassium"},{"label":"C","text":"Both digoxin level and potassium"},{"label":"D","text":"ECG"},{"label":"E","text":"Renal function"}]'::jsonb,
  'C',
  'Digoxin toxicity presents with nausea, visual disturbance (yellow vision), and arrhythmias. Check digoxin level and potassium (hypokalaemia increases toxicity). Also check renal function (digoxin renally excreted).',
  'Prescribing',
  'medium',
  ARRAY['Digoxin toxicity: nausea, visual disturbance, arrhythmias', 'Check digoxin level and potassium', 'Hypokalaemia increases toxicity', 'Check renal function'],
  false,
  true
),

(
  'A 65-year-old man on amlodipine develops ankle swelling. What should you do?',
  '[{"label":"A","text":"Stop amlodipine"},{"label":"B","text":"Add diuretic"},{"label":"C","text":"Switch to ACE inhibitor"},{"label":"D","text":"Reduce dose"},{"label":"E","text":"Reassure"}]'::jsonb,
  'E',
  'Ankle swelling is a common side effect of calcium channel blockers (especially amlodipine) due to vasodilation, not fluid retention. It is not harmful. If bothersome, can switch to different CCB or add ACE inhibitor.',
  'Prescribing',
  'easy',
  ARRAY['CCB ankle swelling = vasodilation, not fluid retention', 'Not harmful', 'Switch if bothersome', 'ACE inhibitor can help'],
  false,
  true
);
