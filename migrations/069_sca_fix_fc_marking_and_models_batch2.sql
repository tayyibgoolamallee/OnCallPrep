-- Migration 069: Fix marking criteria and model answers for FC-xxx cases (batch 2: FC-016 to FC-035)

-- =============================================
-- DVT Query (FC-016)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of suspected DVT, application of Wells score, appropriate investigation pathway, and safety-netting.

**Data Gathering:**
- Leg symptoms: unilateral swelling, pain, warmth, redness, duration
- Wells score components: active cancer, paralysis/immobilisation, recent surgery/bedridden, localised tenderness, entire leg swollen, calf swelling >3cm, pitting oedema, collateral veins, previous DVT
- Risk factors: recent travel, immobility, surgery, OCP/HRT, cancer, pregnancy, family history
- Alternative diagnoses: cellulitis, Baker''s cyst, muscle strain
- ICE: worry about clots, concern about flying/travel plans

**Clinical Management:**
- Calculate Wells score: ≥2 = DVT likely, <2 = DVT unlikely
- DVT likely: arrange same-day leg USS and interim anticoagulation (DOAC) if USS not available within 4 hours
- DVT unlikely: D-dimer; if positive arrange USS, if negative DVT excluded
- If confirmed DVT: 3 months anticoagulation (DOAC first-line), provoked vs unprovoked
- Safety-net: attend A&E if sudden breathlessness or chest pain (PE risk)

**References:**
- NICE NG158: Venous thromboembolic diseases - https://www.nice.org.uk/guidance/ng158
- NICE CKS: DVT - https://cks.nice.org.uk/topics/deep-vein-thrombosis/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored leg symptoms in detail (swelling, pain, warmth, redness)", "Systematically assessed Wells score components", "Identified risk factors for VTE (travel, surgery, OCP, immobility)", "Considered alternative diagnoses (cellulitis, Baker''s cyst)", "Explored ICE (worry about clots, impact on travel plans)", "Gathered relevant PMH and medication history", "Completed data gathering within approximately 6 minutes", "Consultation was systematic and well-structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Calculated or applied Wells score correctly", "Followed appropriate investigation pathway (USS vs D-dimer)", "Arranged same-day investigation if DVT likely", "Discussed anticoagulation if DVT confirmed", "Explained the difference between provoked and unprovoked DVT", "Provided critical safety-netting about PE symptoms", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Addressed the patient''s anxiety about blood clots", "Explained the investigation process clearly", "Used clear language without medical jargon", "Allowed the patient to ask questions", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '33a83c95-ab6b-4c2e-a2ca-35d7ac9d6755';

-- =============================================
-- Elderly Fall (FC-010)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Comprehensive falls assessment in an older person, identifying reversible causes, preventing future falls, and multidisciplinary approach.

**Data Gathering:**
- Circumstances of the fall: mechanical vs unexplained, time of day, activity at the time
- Injuries sustained, ability to get up from floor, how long on the floor
- Previous falls: frequency, pattern
- Dizziness, LOC, palpitations, chest pain (syncope screen)
- Medications: polypharmacy, culprit drugs (antihypertensives, sedatives, opioids)
- Functional assessment: mobility aids, home environment, ADLs, vision, hearing
- PMH: osteoporosis, cognitive impairment, postural hypotension, Parkinson''s
- ICE: fear of falling again, loss of independence, concern from family

**Clinical Management:**
- Multifactorial falls risk assessment per NICE CG161
- Medication review: rationalise culprit drugs
- Lying and standing BP (postural hypotension screen)
- Bloods: FBC, U&Es, calcium, TFTs, vitamin D, glucose
- Referral: falls clinic, physiotherapy, occupational therapy for home assessment
- Bone health: consider DEXA if not already done, calcium/vitamin D, bisphosphonate if osteoporotic
- Safety-net: attend A&E if head injury symptoms, unable to weight-bear, recurrent falls

**References:**
- NICE CG161: Falls in older people - https://www.nice.org.uk/guidance/cg161
- NICE CKS: Falls risk assessment - https://cks.nice.org.uk/topics/falls-risk-assessment/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the circumstances of the fall in detail", "Screened for syncope or cardiac causes", "Reviewed medications for falls risk (polypharmacy, culprits)", "Assessed mobility and functional status", "Asked about previous falls and pattern", "Explored ICE (fear of falling, concerns about independence)", "Screened for cognitive impairment if appropriate", "Completed data gathering within approximately 6 minutes"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Conducted or planned multifactorial falls risk assessment per NICE CG161", "Reviewed and rationalised medications", "Arranged appropriate investigations (lying/standing BP, bloods)", "Made appropriate referrals (falls clinic, physiotherapy, OT)", "Addressed bone health (DEXA, calcium/vitamin D, bisphosphonate)", "Discussed home environment safety", "Provided specific safety-netting advice", "Engaged the patient and family in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Communicated with sensitivity about loss of independence", "Validated the patient''s fears about falling", "Used clear and accessible language", "Involved the patient in decisions about their care", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'e9d17d8f-311f-482a-8108-da1e64aebb8d';

-- =============================================
-- Erectile Dysfunction (FC-017)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Sensitive assessment of erectile dysfunction, identification of underlying causes, appropriate treatment, and cardiovascular risk assessment.

**Data Gathering:**
- Nature: onset (gradual vs sudden), duration, partial vs complete, morning erections
- Relationship and psychosexual history (sensitively)
- Cardiovascular risk factors: diabetes, hypertension, smoking, lipids, obesity
- Medication review: beta-blockers, SSRIs, antihypertensives
- Mental health: depression, anxiety, stress, performance anxiety
- PMH: diabetes, cardiovascular disease, neurological conditions, prostate/pelvic surgery
- ICE: impact on relationship, what they have already tried, expectations

**Clinical Management:**
- Bloods: glucose/HbA1c, lipids, TFTs, testosterone (morning sample), prolactin if low testosterone
- Cardiovascular risk assessment (ED may be first presentation of CVD)
- PDE5 inhibitor (sildenafil) if no contraindications (nitrates)
- Address modifiable risk factors: smoking, weight, exercise, alcohol
- Consider psychosexual counselling if psychogenic component
- Safety-net: follow-up to assess response, urology referral if non-responsive

**References:**
- NICE CKS: Erectile dysfunction - https://cks.nice.org.uk/topics/erectile-dysfunction/
- BSSM: Guidelines on erectile dysfunction - https://www.bssm.org.uk/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the nature of erectile dysfunction sensitively (onset, duration, pattern)", "Asked about morning erections (differentiating organic vs psychogenic)", "Assessed cardiovascular risk factors", "Reviewed medications for ED-contributing drugs", "Explored psychological and relationship factors", "Explored ICE (impact on relationship, what they have tried, expectations)", "Completed data gathering within approximately 6 minutes", "Consultation was sensitively paced and non-judgemental"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Arranged appropriate investigations (bloods including testosterone)", "Recognised ED as a potential cardiovascular risk marker", "Discussed PDE5 inhibitor options appropriately", "Addressed modifiable risk factors (smoking, weight, exercise)", "Considered psychosexual counselling referral", "Provided specific safety-netting and follow-up plan", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the sensitive topic with tact and empathy", "Signposted before asking personal questions", "Used clear and non-judgemental language", "Normalised the condition appropriately", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'd69f73de-0414-41f9-98f9-d70f402ada83';

-- =============================================
-- Fatigue and Anaemia (FC-018)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Systematic assessment of fatigue, investigation of anaemia, identification of the underlying cause, and appropriate management.

**Data Gathering:**
- Fatigue: duration, severity, impact on daily life, sleep quality
- Anaemia symptoms: pallor, breathlessness, palpitations, dizziness
- Dietary history: iron-rich foods, vegetarian/vegan, recent dietary changes
- GI symptoms: blood loss (melaena, haematochezia, heavy periods), change in bowel habit, dyspepsia
- Menstrual history if applicable: heavy periods (menorrhagia)
- PMH: coeliac disease, inflammatory bowel disease, chronic kidney disease
- ICE: what they think is causing it, concern about serious disease

**Clinical Management:**
- Bloods: FBC, ferritin, B12, folate, U&Es, TFTs, coeliac screen
- If iron deficiency anaemia: identify the cause before treating
- Males and post-menopausal females with IDA: consider GI malignancy - 2WW referral per NICE NG12
- Pre-menopausal females: assess menstrual losses, consider gynaecology referral
- Iron replacement: oral ferrous sulphate 200mg BD-TDS, recheck in 2-3 months
- Dietary advice and follow-up

**References:**
- NICE CKS: Anaemia iron deficiency - https://cks.nice.org.uk/topics/anaemia-iron-deficiency/
- NICE NG12: Suspected cancer - https://www.nice.org.uk/guidance/ng12',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored fatigue systematically (duration, severity, impact)", "Asked about anaemia symptoms (pallor, breathlessness, palpitations)", "Gathered dietary history (iron-rich foods, vegetarian/vegan diet)", "Screened for blood loss sources (GI, menstrual)", "Asked about GI symptoms and change in bowel habit", "Explored ICE (concern about serious disease, impact on daily life)", "Completed data gathering within approximately 6 minutes", "Consultation was thorough and well-structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Arranged comprehensive blood tests (FBC, ferritin, B12, folate, TFTs, coeliac)", "Recognised the importance of identifying the cause of IDA before treating", "Applied NICE NG12 criteria for 2WW referral if appropriate", "Prescribed appropriate iron replacement", "Provided dietary advice", "Arranged appropriate follow-up for repeat bloods", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Validated the impact of fatigue on daily life", "Explained the investigation plan clearly", "Used accessible language when discussing results and plan", "Allowed the patient to express their concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'ce0cea4a-f9f9-445d-b3a6-65f31aca041a';

-- =============================================
-- Follow-up Depression (FC-042)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Follow-up of depression, assessing treatment response, medication management, and holistic support.

**Data Gathering:**
- Current mood compared to last review, using PHQ-9 or similar tool
- Medication: current antidepressant, dose, duration, adherence, side effects
- Specific symptom changes: sleep, appetite, concentration, anhedonia, energy
- Risk assessment: suicidal thoughts, self-harm, plans, intent, protective factors
- Social functioning: work, relationships, activities, isolation
- Psychological therapy: engaged, waiting, or completed
- ICE: how they feel about progress, concerns about medication duration

**Clinical Management:**
- Assess treatment response at appropriate intervals (4-6 weeks)
- If partial response: consider dose optimisation before switching
- If no response after 6-8 weeks at adequate dose: consider switching or augmentation
- Continue for minimum 6 months after remission before considering tapering
- Ensure access to psychological therapy (CBT, counselling)
- Develop a relapse prevention plan
- Safety-net: crisis contacts (Samaritans, crisis team), return if worsening

**References:**
- NICE CG90: Depression in adults - https://www.nice.org.uk/guidance/cg90
- NICE CKS: Depression - https://cks.nice.org.uk/topics/depression/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed current mood using validated tool (PHQ-9)", "Reviewed medication adherence and side effects", "Explored specific symptom changes since last review", "Conducted an appropriate risk assessment", "Assessed social functioning and support network", "Asked about psychological therapy engagement", "Explored ICE (feelings about progress, medication concerns)", "Consultation was sensitively paced"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made appropriate decision about medication (continue, adjust, or switch)", "Applied NICE guidelines on treatment duration", "Discussed psychological therapy access", "Addressed social and lifestyle factors", "Developed or discussed a relapse prevention plan", "Provided crisis contacts and safety-netting", "Arranged appropriate follow-up", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Demonstrated warmth and genuine interest in progress", "Validated the patient''s experience without minimising", "Used clear and supportive language", "Allowed the patient to express how they are feeling", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '7a5e4890-ade4-48fe-81be-5e53f6518fae';

-- =============================================
-- Groin Lump (FC-043)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of a groin lump, differentiation between inguinal hernia and other causes, appropriate referral for surgical opinion.

**Data Gathering:**
- Lump characteristics: duration, size changes, reducible, painful, cough impulse
- Aggravating factors: standing, coughing, lifting, straining
- Associated symptoms: pain, nausea, vomiting (strangulation), bowel changes
- Red flags for strangulation: irreducible, tender, overlying skin changes, systemic unwellness
- Occupational history: heavy lifting
- PMH: previous hernias, previous surgery, chronic cough, constipation, prostatism
- ICE: concern about what it is, impact on work/exercise

**Clinical Management:**
- If inguinal hernia suspected: referral to general surgery for assessment
- If asymptomatic and reducible: routine referral with lifestyle advice
- If irreducible, tender, or signs of strangulation: same-day surgical assessment
- Differential: lymphadenopathy (consider STI, malignancy), femoral hernia (higher strangulation risk), lipoma, saphena varix
- Safety-net: attend A&E if lump becomes painful, irreducible, or if vomiting

**References:**
- NICE CKS: Hernia inguinal - https://cks.nice.org.uk/topics/hernia-inguinal/
- BMJ Best Practice: Inguinal hernia - https://bestpractice.bmj.com/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the lump in detail (duration, size, reducibility, cough impulse)", "Identified aggravating factors (standing, lifting, coughing)", "Screened for red flags of strangulation (irreducible, tender, vomiting)", "Considered differential diagnoses (hernia type, lymphadenopathy, lipoma)", "Asked about occupational factors and impact on work", "Explored ICE (concern about the lump, impact on activities)", "Completed data gathering within approximately 6 minutes", "Consultation was well-structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made an appropriate working diagnosis", "Differentiated between inguinal and femoral hernia risk", "Made appropriate referral to general surgery", "Discussed urgency of referral based on findings", "Gave appropriate lifestyle advice (avoid heavy lifting if hernia)", "Provided critical safety-netting about strangulation signs", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the examination discussion sensitively", "Explained the diagnosis and referral process clearly", "Used accessible language", "Allowed the patient to ask questions", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'f488fd82-4462-4c76-b7bc-66e96682d60e';

-- =============================================
-- Heartburn (FC-020)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of dyspepsia/GORD, appropriate PPI prescribing, H. pylori testing, and recognition of alarm features.

**Data Gathering:**
- Symptom characterisation: heartburn, acid regurgitation, epigastric pain, relation to food
- Duration, frequency, severity, what makes it better or worse
- Alarm features: dysphagia, weight loss, persistent vomiting, GI bleeding, anaemia
- Diet and lifestyle: spicy food, caffeine, alcohol, late eating, obesity, smoking
- Medications: NSAIDs, aspirin, bisphosphonates, SSRIs
- PMH: previous endoscopy, Barrett''s, H. pylori treatment
- ICE: concern about stomach cancer, wanting a quick fix

**Clinical Management:**
- If alarm features present: 2-week wait OGD referral (NICE NG12)
- If no alarm features: lifestyle advice first, then PPI trial (4-8 weeks)
- H. pylori testing: urea breath test or stool antigen (stop PPI 2 weeks before)
- If H. pylori positive: eradication therapy (PCA or PAM)
- Medication review: stop NSAIDs if possible, add PPI if NSAID needed
- Avoid long-term PPI without review
- Safety-net: return if symptoms persist, new alarm features

**References:**
- NICE CG184: Gastro-oesophageal reflux disease and dyspepsia - https://www.nice.org.uk/guidance/cg184
- NICE CKS: Dyspepsia - https://cks.nice.org.uk/topics/dyspepsia-unassessed/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Characterised the dyspepsia symptoms (heartburn, regurgitation, pain pattern)", "Screened for alarm features (dysphagia, weight loss, GI bleeding)", "Explored dietary and lifestyle factors", "Reviewed medications for contributing drugs (NSAIDs)", "Asked about previous H. pylori testing or treatment", "Explored ICE (cancer concern, wanting quick resolution)", "Completed data gathering within approximately 6 minutes", "Consultation was well-structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Applied NICE guidelines on PPI prescribing appropriately", "Arranged H. pylori testing (or explained why/when)", "Discussed lifestyle modifications (diet, weight, smoking, alcohol)", "Reviewed and addressed contributing medications", "Avoided unnecessary long-term PPI without plan for review", "Provided specific safety-netting about alarm features", "Arranged appropriate follow-up", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Addressed the patient''s concern about cancer appropriately", "Explained the investigation plan clearly", "Used accessible language", "Allowed the patient to express concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'ebd37880-6649-4d5f-8336-2f89c1f7fd67';

-- =============================================
-- Hypertension Review (FC-006)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Structured hypertension review, target-driven management, cardiovascular risk assessment, and medication optimisation.

**Data Gathering:**
- Current BP readings: clinic and home/ABPM if available
- Current antihypertensive medications: dose, adherence, side effects
- Cardiovascular risk factors: smoking, diabetes, lipids, BMI, family history
- Target organ damage symptoms: headaches, visual disturbance, chest pain, ankle swelling
- Lifestyle: salt intake, exercise, alcohol, stress
- Renal function review: last U&Es, eGFR
- ICE: understanding of hypertension, concerns about medication, health beliefs

**Clinical Management:**
- Target BP <140/90 clinic (<135/85 ABPM/home) per NICE NG136
- If on treatment and above target: step up per NICE algorithm (A+C/D, then A+C+D, then add further agents)
- Annual bloods: U&Es, eGFR, lipids, HbA1c, urine ACR
- Cardiovascular risk assessment: QRISK3 if not done, statin discussion if ≥10%
- Lifestyle advice: reduce salt, increase exercise, moderate alcohol
- Consider secondary causes if resistant hypertension

**References:**
- NICE NG136: Hypertension in adults - https://www.nice.org.uk/guidance/ng136
- NICE CKS: Hypertension - https://cks.nice.org.uk/topics/hypertension/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Reviewed current and recent BP readings", "Assessed medication adherence and side effects", "Gathered cardiovascular risk factors", "Screened for target organ damage", "Explored lifestyle factors (salt, exercise, alcohol)", "Explored ICE (understanding of hypertension, medication concerns)", "Checked recent blood results (U&Es, lipids)", "Consultation was structured and comprehensive"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Applied NICE NG136 BP targets correctly", "Optimised medication per NICE stepwise approach", "Calculated or reviewed QRISK3 cardiovascular risk", "Arranged appropriate monitoring bloods", "Provided tailored lifestyle advice", "Discussed statin therapy if QRISK3 ≥10%", "Provided specific safety-netting (when to seek urgent review)", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Explained hypertension and its risks in accessible terms", "Addressed concerns about medication", "Avoided lecturing about lifestyle changes", "Allowed the patient to express concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '88a427b8-2ddc-47b2-b688-b1f784a450f5';

-- =============================================
-- Indigestion and NSAIDs (FC-045)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Recognition of NSAID-induced dyspepsia/gastropathy, appropriate management including PPI co-prescribing, and reviewing NSAID indication.

**Data Gathering:**
- Dyspepsia symptoms: epigastric pain, heartburn, nausea, timing with food
- NSAID use: which NSAID, dose, duration, indication, who prescribed
- Alarm features: dysphagia, weight loss, vomiting, GI bleeding, melaena, anaemia
- Other medications: aspirin, anticoagulants, corticosteroids (GI bleed risk)
- PMH: previous peptic ulcer, H. pylori, GI bleeding
- Alternative pain management tried
- ICE: reliance on NSAIDs, understanding of risk, concern about symptoms

**Clinical Management:**
- Review NSAID indication: is it still needed? Lowest effective dose for shortest time
- If continuing NSAID: co-prescribe PPI (omeprazole 20mg OD) per NICE
- H. pylori test if not previously done
- Consider alternative analgesia: paracetamol, topical NSAIDs, physiotherapy
- If alarm features: 2-week wait OGD referral
- Safety-net: stop NSAID and attend urgently if GI bleeding, melaena, or severe pain

**References:**
- NICE CG184: Gastro-oesophageal reflux disease and dyspepsia - https://www.nice.org.uk/guidance/cg184
- NICE CKS: NSAIDs prescribing issues - https://cks.nice.org.uk/topics/nsaids-prescribing-issues/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored dyspepsia symptoms in detail", "Identified NSAID use and reviewed the indication", "Screened for alarm features (dysphagia, GI bleeding, weight loss)", "Assessed additional GI bleed risk factors (aspirin, anticoagulants, steroids)", "Asked about alternative pain management tried", "Explored ICE (reliance on NSAIDs, understanding of risk)", "Completed data gathering within approximately 6 minutes", "Consultation was well-structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Reviewed NSAID indication and discussed lowest effective dose", "Co-prescribed PPI appropriately per NICE guidelines", "Considered and discussed alternative analgesia options", "Arranged H. pylori testing if appropriate", "Recognised when to refer for OGD (alarm features)", "Provided specific safety-netting about GI bleeding signs", "Engaged the patient in shared decision-making about pain management"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Acknowledged the patient''s pain management needs", "Explained the risks of NSAIDs without being alarmist", "Used clear and accessible language", "Allowed the patient to express concerns about changing pain relief", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '0d14067b-b8fe-437a-abbe-cf8390e994cf';

-- =============================================
-- Insomnia and Anxiety (FC-021)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of insomnia with underlying anxiety, avoiding inappropriate sedative prescribing, CBT-I as first-line, and managing patient expectations.

**Data Gathering:**
- Sleep pattern: difficulty falling asleep, staying asleep, early morning waking, duration
- Sleep hygiene: caffeine, screens, alcohol, bedroom environment, routine
- Anxiety symptoms: generalised worry, panic, physical symptoms, triggers
- Impact on daily life: work, concentration, relationships, driving safety
- PHQ-9/GAD-7 if appropriate
- Previous treatments: sleeping tablets, counselling, self-help
- PMH, medications, substance use
- ICE: expectation of sleeping tablets, understanding of anxiety link

**Clinical Management:**
- Avoid prescribing Z-drugs or benzodiazepines for chronic insomnia (NICE NG215)
- First-line: sleep hygiene advice and CBT for insomnia (CBT-I) - available via Sleepstation/Sleepio
- If anxiety significant: consider SSRI (sertraline first-line), guided self-help, or CBT
- Address underlying causes: stress, life events, caffeine, screen time
- Validate the distress of poor sleep without prescribing sedatives
- Safety-net: follow-up in 2-4 weeks, return sooner if mood deteriorates

**References:**
- NICE NG215: Insomnia - https://www.nice.org.uk/guidance/ng215
- NICE CG113: Generalised anxiety disorder - https://www.nice.org.uk/guidance/cg113
- NICE CKS: Insomnia - https://cks.nice.org.uk/topics/insomnia/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the sleep pattern in detail (onset, maintenance, duration, timing)", "Assessed sleep hygiene factors comprehensively", "Screened for anxiety symptoms and severity (GAD-7)", "Assessed impact on daily functioning and safety (driving)", "Asked about previous treatments including medication expectations", "Explored ICE (expectation of sleeping tablets, understanding of anxiety)", "Completed data gathering within approximately 6 minutes", "Consultation was empathetic and well-paced"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Avoided prescribing sedatives for chronic insomnia per NICE NG215", "Recommended CBT-I as first-line for insomnia", "Discussed SSRI if anxiety is significant", "Provided specific and practical sleep hygiene advice", "Addressed underlying anxiety and its contribution to insomnia", "Handled the request for sleeping tablets sensitively", "Provided safety-netting and follow-up plan", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Validated the distress of poor sleep", "Avoided being dismissive of the request for medication", "Explained the rationale for not prescribing sedatives clearly", "Allowed the patient to express frustration", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '71cd2743-5efc-4700-a725-dd1ebc95b544';

-- =============================================
-- Knee Pain OA (FC-022)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Management of osteoarthritis of the knee, stepped approach to treatment, appropriate imaging decisions, and when to refer.

**Data Gathering:**
- Pain: location, duration, severity, pattern (worse with activity, better with rest, morning stiffness <30 mins)
- Functional impact: walking, stairs, getting up, work, hobbies
- Previous treatments: paracetamol, NSAIDs, physiotherapy, injections
- Risk factors: obesity, previous injury, occupation, family history
- Red flags: rest pain, night pain, swelling, locking, giving way
- PMH: cardiovascular risk (important for NSAID prescribing)
- ICE: expectation of X-ray/MRI, concern about needing a knee replacement

**Clinical Management:**
- OA is a clinical diagnosis - routine imaging not required (NICE NG226)
- Core treatments: education, exercise, weight management
- Pharmacological: topical NSAIDs first, oral paracetamol/NSAIDs with PPI if needed
- Consider physiotherapy referral for structured exercise programme
- Intra-articular corticosteroid injection for flare
- Refer to orthopaedics if conservative measures exhausted, significant impact on QoL
- Safety-net: return if locking, giving way, or rapid deterioration

**References:**
- NICE NG226: Osteoarthritis - https://www.nice.org.uk/guidance/ng226
- NICE CKS: Osteoarthritis - https://cks.nice.org.uk/topics/osteoarthritis/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored knee pain in detail (pattern, duration, aggravating/relieving factors)", "Assessed functional impact on daily activities and work", "Asked about previous treatments and their effectiveness", "Screened for red flags (locking, giving way, night pain, swelling)", "Assessed cardiovascular risk factors (relevant for NSAID prescribing)", "Explored ICE (expectations about imaging, fears about surgery)", "Completed data gathering within approximately 6 minutes", "Consultation was well-structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained that OA is a clinical diagnosis and routine imaging is not needed", "Discussed core treatments (exercise, weight management, education)", "Prescribed appropriately (topical NSAIDs first-line)", "Referred to physiotherapy for structured exercise", "Discussed the role of injections and when surgical referral is indicated", "Addressed the expectation for imaging without being dismissive", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Validated the impact of pain on daily life", "Explained the rationale for not imaging without dismissing concerns", "Used clear and encouraging language about exercise", "Allowed the patient to express concerns about the future", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '536adc42-7b96-4fcb-b83b-44451e59a3b9';

-- =============================================
-- Low Back Pain with Sciatica (FC-023)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Differentiation of mechanical back pain from sciatica, recognition of red flags, appropriate management without over-investigation.

**Data Gathering:**
- Back pain: onset, duration, radiation (dermatomal distribution), severity
- Neurological symptoms: leg weakness, numbness, tingling, foot drop
- Cauda equina red flags: saddle anaesthesia, bladder/bowel dysfunction, bilateral leg symptoms
- Other red flags: night pain, weight loss, fever, history of cancer
- Functional impact: work, mobility, sleep
- Previous episodes, imaging, treatments
- ICE: concern about disc prolapse, expectation of MRI

**Clinical Management:**
- If cauda equina features: emergency referral to A&E
- No routine imaging for <6 weeks unless red flags (NICE NG59)
- Encourage activity, avoid bed rest
- Analgesia: paracetamol, NSAIDs, consider neuropathic pain agents (amitriptyline, gabapentin) for radicular pain
- Physiotherapy referral
- If not improving at 6-8 weeks: consider MRI and spinal referral
- Safety-net: attend A&E if bladder/bowel changes, saddle numbness, progressive weakness

**References:**
- NICE NG59: Low back pain and sciatica - https://www.nice.org.uk/guidance/ng59
- NICE CKS: Sciatica - https://cks.nice.org.uk/topics/sciatica-lumbar-radiculopathy/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored back and leg pain in detail (onset, radiation, dermatomal pattern)", "Screened thoroughly for cauda equina red flags", "Assessed neurological symptoms (weakness, numbness, tingling)", "Screened for other red flags (cancer, infection, fracture)", "Assessed functional impact on work and daily activities", "Explored ICE (concern about disc prolapse, expectation of MRI)", "Completed data gathering within approximately 6 minutes", "Consultation was structured and thorough"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Reassured appropriately in absence of red flags", "Explained why routine imaging is not indicated initially", "Encouraged staying active and avoiding bed rest", "Prescribed appropriate analgesia including neuropathic agents for radicular pain", "Referred to physiotherapy", "Explained the timeline for natural recovery and when to consider imaging", "Provided critical safety-netting about cauda equina symptoms", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Validated the patient''s pain and concern", "Addressed the imaging expectation without dismissing concern", "Used clear language to explain the condition", "Allowed the patient to express worries", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'a66b093a-4a97-41b6-b5f7-e009f2e72221';

-- =============================================
-- Menopausal Symptoms (FC-024)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of menopausal symptoms, discussion of HRT options including risks and benefits, and shared decision-making.

**Data Gathering:**
- Symptoms: hot flushes, night sweats, sleep disturbance, vaginal dryness, mood changes, brain fog
- Duration and impact on quality of life, work, relationships, sleep
- Last menstrual period, menstrual pattern changes
- Contraception needs if perimenopausal
- PMH: breast cancer (personal/family), VTE, cardiovascular disease, migraines with aura
- Current medications, smoking status, BMI
- ICE: understanding of menopause, concerns about HRT (cancer risk), expectations

**Clinical Management:**
- Diagnose menopause clinically in women >45 with typical symptoms (no blood tests needed per NICE NG23)
- Discuss HRT: benefits (symptom relief, bone protection) vs risks (small increase in breast cancer, VTE with oral HRT)
- Tailor HRT: oestrogen-only if hysterectomy, combined if uterus intact; transdermal preferred if VTE risk
- Non-hormonal alternatives: CBT for mood/vasomotor, vaginal oestrogen for GSM
- Lifestyle advice: exercise, weight management, smoking cessation
- Contraception: advise continuing for 1 year after last period if >50, 2 years if <50

**References:**
- NICE NG23: Menopause - https://www.nice.org.uk/guidance/ng23
- NICE CKS: Menopause - https://cks.nice.org.uk/topics/menopause/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored menopausal symptoms comprehensively (vasomotor, urogenital, psychological)", "Assessed impact on quality of life, sleep, work, and relationships", "Established menstrual history and menopausal stage", "Screened for contraindications to HRT (breast cancer, VTE, migraines)", "Assessed ongoing contraceptive needs", "Explored ICE (concerns about HRT risks, expectations for symptom relief)", "Completed data gathering within approximately 6 minutes", "Consultation was empathetic and well-structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Diagnosed menopause clinically without unnecessary blood tests (per NICE NG23)", "Discussed HRT options with balanced risk-benefit information", "Tailored HRT choice to the patient''s risk profile (transdermal if VTE risk)", "Discussed non-hormonal alternatives where appropriate", "Addressed vaginal symptoms and topical oestrogen", "Provided lifestyle advice (exercise, weight, smoking)", "Addressed contraceptive needs during perimenopause", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Validated the impact of menopausal symptoms on daily life", "Addressed HRT concerns without dismissing them", "Provided balanced information empowering informed choice", "Allowed the patient to express preferences and concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'ab1d3b88-5e91-483c-842b-185d2fcfa2eb';

-- =============================================
-- Migraine with Aura (FC-049)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Diagnosis of migraine with aura, awareness of contraceptive implications, appropriate prophylaxis, and red flag headache screening.

**Data Gathering:**
- Headache: unilateral, throbbing, duration (4-72 hours), severity, frequency
- Aura features: visual (zigzag lines, scotoma), sensory, motor, duration (<60 mins, before headache)
- Associated features: nausea, vomiting, photophobia, phonophobia
- Red flags: thunderclap onset, new >50 years, progressive, postural, with fever, focal neurology
- Triggers: stress, menstruation, diet, sleep, dehydration
- Current contraception: COCP contraindicated in migraine with aura
- Impact on daily life, work, school
- ICE: concern about brain tumour, impact on contraception

**Clinical Management:**
- Diagnosis is clinical: migraine with aura per ICHD-3 criteria
- Acute treatment: triptans (sumatriptan) + NSAID or paracetamol, antiemetic
- If ≥4 migraines/month or significant disability: prophylaxis (propranolol, topiramate, amitriptyline)
- STOP combined hormonal contraception if migraine with aura (UKMEC 4) - switch to POP/implant/IUD
- Headache diary recommended
- Imaging NOT routinely indicated if classic migraine pattern

**References:**
- NICE CG150: Headaches in over 12s - https://www.nice.org.uk/guidance/cg150
- NICE CKS: Migraine - https://cks.nice.org.uk/topics/migraine/
- FSRH: UKMEC - https://www.fsrh.org/documents/ukmec/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Characterised the headache pattern (unilateral, throbbing, duration, severity)", "Identified and described aura features accurately", "Screened for red flag headache features", "Explored triggers (stress, menstruation, diet, sleep)", "Asked about current contraception (critical for migraine with aura)", "Assessed impact on daily life and frequency", "Explored ICE (brain tumour fears, contraception concerns)", "Consultation was systematic and thorough"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Diagnosed migraine with aura clinically", "Prescribed appropriate acute treatment (triptan + analgesic)", "Discussed prophylaxis if frequent migraines", "Identified that COCP is contraindicated (UKMEC 4) and offered alternative", "Recommended a headache diary", "Explained that imaging is not routinely indicated", "Provided specific safety-netting (thunderclap headache, new features)", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Addressed the patient''s brain tumour concern sensitively", "Handled the contraception change discussion with care", "Used clear language when explaining aura and migraine", "Allowed the patient to express concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '33ac527f-47d0-490b-838c-4de4333488b8';

-- =============================================
-- New Hypertension (FC-050)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment and diagnosis of new hypertension, ABPM/HBPM for confirmation, cardiovascular risk assessment, and initiating treatment.

**Data Gathering:**
- How hypertension was detected: routine check, incidental, symptoms
- Previous BP readings, any home monitoring
- Cardiovascular risk factors: smoking, diabetes, lipids, BMI, family history, ethnicity
- Target organ damage symptoms: headaches, visual disturbance, chest pain, oedema
- Secondary causes screen: young patient, resistant HTN, renal bruits, cushingoid features
- Lifestyle: salt, exercise, alcohol, stress
- PMH, medications (NSAIDs, OCP can raise BP)
- ICE: understanding of hypertension, concern about long-term medication

**Clinical Management:**
- Confirm with ABPM or HBPM before diagnosing (NICE NG136)
- Stage hypertension: Stage 1 (≥140/90 clinic, ≥135/85 ABPM), Stage 2 (≥160/100 clinic, ≥150/95 ABPM)
- Bloods: U&Es, eGFR, lipids, HbA1c, urine ACR
- QRISK3 assessment: statin if ≥10%
- Treatment: if <55/non-Black: ACEi/ARB; if ≥55 or Black: CCB per NICE algorithm
- Lifestyle advice: DASH diet, reduce salt, exercise, moderate alcohol
- Safety-net: attend if severe headache, visual changes, chest pain

**References:**
- NICE NG136: Hypertension in adults - https://www.nice.org.uk/guidance/ng136
- NICE CKS: Hypertension - https://cks.nice.org.uk/topics/hypertension/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored how hypertension was detected and previous readings", "Assessed cardiovascular risk factors comprehensively", "Screened for target organ damage", "Considered secondary causes of hypertension", "Reviewed lifestyle factors (salt, exercise, alcohol)", "Explored ICE (concern about long-term medication, understanding of risks)", "Reviewed medications that could contribute to raised BP", "Completed data gathering within approximately 6 minutes"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Arranged ABPM/HBPM to confirm diagnosis per NICE NG136", "Staged hypertension correctly", "Arranged appropriate baseline investigations", "Calculated or discussed QRISK3", "Chose appropriate first-line antihypertensive per NICE algorithm", "Provided tailored lifestyle advice", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making about starting treatment"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Explained hypertension and its implications clearly", "Addressed the patient''s concerns about lifelong medication", "Used accessible language without medical jargon", "Allowed the patient to express concerns and ask questions", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'bf0cdb1a-e403-48d7-b409-158b5259053d';
