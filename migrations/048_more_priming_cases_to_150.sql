-- Migration 048: Third batch of priming cases (50 more) to reach 150 total
-- Run after 046. Total priming after this: 35 (001) + 25 (045) + 40 (046) + 50 = 150.

INSERT INTO sca_cases (case_type, title, scenario, patient_info, key_points, model_answer, time_limit, difficulty, is_pro, published)
VALUES
-- 1. Acne in teenager (dermatology)
('priming', 'Jake - Spots Getting Worse',
'15-year-old boy with facial acne for 6 months. Tried over-the-counter benzoyl peroxide with little improvement. No scarring yet. Worried about starting school.',
'{"name": "Jake", "age": 15, "gender": "Male", "pmh": "None", "medications": "Benzoyl peroxide wash"}'::jsonb,
ARRAY['Severity', 'Topical options', 'Oral antibiotics if moderate', 'Isotretinoin criteria', 'Psychosocial impact'],
'**Priming Focus:** Assess severity (comedonal vs inflammatory). Topical: benzoyl peroxide, topical retinoid, topical ab. Moderate: add oral antibiotic (e.g. lymecycline). Isotretinoin only if severe/scarring. Address psychosocial impact.

**Examiner Lens:** Adolescent health, stepped approach.',
180, 'easy', false, true),

-- 2. Palpitations in young woman (cardiovascular)
('priming', 'Ms Patel - Heart Racing',
'28-year-old woman with intermittent palpitations for 2 months. Lasts seconds, no syncope. More when stressed. Drinks 4 coffees daily. No thyroid or cardiac history.',
'{"name": "Ms Patel", "age": 28, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Red flags', 'Caffeine and stress', 'ECG if indicated', 'Reassurance', 'Safety-netting'],
'**Priming Focus:** Often benign (anxiety, caffeine). Red flags: syncope, chest pain, family history sudden death. Consider ECG; 24-hour tape if frequent. Reduce caffeine, stress. Reassure if no red flags.

**Examiner Lens:** Don''t over-investigate; don''t miss serious.',
180, 'easy', false, true),

-- 3. Toddler with croup (paediatrics)
('priming', 'Noah - Barking Cough',
'2-year-old boy with barking cough and stridor for 2 days. Worse at night. Mild fever. Drinking and feeding. No drooling, no distress at rest.',
'{"name": "Noah", "age": 2, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Croup vs epiglottitis', 'Severity', 'Dexamethasone', 'Steam/cool air', 'Safety-netting'],
'**Priming Focus:** Croup: viral, dexamethasone single dose. Epiglottitis: drooling, toxic, sit forward – 999. Mild croup: home, fluids, steam/cool air. Safety-net: worsening stridor, distress, unable to drink.

**Examiner Lens:** Paediatric respiratory, red flags.',
180, 'medium', false, true),

-- 4. Request for sick note (administrative)
('priming', 'Mr Quinn - Sick Note for Work',
'34-year-old man with viral illness for 5 days. Improving. Employer wants a fit note for days already missed. Back to normal activities today.',
'{"name": "Mr Quinn", "age": 34, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Retrospective note', 'Self-certification', 'Fit note rules', 'Duration', 'Advice'],
'**Priming Focus:** First 7 days can be self-certified. Fit note can be backdated. If now fit, can state "fit from [date]". No need for examination if straightforward. Brief advice on return to work.

**Examiner Lens:** Administrative competence.',
180, 'easy', false, true),

-- 5. Shoulder pain (MSK)
('priming', 'Mrs Reid - Painful Shoulder',
'55-year-old woman with right shoulder pain for 6 weeks. No trauma. Worse on reaching and at night. No weakness or numbness. Not improving with ibuprofen.',
'{"name": "Mrs Reid", "age": 55, "gender": "Female", "pmh": "None", "medications": "Ibuprofen"}'::jsonb,
ARRAY['Rotator cuff vs frozen shoulder', 'Examination', 'Physio', 'Imaging if needed', 'Injections'],
'**Priming Focus:** Rotator cuff tendinopathy vs frozen shoulder. Rest, analgesia, physio first line. Consider steroid injection if significant. Imaging if red flags or no improvement. Safety-net: trauma, red flags.

**Examiner Lens:** MSK assessment, stepped care.',
180, 'medium', false, true),

-- 6. Hay fever (ENT / allergy)
('priming', 'Ms Shaw - Hay Fever Every Year',
'22-year-old woman with seasonal rhinitis. Itchy eyes, sneezing, blocked nose. Tried cetirizine with some help. Wants something stronger. Exams in 2 weeks.',
'{"name": "Ms Shaw", "age": 22, "gender": "Female", "pmh": "Asthma (mild)", "medications": "Cetirizine, salbutamol PRN"}'::jsonb,
ARRAY['Step-up treatment', 'Nasal steroid', 'Eye drops', 'Antihistamine choice', 'Asthma review'],
'**Priming Focus:** Add nasal corticosteroid (first line). Consider eye drops if ocular symptoms. Oral antihistamine: non-sedating. Ensure asthma controlled. Avoid sedating antihistamines if studying.

**Examiner Lens:** Allergy management, exam stress.',
180, 'easy', false, true),

-- 7. Reflux in baby (paediatrics)
('priming', 'Baby Theo - Posseting and Crying',
'8-week-old baby, parents say he brings up milk after feeds and cries. Growing well, no blood in vomit. Breastfed. Parents exhausted.',
'{"name": "Baby Theo", "age": 0, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['GOR vs GORD', 'Red flags', 'Positioning', 'Feeding advice', 'Reassurance'],
'**Priming Focus:** Reflux common; GOR vs GORD. Red flags: poor growth, blood, bile, respiratory symptoms. Reassure if thriving. Positioning, smaller frequent feeds, burping. Consider alginate if significant. Support parents.

**Examiner Lens:** Infant feeding, parental reassurance.',
180, 'medium', false, true),

-- 8. Low mood in new father (mental health)
('priming', 'Mr Upton - Can''t Cope Since Baby',
'30-year-old man, baby 3 months old. Low mood, poor sleep, irritable. Partner struggling too. No thoughts of harm. Says he''s "not himself".',
'{"name": "Mr Upton", "age": 30, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Paternal postnatal depression', 'Risk assessment', 'Support', 'Self-help', 'Follow-up'],
'**Priming Focus:** Paternal postnatal low mood. Assess severity, risk (self, baby). Support: sleep, practical help, talking. Consider psychological therapy. Don''t dismiss; involve partner. Safety-net: worsening, risk.

**Examiner Lens:** Male mental health, perinatal.',
180, 'medium', false, true),

-- 9. Mole check (dermatology)
('priming', 'Mrs Vale - Mole Changed',
'44-year-old woman noticed mole on arm has got darker and slightly larger over 6 months. No bleeding, no itch. Fair skin, family history of melanoma in aunt.',
'{"name": "Mrs Vale", "age": 44, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['ABCDE', '2WW referral', 'Examination', 'Reassurance if benign', 'Sun safety'],
'**Priming Focus:** Change in mole + family history → 2WW dermatology. ABCDE criteria. Examine if possible; if suspicious, refer. Reassure if clearly benign. Sun safety advice.

**Examiner Lens:** Cancer safety, referral criteria.',
180, 'medium', false, true),

-- 10. Blood in urine (urology)
('priming', 'Mr Webb - Blood in Urine',
'60-year-old man had one episode of visible blood in urine 1 week ago. No pain, no frequency, no fever. No recurrence. Non-smoker. No anticoagulants.',
'{"name": "Mr Webb", "age": 60, "gender": "Male", "pmh": "Hypertension", "medications": "Amlodipine"}'::jsonb,
ARRAY['Visible haematuria', '2WW urology', 'Urine dip', 'Bladder cancer risk', 'Safety-netting'],
'**Priming Focus:** Visible haematuria in adult → 2WW urology (bladder cancer until proven otherwise). Urine dip, culture. Don''t delay referral. Safety-net: recurrence, pain, fever.

**Examiner Lens:** Cancer referral, haematuria pathway.',
180, 'medium', false, true),

-- 11. Teenager with headache (neurology / paediatrics)
('priming', 'Ella - Headaches at School',
'14-year-old girl with recurrent headaches for 2 months. Front of head, sometimes with nausea. No vision change, no worse in morning. Missing some school.',
'{"name": "Ella", "age": 14, "gender": "Female", "pmh": "None", "medications": "Paracetamol"}'::jsonb,
ARRAY['Tension vs migraine', 'Red flags', 'Diary', 'Lifestyle', 'Treatment'],
'**Priming Focus:** Tension-type vs migraine. Red flags: sudden onset, worst ever, morning vomiting, neurological signs. Headache diary. Lifestyle: sleep, screen time, hydration. Simple analgesia; consider triptan if migraine. Safety-net: red flags.

**Examiner Lens:** Adolescent headache, red flags.',
180, 'easy', false, true),

-- 12. Statin side effects (cardiovascular)
('priming', 'Mr Xavier - Muscle Aches on Statin',
'62-year-old man on atorvastatin 20mg for 2 years. Muscle aches for 3 months. No weakness. CK not checked. Wants to stop. CV risk high.',
'{"name": "Mr Xavier", "age": 62, "gender": "Male", "pmh": "T2DM, IHD", "medications": "Atorvastatin, Metformin, Aspirin"}'::jsonb,
ARRAY['CK check', 'Statin intolerance', 'Alternatives', 'Ezetimibe', 'Risk discussion'],
'**Priming Focus:** Check CK; if normal, consider statin-related myalgia. Options: dose reduction, switch statin, alternate day, ezetimibe. Don''t stop without alternative (high risk). Discuss benefit vs harm.

**Examiner Lens:** Statin intolerance, shared decision.',
180, 'medium', false, true),

-- 13. Vaginal discharge (women''s health)
('priming', 'Ms Young - Discharge and Itch',
'26-year-old woman with vaginal discharge and itch for 1 week. No odour. No dysuria. Sexual partner same for 1 year. Never had STI check.',
'{"name": "Ms Young", "age": 26, "gender": "Female", "pmh": "None", "medications": "COCP"}'::jsonb,
ARRAY['Candidiasis vs BV vs STI', 'Swabs', 'Empiric treatment', 'Partner notification', 'Safeguarding'],
'**Priming Focus:** Consider thrush, BV, chlamydia. Swabs if recurrent or risk factors. Empiric treatment for thrush/BV if typical. Offer STI screen. Partner notification if STI. Safeguarding if appropriate.

**Examiner Lens:** Sexual health, non-judgmental.',
180, 'easy', false, true),

-- 14. Chronic fatigue (general)
('priming', 'Mrs Zhang - Always Tired',
'45-year-old woman with tiredness for 1 year. Full-time job, two children. Sleeps 7 hours but unrefreshed. No low mood. Bloods 6 months ago normal.',
'{"name": "Mrs Zhang", "age": 45, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Differential', 'Lifestyle', 'Sleep quality', 'Anaemia/thyroid', 'ME/CFS criteria'],
'**Priming Focus:** Exclude anaemia, thyroid, diabetes. Sleep hygiene, stress, overwork. Consider ME/CFS if >4 months, post-exertional malaise. Don''t over-investigate; support and pacing. Follow-up.

**Examiner Lens:** Unexplained fatigue, holistic.',
180, 'medium', false, true),

-- 15. Nail infection (dermatology)
('priming', 'Mr Adams - Infected Toenail',
'58-year-old man with painful, red swollen toe for 3 days. No injury. Diabetic, well controlled. No fever. Can walk but painful.',
'{"name": "Mr Adams", "age": 58, "gender": "Male", "pmh": "Type 2 diabetes", "medications": "Metformin"}'::jsonb,
ARRAY['Cellulitis vs paronychia', 'Diabetes', 'Antibiotics', 'Red flags', 'Foot care'],
'**Priming Focus:** Paronychia vs cellulitis. Diabetic → higher risk. Oral flucloxacillin if cellulitis. Consider referral if severe or diabetic. Red flags: spreading, fever, systemic. Foot care advice.

**Examiner Lens:** Diabetic foot awareness.',
180, 'medium', false, true),

-- 16. Request for vitamin D (prevention)
('priming', 'Mrs Bell - Wants Vitamin D Test',
'50-year-old woman read about vitamin D and wants a test. No symptoms. Indoors most of the time. Wants to "optimise" levels.',
'{"name": "Mrs Bell", "age": 50, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['NICE guidance', 'At-risk groups', 'Supplement without testing', 'When to test', 'Dose'],
'**Priming Focus:** NICE: don''t routinely test. At-risk: housebound, dark skin, no sun exposure, osteoporosis. Offer supplement (400–800 IU) in winter without testing. Test if deficiency suspected (symptoms, risk). Explain rationale.

**Examiner Lens:** Resource stewardship, prevention.',
180, 'easy', false, true),

-- 17. Cough after COVID (respiratory)
('priming', 'Mr Cole - Cough Since COVID',
'48-year-old man had COVID 6 weeks ago. Still has dry cough. No fever, no breathlessness at rest. Oximetry normal when unwell. Wants something to stop it.',
'{"name": "Mr Cole", "age": 48, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Post-viral cough', 'Red flags', 'Symptom control', 'Inhaled steroids?', 'Safety-netting'],
'**Priming Focus:** Post-viral cough can last weeks. Red flags: haemoptysis, weight loss, breathlessness. Symptom control: simple linctus, honey. Inhaled steroid only if wheeze. Reassure; safety-net. Consider CXR if prolonged or red flags.

**Examiner Lens:** Long COVID awareness.',
180, 'easy', false, true),

-- 18. Elbow pain (MSK)
('priming', 'Mrs Davis - Tennis Elbow',
'42-year-old woman with lateral elbow pain for 4 weeks. Started after painting. No trauma. Gripping makes it worse. Manual job.',
'{"name": "Mrs Davis", "age": 42, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Lateral epicondylitis', 'Rest and load', 'Physio', 'Brace', 'Injections'],
'**Priming Focus:** Lateral epicondylitis. Rest from aggravating activities, analgesia. Physio for eccentric exercises. Counter-force brace may help. Steroid injection if severe; discuss temporary relief. Return to work advice.

**Examiner Lens:** MSK, occupational.',
180, 'easy', false, true),

-- 19. Child with constipation (paediatrics)
('priming', 'Leo - Constipation',
'4-year-old boy with hard stools and soiling for 2 months. Toilet trained at 3. Pain on passing stool. Diet fussy. No red flags.',
'{"name": "Leo", "age": 4, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Diet and fluid', 'Disimpaction', 'Maintenance', 'Toileting routine', 'Follow-up'],
'**Priming Focus:** Constipation: diet, fluid, toileting routine. May need disimpaction (macrogol) then maintenance. Soiling is overflow – reassure parents. Long-term maintenance often needed. Red flags: onset <1 year, faltering growth.

**Examiner Lens:** Paediatric constipation pathway.',
180, 'medium', false, true),

-- 20. Anxiety and beta-blockers (mental health / prescribing)
('priming', 'Ms Evans - Wants Beta-Blockers for Nerves',
'24-year-old woman with exam anxiety. Wants propranolol for interview next week. Used a friend''s once and felt calmer. No asthma.',
'{"name": "Ms Evans", "age": 24, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Short-term use', 'Dose', 'Contraindications', 'Alternatives', 'Psychological support'],
'**Priming Focus:** Propranolol can be used short-term for situational anxiety. Low dose (e.g. 10–40 mg before event). Exclude asthma. Discuss alternatives: preparation, breathing, CBT. Avoid long-term without addressing cause.

**Examiner Lens:** Appropriate prescribing, anxiety.',
180, 'easy', false, true),

-- 21. Rash in pregnancy (dermatology / obstetrics)
('priming', 'Mrs Foster - Itchy Rash in Pregnancy',
'32-year-old woman, 34 weeks pregnant, itchy rash on abdomen and limbs for 1 week. No blisters. First pregnancy. LFTs not checked.',
'{"name": "Mrs Foster", "age": 32, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Polymorphic eruption', 'Obstetric cholestasis', 'LFTs', 'Topical treatment', 'Obstetric review'],
'**Priming Focus:** Polymorphic eruption of pregnancy vs obstetric cholestasis. Check LFTs (bile acids if itch predominant). Topical emollients, antihistamine. OC: itch, normal rash, risk of stillbirth – obstetric review. Reassure if PEP.

**Examiner Lens:** Pregnancy rash, OC exclusion.',
180, 'hard', false, true),

-- 22. Chest infection in COPD (respiratory)
('priming', 'Mr Green - Chest Infection',
'68-year-old man with COPD, on inhalers. Increased cough, green sputum, breathlessness for 3 days. No fever. Usually manages at home.',
'{"name": "Mr Green", "age": 68, "gender": "Male", "pmh": "COPD", "medications": "Seretide, tiotropium"}'::jsonb,
ARRAY['Exacerbation', 'Antibiotics and steroids', 'Rescue pack', 'Hospital criteria', 'Safety-netting'],
'**Priming Focus:** COPD exacerbation. Consider antibiotics (purulent sputum, increased breathlessness) and oral steroids. Check rescue pack. Hospital if severe (respiratory rate, hypoxia, confusion). Safety-net: worsening, when to call 999.

**Examiner Lens:** COPD exacerbation management.',
180, 'medium', false, true),

-- 23. Teenager with period pain (women''s health / paediatrics)
('priming', 'Mia - Bad Period Pains',
'16-year-old girl with severe dysmenorrhoea for 1 year. Missing school monthly. Regular cycles. No heavy bleeding. Not sexually active.',
'{"name": "Mia", "age": 16, "gender": "Female", "pmh": "None", "medications": "Paracetamol, ibuprofen"}'::jsonb,
ARRAY['Primary dysmenorrhoea', 'NSAIDs', 'COCP', 'Red flags', 'School support'],
'**Priming Focus:** Primary dysmenorrhoea likely. NSAIDs first line (start before pain). COCP can help. Exclude secondary causes if red flags (heavy bleeding, pain not just with periods). School letter if needed.

**Examiner Lens:** Adolescent gynaecology.',
180, 'easy', false, true),

-- 24. Lump in breast (women''s health)
('priming', 'Mrs Hill - Lump in Breast',
'52-year-old woman found lump in left breast 1 week ago. No pain, no nipple change. Periods regular. No family history of breast cancer.',
'{"name": "Mrs Hill", "age": 52, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['2WW breast', 'Examination', 'Triple assessment', 'Reassurance', 'Safety-netting'],
'**Priming Focus:** New discrete lump → 2WW breast. Examine if competent; refer regardless (triple assessment). Don''t reassure without referral. Safety-net: change in size, pain, nipple.

**Examiner Lens:** Cancer referral, breast lump.',
180, 'medium', false, true),

-- 25. DVT query (vascular)
('priming', 'Mr Innes - Calf Swollen and Painful',
'45-year-old man with swollen, painful left calf for 2 days. No recent travel or immobility. Slight redness. No fever. Works at desk.',
'{"name": "Mr Innes", "age": 45, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Wells score', 'DVT', 'D-dimer vs scan', 'Anticoagulation', 'Safety-netting'],
'**Priming Focus:** Wells score for DVT. If likely DVT, refer for same-day imaging/anticoagulation. D-dimer if low probability. Don''t delay if high probability. Safety-net: chest pain, breathlessness (PE).

**Examiner Lens:** DVT pathway, Wells.',
180, 'medium', false, true),

-- 26. Earwax (ENT)
('priming', 'Mrs Jones - Blocked Ear',
'70-year-old woman with blocked right ear for 2 weeks. Hearing reduced. No pain, no discharge. Tried olive oil drops. No vertigo.',
'{"name": "Mrs Jones", "age": 70, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Earwax', 'Drops', 'Irrigation', 'Red flags', 'Hearing'],
'**Priming Focus:** Likely earwax. Oil drops 3–5 days then consider irrigation or manual removal (if trained). Avoid irrigation if perforation, infection, grommets. Red flags: pain, discharge, unilateral. Consider hearing referral if persistent.

**Examiner Lens:** ENT, older person.',
180, 'easy', false, true),

-- 27. New diabetes diagnosis (endocrine)
('priming', 'Mr Khan - Just Diagnosed Diabetic',
'55-year-old man, HbA1c 58 last week. No symptoms. BMI 31. Shocked by diagnosis. Wants to know what to do. Father had diabetes.',
'{"name": "Mr Khan", "age": 55, "gender": "Male", "pmh": "Hypertension", "medications": "Amlodipine"}'::jsonb,
ARRAY['Lifestyle', 'Metformin', 'Education', 'Retinal/feet', 'Follow-up'],
'**Priming Focus:** New T2DM: lifestyle (diet, weight, exercise), metformin first line. Diabetes education, annual retinal and foot check. Address shock, involve in plan. Follow-up for review.

**Examiner Lens:** New diagnosis, patient education.',
180, 'medium', false, true),

-- 28. Safeguarding concern (safeguarding)
('priming', 'Mrs Leigh - Bruises on Child',
'Practice nurse saw 3-year-old at immunisations. Mother said child fell. Multiple bruises of different ages on legs and one on arm. Child cheerful, developing normally.',
'{"name": "Mrs Leigh", "age": 28, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Safeguarding', 'Documentation', 'Discussion', 'Referral', 'Multiagency'],
'**Priming Focus:** Unexplained bruises, different ages → safeguarding concern. Document carefully. Discuss with safeguarding lead. Consider referral to children''s social care. Don''t investigate alone; follow policy.

**Examiner Lens:** Safeguarding, documentation.',
180, 'hard', false, true),

-- 29. Request for MRI (investigation)
('priming', 'Mr Moore - Wants MRI for Back',
'45-year-old man with low back pain for 6 weeks. No red flags. Tried physio and ibuprofen. Wants MRI "to see what''s wrong".',
'{"name": "Mr Moore", "age": 45, "gender": "Male", "pmh": "None", "medications": "Ibuprofen"}'::jsonb,
ARRAY['NICE back pain', 'Imaging not routine', 'Red flags', 'Continue physio', 'Reassurance'],
'**Priming Focus:** NICE: don''t routinely image non-specific LBP. Red flags: cauda equina, fracture, infection, cancer. Reassure; continue physio and analgesia. MRI only if red flags or persistent with concern.

**Examiner Lens:** Appropriate investigation.',
180, 'easy', false, true),

-- 30. Travel vaccination (prevention)
('priming', 'Ms Naylor - Jabs for Holiday',
'28-year-old woman travelling to Thailand for 2 weeks in 6 weeks. Wants to know what jabs she needs. Last tetanus 5 years ago.',
'{"name": "Ms Naylor", "age": 28, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Travel health', 'Hep A/B', 'Typhoid', 'Tetanus', 'Malaria'],
'**Priming Focus:** Travel health: destination, activities, accommodation. Thailand: Hep A, typhoid, tetanus if due. Consider Hep B, rabies if risk. Malaria risk areas. Signpost to travel clinic if complex.

**Examiner Lens:** Travel medicine basics.',
180, 'easy', false, true),

-- 31. Hoarse voice (ENT)
('priming', 'Mr Owen - Hoarse for 6 Weeks',
'60-year-old man with hoarse voice for 6 weeks. Smoker 20/day for 40 years. No pain, no swallowing difficulty. No weight loss.',
'{"name": "Mr Owen", "age": 60, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['2WW ENT', 'Laryngeal cancer', 'Smoking', 'Red flags', 'Examination'],
'**Priming Focus:** Persistent hoarseness + smoker → 2WW ENT. Red flags: dysphagia, weight loss, neck lump. Don''t delay. Smoking cessation. Examine neck if possible; refer regardless.

**Examiner Lens:** Cancer referral, smoking.',
180, 'medium', false, true),

-- 32. Child with head lice (paediatrics / dermatology)
('priming', 'Parents of Poppy - Nits at School',
'Parents of 6-year-old girl. School sent note about head lice. No live lice seen. Tried lotion once. Want to know what to do.',
'{"name": "Poppy", "age": 6, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Detection', 'Treatment', 'Wet combing', 'Contacts', 'School'],
'**Priming Focus:** Only treat if live lice. Wet combing or dimeticone/lotion. Repeat after 7 days. Check household contacts. No need to stay off school. Reassure about stigma.

**Examiner Lens:** Common condition, parental advice.',
180, 'easy', false, true),

-- 33. Anticoagulation and dental (anticoagulation)
('priming', 'Mr Price - Dentist Said Stop Warfarin',
'72-year-old man on warfarin for AF. Dentist said to stop warfarin before extraction. INR usually 2–3. Wants to know if safe.',
'{"name": "Mr Price", "age": 72, "gender": "Male", "pmh": "AF", "medications": "Warfarin"}'::jsonb,
ARRAY['Bleeding risk', 'Continue vs interrupt', 'Guidance', 'Dentist liaison', 'Individualise'],
'**Priming Focus:** Many dental extractions can be done on warfarin (local measures). Balance stroke vs bleeding. Periprocedural management: often continue; sometimes omit 1–2 doses. Liaise with dentist. Individualise by risk.

**Examiner Lens:** Anticoagulation, peri-procedural.',
180, 'medium', false, true),

-- 34. Teenager with acne requesting Roaccutane (dermatology / paediatrics)
('priming', 'Ryan - Wants Roaccutane',
'17-year-old boy with moderate acne. Failed topical and 6 months oral antibiotics. Wants isotretinoin. Depressed mood in past, now better. No current mental health care.',
'{"name": "Ryan", "age": 17, "gender": "Male", "pmh": "Depression (resolved)", "medications": "None"}'::jsonb,
ARRAY['Criteria', 'Mental health', 'Pregnancy prevention', 'Referral', 'Monitoring'],
'**Priming Focus:** Isotretinoin: usually secondary care. History of depression – assess current mood; not absolute contraindication but caution. Pregnancy prevention critical (teratogenic). Refer to dermatology; don''t start in primary care.

**Examiner Lens:** Adolescent, mental health, teratogenicity.',
180, 'hard', false, true),

-- 35. Elderly with urinary incontinence (geriatrics)
('priming', 'Mrs Smith - Leaking Urine',
'78-year-old woman with urinary incontinence for 6 months. Leaks when coughing and when hurrying to toilet. No dysuria. Limiting her outings.',
'{"name": "Mrs Smith", "age": 78, "gender": "Female", "pmh": "Hypertension", "medications": "Amlodipine"}'::jsonb,
ARRAY['Stress vs urge', 'Pelvic floor', 'Red flags', 'Pad provision', 'Referral'],
'**Priming Focus:** Likely stress incontinence. Pelvic floor exercises first line. Exclude UTI, haematuria. Consider pad provision. Refer if failed conservative or mixed/urge. Don''t normalise; treat.

**Examiner Lens:** Geriatric, quality of life.',
180, 'medium', false, true),

-- 36. Request for ADHD assessment (mental health)
('priming', 'Mr Tate - Thinks He Has ADHD',
'24-year-old man read about ADHD. Difficulty concentrating at work, procrastination. No childhood history of problems at school. Wants referral for assessment.',
'{"name": "Mr Tate", "age": 24, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Differential', 'Childhood history', 'Referral criteria', 'Waiting times', 'Support'],
'**Priming Focus:** ADHD requires childhood onset. Explore school history, concentration, impulsivity. Differential: anxiety, depression, sleep. Refer if criteria met; long waits. Support while waiting. Don''t dismiss.

**Examiner Lens:** Adult ADHD, appropriate referral.',
180, 'medium', false, true),

-- 37. New atrial fibrillation (cardiovascular)
('priming', 'Mr Underwood - Irregular Pulse',
'70-year-old man, irregular pulse found at routine check. No palpitations. Well. BP 145/88. No history of stroke or TIA. CHA2DS2-VASc to consider.',
'{"name": "Mr Underwood", "age": 70, "gender": "Male", "pmh": "Hypertension", "medications": "Amlodipine"}'::jsonb,
ARRAY['ECG', 'Rate vs rhythm', 'Anticoagulation', 'CHA2DS2-VASc', 'Referral'],
'**Priming Focus:** Confirm AF with ECG. Rate control if symptomatic. CHA2DS2-VASc for stroke risk; anticoagulate if ≥2 (male) or ≥3 (female) unless contraindicated. Consider cardiology. Address hypertension.

**Examiner Lens:** AF management, anticoagulation.',
180, 'hard', false, true),

-- 38. Teenager with sleep problems (paediatrics / mental health)
('priming', 'Violet - Can''t Sleep',
'15-year-old girl with insomnia for 2 months. On phone until late. Exams soon. Anxious. No low mood. Parents want sleeping tablets for her.',
'{"name": "Violet", "age": 15, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Sleep hygiene', 'Screen time', 'Anxiety', 'Avoid hypnotics', 'CBT'],
'**Priming Focus:** Sleep hygiene, limit screens before bed. Address anxiety. Avoid hypnotics in adolescents. Melatonin only if indicated (e.g. neurodevelopmental). CBT for insomnia. Support for exams.

**Examiner Lens:** Adolescent sleep, avoid drugs.',
180, 'easy', false, true),

-- 39. Recurrent UTI (urology / women''s health)
('priming', 'Mrs Walsh - UTIs Again',
'55-year-old woman with third UTI in 6 months. Same symptoms each time. Responds to antibiotics. No haematuria. Post-menopausal.',
'{"name": "Mrs Walsh", "age": 55, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Recurrent UTI', 'Culture', 'Hygiene', 'Prophylaxis', 'Referral'],
'**Priming Focus:** Send culture. Hygiene advice. Consider prophylactic antibiotics (e.g. post-coital or low-dose). Consider vaginal oestrogen if post-menopausal. Refer if structural concern or failure.

**Examiner Lens:** Recurrent UTI management.',
180, 'medium', false, true),

-- 40. Chest pain in young person (cardiovascular)
('priming', 'Mr Xander - Chest Pain When Exercising',
'19-year-old man with central chest pain on exertion for 2 months. Lasts minutes. No family history of sudden death. Fit. No other symptoms.',
'{"name": "Mr Xander", "age": 19, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Cardiac vs non-cardiac', 'Family history', 'ECG', 'Hypertrophic cardiomyopathy', 'Referral'],
'**Priming Focus:** Exertional chest pain in young person: consider cardiac (e.g. HOCM). Family history important. ECG; consider echo/cardiology. Don''t dismiss. Safety-net: syncope, worsening.

**Examiner Lens:** Young person, cardiac red flags.',
180, 'hard', false, true),

-- 41. Rash after antibiotics (dermatology / allergy)
('priming', 'Mrs Yates - Rash After Amoxicillin',
'40-year-old woman developed widespread rash 5 days after starting amoxicillin for sinusitis. Itchy, red. Stopped antibiotic 2 days ago. No fever, no mucosal involvement.',
'{"name": "Mrs Yates", "age": 40, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Drug rash', 'Allergy documentation', 'Avoid penicillin', 'Antihistamines', 'Safety-netting'],
'**Priming Focus:** Likely non-severe drug rash. Document penicillin allergy. Avoid penicillin/amoxicillin in future. Antihistamines for symptoms. Safety-net: blistering, mucosal involvement, fever (SJS/TEN). Consider allergy referral if unclear.

**Examiner Lens:** Drug allergy, documentation.',
180, 'medium', false, true),

-- 42. Child with viral wheeze (paediatrics / respiratory)
('priming', 'Zac - Wheezy With Cold',
'2-year-old boy, second episode of cough and wheeze with cold. Better with salbutamol at A&E last time. No atopy in family. Well between episodes.',
'{"name": "Zac", "age": 2, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Viral wheeze vs asthma', 'Salbutamol', 'Inhaler technique', 'Safety-netting', 'Follow-up'],
'**Priming Focus:** Viral wheeze common <5. Salbutamol PRN for episodes. Inhaler + spacer technique. Not necessarily asthma; don''t label early. Safety-net: severe distress, not responding. Follow-up if frequent.

**Examiner Lens:** Preschool wheeze.',
180, 'medium', false, true),

-- 43. Request for testosterone (endocrine / men''s health)
('priming', 'Mr Abbott - Tired and Wants Testosterone',
'45-year-old man with tiredness for 6 months. Read about low testosterone. No erectile dysfunction. Sleep poor. Stressful job.',
'{"name": "Mr Abbott", "age": 45, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Differential', 'Testosterone testing', 'When to test', 'Lifestyle', 'Avoid empiric'],
'**Priming Focus:** Tiredness: sleep, stress, depression, anaemia, thyroid first. Testosterone only if clinical suspicion (low libido, erectile dysfunction). Don''t test routinely for tiredness. Don''t give empiric testosterone.

**Examiner Lens:** Appropriate testing, men''s health.',
180, 'medium', false, true),

-- 44. Possible cauda equina (neurology / emergency)
('priming', 'Mr Bates - Back Pain and Numb Bottom',
'45-year-old man with severe back pain for 2 days. Now numbness in buttocks and perineum. Difficulty passing urine today. No leg weakness yet.',
'{"name": "Mr Bates", "age": 45, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Cauda equina', 'Emergency', 'Hospital', 'Saddle anaesthesia', 'Don''t delay'],
'**Priming Focus:** Cauda equina syndrome: saddle numbness, urinary retention, bilateral leg symptoms. Same-day emergency referral. Don''t delay; don''t order routine imaging first. 999 if acute retention or worsening.

**Examiner Lens:** Red flag emergency.',
180, 'hard', false, true),

-- 45. Palliative care - pain (palliative)
('priming', 'Mrs Clarke - Pain Not Controlled',
'72-year-old woman with metastatic breast cancer. On morphine MR 30mg BD. Still has breakthrough pain. Daughter worried she''s "suffering".',
'{"name": "Mrs Clarke", "age": 72, "gender": "Female", "pmh": "Breast cancer", "medications": "Morphine MR, paracetamol"}'::jsonb,
ARRAY['Breakthrough dose', 'Side effects', 'Adjuvants', 'Review', 'Family support'],
'**Priming Focus:** Breakthrough morphine (e.g. 5–10 mg PRN). Review total 24h dose. Consider adjuvants (e.g. NSAID, neuropathic). Constipation, nausea. Involve palliative team if complex. Support family.

**Examiner Lens:** Palliative care, pain control.',
180, 'medium', false, true),

-- 46. Medically unexplained symptoms (general)
('priming', 'Ms Drew - Multiple Unexplained Symptoms',
'38-year-old woman with fatigue, pain, dizziness for 1 year. Multiple negative tests. Convinced something is missed. Anxious. Affecting work.',
'{"name": "Ms Drew", "age": 38, "gender": "Female", "pmh": "Anxiety", "medications": "None"}'::jsonb,
ARRAY['MUS', 'Validation', 'Avoid over-investigation', 'Functional approach', 'Support'],
'**Priming Focus:** Medically unexplained symptoms: validate, avoid repeated tests. Explain functional approach. Focus on function, not cure. Consider CBT, physio. Single GP if possible. Don''t dismiss.

**Examiner Lens:** MUS, patient-centred.',
180, 'hard', false, true),

-- 47. Pre-conception advice (women''s health)
('priming', 'Mrs Ellis - Planning a Baby',
'30-year-old woman planning pregnancy in 6 months. On COCP. Wants to know what to do. Takes folic acid occasionally. Non-smoker.',
'{"name": "Mrs Ellis", "age": 30, "gender": "Female", "pmh": "None", "medications": "COCP"}'::jsonb,
ARRAY['Folic acid', 'Stop COCP', 'Pre-conception', 'Alcohol', 'Review meds'],
'**Priming Focus:** Folic acid 400 mcg before conception, 5 mg if high risk (diabetes, epilepsy, previous NTD). Stop COCP when ready. Pre-conception: rubella, cervical smear if due. Alcohol, smoking. Review any medications.

**Examiner Lens:** Pre-conception counselling.',
180, 'easy', false, true),

-- 48. Suicidal ideation (mental health)
('priming', 'Mr Ford - Low and Having Dark Thoughts',
'35-year-old man with low mood for 3 months. Recently started having thoughts of "not being here". No plan. No intent. No access to means. Asking for help.',
'{"name": "Mr Ford", "age": 35, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Risk assessment', 'Safety', 'Support', 'Follow-up', 'Crisis'],
'**Priming Focus:** Assess risk: ideas, plan, intent, means. No current plan/intent – still take seriously. Safety plan, crisis numbers. Follow-up soon. Consider psychological therapy. Don''t leave without plan.

**Examiner Lens:** Suicide risk, safety.',
180, 'hard', false, true),

-- 49. Hepatitis B positive (infectious disease)
('priming', 'Mr Gupta - Hepatitis B Positive',
'42-year-old man, hepatitis B surface antigen positive on bloods (routine health check). Asymptomatic. No known exposure. From endemic country. Liver USS normal.',
'{"name": "Mr Gupta", "age": 42, "gender": "Male", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Chronic HBV', 'LFTs', 'Viral load', 'Referral', 'Household'],
'**Priming Focus:** Chronic HBV: LFTs, viral load, consider fibrosis assessment. Refer to hepatology. Advise household/sexual contacts to test and vaccinate. Alcohol advice. Don''t reassure without specialist input.

**Examiner Lens:** Chronic infection, referral.',
180, 'medium', false, true),

-- 50. Bite from dog (trauma / infection)
('priming', 'Mrs Hunt - Dog Bite',
'50-year-old woman bitten by dog 2 days ago. Hand wound. Washed and dressed. No rabies risk. Wound slightly red. No fever. Tetanus up to date.',
'{"name": "Mrs Hunt", "age": 50, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Infection risk', 'Antibiotics', 'Tetanus', 'Rabies', 'Safety-netting'],
'**Priming Focus:** Dog bite: high infection risk. Co-amoxiclav 5–7 days (or doxycycline + metronidazole if penicillin allergic). Tetanus if not up to date. Rabies if from endemic area. Safety-net: spreading infection, fever.

**Examiner Lens:** Bite management, infection.',
180, 'easy', false, true);
