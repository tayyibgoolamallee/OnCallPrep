-- Migration 045: Additional priming cases for practice
-- Adds 25 new priming cases derived from full-case themes (subtle variations).
-- Run after 001 (do not delete existing priming cases).

INSERT INTO sca_cases (case_type, title, scenario, patient_info, key_points, model_answer, time_limit, difficulty, is_pro, published)
VALUES
-- 1. Chest pain follow-up (from telephone theme)
('priming', 'Mr Thompson - Chest Pain Follow-up',
'58-year-old man telephones for follow-up after A&E attendance 3 days ago for chest pain. Discharged with advice to see GP. Still has occasional discomfort. Previous MI 5 years ago, on ramipril, metformin, atorvastatin, aspirin.',
'{"name": "Mr Thompson", "age": 58, "gender": "Male", "pmh": "Hypertension, type 2 diabetes, previous MI 5 years ago", "medications": "Ramipril, Metformin, Atorvastatin, Aspirin, Bisoprolol"}'::jsonb,
ARRAY['Focused cardiac history', 'Assess cardiac vs non-cardiac', 'Review A&E findings', 'Safety-netting', 'Follow-up plan'],
'**Priming Focus:** Take focused cardiac history; assess current symptoms vs A&E presentation. Consider angina vs non-cardiac. Safety-net: severe pain, SOB, unwell → 999. Arrange face-to-face and consider exercise test or cardiology review.

**Examiner Lens:** Structured cardiac reasoning, appropriate reassurance, clear escalation.',
180, 'medium', false, true),

-- 2. SSRI side effects (from medication query theme)
('priming', 'Mrs Foster - New Tablet Side Effects',
'72-year-old woman started sertraline 2 weeks ago. Feeling nauseous, poor sleep, jittery. Not sure if she should continue. Widowed 2 years ago, daughter nearby.',
'{"name": "Mrs Foster", "age": 72, "gender": "Female", "pmh": "Osteoarthritis, hypertension, depression", "medications": "Paracetamol, Ramipril, Sertraline 50mg OD (2 weeks), Ibuprofen PRN"}'::jsonb,
ARRAY['Recognise early SSRI side effects', 'Assess severity', 'Reassure re temporary nature', 'Practical advice (food, timing)', 'Safety-netting'],
'**Priming Focus:** Common early SSRI effects: nausea, insomnia, anxiety – often improve in 2–4 weeks. Explore mood, adherence, severity. Advise continue if tolerable; take with food; consider evening dose for insomnia. Safety-net: severe side effects, suicidal thoughts.

**Examiner Lens:** Reassurance, shared decision-making, clear follow-up.',
180, 'easy', false, true),

-- 3. Diabetes results (from results theme)
('priming', 'Mr Singh - Blood Test Results',
'54-year-old man attending for results. Fasting glucose 7.8, HbA1c 52 mmol/mol. Asymptomatic. No family history of diabetes. BMI 28.',
'{"name": "Mr Singh", "age": 54, "gender": "Male", "pmh": "Hypertension", "medications": "Amlodipine"}'::jsonb,
ARRAY['Interpret HbA1c', 'Diagnose type 2 diabetes', 'Lifestyle and medication', 'CV risk and complications', 'Follow-up'],
'**Priming Focus:** HbA1c 52 confirms type 2 diabetes. Explain clearly, address concerns. Plan: lifestyle, metformin if appropriate, cardiovascular risk (BP, lipids), eye/feet/kidney awareness. Arrange education and review.

**Examiner Lens:** Sensitive delivery of diagnosis, clear plan, safety-netting.',
180, 'medium', false, true),

-- 4. Delirium in care home (from third-party theme)
('priming', 'Mrs Collins - Sudden Confusion',
'Care home manager calls: 82-year-old resident with dementia has been confused and agitated for 24 hours. More confused than usual. No obvious injury. On donepezil, ramipril.',
'{"name": "Mrs Collins", "age": 82, "gender": "Female", "pmh": "Dementia", "medications": "Donepezil, Ramipril"}'::jsonb,
ARRAY['Delirium vs baseline', 'Infection (UTI)', 'Medication review', 'Urgent assessment', 'Care coordination'],
'**Priming Focus:** Acute confusion on background dementia → consider delirium. Common cause: UTI, infection. Plan: urgent assessment, urine dipstick, consider bloods. Coordinate with care home. Safety-net and follow-up.

**Examiner Lens:** Systematic assessment, appropriate urgency, professional third-party communication.',
180, 'medium', false, true),

-- 5. Paediatric fever and rash (from full-case theme)
('priming', 'Tom - Fever and Rash',
'4-year-old boy with fever 2 days and rash today. Rash on trunk, blanching. Drinking less but passing urine. No neck stiffness, no photophobia. Parents worried about meningitis.',
'{"name": "Tom", "age": 4, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Blanching vs non-blanching', 'Red flags (meningitis)', 'Fluids, activity', 'Safety-netting', 'When to escalate'],
'**Priming Focus:** Blanching rash + well child → likely viral. Non-blanching → consider meningococcal, urgent. Assess fluid intake, activity, red flags. Safety-net: non-blanching, worsening, neck stiffness, reduced consciousness.

**Examiner Lens:** Paediatric safety, parental reassurance, clear escalation.',
180, 'medium', false, true),

-- 6. Prescription away from home (from full-case theme)
('priming', 'Mr Grant - Run Out of Tablets Away',
'61-year-old man staying at daughter''s 100 miles away. Run out of ramipril; 3 days left of apixaban. Wants prescription to collect locally. Atrial fibrillation, hypertension.',
'{"name": "Mr Grant", "age": 61, "gender": "Male", "pmh": "Hypertension, atrial fibrillation", "medications": "Ramipril, Apixaban, Bisoprolol"}'::jsonb,
ARRAY['Verify identity and medications', 'Anticoagulant continuity', 'EPS/paper/away pharmacy', 'Emergency supply', 'Safety-netting'],
'**Priming Focus:** Do not miss apixaban. Verify identity, medications, location. Arrange prescription (EPS to nominated pharmacy or paper for different area). If delay: emergency supply from local pharmacy. Clear advice: collect as soon as possible.

**Examiner Lens:** Safe prescribing, practical solution, patient safety.',
180, 'easy', false, true),

-- 7. Health visitor – infant feeding (from third-party theme)
('priming', 'Baby Leo - Feeding and Weight',
'Health visitor calls about 6-week-old baby. Slow weight gain, below 9th centile. Mother struggling with breastfeeding, tearful and low. Father supportive. Baby otherwise well.',
'{"name": "Leo", "age": 0, "gender": "Male", "pmh": "Full-term", "medications": "None"}'::jsonb,
ARRAY['Feeding and weight history', 'Maternal mood', 'Feeding support vs formula', 'Postnatal depression', 'Coordinate with HV'],
'**Priming Focus:** Consider feeding technique, supply, maternal mental health. Plan: face-to-face with mother and baby, feeding plan (lactation support or formula), assess maternal mood (Whooley, referral). Coordinate with health visitor.

**Examiner Lens:** Holistic family approach, professional collaboration.',
180, 'medium', false, true),

-- 8. COPD exacerbation (from telephone theme)
('priming', 'Mr Norris - Worsening Breathlessness',
'68-year-old man with COPD. Increasing breathlessness over a week. Using salbutamol 4–6 times daily (usually 1–2). Slightly more sputum, same colour. No fever.',
'{"name": "Mr Norris", "age": 68, "gender": "Male", "pmh": "COPD, IHD", "medications": "Tiotropium, Salbutamol PRN, Aspirin"}'::jsonb,
ARRAY['Exacerbation severity', 'Steroids and antibiotics', 'Safety-netting', 'Rescue pack', 'Follow-up'],
'**Priming Focus:** Moderate exacerbation: increased breathlessness, increased rescue use. Consider prednisolone 30mg 7–14 days; antibiotics if purulent sputum. Safety-net: severe breathlessness, unable to speak in sentences → 999. Follow-up, rescue pack.

**Examiner Lens:** Structured respiratory assessment, safe management.',
180, 'medium', false, true),

-- 9. Methotrexate monitoring (from pharmacist theme)
('priming', 'Mrs Hughes - New Methotrexate',
'Pharmacist calls: patient has new methotrexate prescription. Wants to confirm baseline FBC/LFT and ongoing monitoring. Patient unsure about alcohol and trimethoprim.',
'{"name": "Mrs Hughes", "age": 72, "gender": "Female", "pmh": "Rheumatoid arthritis", "medications": "Methotrexate 10mg weekly (new), Folic acid"}'::jsonb,
ARRAY['Baseline FBC, LFT, U&E', 'Ongoing monitoring', 'Counselling: weekly dose, alcohol, trimethoprim', 'DMARD monitoring', 'Document'],
'**Priming Focus:** Confirm baseline and ongoing monitoring (e.g. 2-weekly then 12-weekly). Counselling: same day weekly, folic acid day after; avoid trimethoprim; limit alcohol; fever/sore throat/mouth ulcers → seek help. Thank pharmacist; document.

**Examiner Lens:** Safe prescribing, interprofessional communication.',
180, 'easy', false, true),

-- 10. Headache – red flags (from full-case theme)
('priming', 'Ms Dixon - Headache Different from Usual',
'44-year-old woman with 3-day severe headache. Different from her usual migraines; not fully responsive to sumatriptan. Worried about tumour or clot. No neck stiffness, no focal neurology.',
'{"name": "Ms Dixon", "age": 44, "gender": "Female", "pmh": "Migraine", "medications": "Sumatriptan PRN, Paracetamol"}'::jsonb,
ARRAY['Headache history and red flags', 'Difference from usual', 'Face-to-face examination', 'Imaging if indicated', 'Safety-netting'],
'**Priming Focus:** Screen red flags: thunderclap, focal neurology, fever/neck stiffness, papilloedema. Cannot fully exclude serious cause by phone. Plan: face-to-face examination (fundoscopy, neurology); consider imaging if concern. Safety-net: sudden worsening, focal signs, vomiting.

**Examiner Lens:** Safe triage, appropriate urgency.',
180, 'medium', false, true),

-- 11. NOK – spouse capacity (from third-party theme)
('priming', 'Mrs Wright - Fall and Refusing Hospital',
'Husband calls: wife, 82, had fall this morning, hit head. Refusing to go to hospital. She has early dementia. He is worried about capacity and head injury.',
'{"name": "Mrs Wright", "age": 82, "gender": "Female", "pmh": "Dementia, osteoporosis, hypertension", "medications": "Donepezil, Ramipril"}'::jsonb,
ARRAY['Head injury assessment', 'Capacity to refuse', 'Best interests', 'Urgent assessment', 'Support husband'],
'**Priming Focus:** Fall + head strike + confusion → consider head injury guidance. Capacity: can she understand, retain, weigh, communicate? If lacks capacity, act in best interests; consider emergency services if high risk. Support husband; consider urgent visit or paramedic assessment.

**Examiner Lens:** Capacity and best interests, safety, family support.',
180, 'hard', true, true),

-- 12. PE follow-up (from full-case theme)
('priming', 'Mrs Shaw - After Lung Clot',
'71-year-old woman discharged 5 days ago with PE. On rivaroxaban. Feeling better. Questions: how long to take tablets, when can she drive? Cares for husband with dementia.',
'{"name": "Mrs Shaw", "age": 71, "gender": "Female", "pmh": "PE (recent), hypertension", "medications": "Rivaroxaban, Ramipril"}'::jsonb,
ARRAY['Duration of anticoagulation', 'DVLA driving advice', 'Safety-netting (bleeding, recurrence)', 'Follow-up'],
'**Priming Focus:** Duration: usually ≥3 months for provoked PE. Driving: DVLA – no drive 4 weeks after PE, then if stable. Safety-net: bleeding, recurrence (chest pain, breathlessness). Follow-up as per hospital plan.

**Examiner Lens:** Clear information, practical advice.',
180, 'easy', false, true),

-- 13. School nurse – asthma (from third-party theme)
('priming', 'Jake - Wheezing at School',
'School nurse calls: 10-year-old has had two wheezing episodes at school in the past month, relieved by salbutamol. Unclear if on preventer. School needs up-to-date asthma plan.',
'{"name": "Jake", "age": 10, "gender": "Male", "pmh": "Asthma", "medications": "Salbutamol PRN"}'::jsonb,
ARRAY['Current treatment and control', 'Preventer use', 'Review with parent/child', 'School asthma plan', 'Emergency plan'],
'**Priming Focus:** Clarify current treatment; plan asthma review with parent/child. Update school asthma plan; ensure emergency plan and consent for salbutamol. Coordinate with school nurse.

**Examiner Lens:** Professional collaboration, child safety.',
180, 'easy', false, true),

-- 14. Urinary symptoms (from full-case theme)
('priming', 'Mr Cooper - Painful Urination and Fever',
'55-year-old man with dysuria, frequency, and fever for 3 days. Previous UTIs. On tamsulosin for BPH. No loin pain, no rigors.',
'{"name": "Mr Cooper", "age": 55, "gender": "Male", "pmh": "Recurrent UTIs, BPH", "medications": "Tamsulosin"}'::jsonb,
ARRAY['Lower vs upper UTI', 'Antibiotic choice', 'Urine culture', 'Safety-netting', 'BPH/retention'],
'**Priming Focus:** Lower UTI: dysuria, frequency, fever; no red flags for pyelonephritis. Consider urine culture if recurrent. Antibiotic: nitrofurantoin or trimethoprim (check interactions). Safety-net: persistent fever, loin pain. Consider BPH/retention.

**Examiner Lens:** Safe prescribing, safety-netting.',
180, 'easy', false, true),

-- 15. OOH handover (from third-party theme)
('priming', 'Mrs Betty Collins - OOH Handover',
'OOH doctor calls: saw 79-year-old at home last night after fall. Confused, positive dipstick. Started nitrofurantoin. Requests GP follow-up and consideration of frailty/falls review.',
'{"name": "Mrs Betty Collins", "age": 79, "gender": "Female", "pmh": "Hypertension, osteoarthritis", "medications": "Ramipril, Paracetamol"}'::jsonb,
ARRAY['Accept handover', 'Follow-up UTI and confusion', 'Frailty and falls review', 'Coordinate', 'Document'],
'**Priming Focus:** Document OOH assessment. Plan: follow-up 2–3 days for UTI and confusion; urine culture if not sent. Consider frailty assessment, falls review (medication, mobility, hazards). Ensure daughter/carer aware.

**Examiner Lens:** Continuity of care, professional handover.',
180, 'easy', false, true),

-- 16. Child rash – viral vs chickenpox (from full-case theme)
('priming', 'Noah - Rash No Fever',
'4-year-old with rash on chest, spread to trunk. Red and bumpy, not blistering. No fever, well in himself. Mother unsure if eczema flare or chickenpox. Has mild eczema usually on limbs.',
'{"name": "Noah", "age": 4, "gender": "Male", "pmh": "Eczema", "medications": "Eczema cream"}'::jsonb,
ARRAY['Rash morphology and distribution', 'Fever and wellbeing', 'Viral vs eczema vs chickenpox', 'Nursery advice', 'Safety-netting'],
'**Priming Focus:** No fever, well child, no blisters → likely viral exanthem or eczema flare. Chickenpox if vesicular and typical distribution. Safety-net; face-to-face or photo if unclear. Nursery: usually attend if well and no chickenpox.

**Examiner Lens:** Paediatric triage, parental reassurance.',
180, 'easy', false, true),

-- 17. Sick note / fit note (from full-case theme)
('priming', 'Ms Reid - Fit Note for Stress',
'38-year-old woman off work 2 weeks with stress and anxiety. On sertraline 2 weeks. Work wants a fit note. Not sure how long she needs. Retail job, single, lives alone.',
'{"name": "Ms Reid", "age": 38, "gender": "Female", "pmh": "Anxiety", "medications": "Sertraline 50mg OD"}'::jsonb,
ARRAY['Brief mental health assessment', 'Fit note if appropriate', 'Phased return', 'IAPT/counselling', 'Review'],
'**Priming Focus:** Assess impact on function. If unfit: issue fit note (e.g. 2 weeks initially); discuss "may be fit" with adjustments. Phased return, IAPT/counselling. Review in 2 weeks.

**Examiner Lens:** Non-judgmental, supportive, clear boundaries.',
180, 'easy', false, true),

-- 18. Syringe driver review (from palliative theme)
('priming', 'Mr Webb - Pain on Syringe Driver',
'Hospice nurse calls: patient at home on syringe driver (morphine, midazolam). Family report he is still in pain – grimacing, restless. Request review of driver and possible dose increase.',
'{"name": "Mr Webb", "age": 76, "gender": "Male", "pmh": "Metastatic prostate cancer", "medications": "Syringe driver: morphine, midazolam"}'::jsonb,
ARRAY['Pain vs agitation', 'Increase morphine or add PRN', 'Midazolam if agitation', 'Document and communicate', 'Safety-netting'],
'**Priming Focus:** Consider pain vs agitation. If pain: increase morphine in driver or add PRN; consider dexamethasone if bone pain. If agitation: consider increasing midazolam. Document; send prescription/instructions to nurse. Ensure contact for further changes.

**Examiner Lens:** Palliative care principles, clear communication.',
180, 'medium', true, true),

-- 19. Allergy reaction (from full-case theme)
('priming', 'Ms Brooks - Rash After Nuts',
'29-year-old woman developed rash and facial swelling 1 hour after eating nuts. First time. Itchy. No throat swelling, no breathing difficulty, no dizziness.',
'{"name": "Ms Brooks", "age": 29, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Anaphylaxis vs mild', 'Airway, breathing, circulation', 'Antihistamine and safety-netting', 'Allergy follow-up', 'Avoidance'],
'**Priming Focus:** No airway/breathing/circulation concern → mild. Advise antihistamine (e.g. cetirizine); observe; avoid nuts. Safety-net: throat swelling, breathing difficulty, collapse → 999. Consider allergy referral for testing and potential adrenaline. Document possible nut allergy.

**Examiner Lens:** Safe triage, clear advice.',
180, 'medium', false, true),

-- 20. Safeguarding (from third-party theme)
('priming', 'Mr Fry - Safeguarding Concern',
'Social worker calls: 81-year-old vulnerable man lives alone; nephew recently moved in. Concerns about self-neglect (weight loss, poor state of house) and possible financial exploitation. Asks for medical view and support for safeguarding referral.',
'{"name": "Mr Fry", "age": 81, "gender": "Male", "pmh": "Dementia (mild), hypertension", "medications": "Donepezil, Ramipril"}'::jsonb,
ARRAY['Confidentiality and consent', 'Capacity assessment', 'Support safeguarding referral', 'Share information appropriately', 'Document'],
'**Priming Focus:** Share with consent where possible; if lack of capacity or vital interest, may share in best interests. Consider capacity for relevant decisions. Support referral to adult safeguarding; provide medical information as appropriate. Document conversation and referral.

**Examiner Lens:** Professional boundaries, safeguarding awareness.',
180, 'hard', true, true),

-- 21. Low back pain (inspired by MSK theme)
('priming', 'Mr Davies - Low Back Pain',
'42-year-old man with low back pain for 5 days. Started after lifting at work. No leg symptoms, no bladder/bowel change. Office worker, sedentary.',
'{"name": "Mr Davies", "age": 42, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Red flags (cauda equina)', 'Mechanical vs serious', 'Keep moving, analgesia', 'Physio if persistent', 'Safety-netting'],
'**Priming Focus:** No red flags (leg weakness, saddle anaesthesia, bladder/bowel). Likely mechanical. Advise: keep moving, simple analgesia, heat. Avoid prolonged rest. Safety-net: leg weakness, numbness, bladder/bowel change → urgent.

**Examiner Lens:** Safe triage, evidence-based advice.',
180, 'easy', false, true),

-- 22. Teenage mood (inspired by mental health theme)
('priming', 'Alex - Low Mood and Sleep',
'17-year-old with low mood and poor sleep for 6 weeks. Stressed about exams. No self-harm or suicidal thoughts. Parents concerned. Good support at home.',
'{"name": "Alex", "age": 17, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Risk assessment', 'Depression vs adjustment', 'Confidentiality and consent', 'Support and follow-up', 'Safeguarding'],
'**Priming Focus:** Assess severity, risk (self-harm, suicide). Consider adjustment disorder vs depression. Confidentiality and Gillick competence. Offer support (school, counselling, CAMHS if indicated). Safety-net and follow-up.

**Examiner Lens:** Adolescent-friendly, risk awareness.',
180, 'medium', false, true),

-- 23. Hypertension newly diagnosed (inspired by cardiovascular theme)
('priming', 'Mrs Khan - High Blood Pressure',
'48-year-old woman with repeated elevated BP (155/98, 152/95). Asymptomatic. BMI 29. Father had stroke at 60. Smoker 10/day. Worried about stroke.',
'{"name": "Mrs Khan", "age": 48, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Confirm hypertension', 'CV risk assessment', 'Lifestyle and medication', 'Monitoring', 'Safety-netting'],
'**Priming Focus:** Confirm diagnosis (ambulatory/home if needed). Assess cardiovascular risk. Lifestyle: weight, salt, exercise, smoking cessation. Consider medication per NICE. Safety-net: headache, visual disturbance, chest pain → urgent.

**Examiner Lens:** Structured approach, patient concerns.',
180, 'medium', false, true),

-- 24. Anaemia (inspired by haematology theme)
('priming', 'Mrs O''Brien - Tiredness and Anaemia',
'64-year-old woman with tiredness. FBC shows Hb 98, MCV 78. Ferritin low. Heavy periods for 2 years. No GI symptoms, no weight loss. No NSAIDs.',
'{"name": "Mrs O''Brien", "age": 64, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Iron deficiency cause', 'Menorrhagia', 'GI red flags', 'Iron replacement', 'Follow-up'],
'**Priming Focus:** Microcytic anaemia, low ferritin → iron deficiency. Cause: menorrhagia likely. Exclude GI red flags (weight loss, change in bowel habit, bleeding). Treat with iron; address cause (menorrhagia – consider Mirena, referral). Repeat FBC.

**Examiner Lens:** Systematic approach, red flag exclusion.',
180, 'easy', false, true),

-- 25. New asthma (inspired by respiratory theme)
('priming', 'Mr Pearce - Wheeze and Cough',
'35-year-old man with intermittent wheeze and cough for 2 months. Worse at night and with exercise. No smoking. No atopy. Never had asthma before.',
'{"name": "Mr Pearce", "age": 35, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Asthma vs other causes', 'Spirometry', 'Trial of treatment', 'Action plan', 'Safety-netting'],
'**Priming Focus:** Consider asthma (variable wheeze, cough). Spirometry if available; or trial of inhaled corticosteroid + SABA. Provide action plan and safety-netting. Review response. Red flags: severe attack, unable to speak → 999.

**Examiner Lens:** Structured respiratory assessment.',
180, 'medium', false, true);
