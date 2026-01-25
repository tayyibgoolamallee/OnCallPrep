-- Migration: Comprehensive Improved Questions
-- High-quality questions with:
-- 1. Better complexity and sophistication
-- 2. Balanced answer distribution (A, B, C, D, E)
-- 3. Advanced distractors (correct med wrong dose, risk stratification, half-true)
-- 4. No duplicates

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro) VALUES

-- Answer A examples (balanced distribution)
(
  'A 60-year-old man with type 2 diabetes and hypertension has an eGFR of 28mL/min/1.73m² and urine ACR of 45mg/mmol. He is not on an ACE inhibitor. What is the SINGLE MOST IMPORTANT medication to start?',
  '[
    {"label": "A", "text": "Ramipril 2.5mg OD"},
    {"label": "B", "text": "Atorvastatin 20mg OD"},
    {"label": "C", "text": "Metformin 500mg BD"},
    {"label": "D", "text": "Bendroflumethiazide 2.5mg OD"},
    {"label": "E", "text": "Aspirin 75mg OD"}
  ]'::jsonb,
  'A',
  'For CKD Stage 4 (eGFR 15-29) with severe albuminuria (ACR >30), ACE inhibitor (or ARB) is the single most important medication to slow progression, regardless of blood pressure. Start low dose (ramipril 2.5mg) and titrate. Monitor eGFR and potassium. Statin, metformin, and aspirin are also important but ACE inhibitor has the most impact on CKD progression.',
  'Renal',
  'medium',
  ARRAY['NICE CKS: Chronic kidney disease', 'ACE inhibitor most important for CKD with proteinuria', 'Slows progression regardless of BP', 'Start low dose and monitor'],
  false
),

(
  'A 50-year-old woman presents with a 4-week history of generalised itch without rash. She has noticed dark urine and pale stools. LFTs show: bilirubin 48μmol/L, ALT 115 U/L, ALP 290 U/L. What is the SINGLE BEST initial investigation?',
  '[
    {"label": "A", "text": "Ultrasound liver"},
    {"label": "B", "text": "CT abdomen"},
    {"label": "C", "text": "Liver biopsy"},
    {"label": "D", "text": "ERCP"},
    {"label": "E", "text": "Repeat LFTs in 2 weeks"}
  ]'::jsonb,
  'A',
  'This presentation (itch + dark urine + pale stools + raised bilirubin and ALP) suggests cholestasis/obstructive jaundice. Ultrasound liver is the single best initial investigation to look for biliary obstruction (gallstones, mass, dilated ducts). If obstruction found, ERCP may be needed. CT is second-line if US inconclusive. Do not delay with repeat LFTs.',
  'Gastroenterology',
  'medium',
  ARRAY['NICE CKS: Jaundice', 'Ultrasound liver = single best initial investigation', 'Looks for biliary obstruction', 'ERCP if obstruction found'],
  false
),

-- Answer B examples
(
  'A 50-year-old woman with type 2 diabetes has an HbA1c of 70mmol/mol (8.6%) despite metformin 1g BD. She has a BMI of 28 and no cardiovascular disease. What is the most appropriate SECOND-LINE treatment?',
  '[
    {"label": "A", "text": "Add gliclazide 80mg BD"},
    {"label": "B", "text": "Add sitagliptin 100mg OD"},
    {"label": "C", "text": "Add sitagliptin 100mg BD"},
    {"label": "D", "text": "Start insulin glargine 10 units OD"},
    {"label": "E", "text": "Increase metformin to 2g BD"}
  ]'::jsonb,
  'B',
  'Second-line treatment for type 2 diabetes: DPP-4 inhibitor (sitagliptin 100mg OD - once daily, not BD), SGLT2 inhibitor, or GLP-1 agonist. Sitagliptin is weight neutral with low hypoglycaemia risk. Option C has wrong frequency (BD instead of OD). Gliclazide may cause weight gain and hypoglycaemia. Insulin is usually later in pathway. Metformin max dose is usually 1g BD.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Type 2 diabetes', 'Sitagliptin 100mg OD (once daily)', 'DPP-4 inhibitor second-line', 'Weight neutral, low hypoglycaemia risk'],
  false
),

(
  'A 55-year-old man with stable angina is on aspirin, atorvastatin 80mg, and bisoprolol 5mg OD. He still experiences chest pain on moderate exertion. GTN spray provides relief. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Increase bisoprolol to 10mg OD"},
    {"label": "B", "text": "Add a calcium channel blocker (amlodipine 5mg OD)"},
    {"label": "C", "text": "Refer for urgent coronary angiography"},
    {"label": "D", "text": "Add clopidogrel"},
    {"label": "E", "text": "Increase atorvastatin to 160mg"}
  ]'::jsonb,
  'B',
  'For stable angina with symptoms despite optimal medical therapy (aspirin, statin, beta-blocker), add a second anti-anginal. Calcium channel blocker (amlodipine) or long-acting nitrate are options. Increasing beta-blocker may help but adding second anti-anginal is standard. Urgent angiography is for unstable angina. Clopidogrel is for ACS. Statin dose is already optimal.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Stable angina', 'Add second anti-anginal if symptoms persist', 'Calcium channel blocker or long-acting nitrate', 'Consider revascularisation if medical therapy fails'],
  false
),

-- Answer C examples  
(
  'A 40-year-old woman with known asthma presents with increased use of her salbutamol inhaler (using it 4-5 times daily) and waking at night with wheeze. She takes beclomethasone 200mcg BD. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Add salmeterol (LABA)"},
    {"label": "B", "text": "Add montelukast"},
    {"label": "C", "text": "Increase beclomethasone to 400mcg BD"},
    {"label": "D", "text": "Start prednisolone 40mg daily"},
    {"label": "E", "text": "Refer to respiratory specialist"}
  ]'::jsonb,
  'C',
  'This indicates poor asthma control: SABA use >3 times/week and nocturnal symptoms. Step 3 of asthma management: increase ICS dose (beclomethasone 200mcg to 400mcg BD). If still uncontrolled after review, consider adding LABA. Montelukast is an alternative add-on. Oral steroids are for acute exacerbations, not maintenance.',
  'Respiratory',
  'medium',
  ARRAY['NICE CKS: Asthma', 'SABA >3 times/week = poor control', 'Step 3: increase ICS dose', 'Add LABA if still uncontrolled after ICS increase'],
  false
),

(
  'A 55-year-old woman presents with morning stiffness lasting 2 hours, symmetrical small joint pain in hands and wrists, and fatigue. ESR is 45mm/h. What is the most appropriate next investigation?',
  '[
    {"label": "A", "text": "X-ray of hands and wrists"},
    {"label": "B", "text": "Uric acid level"},
    {"label": "C", "text": "Rheumatoid factor and anti-CCP antibodies"},
    {"label": "D", "text": "ANA and ENA panel"},
    {"label": "E", "text": "HLA-B27 test"}
  ]'::jsonb,
  'C',
  'The presentation is classic for rheumatoid arthritis: morning stiffness >30 minutes, symmetrical small joint involvement, raised inflammatory markers. Rheumatoid factor and anti-CCP antibodies are the key diagnostic tests. Anti-CCP is more specific. X-rays may show erosions but are not the first investigation. ANA/ENA would be for SLE. HLA-B27 is for spondyloarthropathies.',
  'Musculoskeletal',
  'medium',
  ARRAY['NICE CKS: Rheumatoid arthritis', 'Anti-CCP more specific than RF', 'Morning stiffness >30 min characteristic', 'Symmetrical small joint involvement'],
  false
),

-- Answer D examples
(
  'A 30-year-old woman presents requesting emergency contraception. She had unprotected intercourse 50 hours ago. She has no contraindications. What is the most appropriate option?',
  '[
    {"label": "A", "text": "Levonorgestrel 1.5mg single dose"},
    {"label": "B", "text": "Copper IUD insertion"},
    {"label": "C", "text": "Combined oral contraceptive (Yuzpe method)"},
    {"label": "D", "text": "Ulipristal 30mg single dose"},
    {"label": "E", "text": "No effective option available after 48 hours"}
  ]'::jsonb,
  'D',
  'Ulipristal (ellaOne) is effective up to 120 hours (5 days) after unprotected intercourse and is more effective than levonorgestrel. Levonorgestrel is only effective up to 72 hours. Copper IUD is also effective up to 5 days and is the most effective option, but requires insertion. Ulipristal is the best oral option at 50 hours.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Contraception - emergency', 'Ulipristal up to 120 hours', 'More effective than levonorgestrel', 'Copper IUD most effective but requires insertion'],
  false
),

(
  'A 70-year-old man presents with a non-healing ulcer on his foot. On examination, there are absent foot pulses and the foot is cold. What is the most important investigation?',
  '[
    {"label": "A", "text": "X-ray foot"},
    {"label": "B", "text": "Blood glucose"},
    {"label": "C", "text": "Wound swab"},
    {"label": "D", "text": "Doppler ultrasound/ABPI"},
    {"label": "E", "text": "Full blood count"}
  ]'::jsonb,
  'D',
  'Non-healing foot ulcer + absent pulses + cold foot suggests peripheral arterial disease (PAD). ABPI (ankle-brachial pressure index) or Doppler ultrasound is essential to assess vascular supply. ABPI <0.9 indicates PAD. Critical ischaemia (ABPI <0.5) requires urgent vascular referral. X-ray for osteomyelitis, but vascular assessment is priority.',
  'Surgery',
  'high',
  ARRAY['NICE CKS: Peripheral arterial disease', 'Non-healing ulcer + absent pulses = PAD', 'ABPI essential investigation', 'Critical ischaemia (ABPI <0.5) = urgent referral'],
  false
),

-- Answer E examples
(
  'A 25-year-old man presents with acute severe testicular pain. On examination, the testis is tender, swollen, and lies horizontally. What is the most likely diagnosis and urgent action?',
  '[
    {"label": "A", "text": "Epididymitis - prescribe antibiotics"},
    {"label": "B", "text": "Orchitis - prescribe antibiotics"},
    {"label": "C", "text": "Testicular cancer - refer to urology"},
    {"label": "D", "text": "Varicocele - reassure"},
    {"label": "E", "text": "Testicular torsion - urgent surgical referral"}
  ]'::jsonb,
  'E',
  'Acute severe testicular pain + horizontal lie is classic for testicular torsion. This is a surgical emergency requiring immediate referral (within 6 hours) for surgical exploration and detorsion to save the testis. Do not delay with antibiotics or imaging. Epididymitis is more gradual onset and testis lies normally.',
  'Men''s Health',
  'high',
  ARRAY['NICE CKS: Testicular torsion', 'Acute pain + horizontal lie = torsion', 'Surgical emergency - within 6 hours', 'Do not delay with imaging'],
  false
),

(
  'A 60-year-old woman with type 2 diabetes and hypertension has an eGFR of 32mL/min/1.73m² and urine ACR of 28mg/mmol. What stage of CKD is this?',
  '[
    {"label": "A", "text": "CKD Stage 2"},
    {"label": "B", "text": "CKD Stage 3a"},
    {"label": "C", "text": "CKD Stage 4"},
    {"label": "D", "text": "CKD Stage 5"},
    {"label": "E", "text": "CKD Stage 3b"}
  ]'::jsonb,
  'E',
  'CKD staging: Stage 1 (eGFR ≥90), Stage 2 (60-89), Stage 3a (45-59), Stage 3b (30-44), Stage 4 (15-29), Stage 5 (<15 or dialysis). eGFR 32 = Stage 3b. ACR 28mg/mmol indicates A2 (moderately increased albuminuria). This requires ACE inhibitor/ARB, close monitoring, and preparation for potential progression.',
  'Renal',
  'medium',
  ARRAY['NICE CKS: Chronic kidney disease', 'Stage 3b: eGFR 30-44', 'ACR >30 = A3 (severe albuminuria)', 'ACE inhibitor/ARB indicated'],
  false
);

-- This migration adds 8 more improved questions with balanced answer distribution
-- Total improved questions across migrations 022-025: 26 questions
-- These demonstrate the improved format and can serve as templates for updating existing questions
