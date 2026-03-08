-- Migration 070: Fix marking criteria and model answers for FC-xxx cases (batch 3: remaining FC cases)

-- =============================================
-- Obesity and Weight (FC-026)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Sensitive discussion about weight management, assessment of obesity-related comorbidities, and shared decision-making about interventions.

**Data Gathering:**
- Weight history: trajectory, previous diets, triggers for weight gain
- Current diet and exercise habits
- Psychological factors: emotional eating, binge eating, low mood, body image
- Comorbidities screen: type 2 diabetes, hypertension, OSA, joint pain, GORD
- Medications contributing to weight gain (steroids, antipsychotics, insulin, antidepressants)
- FHx: obesity, diabetes, cardiovascular disease
- ICE: what prompted attendance, previous attempts, expectations about medication/surgery

**Clinical Management:**
- BMI calculation and waist circumference; acknowledge BMI limitations
- Bloods: HbA1c, lipids, TFTs, LFTs
- Tier 2 weight management referral (community programme)
- Discuss pharmacological options if BMI ≥30 or ≥27 with comorbidities (orlistat, semaglutide/liraglutide per NICE TA875)
- Tier 3/4 bariatric surgery referral criteria (BMI ≥40, or ≥35 with comorbidities)
- Address psychological factors: refer to counselling if emotional eating
- Realistic goal setting: 5-10% weight loss improves health outcomes

**References:**
- NICE CG189: Obesity - https://www.nice.org.uk/guidance/cg189
- NICE CKS: Obesity - https://cks.nice.org.uk/topics/obesity/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored weight history sensitively (trajectory, triggers, previous attempts)", "Assessed current diet and exercise habits", "Screened for obesity-related comorbidities (diabetes, HTN, OSA, joint pain)", "Identified medications contributing to weight gain", "Explored psychological factors (emotional eating, mood, body image)", "Explored ICE (what prompted attendance, medication/surgery expectations)", "Completed data gathering within approximately 6 minutes", "Consultation was non-judgemental and empathetic"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Calculated BMI and discussed its implications appropriately", "Arranged relevant screening bloods (HbA1c, lipids, TFTs)", "Discussed Tier 2 weight management referral", "Discussed pharmacological options where appropriate per NICE", "Set realistic weight loss goals (5-10% for health benefits)", "Addressed psychological factors and offered appropriate support", "Provided specific safety-netting and follow-up", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the topic of weight with sensitivity and without judgement", "Avoided using stigmatising language", "Used person-first language", "Allowed the patient to express their feelings about weight", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'c890a5db-2ba6-471d-a5b1-1164ef2a33d4';

-- =============================================
-- Palpitations (FC-008)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of palpitations, differentiation between benign and sinister causes, appropriate investigation, and patient reassurance.

**Data Gathering:**
- Palpitations: character (fast, slow, irregular, skipped beats), duration, frequency, onset
- Associated symptoms: dizziness, syncope, chest pain, breathlessness
- Triggers: caffeine, alcohol, exercise, stress, position
- Red flags: syncope with palpitations, family history of sudden cardiac death (<40 years), structural heart disease
- Thyroid symptoms: weight changes, tremor, heat intolerance
- Medication/substances: caffeine, decongestants, salbutamol, recreational drugs
- ICE: worry about heart attack, impact on daily activities

**Clinical Management:**
- 12-lead ECG (may be normal between episodes)
- If paroxysmal: ambulatory monitoring (24hr/48hr Holter or event recorder)
- Bloods: TFTs, FBC, U&Es, magnesium, calcium
- If benign ectopics and no red flags: reassure, reduce caffeine/alcohol
- If AF detected: manage per NICE NG196 (rate control, CHA2DS2-VASc)
- If red flags: urgent cardiology referral
- Safety-net: attend A&E if prolonged episode, syncope, or chest pain

**References:**
- NICE CKS: Palpitations - https://cks.nice.org.uk/topics/palpitations/
- NICE NG196: Atrial fibrillation - https://www.nice.org.uk/guidance/ng196',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Characterised the palpitations (character, duration, frequency, onset)", "Asked about associated symptoms (dizziness, syncope, chest pain)", "Identified triggers (caffeine, alcohol, stress, exercise)", "Screened for red flags (syncope, family history of sudden death)", "Screened for thyroid dysfunction", "Explored ICE (worry about heart attack, impact on daily life)", "Completed data gathering within approximately 6 minutes", "Consultation was structured and reassuring"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Arranged appropriate investigations (ECG, ambulatory monitoring, bloods)", "Discussed the likely benign nature if no red flags", "Provided appropriate lifestyle advice (reduce caffeine, alcohol)", "Identified indications for cardiology referral", "Explained what ambulatory monitoring involves", "Provided specific safety-netting (A&E if syncope, chest pain, prolonged episode)", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Addressed the patient''s cardiac anxiety sensitively", "Provided balanced reassurance without dismissing symptoms", "Used clear language when explaining investigations", "Allowed the patient to express their concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '8a9c28bf-1c6b-41df-ba1a-fd37962bf53c';

-- =============================================
-- Postnatal Low Mood (FC-027)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Recognition of postnatal depression vs baby blues, risk assessment including mother and infant safety, and appropriate management.

**Data Gathering:**
- Mood: onset (baby blues within 2 weeks, PND persisting >2 weeks), severity, PHQ-9/Edinburgh Postnatal Depression Scale
- Symptoms: tearfulness, difficulty bonding, guilt, sleep beyond baby-related disruption, appetite
- Risk to self: suicidal ideation, self-harm
- Risk to baby: intrusive thoughts about harming the baby, ability to care for baby
- Birth experience: traumatic birth, birth expectations vs reality
- Support network: partner, family, health visitor involvement
- PMH: previous mental health issues, previous postnatal illness
- ICE: concern about being a bad mother, fear of baby being taken away

**Clinical Management:**
- If mild: guided self-help, peer support, health visitor monitoring
- If moderate-severe: consider SSRI (sertraline safe in breastfeeding per BNF), referral to perinatal mental health team
- If risk to self or baby: urgent perinatal psychiatry referral, crisis plan
- Discuss bonding difficulties without judgement
- Ensure health visitor and midwifery team are informed
- Safety-net: crisis contacts, return sooner if worsening, encourage partner involvement

**References:**
- NICE CG192: Antenatal and postnatal mental health - https://www.nice.org.uk/guidance/cg192
- NICE CKS: Depression postnatal - https://cks.nice.org.uk/topics/depression-antenatal-and-postnatal/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored mood symptoms comprehensively (onset, severity, duration)", "Differentiated postnatal depression from baby blues", "Conducted thorough risk assessment (self-harm, suicidal ideation)", "Assessed risk to the baby (intrusive thoughts, bonding, ability to care)", "Explored the birth experience and its impact", "Assessed support network and partner involvement", "Explored ICE (fear of being judged as a bad mother, fear of baby being removed)", "Consultation was sensitively paced"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Applied NICE CG192 stepped care approach", "Discussed appropriate medication options (sertraline safe in breastfeeding)", "Considered perinatal mental health team referral if moderate-severe", "Developed a safety plan if risk identified", "Ensured health visitor and midwifery team involvement", "Addressed bonding difficulties without judgement", "Provided crisis contacts and safety-netting", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the topic with exceptional sensitivity", "Normalised the experience without minimising the distress", "Reassured about not being a bad mother without being dismissive", "Created a safe space for the patient to express difficult emotions", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'b1d2856d-986a-45de-b7fb-3204983d223f';

-- =============================================
-- Rash in Child (FC-028)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of a rash in a child, differentiation between benign and serious causes, recognition of non-blanching rashes, and parental reassurance.

**Data Gathering:**
- Rash: onset, distribution, evolution, blanching vs non-blanching (glass test)
- Associated symptoms: fever, coryzal symptoms, sore throat, itch, malaise
- The child''s behaviour: feeding, alertness, activity level
- Recent illness contacts, nursery/school attendance
- Vaccination history
- Allergies, medications, recent antibiotics
- PMH: eczema, atopy, previous rashes
- ICE: parent''s concern about meningitis or allergic reaction

**Clinical Management:**
- Non-blanching rash with fever: treat as meningococcal septicaemia until proven otherwise - call 999/urgent admission
- Viral exanthem: reassure, supportive management, review if worsening
- Urticaria/allergic: antihistamines, identify trigger, consider allergy referral
- If scarlet fever suspected: phenoxymethylpenicillin, notify PHE
- Safety-net: seek urgent help if non-blanching rash, child becoming drowsy, not feeding, high fever unresponsive to antipyretics

**References:**
- NICE NG51: Sepsis - https://www.nice.org.uk/guidance/ng51
- NICE CKS: Rashes in children - https://cks.nice.org.uk/topics/rashes-in-children/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Described the rash characteristics (onset, distribution, blanching test)", "Asked about systemic symptoms (fever, feeding, alertness)", "Assessed the child''s behaviour and wellbeing", "Screened for serious causes (meningococcal, sepsis)", "Asked about vaccination history and illness contacts", "Explored ICE (parent''s concern about meningitis, level of worry)", "Completed data gathering within approximately 6 minutes", "Communicated clearly with the parent"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised when to treat as meningococcal sepsis (non-blanching + fever)", "Managed benign viral rash with appropriate reassurance", "Identified when antibiotics are indicated (scarlet fever)", "Taught the parent the glass test for non-blanching rash", "Addressed vaccination status and opportunistic immunisation", "Provided clear and specific safety-netting for parents", "Engaged the parent in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful to the parent throughout", "Acknowledged parental anxiety appropriately", "Avoided being dismissive of the parent''s concern", "Used clear and accessible language", "Demonstrated warmth and concern for the child", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'c540a92a-04c0-4eef-9afe-db05d9de3c7c';

-- =============================================
-- Recurrent Thrush (FC-009)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Management of recurrent vulvovaginal candidiasis, identifying contributing factors, appropriate treatment, and when to investigate further.

**Data Gathering:**
- Symptoms: vaginal discharge (thick, white, cottage cheese), itch, soreness, dyspareunia
- Recurrence pattern: frequency (≥4 episodes/year = recurrent), triggers
- Previous treatments: over-the-counter, prescribed, response
- Contributing factors: antibiotics, diabetes, immunosuppression, pregnancy, tight clothing
- Sexual history: STI risk (discharge could be other cause), partner treatment
- Diabetes screen: polyuria, polydipsia, weight loss
- ICE: frustration with recurrence, concern about underlying cause, impact on relationships

**Clinical Management:**
- Confirm diagnosis: if recurrent, consider swab for culture and sensitivity
- If recurrent (≥4/year): induction with oral fluconazole (150mg every 72 hours x3), then maintenance (150mg weekly for 6 months)
- Screen for diabetes (HbA1c) if recurrent
- Review contributing factors (antibiotics, tight clothing, perfumed products)
- If atypical symptoms: swab for STI screen
- Safety-net: return if symptoms change, not responding, or new partner symptoms

**References:**
- NICE CKS: Candida female genital - https://cks.nice.org.uk/topics/candida-female-genital/
- BASHH: Vulvovaginal candidiasis guideline - https://www.bashhguidelines.org/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored symptoms in detail (discharge characteristics, itch, soreness)", "Established recurrence pattern and frequency", "Asked about previous treatments and their effectiveness", "Identified contributing factors (antibiotics, diabetes, immunosuppression)", "Took a sensitive sexual history to exclude STIs", "Explored ICE (frustration with recurrence, impact on relationships)", "Completed data gathering within approximately 6 minutes", "Consultation was sensitive and non-judgemental"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered swab for culture if recurrent to confirm Candida species", "Prescribed appropriate induction and maintenance regimen per NICE CKS", "Screened for diabetes (HbA1c) as contributing factor", "Addressed modifiable contributing factors", "Offered STI screening if appropriate", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the sensitive topic with empathy", "Validated the patient''s frustration with recurrence", "Used clear and accessible language", "Allowed the patient to express impact on relationships", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '9b12f4a7-f380-4c9b-b403-89334dd9d8df';

-- =============================================
-- Request for Sick Note (FC-007)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Managing a request for a fit note, understanding the fit note system, exploring work-related issues, and appropriate certification.

**Data Gathering:**
- Why they need a sick note: what condition, duration off work
- Current symptoms and functional limitations
- Nature of their work: physical demands, role, duties
- Relationship with employer and workplace issues
- Mental health screening if stress/anxiety-related
- Previous sick leave and pattern
- PMH, current treatment
- ICE: what they hope the sick note will achieve, concerns about work, fear of losing job

**Clinical Management:**
- Fit note options: "not fit for work" or "may be fit for work with adjustments"
- If may be fit: suggest phased return, amended duties, altered hours, workplace adaptations
- Duration: appropriate to condition, avoid unnecessarily long certification
- If workplace issue (bullying, harassment): signpost to ACAS, occupational health, HR
- If mental health: consider treatment alongside certification
- Do not issue fit notes retrospectively or if no clinical justification
- Safety-net: return if not improving, access to Employee Assistance Programme

**References:**
- DWP: Fit note guidance for GPs - https://www.gov.uk/government/collections/fit-note
- NICE CKS: Fitness for work - https://cks.nice.org.uk/topics/fitness-for-work/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the reason for the sick note request", "Assessed current symptoms and functional limitations", "Asked about the nature of their work and specific duties", "Explored workplace issues (stress, bullying, work environment)", "Screened for mental health symptoms if relevant", "Explored ICE (what they hope to achieve, fears about job)", "Completed data gathering within approximately 6 minutes", "Consultation was non-judgemental and thorough"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Understood the fit note system (not fit vs may be fit with adjustments)", "Considered workplace adjustments before certifying as unfit", "Issued an appropriate duration of certification", "Addressed underlying health issues alongside certification", "Signposted to relevant support services (ACAS, OH, EAP)", "Provided specific safety-netting and follow-up", "Engaged the patient in shared decision-making about return to work"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Avoided being dismissive of the sick note request", "Showed understanding of the patient''s work-related distress", "Used clear and supportive language", "Allowed the patient to express their concerns about work", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'c35b67c9-8dc2-45fb-994b-363cbac81128';

-- =============================================
-- Request for Sleeping Tablets (FC-004)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Managing a request for hypnotics, understanding insomnia management guidelines, exploring underlying causes, and managing patient expectations.

**Data Gathering:**
- Sleep pattern: difficulty initiating vs maintaining sleep, early waking, duration, quality
- Sleep hygiene: caffeine, alcohol, screens, bedroom environment, routine, naps
- Underlying causes: stress, anxiety, depression, pain, nocturia, OSA
- Impact: work, concentration, relationships, driving safety, mood
- Previous sleep medication: what, duration, effectiveness, dependence history
- Expectations: why they want tablets specifically, awareness of risks
- PMH, current medications, substance use
- ICE: what is driving the request, frustration with sleep, expectations

**Clinical Management:**
- Avoid prescribing Z-drugs or benzodiazepines for chronic insomnia (NICE NG215)
- First-line: sleep hygiene education and CBT for insomnia (CBT-I)
- Digital CBT-I available (Sleepstation, Sleepio)
- Address underlying causes: treat depression/anxiety, manage pain, refer for OSA assessment
- If short-term crisis: consider very short course (3-7 days only) with clear plan
- Safety-net: follow-up to review, return if mood deteriorates, crisis contacts

**References:**
- NICE NG215: Insomnia disorder - https://www.nice.org.uk/guidance/ng215
- NICE CKS: Insomnia - https://cks.nice.org.uk/topics/insomnia/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the sleep pattern comprehensively", "Assessed sleep hygiene factors in detail", "Screened for underlying causes (depression, anxiety, pain, OSA)", "Assessed impact on daily functioning and safety", "Asked about previous medication use and awareness of risks", "Explored ICE (why tablets specifically, frustration, expectations)", "Completed data gathering within approximately 6 minutes", "Consultation was empathetic and thorough"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Avoided prescribing hypnotics for chronic insomnia per NICE NG215", "Recommended CBT-I as first-line treatment", "Addressed underlying causes (depression, anxiety, pain)", "Provided specific and practical sleep hygiene advice", "Handled the medication request sensitively with explanation", "Discussed digital CBT-I options (Sleepstation, Sleepio)", "Provided safety-netting and follow-up plan", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Validated the distress of insomnia", "Avoided being dismissive of the medication request", "Explained the rationale for not prescribing clearly and empathetically", "Allowed the patient to express frustration", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '0b3b7c1d-c1cd-49ab-91ba-c843022804d7';

-- =============================================
-- Statin Intolerance (FC-029)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Management of reported statin intolerance, differentiating true intolerance from nocebo effect, and cardiovascular risk management.

**Data Gathering:**
- Side effects experienced: muscle pain, weakness, GI symptoms, timing of onset
- Which statin and dose, duration before symptoms started
- Relationship: did symptoms resolve on stopping, recur on restarting
- CK level if measured (important for true myopathy)
- Cardiovascular risk: QRISK3, existing CVD, diabetes, familial hypercholesterolaemia
- Other medications: interacting drugs (macrolides, fibrates, azoles)
- ICE: beliefs about statins (media influence), concern about side effects vs cardiovascular risk

**Clinical Management:**
- Try alternative statin (e.g. switch atorvastatin to rosuvastatin or vice versa)
- Consider lower dose with gradual up-titration, or alternate day dosing
- Check CK if muscle symptoms (if >5x ULN: stop statin, refer)
- If truly intolerant to multiple statins: consider ezetimibe, PCSK9 inhibitors (specialist)
- Discuss cardiovascular risk clearly - benefit vs risk of not taking statin
- Address media concerns about statins with balanced evidence
- Safety-net: return if new muscle symptoms, monitor lipids

**References:**
- NICE CG181: Cardiovascular disease risk assessment - https://www.nice.org.uk/guidance/cg181
- NICE CKS: Lipid modification - https://cks.nice.org.uk/topics/lipid-modification-cvd-prevention/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the side effects in detail (type, timing, dose relationship)", "Asked about dechallenge/rechallenge response", "Reviewed which statin and dose tried", "Assessed cardiovascular risk (QRISK3 or existing CVD)", "Checked for drug interactions", "Explored ICE (media influence on statin beliefs, fear of side effects vs cardiovascular risk)", "Completed data gathering within approximately 6 minutes", "Consultation was thorough and evidence-based"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Discussed trying an alternative statin or lower dose", "Considered alternate day dosing as an option", "Checked or planned CK measurement if muscle symptoms", "Discussed ezetimibe as an alternative if truly intolerant", "Clearly communicated cardiovascular risk of not treating", "Addressed media concerns with balanced evidence", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Validated the patient''s experience of side effects without dismissing", "Avoided lecturing or being dismissive of media concerns", "Used clear language when explaining risk", "Allowed the patient to express their views", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '7310153a-5581-4ac8-94ff-f5dc66ae87e5';

-- =============================================
-- UTI in Woman (FC-031)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Diagnosis and management of uncomplicated UTI, appropriate antibiotic prescribing, and distinguishing from upper tract infection.

**Data Gathering:**
- Lower urinary symptoms: dysuria, frequency, urgency, suprapubic pain, haematuria
- Upper tract symptoms: loin pain, fever, rigors, nausea/vomiting (pyelonephritis)
- Duration and severity
- Recurrence pattern: frequency of UTIs, previous treatments, prophylaxis
- Risk factors: sexual activity, post-menopausal, diabetes, pregnancy
- Urine dipstick results
- PMH, medications, allergies (especially antibiotic allergies)
- ICE: concern about kidney infection, wanting quick treatment

**Clinical Management:**
- Uncomplicated UTI in women: empirical antibiotics (nitrofurantoin first-line, trimethoprim second-line per NICE NG109)
- Send MSU if: recurrent UTI, atypical symptoms, treatment failure, pregnant
- If upper tract features: consider pyelonephritis, may need 7-14 days antibiotics, consider admission
- Self-care advice: hydration, paracetamol for pain
- If recurrent (≥3/year): discuss prevention strategies (post-coital voiding, cranberry, antibiotic prophylaxis)
- Safety-net: return if symptoms worsen, fever, loin pain, or not improving after 48 hours

**References:**
- NICE NG109: Urinary tract infection lower - https://www.nice.org.uk/guidance/ng109
- NICE CKS: UTI lower women - https://cks.nice.org.uk/topics/urinary-tract-infection-lower-women/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored urinary symptoms in detail (dysuria, frequency, urgency, haematuria)", "Distinguished between lower and upper urinary tract infection", "Asked about recurrence pattern and previous treatments", "Identified risk factors for UTI", "Checked for pregnancy", "Explored ICE (concern about kidney infection, wanting quick treatment)", "Completed data gathering within approximately 6 minutes", "Consultation was efficient and well-structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Prescribed appropriate first-line antibiotic per NICE NG109", "Sent MSU if indicated (recurrent, treatment failure)", "Provided appropriate self-care advice", "Discussed prevention strategies if recurrent UTI", "Recognised when to consider pyelonephritis", "Provided specific safety-netting (fever, loin pain, not improving at 48 hours)", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the topic sensitively", "Used clear and accessible language", "Addressed the patient''s concerns about kidney infection", "Allowed the patient to express their concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '10ac1eb5-daa7-4af1-9096-7689dbc08f00';

-- =============================================
-- Vaginal Bleeding Post-Menopause (FC-032)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of post-menopausal bleeding (PMB), recognition as a red flag for endometrial cancer, and appropriate urgent referral.

**Data Gathering:**
- Bleeding: amount, duration, frequency, colour, clots, pattern
- Confirmed post-menopausal: last period (>12 months ago), age at menopause
- Associated symptoms: pelvic pain, vaginal discharge, weight loss
- HRT use: type, duration (can cause breakthrough bleeding)
- PMH: endometrial/breast cancer, obesity, diabetes, tamoxifen use, PCOS
- Cervical screening: up to date?
- ICE: concern about cancer, anxiety about examination and referral

**Clinical Management:**
- ALL post-menopausal bleeding should be referred urgently (2-week wait) per NICE NG12
- Transvaginal USS at gynaecology to assess endometrial thickness
- Do NOT delay referral for empirical HRT adjustment or cervical screening
- If on HRT with known cause: may still warrant investigation
- Examination if appropriate: abdominal, speculum examination
- Safety-net: attend A&E if heavy bleeding, complete referral even if bleeding stops

**References:**
- NICE NG12: Suspected cancer - https://www.nice.org.uk/guidance/ng12
- NICE CKS: Post-menopausal bleeding - https://cks.nice.org.uk/topics/post-menopausal-bleeding/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Characterised the bleeding (amount, duration, frequency, pattern)", "Confirmed menopausal status (last period >12 months ago)", "Asked about HRT use and type", "Screened for associated symptoms (pelvic pain, discharge, weight loss)", "Assessed risk factors for endometrial cancer (obesity, diabetes, tamoxifen)", "Checked cervical screening status", "Explored ICE (cancer concern, anxiety about referral and examination)", "Consultation was sensitively conducted"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised PMB as requiring urgent 2-week wait referral per NICE NG12", "Did not delay referral for empirical treatment or monitoring", "Explained the referral pathway and what to expect (TVUSS, possible biopsy)", "Offered examination if appropriate", "Addressed the patient''s anxiety about cancer with balanced information", "Provided specific safety-netting (A&E if heavy bleeding, complete referral)", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the sensitive topic with empathy", "Addressed cancer fears without dismissing or catastrophising", "Signposted before discussing examination", "Allowed the patient to express concerns and ask questions", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '3c7c443a-5362-49f1-87db-e1ba8032ef60';

-- =============================================
-- Wheezy Child (FC-033)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of wheeze in a child, differentiating viral wheeze from asthma, appropriate management, and parental education.

**Data Gathering:**
- Wheeze: episodic vs persistent, relation to viral infections, between episodes
- Associated symptoms: cough (worse at night), breathlessness, exercise limitation, feeding difficulty
- Atopic history: eczema, hay fever, food allergies, family history of asthma/atopy
- Triggers: viral illness, exercise, cold air, allergens, passive smoke exposure
- Previous episodes: frequency, previous hospital admissions, oral steroid use
- Current medications: salbutamol use frequency
- ICE: parent concern about asthma diagnosis, impact on activities/school

**Clinical Management:**
- If <5 years with episodic viral wheeze: likely viral-induced wheeze, not asthma
- Trial of inhaled salbutamol via spacer and mask
- If recurrent or interval symptoms: consider ICS trial (NICE NG80/BTS-SIGN)
- If atopic, family history, and interval symptoms: more likely asthma diagnosis
- Parental education: spacer technique, when to use reliever, when to seek urgent help
- Safety-net: attend A&E if respiratory distress, unable to feed, drowsy, blue

**References:**
- NICE NG80: Asthma management - https://www.nice.org.uk/guidance/ng80
- BTS/SIGN: British guideline on asthma - https://www.brit-thoracic.org.uk/quality-improvement/guidelines/asthma/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the wheeze pattern (episodic vs persistent, viral triggers)", "Asked about interval symptoms between episodes", "Assessed atopic history (eczema, hay fever, FHx)", "Asked about episode frequency and severity (admissions, steroids)", "Assessed current reliever use frequency", "Explored ICE (parental concern about asthma diagnosis, impact on activities)", "Completed data gathering within approximately 6 minutes", "Communicated effectively with the parent"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Differentiated between viral wheeze and asthma appropriately", "Prescribed salbutamol via spacer and age-appropriate device", "Discussed ICS trial if recurrent or interval symptoms", "Demonstrated or discussed spacer technique with parent", "Provided an asthma action plan if initiating treatment", "Provided clear safety-netting (respiratory distress signs, unable to feed, drowsy)", "Engaged the parent in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful to the parent throughout", "Acknowledged parental concern and worry", "Used clear and jargon-free language", "Demonstrated patience in explaining diagnosis and treatment", "Allowed the parent to ask questions", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'cb56d310-ac3a-40a1-81b5-fad343ac0a64';

-- =============================================
-- X-ray Request for Back (FC-034)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Managing a patient request for imaging that is not clinically indicated, evidence-based explanation, and maintaining the therapeutic relationship.

**Data Gathering:**
- Back pain: duration, severity, character, radiation
- Red flags: cauda equina, malignancy, fracture, infection features
- Functional impact: work, activities, sleep
- Previous investigations and treatments
- Why they want an X-ray: reassurance, employer requirement, previous experience
- PMH, medications
- ICE: belief that X-ray will show what is wrong, concern about serious pathology

**Clinical Management:**
- Explain that X-rays of the spine are NOT recommended for non-specific low back pain (NICE NG59)
- X-rays expose to radiation without changing management for mechanical LBP
- Degenerative changes on X-ray are common and not necessarily the cause of pain
- If red flags: appropriate imaging (MRI, not X-ray) is indicated
- Offer evidence-based management instead: exercise, physiotherapy, analgesia
- If employer requires: discuss fit note or occupational health instead
- Safety-net: return if new neurological symptoms, cauda equina symptoms

**References:**
- NICE NG59: Low back pain and sciatica - https://www.nice.org.uk/guidance/ng59
- Choosing Wisely UK: Imaging for low back pain - https://www.choosingwisely.co.uk/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the back pain appropriately to rule out red flags", "Assessed functional impact and severity", "Asked about previous investigations and treatments", "Understood why the patient is requesting an X-ray specifically", "Explored ICE (belief that X-ray will provide answers, concern about serious cause)", "Completed data gathering within approximately 6 minutes", "Consultation was structured and empathetic"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained why X-ray is not recommended per NICE NG59", "Discussed the risks of unnecessary radiation", "Explained that degenerative changes are common and may not explain symptoms", "Offered evidence-based management alternatives (physiotherapy, exercise)", "Handled the request sensitively without dismissing the patient", "Addressed employer-related reasons if applicable", "Provided specific safety-netting for red flag symptoms", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Validated the patient''s concern without agreeing to inappropriate investigation", "Avoided being confrontational or dismissive", "Explained the rationale clearly and empathetically", "Allowed the patient to express their reasoning and frustration", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '78a2ff59-2042-48b5-90da-bac7c6d400a4';

-- =============================================
-- Young Person Chest Pain (FC-035)
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Assessment of chest pain in a young person, differentiating musculoskeletal and anxiety-related causes from cardiac, and appropriate reassurance.

**Data Gathering:**
- Pain: location, character (sharp/stabbing vs central crushing), duration, radiation, pleuritic
- Associated symptoms: breathlessness, palpitations, dizziness, sweating
- Triggers: exertion, breathing, position, stress, anxiety
- Red flags: exertional syncope, family history of sudden cardiac death (<40 years), known cardiac condition
- Musculoskeletal: reproducible on palpation, injury, posture
- Anxiety assessment: GAD-7, life stressors, panic attacks
- Drug use: cocaine, stimulants, energy drinks, caffeine
- ICE: fear of heart attack, impact on exercise/activities

**Clinical Management:**
- If musculoskeletal: reassure, simple analgesia, posture advice
- If anxiety/panic: explain mechanism of chest tightness, offer anxiety management (CBT, guided self-help)
- If red flags (exertional syncope, FHx sudden death): ECG, urgent cardiology referral
- ECG if clinical suspicion warrants it (good practice for reassurance if anxious)
- Avoid over-investigation in the absence of red flags
- Safety-net: return if exertional symptoms, syncope, or persistent/worsening pain

**References:**
- NICE CKS: Chest pain - https://cks.nice.org.uk/topics/chest-pain/
- NICE CG113: Generalised anxiety disorder - https://www.nice.org.uk/guidance/cg113',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored chest pain in detail (character, location, duration, triggers)", "Screened for cardiac red flags (exertional syncope, FHx sudden death)", "Assessed for musculoskeletal cause (reproducible, positional, injury)", "Screened for anxiety and panic attacks", "Asked about substance use (cocaine, stimulants, caffeine)", "Explored ICE (fear of heart attack, impact on activities)", "Completed data gathering within approximately 6 minutes", "Consultation was reassuring and well-structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Differentiated between MSK, anxiety, and cardiac causes", "Decided appropriately about ECG (not over-investigating without red flags)", "Provided appropriate management for the likely diagnosis", "If anxiety: discussed the mechanism and offered appropriate support", "Avoided over-medicalising in the absence of red flags", "Provided specific safety-netting (exertional symptoms, syncope)", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Addressed the patient''s cardiac fear sensitively", "Provided reassurance without being dismissive", "Used age-appropriate communication", "Allowed the patient to express their concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '4d101072-f9e8-4d99-a3a2-fecb0249fe97';

-- =============================================
-- Recurrent Migraine (FC-001) - only needs model answer fix
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Management of recurrent migraine, consideration of prophylaxis, headache diary use, and appropriate acute treatment.

**Data Gathering:**
- Headache characteristics: unilateral, throbbing, duration, severity, frequency
- Aura: visual, sensory, motor features
- Associated features: nausea, vomiting, photophobia, phonophobia
- Triggers: stress, menstruation, diet, sleep, dehydration, alcohol
- Red flag headache features: thunderclap, new >50, progressive, with fever, focal neurology
- Impact on daily life, work, school, relationships
- Current and previous treatments: acute and prophylactic
- Medication overuse: frequency of analgesic/triptan use (≥10-15 days/month)
- ICE: concern about brain tumour, desire for better control

**Clinical Management:**
- Acute treatment: triptan (sumatriptan) + NSAID or paracetamol, antiemetic (metoclopramide)
- If ≥4 migraines/month or significant disability: prophylaxis
- First-line prophylaxis: propranolol (contraindicated in asthma), topiramate (contraindicated if pregnant/planning), amitriptyline
- Medication overuse headache: if using acute treatment ≥10-15 days/month, plan withdrawal
- Headache diary for trigger identification and frequency monitoring
- Contraception review if migraine with aura (COCP contraindicated)
- Safety-net: return if pattern changes, new features, or prophylaxis not effective at 2-3 months

**References:**
- NICE CG150: Headaches in over 12s - https://www.nice.org.uk/guidance/cg150
- NICE CKS: Migraine - https://cks.nice.org.uk/topics/migraine/'
WHERE id = 'a8186750-4a16-49b5-b996-9939060ce842';

-- =============================================
-- New Type 2 Diabetes (FC-002) - needs domain 3 marking fix + model answer
-- =============================================
UPDATE sca_cases SET
  model_answer = '## Model Approach

**What this case is testing:** Breaking news of a new diabetes diagnosis, initial management, education, and structured diabetes care planning.

**Data Gathering:**
- How diagnosis was made: symptoms, screening, incidental HbA1c
- Symptoms: polyuria, polydipsia, weight loss, fatigue, recurrent infections
- Cardiovascular risk factors: hypertension, smoking, lipids, BMI, family history
- Diet and exercise habits
- Psychosocial impact: work, driving, insurance, emotional response to diagnosis
- PMH: cardiovascular disease, renal disease, eye problems
- ICE: understanding of diabetes, fears about complications (blindness, amputation), concern about medication

**Clinical Management:**
- Lifestyle advice first-line alongside metformin (NICE NG28)
- Metformin: start low dose, titrate, modified release if GI side effects
- Target HbA1c: 48 mmol/mol (6.5%) initially, 53 mmol/mol (7.0%) if on medication
- Annual reviews: 8 care processes (HbA1c, BP, lipids, renal, eyes, feet, BMI, smoking)
- Education programme: refer to structured education (DESMOND or equivalent)
- Driving: inform DVLA if on certain medications
- Safety-net: return if symptoms worsen, hypoglycaemia (less likely with metformin alone), follow-up in 3 months

**References:**
- NICE NG28: Type 2 diabetes in adults - https://www.nice.org.uk/guidance/ng28
- NICE CKS: Diabetes type 2 - https://cks.nice.org.uk/topics/diabetes-type-2/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored how the diagnosis was made and current symptoms", "Assessed cardiovascular risk factors comprehensively", "Asked about current diet and exercise habits", "Explored the psychosocial impact of the diagnosis", "Assessed for complications (eyes, feet, renal)", "Explored ICE (fears about complications, understanding of diabetes, medication concerns)", "Completed data gathering within approximately 6 minutes", "Consultation was sensitive and well-paced"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Initiated metformin as first-line per NICE NG28", "Set appropriate HbA1c target", "Discussed lifestyle modification (diet, exercise, weight management)", "Referred to structured diabetes education (DESMOND)", "Discussed the 8 care processes and annual review structure", "Addressed DVLA notification if applicable", "Provided safety-netting and arranged 3-month follow-up", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the new diagnosis with empathy and sensitivity", "Allowed time for the patient to process the diagnosis", "Addressed fears about complications without catastrophising", "Used clear language without medical jargon", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'a28222ca-8f35-47fc-be1d-a4213c466020';
