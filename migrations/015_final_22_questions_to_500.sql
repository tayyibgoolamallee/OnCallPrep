-- Migration: Final 22 Questions to Reach 500 Total
-- Based on NICE CKS topics
-- This adds 22 more clinical medicine questions to reach exactly 500 total

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro) VALUES

-- Infectious Diseases
(
  'A 35-year-old woman presents with a 3-day history of dysuria and frequency. Dipstick shows nitrites negative, leukocytes positive. She has no fever or loin pain. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Prescribe trimethoprim immediately"},
    {"label": "B", "text": "Send MSU for culture and await results"},
    {"label": "C", "text": "Advise increased fluids and review if persists"},
    {"label": "D", "text": "Prescribe nitrofurantoin immediately"},
    {"label": "E", "text": "Refer to urology"}
  ]'::jsonb,
  'C',
  'Nitrites negative but leukocytes positive suggests possible UTI but could be other causes (STI, interstitial cystitis). If no red flags (fever, loin pain, pregnancy), can advise increased fluids and review. If symptoms persist or worsen, send MSU and consider antibiotics. If nitrites positive, treat immediately.',
  'Infectious Diseases',
  'medium',
  ARRAY['NICE CKS: Urinary tract infection (lower) - women', 'Nitrites negative + leukocytes positive = possible UTI', 'If no red flags, can observe initially', 'Send MSU if symptoms persist'],
  false
),

-- Cardiovascular
(
  'A 65-year-old man with atrial fibrillation (CHA2DS2-VASc score 3) is currently on warfarin. He asks about switching to a DOAC. What is the most appropriate advice?',
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

-- Respiratory
(
  'A 60-year-old smoker with COPD presents with increased breathlessness. Spirometry shows FEV1 40% predicted. He is on salbutamol PRN only. What is the most appropriate next step?',
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

-- Gastroenterology
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
  'This is classic irritable bowel syndrome (IBS): abdominal pain associated with change in bowel habit, bloating. Rome IV criteria: recurrent abdominal pain ≥1 day/week for 3 months, associated with ≥2 of: related to defaecation, change in frequency, change in form. No red flags here (no weight loss, bleeding, family history).',
  'Gastroenterology',
  'medium',
  ARRAY['NICE CKS: Irritable bowel syndrome', 'Rome IV criteria for IBS', 'Pain + change in bowel habit + bloating', 'No red flags in this case'],
  false
),

-- Endocrinology
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

-- Dermatology
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

-- Neurology
(
  'A 45-year-old woman presents with recurrent headaches associated with photophobia, phonophobia, and nausea. The headaches last 5-6 hours and are unilateral. She has no aura. What is the most likely diagnosis?',
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
  'A 30-year-old woman presents requesting emergency contraception. She had unprotected intercourse 70 hours ago. She has no contraindications. What is the most appropriate option?',
  '[
    {"label": "A", "text": "Levonorgestrel 1.5mg single dose"},
    {"label": "B", "text": "Ulipristal 30mg single dose"},
    {"label": "C", "text": "Copper IUD insertion"},
    {"label": "D", "text": "Combined oral contraceptive (Yuzpe method)"},
    {"label": "E", "text": "No effective option available after 72 hours"}
  ]'::jsonb,
  'B',
  'Ulipristal (ellaOne) is effective up to 120 hours (5 days) after unprotected intercourse and is more effective than levonorgestrel. Levonorgestrel is only effective up to 72 hours. Copper IUD is also effective up to 5 days and is the most effective option, but requires insertion. Ulipristal is the best oral option at 70 hours.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Contraception - emergency', 'Ulipristal up to 120 hours', 'More effective than levonorgestrel', 'Copper IUD most effective but requires insertion'],
  false
),

-- Paediatrics
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

-- Mental Health
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
  'PHQ-9 score 15-19 indicates moderately severe depression. NICE guidelines recommend offering either an SSRI (sertraline first-line) or psychological therapy (CBT). Patient choice is important. For moderate-severe depression, watchful waiting is not appropriate. Referral to specialist services is for treatment-resistant or severe cases.',
  'Mental Health',
  'medium',
  ARRAY['NICE CKS: Depression', 'PHQ-9 15-19 = moderately severe', 'Offer SSRI or psychological therapy', 'Sertraline first-line SSRI'],
  false
),

-- Urology
(
  'A 68-year-old man presents with lower urinary tract symptoms: poor stream, hesitancy, and nocturia. Digital rectal examination reveals an enlarged, smooth prostate. PSA is 3.9ng/mL. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Refer to urology for suspected prostate cancer"},
    {"label": "B", "text": "Start tamsulosin (alpha-blocker)"},
    {"label": "C", "text": "Start finasteride (5-alpha reductase inhibitor)"},
    {"label": "D", "text": "Start combination therapy"},
    {"label": "E", "text": "Advise lifestyle measures only"}
  ]'::jsonb,
  'B',
  'This is benign prostatic hyperplasia (BPH): LUTS with enlarged smooth prostate. PSA 3.9 is normal for age. First-line treatment is alpha-blocker (tamsulosin) for symptom relief. Finasteride is for large prostates (>30g) or if PSA >1.5. Combination is for severe symptoms. Lifestyle measures can help but medical treatment is usually needed.',
  'Urology',
  'medium',
  ARRAY['NICE CKS: LUTS in men', 'Alpha-blocker first-line for BPH', 'Finasteride for large prostate or PSA >1.5', 'Combination for severe symptoms'],
  false
),

-- Renal
(
  'A 62-year-old woman with type 2 diabetes and hypertension has an eGFR of 32mL/min/1.73m² and urine ACR of 28mg/mmol. What stage of CKD is this?',
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

-- Haematology
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
  'This is iron deficiency anaemia (microcytic, low ferritin). In an elderly man, the most important step is to investigate for the cause - commonly GI blood loss (upper or lower GI cancer, peptic ulcer, angiodysplasia). Prescribe iron supplements but also arrange upper and lower GI investigations (endoscopy, colonoscopy).',
  'Haematology',
  'high',
  ARRAY['NICE CKS: Anaemia - iron deficiency', 'Microcytic + low ferritin = iron deficiency', 'In elderly men, investigate for GI blood loss', 'Upper and lower GI investigations'],
  false
),

-- Prescribing/Safety
(
  'A 58-year-old woman on ramipril 5mg BD for heart failure presents with a persistent dry cough. What is the most appropriate action?',
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

-- Additional Clinical Scenarios
(
  'A 52-year-old woman presents with hot flushes, night sweats, and mood changes for 5 months. Her last period was 11 months ago. She has no contraindications to HRT. What is the most appropriate treatment?',
  '[
    {"label": "A", "text": "SSRI (fluoxetine)"},
    {"label": "B", "text": "Hormone replacement therapy (HRT)"},
    {"label": "C", "text": "Clonidine"},
    {"label": "D", "text": "Black cohosh"},
    {"label": "E", "text": "Lifestyle measures only"}
  ]'::jsonb,
  'B',
  'This is perimenopause/menopause (amenorrhoea approaching 12 months) with vasomotor symptoms. HRT is first-line treatment for menopausal symptoms if no contraindications. Consider risks vs benefits (breast cancer, VTE, stroke). SSRI is second-line if HRT contraindicated. Lifestyle measures can help but are not first-line for moderate-severe symptoms.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Menopause', 'HRT first-line for vasomotor symptoms', 'Consider risks vs benefits', 'SSRI second-line if HRT contraindicated'],
  false
),

(
  'A 48-year-old man presents with a 2-month history of progressive dysphagia, initially for solids, now for liquids. He has lost 8kg unintentionally. What is the most appropriate next step?',
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
  'A 38-year-old woman presents with a 6-month history of fatigue, joint pains, and a photosensitive rash. ANA is positive 1:640, anti-dsDNA is positive. What is the most likely diagnosis?',
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
  'A 32-year-old man presents with a 3-day history of severe right loin pain radiating to the groin, associated with nausea. Urine dipstick shows blood +++. What is the most likely diagnosis?',
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
  'A 58-year-old woman presents with a 3-month history of fatigue, weight gain, and cold intolerance. She also reports heavy periods. TSH is 14mU/L, free T4 is 10pmol/L (normal 12-22). What is the diagnosis?',
  '[
    {"label": "A", "text": "Primary hypothyroidism"},
    {"label": "B", "text": "Subclinical hypothyroidism"},
    {"label": "C", "text": "Euthyroid"},
    {"label": "D", "text": "Hyperthyroidism"},
    {"label": "E", "text": "Secondary hypothyroidism"}
  ]'::jsonb,
  'A',
  'Primary hypothyroidism: raised TSH (14) and low free T4 (10, below normal range). Treatment is levothyroxine. For patients under 50 without cardiac disease, start at 50-100mcg daily. For those over 50 or with cardiac disease, start at 25mcg. TSH should be rechecked 6-8 weeks after starting.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Hypothyroidism', 'Raised TSH + low T4 = primary hypothyroidism', 'Start 50-100mcg if <50 and no cardiac disease', 'Review TSH 6-8 weeks after starting'],
  false
),

(
  'A 28-year-old woman with type 1 diabetes presents with 2-day history of polyuria, polydipsia, nausea, and abdominal pain. Blood glucose is 26mmol/L, ketones are 5.2mmol/L. What is the most appropriate action?',
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
  'A 22-year-old man presents with acute severe testicular pain. On examination, the testis is tender, swollen, and lies horizontally. What is the most likely diagnosis and urgent action?',
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
),

(
  'A 52-year-old woman presents with a 2-month history of progressive memory problems and confusion. Her family report personality changes. MMSE score is 20/30. What is the most appropriate next step?',
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
  'A 38-year-old woman presents with a 4-week history of generalised itch without rash. She has noticed dark urine and pale stools. LFTs show: bilirubin 48μmol/L, ALT 115 U/L, ALP 290 U/L. What is the most appropriate next investigation?',
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
);
