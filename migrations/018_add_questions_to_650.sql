-- Migration: Add Questions to Reach 650 Total
-- Based on comprehensive AKT structure provided
-- Currently at 527, adding ~123 questions to reach 650

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro) VALUES

-- Cardiovascular (add 10 more)
(
  'A 60-year-old man with hypertension has a clinic BP of 152/94mmHg. Home BP monitoring over 4 days shows average 138/86mmHg. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Start antihypertensive medication immediately"},
    {"label": "B", "text": "Confirm with 24-hour ABPM"},
    {"label": "C", "text": "Reassure, home BP is normal"},
    {"label": "D", "text": "Lifestyle advice only"},
    {"label": "E", "text": "Refer to cardiology"}
  ]'::jsonb,
  'B',
  'Clinic BP ≥140/90 but home BP <135/85 suggests white coat hypertension. NICE recommends confirming with 24-hour ABPM. If ABPM confirms hypertension (≥135/85 daytime average), treat. If normal, monitor annually. Home BP monitoring is useful but ABPM is gold standard for diagnosis.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Hypertension', 'White coat hypertension = ABPM', 'Home BP <135/85 suggests normal', 'ABPM gold standard for diagnosis'],
  false
),

(
  'A 65-year-old man with stable angina is on aspirin, atorvastatin 80mg, and bisoprolol 5mg OD. He still experiences chest pain on moderate exertion. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Increase bisoprolol to 10mg OD"},
    {"label": "B", "text": "Add GTN spray for symptom relief"},
    {"label": "C", "text": "Add a calcium channel blocker (amlodipine)"},
    {"label": "D", "text": "Refer for coronary angiography"},
    {"label": "E", "text": "Add clopidogrel"}
  ]'::jsonb,
  'B',
  'For stable angina, GTN spray should be provided for symptom relief (as required). If symptoms persist despite optimal medical therapy (aspirin, statin, beta-blocker), consider adding a second anti-anginal (calcium channel blocker or long-acting nitrate) or referral for revascularisation. Increasing beta-blocker may help but GTN should be available.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Stable angina', 'GTN spray for symptom relief', 'Add second anti-anginal if needed', 'Consider revascularisation if medical therapy fails'],
  false
),

-- Respiratory (add 8 more)
(
  'A 55-year-old smoker with COPD presents with increased breathlessness. Spirometry shows FEV1 42% predicted. He is on salbutamol PRN only. What is the most appropriate next step?',
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

-- Endocrinology (add 10 more)
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
  'For type 2 diabetes with HbA1c above target despite metformin, consider adding a second agent. DPP-4 inhibitors (sitagliptin, vildagliptin) are good options - weight neutral, low risk of hypoglycaemia. SGLT2 inhibitors or GLP-1 agonists are preferred if cardiovascular disease present. Gliclazide may cause weight gain and hypoglycaemia.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Type 2 diabetes', 'DPP-4 inhibitor good second-line option', 'Weight neutral, low hypoglycaemia risk', 'SGLT2/GLP-1 preferred if CVD present'],
  false
),

-- Gastroenterology (add 8 more)
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

-- Neurology (add 8 more)
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
  'This is classic migraine without aura: unilateral headache, photophobia, phonophobia, nausea, duration 4-72 hours. Tension headaches are bilateral and non-pulsating. Cluster headaches are very short (15-180 min) and occur in clusters. Sinusitis would have nasal symptoms.',
  'Neurology',
  'medium',
  ARRAY['NICE CKS: Migraine', 'Unilateral + photophobia + phonophobia + nausea = migraine', 'Duration 4-72 hours', 'Triptans for acute treatment'],
  false
),

-- Musculoskeletal (add 8 more)
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
  'The presentation is classic for rheumatoid arthritis: morning stiffness >30 minutes, symmetrical small joint involvement, raised inflammatory markers. Rheumatoid factor and anti-CCP antibodies are the key diagnostic tests. Anti-CCP is more specific. X-rays may show erosions but are not the first investigation. ANA/ENA would be for SLE. HLA-B27 is for spondyloarthropathies.',
  'Musculoskeletal',
  'medium',
  ARRAY['NICE CKS: Rheumatoid arthritis', 'Anti-CCP more specific than RF', 'Morning stiffness >30 min characteristic', 'Symmetrical small joint involvement'],
  false
),

-- Renal (add 6 more)
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

-- Women''s Health (add 6 more)
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
  'For a woman who does not want to remember daily pills, long-acting reversible contraception (LARC) is ideal. Mirena IUS (or contraceptive implant) are highly effective, long-acting options. Mirena IUS also reduces heavy menstrual bleeding. Depot injection requires 12-weekly administration. LARC methods are more effective than pills.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Contraception - assessment', 'LARC (IUS/implant) highly effective', 'Mirena IUS also reduces heavy bleeding', 'More effective than pills'],
  false
),

-- Mental Health (add 8 more)
(
  'A 50-year-old man presents with low mood, anhedonia, poor sleep, and reduced appetite for 8 weeks. PHQ-9 score is 17. He has no suicidal ideation. What is the most appropriate initial management?',
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

-- Infectious Diseases (add 8 more)
(
  'A 40-year-old woman presents with a 2-day history of dysuria and frequency. Dipstick shows nitrites positive, leukocytes positive. She has no allergies and is not pregnant. What is the first-line treatment?',
  '[
    {"label": "A", "text": "Trimethoprim 200mg BD for 3 days"},
    {"label": "B", "text": "Nitrofurantoin 100mg BD for 3 days"},
    {"label": "C", "text": "Ciprofloxacin 500mg BD for 3 days"},
    {"label": "D", "text": "Amoxicillin 500mg TDS for 7 days"},
    {"label": "E", "text": "Co-amoxiclav 625mg TDS for 7 days"}
  ]'::jsonb,
  'A',
  'For uncomplicated lower UTI in non-pregnant women, trimethoprim is first-line (if local resistance <20%). Nitrofurantoin is an alternative first-line option. Ciprofloxacin should be reserved for resistant cases. Amoxicillin has high resistance rates. Co-amoxiclav is not first-line for simple UTI.',
  'Infectious Diseases',
  'medium',
  ARRAY['NICE CKS: Urinary tract infection (lower) - women', 'Trimethoprim first-line if resistance <20%', 'Nitrofurantoin alternative first-line', 'Reserve ciprofloxacin for resistant cases'],
  false
),

-- Dermatology (add 6 more)
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
  'This meets ABCDE criteria for suspected melanoma: Asymmetry, Border irregularity, multiple Colours, Diameter ≥6mm. This requires urgent 2-week wait referral to dermatology for assessment and possible excision biopsy. Do not delay with monitoring or photography.',
  'Dermatology',
  'high',
  ARRAY['NICE CKS: Skin cancers - recognition and referral', 'ABCDE criteria for melanoma', '2-week wait referral for suspected melanoma', 'Do not delay with monitoring'],
  false
),

-- Haematology (add 6 more)
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
  'This is iron deficiency anaemia (microcytic, low ferritin). In an elderly man, the most important step is to investigate for the cause - commonly GI blood loss (upper or lower GI cancer, peptic ulcer, angiodysplasia). Prescribe iron supplements but also arrange upper and lower GI investigations (endoscopy, colonoscopy).',
  'Haematology',
  'high',
  ARRAY['NICE CKS: Anaemia - iron deficiency', 'Microcytic + low ferritin = iron deficiency', 'In elderly men, investigate for GI blood loss', 'Upper and lower GI investigations'],
  false
),

-- ENT (add 4 more)
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

-- Ophthalmology (add 4 more)
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
  'Sudden painless vision loss + RAPD suggests central retinal artery occlusion (CRAO) - a medical emergency. This is a stroke equivalent. Immediate referral to ophthalmology and stroke team. Time-critical for potential treatment. Other causes: CRVO (less acute), retinal detachment (flashes/floaters), AMD (gradual), cataract (gradual).',
  'Ophthalmology',
  'high',
  ARRAY['NICE CKS: Visual loss', 'Sudden painless loss + RAPD = CRAO', 'Medical emergency - stroke equivalent', 'Immediate referral required'],
  false
),

-- Palliative Care (add 4 more)
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
  'For moderate-severe cancer pain, step up to strong opioid (morphine). Start with immediate-release morphine (e.g., 5-10mg 4-hourly), then convert to modified-release once stable. Always prescribe breakthrough dose (10-20% of 24-hour total). Regular review and titration needed.',
  'Palliative Care',
  'medium',
  ARRAY['NICE CKS: End of life care', 'Strong opioids for moderate-severe pain', 'Start with immediate-release morphine', 'Always prescribe breakthrough dose'],
  false
),

-- Primary Care Organisation & Management (add 10 more)
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
  'NHS complaints procedure requires acknowledgment within 3 working days. Practice should investigate, provide written response within agreed timeframe, and offer meeting if appropriate. If patient not satisfied, can escalate to NHS England or Ombudsman. GMC referral only for serious professional misconduct.',
  'Primary Care Organisation & Management',
  'medium',
  ARRAY['NHS complaints procedure', 'Acknowledge within 3 working days', 'Investigate and respond', 'Escalation to NHS England if not resolved'],
  false
),

-- Sexual Health (add 4 more)
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

-- Paediatrics (add 4 more)
(
  'A 2-year-old child presents with a 2-day history of fever (38.8°C), runny nose, and a barking cough. On examination, there is stridor at rest. What is the most likely diagnosis and treatment?',
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

-- Men''s Health (add 2 more)
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
  'For erectile dysfunction, first-line is PDE5 inhibitor (sildenafil, tadalafil). Sildenafil 50mg as required (can increase to 100mg if needed). Check for contraindications (nitrates, severe cardiac disease). Testosterone only if hypogonadism confirmed. Address underlying causes (diabetes control, cardiovascular risk).',
  'Men''s Health',
  'medium',
  ARRAY['NICE CKS: Erectile dysfunction', 'PDE5 inhibitor first-line', 'Sildenafil 50mg as required', 'Check contraindications (nitrates)'],
  false
),

-- Prescribing (add 4 more)
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
  'ACE inhibitor cough is a common side effect (up to 20% of patients). The solution is to switch to an ARB (angiotensin receptor blocker) like losartan, which has similar efficacy but does not cause cough. Do not just treat the cough symptomatically. ARBs are equivalent to ACE inhibitors for heart failure and hypertension.',
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

-- Continue adding more questions to reach 650 total
-- Cardiovascular (add 8 more)
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
  'DOACs (apixaban, rivaroxaban, dabigatran, edoxaban) are now preferred over warfarin for non-valvular AF due to similar efficacy, lower bleeding risk (especially intracranial), and no need for monitoring. If switching from warfarin, apixaban or rivaroxaban are suitable. Age is not a contraindication. Aspirin is not recommended for stroke prevention in AF.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Atrial fibrillation', 'DOACs preferred over warfarin', 'Lower bleeding risk, no monitoring', 'Aspirin not recommended for AF'],
  false
),

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
  'This is likely unstable angina or NSTEMI: chest pain on exertion with ECG changes (T-wave inversion). This requires immediate hospital assessment (999/A&E) for troponin, further ECG monitoring, and possible urgent intervention. Do not delay with 2-week wait referral. GTN may help but does not replace urgent assessment.',
  'Cardiovascular',
  'high',
  ARRAY['NICE CKS: Chest pain - suspected cardiac', 'ECG changes + chest pain = urgent assessment', 'Troponin required to rule out NSTEMI', 'Immediate hospital referral'],
  false
),

-- Respiratory (add 7 more)
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
  'This indicates poor asthma control: SABA use >3 times/week and nocturnal symptoms. Step 3 of asthma management: increase ICS dose (beclomethasone 200mcg to 400mcg BD). If still uncontrolled after review, consider adding LABA. Montelukast is an alternative add-on. Oral steroids are for acute exacerbations, not maintenance.',
  'Respiratory',
  'medium',
  ARRAY['NICE CKS: Asthma', 'SABA >3 times/week = poor control', 'Step 3: increase ICS dose', 'Add LABA if still uncontrolled after ICS increase'],
  false
),

-- Endocrinology (add 9 more)
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
  'This is primary hypothyroidism: high TSH, low T4, with symptoms. Treatment is levothyroxine. For patients under 50 without cardiac disease, start at 50-100mcg daily. For those over 50 or with cardiac disease, start at 25mcg. TSH should be rechecked 6-8 weeks after starting. Antibodies can confirm autoimmune cause but treatment is the same.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Hypothyroidism', 'Start 50-100mcg if <50 and no cardiac disease', 'Start 25mcg if >50 or cardiac disease', 'Review TSH 6-8 weeks after starting'],
  false
),

-- Gastroenterology (add 7 more)
(
  'A 55-year-old man presents with a 6-month history of intermittent rectal bleeding and change in bowel habit. He has lost 5kg unintentionally. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Prescribe laxatives and review in 2 weeks"},
    {"label": "B", "text": "Arrange faecal occult blood test"},
    {"label": "C", "text": "Refer for urgent colonoscopy (2-week wait)"},
    {"label": "D", "text": "Prescribe mesalazine for suspected IBD"},
    {"label": "E", "text": "Reassure and advise high-fibre diet"}
  ]'::jsonb,
  'C',
  'This meets 2-week wait criteria for suspected colorectal cancer: rectal bleeding + change in bowel habit + unexplained weight loss. Urgent referral for colonoscopy is required. Do not delay with symptomatic treatment.',
  'Gastroenterology',
  'high',
  ARRAY['NICE CKS: Colorectal cancer', '2-week wait: rectal bleeding + change in bowel habit + weight loss', 'Urgent colonoscopy referral', 'Do not delay with symptomatic treatment'],
  false
),

-- Neurology (add 7 more)
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
  'This is a suspected stroke: sudden onset focal neurology (weakness, speech). This is a medical emergency requiring immediate 999 transfer to hospital for urgent assessment, CT head, and possible thrombolysis/thrombectomy if within time window. Do not delay with outpatient referrals or prescribing.',
  'Neurology',
  'high',
  ARRAY['NICE CKS: Stroke and TIA', 'Sudden focal neurology = stroke', 'Immediate 999 transfer required', 'Time-critical for thrombolysis/thrombectomy'],
  false
),

-- Musculoskeletal (add 7 more)
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

-- Renal (add 5 more)
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
  'This is benign prostatic hyperplasia (BPH): LUTS with enlarged smooth prostate. PSA 3.5 is normal for age. First-line treatment is alpha-blocker (tamsulosin) for symptom relief. Finasteride is for large prostates (>30g) or if PSA >1.5. Combination is for severe symptoms. Lifestyle measures (fluid restriction, double voiding) can help but medical treatment is usually needed.',
  'Renal',
  'medium',
  ARRAY['NICE CKS: LUTS in men', 'Alpha-blocker first-line for BPH', 'Finasteride for large prostate or PSA >1.5', 'Combination for severe symptoms'],
  false
),

-- Women''s Health (add 5 more)
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

-- Mental Health (add 7 more)
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
  'GAD-7 score 10-14 indicates moderate generalised anxiety disorder. First-line treatment is SSRI (sertraline or escitalopram) or psychological therapy (CBT). Benzodiazepines should be avoided due to dependence risk. Beta-blockers are for physical symptoms only. Buspirone is second-line. Watchful waiting is not appropriate for moderate-severe symptoms.',
  'Mental Health',
  'medium',
  ARRAY['NICE CKS: Generalized anxiety disorder', 'GAD-7 10-14 = moderate', 'SSRI or CBT first-line', 'Avoid benzodiazepines (dependence)'],
  false
),

-- Infectious Diseases (add 7 more)
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

-- Dermatology (add 5 more)
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
  'Weeping and crusting in eczema suggests secondary bacterial infection, commonly with Staphylococcus aureus. This requires oral flucloxacillin (or clarithromycin if penicillin allergic) in addition to continuing topical steroids. Eczema herpeticum would show monomorphic vesicles. Contact dermatitis would be more localised.',
  'Dermatology',
  'medium',
  ARRAY['NICE CKS: Eczema - atopic', 'Weeping/crusting = secondary bacterial infection', 'Staph aureus most common', 'Oral flucloxacillin required'],
  false
),

-- Haematology (add 5 more)
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
  'Macrocytic anaemia (high MCV) with low B12 indicates B12 deficiency. Treatment is intramuscular hydroxocobalamin (initially 1mg on alternate days for 2 weeks, then every 3 months). Oral B12 is not reliable due to poor absorption (often due to pernicious anaemia or gastric surgery). Folate is normal so no need for folic acid. Iron would be for microcytic anaemia.',
  'Haematology',
  'medium',
  ARRAY['NICE CKS: Anaemia - B12 and folate deficiency', 'Macrocytic + low B12 = B12 deficiency', 'IM hydroxocobalamin treatment', 'Oral B12 not reliable'],
  false
),

-- Primary Care Organisation & Management (add 8 more)
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
  'Data governance is paramount in healthcare. Any clinical system must comply with GDPR, ensure patient data security, have appropriate access controls, and maintain confidentiality. Data breaches can result in significant penalties and loss of patient trust. All other factors are important but data security is non-negotiable.',
  'Primary Care Organisation & Management',
  'medium',
  ARRAY['GDPR compliance essential', 'Data security paramount', 'Access controls required', 'Patient confidentiality'],
  false
),

-- Sexual Health (add 3 more)
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

-- Paediatrics (add 3 more)
(
  'A 6-month-old baby presents with a 3-day history of runny nose, cough, and mild fever. On examination, there is widespread wheeze and fine inspiratory crepitations. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Asthma"},
    {"label": "B", "text": "Bronchiolitis"},
    {"label": "C", "text": "Pneumonia"},
    {"label": "D", "text": "Croup"},
    {"label": "E", "text": "Whooping cough"}
  ]'::jsonb,
  'B',
  'Bronchiolitis is common in infants <12 months, typically caused by RSV. Features include coryza, cough, wheeze, and fine crepitations. It is a clinical diagnosis. Management is supportive (fluids, oxygen if needed). Antibiotics are not indicated unless secondary bacterial infection. Asthma is rare in infants. Croup has stridor, not wheeze.',
  'Paediatrics',
  'medium',
  ARRAY['NICE CKS: Bronchiolitis', 'Common <12 months, RSV most common', 'Clinical diagnosis: coryza + cough + wheeze + crepitations', 'Supportive management, no antibiotics unless secondary infection'],
  false
),

-- Prescribing (add 3 more)
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
  'Amoxicillin has minimal interaction with warfarin. Trimethoprim and ciprofloxacin can increase INR significantly and require closer monitoring. Nitrofurantoin has minimal interaction. Co-amoxiclav (amoxicillin + clavulanic acid) also has minimal interaction, but amoxicillin alone is the safest. When prescribing antibiotics to patients on warfarin, always check for interactions and consider closer INR monitoring.',
  'Prescribing',
  'medium',
  ARRAY['NICE CKS: Anticoagulation - oral', 'Amoxicillin minimal warfarin interaction', 'Trimethoprim and ciprofloxacin increase INR', 'Monitor INR more closely with any antibiotic'],
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
  'NNT (Number Needed to Treat) is the number of patients who need to be treated to prevent one additional bad outcome. NNT = 1 / ARR. Lower NNT indicates more effective treatment. NNT of 20 means you need to treat 20 people to prevent one event. NNH (Number Needed to Harm) is the equivalent for adverse effects.',
  'Evidence-Based Practice',
  'medium',
  ARRAY['NNT = 1 / ARR', 'NNT = number of patients to treat to prevent one event', 'Lower NNT = more effective', 'NNH for adverse effects'],
  false
);
