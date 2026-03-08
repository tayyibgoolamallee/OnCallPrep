-- Migration 067: Fix the 11 cases with 5 issues (missing actor behaviour + short marking + short model answer)
-- These are the worst-quality cases and need actor behaviour, expanded marking criteria, and longer model answers.

-- =============================================
-- 1. Blood in Stool (FC-038)
-- =============================================
UPDATE sca_cases SET
  actor_behaviour = 'You are worried but trying to stay calm. You are a bit embarrassed talking about bowel habits. If the doctor is gentle and reassuring, you open up about the bleeding. If they seem rushed, you hold back details. You want to know if it could be cancer because your uncle had bowel cancer.',
  model_answer = '## Model Approach

**What this case is testing:** Ability to take a sensitive history about rectal bleeding, assess for red flags (colorectal cancer), and manage appropriately.

**Data Gathering:**
- Establish the nature of the bleeding: colour (bright red vs dark), amount, frequency, mixed with stool or on paper
- Ask about associated symptoms: change in bowel habit, weight loss, abdominal pain, tenesmus
- Screen for red flags: unexplained weight loss, iron deficiency anaemia, abdominal mass, family history of bowel cancer
- Explore ICE: patient likely worried about cancer given family history

**Clinical Management:**
- If red flags present or age >40 with unexplained change in bowel habit: 2-week wait referral for suspected colorectal cancer (NICE NG12)
- If likely haemorrhoids: conservative management with dietary advice, topical treatments
- Safety-net: return if symptoms persist, worsen, or new symptoms develop
- Consider FBC to check for anaemia

**References:**
- NICE NG12: Suspected cancer recognition and referral - https://www.nice.org.uk/guidance/ng12
- NICE CKS: Rectal bleeding - https://cks.nice.org.uk/topics/rectal-bleeding/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the nature of rectal bleeding in detail (colour, amount, frequency, relation to stool)", "Asked about change in bowel habit and associated GI symptoms", "Screened for red flag symptoms (weight loss, anaemia symptoms, family history of bowel cancer)", "Explored ideas, concerns, and expectations (especially cancer worry)", "Gathered relevant PMH and medication history (anticoagulants, NSAIDs)", "Completed data gathering within approximately 6 minutes", "Maintained a comfortable and sensitive pace", "Consultation had clear direction and structure"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Formulated an appropriate differential diagnosis (haemorrhoids vs malignancy)", "Applied NICE NG12 2-week wait criteria correctly", "Incorporated the patient''s cancer worry into the management plan", "Offered appropriate initial investigations (FBC, consider PR exam)", "Provided clear and specific safety-netting advice", "Discussed referral pathway and what to expect", "Gave appropriate lifestyle and dietary advice", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the sensitive nature of the topic with care", "Signposted before asking about bowel habits", "Addressed the patient''s cancer fears empathetically", "Used clear language without medical jargon", "Asked the patient to confirm the plan and next steps"]}
  }'::jsonb
WHERE id = 'f9bbd77a-0b72-400d-a2c6-8e75e0719b39';

-- =============================================
-- 2. Dysphagia (FC-040)
-- =============================================
UPDATE sca_cases SET
  actor_behaviour = 'You are anxious and have been avoiding eating because of the difficulty swallowing. You are losing weight because of this. If the doctor asks sensitively, you admit you are scared it could be throat cancer. You want a referral and find it hard to wait.',
  model_answer = '## Model Approach

**What this case is testing:** Recognition of dysphagia as a potential red flag for oesophageal or gastric cancer, appropriate use of the 2-week wait pathway.

**Data Gathering:**
- Characterise the dysphagia: solids vs liquids, progressive vs intermittent, duration
- Associated symptoms: odynophagia, weight loss, regurgitation, heartburn, voice changes
- Red flags: progressive dysphagia, weight loss, anaemia, age >55
- PMH: GORD history, Barrett''s oesophagus, smoking, alcohol

**Clinical Management:**
- Progressive dysphagia at any age: 2-week wait referral for upper GI endoscopy (NICE NG12)
- If associated with weight loss or age >55: urgent referral
- Do not delay referral for empirical PPI trial if red flags present
- Safety-net clearly: return sooner if unable to swallow liquids or if symptoms worsen

**References:**
- NICE NG12: Suspected cancer - https://www.nice.org.uk/guidance/ng12
- NICE CKS: Dysphagia - https://cks.nice.org.uk/topics/dysphagia/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Characterised the dysphagia thoroughly (solids vs liquids, progressive vs intermittent)", "Asked about duration and trajectory of symptoms", "Screened for red flags (weight loss, progressive difficulty, anaemia)", "Explored associated symptoms (odynophagia, reflux, voice changes)", "Explored ICE (cancer fears, impact on eating and daily life)", "Gathered relevant risk factors (smoking, alcohol, GORD history)", "Completed data gathering within approximately 6 minutes", "Maintained appropriate pace and structure"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised the need for urgent 2-week wait referral", "Applied NICE NG12 criteria correctly for upper GI cancer", "Did not inappropriately delay referral with a PPI trial", "Discussed what the referral and endoscopy would involve", "Incorporated the patient''s fears into the management plan", "Provided clear safety-netting (return if unable to swallow liquids)", "Considered interim nutritional advice", "Arranged appropriate blood tests (FBC for anaemia)", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the patient''s anxiety about cancer sensitively", "Signposted before discussing serious possibilities", "Used clear and accessible language", "Allowed the patient to ask questions and express concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'c430dae7-858a-4422-879c-0d818cbb4841';

-- =============================================
-- 3. Ear Pain in Adult (FC-041)
-- =============================================
UPDATE sca_cases SET
  actor_behaviour = 'You are in discomfort and a bit irritable because of the ear pain. You have been using cotton buds which you know you probably should not. If the doctor is understanding, you are cooperative. You want something to fix it quickly as you have a flight in two days.',
  model_answer = '## Model Approach

**What this case is testing:** Management of acute otitis externa or media in an adult, appropriate prescribing, and addressing patient expectations about flying.

**Data Gathering:**
- Duration, character, and severity of pain
- Discharge, hearing loss, tinnitus, vertigo
- Recent water exposure, cotton bud use, eczema history
- Previous ear infections, any red flags (mastoid tenderness, facial nerve palsy)
- ICE: the upcoming flight and concern about flying with an ear infection

**Clinical Management:**
- Otitis externa: aural toilet if possible, topical antibiotic/steroid drops (e.g. Sofradex), avoid water entry
- Otitis media: most cases self-resolve; consider delayed antibiotic prescription
- Advise on flying: generally safe for otitis externa but may be uncomfortable with otitis media
- Safety-net: return if symptoms worsen, facial weakness, or spreading cellulitis

**References:**
- NICE CKS: Otitis externa - https://cks.nice.org.uk/topics/otitis-externa/
- NICE CKS: Otitis media acute - https://cks.nice.org.uk/topics/otitis-media-acute/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the ear pain in detail (onset, character, severity, laterality)", "Asked about discharge, hearing changes, and tinnitus", "Screened for red flags (mastoid tenderness, facial nerve involvement, vertigo)", "Explored potential causes (water exposure, cotton bud use, eczema)", "Explored ICE (concern about upcoming flight)", "Gathered relevant PMH and medication history", "Completed data gathering within approximately 6 minutes", "Consultation was structured and had clear direction"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made an appropriate working diagnosis (otitis externa vs media)", "Prescribed appropriately (topical drops or delayed antibiotics)", "Gave appropriate advice about cotton bud avoidance", "Addressed the flying concern with practical advice", "Provided clear safety-netting (return if worsening, facial weakness)", "Discussed expected recovery timeline", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful despite patient irritability", "Addressed the patient''s travel concerns empathetically", "Used clear language without jargon", "Avoided being dismissive of cotton bud use", "Allowed the patient to express their concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = 'b8175039-5207-4bab-89ac-fb88f1d3a24b';

-- =============================================
-- 4. Gout Attack (FC-019)
-- =============================================
UPDATE sca_cases SET
  actor_behaviour = 'You are in severe pain and can barely walk. You are frustrated because this has happened before and you thought it was sorted. If the doctor is empathetic, you are cooperative. You want strong painkillers and want to know why it keeps coming back.',
  model_answer = '## Model Approach

**What this case is testing:** Acute management of gout, appropriate analgesia, consideration of prophylaxis, and addressing recurrent episodes.

**Data Gathering:**
- Character and location of joint pain, onset (often overnight), swelling, redness
- Previous episodes, frequency, how they were managed
- Diet and lifestyle: alcohol intake, purine-rich foods, hydration
- PMH: renal function, cardiovascular risk factors, diuretic use
- ICE: frustration with recurrence, wanting strong pain relief

**Clinical Management:**
- Acute: NSAID (e.g. naproxen 750mg stat then 250mg TDS) or colchicine if NSAID contraindicated; NOT allopurinol during acute attack
- Do not start or stop allopurinol during an acute flare
- Discuss urate-lowering therapy for recurrent attacks (allopurinol after flare settles)
- Lifestyle advice: reduce alcohol, increase water, moderate purine intake
- Safety-net: return if not improving in 48 hours or if fever develops

**References:**
- NICE CKS: Gout - https://cks.nice.org.uk/topics/gout/
- BSR Guideline for Gout Management - https://academic.oup.com/rheumatology/article/56/7/e1/3855179',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored the joint pain in detail (site, onset, character, severity)", "Asked about swelling, redness, and warmth of the affected joint", "Established history of previous gout episodes and their management", "Screened for secondary causes (diuretics, renal impairment)", "Explored lifestyle factors (alcohol, diet, hydration)", "Explored ICE (frustration with recurrence, desire for strong analgesia)", "Completed data gathering within approximately 6 minutes", "Consultation was well-paced and structured"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Prescribed appropriate acute analgesia (NSAID or colchicine)", "Correctly avoided starting or adjusting allopurinol during acute flare", "Discussed long-term urate-lowering therapy for recurrent episodes", "Provided appropriate lifestyle advice (alcohol, diet, hydration)", "Considered checking renal function and urate levels after flare", "Provided specific safety-netting (return if not improving, or fever)", "Engaged the patient in shared decision-making about prophylaxis"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Acknowledged the patient''s pain and frustration empathetically", "Used clear and accessible language when explaining gout", "Avoided being judgemental about lifestyle factors", "Allowed the patient to express frustration and concerns", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '85a5de92-3c95-4b14-9b85-5e48c7f9becd';

-- =============================================
-- 5. Haematuria (FC-044)
-- =============================================
UPDATE sca_cases SET
  actor_behaviour = 'You are worried because you noticed blood in your urine yesterday. You are trying to stay calm but are clearly anxious. You have been googling symptoms and are worried about bladder cancer. If the doctor is reassuring, you feel more at ease.',
  model_answer = '## Model Approach

**What this case is testing:** Assessment of haematuria, distinguishing visible from non-visible, appropriate investigation and referral.

**Data Gathering:**
- Characterise: visible (frank) or non-visible, colour, clots, timing in stream
- Associated symptoms: dysuria, frequency, urgency, loin pain, weight loss
- Risk factors: smoking, occupational exposure (dyes, rubber), previous urological history
- PMH: anticoagulant use, recent UTI, kidney stones
- ICE: cancer fears from internet research

**Clinical Management:**
- Visible haematuria in anyone aged 45+: 2-week wait referral for suspected urological cancer (NICE NG12)
- Dipstick urine, MSU for culture, FBC, U&Es, eGFR
- If UTI confirmed and <45: treat UTI and recheck after treatment
- Safety-net: return if recurrent bleeding, pain, or new symptoms

**References:**
- NICE NG12: Suspected cancer - https://www.nice.org.uk/guidance/ng12
- NICE CKS: Haematuria - https://cks.nice.org.uk/topics/haematuria-blood-in-urine/',
  marking_criteria = '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Characterised the haematuria (visible vs non-visible, colour, clots, timing)", "Asked about associated urinary symptoms (dysuria, frequency, urgency)", "Screened for red flag symptoms (weight loss, loin pain, palpable mass)", "Explored risk factors for urological cancer (smoking, occupational exposure)", "Explored ICE (cancer fears from googling)", "Checked medication history (anticoagulants)", "Completed data gathering within approximately 6 minutes", "Consultation was well-structured with clear direction"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Applied NICE NG12 criteria correctly for urological cancer referral", "Arranged appropriate initial investigations (urine dipstick, MSU, bloods)", "Differentiated between UTI-related haematuria and unexplained haematuria", "Discussed the referral pathway clearly", "Incorporated the patient''s cancer fears into the management plan", "Provided specific safety-netting advice", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and respectful throughout", "Handled the patient''s anxiety about cancer sensitively", "Acknowledged the impact of googling on health anxiety", "Used clear language without medical jargon", "Allowed the patient to express their worries", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
WHERE id = '70dd38a0-f77e-40b0-aea9-992417ddbd14';

-- =============================================
-- 6-11: Remaining cases with missing actor behaviour
-- Set actor behaviour for the remaining 6 cases
-- =============================================

-- Joint Pain Multiple (FC-046)
UPDATE sca_cases SET
  actor_behaviour = 'You are tired and fed up with the pain in multiple joints. You have been struggling at work and are worried about your future. If the doctor is empathetic, you share more about how it is affecting your mental health. You want answers and a clear plan.'
WHERE id = '83d743b9-3c96-4e37-a720-9de89913b561' AND (actor_behaviour IS NULL OR LENGTH(actor_behaviour) < 30);

-- Kidney Stone Follow-up (FC-047)
UPDATE sca_cases SET
  actor_behaviour = 'You are relieved the acute pain has passed but are anxious about it happening again. You want to know what caused it and how to prevent another episode. If the doctor provides clear advice, you are grateful and engaged.'
WHERE id = '352423af-5798-4f76-b90b-a58325667281' AND (actor_behaviour IS NULL OR LENGTH(actor_behaviour) < 30);

-- Lump in Neck (FC-048)
UPDATE sca_cases SET
  actor_behaviour = 'You are worried because you found a lump in your neck a week ago. You have been trying not to think about it but your partner insisted you come. You are anxious about cancer but trying to appear calm. If the doctor is reassuring, you feel more comfortable.'
WHERE id = '819e4d1d-f612-452d-b62f-b11072e8f0d8' AND (actor_behaviour IS NULL OR LENGTH(actor_behaviour) < 30);

-- New AF (FC-025)
UPDATE sca_cases SET
  actor_behaviour = 'You are confused about why your heart has been racing and are worried it might be something serious. You do not want to take blood thinners if you can avoid it. If the doctor explains the risks clearly, you become more open to treatment.'
WHERE id = 'a7320af6-9750-456c-b121-c0dac2aed297' AND (actor_behaviour IS NULL OR LENGTH(actor_behaviour) < 30);

-- Thyroid Nodule (FC-030)
UPDATE sca_cases SET
  actor_behaviour = 'You noticed a lump in your throat a few weeks ago and have been putting off coming. You are worried about thyroid cancer. If the doctor is thorough and explains the investigation process, you feel reassured but still want things done quickly.'
WHERE id = '74d8e788-f284-41a9-bb94-75fb3ae7dce6' AND (actor_behaviour IS NULL OR LENGTH(actor_behaviour) < 30);

-- Zoster/Shingles (FC-036)
UPDATE sca_cases SET
  actor_behaviour = 'You are in a lot of pain from the rash and are not sleeping well because of it. You are frustrated because you thought shingles only happened to very old people. If the doctor is empathetic, you are cooperative. You want strong pain relief.'
WHERE id = '3c1dcedf-b334-4b13-8bfa-888cacf71a72' AND (actor_behaviour IS NULL OR LENGTH(actor_behaviour) < 30);
