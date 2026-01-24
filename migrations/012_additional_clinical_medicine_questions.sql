-- Migration: Additional Clinical Medicine AKT Questions
-- Based on NICE CKS topics
-- This adds 50 more clinical medicine questions to expand the question bank

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro) VALUES

-- Infectious Diseases
(
  'A 45-year-old man presents with a 3-day history of fever, sore throat, and cervical lymphadenopathy. He has a monospot test that is positive. What is the most appropriate management?',
  '[
    {"label": "A", "text": "Prescribe amoxicillin immediately"},
    {"label": "B", "text": "Prescribe acyclovir for 7 days"},
    {"label": "C", "text": "Advise rest, fluids, and symptomatic treatment"},
    {"label": "D", "text": "Refer urgently to ENT"},
    {"label": "E", "text": "Prescribe prednisolone 40mg daily"}
  ]'::jsonb,
  'C',
  'Infectious mononucleosis (glandular fever) is typically caused by EBV and is a self-limiting viral illness. Amoxicillin should be avoided as it causes a rash in 90% of patients with EBV. Management is supportive with rest, fluids, and paracetamol/ibuprofen for symptoms. Steroids are only indicated for severe complications like airway obstruction.',
  'Infectious Diseases',
  'medium',
  ARRAY['NICE CKS: Sore throat - acute', 'Avoid amoxicillin in EBV', 'Supportive management for viral illness', 'Steroids only for complications'],
  false
),

(
  'A 30-year-old woman presents with a 2-day history of dysuria and frequency. Dipstick shows nitrites positive, leukocytes positive. She has no allergies and is not pregnant. What is the first-line treatment?',
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

-- Musculoskeletal
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

-- Endocrinology
(
  'A 50-year-old woman with type 2 diabetes has an HbA1c of 68mmol/mol (8.4%) despite metformin 1g BD. She has a BMI of 32 and established cardiovascular disease. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Add gliclazide"},
    {"label": "B", "text": "Add SGLT2 inhibitor"},
    {"label": "C", "text": "Add DPP-4 inhibitor"},
    {"label": "D", "text": "Add pioglitazone"},
    {"label": "E", "text": "Start insulin"}
  ]'::jsonb,
  'B',
  'For patients with type 2 diabetes and established CVD, SGLT2 inhibitors are recommended as they have proven cardiovascular benefits and reduce cardiovascular events. GLP-1 agonists are also an option. DPP-4 inhibitors are neutral for CV outcomes. Gliclazide may cause weight gain and hypoglycaemia. Pioglitazone has CV concerns.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Type 2 diabetes', 'SGLT2 inhibitor for CVD benefits', 'GLP-1 agonist also option', 'DPP-4 neutral for CV outcomes'],
  false
),

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

-- Respiratory
(
  'A 60-year-old smoker with COPD presents with increased breathlessness and purulent sputum for 3 days. He has no fever. What is the most appropriate management?',
  '[
    {"label": "A", "text": "No antibiotics, increase bronchodilators only"},
    {"label": "B", "text": "Amoxicillin 500mg TDS for 5 days"},
    {"label": "C", "text": "Doxycycline 200mg on day 1, then 100mg OD for 4 more days"},
    {"label": "D", "text": "Co-amoxiclav 625mg TDS for 7 days"},
    {"label": "E", "text": "Refer to hospital"}
  ]'::jsonb,
  'B',
  'This is a moderate COPD exacerbation: increased breathlessness + purulent sputum (2 of 3 Anthonisen criteria). First-line antibiotic is amoxicillin 500mg TDS for 5 days (or doxycycline). Co-amoxiclav is reserved for high-risk patients or if amoxicillin fails. Hospital referral only if severe (respiratory failure, unable to cope at home).',
  'Respiratory',
  'medium',
  ARRAY['NICE CKS: Chronic obstructive pulmonary disease', 'Anthonisen criteria: breathlessness + sputum + purulence', 'Amoxicillin first-line for moderate exacerbation', 'Co-amoxiclav for high-risk or treatment failure'],
  false
),

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

-- Cardiovascular
(
  'A 70-year-old man with atrial fibrillation (CHA2DS2-VASc score 3) is currently on warfarin with good INR control. He asks about switching to a DOAC. What is the most appropriate advice?',
  '[
    {"label": "A", "text": "Continue warfarin, no benefit to switching"},
    {"label": "B", "text": "Switch to apixaban 5mg BD"},
    {"label": "C", "text": "Switch to rivaroxaban 20mg OD"},
    {"label": "D", "text": "Switch only if he has problems with INR monitoring"},
    {"label": "E", "text": "DOACs are contraindicated in this age group"}
  ]'::jsonb,
  'B',
  'DOACs (apixaban, rivaroxaban, dabigatran, edoxaban) are now preferred over warfarin for non-valvular AF due to similar efficacy, lower bleeding risk (especially intracranial), and no need for monitoring. If switching from warfarin with good control, apixaban or rivaroxaban are suitable. Age is not a contraindication. The decision should be shared with the patient.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Atrial fibrillation', 'DOACs preferred over warfarin for non-valvular AF', 'Lower bleeding risk, especially intracranial', 'No monitoring required'],
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

-- Gastroenterology
(
  'A 40-year-old woman presents with recurrent episodes of right upper quadrant pain, worse after fatty meals. Ultrasound shows multiple gallstones but no evidence of cholecystitis. What is the most appropriate management?',
  '[
    {"label": "A", "text": "Prescribe antispasmodics for pain relief"},
    {"label": "B", "text": "Advise low-fat diet and review if symptoms persist"},
    {"label": "C", "text": "Refer for elective cholecystectomy"},
    {"label": "D", "text": "Prescribe ursodeoxycholic acid"},
    {"label": "E", "text": "No treatment needed, reassure"}
  ]'::jsonb,
  'C',
  'Symptomatic gallstones (biliary colic) should be referred for elective cholecystectomy to prevent complications (cholecystitis, pancreatitis, cholangitis). Low-fat diet may reduce frequency but does not prevent complications. Ursodeoxycholic acid is for cholesterol stones but slow and not as effective as surgery. Antispasmodics are symptomatic only.',
  'Gastroenterology',
  'medium',
  ARRAY['NICE CKS: Gallstones', 'Symptomatic gallstones = elective cholecystectomy', 'Prevents complications (cholecystitis, pancreatitis)', 'Low-fat diet symptomatic only'],
  false
),

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
  'This meets 2-week wait criteria for suspected colorectal cancer: rectal bleeding + change in bowel habit + unexplained weight loss. Urgent referral for colonoscopy is required. FOBT is not appropriate when urgent referral criteria are met. Do not delay with symptomatic treatment.',
  'Gastroenterology',
  'high',
  ARRAY['NICE CKS: Colorectal cancer', '2-week wait: rectal bleeding + change in bowel habit + weight loss', 'Urgent colonoscopy referral', 'Do not delay with symptomatic treatment'],
  false
),

-- Dermatology
(
  'A 30-year-old woman presents with a new mole on her back. It is 8mm in diameter, asymmetrical, has irregular borders, and multiple colours (brown, black, pink). What is the most appropriate action?',
  '[
    {"label": "A", "text": "Reassure, this is a benign naevus"},
    {"label": "B", "text": "Advise to monitor and return if changes"},
    {"label": "C", "text": "Refer for urgent dermatology assessment (2-week wait)"},
    {"label": "D", "text": "Take a photograph and review in 3 months"},
    {"label": "E", "text": "Prescribe topical imiquimod"}
  ]'::jsonb,
  'C',
  'This meets ABCDE criteria for suspected melanoma: Asymmetry, Border irregularity, multiple Colours, Diameter >6mm. This requires urgent 2-week wait referral to dermatology for assessment and possible excision biopsy. Do not delay with monitoring or photography.',
  'Dermatology',
  'high',
  ARRAY['NICE CKS: Skin cancers - recognition and referral', 'ABCDE criteria for melanoma', '2-week wait referral for suspected melanoma', 'Do not delay with monitoring'],
  false
),

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

-- Neurology
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

(
  'A 35-year-old woman presents with recurrent headaches associated with photophobia, phonophobia, and nausea. The headaches last 4-6 hours and are unilateral. She has no aura. What is the most likely diagnosis?',
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

-- Women''s Health
(
  'A 28-year-old woman presents requesting emergency contraception. She had unprotected intercourse 50 hours ago. She has no contraindications to hormonal contraception. What is the most appropriate option?',
  '[
    {"label": "A", "text": "Levonorgestrel 1.5mg single dose"},
    {"label": "B", "text": "Ulipristal 30mg single dose"},
    {"label": "C", "text": "Copper IUD insertion"},
    {"label": "D", "text": "Combined oral contraceptive (Yuzpe method)"},
    {"label": "E", "text": "No effective option available after 48 hours"}
  ]'::jsonb,
  'B',
  'Ulipristal (ellaOne) is effective up to 120 hours (5 days) after unprotected intercourse and is more effective than levonorgestrel. Levonorgestrel is only effective up to 72 hours. Copper IUD is also effective up to 5 days and is the most effective option, but requires insertion. Ulipristal is the best oral option at 50 hours.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Contraception - emergency', 'Ulipristal up to 120 hours', 'More effective than levonorgestrel', 'Copper IUD most effective but requires insertion'],
  false
),

(
  'A 45-year-old woman presents with heavy menstrual bleeding affecting her quality of life. She has completed her family and has no contraindications to IUS. What is the first-line treatment?',
  '[
    {"label": "A", "text": "Tranexamic acid during menses"},
    {"label": "B", "text": "Mirena IUS (levonorgestrel-releasing)"},
    {"label": "C", "text": "Combined oral contraceptive pill"},
    {"label": "D", "text": "Endometrial ablation"},
    {"label": "E", "text": "Hysterectomy"}
  ]'::jsonb,
  'B',
  'Mirena IUS is first-line for heavy menstrual bleeding in women who have completed their family. It reduces bleeding by up to 90% and provides contraception. Tranexamic acid and COCP are second-line options. Endometrial ablation or hysterectomy are considered if medical management fails.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Menorrhagia (heavy menstrual bleeding)', 'Mirena IUS first-line', 'Reduces bleeding by 90%', 'Provides contraception'],
  false
),

-- Paediatrics
(
  'A 2-year-old child presents with a 2-day history of fever (39°C), non-blanching rash, and reduced oral intake. The child is listless and has a capillary refill time of 3 seconds. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Prescribe amoxicillin and review in 24 hours"},
    {"label": "B", "text": "Advise paracetamol and review if worse"},
    {"label": "C", "text": "Refer immediately to hospital (999)"},
    {"label": "D", "text": "Arrange urgent blood tests as outpatient"},
    {"label": "E", "text": "Prescribe oral antibiotics and review tomorrow"}
  ]'::jsonb,
  'C',
  'This child has red flag features for serious illness: non-blanching rash (meningococcal septicaemia), reduced consciousness (listless), prolonged capillary refill (shock). This requires immediate 999 transfer to hospital. Do not delay with antibiotics or outpatient tests.',
  'Paediatrics',
  'high',
  ARRAY['NICE CKS: Feverish children - management', 'Non-blanching rash = red flag', 'Reduced consciousness = red flag', 'Immediate hospital referral required'],
  false
),

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

-- Mental Health
(
  'A 40-year-old man presents with low mood, anhedonia, poor sleep, and reduced appetite for 6 weeks. PHQ-9 score is 18. He has no suicidal ideation. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Watchful waiting and review in 2 weeks"},
    {"label": "B", "text": "Prescribe sertraline 50mg daily"},
    {"label": "C", "text": "Refer for CBT"},
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
  'A 30-year-old woman presents with excessive worry about multiple things, restlessness, difficulty concentrating, and sleep disturbance for 3 months. GAD-7 score is 12. What is the first-line treatment?',
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

-- Renal/Urology
(
  'A 70-year-old man presents with lower urinary tract symptoms: poor stream, hesitancy, and nocturia (3-4 times per night). Digital rectal examination reveals an enlarged, smooth prostate. PSA is 3.5ng/mL. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Refer to urology for suspected prostate cancer"},
    {"label": "B", "text": "Start tamsulosin (alpha-blocker)"},
    {"label": "C", "text": "Start finasteride (5-alpha reductase inhibitor)"},
    {"label": "D", "text": "Start combination of tamsulosin and finasteride"},
    {"label": "E", "text": "Advise lifestyle measures only"}
  ]'::jsonb,
  'B',
  'This is benign prostatic hyperplasia (BPH): LUTS with enlarged smooth prostate. PSA 3.5 is normal for age. First-line treatment is alpha-blocker (tamsulosin) for symptom relief. Finasteride is for large prostates (>30g) or if PSA >1.5. Combination is for severe symptoms. Lifestyle measures (fluid restriction, double voiding) can help but medical treatment is usually needed.',
  'Urology',
  'medium',
  ARRAY['NICE CKS: LUTS in men', 'Alpha-blocker first-line for BPH', 'Finasteride for large prostate or PSA >1.5', 'Combination for severe symptoms'],
  false
),

(
  'A 60-year-old woman with type 2 diabetes and hypertension has an eGFR of 28mL/min/1.73m² and urine ACR of 45mg/mmol. What stage of CKD is this?',
  '[
    {"label": "A", "text": "CKD Stage 2"},
    {"label": "B", "text": "CKD Stage 3a"},
    {"label": "C", "text": "CKD Stage 3b"},
    {"label": "D", "text": "CKD Stage 4"},
    {"label": "E", "text": "CKD Stage 5"}
  ]'::jsonb,
  'D',
  'CKD staging: Stage 1 (eGFR ≥90), Stage 2 (60-89), Stage 3a (45-59), Stage 3b (30-44), Stage 4 (15-29), Stage 5 (<15 or dialysis). eGFR 28 = Stage 4. ACR 45mg/mmol indicates A3 (severe albuminuria). This requires close monitoring, ACE inhibitor/ARB, and preparation for renal replacement therapy.',
  'Renal',
  'medium',
  ARRAY['NICE CKS: Chronic kidney disease', 'Stage 4: eGFR 15-29', 'ACR >30 = A3 (severe albuminuria)', 'ACE inhibitor/ARB indicated'],
  false
),

-- Haematology
(
  'A 65-year-old man presents with fatigue and breathlessness. FBC shows: Hb 95g/L, MCV 72fL, ferritin 8μg/L. What is the most likely cause?',
  '[
    {"label": "A", "text": "B12 deficiency"},
    {"label": "B", "text": "Folate deficiency"},
    {"label": "C", "text": "Iron deficiency anaemia"},
    {"label": "D", "text": "Anaemia of chronic disease"},
    {"label": "E", "text": "Thalassaemia"}
  ]'::jsonb,
  'C',
  'Microcytic anaemia (low MCV 72fL) with low ferritin (8μg/L) is diagnostic of iron deficiency anaemia. In an elderly man, the most important consideration is identifying the cause - commonly GI blood loss (upper or lower GI cancer, peptic ulcer, angiodysplasia). B12/folate deficiency cause macrocytic anaemia. Anaemia of chronic disease has normal/high ferritin.',
  'Haematology',
  'medium',
  ARRAY['NICE CKS: Anaemia - iron deficiency', 'Microcytic + low ferritin = iron deficiency', 'In elderly men, consider GI blood loss', 'Investigate for underlying cause'],
  false
),

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

-- Prescribing/Safety
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

(
  'A 60-year-old man on ramipril 5mg BD for heart failure presents with a persistent dry cough. What is the most appropriate action?',
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
  ARRAY['NICE CKS: Hypertension', 'ACE inhibitor cough: switch to ARB', 'ARB similar efficacy, no cough', 'Losartan equivalent to ACE inhibitor'],
  false
),

-- Additional Clinical Topics
(
  'A 55-year-old woman presents with hot flushes, night sweats, and irregular periods for 6 months. She has no contraindications to HRT. What is the first-line treatment?',
  '[
    {"label": "A", "text": "SSRI (fluoxetine)"},
    {"label": "B", "text": "Hormone replacement therapy (HRT)"},
    {"label": "C", "text": "Clonidine"},
    {"label": "D", "text": "Black cohosh"},
    {"label": "E", "text": "Lifestyle measures only"}
  ]'::jsonb,
  'B',
  'This is perimenopause/menopause with vasomotor symptoms. HRT is first-line treatment for menopausal symptoms if no contraindications. SSRI (fluoxetine) is second-line if HRT is contraindicated or patient prefers. Clonidine and black cohosh have limited evidence. Lifestyle measures can help but are not first-line for moderate-severe symptoms.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Menopause', 'HRT first-line for vasomotor symptoms', 'SSRI second-line if HRT contraindicated', 'Consider risks vs benefits'],
  false
),

(
  'A 40-year-old man presents with acute severe headache, visual disturbance, and jaw claudication. ESR is 85mm/h, CRP is 45mg/L. What is the most likely diagnosis and urgent management?',
  '[
    {"label": "A", "text": "Migraine - prescribe triptan"},
    {"label": "B", "text": "Tension headache - prescribe simple analgesia"},
    {"label": "C", "text": "Giant cell arteritis - urgent high-dose prednisolone"},
    {"label": "D", "text": "Cluster headache - prescribe sumatriptan"},
    {"label": "E", "text": "Sinusitis - prescribe antibiotics"}
  ]'::jsonb,
  'C',
  'This is classic giant cell arteritis (temporal arteritis): headache + visual disturbance + jaw claudication + raised inflammatory markers. This is a medical emergency requiring urgent high-dose prednisolone (40-60mg daily) to prevent permanent vision loss. Do not delay - refer immediately to ophthalmology/rheumatology or start steroids if referral delayed.',
  'Rheumatology',
  'high',
  ARRAY['NICE CKS: Giant cell arteritis', 'Headache + visual disturbance + jaw claudication', 'Elevated ESR/CRP', 'Urgent high-dose steroids to prevent blindness'],
  false
),

(
  'A 35-year-old woman with type 1 diabetes presents with 2-day history of polyuria, polydipsia, nausea, and abdominal pain. Blood glucose is 22mmol/L, ketones are 4.2mmol/L. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Prescribe metformin and review in 24 hours"},
    {"label": "B", "text": "Advise to increase insulin and review tomorrow"},
    {"label": "C", "text": "Refer immediately to hospital (999)"},
    {"label": "D", "text": "Prescribe oral rehydration solution"},
    {"label": "E", "text": "Arrange urgent diabetic review as outpatient"}
  ]'::jsonb,
  'C',
  'This is diabetic ketoacidosis (DKA): hyperglycaemia + ketonaemia + acidosis symptoms. This is a medical emergency requiring immediate hospital admission for IV fluids, IV insulin, and electrolyte monitoring. Do not delay with outpatient management. Metformin is not for type 1 diabetes. DKA can be life-threatening.',
  'Endocrinology',
  'high',
  ARRAY['NICE CKS: Diabetic ketoacidosis', 'Hyperglycaemia + ketonaemia = DKA', 'Immediate hospital admission required', 'IV fluids and IV insulin'],
  false
),

(
  'A 50-year-old man presents with a 3-month history of progressive dysphagia, initially for solids, now for liquids. He has lost 8kg unintentionally. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Prescribe omeprazole and review in 2 weeks"},
    {"label": "B", "text": "Arrange barium swallow"},
    {"label": "C", "text": "Refer for urgent upper GI endoscopy (2-week wait)"},
    {"label": "D", "text": "Prescribe antacids and review if persists"},
    {"label": "E", "text": "Reassure and advise soft diet"}
  ]'::jsonb,
  'C',
  'Progressive dysphagia + weight loss meets 2-week wait criteria for suspected oesophageal cancer. Urgent upper GI endoscopy is required. Do not delay with PPI trial or barium swallow (endoscopy is diagnostic and allows biopsy). This is a red flag presentation.',
  'Gastroenterology',
  'high',
  ARRAY['NICE CKS: Dyspepsia - unidentified cause', 'Dysphagia + weight loss = red flag', '2-week wait referral for endoscopy', 'Consider oesophageal cancer'],
  false
),

(
  'A 28-year-old woman presents with a 2-week history of lower abdominal pain, deep dyspareunia, and intermenstrual bleeding. On examination, there is cervical motion tenderness. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Irritable bowel syndrome"},
    {"label": "B", "text": "Pelvic inflammatory disease"},
    {"label": "C", "text": "Ectopic pregnancy"},
    {"label": "D", "text": "Endometriosis"},
    {"label": "E", "text": "Urinary tract infection"}
  ]'::jsonb,
  'B',
  'Cervical motion tenderness is a classic sign of pelvic inflammatory disease (PID). Other features include lower abdominal pain, deep dyspareunia, intermenstrual bleeding, and possible discharge. Ectopic pregnancy must be excluded (urine pregnancy test). Treatment is antibiotics (doxycycline + metronidazole, or ofloxacin + metronidazole).',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Pelvic inflammatory disease', 'Cervical motion tenderness = PID', 'Exclude ectopic pregnancy', 'Antibiotics: doxycycline + metronidazole'],
  false
),

(
  'A 65-year-old woman presents with sudden onset of severe right-sided headache and ptosis. On examination, the right pupil is dilated and unreactive. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Migraine"},
    {"label": "B", "text": "Third nerve palsy"},
    {"label": "C", "text": "Cluster headache"},
    {"label": "D", "text": "Bell''s palsy"},
    {"label": "E", "text": "Trigeminal neuralgia"}
  ]'::jsonb,
  'B',
  'Third nerve palsy presents with ptosis, dilated unreactive pupil, and eye deviation (down and out). Sudden onset in an elderly patient raises concern for posterior communicating artery aneurysm - this requires urgent neuroimaging (CT/MR angiography) and neurosurgical referral. Do not delay.',
  'Neurology',
  'high',
  ARRAY['NICE CKS: Stroke and TIA', 'Third nerve palsy: ptosis + dilated pupil', 'Consider posterior communicating artery aneurysm', 'Urgent neuroimaging required'],
  false
),

(
  'A 45-year-old man presents with a 6-week history of productive cough, night sweats, and weight loss. He is originally from a high TB prevalence country. CXR shows upper lobe consolidation. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Prescribe amoxicillin for community-acquired pneumonia"},
    {"label": "B", "text": "Refer for urgent chest X-ray"},
    {"label": "C", "text": "Refer to respiratory team for TB screening"},
    {"label": "D", "text": "Prescribe doxycycline"},
    {"label": "E", "text": "Reassure and review if persists"}
  ]'::jsonb,
  'C',
  'This presentation (productive cough + night sweats + weight loss + upper lobe changes) is highly suspicious for pulmonary tuberculosis, especially with risk factors (origin from high prevalence country). This requires urgent referral to respiratory team for sputum samples (3 early morning samples for AFB), TB culture, and contact tracing. Do not treat as simple pneumonia.',
  'Respiratory',
  'high',
  ARRAY['NICE CKS: Tuberculosis', 'Cough + night sweats + weight loss + upper lobe changes = TB', '3 sputum samples for AFB', 'Contact tracing required'],
  false
),

(
  'A 30-year-old woman presents with a 3-month history of fatigue, joint pains, and a photosensitive rash on her face. ANA is positive 1:640, anti-dsDNA is positive. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Rheumatoid arthritis"},
    {"label": "B", "text": "Systemic lupus erythematosus"},
    {"label": "C", "text": "Sjögren''s syndrome"},
    {"label": "D", "text": "Fibromyalgia"},
    {"label": "E", "text": "Chronic fatigue syndrome"}
  ]'::jsonb,
  'B',
  'This is classic systemic lupus erythematosus (SLE): fatigue, joint pains, photosensitive rash (malar/butterfly rash), positive ANA, and anti-dsDNA (highly specific for SLE). This requires referral to rheumatology for further assessment and management (hydroxychloroquine, steroids, immunosuppressants as needed).',
  'Rheumatology',
  'medium',
  ARRAY['NICE CKS: Systemic lupus erythematosus', 'Photosensitive rash + ANA + anti-dsDNA = SLE', 'Refer to rheumatology', 'Hydroxychloroquine first-line'],
  false
),

(
  'A 55-year-old man presents with a 2-month history of progressive shortness of breath and dry cough. He has a 20-pack-year smoking history. CXR shows bilateral lower zone reticular shadowing. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "COPD"},
    {"label": "B", "text": "Idiopathic pulmonary fibrosis"},
    {"label": "C", "text": "Heart failure"},
    {"label": "D", "text": "Pneumonia"},
    {"label": "E", "text": "Asthma"}
  ]'::jsonb,
  'B',
  'Progressive breathlessness + dry cough + bilateral lower zone reticular shadowing on CXR is classic for idiopathic pulmonary fibrosis (IPF), especially in a smoker. This requires referral to respiratory specialist for HRCT and further management (pirfenidone or nintedanib may slow progression). Heart failure would have different CXR changes and signs of fluid overload.',
  'Respiratory',
  'medium',
  ARRAY['NICE CKS: Idiopathic pulmonary fibrosis', 'Progressive breathlessness + dry cough + reticular shadowing', 'HRCT for diagnosis', 'Pirfenidone or nintedanib may slow progression'],
  false
),

(
  'A 40-year-old woman presents with a 4-week history of generalised itch without rash. She has noticed dark urine and pale stools. LFTs show: bilirubin 45μmol/L, ALT 120 U/L, ALP 280 U/L. What is the most appropriate next investigation?',
  '[
    {"label": "A", "text": "Ultrasound liver"},
    {"label": "B", "text": "CT abdomen"},
    {"label": "C", "text": "Liver biopsy"},
    {"label": "D", "text": "ERCP"},
    {"label": "E", "text": "Repeat LFTs in 2 weeks"}
  ]'::jsonb,
  'A',
  'This presentation (itch + dark urine + pale stools + raised bilirubin and ALP) suggests cholestasis/obstructive jaundice. The first investigation is ultrasound liver to look for biliary obstruction (gallstones, mass). If obstruction found, ERCP may be needed. CT is second-line if US inconclusive. Do not delay with repeat LFTs.',
  'Gastroenterology',
  'medium',
  ARRAY['NICE CKS: Jaundice', 'Itch + dark urine + pale stools = cholestasis', 'Ultrasound liver first investigation', 'Look for biliary obstruction'],
  false
),

(
  'A 25-year-old man presents with acute onset of severe testicular pain and swelling. On examination, the testis is tender, swollen, and lies horizontally. What is the most likely diagnosis and urgent action?',
  '[
    {"label": "A", "text": "Epididymitis - prescribe antibiotics"},
    {"label": "B", "text": "Testicular torsion - urgent surgical referral"},
    {"label": "C", "text": "Orchitis - prescribe antibiotics"},
    {"label": "D", "text": "Testicular cancer - refer to urology (2-week wait)"},
    {"label": "E", "text": "Varicocele - reassure"}
  ]'::jsonb,
  'B',
  'Acute severe testicular pain + horizontal lie is classic for testicular torsion. This is a surgical emergency requiring immediate referral (within 6 hours) for surgical exploration and detorsion to save the testis. Do not delay with antibiotics or imaging. Epididymitis is more gradual onset and testis lies normally.',
  'Urology',
  'high',
  ARRAY['NICE CKS: Testicular torsion', 'Acute pain + horizontal lie = torsion', 'Surgical emergency - within 6 hours', 'Do not delay with imaging'],
  false
),

(
  'A 60-year-old woman presents with a 2-month history of progressive memory problems and confusion. Her family report she has become withdrawn and has difficulty with daily tasks. MMSE score is 22/30. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Reassure, this is normal ageing"},
    {"label": "B", "text": "Prescribe donepezil immediately"},
    {"label": "C", "text": "Refer to memory clinic/old age psychiatry"},
    {"label": "D", "text": "Arrange CT head as outpatient"},
    {"label": "E", "text": "Prescribe vitamin B12 and folate"}
  ]'::jsonb,
  'C',
  'This presentation suggests dementia (progressive memory problems, functional decline, MMSE <24). The first step is referral to memory clinic or old age psychiatry for comprehensive assessment (including cognitive testing, bloods to exclude reversible causes, and neuroimaging). Donepezil may be started after diagnosis of Alzheimer''s, but assessment comes first.',
  'Mental Health',
  'medium',
  ARRAY['NICE CKS: Dementia', 'Progressive memory problems + functional decline', 'Refer to memory clinic', 'Comprehensive assessment before treatment'],
  false
),

(
  'A 50-year-old man presents with a 3-day history of severe right loin pain radiating to the groin, associated with nausea. Urine dipstick shows blood +++. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Urinary tract infection"},
    {"label": "B", "text": "Renal colic (ureteric stone)"},
    {"label": "C", "text": "Pyelonephritis"},
    {"label": "D", "text": "Renal cell carcinoma"},
    {"label": "E", "text": "Appendicitis"}
  ]'::jsonb,
  'B',
  'Severe loin-to-groin pain + haematuria is classic for renal colic due to ureteric stone. The pain is typically colicky and severe. Management includes analgesia (diclofenac/ibuprofen), hydration, and imaging (CT KUB) to confirm stone and assess size. Stones <5mm usually pass spontaneously. Larger stones may need intervention.',
  'Urology',
  'medium',
  ARRAY['NICE CKS: Renal colic', 'Loin-to-groin pain + haematuria = stone', 'Analgesia and hydration', 'CT KUB for diagnosis'],
  false
),

(
  'A 35-year-old woman presents with a 6-month history of fatigue, weight gain, and cold intolerance. She also reports heavy periods. TSH is 8.5mU/L, free T4 is 12pmol/L (normal 12-22). What is the diagnosis?',
  '[
    {"label": "A", "text": "Primary hypothyroidism"},
    {"label": "B", "text": "Subclinical hypothyroidism"},
    {"label": "C", "text": "Euthyroid"},
    {"label": "D", "text": "Hyperthyroidism"},
    {"label": "E", "text": "Secondary hypothyroidism"}
  ]'::jsonb,
  'B',
  'Subclinical hypothyroidism: raised TSH (8.5) but normal free T4 (12, at lower end of normal). Treatment is indicated if TSH >10 or if symptomatic (this patient has symptoms). If TSH 4-10 and asymptomatic, can monitor. Primary hypothyroidism would have low T4. This patient has symptoms so treatment with levothyroxine is appropriate.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Hypothyroidism', 'Raised TSH + normal T4 = subclinical', 'Treat if TSH >10 or symptomatic', 'Monitor if TSH 4-10 and asymptomatic'],
  false
),

(
  'A 70-year-old man with known heart failure (LVEF 35%) presents with increasing breathlessness and ankle swelling. He is on ramipril 5mg BD, bisoprolol 5mg OD, and furosemide 40mg OD. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Increase ramipril dose"},
    {"label": "B", "text": "Add spironolactone"},
    {"label": "C", "text": "Increase furosemide to 80mg BD"},
    {"label": "D", "text": "Add digoxin"},
    {"label": "E", "text": "Refer for cardiac resynchronisation therapy"}
  ]'::jsonb,
  'C',
  'This patient has decompensated heart failure (increased breathlessness, oedema). The immediate management is to increase diuretic (furosemide) to manage fluid overload. Spironolactone is indicated for severe heart failure (NYHA class III-IV) with LVEF <35% despite ACE inhibitor and beta-blocker, but first address the acute decompensation. Increasing ACE inhibitor or adding digoxin are not first-line for acute decompensation.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Heart failure - chronic', 'Decompensated HF: increase diuretic', 'Spironolactone for severe HF with LVEF <35%', 'Address fluid overload first'],
  false
),

(
  'A 45-year-old woman presents with a 2-week history of right-sided chest pain, worse on inspiration. She has no cough or fever. On examination, there is a pleural rub. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Pneumonia"},
    {"label": "B", "text": "Pulmonary embolism"},
    {"label": "C", "text": "Pleurisy'},
    {"label": "D", "text": "Costochondritis"},
    {"label": "E", "text": "Musculoskeletal pain"}
  ]'::jsonb,
  'C',
  'Pleuritic chest pain (worse on inspiration) + pleural rub is classic for pleurisy (pleuritis). This is often viral but can be due to pneumonia, PE, or autoimmune conditions. If no red flags, management is supportive (analgesia). If high risk for PE (Wells score), consider imaging. Costochondritis would be anterior chest wall tenderness, not pleural rub.',
  'Respiratory',
  'medium',
  ARRAY['NICE CKS: Chest pain', 'Pleuritic pain + pleural rub = pleurisy', 'Often viral, supportive management', 'Consider PE if high risk'],
  false
);
