-- Migration: Import SCA Priming Cases from old OnCallPrep project
-- Run this in Supabase SQL Editor
-- Total: 35 priming cases for 3-minute priming practice

-- First, let's make sure we don't duplicate if run multiple times
DELETE FROM sca_cases WHERE case_type = 'priming';

-- Insert all priming cases
INSERT INTO sca_cases (case_type, title, scenario, patient_info, key_points, model_answer, time_limit, difficulty, is_pro, published)
VALUES
-- Case 1: Miss A - Lower abdominal pain
('priming', 'Miss A - Lower Abdominal Pain', 
'25-year-old female presenting with lower abdominal pain for two days. Last period was two weeks ago. Reports mild nausea but no vomiting or bowel change.',
'{"name": "Miss A", "age": 25, "gender": "Female", "pmh": "None significant", "medications": "Combined oral contraceptive pill"}'::jsonb,
ARRAY['Differentials: UTI, PID, ovarian pathology, ectopic pregnancy, appendicitis, IBS', 'Red flags: Fever, severe pain, vomiting, fainting, haemodynamic instability', 'Key history: Sexual activity, discharge, dysuria, pregnancy risk, contraception reliability', 'Investigations: Pregnancy test, STI swabs, urine dip, consider same-day review if PID suspected', 'Management: Antibiotics if PID (doxycycline + metronidazole ± ceftriaxone), partner notification, safety-netting'],
'**Priming Focus:** Key differentials: UTI, PID, ovarian cyst/torsion, ectopic (still possible despite pill), appendicitis, IBS. Ask about pregnancy risk, discharge, dysuria, fever, sexual history. Be alert to safeguarding / STI context. No exam possible → reason your way to next steps safely (pregnancy test, STI swabs, urine dip, escalation if red flags).

**Examiner Lens:** The examiner wants to see recognition of red flags, safe sexual history taking, and appropriate urgency. They''re looking for non-judgmental approach to STI screening and safeguarding awareness. Marks for structured differential reasoning and patient-centred management.',
180, 'medium', false, true),

-- Case 2: Mr B - Dry cough
('priming', 'Mr B - Dry Cough and Breathlessness',
'58-year-old male with dry cough and mild breathlessness for three weeks. Ramipril dose increased last month. No phlegm, fever or chest pain. Sleeps fine, can lie flat.',
'{"name": "Mr B", "age": 58, "gender": "Male", "pmh": "Hypertension, Type 2 diabetes", "medications": "Ramipril, Metformin"}'::jsonb,
ARRAY['Differential: ACE inhibitor cough (most likely), infection, heart failure, asthma/COPD', 'Red flags: Haemoptysis, chest pain, orthopnoea, weight loss', 'Key: Link to recent ramipril dose increase', 'Management: Trial switch to ARB (e.g. losartan), safety-net for persistent symptoms', 'Review: BP control, diabetes management, medication compliance'],
'**Priming Focus:** Cough on ACEi vs infection vs heart failure vs asthma/COPD. Check for red flags (haemoptysis, chest pain, orthopnoea). Review medication timing and side effects. Explore lifestyle, smoking, cardiac symptoms.

**Examiner Lens:** The examiner wants to see medication awareness and safe side-effect management. They''re looking for appropriate ACEi→ARB switch, monitoring, and patient involvement. Marks for thorough symptom timeline and clear rationale.',
180, 'easy', false, true),

-- Case 3: Mrs C - Contraceptive request
('priming', 'Mrs C - Contraceptive Pill Request',
'38-year-old female requesting repeat combined oral contraceptive pill. Has been on COCP for 15 years with no problems. Smokes 10 cigarettes/day.',
'{"name": "Mrs C", "age": 38, "gender": "Female", "pmh": "None significant", "medications": "Combined oral contraceptive pill (15 years)"}'::jsonb,
ARRAY['Contraindication: COCP + smoker >35 = increased VTE/stroke risk', 'Explore: Smoking habits, motivation to quit, contraception preferences', 'Alternatives: POP, IUS, implant, barrier methods', 'Management: Stop COCP, offer safer alternatives, smoking cessation support', 'Document: Discussion, patient choice, safety considerations'],
'**Priming Focus:** Combined pill contraindicated if smoker >35 (thrombotic risk). Explore smoking habits, motivation to quit, and preferences for contraception. Suggest alternatives (POP, implant, IUS). Handle sensitively — autonomy + health risk.

**Examiner Lens:** The examiner wants to see guideline adherence and safe prescribing. They''re looking for clear, non-judgmental explanation of risk and shared decision-making. Marks for balancing empathy with firmness on contraindications.',
180, 'medium', false, true),

-- Case 4: Mr D - Antidepressant review
('priming', 'Mr D - Sertraline Not Working',
'42-year-old male with no improvement on sertraline after 4 weeks. Thinking of stopping tablets. Missed a few doses when felt sick. No suicidal thoughts.',
'{"name": "Mr D", "age": 42, "gender": "Male", "pmh": "Depression", "medications": "Sertraline 50mg daily (started 4 weeks ago)"}'::jsonb,
ARRAY['Adherence: Check missed doses, side effects, timing', 'Expectations: Antidepressants take 6-8 weeks to work', 'Risk: Assess suicidal ideation, self-harm risk', 'Support: CBT, self-help, follow-up in 2-4 weeks', 'Encourage: Continue medication, review if no improvement at 8 weeks'],
'**Priming Focus:** Explore adherence, side effects, psychosocial context. Assess for self-harm or suicidal thoughts. Manage expectations (6–8 weeks for effect). Discuss support options, self-care, and follow-up.

**Examiner Lens:** The examiner wants to see correct expectation-setting and continuity of care. They''re looking for supportive, motivating communication and appropriate risk assessment. Marks for adherence checking and realistic timeline explanation.',
180, 'easy', false, true),

-- Case 5: Mr E - Raised LFTs
('priming', 'Mr E - Raised Liver Function Tests',
'52-year-old male with raised liver function tests on routine bloods. ALT 95, GGT 120. Drinks ''a few beers most nights''. Feels well otherwise.',
'{"name": "Mr E", "age": 52, "gender": "Male", "pmh": "None significant", "medications": "None"}'::jsonb,
ARRAY['Alcohol history: Quantify intake (3-4 beers/night ≈ 20+ units/week)', 'Dependency: CAGE questionnaire, withdrawal symptoms', 'Causes: Alcohol, NAFLD, viral hepatitis, medications', 'Management: Reduce alcohol (<14 units/week), repeat LFTs in 3 months', 'Support: Alcohol services if needed, lifestyle advice'],
'**Priming Focus:** Assess alcohol intake (units/week), dependency risk, diet, meds, viral hepatitis risk. Possible fatty liver or alcohol-related injury. Discuss harm reduction, repeat LFTs, lifestyle.

**Examiner Lens:** The examiner wants to see accurate alcohol history taking and motivational interviewing skills. They''re looking for non-judgmental approach, clear follow-up, and appropriate signposting. Marks for harm reduction focus.',
180, 'medium', false, true),

-- Case 6: Mrs F - Hypothyroid fatigue
('priming', 'Mrs F - Tiredness and Brain Fog',
'48-year-old female with tiredness and ''foggy-headed'' feeling for a few months. Known hypothyroidism. Last thyroid test was 9 months ago. Sometimes takes levothyroxine after breakfast. Weight increased slightly.',
'{"name": "Mrs F", "age": 48, "gender": "Female", "pmh": "Hypothyroidism", "medications": "Levothyroxine 100mcg daily"}'::jsonb,
ARRAY['Adherence: Check timing (should be on empty stomach before breakfast)', 'Interactions: Iron, calcium, food can reduce absorption', 'Investigations: Repeat TFTs, check FBC, ferritin, glucose', 'Other causes: Anaemia, depression, sleep, lifestyle', 'Management: Optimise levothyroxine timing, review dose if needed'],
'**Priming Focus:** Consider undertreated thyroid disease, over-replacement, anaemia, depression, or lifestyle causes. Explore adherence, timing of medication (before breakfast?), interactions (iron/calcium). Review red flags — weight change, palpitations, temperature intolerance.

**Examiner Lens:** The examiner wants to see medication adherence checking and safe re-testing. They''re looking for supportive approach that avoids blame and empowers self-management. Marks for holistic assessment of fatigue.',
180, 'easy', false, true),

-- Case 7: Mr G - Heartburn on NSAIDs
('priming', 'Mr G - Heartburn and Epigastric Discomfort',
'61-year-old male with heartburn and epigastric discomfort for 2 weeks. Takes ibuprofen 400mg TDS for months for knee pain. Burning in chest after meals. No black stools, vomiting, or weight loss.',
'{"name": "Mr G", "age": 61, "gender": "Male", "pmh": "Hypertension, Chronic knee pain", "medications": "Ibuprofen 400mg TDS, Lisinopril"}'::jsonb,
ARRAY['Red flags: Weight loss, vomiting, black stools, dysphagia, anaemia', 'Cause: Likely NSAID-related irritation', 'Management: Add PPI (omeprazole) or stop/reduce NSAID', 'Alternatives: Topical NSAID, paracetamol, physiotherapy', 'Review: BP, renal function if long-term PPI/NSAID'],
'**Priming Focus:** NSAID-induced dyspepsia or ulcer risk; consider adding PPI or stopping NSAID. Explore red flags: weight loss, vomiting, anaemia, dysphagia, melaena. Assess cardiovascular/renal risks before continuing NSAIDs.

**Examiner Lens:** The examiner wants to see safe NSAID management and holistic pain approach. They''re looking for empathy for pain while providing clear risk explanation. Marks for red flag exclusion and rational prescribing.',
180, 'medium', false, true),

-- Case 8: Mrs H - Pregnancy hypertension
('priming', 'Mrs H - Headaches in Pregnancy',
'33-year-old female at 30 weeks pregnant with headaches and mild ankle swelling. Home BP readings around 145/95 mmHg. Headaches started a few days ago. No blurred vision or RUQ pain. Otherwise well.',
'{"name": "Mrs H", "age": 33, "gender": "Female", "pmh": "None significant", "medications": "Pregnancy vitamins only"}'::jsonb,
ARRAY['Red flags: Visual disturbance, RUQ pain, severe headache, reduced fetal movements', 'Urgent: Same-day face-to-face review for BP, urine dip (protein), bloods', 'Safe meds: Labetalol, nifedipine, methyldopa (never ACEi/ARB)', 'Safety-net: Escalate if severe headache, vision change, abdominal pain', 'Referral: Antenatal unit for monitoring'],
'**Priming Focus:** Possible pregnancy-induced hypertension vs pre-eclampsia. Ask about visual disturbance, RUQ pain, swelling, foetal movements. Immediate escalation if red flags. Safe medications: labetalol, nifedipine, methyldopa. Never use ACEi/ARB.

**Examiner Lens:** The examiner wants to see safe triage and urgent referral to antenatal unit. They''re looking for calm reassurance, clear safety-netting, and partnership tone. Marks for key symptom screen for pre-eclampsia.',
180, 'hard', true, true),

-- Case 9: Mrs I - Bereavement insomnia
('priming', 'Mrs I - Sleep Problems After Bereavement',
'67-year-old female with sleep problems since husband''s death 6 months ago. Struggles with sleep, wakes early, feels lonely. Asking for ''something to help me sleep''. Some days okay but nights awful.',
'{"name": "Mrs I", "age": 67, "gender": "Female", "pmh": "None significant", "medications": "None"}'::jsonb,
ARRAY['Normalise: Sleep disturbance common during grief', 'Sleep hygiene: Routine, limit caffeine, avoid screens, relaxation', 'Support: CBT-I, talking therapy, bereavement counselling', 'Medication: Very limited zopiclone only if severe (lowest dose, <2 weeks)', 'Follow-up: Review in 2-4 weeks, ongoing support'],
'**Priming Focus:** Consider adjustment disorder / grief vs depression. Explore sleep hygiene, coping mechanisms, alcohol, daytime function. Z-drugs only short-term; prioritise CBT-I and bereavement support.

**Examiner Lens:** The examiner wants to see psychological first-line approach and minimal hypnotic use. They''re looking for compassionate listening and validation of emotions. Marks for grief impact assessment and appropriate support signposting.',
180, 'medium', false, true),

-- Case 10: Mr J - Psoriatic arthritis
('priming', 'Mr J - Joint Pain with Psoriasis',
'45-year-old male with pain and stiffness in fingers and knees over past month. Known chronic plaque psoriasis. Works as mechanic. Fingers swollen in mornings, loosen up later. Knees also affected. Lower back sometimes aches. Skin flared on elbows and scalp.',
'{"name": "Mr J", "age": 45, "gender": "Male", "pmh": "Chronic plaque psoriasis", "medications": "Topical treatments for psoriasis"}'::jsonb,
ARRAY['Pattern: Morning stiffness >30 min, joint swelling, functional impact', 'Link: Psoriatic arthritis - inflammation linked to skin condition', 'Urgent: Rheumatology referral (NICE NG220)', 'Symptom relief: Paracetamol ± topical NSAID', 'Holistic: Monitor mood, link with psoriasis care'],
'**Priming Focus:** Consider psoriatic arthritis. Ask about pattern (morning stiffness > 30 min, swelling, function). Review psoriasis control, nail changes, back pain, uveitis. No exam → focus on description and functional impact.

**Examiner Lens:** The examiner wants to see correct urgent referral and safe symptom relief. They''re looking for empathetic approach that validates frustration and takes holistic view. Marks for systematic musculoskeletal history and skin link recognition.',
180, 'medium', true, true),

-- Case 11: Mrs K - RA flare
('priming', 'Mrs K - Knee Pain in RA Patient',
'45-year-old female with increasing right knee pain and mild swelling over past month. Known rheumatoid arthritis for 5 years. Regular runner for mental health and weight control. Pain worse after runs. Worried arthritis is flaring. No bloods for 3 months.',
'{"name": "Mrs K", "age": 45, "gender": "Female", "pmh": "Rheumatoid arthritis (5 years)", "medications": "Methotrexate weekly, Folic acid"}'::jsonb,
ARRAY['Distinguish: RA flare vs mechanical injury vs infection', 'Red flags: Fever, redness, unable to bear weight (septic arthritis risk)', 'Flare plan: Short course prednisolone or discuss with rheumatology nurse', 'Advice: Relative rest, ice, avoid high-impact running temporarily', 'Monitoring: Arrange bloods (FBC, CRP, LFTs) for methotrexate monitoring'],
'**Priming Focus:** Possible flare of RA vs mechanical strain vs effusion or infection. Explore: duration, other joints, stiffness, infection risk (immunosuppression). No exam → focus on functional impact and systemic features. Check methotrexate adherence, monitoring, infection precautions.

**Examiner Lens:** The examiner wants to see safe RA flare approach and continuity with specialist team. They''re looking for empathetic approach toward lifestyle impact and patient empowerment. Marks for flare vs infection distinction and medication adherence checking.',
180, 'medium', true, true),

-- Case 12: Mrs L - DVT risk
('priming', 'Mrs L - Leg Swelling on Tamoxifen',
'53-year-old female with left leg swelling and mild ache for 3 days. History of breast cancer (4 years ago, now in remission). On tamoxifen. Works from home, sits for long periods. No trauma. Anxious about DVT. No SOB or chest pain.',
'{"name": "Mrs L", "age": 53, "gender": "Female", "pmh": "Breast cancer (4 years ago, now in remission)", "medications": "Tamoxifen"}'::jsonb,
ARRAY['Risk factors: Tamoxifen (increases VTE risk), immobility, cancer history', 'Red flags: SOB, chest pain (possible PE)', 'Urgent: Same-day DVT assessment (DVT clinic or ambulatory care)', 'Investigations: D-dimer, Doppler scan likely required', 'Safety-net: If breathless or chest pain → 999'],
'**Priming Focus:** Possible DVT (tamoxifen ↑ VTE risk). Urgent same-day assessment needed. Explore red flags: SOB, chest pain, trauma, travel, immobility. No examination → use risk reasoning and safety escalation.

**Examiner Lens:** The examiner wants to see urgent referral and safe triage. They''re looking for calm reassurance that acknowledges fear. Marks for red flag screen, drug history awareness, and risk factor recognition.',
180, 'hard', true, true),

-- Case 13: Mr M - Dementia and driving
('priming', 'Mr M - Memory Problems and Driving',
'76-year-old male with memory problems and getting lost while driving. Mild Alzheimer''s disease recently diagnosed. Wife reports forgetfulness, misplacing items, repeating questions. Got lost driving home twice. Patient insists he''s safe. Brought by wife.',
'{"name": "Mr M", "age": 76, "gender": "Male", "pmh": "Mild Alzheimer''s disease (recently diagnosed), Hypertension", "medications": "Amlodipine"}'::jsonb,
ARRAY['Functional impact: ADLs, driving safety, work, finances', 'Legal: Advise stop driving until assessment (DVLA guidance)', 'Referral: Memory clinic, baseline tests (FBC, U&E, TFT, B12/folate, glucose)', 'Support: Explore support for both patient and spouse', 'Safeguarding: Consider capacity, safety at home'],
'**Priming Focus:** Consider mild cognitive impairment vs dementia vs depression. Explore functional impact, mood, sleep, alcohol, driving safety. No formal cognitive test in SCA — focus on reasoning and safeguarding. Legal duties (DVLA, capacity, confidentiality).

**Examiner Lens:** The examiner wants to see safe advice regarding driving and appropriate referral. They''re looking for sensitive delivery that supports autonomy and dignity. Marks for functional, cognitive, and collateral history taking.',
180, 'hard', true, true),

-- Case 14: Miss N - Benzodiazepine dependence
('priming', 'Miss N - Requesting More Diazepam',
'34-year-old female with increasing anxiety since losing job, requesting more diazepam. Single parent of two. Finds diazepam ''the only thing that helps''. No suicidal ideation. Drinks 1-2 glasses of wine most nights. Diazepam prescribed 2 months ago by OOH GP.',
'{"name": "Miss N", "age": 34, "gender": "Female", "pmh": "None significant", "medications": "Diazepam 5mg PRN (prescribed 2 months ago by OOH GP)"}'::jsonb,
ARRAY['Dependence: Check frequency of use, withdrawal symptoms, tolerance', 'Risks: Long-term diazepam worsens anxiety, causes dependence', 'Taper: Gradual reduction (10-25% every 1-2 weeks)', 'Support: CBT, talking therapy, non-drug strategies', 'Consider: SSRIs if persistent anxiety, social prescriber for job support'],
'**Priming Focus:** Likely benzodiazepine dependence. Explore duration, symptoms, functional impact, triggers. Discuss gradual tapering, psychological support, and withdrawal symptoms. Manage safely — avoid abrupt stop but do not continue indefinitely.

**Examiner Lens:** The examiner wants to see gradual withdrawal plan and psychological input. They''re looking for empathy, non-judgmental approach, and collaborative tone. Marks for dependence features recognition and safe prescribing.',
180, 'hard', true, true),

-- Case 15: Mrs O - Bisphosphonate intolerance
('priming', 'Mrs O - Osteoporosis Treatment Alternatives',
'70-year-old female asking about alternatives to alendronate for osteoporosis. T-score -2.9, vertebral fracture last year. Stopped alendronate due to severe heartburn. Tried taking it correctly (upright, with water, before food) but still couldn''t tolerate it. Walks daily.',
'{"name": "Mrs O", "age": 70, "gender": "Female", "pmh": "Osteoporosis (T-score -2.9), Vertebral fracture last year", "medications": "Calcium, Vitamin D supplements"}'::jsonb,
ARRAY['Alternatives: Denosumab (SC injection every 6 months), Zoledronic acid (IV infusion yearly)', 'Pre-checks: Renal function, calcium levels before starting', 'Lifestyle: Exercise, calcium/vitamin D, falls prevention', 'Referral: Osteoporosis clinic for alternative therapy', 'Reassurance: Non-tablet options available'],
'**Priming Focus:** Need alternative anti-resorptive therapy. Explore adherence, reflux severity, other comorbidities. No exam → discuss options and shared decision-making. Consider denosumab, zoledronic acid, or raloxifene depending on risks.

**Examiner Lens:** The examiner wants to see evidence-based alternative options. They''re looking for supportive, collaborative approach that explains clearly. Marks for medication intolerance recognition and individualised management.',
180, 'medium', true, true),

-- Case 16: Mr P - Falls in elderly
('priming', 'Mr P - Dizziness and Falls',
'84-year-old male with dizziness when standing and minor fall last week. Lives in sheltered housing. Minor fall with no injury. Feels dizzy when standing. Takes 10 regular medications including Amlodipine, Furosemide, Tamsulosin, Sertraline, Zopiclone.',
'{"name": "Mr P", "age": 84, "gender": "Male", "pmh": "Hypertension, BPH, Cataracts", "medications": "Amlodipine, Furosemide, Tamsulosin, Sertraline, Zopiclone (10 regular medications)"}'::jsonb,
ARRAY['Multifactorial: Vision, medications (postural hypotension risk), environment, cognition', 'Medication review: Doxazosin, furosemide, zopiclone all increase falls risk', 'Investigations: Lying/standing BP, bloods (U&Es, glucose), medication review', 'Referrals: Falls clinic, community pharmacist, social services if needed', 'Safety: Home assessment, walking aids, community MDT'],
'**Priming Focus:** Use the priming time to structure a multifactorial falls assessment. Think drugs, vision, environment, cognition and strength/balance, and how you will bring family in as a collaborative historian while maintaining the patient''s autonomy.

**Examiner Lens:** The examiner wants to see recognition of postural hypotension risk (doxazosin), polypharmacy and frailty. They are looking for prioritisation of safety (injury risk, head trauma, safeguarding) and a plan that includes medication review, simple tests, and signposting to falls services.',
180, 'hard', true, true),

-- Case 17: Mr Q - Smoking cessation
('priming', 'Mr Q - Wants to Quit Smoking',
'59-year-old male wanting help quitting smoking. COPD (GOLD stage 2), mild depression. Long-term smoker (20/day). Tried patches before - didn''t work. Wants to quit but struggling.',
'{"name": "Mr Q", "age": 59, "gender": "Male", "pmh": "COPD (GOLD stage 2), Mild depression", "medications": "Sertraline, Salbutamol, Tiotropium"}'::jsonb,
ARRAY['Motivation: Assess readiness, triggers, previous attempts', 'Pharmacotherapy: Varenicline or NRT combination (avoid bupropion with sertraline)', 'Support: Stop smoking services, behavioural support, social prescriber', 'Link: Mental health and respiratory benefits of quitting', 'Follow-up: Regular review, relapse prevention plan'],
'**Priming Focus:** Assess motivation, triggers, prior attempts. Discuss combined pharmacotherapy (varenicline vs NRT combo; bupropion contraindicated with depression meds). Address link between mood and smoking. Offer behavioural support, follow-up, relapse plan.

**Examiner Lens:** They test your motivational interviewing and safety with drug choices. Marks for linking mental health + respiratory benefit. They''re looking for structured approach and realistic goal-setting.',
180, 'medium', true, true),

-- Case 18: Mrs R - Recurrent UTIs
('priming', 'Mrs R - Recurrent UTIs',
'71-year-old female with 3 UTIs in past 6 months, asking about long-term antibiotics. CKD (eGFR 42). Recurrent UTIs confirmed. No other bleeding symptoms. Asks about antibiotic prophylaxis.',
'{"name": "Mrs R", "age": 71, "gender": "Female", "pmh": "CKD (eGFR 42)", "medications": "Enalapril, Metformin"}'::jsonb,
ARRAY['Pattern: Confirm culture-proven infections, triggers, timing', 'Non-antibiotic: Vaginal oestrogen, hydration, hygiene, D-mannose', 'Prophylaxis: Only if other measures fail, adjust dose for renal function', 'Red flags: Fever, flank pain, haematuria → urgent review', 'Causes: Atrophic vaginitis, voiding issues, consider gynae referral'],
'**Priming Focus:** Confirm infection pattern (culture-proven, triggers). Discuss non-antibiotic strategies (vaginal oestrogen, hydration, hygiene, D-mannose). Consider antibiotic prophylaxis only if other measures fail, adjusting for renal function. Safety net for red flags (fever, flank pain, haematuria). Explore underlying causes (voiding issues, atrophic vaginitis).

**Examiner Lens:** Marks for safe antibiotic use + awareness of renal dosing. They''ll test shared decision and self-care advice. Looking for balanced approach that avoids over-prescribing while addressing patient concerns.',
180, 'medium', true, true),

-- Case 19: Mr S - Statin intolerance
('priming', 'Mr S - Stopped Statin Due to Muscle Aches',
'62-year-old male who stopped atorvastatin due to muscle aches, asking if he should go without. Type 2 diabetes, hypertension. 10-year QRISK3 is 23%. Asks if he should just go without statin.',
'{"name": "Mr S", "age": 62, "gender": "Male", "pmh": "Type 2 diabetes, Hypertension", "medications": "Metformin, Antihypertensive"}'::jsonb,
ARRAY['Side effects: Explore details, timing, severity, previous trials', 'Alternatives: Lower dose, alternate-day dosing, switch to rosuvastatin', 'Risk: Explain QRISK3 and why statin is important', 'Lifestyle: Diet, weight, exercise, optimise diabetes/BP', 'Investigations: Lipid profile, CK, U&Es to assess response and side effects'],
'**Priming Focus:** Explore side effect details and previous trials. Reassure that statin intolerance is often drug-specific. Discuss re-challenge (lower dose, alternate-day dosing, rosuvastatin). Lifestyle optimisation (diet, weight, exercise). Explain absolute benefit vs small risk of myalgia.

**Examiner Lens:** They assess explanation of risk in understandable terms. Marks for evidence-based reassurance and patient involvement. Looking for clear communication about cardiovascular risk and shared decision-making.',
180, 'medium', true, true),

-- Case 20: Miss T - Persistent acne
('priming', 'Miss T - Persistent Acne',
'18-year-old female with persistent moderate acne despite 6 months treatment. Self-conscious about appearance. Wants to ''try something stronger''. Currently on topical benzoyl peroxide, oral lymecycline, and Microgynon (COCP).',
'{"name": "Miss T", "age": 18, "gender": "Female", "pmh": "None significant", "medications": "Topical benzoyl peroxide, Oral lymecycline, Microgynon (COCP)"}'::jsonb,
ARRAY['Assessment: Severity, scarring risk, adherence, impact on mood', 'Next steps: Add topical retinoid (Treclin/Epiduo) or refer for isotretinoin if severe', 'Pregnancy: Counsel on teratogenicity if using retinoids (vitamin A)', 'Expectations: Realistic timeline, skincare advice, non-comedogenic products', 'Consider: PCOS if androgenic features, blood tests if indicated'],
'**Priming Focus:** Explore acne impact, adherence, and triggers. Next steps per NICE: consider adding topical retinoid or referral for oral isotretinoin if severe. Discuss realistic expectations, skincare, and scarring prevention. Check contraindications to further systemic therapy (pregnancy risk).

**Examiner Lens:** Scores for structured dermatology reasoning and safe prescribing. They''ll note communication around appearance and confidence. Looking for appropriate escalation and pregnancy safety awareness.',
180, 'medium', true, true),

-- Case 21: Mr U - LUTS
('priming', 'Mr U - Urinary Frequency',
'68-year-old male with increased urinary frequency day and night over 3 months. Type 2 diabetes (well-controlled), BPH. HbA1c 55 (well-controlled). No dysuria or fever. Waking 4-5 times per night.',
'{"name": "Mr U", "age": 68, "gender": "Male", "pmh": "Type 2 diabetes (well-controlled), BPH", "medications": "Tamsulosin, Metformin"}'::jsonb,
ARRAY['Differential: Worsening BPH, UTI, diabetes-related, medication timing', 'History: LUTS pattern, fluid intake, medication timing, infection symptoms', 'Investigations: Urine dip, US KUB with flow studies, U&Es, HbA1c', 'Management: Consider finasteride, tolterodine, bladder diary, fluid restriction', 'Review: Medication optimisation, functional impact'],
'**Priming Focus:** Could be BPH progression, diuretic timing, or UTI. Check timing of diuretic, fluid intake, infection symptoms, diabetes, prostate symptoms. No exam → reason through safe medication review and next steps.

**Examiner Lens:** Tests structured LUTS reasoning and multimorbidity thinking. Looks for clear follow-up and safety advice. Marks for symptom pattern recognition and rational medication adjustment.',
180, 'medium', true, true),

-- Case 22: Mrs V - Vaginal atrophy
('priming', 'Mrs V - Vaginal Dryness',
'61-year-old female with vaginal dryness, soreness, and pain during intercourse. Postmenopausal for 8 years. Feels embarrassed and worries it''s ''the end of intimacy''. No bleeding, no discharge.',
'{"name": "Mrs V", "age": 61, "gender": "Female", "pmh": "Postmenopausal (8 years)", "medications": "None"}'::jsonb,
ARRAY['Red flags: Post-menopausal bleeding, discharge, pelvic pain', 'First-line: Topical vaginal oestrogen (pessaries or cream) - safe for most', 'Lifestyle: Lubricants, foreplay, psychosexual counselling', 'Reassurance: Common issue, treatable, doesn''t mean end of intimacy', 'Consider: STI screen if new partner, mood assessment'],
'**Priming Focus:** Explore symptoms, relationships, lubrication attempts, mood, partner support. Rule out red flags (bleeding, discharge, pelvic pain). Discuss topical vaginal oestrogen as first-line (safe for most women). Offer lifestyle tips, lubricants, psychosexual support.

**Examiner Lens:** Marks for empathy and normalising discussion. They''ll reward patient-centred, evidence-based reassurance. Looking for sensitive approach to sexual health and appropriate treatment options.',
180, 'medium', true, true),

-- Case 23: Mr W - Antipsychotic weight gain
('priming', 'Mr W - Weight Gain on Olanzapine',
'38-year-old male with weight gain and feeling ''fed up and unmotivated''. Schizoaffective disorder. On olanzapine for 1 year. Gained 10kg since starting olanzapine. Smokes. Family history of diabetes. Feels unmotivated.',
'{"name": "Mr W", "age": 38, "gender": "Male", "pmh": "Schizoaffective disorder", "medications": "Olanzapine (1 year)"}'::jsonb,
ARRAY['Weight: Trajectory, diet, exercise, sleep patterns', 'Metabolic: Check HbA1c, lipids, TFTs (olanzapine increases diabetes risk)', 'Medication: Liaise with psychiatry to consider alternative (aripiprazole)', 'Lifestyle: Weight loss programmes, smoking cessation, social prescriber', 'Support: CBT, holistic wellbeing, address stigma'],
'**Priming Focus:** Explore weight trajectory, diet, exercise, sleep, meds. Discuss options: medication review (liaise psychiatry), metabolic monitoring (HbA1c, lipids). Lifestyle support, smoking cessation. Discuss safer alternatives (e.g. aripiprazole) through specialist review. Address stigma, support engagement.

**Examiner Lens:** They test holistic care for mental-physical interface. Scores for liaison mindset and non-judgmental tone. Looking for integrated approach that addresses both mental and physical health.',
180, 'hard', true, true),

-- Case 24: Mr X - Heavy drinking
('priming', 'Mr X - Raised LFTs and Alcohol',
'47-year-old male with raised liver function tests on health check. IT manager. Drinks a bottle of wine most nights to ''unwind''. Wife is worried. LFTs: ALT 85, GGT 140.',
'{"name": "Mr X", "age": 47, "gender": "Male", "pmh": "None significant", "medications": "None"}'::jsonb,
ARRAY['Quantify: Bottle of wine/night ≈ 10 units/day = 70 units/week (significantly over recommended 14)', 'Assessment: AUDIT-C, CAGE questionnaire, withdrawal risk', 'Harm reduction: Explain liver inflammation, risk of cirrhosis, liver cancer', 'Support: Alcohol services, CBT, social prescriber, vitamin supplements', 'Monitoring: Repeat LFTs in 3 months, consider US abdomen if persistent'],
'**Priming Focus:** Quantify intake (units), dependence symptoms, withdrawal risk. Discuss physical + psychological harms, motivation for change. Offer brief intervention, referral (local alcohol service, CBT). Agree reduction plan, repeat LFTs. Discuss safer coping alternatives.

**Examiner Lens:** Marks for motivational interviewing & harm reduction. Expect empathy + structured plan without confrontation. Looking for accurate alcohol quantification and supportive approach.',
180, 'hard', true, true),

-- Case 25: Miss Y - Fatigue and amenorrhoea
('priming', 'Miss Y - Tiredness and Missed Periods',
'26-year-old female with tiredness for 3 months and missed two periods. Under stress at work. Follows vegan diet. Denies weight gain, hot flushes, or pregnancy. No other symptoms.',
'{"name": "Miss Y", "age": 26, "gender": "Female", "pmh": "None significant", "medications": "None"}'::jsonb,
ARRAY['Differential: Iron/B12 deficiency (vegan), hypothyroidism, PCOS, functional amenorrhoea', 'Investigations: FBC, ferritin, B12, folate, TSH, pregnancy test', 'Lifestyle: Dietitian referral for vegan diet advice, stress management', 'Support: Work adjustments, therapy services if needed', 'Follow-up: Review results, address underlying cause'],
'**Priming Focus:** Think differential: iron/B12 deficiency, hypothyroidism, PCOS, functional hypothalamic amenorrhoea. Clarify menstrual history, diet, stress, BMI, contraception. Plan appropriate baseline investigations (FBC, ferritin, TSH, B12, pregnancy test). Explore lifestyle, sleep, nutrition. Offer reassurance and follow-up plan.

**Examiner Lens:** Tests your ability to prioritise differentials and communicate uncertainty. Marks for holistic lifestyle approach. Looking for structured investigation plan and dietary awareness.',
180, 'medium', true, true),

-- Case 26: Mrs Z - Zopiclone dependence
('priming', 'Mrs Z - Requesting Repeat Zopiclone',
'67-year-old female requesting repeat zopiclone, angry that colleagues refused. Retired nurse. Prescribed after husband''s death 2 years ago. Says she ''can''t sleep without it''. Drinks herbal tea but lies awake worrying. Angry about refusal.',
'{"name": "Mrs Z", "age": 67, "gender": "Female", "pmh": "None significant", "medications": "Zopiclone 7.5mg nightly (2 years)"}'::jsonb,
ARRAY['Empathise: Acknowledge abrupt stopping was wrong, apologise', 'Risks: Long-term zopiclone causes dependence, falls, cognitive issues', 'Taper: Gradual reduction (alternate evenings or every 3 days initially)', 'Support: CBT-I, IAPT, social prescriber for isolation, bereavement support', 'Follow-up: Remove from repeat, book review in 1 month, safety-net for withdrawal'],
'**Priming Focus:** Long-term zopiclone → dependence, falls risk, cognitive impact. Explore sleep hygiene, stress, coping, social support. Sensitive discussion: carer burnout, psychological strain, guilt. Must balance compassion with safe prescribing.

**Examiner Lens:** Scores for compassionate limit-setting and deprescribing. They''ll value empathy, firmness, and clear explanation of rationale. Looking for gradual withdrawal plan and holistic support.',
180, 'hard', true, true),

-- Case 27: Mr Ahmed - ACE cough
('priming', 'Mr Ahmed - Chronic Cough',
'58-year-old male with chronic cough for three months. Hypertension. On Ramipril 10mg daily. Non-smoker, normal CXR 6 months ago, BP readings remain good. Denies reflux but mentions mild nasal drip at night. Dry cough, no sputum, haemoptysis, or fever.',
'{"name": "Mr Ahmed", "age": 58, "gender": "Male", "pmh": "Hypertension", "medications": "Ramipril 10mg daily"}'::jsonb,
ARRAY['Differential: ACE inhibitor cough, GORD, post-nasal drip, asthma, malignancy', 'Timing: Confirm when cough started relative to ramipril', 'Management: Switch to ARB (e.g. losartan)', 'Red flags: Haemoptysis, weight loss, dyspnoea → urgent review', 'Safety-net: If persistent or red flags develop'],
'**Priming Focus:** Recognise ACE inhibitor–induced cough as likely, but consider other causes (GORD, post-nasal drip, asthma, malignancy). Plan to confirm symptom timing in relation to starting ramipril. Be ready to discuss switching to an ARB (e.g. losartan). Prepare safety-netting for red flags (haemoptysis, weight loss, dyspnoea).

**Examiner Lens:** Examiner looks for: methodical differential reasoning, medication awareness, safe and guideline-based plan.',
180, 'easy', false, true),

-- Case 28: Mrs Li - Postnatal depression
('priming', 'Mrs Li - Postnatal Fatigue',
'32-year-old female with fatigue and low mood 4 months postpartum. Breastfeeding, no history of depression, no bleeding or thyroid disease. Recent FBC shows Hb 110 g/L, TSH normal. Not on contraception yet. Limited family support as partner works away.',
'{"name": "Mrs Li", "age": 32, "gender": "Female", "pmh": "None significant", "medications": "None"}'::jsonb,
ARRAY['Differential: Postnatal depression, anaemia, sleep deprivation', 'Screening: EPDS, assess bonding, intrusive thoughts', 'Safeguarding: Self-harm risk, baby safety', 'Support: Perinatal mental health referral, social support', 'Management: Breastfeeding-compatible treatments if needed'],
'**Priming Focus:** Identify possible postnatal depression vs anaemia or sleep deprivation. Prepare to ask about bonding, intrusive thoughts, and safeguarding (self-harm risk, baby safety). Consider social context and support network. Management likely includes screening (EPDS), emotional support, perinatal mental health referral, and reassurance on breastfeeding-compatible treatments.

**Examiner Lens:** Examiner expects: holistic biopsychosocial framing, awareness of confidentiality, safety-netting for PND.',
180, 'hard', true, true),

-- Case 29: Jake - Teenage T1DM hypos
('priming', 'Jake - Recurrent Hypos',
'16-year-old male with recurrent hypoglycaemia episodes during school. Type 1 diabetes on insulin pump. Frequent episodes of dizziness and sweating during school hours. HbA1c 47 mmol/mol (improved). Admits sometimes skipping lunch if busy. Teachers expressed concern after he nearly fainted last week.',
'{"name": "Jake", "age": 16, "gender": "Male", "pmh": "Type 1 diabetes", "medications": "Insulin pump"}'::jsonb,
ARRAY['Causes: Dosing errors, meal timing, excessive basal rate', 'Assessment: Self-management, school support, risk-taking', 'Safeguarding: Teenage autonomy, adherence, supervision', 'Management: Hypo prevention, glucose monitoring, diabetes nurse liaison', 'Support: School support plan, family involvement'],
'**Priming Focus:** Recognise recurrent hypoglycaemia; consider dosing errors, meal timing, or excessive basal rate. Prepare to assess self-management, school support, and possible risk-taking. Important safeguarding angle: teenage autonomy, adherence, supervision. Plan: discuss hypo prevention, glucose monitoring, liaison with diabetes nurse.

**Examiner Lens:** Examiner expects: structured risk and safeguarding awareness, collaborative plan with adolescent tone.',
180, 'hard', true, true),

-- Case 30: Mr Daniels - Early dementia
('priming', 'Mr Daniels - Forgetfulness',
'70-year-old male with increasing forgetfulness over six months. Wife manages his finances now. No hallucinations or mood change. Recent bloods (FBC, U&Es, TFT, B12) are normal. No alcohol excess. He drives and manages his own medication.',
'{"name": "Mr Daniels", "age": 70, "gender": "Male", "pmh": "None significant", "medications": "None"}'::jsonb,
ARRAY['Differential: Early dementia, depression, functional causes', 'Assessment: Daily functioning, driving safety, carer impact', 'Screening: GPCOG, MMSE, 6CIT', 'Referral: Memory clinic for assessment', 'Safeguarding: Driving safety, capacity, home safety'],
'**Priming Focus:** Recognise possible early dementia, but must rule out depression and functional causes. Prepare questions on daily functioning, driving, safety, and carer impact. Consider screening tools (GPCOG, MMSE, 6CIT) and referral for memory assessment.

**Examiner Lens:** Examiner expects: methodical, patient-centred reasoning, acknowledges need for collateral history and safeguarding.',
180, 'medium', true, true),

-- Case 31: Ms Patel - Caffeine palpitations
('priming', 'Ms Patel - Palpitations',
'42-year-old female with palpitations and trembling, especially mid-morning. Drinks six coffees daily, does not smoke. Normal thyroid tests and ECG last year. No chest pain, syncope, or medications.',
'{"name": "Ms Patel", "age": 42, "gender": "Female", "pmh": "None significant", "medications": "None"}'::jsonb,
ARRAY['Differential: Anxiety, excessive caffeine, SVT, hyperthyroidism', 'History: Triggers, stress, sleep, anxiety symptoms', 'Management: Reduce caffeine, relaxation techniques, GAD-7 screening', 'Investigations: Consider repeat ECG if persistent, TFTs if indicated', 'Support: CBT, lifestyle advice'],
'**Priming Focus:** Differential: anxiety, excessive caffeine, SVT, hyperthyroidism (unlikely). Plan to explore triggers, stress, sleep, and anxiety symptoms. Management: reduce caffeine, relaxation, possible short GAD-7 screening.

**Examiner Lens:** Examiner expects: structured exclusion of organic causes before attributing to anxiety; supportive, non-dismissive tone.',
180, 'easy', false, true),

-- Case 32: Clare - Bloating
('priming', 'Clare - Bloating and Pelvic Discomfort',
'28-year-old female with new bloating and pelvic discomfort for three weeks. Periods regular, no missed pills. Pregnancy test negative. No bowel changes or urinary symptoms. No family history of ovarian or bowel cancer. On Rigevidon (combined OCP).',
'{"name": "Clare", "age": 28, "gender": "Female", "pmh": "None significant", "medications": "Combined OCP (Rigevidon)"}'::jsonb,
ARRAY['Differential: Functional bloating/IBS, ovarian pathology, GI causes', 'Red flags: Weight loss, change in bowel habit, family history', 'History: GI symptoms, menstrual pattern, triggers', 'Management: Symptom diary, lifestyle advice, safety-netting', 'Follow-up: Review if persistent or red flags develop'],
'**Priming Focus:** Think functional bloating/IBS but remain alert for early ovarian cancer signs. Prepare to explore GI, menstrual, and red-flag symptoms. Likely initial management: symptom diary, lifestyle advice, safety-netting.

**Examiner Lens:** Examiner expects: balanced, structured differential and appropriate reassurance without over-investigation.',
180, 'medium', false, true),

-- Case 33: Mr Jones - SSRI sexual dysfunction
('priming', 'Mr Jones - Erectile Dysfunction on Sertraline',
'40-year-old male with difficulty maintaining erections since starting sertraline. Anxiety disorder. On Sertraline 100mg daily for 3 months. No cardiovascular disease, drinks occasionally, relationship is stable.',
'{"name": "Mr Jones", "age": 40, "gender": "Male", "pmh": "Anxiety", "medications": "Sertraline 100mg daily (3 months)"}'::jsonb,
ARRAY['Cause: SSRI-induced sexual dysfunction', 'Explore: Anxiety contribution, relationship dynamics', 'Options: Dose review, switch to alternative (mirtazapine), PDE5 inhibitors', 'Communication: Sensitive, patient-centred approach', 'Follow-up: Review response to changes'],
'**Priming Focus:** Recognise SSRI-induced sexual dysfunction. Prepare to explore anxiety contribution, relationship dynamics, medication side effects. Management options: dose review, switch to alternative (e.g. mirtazapine), or PDE5 inhibitors if suitable.

**Examiner Lens:** Examiner expects: sensitive communication, shared decision-making, addressing sexual side effects proactively.',
180, 'medium', true, true),

-- Case 34: Sarah - New T1DM
('priming', 'Sarah - Thirst and Urinary Frequency',
'15-year-old female with increased thirst and frequent urination for a week. Mother notes she looks thinner and more tired. Capillary glucose (done in triage): 24 mmol/L, ketones present.',
'{"name": "Sarah", "age": 15, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb,
ARRAY['Emergency: New type 1 diabetes with ketosis', 'Urgent: Hospital referral immediately', 'Communication: Parental communication, explain urgency', 'Safeguarding: Consent, supervision, family support', 'Follow-up: Diabetes team, education, ongoing care'],
'**Priming Focus:** Identify new type 1 diabetes with ketosis risk. Prepare for urgent hospital referral, parental communication, safeguarding around consent and supervision.

**Examiner Lens:** Examiner expects: immediate recognition of emergency, calm escalation, empathy toward anxious family.',
180, 'hard', true, true),

-- Case 35: Mr K - Refractory GORD
('priming', 'Mr K - Ongoing Reflux',
'55-year-old male with ongoing acid reflux despite omeprazole for six weeks. BMI 30, drinks two pints nightly, non-smoker. No weight loss, dysphagia, or vomiting. H. pylori test not done. On Omeprazole 20mg.',
'{"name": "Mr K", "age": 55, "gender": "Male", "pmh": "None significant", "medications": "Omeprazole 20mg"}'::jsonb,
ARRAY['Differential: GORD, non-acid reflux, compliance, H. pylori', 'Check: Medication timing (before meals), lifestyle triggers', 'Red flags: Weight loss, dysphagia, vomiting, anaemia', 'Management: Optimise PPI, H. pylori testing, lifestyle advice', 'Review: Weight, alcohol reduction, follow-up'],
'**Priming Focus:** Differential: GORD, non-acid reflux, compliance issue, H. pylori. Prepare to ask about medication timing (before meals), lifestyle triggers, red flags. Management: optimise PPI, arrange H. pylori testing, weight/alcohol advice.

**Examiner Lens:** Examiner expects: safe symptom evaluation, red flag exclusion, rational next steps.',
180, 'easy', false, true);

-- Verify the import
SELECT case_type, difficulty, is_pro, COUNT(*) as count 
FROM sca_cases 
WHERE case_type = 'priming'
GROUP BY case_type, difficulty, is_pro
ORDER BY difficulty, is_pro;
