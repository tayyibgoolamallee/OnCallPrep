-- Migration 046: Second batch of priming cases (40 more) to reach 100 total
-- Run after 045. Total priming after this: 35 (001) + 25 (045) + 40 = 100.

INSERT INTO sca_cases (case_type, title, scenario, patient_info, key_points, model_answer, time_limit, difficulty, is_pro, published)
VALUES
-- 1. Eczema flare (dermatology)
('priming', 'Lily - Eczema Flare',
'6-year-old girl with eczema flare on arms and legs. Mother says it has been worse for 2 weeks. Using emollient and 1% hydrocortisone. No infection signs. Sleep disturbed by itch.',
'{"name": "Lily", "age": 6, "gender": "Female", "pmh": "Atopic eczema", "medications": "Emollient, 1% hydrocortisone"}'::jsonb,
ARRAY['Severity and triggers', 'Emollient and steroid use', 'Infection signs', 'Step-up treatment', 'Safety-netting'],
'**Priming Focus:** Assess severity, triggers, current treatment. Consider step-up topical steroid if mild/moderate; infection signs → review. Emollient first, steroid for flares. Safety-net: spreading redness, fever, oozing.

**Examiner Lens:** Paediatric dermatology, parental advice.',
180, 'easy', false, true),

-- 2. Contraception pill switch (women''s health)
('priming', 'Ms Turner - Pill Making Her Low',
'24-year-old woman on Microgynon for 2 years. Feels low mood and low libido. Wants to try a different pill. No depression history. Non-smoker.',
'{"name": "Ms Turner", "age": 24, "gender": "Female", "pmh": "None", "medications": "Microgynon"}'::jsonb,
ARRAY['Link to COCP', 'Alternatives (POP, IUS, implant)', 'Mood assessment', 'Shared decision', 'Follow-up'],
'**Priming Focus:** COCP can affect mood and libido. Explore mood (PHQ-2/9 if indicated). Alternatives: POP, IUS, implant. Shared decision-making. No contraindications in history.

**Examiner Lens:** Contraception counselling, patient-centred.',
180, 'easy', false, true),

-- 3. Warfarin and bleeding (anticoagulation)
('priming', 'Mr Walsh - Bleeding on Warfarin',
'72-year-old man on warfarin for AF. Minor cut that bled for 30 minutes. INR last checked 2 weeks ago was 3.2. No other bleeding. Takes warfarin regularly.',
'{"name": "Mr Walsh", "age": 72, "gender": "Male", "pmh": "Atrial fibrillation", "medications": "Warfarin"}'::jsonb,
ARRAY['Bleeding severity', 'INR check', 'Reversal if major', 'Patient advice', 'Safety-netting'],
'**Priming Focus:** Minor bleed – advise pressure, when to seek help. Check INR if recent or if recurrent bleeds. Major bleed → urgent, consider reversal. Safety-net: heavy bleeding, head injury, melaena.

**Examiner Lens:** Anticoagulation safety.',
180, 'medium', false, true),

-- 4. Toddler refusing food (paediatrics)
('priming', 'Oscar - Fussy Eater',
'2-year-old boy, parents worried he barely eats. Drinks milk and has snacks. No weight loss, developing normally. Parents compare to older sibling who ate well.',
'{"name": "Oscar", "age": 2, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Growth and development', 'Reassurance', 'Feeding advice', 'Red flags', 'Follow-up'],
'**Priming Focus:** Reassure if growth and development normal. Common phase. Advice: structured meals, avoid pressure, limit milk before meals, offer variety. Red flags: weight loss, lethargy, developmental concern.

**Examiner Lens:** Parental reassurance, evidence-based advice.',
180, 'easy', false, true),

-- 5. Hot flushes (menopause)
('priming', 'Mrs Dean - Hot Flushes',
'52-year-old woman with frequent hot flushes for 6 months. Periods stopped 1 year ago. Affecting sleep and work. Wants to know about HRT. No VTE or breast cancer history.',
'{"name": "Mrs Dean", "age": 52, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Menopause confirmation', 'HRT benefits and risks', 'Formulation choice', 'Duration', 'Safety-netting'],
'**Priming Focus:** Confirm menopause (age, amenorrhoea). Discuss HRT: benefits (symptoms, bone), risks (VTE, breast with combined). Formulation (transdermal if VTE risk). Duration: review annually. Safety-net: bleeding, breast symptoms.

**Examiner Lens:** Shared decision-making, guideline-based.',
180, 'medium', false, true),

-- 6. Repeat antibiotics for chest (respiratory)
('priming', 'Mr Holt - Another Chest Infection',
'55-year-old man with fourth episode of cough and green sputum in 6 months. Each time given antibiotics. Smoker 20/day. No fever this time. Wants antibiotics again.',
'{"name": "Mr Holt", "age": 55, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Consider COPD', 'Smoking cessation', 'Antibiotic stewardship', 'Spirometry', 'Safety-netting'],
'**Priming Focus:** Recurrent chest infections → consider COPD. Smoking cessation critical. Antibiotics only if indicated (fever, purulent sputum, unwell). Spirometry to confirm COPD. Safety-net and follow-up.

**Examiner Lens:** Stewardship, long-term condition recognition.',
180, 'medium', false, true),

-- 7. Insomnia (mental health / sleep)
('priming', 'Mr Ingram - Can''t Sleep',
'45-year-old man with insomnia for 3 months. Takes 2 hours to fall asleep. Stressed at work. Drinks 3 coffees before noon. No low mood. Wants sleeping tablets.',
'{"name": "Mr Ingram", "age": 45, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Sleep hygiene', 'Caffeine and stress', 'CBT-I first line', 'Hypnotics only if severe', 'Safety-netting'],
'**Priming Focus:** Sleep hygiene, caffeine reduction, stress. CBT-I first line. Hypnotics only short-term if severe; avoid long-term. Explore expectations. Safety-net: low mood, snoring (OSA).

**Examiner Lens:** Non-drug first, limit hypnotics.',
180, 'easy', false, true),

-- 8. Knee pain – possible OA (MSK)
('priming', 'Mrs Jarvis - Knee Pain',
'68-year-old woman with bilateral knee pain for 6 months. Worse on stairs and walking. No swelling, no locking. BMI 32. No previous injury.',
'{"name": "Mrs Jarvis", "age": 68, "gender": "Female", "pmh": "Hypertension", "medications": "Amlodipine"}'::jsonb,
ARRAY['OA vs other', 'Weight and exercise', 'Analgesia', 'Physio', 'Referral if needed'],
'**Priming Focus:** Likely osteoarthritis. Weight loss, exercise, simple analgesia, topical NSAID. Physio for strengthening. Consider X-ray if diagnosis unclear or referral criteria. Safety-net: hot swollen joint, trauma.

**Examiner Lens:** Holistic OA management.',
180, 'easy', false, true),

-- 9. Thyroid nodule (endocrine)
('priming', 'Mrs Kent - Lump in Neck',
'48-year-old woman noticed lump in neck 2 weeks ago. No pain, no swallowing difficulty, no voice change. No weight change or palpitations. Normal TFTs 1 year ago.',
'{"name": "Mrs Kent", "age": 48, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Thyroid examination', 'TFTs', 'USS thyroid', '2WW if concern', 'Safety-netting'],
'**Priming Focus:** Examine thyroid; check TFTs. USS thyroid for characterisation. 2WW referral if hard, fixed, lymph nodes, or rapid growth. Reassure if benign feel and normal TFTs; arrange USS.

**Examiner Lens:** Systematic approach, red flags.',
180, 'medium', false, true),

-- 10. Request for antibiotics for cold (respiratory / stewardship)
('priming', 'Mr Lane - Cold and Wants Antibiotics',
'35-year-old man with runny nose, sore throat, and cough for 4 days. No fever. Wants antibiotics because "last time they helped". Works in office.',
'{"name": "Mr Lane", "age": 35, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Viral vs bacterial', 'Centor if sore throat', 'Reassurance', 'Safety-netting', 'No antibiotic'],
'**Priming Focus:** Likely viral. Centor criteria if sore throat dominant. Explain why antibiotics not indicated. Symptom relief, fluids, rest. Safety-net: persistent fever, worsening, breathlessness. No antibiotic.

**Examiner Lens:** Stewardship, communication.',
180, 'easy', false, true),

-- 11. Child with abdominal pain (paediatrics)
('priming', 'Emma - Tummy Ache',
'8-year-old girl with central abdominal pain for 2 days. Intermittent. Eating less but drinking. No vomiting, no diarrhoea, no fever. No dysuria.',
'{"name": "Emma", "age": 8, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Red flags', 'Constipation, UTI, mesenteric adenitis', 'Examination', 'Safety-netting', 'Follow-up'],
'**Priming Focus:** Consider constipation, UTI, mesenteric adenitis, anxiety. Red flags: right iliac fossa, fever, vomiting, weight loss. Examine if possible; urine dip. Safety-net: worsening, localising, fever.

**Examiner Lens:** Paediatric abdominal pain approach.',
180, 'medium', false, true),

-- 12. New hypertension in young (cardiovascular)
('priming', 'Mr Nash - High BP at Check',
'32-year-old man. BP 148/92 at workplace check. Asymptomatic. BMI 26. Smoker 10/day. Father had MI at 50. Worried.',
'{"name": "Mr Nash", "age": 32, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Confirm with repeat', 'Lifestyle', 'CV risk', 'Investigation', 'Follow-up'],
'**Priming Focus:** Confirm with repeated readings (ambulatory if available). Lifestyle: weight, salt, exercise, smoking. Assess cardiovascular risk. Exclude secondary causes if young/severe. Follow-up and monitoring.

**Examiner Lens:** Confirmation before labelling, lifestyle first.',
180, 'easy', false, true),

-- 13. Vaginal discharge (women''s health)
('priming', 'Ms Owen - Discharge and Itch',
'28-year-old woman with white discharge and vulval itch for 1 week. No odour. Partner has no symptoms. Not on antibiotics. Last period 2 weeks ago.',
'{"name": "Ms Owen", "age": 28, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Candida vs BV vs STI', 'Examination or empirical', 'Treatment', 'Partner notification if STI', 'Safety-netting'],
'**Priming Focus:** Consider thrush (itch, white), BV (odour), STI. If typical thrush: topical/immediate oral antifungal. If uncertain: swabs. Partner notification if STI. Safety-net: no improvement, pelvic pain.

**Examiner Lens:** Sensitive history, appropriate treatment.',
180, 'easy', false, true),

-- 14. Request for vitamin B12 (haematology / nutrition)
('priming', 'Mrs Quinn - Wants B12 Injection',
'60-year-old woman read about B12 and wants injections for energy. Tired for months. FBC and B12 normal 3 months ago. Vegan for 2 years.',
'{"name": "Mrs Quinn", "age": 60, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['B12 and FBC', 'Cause of fatigue', 'Diet and supplementation', 'Avoid unnecessary treatment', 'Follow-up'],
'**Priming Focus:** B12 and FBC normal – no indication for B12 injection. Explore other causes of fatigue (sleep, mood, thyroid, iron). Vegan diet: advise on B12-fortified foods or oral supplement. Avoid unnecessary injections.

**Examiner Lens:** Evidence-based, avoid over-medicalisation.',
180, 'easy', false, true),

-- 15. Elbow pain (MSK)
('priming', 'Mr Ross - Elbow Pain',
'42-year-old man with right lateral elbow pain for 3 weeks. Worse with gripping and lifting. Desk job, uses mouse a lot. No trauma. Tender over lateral epicondyle.',
'{"name": "Mr Ross", "age": 42, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Lateral epicondylitis', 'Activity modification', 'Physio, NSAID gel', 'Steroid only if persistent', 'Safety-netting'],
'**Priming Focus:** Lateral epicondylitis (tennis elbow). Activity modification, physio exercises, NSAID gel. Steroid injection only if persistent and affecting function. Safety-net: night pain, weakness → review.

**Examiner Lens:** Conservative first, evidence-based.',
180, 'easy', false, true),

-- 16. New headache in elderly (neurology)
('priming', 'Mr Stokes - New Headaches',
'72-year-old man with new headaches for 2 weeks. Bilateral, pressure-like. No red flags. On ramipril and atorvastatin. BP well controlled.',
'{"name": "Mr Stokes", "age": 72, "gender": "Male", "pmh": "Hypertension, IHD", "medications": "Ramipril, Atorvastatin"}'::jsonb,
ARRAY['Red flags (new in elderly)', 'GCA if >50', 'Temporal artery', 'ESR/CRP', 'Urgent if GCA'],
'**Priming Focus:** New headache in elderly → consider GCA. Ask about jaw claudication, scalp tenderness, visual symptoms. ESR/CRP; if raised or clinical concern → urgent referral. Do not delay if GCA suspected (steroids).

**Examiner Lens:** Red flag recognition, GCA awareness.',
180, 'hard', true, true),

-- 17. Child with cough (paediatrics)
('priming', 'Ben - Persistent Cough',
'5-year-old boy with cough for 3 weeks. Dry, worse at night. No fever, no wheeze. No recent cold. Parents worried about asthma.',
'{"name": "Ben", "age": 5, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Post-viral vs asthma', 'Wheeze, triggers', 'Safety-netting', 'Trial treatment if indicated', 'Follow-up'],
'**Priming Focus:** Post-viral cough common; can last 3–4 weeks. Consider asthma if wheeze, triggers, atopy. Safety-net: fever, breathlessness, feeding difficulty. Trial of asthma treatment if clinical suspicion; review.

**Examiner Lens:** Paediatric respiratory, reassurance.',
180, 'easy', false, true),

-- 18. Request for sick note for child (administrative / safeguarding)
('priming', 'Mrs Todd - Sick Note for School',
'Mother requests sick note for 10-year-old who has been off school 2 weeks with "tummy bugs and colds". Child has been well at home. School asking for evidence.',
'{"name": "Child", "age": 10, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Explore reason for absence', 'Safeguarding', 'School avoidance', 'Honest documentation', 'Support family'],
'**Priming Focus:** Explore reason for absence; consider school avoidance, anxiety, bullying. Safeguarding if concerning. Document honestly – cannot certify illness not observed. Support family and school liaison if appropriate.

**Examiner Lens:** Professional boundaries, safeguarding.',
180, 'medium', true, true),

-- 19. Erectile dysfunction (urology / cardiovascular)
('priming', 'Mr Underwood - ED',
'58-year-old man with erectile dysfunction for 6 months. Type 2 diabetes, hypertension. On metformin, ramipril. Relationship stable. Embarrassed.',
'{"name": "Mr Underwood", "age": 58, "gender": "Male", "pmh": "Type 2 diabetes, hypertension", "medications": "Metformin, Ramipril"}'::jsonb,
ARRAY['CV and diabetes link', 'Nitrate contraindication', 'PDE5 inhibitors', 'Sensitive approach', 'Lifestyle'],
'**Priming Focus:** ED common with diabetes and hypertension. Exclude nitrate use (contraindicates PDE5i). Offer PDE5 inhibitor if appropriate. Sensitive, non-judgmental. Consider cardiovascular risk review.

**Examiner Lens:** Sensitive history, safe prescribing.',
180, 'medium', false, true),

-- 20. Request for MRI (investigation)
('priming', 'Mrs Vale - Wants MRI for Back',
'45-year-old woman with low back pain for 2 months. No red flags. Had physio for 4 weeks, minimal improvement. Read about MRI and wants one.',
'{"name": "Mrs Vale", "age": 45, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['NICE guidance', 'Red flags', 'Continue physio', 'Avoid unnecessary imaging', 'Reassurance'],
'**Priming Focus:** NICE: do not routinely image non-specific low back pain. No red flags → continue physio, analgesia. Explain why MRI not indicated (findings often not actionable). Reassure; review if persistent or red flags.

**Examiner Lens:** Appropriate investigation, shared decision-making.',
180, 'medium', false, true),

-- 21. Hay fever (ENT / allergy)
('priming', 'Ms Webb - Hay Fever',
'22-year-old woman with sneezing, itchy eyes, runny nose for 2 weeks. Worse outdoors. No asthma. Wants something stronger than antihistamine.',
'{"name": "Ms Webb", "age": 22, "gender": "Female", "pmh": "None", "medications": "Cetirizine"}'::jsonb,
ARRAY['Nasal steroid', 'Antihistamine', 'Eye drops', 'Allergen avoidance', 'Follow-up'],
'**Priming Focus:** Allergic rhinitis. Nasal corticosteroid first line; add antihistamine if needed. Eye drops for eye symptoms. Allergen avoidance. Review if not controlled.

**Examiner Lens:** Simple management, step-up approach.',
180, 'easy', false, true),

-- 22. Reflux in infant (paediatrics)
('priming', 'Baby Mia - Posseting',
'6-week-old baby, first child. Brings up milk after feeds. Happy, gaining weight well. Parents worried about reflux. No blood, no bile.',
'{"name": "Mia", "age": 0, "gender": "Female", "pmh": "Full-term", "medications": "None"}'::jsonb,
ARRAY['Reassurance', 'Positioning, feeding', 'Red flags', 'No medication first line', 'Follow-up'],
'**Priming Focus:** Physiological reflux common; reassure if thriving. Positioning, smaller frequent feeds, burping. Red flags: poor weight gain, blood, bile, distress. Avoid medication unless significant GORD.

**Examiner Lens:** Parental reassurance, safety-netting.',
180, 'easy', false, true),

-- 23. Request for cholesterol test (cardiovascular)
('priming', 'Mr Yates - Check My Cholesterol',
'50-year-old man wants cholesterol checked. Father had heart attack at 55. Eats well, exercises. No symptoms. Wants to "prevent heart attack".',
'{"name": "Mr Yates", "age": 50, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['CV risk assessment', 'QRISK', 'Lifestyle', 'Statin if indicated', 'Follow-up'],
'**Priming Focus:** Assess cardiovascular risk (QRISK). Lipid profile part of assessment. Family history significant. Lifestyle advice; statin if risk exceeds threshold. Explain absolute risk and benefit.

**Examiner Lens:** Risk communication, prevention.',
180, 'easy', false, true),

-- 24. Scabies (dermatology)
('priming', 'Mr Zane - Itchy Rash',
'38-year-old man with itchy rash for 2 weeks. Mainly between fingers and wrists. Worse at night. Partner has similar. Tried hydrocortisone, no help.',
'{"name": "Mr Zane", "age": 38, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Scabies', 'Permethrin', 'Treat contacts', 'Washing', 'Repeat if needed'],
'**Priming Focus:** Distribution and nocturnal itch suggest scabies. Permethrin 5% – treat patient and close contacts; repeat after 7 days. Washing of clothes and bedding. Avoid steroid (can mask).

**Examiner Lens:** Infectious disease, contact treatment.',
180, 'easy', false, true),

-- 25. Palpitations (cardiovascular)
('priming', 'Mrs Abbott - Palpitations',
'44-year-old woman with intermittent palpitations for 2 months. Lasts seconds. No syncope, no chest pain. Drinks 4 coffees daily. Normal thyroid last year.',
'{"name": "Mrs Abbott", "age": 44, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['ECG', 'Trigger factors', 'Caffeine, stress', 'Holter if frequent', 'Red flags'],
'**Priming Focus:** Palpitations: ECG (during or after episode if possible). Reduce caffeine, stress. Consider 24-hour tape if frequent. Red flags: syncope, chest pain, family history of sudden death → urgent.

**Examiner Lens:** Systematic approach, safety-netting.',
180, 'medium', false, true),

-- 26. Teenager with acne (dermatology / paediatrics)
('priming', 'Chloe - Acne',
'15-year-old girl with moderate acne for 6 months. Affecting confidence. Tried topical benzoyl peroxide. Wants "something that works". Not sexually active.',
'{"name": "Chloe", "age": 15, "gender": "Female", "pmh": "None", "medications": "Topical benzoyl peroxide"}'::jsonb,
ARRAY['Severity', 'Topical retinoid', 'Oral antibiotic if moderate', 'Pregnancy counselling if systemic', 'Follow-up'],
'**Priming Focus:** Step up: add topical retinoid or consider oral antibiotic (e.g. lymecycline) if moderate. Pregnancy counselling if considering COCP or oral retinoid in future. Realistic expectations; follow-up.

**Examiner Lens:** Adolescent-friendly, safe prescribing.',
180, 'easy', false, true),

-- 27. Diverticular disease (gastroenterology)
('priming', 'Mr Bell - Diverticulosis',
'68-year-old man with known diverticulosis. Episode of left-sided pain and loose stool 1 week ago, settled. Wants to know what to eat and if he needs antibiotics next time.',
'{"name": "Mr Bell", "age": 68, "gender": "Male", "pmh": "Diverticulosis", "medications": "None"}'::jsonb,
ARRAY['Diet (fibre)', 'When to use antibiotics', 'Safety-netting', 'Surgery rarely', 'Follow-up'],
'**Priming Focus:** High-fibre diet when well. Antibiotics only if unwell, fever, or persistent. Safety-net: severe pain, fever, peritonism → urgent. Avoid routine antibiotics for mild episodes.

**Examiner Lens:** Patient education, stewardship.',
180, 'easy', false, true),

-- 28. Request for travel vaccines (preventive)
('priming', 'Ms Cole - Travel to India',
'28-year-old woman travelling to India for 3 weeks in 6 weeks. Wants to know what vaccines she needs. Had childhood vaccines. Last tetanus 5 years ago.',
'{"name": "Ms Cole", "age": 28, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Destination and itinerary', 'Hepatitis A, typhoid', 'Tetanus', 'Yellow fever if area', 'Malaria if indicated'],
'**Priming Focus:** Hepatitis A, typhoid for India. Tetanus if due. Yellow fever only if entering endemic area. Malaria prophylaxis depending on region. Travel clinic or practice nurse; document.

**Examiner Lens:** Travel medicine basics.',
180, 'easy', false, true),

-- 29. Polymyalgia (rheumatology)
('priming', 'Mrs Drew - Shoulder and Hip Stiffness',
'72-year-old woman with bilateral shoulder and hip stiffness for 3 weeks. Worse in morning, >1 hour. No joint swelling. ESR 85. Feeling generally unwell.',
'{"name": "Mrs Drew", "age": 72, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['PMR vs GCA', 'ESR', 'Steroid trial', 'Exclude GCA', 'Follow-up'],
'**Priming Focus:** Consider PMR (age, bilateral shoulder/hip, morning stiffness, raised ESR). Exclude GCA (headache, jaw claudication, visual symptoms). Steroid trial for PMR; urgent if GCA features.

**Examiner Lens:** Red flag (GCA), appropriate treatment.',
180, 'hard', true, true),

-- 30. Request for stronger painkillers (pain / safeguarding)
('priming', 'Mr Edge - Wants Stronger Pain Relief',
'48-year-old man with chronic back pain. On co-codamol 30/500 TDS. Wants "something stronger" – tramadol or morphine. No red flags. History of anxiety.',
'{"name": "Mr Edge", "age": 48, "gender": "Male", "pmh": "Chronic back pain", "medications": "Co-codamol"}'::jsonb,
ARRAY['Multimodal approach', 'Avoid routine strong opioids', 'Physio, pacing', 'Dependence risk', 'Safeguarding'],
'**Priming Focus:** NICE: avoid opioids for chronic non-cancer pain where possible. Multimodal: physio, pacing, NSAID if appropriate. Strong opioids: dependence, limited benefit. Explore function and expectations.

**Examiner Lens:** Safe prescribing, guideline adherence.',
180, 'medium', true, true),

-- 31. New mole (dermatology)
('priming', 'Ms Ford - Changing Mole',
'34-year-old woman noticed mole on arm has got darker and slightly larger over 6 months. No bleeding, no itch. Fair skin, family history of melanoma in aunt.',
'{"name": "Ms Ford", "age": 34, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['ABCDE', '2WW referral', 'Do not reassure', 'Document', 'Safety-netting'],
'**Priming Focus:** Changing mole + family history → 2WW dermatology or melanoma referral. ABCDE criteria. Do not falsely reassure. Document size, appearance. Safety-net: rapid change, bleeding.

**Examiner Lens:** Cancer safety, referral criteria.',
180, 'medium', false, true),

-- 32. Cough and weight loss (respiratory / cancer)
('priming', 'Mr Gray - Cough and Weight Loss',
'62-year-old man with cough for 6 weeks and weight loss of 6 kg. Ex-smoker 2 years (30 pack-years). No haemoptysis. No fever. Appetite reduced.',
'{"name": "Mr Gray", "age": 62, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Lung cancer 2WW', 'CXR', 'Red flags', 'Do not delay', 'Support'],
'**Priming Focus:** Cough + weight loss + smoking history → 2WW lung cancer referral. CXR as part of workup. Do not delay. Support patient; acknowledge concern.

**Examiner Lens:** Cancer recognition, timely referral.',
180, 'hard', false, true),

-- 33. New-onset tremor (neurology)
('priming', 'Mr Hill - Shaky Hands',
'70-year-old man with tremor in both hands for 4 months. Worse at rest, improves with action. Slow movement, small handwriting. No family history of Parkinson''s.',
'{"name": "Mr Hill", "age": 70, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Parkinsonism vs essential tremor', 'Referral', 'Do not start levodopa without diagnosis', 'Safety-netting', 'Support'],
'**Priming Focus:** Rest tremor, bradykinesia → consider Parkinson''s. Refer to neurology. Do not start levodopa without specialist diagnosis. Differentiate from essential tremor (action tremor). Support and safety-net.

**Examiner Lens:** Neurological referral, avoid premature treatment.',
180, 'medium', true, true),

-- 34. Request for vitamin D (preventive)
('priming', 'Mrs Iqbal - Wants Vitamin D',
'55-year-old woman read about vitamin D and wants a test and supplement. Works indoors, dark skin. No bone pain, no falls. Eats little dairy.',
'{"name": "Mrs Iqbal", "age": 55, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Risk factors', 'Test or treat', 'Dose', 'Calcium', 'Follow-up'],
'**Priming Focus:** At-risk: indoor, dark skin, low intake. Consider supplement (e.g. 800 IU daily) or check level. Treat if deficient. Calcium intake. Follow-up if treating.

**Examiner Lens:** Prevention, simple advice.',
180, 'easy', false, true),

-- 35. Otitis externa (ENT)
('priming', 'Mr Jones - Sore Ear',
'40-year-old man with painful right ear for 3 days. No discharge until today – slight. Swims regularly. No hearing loss. No fever.',
'{"name": "Mr Jones", "age": 40, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Otitis externa', 'Ear drops', 'Keep dry', 'Red flags', 'Follow-up'],
'**Priming Focus:** Otitis externa: topical acetic acid or antibiotic/steroid drops. Keep ear dry (swimming). Red flags: cellulitis, diabetes, immunosuppression → consider oral antibiotics. Safety-net: worsening, spreading redness.

**Examiner Lens:** Simple ENT management.',
180, 'easy', false, true),

-- 36. Request for referral (administrative)
('priming', 'Mrs King - Wants to See a Specialist',
'58-year-old woman with knee pain for 1 year. Tried physio and painkillers. Wants referral to orthopaedic surgeon. No locking, no instability. X-ray 6 months ago showed mild OA.',
'{"name": "Mrs King", "age": 58, "gender": "Female", "pmh": "None", "medications": "Paracetamol, ibuprofen"}'::jsonb,
ARRAY['Referral criteria', 'Conservative options', 'Shared decision', 'Refer if indicated', 'Expectations'],
'**Priming Focus:** NICE: refer if severe pain despite conservative treatment, or consideration for surgery. Discuss expectations (waiting times, surgery not always offered). Shared decision. Refer if meets criteria.

**Examiner Lens:** Appropriate referral, patient expectations.',
180, 'easy', false, true),

-- 37. Leg cramps (general)
('priming', 'Mr Lewis - Night Cramps',
'65-year-old man with nocturnal leg cramps for 3 months. Calf muscles. Wakes him 2–3 times per week. On bendroflumethiazide for hypertension. No peripheral oedema.',
'{"name": "Mr Lewis", "age": 65, "gender": "Male", "pmh": "Hypertension", "medications": "Bendroflumethiazide"}'::jsonb,
ARRAY['Electrolytes', 'Diuretic', 'Quinine only if severe', 'Stretching', 'Safety-netting'],
'**Priming Focus:** Check U&E (diuretic). Stretching before bed. Quinine only if cramps are severe and affecting quality of life (short trial). Consider diuretic review. Avoid long-term quinine without indication.

**Examiner Lens:** Evidence-based, avoid over-treatment.',
180, 'easy', false, true),

-- 38. Recurrent thrush (women''s health)
('priming', 'Ms Mason - Thrush Again',
'30-year-old woman with fourth episode of thrush in 6 months. Each time treated with clotrimazole. No diabetes, not on antibiotics. Wants long-term solution.',
'{"name": "Ms Mason", "age": 30, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Confirm diagnosis', 'Predisposing factors', 'Maintenance treatment', 'Diabetes screen', 'Follow-up'],
'**Priming Focus:** Recurrent thrush: exclude diabetes, review triggers. Consider maintenance fluconazole (e.g. weekly for 6 months). Rule out other causes of symptoms. Follow-up.

**Examiner Lens:** Recurrent condition management.',
180, 'medium', false, true),

-- 39. Request for scan (investigation)
('priming', 'Mr North - Wants Full Body Scan',
'50-year-old man read about private full body scans. Wants to "catch anything early". No symptoms. Family history of bowel cancer in father at 60.',
'{"name": "Mr North", "age": 50, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Screening programmes', 'Bowel cancer screening', 'Risks of unnecessary imaging', 'Family history', 'Reassurance'],
'**Priming Focus:** No routine role for full body scan in asymptomatic. Bowel cancer screening at 60 (or earlier if family history). Explain risks of incidental findings, over-investigation. Offer appropriate screening (e.g. FOBT when eligible).

**Examiner Lens:** Appropriate investigation, patient education.',
180, 'medium', false, true),

-- 40. Dizziness in elderly (geriatrics)
('priming', 'Mrs Owen - Dizzy on Standing',
'78-year-old woman with dizziness when standing for 2 months. No vertigo, no hearing change. On ramipril, bendroflumethiazide, omeprazole. Had one fall, no injury.',
'{"name": "Mrs Owen", "age": 78, "gender": "Female", "pmh": "Hypertension", "medications": "Ramipril, Bendroflumethiazide, Omeprazole"}'::jsonb,
ARRAY['Postural hypotension', 'Lying/standing BP', 'Medication review', 'Falls assessment', 'Safety-netting'],
'**Priming Focus:** Postural hypotension likely. Lying and standing BP. Review antihypertensive and diuretic; consider dose reduction. Falls assessment. Safety-net: syncope, head injury.

**Examiner Lens:** Polypharmacy, falls prevention.',
180, 'medium', false, true);
