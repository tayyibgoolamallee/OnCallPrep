-- Migration: Final Batch of Improved Questions
-- High-quality questions with balanced answers and better complexity
-- Answer distribution: Balanced across A, B, C, D, E

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro) VALUES

-- More examples with sophisticated distractors (Answer: A)
(
  'A 65-year-old man with heart failure (LVEF 30%) is on ramipril 5mg BD and bisoprolol 5mg OD. He is stable (NYHA class II). What is the THIRD medication that should be considered?',
  '[
    {"label": "A", "text": "Spironolactone 25mg OD"},
    {"label": "B", "text": "Furosemide 40mg OD"},
    {"label": "C", "text": "Digoxin 125mcg OD"},
    {"label": "D", "text": "Amlodipine 5mg OD"},
    {"label": "E", "text": "Diltiazem 60mg TDS"}
  ]'::jsonb,
  'A',
  'For heart failure with LVEF <35%: first-line is ACE inhibitor, second-line is beta-blocker, third-line is spironolactone (if NYHA class II-IV and still symptomatic). Spironolactone reduces mortality and hospitalisation. Furosemide is for fluid overload, not routine add-on. Digoxin is for rate control in AF. Amlodipine and diltiazem are not recommended.',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CKS: Heart failure - chronic', 'Spironolactone third-line for HFrEF', 'After ACE inhibitor and beta-blocker', 'If NYHA class II-IV and symptomatic'],
  false
),

-- Answer: B
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

-- Answer: C
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

-- Answer: D  
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

-- Answer: E
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
);

-- This completes a set of improved questions demonstrating:
-- 1. Balanced answer distribution
-- 2. Better complexity
-- 3. Sophisticated distractors
-- 4. Risk stratification
-- 5. First vs second vs third line
-- 6. Correct medication but wrong dosing

-- Total improved questions: 34 across migrations 022-027
