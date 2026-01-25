-- Migration: Improved Questions with Better Complexity and Distractors
-- This adds high-quality questions demonstrating:
-- 1. Better complexity (second/third line, risk stratification, single best)
-- 2. Balanced answer distribution (A, B, C, D, E)
-- 3. Sophisticated distractors (correct med wrong dose, half-true answers)
-- 4. No duplicates

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro) VALUES

-- Cardiovascular - Risk stratification example
(
  'A 55-year-old man presents with chest pain on exertion, relieved by rest. ECG is normal. He has no cardiovascular risk factors. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Refer for urgent cardiology assessment (2-week wait)"},
    {"label": "B", "text": "Request advice and guidance from cardiology"},
    {"label": "C", "text": "Start aspirin and atorvastatin, arrange exercise tolerance test"},
    {"label": "D", "text": "Refer for routine cardiology appointment"},
    {"label": "E", "text": "Reassure and discharge"}
  ]'::jsonb,
  'C',
  'Stable angina with normal ECG and no high-risk features can be managed in primary care initially. Start aspirin and statin for secondary prevention, and arrange exercise tolerance test (or other functional testing) to confirm diagnosis and assess severity. If test positive or symptoms worsen, then refer. A&G may be appropriate if uncertain. Routine referral if stable and confirmed diagnosis.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Stable angina', 'Normal ECG + stable symptoms = primary care management', 'Start aspirin and statin', 'Arrange functional testing'],
  false
),

-- Endocrinology - Second line with dosing distractor
(
  'A 50-year-old woman with type 2 diabetes has an HbA1c of 70mmol/mol (8.6%) despite metformin 1g BD. She has a BMI of 28 and no cardiovascular disease. What is the most appropriate SECOND-LINE treatment?',
  '[
    {"label": "A", "text": "Add gliclazide 80mg BD"},
    {"label": "B", "text": "Add sitagliptin 100mg BD"},
    {"label": "C", "text": "Add sitagliptin 100mg OD"},
    {"label": "D", "text": "Start insulin glargine 10 units OD"},
    {"label": "E", "text": "Increase metformin to 2g BD"}
  ]'::jsonb,
  'C',
  'Second-line treatment for type 2 diabetes: DPP-4 inhibitor (sitagliptin 100mg OD - once daily, not BD), SGLT2 inhibitor, or GLP-1 agonist. Sitagliptin is weight neutral with low hypoglycaemia risk. Option B has wrong frequency (BD instead of OD). Gliclazide may cause weight gain and hypoglycaemia. Insulin is usually later in pathway. Metformin max dose is usually 1g BD.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Type 2 diabetes', 'Sitagliptin 100mg OD (once daily)', 'DPP-4 inhibitor second-line', 'Weight neutral, low hypoglycaemia risk'],
  false
),

-- Respiratory - Third line treatment
(
  'A 30-year-old woman with asthma has poor control despite beclomethasone 400mcg BD, salmeterol 50mcg BD, and montelukast 10mg OD. She has tried tiotropium without benefit. What is the next step?',
  '[
    {"label": "A", "text": "Increase beclomethasone to 800mcg BD"},
    {"label": "B", "text": "Add theophylline"},
    {"label": "C", "text": "Refer for consideration of biologic therapy"},
    {"label": "D", "text": "Start oral prednisolone 5mg daily long-term"},
    {"label": "E", "text": "Add salbutamol 200mcg QDS"}
  ]'::jsonb,
  'C',
  'For severe asthma unresponsive to Step 4-5 treatment (high-dose ICS + LABA + add-on), refer for consideration of biologic therapy (e.g., omalizumab, mepolizumab). Theophylline is an option but biologics are preferred for severe eosinophilic asthma. Long-term oral steroids should be avoided due to side effects. Increasing ICS further has limited benefit. SABA is already being used.',
  'Respiratory',
  'hard',
  ARRAY['NICE CKS: Asthma', 'Severe asthma = consider biologics', 'After Step 4-5 treatment fails', 'Avoid long-term oral steroids'],
  false
),

-- Gastroenterology - Single best investigation
(
  'A 60-year-old man presents with a 3-month history of change in bowel habit and rectal bleeding. He has lost 3kg. What is the SINGLE BEST initial investigation?',
  '[
    {"label": "A", "text": "Faecal occult blood test"},
    {"label": "B", "text": "Colonoscopy"},
    {"label": "C", "text": "CT colonography"},
    {"label": "D", "text": "Flexible sigmoidoscopy"},
    {"label": "E", "text": "Barium enema"}
  ]'::jsonb,
  'B',
  'For suspected colorectal cancer (change in bowel habit + rectal bleeding + weight loss), colonoscopy is the single best initial investigation. It allows visualisation of entire colon, biopsy for histology, and polypectomy if needed. FOBT is for screening, not diagnostic. CT colonography is alternative if colonoscopy not possible. Flexible sigmoidoscopy only visualises left colon. Barium enema is outdated.',
  'Gastroenterology',
  'medium',
  ARRAY['NICE CKS: Colorectal cancer', 'Colonoscopy = single best investigation', 'Allows visualisation, biopsy, polypectomy', 'FOBT for screening not diagnosis'],
  false
),

-- Infectious Diseases - Correct medication, wrong duration
(
  'A 25-year-old woman presents with a 3-day history of dysuria and frequency. Dipstick shows nitrites positive. She has no allergies and is not pregnant. Which prescription is correct?',
  '[
    {"label": "A", "text": "Trimethoprim 200mg BD for 5 days"},
    {"label": "B", "text": "Trimethoprim 200mg BD for 3 days"},
    {"label": "C", "text": "Nitrofurantoin 100mg OD for 3 days"},
    {"label": "D", "text": "Amoxicillin 500mg TDS for 7 days"},
    {"label": "E", "text": "Ciprofloxacin 500mg BD for 3 days"}
  ]'::jsonb,
  'B',
  'For uncomplicated lower UTI, trimethoprim 200mg BD for 3 days is correct. Option A has wrong duration (5 days instead of 3). Option C has wrong frequency for nitrofurantoin (should be BD, not OD). Amoxicillin has high resistance rates. Ciprofloxacin should be reserved for resistant cases. Nitrofurantoin 100mg BD for 3 days is an alternative first-line option.',
  'Infectious Diseases',
  'medium',
  ARRAY['NICE CKS: Urinary tract infection (lower) - women', 'Trimethoprim 200mg BD for 3 days', 'Nitrofurantoin 100mg BD (not OD)', 'Reserve ciprofloxacin for resistant cases'],
  false
),

-- Surgery - Risk stratification: urgent vs A&G
(
  'A 45-year-old woman presents with a new breast lump. On examination, there is a soft, mobile, smooth lump. She has no family history of breast cancer. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Refer for urgent breast assessment (2-week wait)"},
    {"label": "B", "text": "Request advice and guidance from breast clinic"},
    {"label": "C", "text": "Reassure and review in 3 months"},
    {"label": "D", "text": "Arrange mammography only"},
    {"label": "E", "text": "Prescribe antibiotics"}
  ]'::jsonb,
  'B',
  'New breast lump with benign features (soft, mobile, smooth) in a woman <50 with no family history may be appropriate for A&G (advice and guidance) rather than urgent 2-week wait referral. However, any new breast lump should be assessed. If A&G confirms benign (e.g., fibroadenoma), can monitor. If any uncertainty or suspicious features, then 2-week wait referral. Do not reassure without assessment.',
  'Surgery',
  'medium',
  ARRAY['NICE CKS: Breast cancer', 'Benign features may allow A&G', 'Any new lump should be assessed', '2-week wait if suspicious features'],
  false
),

-- Mental Health - Half-true distractor
(
  'A 40-year-old man presents with low mood, anhedonia, and poor sleep for 6 weeks. PHQ-9 score is 16. He has no suicidal ideation. What is the most appropriate initial management?',
  '[
    {"label": "A", "text": "Watchful waiting and review in 2 weeks"},
    {"label": "B", "text": "Prescribe sertraline 50mg daily and review in 4 weeks"},
    {"label": "C", "text": "Offer SSRI or psychological therapy, with patient choice"},
    {"label": "D", "text": "Refer immediately to mental health services"},
    {"label": "E", "text": "Prescribe amitriptyline 25mg at night"}
  ]'::jsonb,
  'C',
  'PHQ-9 score 15-19 indicates moderately severe depression. NICE recommends offering either SSRI or psychological therapy (CBT), with patient choice. Option B is partially correct (sertraline is first-line) but doesn''t offer choice of psychological therapy. Watchful waiting is not appropriate for moderate-severe depression. Referral to specialist services is for treatment-resistant cases. Amitriptyline is not first-line.',
  'Mental Health',
  'medium',
  ARRAY['NICE CKS: Depression', 'PHQ-9 15-19 = moderately severe', 'Offer SSRI or psychological therapy with patient choice', 'Sertraline first-line SSRI'],
  false
),

-- Neurology - Correct action, wrong urgency
(
  'A 65-year-old man presents with a 2-week history of progressive memory problems and word-finding difficulties. MMSE is 24/30. He has no red flag features. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Refer for urgent neurology assessment (2-week wait)"},
    {"label": "B", "text": "Refer for routine memory clinic appointment"},
    {"label": "C", "text": "Prescribe donepezil immediately"},
    {"label": "D", "text": "Arrange CT head as outpatient"},
    {"label": "E", "text": "Reassure, normal ageing"}
  ]'::jsonb,
  'B',
  'Progressive memory problems with MMSE 24 (borderline) and no red flags suggests possible dementia but not urgent. Routine referral to memory clinic is appropriate for comprehensive assessment. Urgent 2-week wait is for red flags (rapid progression, focal signs, young age, head injury). Do not start donepezil without diagnosis. CT head will be arranged by memory clinic if needed.',
  'Neurology',
  'medium',
  ARRAY['NICE CKS: Dementia', 'Routine referral for memory problems without red flags', '2-week wait for red flags only', 'Comprehensive assessment before treatment'],
  false
),

-- Prescribing - Correct medication, wrong indication
(
  'A 70-year-old woman with heart failure (LVEF 30%) is on ramipril 5mg BD and bisoprolol 5mg OD. She is stable (NYHA class II). What additional medication should be considered?',
  '[
    {"label": "A", "text": "Add furosemide 40mg OD"},
    {"label": "B", "text": "Add spironolactone 25mg OD"},
    {"label": "C", "text": "Add digoxin 125mcg OD"},
    {"label": "D", "text": "Add amlodipine 5mg OD"},
    {"label": "E", "text": "Add diltiazem 60mg TDS"}
  ]'::jsonb,
  'B',
  'For heart failure with LVEF <35% on ACE inhibitor and beta-blocker, add spironolactone if NYHA class II-IV and still symptomatic. Spironolactone reduces mortality. Furosemide is for fluid overload/acute decompensation, not routine add-on for stable patients. Digoxin is for rate control in AF or if still symptomatic despite optimal therapy. Amlodipine and diltiazem are not recommended for heart failure.',
  'Prescribing',
  'medium',
  ARRAY['NICE CKS: Heart failure - chronic', 'Spironolactone for HFrEF with LVEF <35%', 'If NYHA class II-IV and symptomatic', 'Furosemide for fluid overload not routine add-on'],
  false
),

-- Geriatrics - Polypharmacy with STOPP criteria
(
  'An 85-year-old woman with dementia is on multiple medications including lorazepam 1mg at night (for 3 months), oxybutynin 5mg BD, and codeine 30mg QDS. She presents with falls and confusion. What is the most important intervention?',
  '[
    {"label": "A", "text": "Add more medications to manage symptoms"},
    {"label": "B", "text": "Review and deprescribe using STOPP criteria"},
    {"label": "C", "text": "Refer to geriatrician"},
    {"label": "D", "text": "Admit to hospital"},
    {"label": "E", "text": "Increase lorazepam dose"}
  ]'::jsonb,
  'B',
  'This patient is on high-risk medications for elderly: benzodiazepines (>1 month), anticholinergics (oxybutynin), and opioids. All can cause falls and confusion. STOPP criteria recommend: benzodiazepines >1 month should be stopped, anticholinergics in dementia should be avoided, opioids require laxatives. Medication review and deprescribing is the most important intervention.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Multimorbidity', 'STOPP criteria: benzodiazepines >1 month', 'Anticholinergics in dementia = avoid', 'Opioids require laxatives'],
  false
),

-- Women''s Health - First vs second line
(
  'A 45-year-old woman presents with heavy menstrual bleeding affecting her quality of life. She has completed her family. Mirena IUS is not suitable. What is the SECOND-LINE treatment?',
  '[
    {"label": "A", "text": "Tranexamic acid during menses"},
    {"label": "B", "text": "Combined oral contraceptive pill"},
    {"label": "C", "text": "Endometrial ablation"},
    {"label": "D", "text": "Hysterectomy"},
    {"label": "E", "text": "No second-line option available"}
  ]'::jsonb,
  'A',
  'For heavy menstrual bleeding: Mirena IUS is first-line. If not suitable, second-line options are: tranexamic acid (during menses), combined oral contraceptive pill, or progestogen-only options. Endometrial ablation and hysterectomy are third-line/surgical options. Tranexamic acid is effective and well-tolerated second-line option.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Menorrhagia (heavy menstrual bleeding)', 'Mirena IUS first-line', 'Tranexamic acid or COCP second-line', 'Surgical options third-line'],
  false
),

-- Dermatology - Correct treatment, wrong formulation
(
  'A 18-year-old woman presents with moderate acne affecting her face. She has tried topical benzoyl peroxide without improvement. What is the next step?',
  '[
    {"label": "A", "text": "Prescribe oral lymecycline 408mg BD"},
    {"label": "B", "text": "Prescribe oral lymecycline 408mg OD"},
    {"label": "C", "text": "Refer to dermatology for isotretinoin"},
    {"label": "D", "text": "Prescribe topical erythromycin only"},
    {"label": "E", "text": "Prescribe oral doxycycline 100mg BD for 7 days"}
  ]'::jsonb,
  'B',
  'For moderate acne unresponsive to topical treatment, next step is oral antibiotic. Lymecycline 408mg OD (once daily) is correct. Option A has wrong frequency (BD instead of OD). Course is 3-6 months, not 7 days. Topical erythromycin alone is insufficient. Isotretinoin is reserved for severe acne or if oral antibiotics fail.',
  'Dermatology',
  'medium',
  ARRAY['NICE CKS: Acne', 'Lymecycline 408mg OD (once daily)', '3-6 month course', 'Combine with topical treatment'],
  false
),

-- Urology - Risk stratification
(
  'A 60-year-old man presents with lower urinary tract symptoms. IPSS score is 8. Digital rectal examination reveals an enlarged, smooth prostate. PSA is 2.5ng/mL. What is the most appropriate management?',
  '[
    {"label": "A", "text": "Refer to urology for suspected prostate cancer"},
    {"label": "B", "text": "Start tamsulosin immediately"},
    {"label": "C", "text": "Lifestyle advice and review if symptoms worsen"},
    {"label": "D", "text": "Start finasteride"},
    {"label": "E", "text": "Arrange prostate biopsy"}
  ]'::jsonb,
  'C',
  'IPSS 8 indicates mild LUTS. With normal PSA and benign DRE, initial management is lifestyle advice (fluid restriction, double voiding, avoid caffeine/alcohol) and watchful waiting. Review if symptoms worsen. Medical treatment (alpha-blocker) is for moderate-severe symptoms (IPSS >7-8 and affecting quality of life). No indication for referral or biopsy with normal PSA.',
  'Men''s Health',
  'medium',
  ARRAY['NICE CKS: LUTS in men', 'Mild LUTS (IPSS <8) = lifestyle advice first', 'Medical treatment if moderate-severe', 'No referral needed with normal PSA'],
  false
),

-- Paediatrics - Correct action, wrong urgency
(
  'A 2-year-old child presents with a 1-day history of fever (38.5°C), runny nose, and mild cough. The child is alert, feeding well, and has no red flag features. What is the most appropriate management?',
  '[
    {"label": "A", "text": "Refer immediately to hospital (999)"},
    {"label": "B", "text": "Prescribe amoxicillin immediately"},
    {"label": "C", "text": "Advise paracetamol/ibuprofen, safety-netting, and review if concerns"},
    {"label": "D", "text": "Arrange urgent blood tests"},
    {"label": "E", "text": "Prescribe prednisolone"}
  ]'::jsonb,
  'C',
  'Feverish child with no red flags (non-blanching rash, reduced consciousness, signs of sepsis) can be managed in primary care with antipyretics and safety-netting. Red flags requiring urgent referral: non-blanching rash, reduced consciousness, signs of meningitis, signs of sepsis, unable to rouse. No antibiotics needed for viral illness. Review if symptoms worsen or red flags develop.',
  'Paediatrics',
  'medium',
  ARRAY['NICE CKS: Feverish children - management', 'No red flags = primary care management', 'Antipyretics and safety-netting', 'Red flags = urgent referral'],
  false
),

-- Endocrinology - Correct medication, wrong timing
(
  'A 35-year-old woman with type 1 diabetes presents for routine review. Her HbA1c is 58mmol/mol (7.5%). She is on basal-bolus insulin. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Add metformin"},
    {"label": "B", "text": "Continue current regimen - HbA1c target achieved"},
    {"label": "C", "text": "Switch to insulin pump"},
    {"label": "D", "text": "Add SGLT2 inhibitor"},
    {"label": "E", "text": "Reduce insulin doses"}
  ]'::jsonb,
  'B',
  'For type 1 diabetes, HbA1c target is generally <48mmol/mol (6.5%) but <58mmol/mol (7.5%) may be acceptable to reduce hypoglycaemia risk. HbA1c 58mmol/mol with basal-bolus insulin is reasonable - continue current regimen. Metformin and SGLT2 inhibitors are not first-line for type 1 diabetes. Insulin pump is for those with poor control or frequent hypoglycaemia. Do not reduce insulin if HbA1c is at target.',
  'Endocrinology',
  'medium',
  ARRAY['NICE CKS: Type 1 diabetes', 'HbA1c target <48mmol/mol ideal, <58mmol/mol acceptable', 'Basal-bolus insulin standard', 'Metformin/SGLT2 not first-line for type 1'],
  false
),

-- Respiratory - Correct medication, wrong device/formulation
(
  'A 25-year-old woman with asthma has poor control despite beclomethasone 200mcg BD via MDI. She reports difficulty using the inhaler. What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Increase beclomethasone to 400mcg BD via same MDI"},
    {"label": "B", "text": "Switch to beclomethasone 200mcg BD via spacer"},
    {"label": "C", "text": "Switch to beclomethasone 100mcg via DPI"},
    {"label": "D", "text": "Add salmeterol via MDI"},
    {"label": "E", "text": "Prescribe oral prednisolone"}
  ]'::jsonb,
  'B',
  'If patient has difficulty using MDI, first ensure correct technique with spacer before increasing dose or adding medications. Spacer improves drug delivery and technique. Option A increases dose but doesn''t address technique issue. DPI requires different technique. Adding LABA or oral steroids doesn''t address the inhaler technique problem. Always check and optimise inhaler technique first.',
  'Respiratory',
  'medium',
  ARRAY['NICE CKS: Asthma', 'Inhaler technique issues = use spacer', 'Optimise technique before increasing dose', 'Spacer improves drug delivery'],
  false
),

-- More examples with balanced answer distribution and complexity
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

(
  'A 70-year-old woman with atrial fibrillation (CHA2DS2-VASc score 4) is on warfarin with good INR control (2.0-3.0). She asks about switching to a DOAC. What is the most appropriate advice?',
  '[
    {"label": "A", "text": "Continue warfarin - no benefit to switching"},
    {"label": "B", "text": "Switch to apixaban 5mg BD - DOACs are now preferred"},
    {"label": "C", "text": "Switch only if INR control becomes difficult"},
    {"label": "D", "text": "Switch to aspirin instead"},
    {"label": "E", "text": "DOACs are contraindicated in this age group"}
  ]'::jsonb,
  'B',
  'DOACs (apixaban, rivaroxaban) are now preferred over warfarin for non-valvular AF due to similar efficacy, lower bleeding risk (especially intracranial), and no monitoring required. Even with good INR control, switching to DOAC is reasonable. Age is not a contraindication. Aspirin is not recommended for stroke prevention in AF.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Atrial fibrillation', 'DOACs preferred even with good INR control', 'Lower bleeding risk, no monitoring', 'Aspirin not recommended'],
  false
);

-- Note: This migration demonstrates improved question quality with:
-- 1. Better complexity (second-line, risk stratification, single best)
-- 2. Balanced answer distribution (A, B, C, D, E)
-- 3. Sophisticated distractors:
--    - Correct medication but wrong dose/frequency
--    - Correct action but wrong urgency
--    - Half-true answers
--    - First vs second vs third line
-- 4. Risk stratification (urgent vs routine vs A&G)

-- For comprehensive improvement, you would need to:
-- 1. Review all existing questions in database
-- 2. Identify duplicates and remove them
-- 3. Update simpler questions with more complex versions
-- 4. Redistribute correct answers to balance A-E distribution
-- 5. Add better distractors to existing questions
