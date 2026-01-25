-- Migration: More RCGP Feedback-Aligned Questions
-- Covering additional feedback topics: prescribing safety, clinical topics, professional practice

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro) VALUES

-- ============================================
-- MORE PRESCRIBING SAFETY
-- ============================================

(
  'A 65-year-old woman with type 2 diabetes is on metformin 1g BD and gliclazide 80mg BD. Her HbA1c is 65mmol/mol (8.1%). She has CKD Stage 3a (eGFR 55). What is the most appropriate next step?',
  '[
    {"label": "A", "text": "Increase gliclazide to 160mg BD"},
    {"label": "B", "text": "Add SGLT2 inhibitor (e.g., dapagliflozin 10mg OD)"},
    {"label": "C", "text": "Add DPP-4 inhibitor (e.g., sitagliptin 100mg OD)"},
    {"label": "D", "text": "Start insulin"},
    {"label": "E", "text": "Increase metformin to 2g BD"}
  ]'::jsonb,
  'B',
  'With CKD Stage 3a (eGFR 45-59), SGLT2 inhibitors (e.g., dapagliflozin) are preferred as they have cardiovascular and renal protective benefits. Dapagliflozin can be used if eGFR ≥45. DPP-4 inhibitors are also acceptable. Increasing gliclazide increases hypoglycaemia risk. Metformin max is usually 1g BD. Insulin is usually later in pathway.',
  'Prescribing',
  'medium',
  ARRAY['RCGP AKT Feedback: Safe prescribing', 'NICE CKS: Type 2 diabetes', 'SGLT2 inhibitors preferred with CKD', 'Cardiovascular and renal benefits'],
  false
),

(
  'A 40-year-old woman with depression is on fluoxetine 20mg OD. She is prescribed tramadol for back pain. What is the most important consideration?',
  '[
    {"label": "A", "text": "No interaction - safe to prescribe together"},
    {"label": "B", "text": "Increased risk of serotonin syndrome - use with caution"},
    {"label": "C", "text": "Tramadol will reduce fluoxetine effectiveness"},
    {"label": "D", "text": "Fluoxetine will reduce tramadol effectiveness"},
    {"label": "E", "text": "Both cause drowsiness - warn patient"}
  ]'::jsonb,
  'B',
  'Fluoxetine (SSRI) + tramadol (opioid with serotonergic effects) = increased risk of serotonin syndrome. Use with caution, lowest effective dose, and warn patient about symptoms (agitation, confusion, hyperthermia, tachycardia). Consider alternative analgesia (e.g., paracetamol, NSAIDs) or alternative antidepressant if tramadol essential. Monitor closely.',
  'Prescribing',
  'high',
  ARRAY['RCGP AKT Feedback: Antidepressant drugs and serious interactions', 'BNF: Serotonin syndrome risk', 'SSRI + tramadol = use with caution', 'Consider alternatives'],
  false
),

(
  'A 55-year-old man with rheumatoid arthritis is on methotrexate 20mg weekly. His latest monitoring shows: FBC normal, LFTs normal, eGFR 45. He develops a cough and shortness of breath. What is the most important investigation?',
  '[
    {"label": "A", "text": "Chest X-ray"},
    {"label": "B", "text": "CT chest"},
    {"label": "C", "text": "Spirometry"},
    {"label": "D", "text": "Blood cultures"},
    {"label": "E", "text": "ECG"}
  ]'::jsonb,
  'A',
  'Methotrexate can cause pulmonary toxicity (interstitial pneumonitis) - a serious side effect. New respiratory symptoms in a patient on methotrexate requires chest X-ray to exclude pneumonitis. If X-ray abnormal, stop methotrexate and refer to respiratory/rheumatology. CT chest may be needed if X-ray inconclusive. This is a recognised serious side effect requiring monitoring.',
  'Prescribing',
  'high',
  ARRAY['RCGP AKT Feedback: Side-effects of medicines used for common long-term condition management', 'Methotrexate pulmonary toxicity', 'New respiratory symptoms = chest X-ray', 'Stop methotrexate if pneumonitis'],
  false
),

(
  'A 30-year-old woman requests a private prescription for diazepam for anxiety. She has no history of substance misuse. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Prescribe diazepam 5mg TDS as requested"},
    {"label": "B", "text": "Prescribe diazepam 2mg BD for 2 weeks only"},
    {"label": "C", "text": "Prescribe diazepam but advise it is not suitable for long-term use"},
    {"label": "D", "text": "Avoid prescribing - benzodiazepines are controlled drugs and not first-line for anxiety"},
    {"label": "E", "text": "Prescribe but only if patient pays for private prescription"}
  ]'::jsonb,
  'D',
  'Benzodiazepines (diazepam) are controlled drugs (Schedule 3) and are not first-line treatment for anxiety. First-line is psychological therapy (CBT) or SSRI. Benzodiazepines have risk of dependence, tolerance, and withdrawal. They should only be used short-term (≤2 weeks) for acute severe anxiety, not routine management. Controlled drug prescribing requires careful consideration.',
  'Prescribing',
  'high',
  ARRAY['RCGP AKT Feedback: Controlled drug prescribing', 'NICE CKS: Generalised anxiety disorder', 'Benzodiazepines not first-line for anxiety', 'Risk of dependence and withdrawal'],
  false
),

-- ============================================
-- MORE CLINICAL TOPICS
-- ============================================

-- Acne management
(
  'A 18-year-old woman with moderate acne affecting her face has tried topical benzoyl peroxide and adapalene without improvement. What is the next step?',
  '[
    {"label": "A", "text": "Prescribe oral lymecycline 408mg BD"},
    {"label": "B", "text": "Prescribe oral lymecycline 408mg OD for 3-6 months"},
    {"label": "C", "text": "Refer to dermatology for isotretinoin"},
    {"label": "D", "text": "Prescribe topical erythromycin only"},
    {"label": "E", "text": "Prescribe oral doxycycline 100mg BD for 2 weeks"}
  ]'::jsonb,
  'B',
  'For moderate acne unresponsive to topical treatment, next step is oral antibiotic. Lymecycline 408mg OD (once daily, not BD) for 3-6 months is correct. Combine with topical treatment (benzoyl peroxide or adapalene). Option A has wrong frequency. Option E has wrong duration (needs 3-6 months, not 2 weeks). Isotretinoin is reserved for severe acne or if oral antibiotics fail.',
  'Dermatology',
  'medium',
  ARRAY['RCGP AKT Feedback: Acne management', 'NICE CKS: Acne', 'Lymecycline 408mg OD for 3-6 months', 'Combine with topical treatment'],
  false
),

-- UTI at all life stages
(
  'A 3-year-old girl presents with a 2-day history of dysuria, frequency, and fever (38.5°C). Dipstick shows nitrites positive. What is the most appropriate management?',
  '[
    {"label": "A", "text": "Prescribe trimethoprim 200mg BD for 3 days"},
    {"label": "B", "text": "Prescribe trimethoprim 4mg/kg BD for 3 days"},
    {"label": "C", "text": "Prescribe trimethoprim 4mg/kg BD for 5-7 days"},
    {"label": "D", "text": "Prescribe amoxicillin 125mg TDS for 3 days"},
    {"label": "E", "text": "No antibiotics needed - watch and wait"}
  ]'::jsonb,
  'C',
  'For children with UTI (especially <3 months or with fever), treat with antibiotics. Trimethoprim dose is 4mg/kg BD (twice daily) for 5-7 days (longer than adults). Option B has wrong duration (3 days is for adults). Amoxicillin has high resistance. Do not watch and wait in children with fever - risk of pyelonephritis and scarring.',
  'Infectious Diseases',
  'high',
  ARRAY['RCGP AKT Feedback: UTI diagnosis and management at all life stages', 'NICE CKS: Urinary tract infection - children', 'Trimethoprim 4mg/kg BD for 5-7 days', 'Longer course than adults'],
  false
),

-- Blood pressure management
(
  'A 50-year-old man with type 2 diabetes has a blood pressure of 148/92 mmHg on two separate readings. He has no target organ damage. What is the target blood pressure?',
  '[
    {"label": "A", "text": "<140/90 mmHg"},
    {"label": "B", "text": "<130/80 mmHg"},
    {"label": "C", "text": "<150/90 mmHg"},
    {"label": "D", "text": "<135/85 mmHg"},
    {"label": "E", "text": "<120/80 mmHg"}
  ]'::jsonb,
  'B',
  'For patients with diabetes, target BP is <130/80 mmHg (tighter than general population <140/90). This reduces cardiovascular and microvascular complications. Start ACE inhibitor or ARB (first-line in diabetes). Monitor and titrate to target. Option A is for general population. Option C is too high. Option E is too low and may cause side effects.',
  'Cardiovascular',
  'medium',
  ARRAY['RCGP AKT Feedback: Blood pressure management', 'NICE CKS: Hypertension', 'Diabetes target BP <130/80', 'ACE inhibitor/ARB first-line'],
  false
),

-- Migraine
(
  'A 35-year-old woman presents with recurrent migraines (2-3 per month). She has tried paracetamol and ibuprofen without relief. What is the most appropriate acute treatment?',
  '[
    {"label": "A", "text": "Sumatriptan 50mg at onset"},
    {"label": "B", "text": "Sumatriptan 100mg at onset"},
    {"label": "C", "text": "Codeine 30mg QDS"},
    {"label": "D", "text": "Aspirin 300mg at onset"},
    {"label": "E", "text": "Propranolol 40mg BD as prophylaxis"}
  ]'::jsonb,
  'A',
  'For acute migraine, if simple analgesics fail, triptans (e.g., sumatriptan 50mg) are first-line. Take at onset of migraine, not as prophylaxis. Option B is higher dose (can use if 50mg ineffective). Codeine risks medication-overuse headache. Aspirin 300mg is an option but triptans more effective. Propranolol is for prophylaxis, not acute treatment.',
  'Neurology',
  'medium',
  ARRAY['RCGP AKT Feedback: Migraine', 'NICE CKS: Migraine', 'Triptans first-line if simple analgesics fail', 'Take at onset, not prophylaxis'],
  false
),

-- Developmental assessment
(
  'A 2-year-old child is brought for review. The parent is concerned the child is not speaking. On assessment, the child has no words, does not respond to name, and does not point. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Reassure - this is normal for age"},
    {"label": "B", "text": "Arrange hearing test and refer to speech and language therapy"},
    {"label": "C", "text": "Refer to paediatrician for developmental assessment"},
    {"label": "D", "text": "Prescribe speech therapy exercises"},
    {"label": "E", "text": "Review in 6 months"}
  ]'::jsonb,
  'C',
  'No words at 2 years, not responding to name, not pointing = significant developmental delay. Refer to paediatrician for comprehensive developmental assessment (may indicate autism, hearing impairment, or global delay). Also arrange hearing test (hearing loss can cause speech delay). Do not reassure or delay - early intervention is crucial. This is outside normal variation.',
  'Paediatrics',
  'high',
  ARRAY['RCGP AKT Feedback: Developmental assessment', 'NICE CKS: Autism spectrum disorder', 'No words at 2 years = red flag', 'Refer for developmental assessment'],
  false
),

-- ============================================
-- MORE PROFESSIONAL PRACTICE
-- ============================================

-- Capacity
(
  'A 75-year-old man with dementia (MMSE 18/30) refuses to take his blood pressure medication. He says he feels fine and doesn''t need it. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Force him to take the medication"},
    {"label": "B", "text": "Assess his capacity to make this decision"},
    {"label": "C", "text": "Stop the medication as he has refused"},
    {"label": "D", "text": "Refer to mental health services"},
    {"label": "E", "text": "Prescribe covertly in food"}
  ]'::jsonb,
  'B',
  'Mental Capacity Act: assess capacity for the specific decision (taking BP medication). Capacity is decision-specific and time-specific. Even with dementia, he may have capacity for this decision. If he lacks capacity, make decision in his best interests (consider benefits vs risks). Do not force medication or prescribe covertly without best interests assessment. Document capacity assessment.',
  'Primary Care Organisation & Management',
  'high',
  ARRAY['RCGP AKT Feedback: Consent/capacity', 'Mental Capacity Act 2005', 'Capacity is decision-specific', 'If lacks capacity, act in best interests'],
  false
),

-- Reporting deaths to coroner
(
  'A GP is called to certify the death of a 70-year-old man who died at home. He had metastatic lung cancer and was receiving palliative care. Death was expected. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Certify death as expected - no further action"},
    {"label": "B", "text": "Report to coroner as death was at home"},
    {"label": "C", "text": "Report to coroner as cause of death is unclear"},
    {"label": "D", "text": "Report to coroner only if family request it"},
    {"label": "E", "text": "Certify death but report to coroner if death certificate cannot be issued"}
  ]'::jsonb,
  'E',
  'If you can certify the death (expected, known cause, seen patient within 14 days), issue death certificate. Report to coroner if: unable to certify (cause unknown, not seen within 14 days, suspicious circumstances, accident, suicide, industrial disease, during/after operation, in custody). Expected death at home with known cause and recent review = can certify. Only report if cannot certify.',
  'Primary Care Organisation & Management',
  'high',
  ARRAY['RCGP AKT Feedback: Reporting deaths to coroner/procurator fiscal', 'Can certify if: expected, known cause, seen within 14 days', 'Report if: cannot certify, suspicious, accident, suicide'],
  false
),

-- Staff vaccinations
(
  'A practice nurse asks about hepatitis B vaccination. She works in general practice and does not perform exposure-prone procedures. What is the most appropriate advice?',
  '[
    {"label": "A", "text": "Hepatitis B vaccination is mandatory for all healthcare workers"},
    {"label": "B", "text": "Hepatitis B vaccination is recommended but not mandatory for non-exposure-prone work"},
    {"label": "C", "text": "No vaccination needed - low risk"},
    {"label": "D", "text": "Hepatitis B vaccination is only for hospital staff"},
    {"label": "E", "text": "Hepatitis B vaccination is only needed if patient has hepatitis B"}
  ]'::jsonb,
  'B',
  'Hepatitis B vaccination is recommended for all healthcare workers (including primary care) as they may be exposed to blood/body fluids. It is mandatory for those performing exposure-prone procedures (e.g., surgery, dentistry). For non-exposure-prone work (e.g., general practice nursing), it is strongly recommended but not mandatory. Check immunity after vaccination (anti-HBs).',
  'Primary Care Organisation & Management',
  'medium',
  ARRAY['RCGP AKT Feedback: Staff vaccinations', 'Hepatitis B vaccination recommended for all HCWs', 'Mandatory for exposure-prone procedures', 'Check immunity after vaccination'],
  false
),

-- Safe interpretation of blood tests
(
  'A 60-year-old woman has a full blood count showing: Hb 98 g/L, MCV 72 fL, MCH 24 pg. What is the most likely cause and next investigation?',
  '[
    {"label": "A", "text": "Iron deficiency anaemia - check ferritin"},
    {"label": "B", "text": "B12 deficiency - check B12 and folate"},
    {"label": "C", "text": "Folate deficiency - check folate"},
    {"label": "D", "text": "Anaemia of chronic disease - check CRP"},
    {"label": "E", "text": "Thalassaemia - check haemoglobin electrophoresis"}
  ]'::jsonb,
  'A',
  'Microcytic (MCV <80), hypochromic (MCH <27) anaemia = iron deficiency anaemia. Check ferritin (low in iron deficiency). If ferritin low, check cause (GI blood loss, menorrhagia, malabsorption). B12/folate deficiency causes macrocytic anaemia (MCV >100). Anaemia of chronic disease is usually normocytic. Thalassaemia is microcytic but usually not anaemic or mild anaemia.',
  'Haematology',
  'medium',
  ARRAY['RCGP AKT Feedback: Safe interpretation of blood test and other results', 'Microcytic hypochromic = iron deficiency', 'Check ferritin', 'Investigate cause if confirmed'],
  false
);

-- This migration adds 13 more high-yield questions covering:
-- - Prescribing safety (4 questions)
-- - Clinical topics (5 questions)
-- - Professional practice (4 questions)

-- Total improved questions across migrations 022-029: 70 questions
-- All aligned with RCGP feedback and demonstrating better complexity
