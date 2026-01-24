-- Migration: Add Surgery Questions and Reach 650 Total
-- Based on NICE CKS topics
-- Currently at ~568, adding ~85 questions to reach 650+
-- Includes new Surgery category with surgical topics

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro) VALUES

-- Surgery - General Surgery (Hernias, Obstruction, Biliary Colic)
(
  'A 45-year-old man presents with a 2-day history of right upper quadrant pain radiating to the back, worse after fatty meals. Ultrasound shows gallstones. He has no fever or jaundice. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Cholecystitis"},
    {"label": "B", "text": "Biliary colic"},
    {"label": "C", "text": "Choledocholithiasis"},
    {"label": "D", "text": "Pancreatitis"},
    {"label": "E", "text": "Peptic ulcer"}
  ]'::jsonb,
  'B',
  'Biliary colic presents with right upper quadrant pain, often radiating to back or shoulder, triggered by fatty meals. Pain is colicky and resolves. Cholecystitis would have fever, Murphy''s sign positive, and persistent pain. Choledocholithiasis would have jaundice. Pancreatitis would have severe epigastric pain and raised amylase.',
  'Surgery',
  'medium',
  ARRAY['NICE CKS: Gallstones', 'Biliary colic: RUQ pain, fatty meal trigger', 'Resolves between episodes', 'Cholecystitis has fever and persistent pain'],
  false
),

(
  'A 60-year-old man presents with a reducible groin swelling that appears on standing and disappears on lying. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Inguinal hernia"},
    {"label": "B", "text": "Femoral hernia"},
    {"label": "C", "text": "Varicocele"},
    {"label": "D", "text": "Lymph node"},
    {"label": "E", "text": "Lipoma"}
  ]'::jsonb,
  'A',
  'Reducible groin swelling that appears on standing/coughing and reduces on lying is classic for inguinal hernia. Femoral hernias are more common in women and below the inguinal ligament. Varicocele feels like "bag of worms" and doesn''t reduce. Lymph nodes are fixed. Lipoma is soft and doesn''t change with position.',
  'Surgery',
  'medium',
  ARRAY['NICE CKS: Hernia', 'Inguinal hernia: reducible, appears on standing', 'Femoral hernia more common in women', 'Irreducible/strangulated = urgent referral'],
  false
),

(
  'A 70-year-old man presents with absolute constipation, abdominal distension, and vomiting. On examination, there are high-pitched bowel sounds. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Ileus"},
    {"label": "B", "text": "Bowel obstruction"},
    {"label": "C", "text": "Constipation"},
    {"label": "D", "text": "Diverticulitis"},
    {"label": "E", "text": "Appendicitis"}
  ]'::jsonb,
  'B',
  'Absolute constipation (no flatus) + distension + vomiting + high-pitched bowel sounds suggests bowel obstruction. Ileus has absent bowel sounds. Simple constipation has normal bowel sounds and flatus. This requires urgent surgical assessment - may need imaging (AXR, CT) and possible surgery.',
  'Surgery',
  'high',
  ARRAY['NICE CKS: Bowel obstruction', 'Absolute constipation + distension + vomiting = obstruction', 'High-pitched bowel sounds characteristic', 'Urgent surgical assessment required'],
  false
),

-- Surgery - Urology (Prostatism, Varicocele, Renal Colic)
(
  'A 65-year-old man presents with lower urinary tract symptoms: poor stream, hesitancy, frequency, and nocturia. Digital rectal examination reveals an enlarged, smooth prostate. PSA is 4.2ng/mL. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Refer to urology for suspected prostate cancer"},
    {"label": "B", "text": "Start tamsulosin (alpha-blocker)"},
    {"label": "C", "text": "Start finasteride (5-alpha reductase inhibitor)"},
    {"label": "D", "text": "Start combination therapy"},
    {"label": "E", "text": "Advise lifestyle measures only"}
  ]'::jsonb,
  'B',
  'This is benign prostatic hyperplasia (BPH): LUTS with enlarged smooth prostate. PSA 4.2 is normal for age. First-line treatment is alpha-blocker (tamsulosin) for symptom relief. Finasteride is for large prostates (>30g) or if PSA >1.5. Combination is for severe symptoms. Lifestyle measures can help but medical treatment is usually needed.',
  'Surgery',
  'medium',
  ARRAY['NICE CKS: LUTS in men', 'Alpha-blocker first-line for BPH', 'Finasteride for large prostate or PSA >1.5', 'Combination for severe symptoms'],
  false
),

(
  'A 25-year-old man presents with a "bag of worms" feeling in his scrotum, more prominent on standing. It is reducible on lying. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Inguinal hernia"},
    {"label": "B", "text": "Varicocele"},
    {"label": "C", "text": "Hydrocele"},
    {"label": "D", "text": "Epididymal cyst"},
    {"label": "E", "text": "Testicular cancer"}
  ]'::jsonb,
  'B',
  'Varicocele feels like "bag of worms" and is more prominent on standing (due to gravity). It may reduce on lying. Usually left-sided. If asymptomatic, no treatment needed. If symptomatic or affecting fertility, consider referral for surgical repair. Hydrocele transilluminates. Epididymal cyst is separate from testis.',
  'Surgery',
  'medium',
  ARRAY['NICE CKS: Varicocele', '"Bag of worms" feeling = varicocele', 'More prominent on standing', 'Surgical repair if symptomatic or affecting fertility'],
  false
),

(
  'A 35-year-old man presents with a 3-day history of severe right loin pain radiating to the groin, associated with nausea. Urine dipstick shows blood +++. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Urinary tract infection"},
    {"label": "B", "text": "Renal colic (ureteric stone)"},
    {"label": "C", "text": "Pyelonephritis"},
    {"label": "D", "text": "Renal cell carcinoma"},
    {"label": "E", "text": "Appendicitis"}
  ]'::jsonb,
  'B',
  'Severe loin-to-groin pain + haematuria is classic for renal colic due to ureteric stone. The pain is typically colicky and severe. Management includes analgesia (diclofenac/ibuprofen), hydration, and imaging (CT KUB) to confirm stone and assess size. Stones <5mm usually pass spontaneously. Larger stones may need intervention.',
  'Surgery',
  'medium',
  ARRAY['NICE CKS: Renal colic', 'Loin-to-groin pain + haematuria = stone', 'Analgesia and hydration', 'CT KUB for diagnosis'],
  false
),

-- Surgery - Vascular (Limb Ischaemia, PAD/PVD)
(
  'A 70-year-old smoker presents with pain in his calf on walking, relieved by rest. On examination, there are absent foot pulses and hair loss on the leg. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Deep vein thrombosis"},
    {"label": "B", "text": "Peripheral arterial disease"},
    {"label": "C", "text": "Sciatica"},
    {"label": "D", "text": "Muscle strain"},
    {"label": "E", "text": "Cellulitis"}
  ]'::jsonb,
  'B',
  'Intermittent claudication: pain on walking, relieved by rest, with absent pulses and hair loss suggests peripheral arterial disease (PAD). Risk factors: smoking, diabetes, hypertension. Management: lifestyle (smoking cessation, exercise), antiplatelet (aspirin/clopidogrel), statin. Consider vascular referral if severe or critical ischaemia.',
  'Surgery',
  'medium',
  ARRAY['NICE CKS: Peripheral arterial disease', 'Intermittent claudication = PAD', 'Absent pulses + hair loss', 'Smoking cessation and antiplatelet essential'],
  false
),

(
  'A 75-year-old man presents with sudden onset of severe leg pain, pallor, and coldness. The leg is pulseless. What is the most appropriate immediate action?',
  '[
    {"label": "A", "text": "Prescribe analgesia and review tomorrow"},
    {"label": "B", "text": "Refer for urgent vascular assessment"},
    {"label": "C", "text": "Arrange Doppler ultrasound as outpatient"},
    {"label": "D", "text": "Prescribe antiplatelet therapy"},
    {"label": "E", "text": "Advise rest and elevation"}
  ]'::jsonb,
  'B',
  'Acute limb ischaemia: sudden onset pain + pallor + coldness + pulseless is a surgical emergency. This requires immediate vascular referral (within 6 hours) for possible embolectomy or revascularisation. Delay can result in limb loss. Do not delay with outpatient investigations.',
  'Surgery',
  'high',
  ARRAY['NICE CKS: Peripheral arterial disease', 'Acute limb ischaemia = surgical emergency', 'Within 6 hours for revascularisation', 'Delay can result in limb loss'],
  false
),

-- Surgery - Colorectal
(
  'A 60-year-old woman presents with a 3-month history of change in bowel habit, rectal bleeding, and weight loss. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Prescribe laxatives and review"},
    {"label": "B", "text": "Arrange faecal occult blood test"},
    {"label": "C", "text": "Refer for urgent colonoscopy (2-week wait)"},
    {"label": "D", "text": "Prescribe mesalazine"},
    {"label": "E", "text": "Reassure and advise high-fibre diet"}
  ]'::jsonb,
  'C',
  'This meets 2-week wait criteria for suspected colorectal cancer: change in bowel habit + rectal bleeding + unexplained weight loss. Urgent referral for colonoscopy is required. Do not delay with symptomatic treatment.',
  'Surgery',
  'high',
  ARRAY['NICE CKS: Colorectal cancer', '2-week wait: change in bowel habit + bleeding + weight loss', 'Urgent colonoscopy referral', 'Do not delay with symptomatic treatment'],
  false
),

-- Surgery - Upper GI
(
  'A 50-year-old man presents with a 2-month history of progressive dysphagia, initially for solids, now for liquids. He has lost 8kg unintentionally. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Prescribe omeprazole and review"},
    {"label": "B", "text": "Arrange barium swallow"},
    {"label": "C", "text": "Refer for urgent upper GI endoscopy (2-week wait)"},
    {"label": "D", "text": "Prescribe antacids"},
    {"label": "E", "text": "Reassure and advise soft diet"}
  ]'::jsonb,
  'C',
  'Progressive dysphagia + weight loss meets 2-week wait criteria for suspected oesophageal cancer. Urgent upper GI endoscopy is required. Do not delay with PPI trial or barium swallow (endoscopy is diagnostic and allows biopsy).',
  'Surgery',
  'high',
  ARRAY['NICE CKS: Dyspepsia - unidentified cause', 'Dysphagia + weight loss = red flag', '2-week wait referral for endoscopy', 'Consider oesophageal cancer'],
  false
),

-- Surgery - Breast
(
  'A 45-year-old woman presents with a new breast lump. On examination, there is a hard, irregular, fixed lump in the upper outer quadrant. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Reassure and review in 3 months"},
    {"label": "B", "text": "Prescribe antibiotics"},
    {"label": "C", "text": "Refer for urgent breast assessment (2-week wait)"},
    {"label": "D", "text": "Arrange mammography only"},
    {"label": "E", "text": "Advise to monitor"}
  ]'::jsonb,
  'C',
  'New breast lump with suspicious features (hard, irregular, fixed) requires urgent 2-week wait referral to breast clinic. Do not delay with monitoring or antibiotics. Breast clinic will arrange triple assessment (clinical, imaging, biopsy).',
  'Surgery',
  'high',
  ARRAY['NICE CKS: Breast cancer', 'Suspicious breast lump = 2-week wait referral', 'Hard, irregular, fixed = concerning features', 'Triple assessment at breast clinic'],
  false
),

-- Continue adding more questions across all categories to reach 85 total
-- Cardiovascular (add 5 more)
(
  'A 70-year-old woman with heart failure (LVEF 35%) presents with increasing breathlessness and ankle swelling. She is on ramipril 5mg BD, bisoprolol 5mg OD, and furosemide 40mg OD. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Increase ramipril dose"},
    {"label": "B", "text": "Add spironolactone"},
    {"label": "C", "text": "Increase furosemide to 80mg BD"},
    {"label": "D", "text": "Add digoxin"},
    {"label": "E", "text": "Refer for cardiac resynchronisation therapy"}
  ]'::jsonb,
  'C',
  'This patient has decompensated heart failure (increased breathlessness, oedema). The immediate management is to increase diuretic (furosemide) to manage fluid overload. Spironolactone is indicated for severe heart failure (NYHA class III-IV) with LVEF <35% despite ACE inhibitor and beta-blocker, but first address the acute decompensation.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Heart failure - chronic', 'Decompensated HF: increase diuretic', 'Spironolactone for severe HF with LVEF <35%', 'Address fluid overload first'],
  false
),

-- Respiratory (add 5 more)
(
  'A 50-year-old smoker with COPD presents with increased breathlessness and purulent sputum for 4 days. He has no fever. What is the most appropriate management?',
  '[
    {"label": "A", "text": "No antibiotics, increase bronchodilators only"},
    {"label": "B", "text": "Amoxicillin 500mg TDS for 5 days"},
    {"label": "C", "text": "Doxycycline 200mg on day 1, then 100mg OD for 4 more days"},
    {"label": "D", "text": "Co-amoxiclav 625mg TDS for 7 days"},
    {"label": "E", "text": "Refer to hospital"}
  ]'::jsonb,
  'B',
  'This is a moderate COPD exacerbation: increased breathlessness + purulent sputum (2 of 3 Anthonisen criteria). First-line antibiotic is amoxicillin 500mg TDS for 5 days (or doxycycline). Co-amoxiclav is reserved for high-risk patients or if amoxicillin fails. Hospital referral only if severe.',
  'Respiratory',
  'medium',
  ARRAY['NICE CKS: Chronic obstructive pulmonary disease', 'Anthonisen criteria: breathlessness + sputum + purulence', 'Amoxicillin first-line for moderate exacerbation', 'Co-amoxiclav for high-risk or treatment failure'],
  false
),

-- Endocrinology (add 5 more)
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

-- Gastroenterology (add 5 more)
(
  'A 40-year-old woman presents with a 4-month history of lower abdominal pain, bloating, and alternating diarrhoea and constipation. Blood tests are normal. What is the most likely diagnosis?',
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

-- Neurology (add 5 more)
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

-- Musculoskeletal (add 5 more)
(
  'A 50-year-old woman presents with generalised joint pain and morning stiffness lasting 1 hour. On examination, there are no joint deformities or swelling. ESR is 35mm/h, rheumatoid factor is negative. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Rheumatoid arthritis"},
    {"label": "B", "text": "Osteoarthritis"},
    {"label": "C", "text": "Polymyalgia rheumatica"},
    {"label": "D", "text": "Fibromyalgia"},
    {"label": "E", "text": "Gout"}
  ]'::jsonb,
  'C',
  'Polymyalgia rheumatica (PMR) presents with bilateral shoulder and hip girdle pain, morning stiffness, raised inflammatory markers, typically in patients >50 years. RF negative rules out RA. Treatment is prednisolone 15mg daily, tapering over 18-24 months. Check for associated giant cell arteritis (headache, visual symptoms).',
  'Musculoskeletal',
  'medium',
  ARRAY['NICE CKS: Polymyalgia rheumatica', 'Bilateral shoulder/hip pain + morning stiffness + raised ESR', 'Prednisolone 15mg daily', 'Check for associated GCA'],
  false
),

-- Renal (add 3 more)
(
  'A 65-year-old man with type 2 diabetes and hypertension has an eGFR of 30mL/min/1.73m² and urine ACR of 35mg/mmol. What stage of CKD is this?',
  '[
    {"label": "A", "text": "CKD Stage 2"},
    {"label": "B", "text": "CKD Stage 3a"},
    {"label": "C", "text": "CKD Stage 3b"},
    {"label": "D", "text": "CKD Stage 4"},
    {"label": "E", "text": "CKD Stage 5"}
  ]'::jsonb,
  'C',
  'CKD staging: Stage 1 (eGFR ≥90), Stage 2 (60-89), Stage 3a (45-59), Stage 3b (30-44), Stage 4 (15-29), Stage 5 (<15 or dialysis). eGFR 30 = Stage 3b. ACR 35mg/mmol indicates A3 (severe albuminuria). This requires ACE inhibitor/ARB, close monitoring, and preparation for potential progression.',
  'Renal',
  'medium',
  ARRAY['NICE CKS: Chronic kidney disease', 'Stage 3b: eGFR 30-44', 'ACR >30 = A3 (severe albuminuria)', 'ACE inhibitor/ARB indicated'],
  false
),

-- Women''s Health (add 3 more)
(
  'A 45-year-old woman presents with hot flushes, night sweats, and mood changes for 6 months. Her last period was 10 months ago. She has no contraindications to HRT. What is the most appropriate treatment?',
  '[
    {"label": "A", "text": "SSRI (fluoxetine)"},
    {"label": "B", "text": "Hormone replacement therapy (HRT)"},
    {"label": "C", "text": "Clonidine"},
    {"label": "D", "text": "Black cohosh"},
    {"label": "E", "text": "Lifestyle measures only"}
  ]'::jsonb,
  'B',
  'This is perimenopause/menopause (amenorrhoea approaching 12 months) with vasomotor symptoms. HRT is first-line treatment for menopausal symptoms if no contraindications. Consider risks vs benefits (breast cancer, VTE, stroke). SSRI is second-line if HRT contraindicated.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Menopause', 'HRT first-line for vasomotor symptoms', 'Consider risks vs benefits', 'SSRI second-line if HRT contraindicated'],
  false
),

-- Mental Health (add 3 more)
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

-- Infectious Diseases (add 3 more)
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

-- Dermatology (add 3 more)
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

-- Haematology (add 3 more)
(
  'A 72-year-old man presents with fatigue. FBC shows: Hb 90g/L, MCV 73fL, ferritin 11μg/L. What is the most important next step?',
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

-- ENT (add 2 more)
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
  'Sudden vertigo triggered by head movement, lasting seconds, with no hearing loss suggests BPPV. Hallpike test confirms (nystagmus and vertigo on head positioning). Treatment is Epley manoeuvre. Ménière''s has hearing loss and tinnitus. Vestibular neuritis lasts days.',
  'ENT',
  'medium',
  ARRAY['NICE CKS: Vertigo', 'BPPV: head movement triggered, seconds duration', 'Hallpike test diagnostic', 'Epley manoeuvre treatment'],
  false
),

-- Ophthalmology (add 2 more)
(
  'A 65-year-old man presents with sudden painless loss of vision in one eye. On examination, there is a relative afferent pupillary defect. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Central retinal artery occlusion"},
    {"label": "B", "text": "Central retinal vein occlusion"},
    {"label": "C", "text": "Retinal detachment"},
    {"label": "D", "text": "Age-related macular degeneration"},
    {"label": "E", "text": "Cataract"}
  ]'::jsonb,
  'A',
  'Sudden painless vision loss + RAPD suggests central retinal artery occlusion (CRAO) - a medical emergency. This is a stroke equivalent. Immediate referral to ophthalmology and stroke team. Time-critical for potential treatment.',
  'Ophthalmology',
  'high',
  ARRAY['NICE CKS: Visual loss', 'Sudden painless loss + RAPD = CRAO', 'Medical emergency - stroke equivalent', 'Immediate referral required'],
  false
),

-- Palliative Care (add 2 more)
(
  'A 68-year-old woman with advanced cancer is experiencing severe pain. She is currently on paracetamol and codeine. What is the next step in pain management?',
  '[
    {"label": "A", "text": "Increase codeine dose"},
    {"label": "B", "text": "Switch to morphine (strong opioid)"},
    {"label": "C", "text": "Add NSAID"},
    {"label": "D", "text": "Refer to pain clinic"},
    {"label": "E", "text": "Add gabapentin"}
  ]'::jsonb,
  'B',
  'For moderate-severe cancer pain, step up to strong opioid (morphine). Start with immediate-release morphine (e.g., 5-10mg 4-hourly), then convert to modified-release once stable. Always prescribe breakthrough dose (10-20% of 24-hour total).',
  'Palliative Care',
  'medium',
  ARRAY['NICE CKS: End of life care', 'Strong opioids for moderate-severe pain', 'Start with immediate-release morphine', 'Always prescribe breakthrough dose'],
  false
),

-- Primary Care Organisation & Management (add 5 more)
(
  'A GP practice is reviewing their QOF performance. Which of the following is NOT a QOF indicator?',
  '[
    {"label": "A", "text": "Blood pressure control in hypertension"},
    {"label": "B", "text": "HbA1c target achievement in diabetes"},
    {"label": "C", "text": "Patient satisfaction scores"},
    {"label": "D", "text": "Influenza vaccination rates"},
    {"label": "E", "text": "Smoking cessation advice"}
  ]'::jsonb,
  'C',
  'QOF (Quality and Outcomes Framework) includes clinical indicators (BP control, HbA1c targets), public health indicators (vaccination, smoking cessation), and organisational indicators. Patient satisfaction scores are not part of QOF - they are measured separately (e.g., GP Patient Survey).',
  'Primary Care Organisation & Management',
  'medium',
  ARRAY['QOF includes clinical, public health, and organisational indicators', 'Patient satisfaction measured separately', 'QOF linked to practice income'],
  false
),

-- Sexual Health (add 2 more)
(
  'A 25-year-old man presents with dysuria and penile discharge. Gram stain shows intracellular Gram-negative diplococci. What is the most appropriate treatment?',
  '[
    {"label": "A", "text": "Azithromycin 1g single dose"},
    {"label": "B", "text": "Ceftriaxone 500mg IM single dose + azithromycin 1g"},
    {"label": "C", "text": "Doxycycline 100mg BD for 7 days"},
    {"label": "D", "text": "Metronidazole 400mg BD for 7 days"},
    {"label": "E", "text": "Amoxicillin 500mg TDS for 7 days"}
  ]'::jsonb,
  'B',
  'This is gonorrhoea (intracellular Gram-negative diplococci). Treatment is ceftriaxone 500mg IM single dose + azithromycin 1g (to cover possible chlamydia co-infection). Contact tracing and partner notification essential. Test for other STIs (HIV, syphilis, chlamydia).',
  'Sexual Health',
  'medium',
  ARRAY['NICE CKS: Gonorrhoea', 'Ceftriaxone + azithromycin', 'Contact tracing essential', 'Test for other STIs'],
  false
),

-- Paediatrics (add 2 more)
(
  'A 6-month-old baby presents with a 3-day history of runny nose, cough, and mild fever. On examination, there is widespread wheeze and fine crepitations. The baby is feeding well and has no respiratory distress. What is the most appropriate management?',
  '[
    {"label": "A", "text": "Prescribe amoxicillin"},
    {"label": "B", "text": "Prescribe salbutamol"},
    {"label": "C", "text": "Supportive care, review if worsens"},
    {"label": "D", "text": "Refer to hospital"},
    {"label": "E", "text": "Prescribe prednisolone"}
  ]'::jsonb,
  'C',
  'This is bronchiolitis: coryza + cough + wheeze + crepitations in an infant <12 months, typically RSV. Management is supportive (fluids, oxygen if needed, nasal suction). Antibiotics are not indicated unless secondary bacterial infection. Salbutamol and steroids are not effective.',
  'Paediatrics',
  'medium',
  ARRAY['NICE CKS: Bronchiolitis', 'Supportive management for bronchiolitis', 'No antibiotics unless secondary infection', 'Hospital referral if severe'],
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

-- Evidence-Based Practice (add 1 more)
(
  'The number needed to treat (NNT) for a treatment is 20. This means:',
  '[
    {"label": "A", "text": "20 patients need to be treated to prevent one event"},
    {"label": "B", "text": "20% of patients will benefit"},
    {"label": "C", "text": "The treatment is 20% effective"},
    {"label": "D", "text": "20 patients will have side effects"},
    {"label": "E", "text": "The treatment costs £20 per patient"}
  ]'::jsonb,
  'A',
  'NNT (Number Needed to Treat) is the number of patients who need to be treated to prevent one additional bad outcome. NNT = 1 / ARR. Lower NNT indicates more effective treatment. NNT of 20 means you need to treat 20 people to prevent one event.',
  'Evidence-Based Practice',
  'medium',
  ARRAY['NNT = 1 / ARR', 'NNT = number of patients to treat to prevent one event', 'Lower NNT = more effective', 'NNH for adverse effects'],
  false
),

-- Add more questions to reach 85 total
-- Surgery - More General Surgery questions
(
  'A 55-year-old woman presents with a 3-day history of right upper quadrant pain, fever, and Murphy''s sign positive. Ultrasound shows gallstones and thickened gallbladder wall. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Biliary colic"},
    {"label": "B", "text": "Acute cholecystitis"},
    {"label": "C", "text": "Choledocholithiasis"},
    {"label": "D", "text": "Pancreatitis"},
    {"label": "E", "text": "Hepatitis"}
  ]'::jsonb,
  'B',
  'Acute cholecystitis: RUQ pain + fever + Murphy''s sign positive + thickened gallbladder wall on ultrasound. This requires hospital admission for IV antibiotics (co-amoxiclav or cefuroxime + metronidazole) and possible cholecystectomy. Biliary colic resolves and has no fever. Choledocholithiasis would have jaundice.',
  'Surgery',
  'medium',
  ARRAY['NICE CKS: Gallstones', 'Cholecystitis: pain + fever + Murphy''s sign', 'Thickened GB wall on US', 'IV antibiotics and possible cholecystectomy'],
  false
),

(
  'A 50-year-old man presents with a groin hernia that is irreducible and tender. He has nausea and vomiting. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Manual reduction and review"},
    {"label": "B", "text": "Urgent surgical referral"},
    {"label": "C", "text": "Prescribe analgesia and review"},
    {"label": "D", "text": "Arrange ultrasound"},
    {"label": "E", "text": "Advise truss"}
  ]'::jsonb,
  'B',
  'Irreducible (incarcerated) hernia + tenderness + nausea/vomiting suggests strangulation - a surgical emergency. This requires immediate surgical referral (within hours) for possible bowel resection. Do not attempt manual reduction if tender/strangulated. Delay can result in bowel necrosis and perforation.',
  'Surgery',
  'high',
  ARRAY['NICE CKS: Hernia', 'Irreducible + tender + vomiting = strangulation', 'Surgical emergency', 'Delay can result in bowel necrosis'],
  false
),

-- Surgery - More Urology
(
  'A 60-year-old man with BPH on tamsulosin presents with acute urinary retention. What is the most appropriate immediate management?',
  '[
    {"label": "A", "text": "Increase tamsulosin dose"},
    {"label": "B", "text": "Urgent catheterisation"},
    {"label": "C", "text": "Prescribe antibiotics"},
    {"label": "D", "text": "Refer to urology (routine)"},
    {"label": "E", "text": "Prescribe finasteride"}
  ]'::jsonb,
  'B',
  'Acute urinary retention requires immediate catheterisation to relieve obstruction and prevent complications (bladder damage, infection). After catheterisation, can attempt trial without catheter (TWOC) after 24-48 hours. If fails, consider TURP or other surgical options. Do not delay catheterisation.',
  'Surgery',
  'high',
  ARRAY['NICE CKS: LUTS in men', 'Acute retention = immediate catheterisation', 'TWOC after 24-48 hours', 'TURP if TWOC fails'],
  false
),

-- Surgery - More Vascular
(
  'A 65-year-old diabetic smoker presents with a non-healing ulcer on his foot. On examination, there are absent foot pulses and the foot is cold. What is the most important investigation?',
  '[
    {"label": "A", "text": "X-ray foot"},
    {"label": "B", "text": "Doppler ultrasound/ABPI'},
    {"label": "C", "text": "Blood glucose"},
    {"label": "D", "text": "Wound swab"},
    {"label": "E", "text": "Full blood count"}
  ]'::jsonb,
  'B',
  'Non-healing foot ulcer + absent pulses + cold foot suggests peripheral arterial disease (PAD). ABPI (ankle-brachial pressure index) or Doppler ultrasound is essential to assess vascular supply. ABPI <0.9 indicates PAD. Critical ischaemia (ABPI <0.5) requires urgent vascular referral. X-ray for osteomyelitis, but vascular assessment is priority.',
  'Surgery',
  'high',
  ARRAY['NICE CKS: Peripheral arterial disease', 'Non-healing ulcer + absent pulses = PAD', 'ABPI essential investigation', 'Critical ischaemia (ABPI <0.5) = urgent referral'],
  false
),

-- Surgery - More Colorectal
(
  'A 55-year-old man presents with a 6-week history of change in bowel habit and rectal bleeding. He has a family history of colorectal cancer. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Prescribe laxatives"},
    {"label": "B", "text": "Arrange faecal occult blood test"},
    {"label": "C", "text": "Refer for urgent colonoscopy (2-week wait)"},
    {"label": "D", "text": "Prescribe mesalazine"},
    {"label": "E", "text": "Reassure and review"}
  ]'::jsonb,
  'C',
  'Change in bowel habit + rectal bleeding + family history meets 2-week wait criteria for suspected colorectal cancer. Urgent referral for colonoscopy is required. Family history increases risk. Do not delay with symptomatic treatment.',
  'Surgery',
  'high',
  ARRAY['NICE CKS: Colorectal cancer', '2-week wait: change in bowel habit + bleeding', 'Family history increases risk', 'Urgent colonoscopy referral'],
  false
),

-- Surgery - More Upper GI
(
  'A 60-year-old man presents with dysphagia and weight loss. Upper GI endoscopy shows an oesophageal stricture. Biopsy confirms adenocarcinoma. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Prescribe omeprazole"},
    {"label": "B", "text": "Refer to upper GI MDT (2-week wait)"},
    {"label": "C", "text": "Arrange CT scan only"},
    {"label": "D", "text": "Prescribe analgesia"},
    {"label": "E", "text": "Reassure"}
  ]'::jsonb,
  'B',
  'Confirmed oesophageal cancer requires urgent referral to upper GI MDT (multidisciplinary team) via 2-week wait pathway. MDT will arrange staging (CT, PET scan, EUS) and determine treatment (surgery, chemotherapy, radiotherapy, or palliative stenting). Do not delay with symptomatic treatment.',
  'Surgery',
  'high',
  ARRAY['NICE CKS: Oesophageal cancer', 'Confirmed cancer = urgent MDT referral', 'Staging required (CT, PET, EUS)', 'MDT determines treatment'],
  false
),

-- Surgery - More Breast
(
  'A 50-year-old woman presents with nipple discharge. On examination, there is a single duct discharge that is blood-stained. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Reassure, normal"},
    {"label": "B", "text": "Prescribe antibiotics"},
    {"label": "C", "text": "Refer for breast assessment (2-week wait)"},
    {"label": "D", "text": "Arrange mammography only"},
    {"label": "E", "text": "Advise to monitor"}
  ]'::jsonb,
  'C',
  'Single duct blood-stained nipple discharge requires urgent 2-week wait referral to breast clinic. This can indicate intraductal papilloma or malignancy. Bilateral milky discharge is usually benign. Single duct discharge, especially blood-stained, needs investigation.',
  'Surgery',
  'high',
  ARRAY['NICE CKS: Breast cancer', 'Single duct blood-stained discharge = 2-week wait', 'Can indicate papilloma or malignancy', 'Triple assessment at breast clinic'],
  false
),

-- More questions across other categories to reach 85 total
-- Cardiovascular (add 3 more)
(
  'A 55-year-old man with stable angina is on aspirin, atorvastatin 80mg, and bisoprolol 5mg OD. He still experiences chest pain on moderate exertion. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Increase bisoprolol to 10mg OD"},
    {"label": "B", "text": "Add GTN spray for symptom relief"},
    {"label": "C", "text": "Add a calcium channel blocker (amlodipine)"},
    {"label": "D", "text": "Refer for coronary angiography"},
    {"label": "E", "text": "Add clopidogrel"}
  ]'::jsonb,
  'B',
  'For stable angina, GTN spray should be provided for symptom relief (as required). If symptoms persist despite optimal medical therapy, consider adding a second anti-anginal (calcium channel blocker or long-acting nitrate) or referral for revascularisation.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Stable angina', 'GTN spray for symptom relief', 'Add second anti-anginal if needed', 'Consider revascularisation if medical therapy fails'],
  false
),

-- Respiratory (add 3 more)
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

-- Endocrinology (add 3 more)
(
  'A 50-year-old woman with type 2 diabetes has an HbA1c of 70mmol/mol (8.6%) despite metformin 1g BD. She has a BMI of 30 and no cardiovascular disease. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Add gliclazide"},
    {"label": "B", "text": "Add SGLT2 inhibitor"},
    {"label": "C", "text": "Add DPP-4 inhibitor"},
    {"label": "D", "text": "Add pioglitazone"},
    {"label": "E", "text": "Start insulin"}
  ]'::jsonb,
  'C',
  'For type 2 diabetes with HbA1c above target despite metformin, consider adding a second agent. DPP-4 inhibitors are good options - weight neutral, low risk of hypoglycaemia. SGLT2 inhibitors or GLP-1 agonists are preferred if cardiovascular disease present.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Type 2 diabetes', 'DPP-4 inhibitor good second-line option', 'Weight neutral, low hypoglycaemia risk', 'SGLT2/GLP-1 preferred if CVD present'],
  false
),

-- Gastroenterology (add 3 more)
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
  'This presentation suggests peptic ulcer disease. NICE recommends test-and-treat for H. pylori first. If positive, treat with triple therapy. If negative or symptoms persist, consider PPI trial.',
  'Gastroenterology',
  'medium',
  ARRAY['NICE CKS: Dyspepsia - unidentified cause', 'Test-and-treat for H. pylori', 'Triple therapy if positive', 'PPI if H. pylori negative'],
  false
),

-- Neurology (add 3 more)
(
  'A 40-year-old woman presents with recurrent headaches associated with photophobia, phonophobia, and nausea. The headaches last 5-6 hours and are unilateral. She has no aura. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Tension headache"},
    {"label": "B", "text": "Migraine without aura"},
    {"label": "C", "text": "Cluster headache"},
    {"label": "D", "text": "Sinusitis"},
    {"label": "E", "text": "Medication overuse headache"}
  ]'::jsonb,
  'B',
  'This is classic migraine without aura: unilateral headache, photophobia, phonophobia, nausea, duration 4-72 hours. Tension headaches are bilateral and non-pulsating. Cluster headaches are very short (15-180 min).',
  'Neurology',
  'medium',
  ARRAY['NICE CKS: Migraine', 'Unilateral + photophobia + phonophobia + nausea = migraine', 'Duration 4-72 hours', 'Triptans for acute treatment'],
  false
),

-- Musculoskeletal (add 3 more)
(
  'A 55-year-old woman presents with morning stiffness lasting 2 hours, symmetrical small joint pain in hands and wrists, and fatigue. ESR is 45mm/h. What is the most appropriate next investigation?',
  '[
    {"label": "A", "text": "X-ray of hands and wrists"},
    {"label": "B", "text": "Rheumatoid factor and anti-CCP antibodies"},
    {"label": "C", "text": "Uric acid level"},
    {"label": "D", "text": "ANA and ENA panel"},
    {"label": "E", "text": "HLA-B27 test"}
  ]'::jsonb,
  'B',
  'The presentation is classic for rheumatoid arthritis: morning stiffness >30 minutes, symmetrical small joint involvement, raised inflammatory markers. Rheumatoid factor and anti-CCP antibodies are the key diagnostic tests. Anti-CCP is more specific.',
  'Musculoskeletal',
  'medium',
  ARRAY['NICE CKS: Rheumatoid arthritis', 'Anti-CCP more specific than RF', 'Morning stiffness >30 min characteristic', 'Symmetrical small joint involvement'],
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
  'CKD staging: Stage 3b (eGFR 30-44). ACR 28mg/mmol indicates A2 (moderately increased albuminuria). This requires ACE inhibitor/ARB, close monitoring, and preparation for potential progression.',
  'Renal',
  'medium',
  ARRAY['NICE CKS: Chronic kidney disease', 'Stage 3b: eGFR 30-44', 'ACR >30 = A3 (severe albuminuria)', 'ACE inhibitor/ARB indicated'],
  false
),

-- Women''s Health (add 2 more)
(
  'A 28-year-old woman presents requesting contraception. She has no medical contraindications and has never used hormonal contraception. She would prefer not to have to remember daily pills. What is the most appropriate option?',
  '[
    {"label": "A", "text": "Combined oral contraceptive pill"},
    {"label": "B", "text": "Progestogen-only pill"},
    {"label": "C", "text": "Mirena IUS"},
    {"label": "D", "text": "Contraceptive implant"},
    {"label": "E", "text": "Depot injection"}
  ]'::jsonb,
  'C',
  'For a woman who does not want to remember daily pills, long-acting reversible contraception (LARC) is ideal. Mirena IUS (or contraceptive implant) are highly effective, long-acting options. Mirena IUS also reduces heavy menstrual bleeding.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Contraception - assessment', 'LARC (IUS/implant) highly effective', 'Mirena IUS also reduces heavy bleeding', 'More effective than pills'],
  false
),

-- Mental Health (add 2 more)
(
  'A 35-year-old woman presents with excessive worry, restlessness, difficulty concentrating, and sleep disturbance for 3 months. GAD-7 score is 12. What is the first-line treatment?',
  '[
    {"label": "A", "text": "Benzodiazepines"},
    {"label": "B", "text": "SSRI (sertraline)"},
    {"label": "C", "text": "Beta-blockers"},
    {"label": "D", "text": "Buspirone"},
    {"label": "E", "text": "Watchful waiting only"}
  ]'::jsonb,
  'B',
  'GAD-7 score 10-14 indicates moderate generalised anxiety disorder. First-line treatment is SSRI (sertraline or escitalopram) or psychological therapy (CBT). Benzodiazepines should be avoided due to dependence risk.',
  'Mental Health',
  'medium',
  ARRAY['NICE CKS: Generalized anxiety disorder', 'GAD-7 10-14 = moderate', 'SSRI or CBT first-line', 'Avoid benzodiazepines (dependence)'],
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
  'For uncomplicated lower UTI in non-pregnant women, trimethoprim is first-line (if local resistance <20%). Nitrofurantoin is an alternative first-line option. Ciprofloxacin should be reserved for resistant cases.',
  'Infectious Diseases',
  'medium',
  ARRAY['NICE CKS: Urinary tract infection (lower) - women', 'Trimethoprim first-line if resistance <20%', 'Nitrofurantoin alternative first-line', 'Reserve ciprofloxacin for resistant cases'],
  false
),

-- Dermatology (add 2 more)
(
  'A 30-year-old woman presents with a new mole on her leg. It is 6mm in diameter, asymmetrical, has irregular borders, and multiple colours. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Reassure, this is benign"},
    {"label": "B", "text": "Advise to monitor"},
    {"label": "C", "text": "Refer for urgent dermatology assessment (2-week wait)"},
    {"label": "D", "text": "Take a photograph and review in 3 months"},
    {"label": "E", "text": "Prescribe topical treatment"}
  ]'::jsonb,
  'C',
  'This meets ABCDE criteria for suspected melanoma: Asymmetry, Border irregularity, multiple Colours, Diameter ≥6mm. This requires urgent 2-week wait referral to dermatology for assessment and possible excision biopsy.',
  'Dermatology',
  'high',
  ARRAY['NICE CKS: Skin cancers - recognition and referral', 'ABCDE criteria for melanoma', '2-week wait referral for suspected melanoma', 'Do not delay with monitoring'],
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
  'This is iron deficiency anaemia (microcytic, low ferritin). In an elderly man, the most important step is to investigate for the cause - commonly GI blood loss. Prescribe iron supplements but also arrange upper and lower GI investigations.',
  'Haematology',
  'high',
  ARRAY['NICE CKS: Anaemia - iron deficiency', 'Microcytic + low ferritin = iron deficiency', 'In elderly men, investigate for GI blood loss', 'Upper and lower GI investigations'],
  false
),

-- ENT (add 1 more)
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
  'Sudden vertigo triggered by head movement, lasting seconds, with no hearing loss suggests BPPV. Hallpike test confirms. Treatment is Epley manoeuvre.',
  'ENT',
  'medium',
  ARRAY['NICE CKS: Vertigo', 'BPPV: head movement triggered, seconds duration', 'Hallpike test diagnostic', 'Epley manoeuvre treatment'],
  false
),

-- Ophthalmology (add 1 more)
(
  'A 65-year-old man presents with sudden painless loss of vision in one eye. On examination, there is a relative afferent pupillary defect. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Central retinal artery occlusion"},
    {"label": "B", "text": "Central retinal vein occlusion"},
    {"label": "C", "text": "Retinal detachment"},
    {"label": "D", "text": "Age-related macular degeneration"},
    {"label": "E", "text": "Cataract"}
  ]'::jsonb,
  'A',
  'Sudden painless vision loss + RAPD suggests central retinal artery occlusion (CRAO) - a medical emergency. This is a stroke equivalent. Immediate referral to ophthalmology and stroke team required.',
  'Ophthalmology',
  'high',
  ARRAY['NICE CKS: Visual loss', 'Sudden painless loss + RAPD = CRAO', 'Medical emergency - stroke equivalent', 'Immediate referral required'],
  false
),

-- Palliative Care (add 1 more)
(
  'A 68-year-old woman with advanced cancer is experiencing severe pain. She is currently on paracetamol and codeine. What is the next step in pain management?',
  '[
    {"label": "A", "text": "Increase codeine dose"},
    {"label": "B", "text": "Switch to morphine (strong opioid)"},
    {"label": "C", "text": "Add NSAID"},
    {"label": "D", "text": "Refer to pain clinic"},
    {"label": "E", "text": "Add gabapentin"}
  ]'::jsonb,
  'B',
  'For moderate-severe cancer pain, step up to strong opioid (morphine). Start with immediate-release morphine, then convert to modified-release once stable. Always prescribe breakthrough dose.',
  'Palliative Care',
  'medium',
  ARRAY['NICE CKS: End of life care', 'Strong opioids for moderate-severe pain', 'Start with immediate-release morphine', 'Always prescribe breakthrough dose'],
  false
),

-- Primary Care Organisation & Management (add 3 more)
(
  'A patient makes a formal complaint about their GP. What is the most appropriate initial response?',
  '[
    {"label": "A", "text": "Ignore if unfounded"},
    {"label": "B", "text": "Acknowledge complaint within 3 working days"},
    {"label": "C", "text": "Refer directly to GMC"},
    {"label": "D", "text": "Discuss with patient immediately"},
    {"label": "E", "text": "Wait for patient to contact again"}
  ]'::jsonb,
  'B',
  'NHS complaints procedure requires acknowledgment within 3 working days. Practice should investigate, provide written response within agreed timeframe, and offer meeting if appropriate. If patient not satisfied, can escalate to NHS England or Ombudsman.',
  'Primary Care Organisation & Management',
  'medium',
  ARRAY['NHS complaints procedure', 'Acknowledge within 3 working days', 'Investigate and respond', 'Escalation to NHS England if not resolved'],
  false
),

-- Sexual Health (add 1 more)
(
  'A 30-year-old woman presents with vaginal discharge and dysuria. Microscopy shows clue cells. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Candidiasis"},
    {"label": "B", "text": "Bacterial vaginosis"},
    {"label": "C", "text": "Trichomoniasis"},
    {"label": "D", "text": "Chlamydia"},
    {"label": "E", "text": "Gonorrhoea"}
  ]'::jsonb,
  'B',
  'Clue cells (epithelial cells covered with bacteria) are diagnostic of bacterial vaginosis. Other features: thin, grey-white discharge, fishy odour (especially after sex), pH >4.5. Treatment is metronidazole 400mg BD for 5-7 days or clindamycin cream.',
  'Sexual Health',
  'medium',
  ARRAY['NICE CKS: Bacterial vaginosis', 'Clue cells = diagnostic', 'Metronidazole or clindamycin', 'pH >4.5'],
  false
),

-- Paediatrics (add 1 more)
(
  'A 6-month-old baby presents with a 3-day history of runny nose, cough, and mild fever. On examination, there is widespread wheeze and fine crepitations. The baby is feeding well and has no respiratory distress. What is the most appropriate management?',
  '[
    {"label": "A", "text": "Prescribe amoxicillin"},
    {"label": "B", "text": "Prescribe salbutamol"},
    {"label": "C", "text": "Supportive care, review if worsens"},
    {"label": "D", "text": "Refer to hospital"},
    {"label": "E", "text": "Prescribe prednisolone"}
  ]'::jsonb,
  'C',
  'This is bronchiolitis: coryza + cough + wheeze + crepitations in an infant <12 months, typically RSV. Management is supportive (fluids, oxygen if needed, nasal suction). Antibiotics are not indicated unless secondary bacterial infection.',
  'Paediatrics',
  'medium',
  ARRAY['NICE CKS: Bronchiolitis', 'Supportive management for bronchiolitis', 'No antibiotics unless secondary infection', 'Hospital referral if severe'],
  false
),

-- Prescribing (add 1 more)
(
  'A 75-year-old woman on warfarin for atrial fibrillation presents with a UTI. Her INR has been stable at 2.5. Which antibiotic is least likely to interact with warfarin?',
  '[
    {"label": "A", "text": "Amoxicillin"},
    {"label": "B", "text": "Trimethoprim"},
    {"label": "C", "text": "Ciprofloxacin"},
    {"label": "D", "text": "Nitrofurantoin"},
    {"label": "E", "text": "Co-amoxiclav"}
  ]'::jsonb,
  'A',
  'Amoxicillin has minimal interaction with warfarin. Trimethoprim and ciprofloxacin can increase INR significantly and require closer monitoring. When prescribing antibiotics to patients on warfarin, always check for interactions and consider closer INR monitoring.',
  'Prescribing',
  'medium',
  ARRAY['NICE CKS: Anticoagulation - oral', 'Amoxicillin minimal warfarin interaction', 'Trimethoprim and ciprofloxacin increase INR', 'Monitor INR more closely with any antibiotic'],
  false
),

-- Evidence-Based Practice (add 1 more)
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

-- Add remaining questions to reach 85 total (currently 58, need 27 more)
-- Surgery - More questions
(
  'A 40-year-old woman presents with a 2-week history of right upper quadrant pain, worse after fatty meals. Ultrasound shows multiple gallstones but no evidence of cholecystitis. What is the most appropriate management?',
  '[
    {"label": "A", "text": "Prescribe antispasmodics for pain relief"},
    {"label": "B", "text": "Advise low-fat diet and review if symptoms persist"},
    {"label": "C", "text": "Refer for elective cholecystectomy"},
    {"label": "D", "text": "Prescribe ursodeoxycholic acid"},
    {"label": "E", "text": "No treatment needed, reassure"}
  ]'::jsonb,
  'C',
  'Symptomatic gallstones (biliary colic) should be referred for elective cholecystectomy to prevent complications (cholecystitis, pancreatitis, cholangitis). Low-fat diet may reduce frequency but does not prevent complications. Ursodeoxycholic acid is for cholesterol stones but slow and not as effective as surgery.',
  'Surgery',
  'medium',
  ARRAY['NICE CKS: Gallstones', 'Symptomatic gallstones = elective cholecystectomy', 'Prevents complications (cholecystitis, pancreatitis)', 'Low-fat diet symptomatic only'],
  false
),

(
  'A 30-year-old man presents with acute severe testicular pain. On examination, the testis is tender, swollen, and lies horizontally. What is the most likely diagnosis and urgent action?',
  '[
    {"label": "A", "text": "Epididymitis - prescribe antibiotics"},
    {"label": "B", "text": "Testicular torsion - urgent surgical referral"},
    {"label": "C", "text": "Orchitis - prescribe antibiotics"},
    {"label": "D", "text": "Testicular cancer - refer to urology"},
    {"label": "E", "text": "Varicocele - reassure"}
  ]'::jsonb,
  'B',
  'Acute severe testicular pain + horizontal lie is classic for testicular torsion. This is a surgical emergency requiring immediate referral (within 6 hours) for surgical exploration and detorsion to save the testis. Do not delay with antibiotics or imaging.',
  'Surgery',
  'high',
  ARRAY['NICE CKS: Testicular torsion', 'Acute pain + horizontal lie = torsion', 'Surgical emergency - within 6 hours', 'Do not delay with imaging'],
  false
),

(
  'A 65-year-old man presents with a reducible groin swelling that appears on standing and disappears on lying. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Inguinal hernia"},
    {"label": "B", "text": "Femoral hernia"},
    {"label": "C", "text": "Varicocele"},
    {"label": "D", "text": "Lymph node"},
    {"label": "E", "text": "Lipoma"}
  ]'::jsonb,
  'A',
  'Reducible groin swelling that appears on standing/coughing and reduces on lying is classic for inguinal hernia. Femoral hernias are more common in women and below the inguinal ligament. Refer for elective repair if symptomatic or if patient wants repair.',
  'Surgery',
  'medium',
  ARRAY['NICE CKS: Hernia', 'Inguinal hernia: reducible, appears on standing', 'Femoral hernia more common in women', 'Elective repair if symptomatic'],
  false
),

-- More questions across categories
-- Cardiovascular (add 2 more)
(
  'A 70-year-old man with atrial fibrillation (CHA2DS2-VASc score 4) is currently on warfarin with good INR control. He asks about switching to a DOAC. What is the most appropriate advice?',
  '[
    {"label": "A", "text": "Continue warfarin, no benefit to switching"},
    {"label": "B", "text": "Switch to apixaban 5mg BD"},
    {"label": "C", "text": "Switch only if INR control is poor"},
    {"label": "D", "text": "DOACs are contraindicated in this age group"},
    {"label": "E", "text": "Switch to aspirin instead"}
  ]'::jsonb,
  'B',
  'DOACs (apixaban, rivaroxaban, dabigatran, edoxaban) are now preferred over warfarin for non-valvular AF due to similar efficacy, lower bleeding risk (especially intracranial), and no need for monitoring. If switching from warfarin, apixaban or rivaroxaban are suitable.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Atrial fibrillation', 'DOACs preferred over warfarin', 'Lower bleeding risk, no monitoring', 'Aspirin not recommended for AF'],
  false
),

-- Respiratory (add 2 more)
(
  'A 25-year-old woman with known asthma presents with increased use of her salbutamol inhaler (using it 4-5 times daily) and waking at night with wheeze. She takes beclomethasone 200mcg BD. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Increase beclomethasone to 400mcg BD"},
    {"label": "B", "text": "Add salmeterol (LABA)"},
    {"label": "C", "text": "Add montelukast"},
    {"label": "D", "text": "Start prednisolone 40mg daily"},
    {"label": "E", "text": "Refer to respiratory specialist"}
  ]'::jsonb,
  'A',
  'This indicates poor asthma control: SABA use >3 times/week and nocturnal symptoms. Step 3 of asthma management: increase ICS dose (beclomethasone 200mcg to 400mcg BD). If still uncontrolled after review, consider adding LABA.',
  'Respiratory',
  'medium',
  ARRAY['NICE CKS: Asthma', 'SABA >3 times/week = poor control', 'Step 3: increase ICS dose', 'Add LABA if still uncontrolled after ICS increase'],
  false
),

-- Endocrinology (add 2 more)
(
  'A 35-year-old woman presents with weight gain, fatigue, cold intolerance, and dry skin. TSH is 25mU/L (normal 0.4-4.0), free T4 is 8pmol/L (normal 12-22). What is the most appropriate management?',
  '[
    {"label": "A", "text": "No treatment, repeat thyroid function in 3 months"},
    {"label": "B", "text": "Start levothyroxine 25mcg daily"},
    {"label": "C", "text": "Start levothyroxine 50mcg daily"},
    {"label": "D", "text": "Refer to endocrinology"},
    {"label": "E", "text": "Check thyroid antibodies only"}
  ]'::jsonb,
  'C',
  'This is primary hypothyroidism: high TSH, low T4, with symptoms. Treatment is levothyroxine. For patients under 50 without cardiac disease, start at 50-100mcg daily. For those over 50 or with cardiac disease, start at 25mcg. TSH should be rechecked 6-8 weeks after starting.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Hypothyroidism', 'Start 50-100mcg if <50 and no cardiac disease', 'Start 25mcg if >50 or cardiac disease', 'Review TSH 6-8 weeks after starting'],
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
  'This is classic irritable bowel syndrome (IBS): abdominal pain associated with change in bowel habit, bloating. Rome IV criteria: recurrent abdominal pain ≥1 day/week for 3 months, associated with ≥2 of: related to defaecation, change in frequency, change in form.',
  'Gastroenterology',
  'medium',
  ARRAY['NICE CKS: Irritable bowel syndrome', 'Rome IV criteria for IBS', 'Pain + change in bowel habit + bloating', 'No red flags in this case'],
  false
),

-- Neurology (add 2 more)
(
  'A 60-year-old man presents with a 2-hour history of sudden onset left-sided weakness and slurred speech. He has a history of hypertension. What is the most appropriate immediate action?',
  '[
    {"label": "A", "text": "Prescribe aspirin 300mg and review tomorrow"},
    {"label": "B", "text": "Refer for urgent neurology outpatient appointment"},
    {"label": "C", "text": "Call 999 for immediate hospital transfer"},
    {"label": "D", "text": "Arrange CT head as outpatient"},
    {"label": "E", "text": "Prescribe clopidogrel 75mg daily"}
  ]'::jsonb,
  'C',
  'This is a suspected stroke: sudden onset focal neurology (weakness, speech). This is a medical emergency requiring immediate 999 transfer to hospital for urgent assessment, CT head, and possible thrombolysis/thrombectomy if within time window.',
  'Neurology',
  'high',
  ARRAY['NICE CKS: Stroke and TIA', 'Sudden focal neurology = stroke', 'Immediate 999 transfer required', 'Time-critical for thrombolysis/thrombectomy'],
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
  'Acute monoarthritis of the first MTP joint (podagra) is classic for gout. Thiazide diuretics are a common cause of hyperuricaemia and gout. The acute onset and severity are characteristic. Septic arthritis is possible but less likely without fever/systemic symptoms.',
  'Musculoskeletal',
  'medium',
  ARRAY['NICE CKS: Gout', 'First MTP joint = podagra', 'Thiazides cause hyperuricaemia', 'Acute monoarthritis presentation'],
  false
),

-- Renal (add 1 more)
(
  'A 70-year-old man with lower urinary tract symptoms: poor stream, hesitancy, and nocturia. Digital rectal examination reveals an enlarged, smooth prostate. PSA is 3.5ng/mL. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Refer to urology for suspected prostate cancer"},
    {"label": "B", "text": "Start tamsulosin (alpha-blocker)"},
    {"label": "C", "text": "Start finasteride (5-alpha reductase inhibitor)"},
    {"label": "D", "text": "Start combination of tamsulosin and finasteride"},
    {"label": "E", "text": "Advise lifestyle measures only"}
  ]'::jsonb,
  'B',
  'This is benign prostatic hyperplasia (BPH): LUTS with enlarged smooth prostate. PSA 3.5 is normal for age. First-line treatment is alpha-blocker (tamsulosin) for symptom relief. Finasteride is for large prostates (>30g) or if PSA >1.5.',
  'Renal',
  'medium',
  ARRAY['NICE CKS: LUTS in men', 'Alpha-blocker first-line for BPH', 'Finasteride for large prostate or PSA >1.5', 'Combination for severe symptoms'],
  false
),

-- Women''s Health (add 1 more)
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
  'This is perimenopause/menopause with vasomotor symptoms. HRT is first-line treatment for menopausal symptoms if no contraindications. Consider risks vs benefits (breast cancer, VTE, stroke). SSRI is second-line if HRT contraindicated.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Menopause', 'HRT first-line for vasomotor symptoms', 'Consider risks vs benefits', 'SSRI second-line if HRT contraindicated'],
  false
),

-- Mental Health (add 1 more)
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

-- Infectious Diseases (add 1 more)
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
  'For community-acquired pneumonia (mild-moderate severity), first-line is amoxicillin 500mg TDS for 5 days. Co-amoxiclav is for high-risk patients or if amoxicillin fails. Doxycycline or clarithromycin are alternatives if penicillin allergic.',
  'Infectious Diseases',
  'medium',
  ARRAY['NICE CKS: Pneumonia', 'Amoxicillin first-line for CAP', 'Co-amoxiclav for high-risk', '5-day course usually sufficient'],
  false
),

-- Dermatology (add 1 more)
(
  'A 25-year-old man with atopic eczema presents with worsening of his usual eczema and new areas of weeping, crusted lesions. What is the most likely complication?',
  '[
    {"label": "A", "text": "Contact dermatitis"},
    {"label": "B", "text": "Secondary bacterial infection"},
    {"label": "C", "text": "Eczema herpeticum"},
    {"label": "D", "text": "Psoriasis"},
    {"label": "E", "text": "Fungal infection"}
  ]'::jsonb,
  'B',
  'Weeping and crusting in eczema suggests secondary bacterial infection, commonly with Staphylococcus aureus. This requires oral flucloxacillin (or clarithromycin if penicillin allergic) in addition to continuing topical steroids.',
  'Dermatology',
  'medium',
  ARRAY['NICE CKS: Eczema - atopic', 'Weeping/crusting = secondary bacterial infection', 'Staph aureus most common', 'Oral flucloxacillin required'],
  false
),

-- Haematology (add 1 more)
(
  'A 50-year-old woman presents with fatigue. FBC shows: Hb 98g/L, MCV 108fL. B12 is 120ng/L (normal 200-900), folate is normal. What is the most appropriate treatment?',
  '[
    {"label": "A", "text": "Oral B12 supplements"},
    {"label": "B", "text": "Intramuscular hydroxocobalamin injections"},
    {"label": "C", "text": "Oral folic acid"},
    {"label": "D", "text": "Iron supplements"},
    {"label": "E", "text": "No treatment, B12 is normal"}
  ]'::jsonb,
  'B',
  'Macrocytic anaemia (high MCV) with low B12 indicates B12 deficiency. Treatment is intramuscular hydroxocobalamin (initially 1mg on alternate days for 2 weeks, then every 3 months). Oral B12 is not reliable due to poor absorption.',
  'Haematology',
  'medium',
  ARRAY['NICE CKS: Anaemia - B12 and folate deficiency', 'Macrocytic + low B12 = B12 deficiency', 'IM hydroxocobalamin treatment', 'Oral B12 not reliable'],
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
),

-- Prescribing (add 1 more)
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
  'ACE inhibitor cough is a common side effect (up to 20% of patients). The solution is to switch to an ARB (angiotensin receptor blocker) like losartan, which has similar efficacy but does not cause cough.',
  'Prescribing',
  'medium',
  ARRAY['NICE CKS: Hypertension', 'ACE inhibitor cough: switch to ARB', 'ARB similar efficacy, no cough', 'Monitor BP after switch'],
  false
),

-- Add final 10 questions to reach 85 total
-- Surgery (add 3 more)
(
  'A 45-year-old man presents with a 2-day history of right upper quadrant pain radiating to the back, worse after fatty meals. Ultrasound shows gallstones. He has no fever or jaundice. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Cholecystitis"},
    {"label": "B", "text": "Biliary colic"},
    {"label": "C", "text": "Choledocholithiasis"},
    {"label": "D", "text": "Pancreatitis"},
    {"label": "E", "text": "Peptic ulcer"}
  ]'::jsonb,
  'B',
  'Biliary colic presents with right upper quadrant pain, often radiating to back or shoulder, triggered by fatty meals. Pain is colicky and resolves. Cholecystitis would have fever, Murphy''s sign positive, and persistent pain. Choledocholithiasis would have jaundice.',
  'Surgery',
  'medium',
  ARRAY['NICE CKS: Gallstones', 'Biliary colic: RUQ pain, fatty meal trigger', 'Resolves between episodes', 'Cholecystitis has fever and persistent pain'],
  false
),

(
  'A 70-year-old man presents with a non-healing ulcer on his foot. On examination, there are absent foot pulses and the foot is cold. What is the most important investigation?',
  '[
    {"label": "A", "text": "X-ray foot"},
    {"label": "B", "text": "Doppler ultrasound/ABPI"},
    {"label": "C", "text": "Blood glucose"},
    {"label": "D", "text": "Wound swab"},
    {"label": "E", "text": "Full blood count"}
  ]'::jsonb,
  'B',
  'Non-healing foot ulcer + absent pulses + cold foot suggests peripheral arterial disease (PAD). ABPI (ankle-brachial pressure index) or Doppler ultrasound is essential to assess vascular supply. ABPI <0.9 indicates PAD. Critical ischaemia (ABPI <0.5) requires urgent vascular referral.',
  'Surgery',
  'high',
  ARRAY['NICE CKS: Peripheral arterial disease', 'Non-healing ulcer + absent pulses = PAD', 'ABPI essential investigation', 'Critical ischaemia (ABPI <0.5) = urgent referral'],
  false
),

(
  'A 60-year-old man with BPH on tamsulosin presents with acute urinary retention. What is the most appropriate immediate management?',
  '[
    {"label": "A", "text": "Increase tamsulosin dose"},
    {"label": "B", "text": "Urgent catheterisation"},
    {"label": "C", "text": "Prescribe antibiotics"},
    {"label": "D", "text": "Refer to urology (routine)"},
    {"label": "E", "text": "Prescribe finasteride"}
  ]'::jsonb,
  'B',
  'Acute urinary retention requires immediate catheterisation to relieve obstruction and prevent complications (bladder damage, infection). After catheterisation, can attempt trial without catheter (TWOC) after 24-48 hours. If fails, consider TURP or other surgical options.',
  'Surgery',
  'high',
  ARRAY['NICE CKS: LUTS in men', 'Acute retention = immediate catheterisation', 'TWOC after 24-48 hours', 'TURP if TWOC fails'],
  false
),

-- Cardiovascular (add 1 more)
(
  'A 65-year-old man presents with chest pain on exertion, relieved by rest. He has a history of hypertension and hypercholesterolaemia. ECG shows T-wave inversion in leads V4-V6. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Prescribe GTN spray and review in 2 weeks"},
    {"label": "B", "text": "Start aspirin 75mg and atorvastatin 80mg"},
    {"label": "C", "text": "Refer for urgent cardiology assessment (2-week wait)"},
    {"label": "D", "text": "Refer immediately to A&E"},
    {"label": "E", "text": "Arrange exercise tolerance test"}
  ]'::jsonb,
  'D',
  'This is likely unstable angina or NSTEMI: chest pain on exertion with ECG changes (T-wave inversion). This requires immediate hospital assessment (999/A&E) for troponin, further ECG monitoring, and possible urgent intervention.',
  'Cardiovascular',
  'high',
  ARRAY['NICE CKS: Chest pain - suspected cardiac', 'ECG changes + chest pain = urgent assessment', 'Troponin required to rule out NSTEMI', 'Immediate hospital referral'],
  false
),

-- Respiratory (add 1 more)
(
  'A 50-year-old smoker with COPD presents with increased breathlessness. Spirometry shows FEV1 42% predicted. He is on salbutamol PRN only. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Add salmeterol (LABA)"},
    {"label": "B", "text": "Add beclomethasone (ICS)"},
    {"label": "C", "text": "Add tiotropium (LAMA)"},
    {"label": "D", "text": "Add combination LABA/ICS"},
    {"label": "E", "text": "Continue salbutamol only"}
  ]'::jsonb,
  'C',
  'For COPD with FEV1 <50% predicted and breathlessness despite SABA, first-line is a long-acting bronchodilator. LAMA (tiotropium) is preferred as first-line maintenance therapy. LABA is an alternative. ICS is added if FEV1 <50% and ≥2 exacerbations/year.',
  'Respiratory',
  'medium',
  ARRAY['NICE CKS: Chronic obstructive pulmonary disease', 'LAMA first-line maintenance for moderate-severe COPD', 'Add ICS if FEV1 <50% and ≥2 exacerbations/year', 'LABA alternative to LAMA'],
  false
),

-- Endocrinology (add 1 more)
(
  'A 50-year-old woman with type 2 diabetes has an HbA1c of 72mmol/mol (8.7%) despite metformin 1g BD. She has a BMI of 29 and no cardiovascular disease. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Add gliclazide"},
    {"label": "B", "text": "Add SGLT2 inhibitor"},
    {"label": "C", "text": "Add DPP-4 inhibitor"},
    {"label": "D", "text": "Add pioglitazone"},
    {"label": "E", "text": "Start insulin"}
  ]'::jsonb,
  'C',
  'For type 2 diabetes with HbA1c above target despite metformin, consider adding a second agent. DPP-4 inhibitors are good options - weight neutral, low risk of hypoglycaemia. SGLT2 inhibitors or GLP-1 agonists are preferred if cardiovascular disease present.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Type 2 diabetes', 'DPP-4 inhibitor good second-line option', 'Weight neutral, low hypoglycaemia risk', 'SGLT2/GLP-1 preferred if CVD present'],
  false
),

-- Gastroenterology (add 1 more)
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
  'This presentation suggests peptic ulcer disease. NICE recommends test-and-treat for H. pylori first. If positive, treat with triple therapy. If negative or symptoms persist, consider PPI trial.',
  'Gastroenterology',
  'medium',
  ARRAY['NICE CKS: Dyspepsia - unidentified cause', 'Test-and-treat for H. pylori', 'Triple therapy if positive', 'PPI if H. pylori negative'],
  false
),

-- Neurology (add 1 more)
(
  'A 40-year-old woman presents with recurrent headaches associated with photophobia, phonophobia, and nausea. The headaches last 5-6 hours and are unilateral. She has no aura. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Tension headache"},
    {"label": "B", "text": "Migraine without aura"},
    {"label": "C", "text": "Cluster headache"},
    {"label": "D", "text": "Sinusitis"},
    {"label": "E", "text": "Medication overuse headache"}
  ]'::jsonb,
  'B',
  'This is classic migraine without aura: unilateral headache, photophobia, phonophobia, nausea, duration 4-72 hours. Tension headaches are bilateral and non-pulsating. Cluster headaches are very short (15-180 min).',
  'Neurology',
  'medium',
  ARRAY['NICE CKS: Migraine', 'Unilateral + photophobia + phonophobia + nausea = migraine', 'Duration 4-72 hours', 'Triptans for acute treatment'],
  false
),

-- Musculoskeletal (add 1 more)
(
  'A 55-year-old woman presents with morning stiffness lasting 2 hours, symmetrical small joint pain in hands and wrists, and fatigue. ESR is 45mm/h. What is the most appropriate next investigation?',
  '[
    {"label": "A", "text": "X-ray of hands and wrists"},
    {"label": "B", "text": "Rheumatoid factor and anti-CCP antibodies"},
    {"label": "C", "text": "Uric acid level"},
    {"label": "D", "text": "ANA and ENA panel"},
    {"label": "E", "text": "HLA-B27 test"}
  ]'::jsonb,
  'B',
  'The presentation is classic for rheumatoid arthritis: morning stiffness >30 minutes, symmetrical small joint involvement, raised inflammatory markers. Rheumatoid factor and anti-CCP antibodies are the key diagnostic tests. Anti-CCP is more specific.',
  'Musculoskeletal',
  'medium',
  ARRAY['NICE CKS: Rheumatoid arthritis', 'Anti-CCP more specific than RF', 'Morning stiffness >30 min characteristic', 'Symmetrical small joint involvement'],
  false
),

-- Primary Care Organisation & Management (add 1 more)
(
  'A GP practice is reviewing their QOF performance. Which of the following is NOT a QOF indicator?',
  '[
    {"label": "A", "text": "Blood pressure control in hypertension"},
    {"label": "B", "text": "HbA1c target achievement in diabetes"},
    {"label": "C", "text": "Patient satisfaction scores"},
    {"label": "D", "text": "Influenza vaccination rates"},
    {"label": "E", "text": "Smoking cessation advice"}
  ]'::jsonb,
  'C',
  'QOF (Quality and Outcomes Framework) includes clinical indicators (BP control, HbA1c targets), public health indicators (vaccination, smoking cessation), and organisational indicators. Patient satisfaction scores are not part of QOF - they are measured separately (e.g., GP Patient Survey).',
  'Primary Care Organisation & Management',
  'medium',
  ARRAY['QOF includes clinical, public health, and organisational indicators', 'Patient satisfaction measured separately', 'QOF linked to practice income'],
  false
);
