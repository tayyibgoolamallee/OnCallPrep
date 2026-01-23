-- Full SCA Mock Cases with Marking Criteria
-- These are the 5 free cases plus Pro cases

-- First, add marking_criteria column if it doesn't exist
ALTER TABLE sca_cases ADD COLUMN IF NOT EXISTS marking_criteria JSONB;

-- Case 1: Chest Pain
INSERT INTO sca_cases (title, scenario, patient_info, case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria)
VALUES (
  'Case 1: Chest Pain - Mr. James Mitchell',
  'You are a GP trainee in a busy practice. A 45-year-old man, Mr. James Mitchell, has been booked in for an urgent appointment. The receptionist notes he called this morning complaining of chest pain.

**Opening statement:** "Doctor, I''ve been having this chest pain since this morning. It''s really worrying me."

The pain is central, radiates to left arm and jaw, described as tight and heavy. Started 2 hours ago while sitting at desk. Currently 4/10 severity (was 7/10 at worst). Associated with mild shortness of breath, nausea, and slight dizziness.',
  '{"age": 45, "gender": "Male", "name": "Mr. James Mitchell", "occupation": "Office manager", "presenting_complaint": "Central chest pain for 2 hours", "pmh": "Hypertension (2 years), High cholesterol", "medications": "Ramipril 5mg OD, Atorvastatin 20mg OD", "allergies": "None known", "social": "Smokes 20/day for 25 years. 15-20 units alcohol/week. Married with 2 children.", "family_history": "Father MI at 55, Mother T2DM"}',
  'full',
  720,
  'medium',
  ARRAY['Explore red flags for cardiac chest pain', 'Take detailed SOCRATES history', 'Assess cardiovascular risk factors', 'Address ICE - particularly cardiac concerns', 'Provide appropriate safety netting', 'Consider urgent referral if indicated'],
  '## Model Approach

**Opening:** Establish rapport, acknowledge his concerns about the chest pain.

**History (SOCRATES):**
- Site: Central, behind sternum
- Onset: 2 hours ago, came on gradually
- Character: Tight, heavy, crushing
- Radiation: Left arm and jaw
- Associated symptoms: SOB, nausea, dizziness
- Timing: Constant since onset
- Exacerbating: Worse with movement, deep breath
- Severity: 7/10 → 4/10 now

**Risk Assessment:**
- Age 45, male
- Smoking: 25 pack-years
- Hypertension, hyperlipidaemia
- Family history: Father MI at 55
- Sedentary lifestyle

**ICE:**
- Ideas: Worried about heart attack
- Concerns: Father died of heart disease
- Expectations: Wants tests, possibly hospital

**Management:**
Given the presentation (typical cardiac-sounding pain, multiple risk factors), this patient needs urgent assessment:
1. If pain ongoing: Call 999, give aspirin 300mg
2. If pain settled: Same-day cardiology review or ED
3. ECG if available
4. Safety net: Return immediately if pain returns, worsens, or develops new symptoms

**Key teaching point:** This presentation has multiple red flags for ACS. Even if pain has settled, urgent assessment is required.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established presenting complaint (chest pain)", "Explored site, radiation, character, severity of pain", "Asked about onset, duration, exacerbating/relieving factors", "Explored associated symptoms (SOB, nausea, dizziness)", "Obtained past medical history (hypertension, cholesterol)", "Obtained drug history including compliance", "Obtained social history (smoking, alcohol, work)", "Obtained family history (father''s MI, mother''s diabetes)", "Explored ideas, concerns, expectations", "Assessed cardiovascular risk factors", "Offered relevant examination", "Interpreted findings appropriately"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered cardiac causes (ACS, angina, pericarditis)", "Considered non-cardiac causes (GORD, musculoskeletal, anxiety)", "Assessed cardiovascular risk (smoking, FH, age, hypertension)", "Made appropriate diagnosis or differential", "Discussed management plan with patient", "Considered need for urgent referral (if indicated)", "Prescribed appropriate medication (if indicated)", "Provided safety netting advice", "Arranged appropriate follow-up", "Documented appropriately"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy and rapport", "Used appropriate language and avoided jargon", "Listened actively to patient concerns", "Addressed patient''s anxiety appropriately", "Explained diagnosis/plan clearly", "Involved patient in decision-making", "Maintained professional boundaries", "Demonstrated cultural sensitivity"]}}'
)
ON CONFLICT DO NOTHING;

-- Case 2: Shortness of Breath
INSERT INTO sca_cases (title, scenario, patient_info, case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria)
VALUES (
  'Case 2: Shortness of Breath - Mrs. Margaret Wilson',
  'You are a GP trainee. Mrs. Margaret Wilson, a 68-year-old retired teacher, has come to see you about progressive breathlessness over the past 3 months.

**Opening statement:** "Doctor, I''m getting so out of breath these days. I used to walk to the shops easily but now I have to stop halfway."

She describes gradual onset of breathlessness on exertion. No orthopnoea or PND. Occasional dry cough. No chest pain, palpitations, or ankle swelling.',
  '{"age": 68, "gender": "Female", "name": "Mrs. Margaret Wilson", "occupation": "Retired teacher", "presenting_complaint": "Progressive breathlessness for 3 months", "pmh": "Ex-smoker (quit 10 years ago, 30 pack-years), Mild COPD diagnosed 5 years ago", "medications": "Salbutamol PRN, Tiotropium", "allergies": "Penicillin", "social": "Lives alone, independent. Daughter lives nearby. Non-drinker.", "family_history": "Mother had heart failure"}',
  'full',
  720,
  'medium',
  ARRAY['Differentiate between COPD exacerbation, heart failure, and other causes', 'Explore red flags (haemoptysis, weight loss, chest pain)', 'Assess functional impact on daily activities', 'Review current COPD management', 'Consider investigations (spirometry, BNP, CXR)', 'Safety net appropriately'],
  '## Model Approach

**Differential diagnosis:**
1. COPD progression/exacerbation
2. Heart failure (family history, age)
3. Anaemia
4. Lung malignancy (ex-smoker)
5. Pulmonary fibrosis

**Key history points:**
- Gradual onset over 3 months
- Exercise tolerance reduced (can''t walk to shops)
- No orthopnoea, PND, or ankle swelling (against HF)
- No haemoptysis, weight loss (reassuring for malignancy)
- Previous 30 pack-year smoking history

**Investigations to arrange:**
1. Spirometry (assess COPD control)
2. BNP (rule out heart failure)
3. CXR (? new changes)
4. FBC (? anaemia)
5. Consider ECG

**Management:**
- Review inhaler technique
- Consider stepping up COPD treatment if spirometry confirms decline
- Refer for pulmonary rehabilitation
- Safety net: Return if worsening, haemoptysis, or new symptoms',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established timeline and progression of breathlessness", "Explored exercise tolerance and functional impact", "Asked about orthopnoea and PND", "Explored associated symptoms (cough, wheeze, chest pain)", "Asked about red flags (haemoptysis, weight loss)", "Reviewed smoking history", "Checked current medications and inhaler use", "Explored ideas, concerns, expectations", "Considered differential diagnoses", "Planned appropriate investigations"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered COPD exacerbation/progression", "Considered heart failure", "Considered malignancy given smoking history", "Considered anaemia", "Made appropriate investigation plan", "Reviewed current COPD management", "Discussed management options", "Provided safety netting advice", "Arranged appropriate follow-up", "Considered referral if needed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy and rapport", "Used appropriate language", "Listened actively", "Addressed concerns", "Explained clearly", "Involved patient in decisions", "Maintained professionalism", "Showed cultural sensitivity"]}}'
)
ON CONFLICT DO NOTHING;

-- Case 3: Abdominal Pain
INSERT INTO sca_cases (title, scenario, patient_info, case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria)
VALUES (
  'Case 3: Abdominal Pain - Ms. Sarah Chen',
  'You are a GP trainee. Ms. Sarah Chen, a 32-year-old accountant, has come with right lower quadrant abdominal pain that started yesterday.

**Opening statement:** "I''ve had this pain in my tummy since yesterday. It''s getting worse and I''m worried something is wrong."

The pain is in the right lower quadrant, constant, aching in nature. No radiation. 6/10 severity. Associated with nausea but no vomiting. Last menstrual period was 2 weeks ago.',
  '{"age": 32, "gender": "Female", "name": "Ms. Sarah Chen", "occupation": "Accountant", "presenting_complaint": "Right lower quadrant pain for 1 day", "pmh": "None significant", "medications": "Combined OCP (Microgynon)", "allergies": "None", "social": "In long-term relationship, non-smoker, minimal alcohol", "family_history": "Nothing significant"}',
  'full',
  720,
  'medium',
  ARRAY['Consider gynaecological and surgical differentials', 'Explore menstrual and sexual history sensitively', 'Ask about red flags (fever, vomiting, dysuria)', 'Consider pregnancy despite OCP use', 'Assess need for urgent review/referral', 'Safety net for appendicitis/ectopic'],
  '## Model Approach

**Key differentials:**
1. Appendicitis
2. Ovarian cyst (rupture/torsion)
3. Ectopic pregnancy (despite OCP)
4. Pelvic inflammatory disease
5. UTI
6. Constipation

**Essential history:**
- LMP 2 weeks ago (midcycle)
- Sexual history, STI risk
- Vaginal discharge
- Dysuria, urinary frequency
- Bowel habit changes
- Fever, rigors
- Previous similar episodes

**Examination considerations:**
- Abdominal examination
- Consider pelvic examination

**Investigations:**
1. Pregnancy test (essential)
2. Urine dip and MSU
3. STI swabs if indicated
4. Bloods if acute (FBC, CRP)

**Management depends on findings:**
- If pregnancy test positive + abdominal pain = urgent gynaecology referral (ectopic)
- If signs of appendicitis = surgical review
- If PID suspected = treat per guidelines + contact tracing',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established site, character, severity of pain", "Explored onset and progression", "Asked about associated GI symptoms", "Explored menstrual and gynaecological history", "Took sensitive sexual history", "Asked about urinary symptoms", "Explored red flags (fever, vomiting)", "Checked contraception and pregnancy risk", "Explored ICE", "Considered relevant differentials"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered appendicitis", "Considered gynaecological causes", "Considered ectopic pregnancy", "Considered PID", "Planned pregnancy test", "Discussed need for examination", "Made appropriate investigation plan", "Provided clear safety netting", "Arranged appropriate follow-up", "Considered urgent referral criteria"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy", "Used appropriate language", "Took sensitive history", "Maintained privacy and dignity", "Explained plan clearly", "Involved patient in decisions", "Maintained professionalism", "Non-judgmental approach"]}}'
)
ON CONFLICT DO NOTHING;

-- Case 4: Headache
INSERT INTO sca_cases (title, scenario, patient_info, case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria)
VALUES (
  'Case 4: Headache - Ms. Emma Thompson',
  'You are a GP trainee. Ms. Emma Thompson, a 28-year-old marketing manager, has come about recurrent headaches for the past 6 months.

**Opening statement:** "Doctor, I keep getting these awful headaches. They''re affecting my work and my life. My mum had migraines and I wonder if that''s what this is."

She describes unilateral throbbing headaches, mainly on the right side. Associated with nausea and sensitivity to light. Usually last 4-6 hours. Occur 2-3 times per week. No aura.',
  '{"age": 28, "gender": "Female", "name": "Ms. Emma Thompson", "occupation": "Marketing manager", "presenting_complaint": "Recurrent headaches for 6 months", "pmh": "None", "medications": "Ibuprofen PRN (taking 3-4 times weekly)", "allergies": "None", "social": "High-stress job, often skips meals, poor sleep. Non-smoker, occasional alcohol. On combined pill.", "family_history": "Mother has migraines"}',
  'full',
  720,
  'easy',
  ARRAY['Recognise migraine pattern', 'Explore red flags for secondary headache', 'Assess impact on quality of life', 'Discuss medication overuse headache risk', 'Consider preventive treatment options', 'Provide lifestyle advice'],
  '## Model Approach

**Diagnosis:** Likely migraine without aura
- Classic features: Unilateral, throbbing, 4-6 hours
- Associated nausea and photophobia
- Family history supportive

**Red flags to exclude:**
- Thunderclap onset (SAH)
- Progressive worsening
- Focal neurology
- Fever, meningism
- Worse lying down, early morning (raised ICP)

**Concerns:**
1. Medication overuse headache (ibuprofen 3-4x weekly)
2. High frequency affecting quality of life

**Management:**
1. Acute treatment: Triptans (sumatriptan) instead of frequent NSAIDs
2. Lifestyle: Regular meals, sleep hygiene, hydration
3. Headache diary
4. Consider preventive if >4 migraine days/month (propranolol, amitriptyline)
5. Reduce NSAID use to avoid medication overuse headache

**Contraceptive consideration:** Combined pill may worsen migraine - consider switching if migraine with aura develops',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established headache characteristics (SOCRATES)", "Explored associated symptoms (nausea, photophobia)", "Asked about aura", "Checked for red flag features", "Explored triggers and pattern", "Assessed functional impact", "Reviewed current medication use", "Explored lifestyle factors", "Checked contraceptive use", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made appropriate diagnosis of migraine", "Excluded secondary causes", "Identified medication overuse risk", "Discussed acute treatment options", "Discussed preventive treatment", "Provided lifestyle advice", "Considered contraceptive implications", "Provided safety netting", "Arranged follow-up", "Discussed headache diary"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy", "Used clear language", "Validated her concerns", "Acknowledged impact on life", "Explained diagnosis clearly", "Involved in treatment decisions", "Maintained professionalism", "Addressed family history concerns"]}}'
)
ON CONFLICT DO NOTHING;

-- Case 5: Fatigue and Low Mood
INSERT INTO sca_cases (title, scenario, patient_info, case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria)
VALUES (
  'Case 5: Fatigue and Low Mood - Mr. David Roberts',
  'You are a GP trainee. Mr. David Roberts, a 55-year-old factory supervisor, has come about tiredness and low mood for the past 3 months.

**Opening statement:** "I just feel so tired all the time, doctor. I don''t enjoy things like I used to. Work is stressful but it''s more than that."

He describes persistent fatigue, difficulty sleeping (early morning waking), loss of interest in hobbies, and poor concentration. His appetite has decreased and he has lost 4kg unintentionally.',
  '{"age": 55, "gender": "Male", "name": "Mr. David Roberts", "occupation": "Factory supervisor", "presenting_complaint": "Fatigue and low mood for 3 months", "pmh": "Type 2 diabetes (5 years), Hypertension", "medications": "Metformin 1g BD, Ramipril 10mg OD", "allergies": "None", "social": "Divorced 2 years ago, lives alone. Children live away. Drinks 20 units/week. Works long hours.", "family_history": "Father had depression"}',
  'full',
  720,
  'medium',
  ARRAY['Screen for depression using PHQ-9 or similar', 'Explore biological symptoms (sleep, appetite, concentration)', 'Assess suicide risk appropriately', 'Consider organic causes of fatigue', 'Explore psychosocial stressors', 'Discuss management options'],
  '## Model Approach

**Assessment:** Features suggestive of moderate-severe depression:
- Low mood
- Anhedonia (loss of interest)
- Early morning waking
- Poor concentration
- Weight loss
- Fatigue

**Risk factors:**
- Divorce 2 years ago
- Lives alone, social isolation
- Work stress
- Family history of depression
- Alcohol use (20 units/week)

**Risk assessment (essential):**
- Thoughts of self-harm or suicide
- Hopelessness
- Plans or means
- Protective factors

**Organic causes to exclude:**
- Thyroid dysfunction
- Diabetes control (HbA1c)
- Anaemia
- Malignancy (given weight loss)

**Management:**
1. PHQ-9 score to quantify severity
2. Bloods: TFTs, FBC, HbA1c, U&Es, LFTs
3. Discuss treatment options (antidepressant vs psychological therapy)
4. Address alcohol use
5. Safety plan if any risk
6. Follow-up in 1-2 weeks',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored mood symptoms", "Asked about biological symptoms of depression", "Assessed sleep pattern in detail", "Explored appetite and weight change", "Assessed concentration and memory", "Explored anhedonia", "Asked about suicidal ideation sensitively", "Explored psychosocial stressors", "Assessed alcohol use", "Considered organic causes", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made appropriate assessment of depression", "Used or discussed PHQ-9", "Conducted appropriate risk assessment", "Considered organic causes", "Planned appropriate investigations", "Discussed treatment options", "Addressed alcohol use", "Provided safety netting", "Arranged appropriate follow-up", "Considered referral if severe"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy and understanding", "Created safe space for disclosure", "Asked about suicide sensitively", "Used appropriate language", "Validated his experience", "Explained clearly", "Involved in treatment decisions", "Maintained hope and optimism"]}}'
)
ON CONFLICT DO NOTHING;
