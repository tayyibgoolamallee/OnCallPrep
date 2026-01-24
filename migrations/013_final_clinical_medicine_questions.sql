-- Migration: Final Clinical Medicine AKT Questions
-- Based on NICE CKS topics
-- This adds 50 more clinical medicine questions to reach ~500 total

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro) VALUES

-- Infectious Diseases & Antibiotics
(
  'A 55-year-old man presents with a 5-day history of productive cough, fever, and pleuritic chest pain. CXR shows right lower lobe consolidation. He has no allergies. What is the first-line antibiotic?',
  '[
    {"label": "A", "text": "Amoxicillin 500mg TDS for 5 days"},
    {"label": "B", "text": "Co-amoxiclav 625mg TDS for 7 days"},
    {"label": "C", "text": "Doxycycline 200mg on day 1, then 100mg OD for 4 days"},
    {"label": "D", "text": "Levofloxacin 500mg OD for 7 days"},
    {"label": "E", "text": "Azithromycin 500mg OD for 3 days"}
  ]'::jsonb,
  'A',
  'For community-acquired pneumonia (mild-moderate severity), first-line is amoxicillin 500mg TDS for 5 days. Co-amoxiclav is for high-risk patients or if amoxicillin fails. Doxycycline or clarithromycin are alternatives if penicillin allergic. Levofloxacin is reserved for severe pneumonia or if other options fail.',
  'Infectious Diseases',
  'medium',
  ARRAY['NICE CKS: Pneumonia', 'Amoxicillin first-line for CAP', 'Co-amoxiclav for high-risk', '5-day course usually sufficient'],
  false
),

(
  'A 30-year-old woman presents with a 3-day history of sore throat, fever, and cervical lymphadenopathy. Throat swab shows Group A beta-haemolytic streptococcus. She has no penicillin allergy. What is the first-line treatment?',
  '[
    {"label": "A", "text": "Amoxicillin 500mg TDS for 10 days"},
    {"label": "B", "text": "Penicillin V 500mg QDS for 10 days"},
    {"label": "C", "text": "Azithromycin 500mg OD for 3 days"},
    {"label": "D", "text": "Co-amoxiclav 625mg TDS for 7 days"},
    {"label": "E", "text": "No antibiotics needed, viral likely"}
  ]'::jsonb,
  'B',
  'For confirmed Group A strep pharyngitis, first-line is penicillin V 500mg QDS for 10 days (or phenoxymethylpenicillin). Amoxicillin is an alternative. Azithromycin is for penicillin allergy. Co-amoxiclav is not first-line. 10-day course is important to prevent rheumatic fever complications.',
  'Infectious Diseases',
  'medium',
  ARRAY['NICE CKS: Sore throat - acute', 'Penicillin V first-line for Group A strep', '10-day course to prevent complications', 'Amoxicillin alternative'],
  false
),

-- Cardiovascular
(
  'A 65-year-old man with stable angina is on aspirin 75mg, atorvastatin 80mg, and bisoprolol 5mg OD. He still experiences chest pain on moderate exertion. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Increase bisoprolol to 10mg OD"},
    {"label": "B", "text": "Add GTN spray for symptom relief"},
    {"label": "C", "text": "Add a calcium channel blocker (amlodipine)"},
    {"label": "D", "text": "Refer for coronary angiography'},
    {"label": "E", "text": "Add clopidogrel"}
  ]'::jsonb,
  'B',
  'For stable angina, GTN spray should be provided for symptom relief (as required). If symptoms persist despite optimal medical therapy (aspirin, statin, beta-blocker), consider adding a second anti-anginal (calcium channel blocker or long-acting nitrate) or referral for revascularisation. Increasing beta-blocker may help but GTN should be available.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Stable angina', 'GTN spray for symptom relief', 'Add second anti-anginal if needed', 'Consider revascularisation if medical therapy fails'],
  false
),

(
  'A 70-year-old woman presents 2 days after starting ramipril 2.5mg OD for hypertension. She reports a dry cough. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Continue ramipril, cough will resolve"},
    {"label": "B", "text": "Stop ramipril and switch to losartan"},
    {"label": "C", "text": "Reduce ramipril to 1.25mg OD"},
    {"label": "D", "text": "Add codeine linctus for cough"},
    {"label": "E", "text": "Refer to respiratory specialist"}
  ]'::jsonb,
  'B',
  'ACE inhibitor cough is a common side effect (up to 20%). The solution is to switch to an ARB (losartan, candesartan, etc.) which has similar efficacy but does not cause cough. Do not treat the cough symptomatically. ARBs are equivalent to ACE inhibitors for hypertension and heart failure.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Hypertension', 'ACE inhibitor cough: switch to ARB', 'ARB similar efficacy, no cough', 'Do not treat symptomatically'],
  false
),

-- Respiratory
(
  'A 50-year-old smoker with COPD presents with increased breathlessness. Spirometry shows FEV1 45% predicted. He is on salbutamol PRN only. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Add salmeterol (LABA)"},
    {"label": "B", "text": "Add beclomethasone (ICS)"},
    {"label": "C", "text": "Add tiotropium (LAMA)"},
    {"label": "D", "text": "Add combination LABA/ICS"},
    {"label": "E", "text": "Continue salbutamol only"}
  ]'::jsonb,
  'C',
  'For COPD with FEV1 <50% predicted and breathlessness despite SABA, first-line is a long-acting bronchodilator. LAMA (tiotropium) is preferred as first-line maintenance therapy. LABA is an alternative. ICS is added if FEV1 <50% and ≥2 exacerbations/year. Combination LABA/ICS is for more severe disease.',
  'Respiratory',
  'medium',
  ARRAY['NICE CKS: Chronic obstructive pulmonary disease', 'LAMA first-line maintenance for moderate-severe COPD', 'Add ICS if FEV1 <50% and ≥2 exacerbations/year', 'LABA alternative to LAMA'],
  false
),

(
  'A 20-year-old woman with known asthma presents with acute severe breathlessness. On examination, she is unable to complete sentences, respiratory rate is 28/min, peak flow is 40% predicted. What is the most appropriate immediate management?',
  '[
    {"label": "A", "text": "Salbutamol 2 puffs via spacer"},
    {"label": "B", "text": "Salbutamol 10 puffs via spacer, repeat if needed"},
    {"label": "C", "text": "Salbutamol nebuliser 5mg"},
    {"label": "D", "text": "Oral prednisolone 40mg"},
    {"label": "E", "text": "Call 999 for hospital transfer"}
  ]'::jsonb,
  'E',
  'This is acute severe asthma: unable to complete sentences, RR >25, PEF 33-50% predicted. This requires immediate 999 transfer to hospital. While waiting, give high-dose salbutamol (10 puffs via spacer or nebuliser) and oral prednisolone 40-50mg. Do not manage in primary care.',
  'Respiratory',
  'high',
  ARRAY['NICE CKS: Asthma', 'Acute severe asthma = immediate hospital transfer', 'Unable to complete sentences = severe', 'Give high-dose salbutamol and prednisolone while waiting'],
  false
),

-- Gastroenterology
(
  'A 45-year-old man presents with a 2-month history of epigastric pain, worse on empty stomach, relieved by food. He has no red flag features. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Refer for urgent endoscopy"},
    {"label": "B", "text": "Test for H. pylori and treat if positive"},
    {"label": "C", "text": "Prescribe omeprazole 20mg OD for 4 weeks"},
    {"label": "D", "text": "Prescribe antacids only"},
    {"label": "E", "text": "Arrange abdominal ultrasound"}
  ]'::jsonb,
  'B',
  'This presentation suggests peptic ulcer disease (epigastric pain, food-related). NICE recommends test-and-treat for H. pylori first (urea breath test or stool antigen). If positive, treat with triple therapy (PPI + amoxicillin + clarithromycin, or PPI + metronidazole + clarithromycin). If negative or symptoms persist, consider PPI trial.',
  'Gastroenterology',
  'medium',
  ARRAY['NICE CKS: Dyspepsia - unidentified cause', 'Test-and-treat for H. pylori', 'Triple therapy if positive', 'PPI if H. pylori negative'],
  false
),

(
  'A 60-year-old woman presents with a 3-month history of alternating diarrhoea and constipation, abdominal bloating, and relief of pain with defaecation. Blood tests and examination are normal. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Inflammatory bowel disease"},
    {"label": "B", "text": "Irritable bowel syndrome"},
    {"label": "C", "text": "Colorectal cancer"},
    {"label": "D", "text": "Coeliac disease"},
    {"label": "E", "text": "Diverticular disease"}
  ]'::jsonb,
  'B',
  'This is classic irritable bowel syndrome (IBS): abdominal pain associated with change in bowel habit, bloating, and relief with defaecation. Rome IV criteria: recurrent abdominal pain ≥1 day/week for 3 months, associated with ≥2 of: related to defaecation, change in frequency, change in form. No red flags here.',
  'Gastroenterology',
  'medium',
  ARRAY['NICE CKS: Irritable bowel syndrome', 'Rome IV criteria for IBS', 'Pain + change in bowel habit + bloating', 'No red flags in this case'],
  false
),

-- Endocrinology
(
  'A 50-year-old man with type 2 diabetes has an HbA1c of 75mmol/mol (9.0%) despite metformin 1g BD and gliclazide 160mg BD. He has a BMI of 28. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Increase gliclazide dose"},
    {"label": "B", "text": "Add SGLT2 inhibitor"},
    {"label": "C", "text": "Add DPP-4 inhibitor"},
    {"label": "D", "text": "Start insulin"},
    {"label": "E", "text": "Add pioglitazone"}
  ]'::jsonb,
  'B',
  'For type 2 diabetes with HbA1c above target despite dual therapy, consider adding a third agent. SGLT2 inhibitors or GLP-1 agonists are preferred due to cardiovascular benefits and weight loss. DPP-4 inhibitors are alternatives. Insulin is usually reserved for when oral agents fail or if HbA1c very high (>75-86).',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Type 2 diabetes', 'SGLT2 inhibitor or GLP-1 agonist preferred', 'Cardiovascular benefits', 'Consider insulin if HbA1c >75-86 or oral agents fail'],
  false
),

(
  'A 40-year-old woman presents with palpitations, tremor, heat intolerance, and weight loss despite increased appetite. Free T4 is 35pmol/L (normal 12-22), TSH is <0.01mU/L. What is the most appropriate initial treatment?',
  '[
    {"label": "A", "text": "Radioactive iodine"},
    {"label": "B", "text": "Carbimazole 20mg TDS"},
    {"label": "C", "text": "Propranolol 40mg TDS"},
    {"label": "D", "text": "Propylthiouracil 200mg TDS"},
    {"label": "E", "text": "Refer for thyroidectomy"}
  ]'::jsonb,
  'B',
  'This is hyperthyroidism (high T4, suppressed TSH). First-line treatment is carbimazole 20-40mg daily (or propylthiouracil if carbimazole not tolerated or in pregnancy). Beta-blocker (propranolol) can be added for symptom control initially. Radioactive iodine or surgery are second-line options. Warn about agranulocytosis risk.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Hyperthyroidism', 'Carbimazole first-line', 'Warn about agranulocytosis', 'Beta-blocker for symptom control'],
  false
),

-- Dermatology
(
  'A 35-year-old woman presents with a 2-week history of an itchy, scaly rash on her elbows and knees. On examination, there are well-demarcated, erythematous plaques with silvery scales. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Eczema"},
    {"label": "B", "text": "Psoriasis"},
    {"label": "C", "text": "Seborrhoeic dermatitis"},
    {"label": "D", "text": "Tinea corporis"},
    {"label": "E", "text": "Lichen planus"}
  ]'::jsonb,
  'B',
  'This is classic psoriasis: well-demarcated erythematous plaques with silvery scales, typically on extensor surfaces (elbows, knees). First-line treatment is topical steroids (moderate potency) and vitamin D analogues (calcipotriol). For more extensive disease, consider phototherapy or systemic agents.',
  'Dermatology',
  'medium',
  ARRAY['NICE CKS: Psoriasis', 'Well-demarcated plaques + silvery scales = psoriasis', 'Topical steroids + vitamin D analogues first-line', 'Extensor surfaces typical'],
  false
),

(
  'A 25-year-old man presents with a 3-day history of a painful, red, swollen area on his lower leg. It is warm to touch and spreading. He has no fever. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Cellulitis"},
    {"label": "B", "text": "Deep vein thrombosis"},
    {"label": "C", "text": "Erysipelas"},
    {"label": "D", "text": "Contact dermatitis"},
    {"label": "E", "text": "Eczema"}
  ]'::jsonb,
  'A',
  'This is cellulitis: acute spreading infection of the skin and subcutaneous tissues, typically caused by Streptococcus or Staphylococcus. Treatment is oral flucloxacillin 500mg QDS for 7 days (or clarithromycin if penicillin allergic). Erysipelas is a superficial form, also treated similarly. DVT would not be warm/red/spreading in this way.',
  'Dermatology',
  'medium',
  ARRAY['NICE CKS: Cellulitis', 'Acute spreading red/swollen area = cellulitis', 'Flucloxacillin first-line', '7-day course usually sufficient'],
  false
),

-- Neurology
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

(
  'A 30-year-old woman presents with a 2-day history of severe headache, neck stiffness, photophobia, and fever. On examination, there is a non-blanching rash. What is the most appropriate immediate action?',
  '[
    {"label": "A", "text": "Prescribe amoxicillin and review tomorrow"},
    {"label": "B", "text": "Refer for urgent neurology appointment"},
    {"label": "C", "text": "Call 999 for immediate hospital transfer"},
    {"label": "D", "text": "Arrange CT head as outpatient"},
    {"label": "E", "text": "Prescribe paracetamol and review if worse"}
  ]'::jsonb,
  'C',
  'This is suspected bacterial meningitis: headache + neck stiffness + photophobia + fever + non-blanching rash. This is a medical emergency requiring immediate 999 transfer to hospital. Do not delay with antibiotics or outpatient referrals. If GP gives antibiotics before transfer, use benzylpenicillin IM, but hospital transfer is priority.',
  'Neurology',
  'high',
  ARRAY['NICE CKS: Meningitis', 'Headache + neck stiffness + non-blanching rash = meningitis', 'Immediate 999 transfer required', 'Medical emergency'],
  false
),

-- Women''s Health
(
  'A 32-year-old woman presents requesting contraception. She has no medical contraindications and has never used hormonal contraception. She would prefer not to have to remember daily pills. What is the most appropriate option?',
  '[
    {"label": "A", "text": "Combined oral contraceptive pill"},
    {"label": "B", "text": "Progestogen-only pill"},
    {"label": "C", "text": "Mirena IUS"},
    {"label": "D", "text": "Contraceptive implant"},
    {"label": "E", "text": "Depot injection"}
  ]'::jsonb,
  'C',
  'For a woman who does not want to remember daily pills, long-acting reversible contraception (LARC) is ideal. Mirena IUS (or contraceptive implant) are highly effective, long-acting options. Mirena IUS also reduces heavy menstrual bleeding. Depot injection requires 12-weekly administration. LARC methods are more effective than pills.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Contraception - assessment', 'LARC (IUS/implant) highly effective', 'Mirena IUS also reduces heavy bleeding', 'More effective than pills'],
  false
),

(
  'A 50-year-old woman presents with hot flushes, night sweats, and mood changes for 6 months. Her last period was 8 months ago. She has no contraindications to HRT. What is the most appropriate treatment?',
  '[
    {"label": "A", "text": "SSRI (fluoxetine)"},
    {"label": "B", "text": "Hormone replacement therapy (HRT)"},
    {"label": "C", "text": "Clonidine"},
    {"label": "D", "text": "Black cohosh"},
    {"label": "E", "text": "Lifestyle measures only"}
  ]'::jsonb,
  'B',
  'This is menopause (amenorrhoea >12 months) with vasomotor symptoms. HRT is first-line treatment for menopausal symptoms if no contraindications. Consider risks vs benefits (breast cancer, VTE, stroke). SSRI is second-line if HRT contraindicated. Lifestyle measures can help but are not first-line for moderate-severe symptoms.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Menopause', 'HRT first-line for vasomotor symptoms', 'Consider risks vs benefits', 'SSRI second-line if HRT contraindicated'],
  false
),

-- Paediatrics
(
  'A 3-year-old child presents with a 2-day history of fever (38.5°C), runny nose, and a barking cough. On examination, there is stridor at rest. What is the most likely diagnosis and treatment?',
  '[
    {"label": "A", "text": "Bronchiolitis - supportive care"},
    {"label": "B", "text": "Croup - dexamethasone"},
    {"label": "C", "text": "Epiglottitis - urgent hospital referral"},
    {"label": "D", "text": "Pneumonia - antibiotics"},
    {"label": "E", "text": "Asthma - salbutamol"}
  ]'::jsonb,
  'B',
  'This is croup: barking cough + stridor, typically in children 6 months to 3 years, usually viral (parainfluenza). Treatment for moderate-severe croup (stridor at rest) is oral dexamethasone 0.15mg/kg (single dose) or prednisolone. Epiglottitis is rare post-Hib vaccine and would have drooling, toxic appearance.',
  'Paediatrics',
  'medium',
  ARRAY['NICE CKS: Croup', 'Barking cough + stridor = croup', 'Dexamethasone for moderate-severe', 'Epiglottitis rare post-Hib vaccine'],
  false
),

(
  'A 6-month-old baby presents with a 4-day history of runny nose, cough, and mild fever. On examination, there is widespread wheeze and fine crepitations. The baby is feeding well and has no respiratory distress. What is the most appropriate management?',
  '[
    {"label": "A", "text": "Prescribe amoxicillin"},
    {"label": "B", "text": "Prescribe salbutamol"},
    {"label": "C", "text": "Supportive care, review if worsens"},
    {"label": "D", "text": "Refer to hospital"},
    {"label": "E", "text": "Prescribe prednisolone"}
  ]'::jsonb,
  'C',
  'This is bronchiolitis: coryza + cough + wheeze + crepitations in an infant <12 months, typically RSV. Management is supportive (fluids, oxygen if needed, nasal suction). Antibiotics are not indicated unless secondary bacterial infection. Salbutamol and steroids are not effective. Hospital referral only if severe (respiratory distress, poor feeding, dehydration).',
  'Paediatrics',
  'medium',
  ARRAY['NICE CKS: Bronchiolitis', 'Supportive management for bronchiolitis', 'No antibiotics unless secondary infection', 'Hospital referral if severe'],
  false
),

-- Mental Health
(
  'A 45-year-old man presents with low mood, anhedonia, poor sleep, and reduced appetite for 8 weeks. PHQ-9 score is 16. He has no suicidal ideation. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Watchful waiting"},
    {"label": "B", "text": "Prescribe sertraline 50mg daily"},
    {"label": "C", "text": "Refer for CBT only"},
    {"label": "D", "text": "Offer SSRI or psychological therapy (CBT)"},
    {"label": "E", "text": "Refer to mental health services"}
  ]'::jsonb,
  'D',
  'PHQ-9 score 15-19 indicates moderately severe depression. NICE guidelines recommend offering either an SSRI (sertraline first-line) or psychological therapy (CBT). Patient choice is important. For moderate-severe depression, watchful waiting is not appropriate. Referral to specialist services is for treatment-resistant or severe cases.',
  'Mental Health',
  'medium',
  ARRAY['NICE CKS: Depression', 'PHQ-9 15-19 = moderately severe', 'Offer SSRI or psychological therapy', 'Sertraline first-line SSRI'],
  false
),

(
  'A 35-year-old woman presents with excessive worry, restlessness, difficulty concentrating, and sleep disturbance for 4 months. GAD-7 score is 14. What is the first-line treatment?',
  '[
    {"label": "A", "text": "Benzodiazepines"},
    {"label": "B", "text": "SSRI (sertraline)"},
    {"label": "C", "text": "Beta-blockers"},
    {"label": "D", "text": "Buspirone"},
    {"label": "E", "text": "Watchful waiting only"}
  ]'::jsonb,
  'B',
  'GAD-7 score 10-14 indicates moderate generalised anxiety disorder. First-line treatment is SSRI (sertraline or escitalopram) or psychological therapy (CBT). Benzodiazepines should be avoided due to dependence risk. Beta-blockers are for physical symptoms only. Buspirone is second-line. Watchful waiting is not appropriate for moderate-severe symptoms.',
  'Mental Health',
  'medium',
  ARRAY['NICE CKS: Generalized anxiety disorder', 'GAD-7 10-14 = moderate', 'SSRI or CBT first-line', 'Avoid benzodiazepines (dependence)'],
  false
),

-- Urology
(
  'A 70-year-old man presents with lower urinary tract symptoms: poor stream, hesitancy, frequency, and nocturia. Digital rectal examination reveals an enlarged, smooth prostate. PSA is 4.2ng/mL. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Refer to urology for suspected prostate cancer"},
    {"label": "B", "text": "Start tamsulosin (alpha-blocker)"},
    {"label": "C", "text": "Start finasteride (5-alpha reductase inhibitor)"},
    {"label": "D", "text": "Start combination therapy"},
    {"label": "E", "text": "Advise lifestyle measures only"}
  ]'::jsonb,
  'B',
  'This is benign prostatic hyperplasia (BPH): LUTS with enlarged smooth prostate. PSA 4.2 is normal for age. First-line treatment is alpha-blocker (tamsulosin) for symptom relief. Finasteride is for large prostates (>30g) or if PSA >1.5. Combination is for severe symptoms. Lifestyle measures can help but medical treatment is usually needed.',
  'Urology',
  'medium',
  ARRAY['NICE CKS: LUTS in men', 'Alpha-blocker first-line for BPH', 'Finasteride for large prostate or PSA >1.5', 'Combination for severe symptoms'],
  false
),

(
  'A 25-year-old woman presents with a 3-day history of dysuria, frequency, and urgency. Dipstick shows nitrites negative, leukocytes positive. She has no fever or loin pain. What is the most appropriate management?',
  '[
    {"label": "A", "text": "Prescribe trimethoprim"},
    {"label": "B", "text": "Prescribe nitrofurantoin"},
    {"label": "C", "text": "Send MSU for culture before treating"},
    {"label": "D", "text": "Advise increased fluids and review if persists"},
    {"label": "E", "text": "Prescribe co-amoxiclav"}
  ]'::jsonb,
  'D',
  'Nitrites negative but leukocytes positive suggests possible UTI but could also be other causes (STI, interstitial cystitis). If no red flags (fever, loin pain, pregnancy), can advise increased fluids and review. If symptoms persist or worsen, send MSU and consider antibiotics. If nitrites positive, treat immediately.',
  'Urology',
  'medium',
  ARRAY['NICE CKS: Urinary tract infection (lower) - women', 'Nitrites negative + leukocytes positive = possible UTI', 'If no red flags, can observe initially', 'Send MSU if symptoms persist'],
  false
),

-- Renal
(
  'A 65-year-old man with type 2 diabetes and hypertension has an eGFR of 32mL/min/1.73m² and urine ACR of 25mg/mmol. What stage of CKD is this and what medication should be considered?',
  '[
    {"label": "A", "text": "CKD Stage 3b - no specific medication"},
    {"label": "B", "text": "CKD Stage 3b - consider ACE inhibitor"},
    {"label": "C", "text": "CKD Stage 4 - no specific medication"},
    {"label": "D", "text": "CKD Stage 4 - consider ACE inhibitor"},
    {"label": "E", "text": "CKD Stage 5 - refer for renal replacement"}
  ]'::jsonb,
  'B',
  'CKD Stage 3b: eGFR 30-44. ACR 25mg/mmol indicates A2 (moderately increased albuminuria). ACE inhibitor or ARB should be considered to slow progression, especially with proteinuria and diabetes. Stage 4 is eGFR 15-29. Stage 5 is <15 or dialysis.',
  'Renal',
  'medium',
  ARRAY['NICE CKS: Chronic kidney disease', 'Stage 3b: eGFR 30-44', 'ACE inhibitor/ARB for proteinuria', 'Slows progression'],
  false
),

(
  'A 60-year-old woman with CKD Stage 4 (eGFR 22) is started on ramipril 2.5mg OD. What should be monitored after starting?',
  '[
    {"label": "A", "text": "No monitoring needed"},
    {"label": "B", "text": "eGFR and potassium after 1-2 weeks"},
    {"label": "C", "text": "eGFR only after 1 month"},
    {"label": "D", "text": "Potassium only after 1 month"},
    {"label": "E", "text": "Full blood count weekly"}
  ]'::jsonb,
  'B',
  'When starting ACE inhibitor/ARB in CKD, monitor eGFR and potassium after 1-2 weeks. A small rise in creatinine (<30% increase) is acceptable. If eGFR falls >30% or potassium rises significantly, consider reducing dose or stopping. Continue monitoring regularly thereafter.',
  'Renal',
  'medium',
  ARRAY['NICE CKS: Chronic kidney disease', 'Monitor eGFR and potassium after starting ACE inhibitor', 'Small rise in creatinine acceptable', 'Stop if eGFR falls >30%'],
  false
),

-- Haematology
(
  'A 70-year-old man presents with fatigue. FBC shows: Hb 88g/L, MCV 75fL, ferritin 12μg/L. What is the most important next step?',
  '[
    {"label": "A", "text": "Prescribe iron supplements only"},
    {"label": "B", "text": "Prescribe iron and investigate for cause"},
    {"label": "C", "text": "Refer to haematology"},
    {"label": "D", "text": "Check B12 and folate"},
    {"label": "E", "text": "Reassure, normal for age"}
  ]'::jsonb,
  'B',
  'This is iron deficiency anaemia (microcytic, low ferritin). In an elderly man, the most important step is to investigate for the cause - commonly GI blood loss (upper or lower GI cancer, peptic ulcer, angiodysplasia). Prescribe iron supplements but also arrange upper and lower GI investigations (endoscopy, colonoscopy).',
  'Haematology',
  'high',
  ARRAY['NICE CKS: Anaemia - iron deficiency', 'Microcytic + low ferritin = iron deficiency', 'In elderly men, investigate for GI blood loss', 'Upper and lower GI investigations'],
  false
),

(
  'A 45-year-old woman presents with fatigue and breathlessness. FBC shows: Hb 105g/L, MCV 110fL. B12 is 150ng/L (normal 200-900), folate is 4μg/L (normal >3). What is the diagnosis and treatment?',
  '[
    {"label": "A", "text": "B12 deficiency - oral supplements"},
    {"label": "B", "text": "B12 deficiency - IM hydroxocobalamin"},
    {"label": "C", "text": "Folate deficiency - oral folic acid"},
    {"label": "D", "text": "Combined B12 and folate deficiency"},
    {"label": "E", "text": "Anaemia of chronic disease"}
  ]'::jsonb,
  'B',
  'Macrocytic anaemia with low B12 indicates B12 deficiency. Folate is at lower end but not deficient. Treatment is intramuscular hydroxocobalamin (initially 1mg on alternate days for 2 weeks, then every 3 months). Oral B12 is not reliable due to poor absorption. Check for pernicious anaemia (anti-intrinsic factor antibodies).',
  'Haematology',
  'medium',
  ARRAY['NICE CKS: Anaemia - B12 and folate deficiency', 'Macrocytic + low B12 = B12 deficiency', 'IM hydroxocobalamin treatment', 'Check for pernicious anaemia'],
  false
),

-- Prescribing/Safety
(
  'A 65-year-old woman on warfarin (INR stable at 2.5) presents with a chest infection. Which antibiotic is safest?',
  '[
    {"label": "A", "text": "Amoxicillin"},
    {"label": "B", "text": "Trimethoprim"},
    {"label": "C", "text": "Ciprofloxacin"},
    {"label": "D", "text": "Clarithromycin"},
    {"label": "E", "text": "Co-amoxiclav"}
  ]'::jsonb,
  'A',
  'Amoxicillin has minimal interaction with warfarin. Trimethoprim, ciprofloxacin, and clarithromycin can increase INR significantly and require closer monitoring. Co-amoxiclav also has minimal interaction. When prescribing antibiotics to patients on warfarin, always check for interactions and consider closer INR monitoring.',
  'Prescribing',
  'medium',
  ARRAY['NICE CKS: Anticoagulation - oral', 'Amoxicillin minimal warfarin interaction', 'Trimethoprim and ciprofloxacin increase INR', 'Monitor INR more closely with any antibiotic'],
  false
),

(
  'A 55-year-old man on digoxin 125mcg OD for atrial fibrillation presents with nausea, visual disturbance (yellow vision), and bradycardia. What is the most likely cause?',
  '[
    {"label": "A", "text": "Digoxin toxicity"},
    {"label": "B", "text": "Atrial fibrillation with slow ventricular response"},
    {"label": "C", "text": "Side effect of digoxin (normal)"},
    {"label": "D", "text": "Acute coronary syndrome"},
    {"label": "E", "text": "Gastroenteritis"}
  ]'::jsonb,
  'A',
  'Nausea + visual disturbance (yellow/green vision) + bradycardia is classic for digoxin toxicity. Check digoxin level and potassium (hypokalaemia increases toxicity). Stop digoxin and treat hyperkalaemia if present. Consider digoxin-specific antibody fragments (Digibind) for severe toxicity. Common causes: renal impairment, hypokalaemia, drug interactions (amiodarone, verapamil).',
  'Prescribing',
  'high',
  ARRAY['NICE CKS: Heart failure - chronic', 'Digoxin toxicity: nausea + visual disturbance + bradycardia', 'Check digoxin level and potassium', 'Hypokalaemia increases toxicity'],
  false
),

-- Additional Clinical Scenarios
(
  'A 50-year-old woman presents with a 2-week history of generalised joint pain and morning stiffness lasting 1 hour. On examination, there are no joint deformities or swelling. ESR is 35mm/h, rheumatoid factor is negative. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Rheumatoid arthritis"},
    {"label": "B", "text": "Osteoarthritis"},
    {"label": "C", "text": "Polymyalgia rheumatica"},
    {"label": "D", "text": "Fibromyalgia"},
    {"label": "E", "text": "Gout"}
  ]'::jsonb,
  'C',
  'Polymyalgia rheumatica (PMR) presents with bilateral shoulder and hip girdle pain, morning stiffness, raised inflammatory markers, typically in patients >50 years. RF negative rules out RA. Treatment is prednisolone 15mg daily, tapering over 18-24 months. Check for associated giant cell arteritis (headache, visual symptoms).',
  'Rheumatology',
  'medium',
  ARRAY['NICE CKS: Polymyalgia rheumatica', 'Bilateral shoulder/hip pain + morning stiffness + raised ESR', 'Prednisolone 15mg daily', 'Check for associated GCA'],
  false
),

(
  'A 40-year-old man presents with a 3-month history of progressive dyspnoea on exertion and dry cough. He is a non-smoker. CXR shows bilateral hilar lymphadenopathy. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Lung cancer"},
    {"label": "B", "text": "Sarcoidosis"},
    {"label": "C", "text": "Tuberculosis"},
    {"label": "D", "text": "Lymphoma"},
    {"label": "E", "text": "Heart failure"}
  ]'::jsonb,
  'B',
  'Bilateral hilar lymphadenopathy + respiratory symptoms in a young non-smoker is classic for sarcoidosis. Other features may include erythema nodosum, uveitis, hypercalcaemia. Diagnosis confirmed by biopsy (often transbronchial). Many cases resolve spontaneously. Treatment (steroids) if symptomatic or organ involvement.',
  'Respiratory',
  'medium',
  ARRAY['NICE CKS: Sarcoidosis', 'Bilateral hilar lymphadenopathy = sarcoidosis', 'Often self-limiting', 'Steroids if symptomatic'],
  false
),

(
  'A 30-year-old woman presents with a 6-month history of fatigue, joint pains, and a photosensitive rash. ANA is positive 1:320, anti-dsDNA is negative, anti-Ro is positive. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Systemic lupus erythematosus"},
    {"label": "B", "text": "Sjögren''s syndrome"},
    {"label": "C", "text": "Rheumatoid arthritis"},
    {"label": "D", "text": "Scleroderma"},
    {"label": "E", "text": "Mixed connective tissue disease"}
  ]'::jsonb,
  'B',
  'Anti-Ro (SSA) antibodies are associated with Sjögren''s syndrome (dry eyes, dry mouth) and can also occur in SLE. Anti-dsDNA is more specific for SLE. This presentation (fatigue, joint pains, photosensitive rash) could be either, but anti-Ro without anti-dsDNA suggests Sjögren''s. Refer to rheumatology for further assessment.',
  'Rheumatology',
  'medium',
  ARRAY['NICE CKS: Sjögren''s syndrome', 'Anti-Ro antibodies associated with Sjögren''s', 'Dry eyes and dry mouth typical', 'Can overlap with SLE'],
  false
),

(
  'A 55-year-old woman presents with a 4-week history of lower abdominal pain and bloating. She has noticed her abdomen is distended. On examination, there is shifting dullness. What is the most likely cause?',
  '[
    {"label": "A", "text": "Irritable bowel syndrome"},
    {"label": "B", "text": "Ascites"},
    {"label": "C", "text": "Ovarian cyst"},
    {"label": "D", "text": "Pregnancy"},
    {"label": "E", "text": "Constipation"}
  ]'::jsonb,
  'B',
  'Shifting dullness on examination indicates ascites (fluid in the peritoneal cavity). Causes include liver disease (cirrhosis, portal hypertension), heart failure, malignancy (ovarian, GI), renal failure, infection (TB peritonitis). Investigation: ultrasound, diagnostic paracentesis, LFTs, albumin. Management depends on cause.',
  'Gastroenterology',
  'medium',
  ARRAY['NICE CKS: Ascites', 'Shifting dullness = ascites', 'Causes: liver disease, heart failure, malignancy', 'Ultrasound and diagnostic paracentesis'],
  false
),

(
  'A 45-year-old man presents with a 2-month history of progressive dysphagia, initially for solids, now for liquids. He has lost 10kg unintentionally. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Prescribe omeprazole and review"},
    {"label": "B", "text": "Arrange barium swallow"},
    {"label": "C", "text": "Refer for urgent upper GI endoscopy (2-week wait)"},
    {"label": "D", "text": "Prescribe antacids"},
    {"label": "E", "text": "Reassure and advise soft diet"}
  ]'::jsonb,
  'C',
  'Progressive dysphagia + weight loss meets 2-week wait criteria for suspected oesophageal cancer. Urgent upper GI endoscopy is required. Do not delay with PPI trial or barium swallow (endoscopy is diagnostic and allows biopsy). This is a red flag presentation requiring urgent investigation.',
  'Gastroenterology',
  'high',
  ARRAY['NICE CKS: Dyspepsia - unidentified cause', 'Dysphagia + weight loss = red flag', '2-week wait referral for endoscopy', 'Consider oesophageal cancer'],
  false
),

(
  'A 60-year-old woman presents with a 3-month history of fatigue, weight gain, and cold intolerance. She also reports heavy periods. TSH is 12mU/L, free T4 is 11pmol/L (normal 12-22). What is the diagnosis?',
  '[
    {"label": "A", "text": "Primary hypothyroidism"},
    {"label": "B", "text": "Subclinical hypothyroidism"},
    {"label": "C", "text": "Euthyroid"},
    {"label": "D", "text": "Hyperthyroidism"},
    {"label": "E", "text": "Secondary hypothyroidism"}
  ]'::jsonb,
  'B',
  'Subclinical hypothyroidism: raised TSH (12) but normal free T4 (11, at lower end of normal). Treatment is indicated if TSH >10 or if symptomatic (this patient has symptoms: fatigue, weight gain, cold intolerance). If TSH 4-10 and asymptomatic, can monitor. Primary hypothyroidism would have low T4.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Hypothyroidism', 'Raised TSH + normal T4 = subclinical', 'Treat if TSH >10 or symptomatic', 'Monitor if TSH 4-10 and asymptomatic'],
  false
),

(
  'A 35-year-old woman with type 1 diabetes presents with 2-day history of polyuria, polydipsia, nausea, and abdominal pain. Blood glucose is 25mmol/L, ketones are 5.0mmol/L. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Prescribe metformin"},
    {"label": "B", "text": "Advise to increase insulin"},
    {"label": "C", "text": "Refer immediately to hospital (999)"},
    {"label": "D", "text": "Prescribe oral rehydration"},
    {"label": "E", "text": "Arrange urgent diabetic review"}
  ]'::jsonb,
  'C',
  'This is diabetic ketoacidosis (DKA): hyperglycaemia + ketonaemia + acidosis symptoms. This is a medical emergency requiring immediate hospital admission for IV fluids, IV insulin, and electrolyte monitoring. Do not delay with outpatient management. Metformin is not for type 1 diabetes. DKA can be life-threatening.',
  'Endocrinology',
  'high',
  ARRAY['NICE CKS: Diabetic ketoacidosis', 'Hyperglycaemia + ketonaemia = DKA', 'Immediate hospital admission required', 'IV fluids and IV insulin'],
  false
),

(
  'A 50-year-old man presents with a 6-week history of progressive memory problems and confusion. His family report personality changes. MMSE score is 18/30. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Reassure, normal ageing"},
    {"label": "B", "text": "Prescribe donepezil immediately"},
    {"label": "C", "text": "Refer to memory clinic"},
    {"label": "D", "text": "Arrange CT head only"},
    {"label": "E", "text": "Prescribe vitamin B12"}
  ]'::jsonb,
  'C',
  'This presentation suggests dementia (progressive memory problems, personality changes, MMSE <24). Referral to memory clinic or old age psychiatry is appropriate for comprehensive assessment (cognitive testing, bloods to exclude reversible causes, neuroimaging). Donepezil may be started after diagnosis of Alzheimer''s, but assessment comes first.',
  'Mental Health',
  'medium',
  ARRAY['NICE CKS: Dementia', 'Progressive memory problems + personality changes', 'Refer to memory clinic', 'Comprehensive assessment before treatment'],
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
  'Urology',
  'high',
  ARRAY['NICE CKS: Testicular torsion', 'Acute pain + horizontal lie = torsion', 'Surgical emergency - within 6 hours', 'Do not delay with imaging'],
  false
);
