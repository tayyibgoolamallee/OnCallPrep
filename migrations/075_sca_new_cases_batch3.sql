-- Migration 075: 10 new SCA full cases (batch 3)
-- Neurology, Renal, Cardiology, Rheumatology, Dermatology, ENT, Musculoskeletal

-- =====================================================
-- CASE 1: Bell''s Palsy (NEUR-003, Neurology, medium)
-- Video consultation - acute facial weakness
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Bell''s Palsy - Acute Facial Weakness',
  'Neurology',
  'NEUR-003',
  'Video consultation. A 42-year-old man has booked an urgent appointment because he woke up this morning with one side of his face drooping. He is very worried it might be a stroke.',
  '{"name": "Mr. Daniel Reeves", "age": 42, "gender": "Male"}',
  '{"patient": "Mr. Daniel Reeves", "age": 42, "gender": "Male", "pmh": "Migraine with aura, hay fever", "medications": "Sumatriptan 50mg PRN, Cetirizine 10mg OD (seasonal)", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Doctor, I am really scared. I woke up this morning and my face is all droopy on the left side. My wife said I should call 999 because she thinks I am having a stroke. I managed to get this video appointment instead. Please look at my face, is this a stroke?",
    "freely_given_history": {
      "presenting_complaint": "I noticed it when I went to brush my teeth this morning. The water was just dribbling out of the left side of my mouth. I looked in the mirror and the whole left side of my face is droopy. I cannot close my left eye properly and my left eyebrow will not move. I tried to smile and only the right side moves. It came on overnight. I went to bed feeling fine and woke up like this.",
      "psychosocial_impact": "I am absolutely terrified. I work as a secondary school teacher and I am supposed to be at work today. I cannot go in looking like this. My wife is in bits too. She keeps saying I need to go to A and E. I am also worried because my father had a stroke when he was sixty-five.",
      "ice": {
        "ideas": "I think this is a stroke. My dad had a stroke and his face drooped just like this.",
        "concerns": "I am scared I am going to die or be left paralysed. I also do not know how long this will last or if it will get worse.",
        "expectations": "I want to know if this is a stroke and whether I need to go to hospital right now."
      }
    },
    "history_on_direct_questioning": {
      "onset_details": {
        "timing": "I went to bed at about half ten last night feeling completely fine. Woke up at six this morning and it was already there.",
        "progression": "It has not got any worse since I first noticed it. It has stayed about the same all morning.",
        "previous_episodes": "Never had anything like this before."
      },
      "neurological_symptoms": {
        "arm_weakness": "No, both my arms are fine. I can lift them both up no problem.",
        "leg_weakness": "No, my legs are fine. I walked downstairs normally.",
        "speech": "My speech sounds a bit slurred because of the droop but I can find all my words fine. I know what I want to say.",
        "vision": "My vision is fine, I can see normally. But my left eye feels dry because I cannot blink properly.",
        "headache": "I had a mild ache behind my left ear yesterday evening but I thought it was just a normal headache.",
        "swallowing": "I can swallow fine but drinking is tricky because of the lip droop.",
        "hearing": "Actually, sounds seem louder in my left ear. The telly sounded really loud this morning.",
        "taste": "Now you mention it, my breakfast toast tasted a bit odd, like cardboard."
      },
      "risk_factors": {
        "recent_illness": "I had a cold about a week ago. Runny nose and a bit of a sore throat for a few days.",
        "diabetes": "No.",
        "blood_pressure": "I do not know. I have never been told it is high.",
        "smoking": "No, I have never smoked.",
        "family_history": "My dad had a stroke at sixty-five but he was a heavy smoker and had diabetes."
      }
    },
    "secondary_history": {
      "ear_symptoms": "No discharge from my ears. No vesicles or blisters that I can see. My wife had a look and she did not see any spots around my ear.",
      "other_cranial_nerves": "My eyes move normally in all directions. I have not noticed any numbness on my face, just the weakness."
    },
    "ice": {
      "ideas": "I still think this could be a stroke. Please tell me honestly.",
      "concerns": "If it is not a stroke, what is it? Will my face go back to normal?",
      "expectations": "I need to know if I need treatment and when my face will recover."
    },
    "specific_prompts": "Show the doctor your face on camera. Try to raise both eyebrows, close both eyes tightly, and smile when asked. The left side should not move for any of these. If the doctor reassures you it is not a stroke, ask how they can be sure and what it actually is. If they explain Bell''s palsy clearly, become more settled."
  }',
  'ANXIOUS and frightened at the start. You genuinely believe this might be a stroke. You need clear reassurance with an explanation of why this is not a stroke. Once the doctor explains the difference between upper and lower motor neurone facial weakness, you begin to calm down. You are cooperative throughout but need your concerns validated.',
  'full',
  720,
  'medium',
  ARRAY['Differentiate Bell''s palsy from stroke (upper vs lower motor neurone)', 'Assess for red flag features requiring urgent referral', 'Examine facial nerve function via video', 'Check for Ramsay Hunt syndrome (vesicles, ear pain)', 'Prescribe prednisolone within 72 hours of onset', 'Provide eye care advice', 'Address stroke anxiety with clear explanation', 'Safety-net for worsening symptoms'],
  '## Model Approach

**What this case is testing:** Differentiation of Bell''s palsy from stroke via video consultation, appropriate examination of cranial nerves remotely, evidence-based management, and addressing significant patient anxiety about stroke.

## Data Gathering

- Establish the onset and time course of facial weakness (sudden but not hyperacute, noticed on waking)
- Assess distribution: forehead involvement (cannot raise eyebrow, cannot close eye) indicates lower motor neurone lesion — this is the key differentiator from stroke
- Screen for stroke features using FAST: arm weakness, leg weakness, speech (word-finding) — all absent
- Ask about associated symptoms: hyperacusis (present), taste disturbance (present), post-auricular pain (present) — all support Bell''s palsy
- Exclude Ramsay Hunt syndrome: ask about vesicles in the ear or on the pinna, ear discharge
- Ask about recent viral illness (recent cold supports post-viral aetiology)
- Assess eye symptoms: dryness, inability to close eye (risk of exposure keratitis)
- Consider risk factors for alternative diagnoses: diabetes, Lyme disease, sarcoidosis, pregnancy

## Clinical Management

- **Diagnosis:** Bell''s palsy — idiopathic lower motor neurone facial nerve palsy
- **Prednisolone:** 50mg daily for 10 days (must be started within 72 hours of onset for maximum benefit) — NICE CKS
- **Eye care:** Artificial tears (hypromellose) during the day, lubricating eye ointment at night, tape eye closed at night if unable to fully close. Refer to ophthalmology urgently if eye becomes red or painful
- **Antivirals:** Not routinely recommended as monotherapy. Aciclovir may be considered alongside prednisolone in severe cases but evidence is limited
- **Prognosis counselling:** 70-85% of patients make a full recovery. Most improvement within 3 weeks, full recovery may take up to 9 months
- **Reassurance:** Explain clearly why this is not a stroke — the forehead is involved (whole half of face), and there is no limb weakness, speech difficulty, or visual loss
- **Safety-netting:** Return if symptoms worsen, new symptoms develop (limb weakness, visual changes), eye becomes red or painful, or no improvement by 3 weeks
- **Follow-up:** Review in 2-3 weeks. If no improvement by 3 months, refer to ENT or neurology
- **Fitness note:** Offer if needed for work

## References
- NICE CKS: Bell''s palsy - https://cks.nice.org.uk/topics/bells-palsy/
- BMJ Best Practice: Bell''s palsy - https://bestpractice.bmj.com/topics/en-gb/118
- RCGP curriculum: Neurological problems - https://www.rcgp.org.uk/mrcgp-exams/clinical-skills-assessment',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established onset and time course of the facial weakness", "Identified lower motor neurone pattern (forehead involved, cannot close eye, cannot raise eyebrow)", "Screened for stroke features: limb weakness, speech difficulty, visual loss", "Asked about associated Bell''s palsy features (hyperacusis, taste change, post-auricular pain)", "Excluded Ramsay Hunt syndrome (vesicles around the ear)", "Asked about recent viral illness", "Assessed eye closure and risk of exposure keratitis", "Used video effectively to observe facial movements"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made correct diagnosis of Bell''s palsy based on clinical features", "Prescribed prednisolone within 72 hours of onset (NICE CKS)", "Provided comprehensive eye care advice (artificial tears, ointment, taping)", "Explained why this is not a stroke (upper vs lower motor neurone)", "Discussed prognosis (70-85% full recovery)", "Provided clear safety-netting (worsening, eye redness, no improvement by 3 weeks)", "Arranged appropriate follow-up (2-3 weeks)", "Offered a fitness note for work if needed"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Acknowledged the patient''s significant anxiety about stroke", "Provided clear and empathetic reassurance", "Explained the diagnosis in understandable language", "Allowed the patient to express his fears without dismissing them", "Checked the patient''s understanding of the management plan", "Showed sensitivity to the psychosocial impact (work, family)"]}
  }'::jsonb
);

-- =====================================================
-- CASE 2: Vertigo and Dizziness (NEUR-004, Neurology, easy)
-- Telephone consultation - recurrent vertigo, likely BPPV
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Vertigo and Dizziness - Recurrent Episodes',
  'Neurology',
  'NEUR-004',
  'Telephone consultation. A 58-year-old woman has called because she keeps getting episodes of dizziness that come on when she turns over in bed. She has had three episodes this week and is worried something is wrong.',
  '{"name": "Mrs. Janet Holloway", "age": 58, "gender": "Female"}',
  '{"patient": "Mrs. Janet Holloway", "age": 58, "gender": "Female", "pmh": "Hypertension, osteoporosis, menopause (on HRT)", "medications": "Ramipril 5mg OD, Alendronic acid 70mg weekly, Adcal D3 one tablet BD, Oestrogel 2 pumps daily", "allergies": "Codeine (nausea)"}',
  '{
    "opening_statement": "Hello doctor. I keep getting these horrible dizzy spells and I am getting really fed up with them. They started about a week ago and they keep coming back. I feel like the room is spinning around me.",
    "freely_given_history": {
      "presenting_complaint": "The dizziness started about a week ago. It happens mainly when I turn over in bed, especially if I roll onto my right side. It also happens when I tilt my head back, like when I was trying to get something off the top shelf. Each episode only lasts about thirty seconds but it is very intense. The room spins really fast and I feel sick. Once it stops, I feel a bit wobbly for a few minutes but then I am alright again.",
      "psychosocial_impact": "I am scared to move my head too quickly now. I have been sleeping propped up on pillows because I am afraid of it happening in the night. I have not been sleeping well at all. I missed my book club this week because I did not feel safe driving.",
      "ice": {
        "ideas": "I looked it up on the internet and I am worried it could be something to do with my brain or my blood pressure.",
        "concerns": "My biggest worry is that I might fall and break something. I have got osteoporosis and my mum broke her hip when she was my age from a fall.",
        "expectations": "I would like to know what is causing it and whether I need a scan or any tests."
      }
    },
    "history_on_direct_questioning": {
      "dizziness_characteristics": {
        "type": "The room spins around me. It is proper spinning, not just feeling lightheaded or faint.",
        "duration": "Each episode lasts about twenty to thirty seconds. Then it gradually settles.",
        "triggers": "Turning over in bed onto my right side, tilting my head back, bending down to pick things up. It does not happen when I am sitting still.",
        "frequency": "It has happened about eight or nine times in the past week.",
        "nausea": "Yes, I feel sick during the episodes but I have not actually been sick."
      },
      "associated_symptoms": {
        "hearing": "My hearing is fine. No change at all.",
        "tinnitus": "No ringing in my ears.",
        "ear_symptoms": "No earache, no discharge, no feeling of fullness.",
        "headache": "No headaches.",
        "visual_changes": "No double vision or blurred vision.",
        "speech_or_swallowing": "No problems with speech or swallowing.",
        "limb_weakness": "No weakness in my arms or legs.",
        "numbness": "No numbness or tingling anywhere."
      },
      "general_health": {
        "recent_illness": "I had a mild cold about two weeks ago but nothing serious.",
        "blood_pressure": "I check it at home sometimes. It has been about 130 over 80 recently.",
        "medications": "I have not changed any of my tablets recently.",
        "caffeine_alcohol": "I have about three cups of tea a day. I drink a glass of wine most evenings."
      }
    },
    "ice": {
      "ideas": "Is this vertigo? I have heard of that but I do not really understand what causes it.",
      "concerns": "I just want to make sure it is not something serious like a brain tumour or a stroke.",
      "expectations": "I would really like some treatment to stop it. I cannot carry on like this."
    },
    "specific_prompts": "If the doctor suggests BPPV, ask what that means in simple terms. If they mention Epley manoeuvre, ask how to do it or where you can get it done. If they try to explain that a brain scan is not needed, ask how they can be sure without doing one."
  }',
  'WORRIED but chatty and cooperative. You describe your symptoms clearly. You are relieved when given a clear explanation and a treatment plan. If the doctor dismisses your concerns about a brain problem without explaining why, you become less satisfied.',
  'full',
  720,
  'easy',
  ARRAY['Recognise classic BPPV presentation', 'Differentiate positional vertigo from central causes', 'Screen for red flag neurological symptoms', 'Explain BPPV mechanism in patient-friendly language', 'Discuss Epley manoeuvre or referral for vestibular rehabilitation', 'Address concern about falls given osteoporosis', 'Reassure about brain scan not being needed with explanation', 'Provide safety-netting advice'],
  '## Model Approach

**What this case is testing:** Recognition of a classic BPPV presentation via telephone history, appropriate reassurance, explanation of the condition, and management including the Epley manoeuvre.

## Data Gathering

- Characterise the dizziness: true rotational vertigo (room spinning) vs lightheadedness vs presyncope
- Establish the key positional trigger: worse on turning in bed, tilting head back — classic BPPV pattern
- Duration of each episode: brief episodes (under 60 seconds) are characteristic of BPPV
- Ask about associated hearing loss, tinnitus, aural fullness (absent — excludes Meniere''s disease)
- Screen for central red flags: headache, diplopia, dysarthria, dysphagia, limb weakness, numbness, gait ataxia — all absent
- Ask about recent head trauma or viral illness (recent cold may be relevant)
- Review medications for ototoxic drugs
- Consider blood pressure and cardiovascular causes (home readings are normal)
- Assess impact on function, driving, and falls risk (relevant given osteoporosis)

## Clinical Management

- **Diagnosis:** Benign paroxysmal positional vertigo (BPPV), most likely right posterior canal
- **Explanation:** Tiny calcium crystals (otoconia) have become displaced in the inner ear balance organs. When you move your head into certain positions they shift and send false signals of movement, causing the spinning sensation. It is not dangerous and is very common
- **Epley manoeuvre:** Gold standard treatment. Can be performed by a trained GP, physiotherapist, or audiologist. Effective in approximately 80% of cases in one to two sessions. Offer referral or instruct Brandt-Daroff exercises at home as an alternative
- **Medication:** Prochlorperazine or cinnarizine for short-term symptom relief only (maximum 1 week). Vestibular sedatives should not be used long-term as they delay central compensation
- **Brain scan not indicated:** No red flag neurological features. BPPV has a highly characteristic history. Imaging would not change management
- **Falls risk:** Acknowledge osteoporosis and falls concern. Advise sitting on the edge of the bed before standing, avoid sudden head movements, and hold onto something when looking up
- **Driving:** DVLA guidance — should not drive if vertigo occurs without warning. Once episodes are predictable and only positional, usually safe to drive
- **Safety-netting:** Return if symptoms persist beyond 4 weeks, new neurological symptoms develop, hearing changes, or episodes become prolonged

## References
- NICE CKS: BPPV - https://cks.nice.org.uk/topics/bppv/
- BMJ Best Practice: BPPV - https://bestpractice.bmj.com/topics/en-gb/91
- DVLA: Assessing fitness to drive - https://www.gov.uk/guidance/assessing-fitness-to-drive-a-guide-for-medical-professionals',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Characterised the dizziness as true rotational vertigo (not lightheadedness)", "Identified the classic positional triggers (turning in bed, head tilt)", "Established brief episode duration consistent with BPPV", "Screened for hearing loss, tinnitus, and aural fullness (Meniere''s exclusion)", "Screened for central neurological red flags (headache, diplopia, limb weakness, dysarthria)", "Asked about recent viral illness or head trauma", "Assessed impact on driving and daily function", "Assessed falls risk given osteoporosis history"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made correct diagnosis of BPPV based on history", "Explained the mechanism of BPPV in understandable terms", "Discussed Epley manoeuvre or referred for vestibular rehabilitation", "Explained why a brain scan is not indicated (no red flags, characteristic history)", "Addressed falls risk and gave practical advice", "Considered short-term vestibular sedative if appropriate", "Discussed driving implications", "Provided clear safety-netting (persistent symptoms, new neurological signs)"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Took the patient''s concerns seriously including cancer worry", "Provided clear reassurance with explanation rather than dismissal", "Used patient-friendly language to explain the condition", "Acknowledged the impact on daily life and sleep", "Explored and addressed the osteoporosis-related falls concern", "Checked understanding and invited questions"]}
  }'::jsonb
);

-- =====================================================
-- CASE 3: Chronic Kidney Disease Discussion (RENAL-001, Renal, medium)
-- Telephone consultation - explaining new CKD diagnosis
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Chronic Kidney Disease - New Diagnosis Discussion',
  'Renal',
  'RENAL-001',
  'Telephone consultation. A 67-year-old man has been asked to ring for his blood test results. Routine bloods performed two weeks ago showed an eGFR of 48 ml/min, confirmed on repeat testing. This is a new finding. He has no idea there is a problem with his kidneys.',
  '{"name": "Mr. Brian Naylor", "age": 67, "gender": "Male"}',
  '{"patient": "Mr. Brian Naylor", "age": 67, "gender": "Male", "pmh": "Type 2 diabetes (8 years), hypertension, hyperlipidaemia, gout", "medications": "Metformin 500mg BD, Gliclazide 80mg BD, Ramipril 10mg OD, Atorvastatin 20mg ON, Allopurinol 300mg OD", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hello doctor. The receptionist said I needed to ring for my blood test results. I hope everything is alright. I had them done a couple of weeks ago, just the usual diabetic checks I think.",
    "freely_given_history": {
      "presenting_complaint": "I do not have any particular symptoms to be honest. I feel fine. I just had the bloods done because the nurse said it was time for my annual review. I was not expecting any problems.",
      "psychosocial_impact": "I am retired now and I keep myself quite busy. I do a lot of gardening and I walk the dog every day. My wife and I go on holiday twice a year. I would say my health is pretty good for my age.",
      "ice": {
        "ideas": "I have no idea what this could be about. I assumed everything was fine because nobody rang me sooner.",
        "concerns": "If you tell me there is something wrong with my kidneys I am going to be worried. My brother-in-law was on dialysis before he died and it was terrible.",
        "expectations": "I just want to know my results and whether anything needs changing."
      }
    },
    "history_on_direct_questioning": {
      "symptoms_review": {
        "urinary": "I get up once or twice at night to go to the toilet but I have done that for years. I put it down to my age. No pain, no blood.",
        "swelling": "No swelling in my ankles or legs.",
        "fatigue": "I do feel a bit more tired in the afternoons but again I just thought that was my age.",
        "appetite": "My appetite is fine. I eat well.",
        "itching": "No itching.",
        "breathlessness": "No breathlessness."
      },
      "diabetes_control": {
        "monitoring": "I do not check my sugars at home any more. The nurse said I did not need to as I am on tablets not insulin.",
        "last_hba1c": "I cannot remember the exact number. The nurse said it was a bit high last time, maybe fifty-something.",
        "diet": "My wife cooks healthy meals. I try to watch my sugar intake. I do have a couple of biscuits with my tea though."
      },
      "blood_pressure": {
        "monitoring": "I have a machine at home. It is usually about 145 over 85.",
        "medication": "I take my ramipril every morning without fail."
      },
      "lifestyle": {
        "smoking": "I gave up fifteen years ago. I used to smoke about twenty a day.",
        "alcohol": "I have a couple of pints at the pub on a Friday and Saturday. Maybe a glass of wine with dinner sometimes.",
        "exercise": "I walk the dog for about forty-five minutes every day and I am always in the garden.",
        "weight": "I am probably a bit overweight. About fourteen stone and I am five foot ten."
      }
    },
    "ice": {
      "ideas": "Does this mean my kidneys are failing? Am I going to need dialysis?",
      "concerns": "I watched my brother-in-law go through dialysis three times a week. It destroyed his quality of life. I do not want that.",
      "expectations": "What can I do to stop it getting worse? Do I need to see a specialist?"
    },
    "specific_prompts": "When told about CKD, become visibly worried. Ask directly about dialysis. You need clear reassurance that stage 3a CKD is not the same as kidney failure. If the doctor explains it well using an analogy, you settle. If they use too much jargon, ask them to explain more simply. Ask about whether your diabetes tablets need changing."
  }',
  'INITIALLY RELAXED, then SHOCKED and worried when told about the kidney problem. You did not expect bad news. Your main fear is dialysis because of your brother-in-law''s experience. You are intelligent and want to understand but need things explained in plain language. You settle well with clear, honest, empathetic communication.',
  'full',
  720,
  'medium',
  ARRAY['Break bad news sensitively over the telephone', 'Explain CKD staging in patient-friendly terms', 'Address dialysis fears proportionately', 'Review medications for renal safety', 'Discuss cardiovascular risk in CKD', 'Set up monitoring plan (ACR, eGFR, BP)', 'Explain importance of BP and diabetes control', 'Discuss lifestyle modifications'],
  '## Model Approach

**What this case is testing:** Breaking unexpected news about a chronic disease diagnosis via telephone, explaining CKD in understandable terms, addressing the patient''s specific fears about dialysis, medication review, and setting up a monitoring plan.

## Data Gathering

- Confirm the blood results: eGFR 48 ml/min on two occasions (CKD stage 3a)
- Check urine ACR: if not done, this is needed to complete the CKD staging
- Ask about urinary symptoms, oedema, fatigue, itch, breathlessness (symptoms of advancing CKD)
- Review current blood pressure control (145/85 — above target for CKD with diabetes)
- Review diabetes control (HbA1c reportedly ''a bit high'')
- Medication review: metformin is safe at eGFR 48 but needs monitoring; gliclazide may need dose review; ramipril is renoprotective and should continue; allopurinol may need dose adjustment
- Assess cardiovascular risk factors (diabetes, hypertension, ex-smoker, hyperlipidaemia, overweight)
- Explore understanding, fears (dialysis), and family experience
- Ask about NSAIDs or over-the-counter medications that may be nephrotoxic

## Clinical Management

- **Explain CKD stage 3a:** Kidneys are working at roughly half their normal capacity. Use an analogy: ''If you think of normal kidney function as 100 percent, your kidneys are currently working at about 48 percent''
- **Address dialysis fear:** At this stage, dialysis is very unlikely. Most people with stage 3 CKD never progress to needing dialysis, especially if BP and diabetes are well controlled
- **Blood pressure target:** Tighten to below 130/80 in CKD with diabetes (NICE NG203). May need additional antihypertensive or dose adjustment
- **Diabetes optimisation:** Aim for good glycaemic control. Check current HbA1c. Metformin is safe but should be reviewed if eGFR drops below 30. Consider SGLT2 inhibitor (dapagliflozin) which has renal protective benefits (NICE NG203, DAPA-CKD trial)
- **Medication review:** Avoid NSAIDs. Check allopurinol dose is appropriate for renal function. Continue ramipril (renoprotective ACE inhibitor)
- **Lifestyle advice:** Maintain exercise, healthy diet, moderate salt intake, adequate hydration, maintain healthy weight, moderate alcohol
- **Monitoring plan:** eGFR and urine ACR every 6 months (NICE NG203). Annual review with bloods (calcium, phosphate, PTH if eGFR <30)
- **Cardiovascular risk:** CKD is an independent cardiovascular risk factor. Ensure statin is optimised
- **Safety-netting:** Report any new symptoms — ankle swelling, breathlessness, reduced urine output, blood in urine

## References
- NICE NG203: Chronic kidney disease - https://www.nice.org.uk/guidance/ng203
- NICE CKS: CKD - https://cks.nice.org.uk/topics/chronic-kidney-disease/
- BMJ Best Practice: CKD - https://bestpractice.bmj.com/topics/en-gb/84
- Kidney Care UK patient resources - https://www.kidneycareuk.org/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Confirmed the blood test results and explained eGFR meaning", "Asked about symptoms of CKD (oedema, fatigue, itch, breathlessness, urinary changes)", "Reviewed current blood pressure control and identified it is above target", "Reviewed diabetes control and current HbA1c", "Performed a medication review for renal safety (NSAIDs, metformin, allopurinol)", "Explored the patient''s understanding, fears, and family experience of kidney disease", "Asked about over-the-counter medications or supplements", "Assessed cardiovascular risk factors comprehensively"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained CKD stage 3a in understandable terms using appropriate analogy", "Addressed dialysis fear proportionately and honestly", "Identified need to tighten blood pressure control to below 130/80 (NICE NG203)", "Reviewed and optimised diabetes management", "Considered SGLT2 inhibitor for renal protection if appropriate", "Planned appropriate monitoring (eGFR and urine ACR every 6 months)", "Gave lifestyle advice (salt, hydration, exercise, weight)", "Provided clear safety-netting for new symptoms"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Broke unexpected news sensitively and allowed time to react", "Explored and acknowledged the patient''s fear about dialysis", "Used patient-friendly language, avoiding excessive jargon", "Checked understanding throughout the conversation", "Was honest about the diagnosis while providing proportionate reassurance", "Showed empathy for the emotional impact of the diagnosis"]}
  }'::jsonb
);

-- =====================================================
-- CASE 4: Heart Failure Follow-up (CARD-004, Cardiology, medium)
-- Video consultation - worsening breathlessness
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Heart Failure Follow-up - Worsening Breathlessness',
  'Cardiology',
  'CARD-004',
  'Video consultation. A 74-year-old woman with known heart failure (HFrEF, EF 35%) has requested a review because she has noticed she is getting more breathless when walking over the past three weeks. She was last seen in the heart failure clinic six months ago.',
  '{"name": "Mrs. Gloria Parsons", "age": 74, "gender": "Female"}',
  '{"patient": "Mrs. Gloria Parsons", "age": 74, "gender": "Female", "pmh": "Heart failure with reduced ejection fraction (EF 35%, diagnosed 2022), atrial fibrillation, type 2 diabetes, hypertension, osteoarthritis both knees", "medications": "Bisoprolol 5mg OD, Ramipril 5mg OD, Dapagliflozin 10mg OD, Furosemide 40mg OD, Apixaban 5mg BD, Metformin 500mg BD, Paracetamol 1g QDS PRN", "allergies": "Aspirin (gastric bleeding)"}',
  '{
    "opening_statement": "Good morning doctor. Thank you for seeing me. I have been meaning to call for a couple of weeks now. I have noticed I am getting more and more puffed out when I walk anywhere. I used to be able to walk to the post office and back without stopping but now I have to stop two or three times. My ankles have swollen up too.",
    "freely_given_history": {
      "presenting_complaint": "The breathlessness has been getting gradually worse over the past three weeks. It started off quite mild but now I am struggling to walk more than about a hundred yards without stopping. I also get breathless going up the stairs. I have to stop halfway up and rest. My ankles are much more swollen than usual, especially by the evening. My shoes are tight.",
      "psychosocial_impact": "I am getting quite frustrated because I was doing so well. I was walking to the shops most days and I even started going to a gentle exercise class at the community centre. I have had to stop all of that. My daughter has been doing my shopping for me. I do not want to be a burden on her.",
      "ice": {
        "ideas": "I think my heart failure is getting worse. My husband had heart failure and this is how it started for him before he ended up in hospital.",
        "concerns": "I am frightened that I am going to end up in hospital like my husband did. He was in and out for the last two years of his life. I am also worried because I have put on about four pounds in the past week.",
        "expectations": "I was hoping you might be able to increase my water tablets. That is what they did last time when I got like this. I also wondered if I should bring my heart failure appointment forward."
      }
    },
    "history_on_direct_questioning": {
      "breathlessness_detail": {
        "severity": "I used to be able to walk about half a mile without stopping. Now it is about a hundred yards. Going upstairs, I have to stop halfway.",
        "orthopnoea": "Yes, I have been using an extra pillow this past week. I used to sleep on two pillows and now I need three.",
        "pnd": "I woke up gasping for air two nights ago. I had to sit up on the edge of the bed for a few minutes and it settled. That has only happened once.",
        "cough": "I have a bit of a cough. It is worse when I lie flat. No blood. It is a dry cough.",
        "chest_pain": "No chest pain.",
        "palpitations": "My heart feels like it is racing sometimes. It has always been irregular because of the atrial fibrillation but it feels faster than usual."
      },
      "fluid_retention": {
        "ankle_swelling": "Both ankles are swollen. The left is worse than the right. If I press on it, a dent stays for quite a while.",
        "weight_gain": "I weigh myself every day like they told me to. I have put on about four pounds in the past week. I was ten stone two last week and now I am ten stone six.",
        "abdominal_bloating": "My tummy does feel a bit bloated. My trousers are tighter.",
        "urine_output": "I think I am passing less urine than usual actually."
      },
      "general_health": {
        "diet": "I try to watch my salt but I have been having more ready meals this week because I have not been able to get to the shops.",
        "medications": "I have been taking all my tablets. I have not missed any.",
        "recent_illness": "No infections. No fever."
      }
    },
    "ice": {
      "ideas": "I think the fluid is building up again like it did before.",
      "concerns": "I really do not want to end up in hospital. Can we manage this at home?",
      "expectations": "I think I need more water tablets and maybe a review with the heart failure nurse."
    },
    "specific_prompts": "If the doctor increases your furosemide, ask how much more you should take and for how long. If they mention blood tests, agree readily. If they suggest hospital, express reluctance but accept if they explain why it is needed. If they ask you to show your ankles on camera, do so willingly."
  }',
  'CONCERNED but stoic. You have been managing your condition well and are frustrated by this setback. You are knowledgeable about your heart failure from previous experience and your husband''s illness. You prefer to stay at home if possible. You are cooperative with the doctor and follow advice carefully.',
  'full',
  720,
  'medium',
  ARRAY['Assess for decompensated heart failure (NYHA class progression)', 'Identify clinical features of fluid overload', 'Use video to assess JVP, ankle oedema, respiratory rate', 'Adjust diuretic therapy appropriately', 'Arrange urgent blood tests (U&Es, BNP)', 'Consider need for heart failure nurse review', 'Assess for precipitants of decompensation', 'Provide weight monitoring and safety-netting advice'],
  '## Model Approach

**What this case is testing:** Recognition and community management of decompensated heart failure, appropriate diuretic dose adjustment, remote assessment via video, identification of precipitating factors, and clear safety-netting.

## Data Gathering

- Assess NYHA functional class progression: was NYHA II (mild limitation), now NYHA III (marked limitation at 100 yards, cannot climb stairs without stopping)
- Assess for orthopnoea (present — now 3 pillows, was 2), PND (one episode — concerning)
- Document fluid retention: bilateral pitting ankle oedema, weight gain 4lbs in one week, reduced urine output, abdominal bloating
- Ask about cough (present, dry, worse lying flat — may indicate pulmonary congestion)
- Check for palpitations — ?uncontrolled AF rate contributing to decompensation
- Use video: observe respiratory rate at rest, ask patient to show ankles for oedema, assess general appearance
- Screen for precipitants: dietary salt intake (increased ready meals), medication adherence (good), intercurrent infection (none), AF rate control, anaemia
- Review current medications: already on bisoprolol, ramipril, dapagliflozin, furosemide — on good quadruple therapy

## Clinical Management

- **Increase furosemide:** Increase from 40mg OD to 80mg OD (or 40mg BD) for 5-7 days, then reassess. Some services use a ''rescue pack'' approach
- **Daily weight monitoring:** Continue daily weights. Target weight loss of 0.5-1kg per day until back to dry weight
- **Urgent blood tests:** U&Es (renal function and potassium — important before increasing diuretics), BNP/NT-proBNP, FBC (exclude anaemia), TFTs
- **Fluid and salt restriction:** Restrict fluid to 1.5L per day. Reduce salt intake — discuss the ready meals issue
- **Heart rate check:** If AF rate is fast, consider increasing bisoprolol (check HR and BP). A resting HR above 80-90 in AF may be contributing
- **Heart failure nurse review:** Contact the heart failure specialist nurse for urgent community review within 48 hours if available
- **Bring forward clinic appointment:** Request earlier cardiology or heart failure clinic review
- **Consider admission criteria:** PND, worsening despite oral diuretics, haemodynamic instability, new arrhythmia. Currently manageable at home with close monitoring
- **Safety-netting:** If breathlessness worsens at rest, further PND episodes, weight gain continues despite increased diuretics, chest pain, or feeling very unwell — call 999 or present to A&E

## References
- NICE NG106: Chronic heart failure - https://www.nice.org.uk/guidance/ng106
- NICE CKS: Heart failure - chronic - https://cks.nice.org.uk/topics/heart-failure-chronic/
- BMJ Best Practice: Chronic heart failure - https://bestpractice.bmj.com/topics/en-gb/61
- British Society for Heart Failure - https://www.bsh.org.uk/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed NYHA functional class and identified deterioration (II to III)", "Asked about orthopnoea and paroxysmal nocturnal dyspnoea", "Documented fluid retention (ankle oedema, weight gain, reduced urine output)", "Screened for precipitants of decompensation (diet, adherence, infection, AF rate)", "Used video consultation to observe respiratory effort and ankle swelling", "Reviewed current medication regime and adherence", "Asked about daily weight monitoring trend", "Assessed the patient''s exercise tolerance with specific distances"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Increased diuretic dose appropriately (furosemide increase with clear instructions)", "Arranged urgent blood tests (U&Es, BNP, FBC)", "Advised on fluid restriction and salt intake reduction", "Arranged heart failure nurse review or brought forward clinic appointment", "Discussed daily weight monitoring and target", "Considered whether AF rate control needed optimising", "Assessed whether admission was needed (and explained criteria)", "Provided specific safety-netting for when to seek emergency care"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Acknowledged the patient''s frustration at functional decline", "Explored and addressed fears about hospitalisation", "Showed sensitivity regarding the husband''s experience", "Empowered the patient to self-monitor (daily weights, symptom diary)", "Used clear and understandable language", "Checked understanding of the management plan"]}
  }'::jsonb
);

-- =====================================================
-- CASE 5: Rheumatoid Arthritis Flare (RHEUM-002, Rheumatology, medium)
-- Telephone consultation - joint pain and swelling on methotrexate
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Rheumatoid Arthritis Flare - Joint Pain on Methotrexate',
  'Rheumatology',
  'RHEUM-002',
  'Telephone consultation. A 51-year-old woman with known rheumatoid arthritis has called because her joints have flared up significantly over the past ten days despite being on methotrexate. She is in a lot of pain and struggling to manage at work.',
  '{"name": "Mrs. Karen Whitfield", "age": 51, "gender": "Female"}',
  '{"patient": "Mrs. Karen Whitfield", "age": 51, "gender": "Female", "pmh": "Rheumatoid arthritis (diagnosed 2019, seropositive RF and anti-CCP positive), depression, irritable bowel syndrome", "medications": "Methotrexate 20mg weekly (oral, takes on Saturdays), Folic acid 5mg weekly (Mondays), Sertraline 100mg OD, Mebeverine 135mg TDS PRN", "allergies": "Ibuprofen (asthma-like reaction)"}',
  '{
    "opening_statement": "Hi doctor. I really need some help. My joints have gone absolutely crazy over the past week and a half. My hands are so swollen I can barely make a fist. I am struggling to get through a day at work and I am in tears by the evening.",
    "freely_given_history": {
      "presenting_complaint": "My hands, wrists, and feet have all flared up. My knuckles are really swollen and hot. My wrists are stiff and sore and I cannot grip things properly. My feet are so painful in the mornings that I have to shuffle along for about an hour before they loosen up. The morning stiffness used to last about twenty minutes but now it is lasting well over an hour. It started about ten days ago and it has been getting worse rather than better.",
      "psychosocial_impact": "I work as an administrator and I am struggling with typing. I had to take two days off last week. My line manager has been understanding but I am worried about my sick record. I live on my own and simple things like opening jars or doing up buttons are really hard at the moment. I had a good cry last night because I just felt so frustrated and helpless.",
      "ice": {
        "ideas": "I think my methotrexate has stopped working. This is the worst flare I have had since I was first diagnosed.",
        "concerns": "I am worried about joint damage. My rheumatologist told me that every flare can cause a bit more damage and I am scared of ending up with deformed hands. I am also worried about my mental health because this is really getting me down.",
        "expectations": "I want something to help with the pain right now and I think I need to see my rheumatologist sooner. My next appointment is not for another four months."
      }
    },
    "history_on_direct_questioning": {
      "joint_assessment": {
        "joints_affected": "Both hands, especially the MCP joints and PIP joints. Both wrists. Both feet, mainly the MTP joints. My left knee is a bit sore too.",
        "morning_stiffness": "Over an hour. Sometimes closer to ninety minutes.",
        "swelling": "Yes, my knuckles are visibly swollen. Hot to touch. Both hands look puffy.",
        "function": "I cannot grip properly. I struggle with jars, buttons, zips. Typing is painful."
      },
      "methotrexate_compliance": {
        "adherence": "I have been taking it every Saturday as prescribed. I have not missed any doses.",
        "side_effects": "I feel a bit nauseous on Sundays but it is manageable. No mouth ulcers, no hair loss, no breathlessness.",
        "blood_monitoring": "My last blood test was about eight weeks ago. The nurse said everything was fine.",
        "recent_changes": "My dose was increased from 15mg to 20mg about six months ago and it helped for a while."
      },
      "general_health": {
        "recent_illness": "I had a bad cold about three weeks ago. Could that have triggered this?",
        "fever": "No fever.",
        "eyes": "No eye problems. No dryness or redness.",
        "skin": "No rashes or nodules.",
        "mood": "Honestly, my mood has been really low the past week. I am not sleeping well because of the pain and I feel quite tearful."
      },
      "pain_management": {
        "current": "I have been taking paracetamol but it barely touches the pain. I cannot take ibuprofen because of my asthma reaction. I have not tried anything else.",
        "heat_cold": "I have been using a wheat bag on my hands in the evening which helps a bit."
      }
    },
    "ice": {
      "ideas": "I think the methotrexate is not enough any more. Do I need a different treatment?",
      "concerns": "I am frightened about permanent damage to my joints and I am struggling with my mental health.",
      "expectations": "I need something for the pain now and I want to get back to see my rheumatologist as soon as possible."
    },
    "specific_prompts": "If the doctor offers a short course of steroids, ask about the side effects. If they mention contacting the rheumatology team, express relief. If they ask about your mood, you may become tearful and admit you have been feeling quite hopeless. If they suggest NSAIDs, remind them about your ibuprofen allergy."
  }',
  'DISTRESSED and in pain. You are normally a positive, resilient person but this flare has knocked you. You become emotional when talking about the impact on your life and work. You are grateful for any help and are cooperative. If the doctor addresses both your physical and emotional needs, you feel well cared for.',
  'full',
  720,
  'medium',
  ARRAY['Assess RA disease activity (joint count, morning stiffness, function)', 'Recognise flare requiring escalation', 'Manage pain safely given NSAID allergy', 'Consider short course of oral corticosteroids as bridging', 'Arrange urgent rheumatology review or advice', 'Assess methotrexate compliance and monitoring', 'Screen for depression and low mood', 'Address work impact and offer fitness note'],
  '## Model Approach

**What this case is testing:** Management of a rheumatoid arthritis flare in primary care, safe pain management in a patient with NSAID allergy, appropriate use of bridging steroids, escalation to rheumatology, and recognition of the mental health impact.

## Data Gathering

- Assess disease activity: which joints affected (hands, wrists, feet, knee — symmetrical polyarthritis), morning stiffness duration (>60 minutes — active disease), swelling, warmth
- Assess functional impact: grip strength, ADLs, work capacity
- Review methotrexate: dose, compliance (good), last bloods (8 weeks ago, normal), side effects, recent dose change
- Explore possible triggers: recent viral illness (cold 3 weeks ago — may trigger flare)
- Ask about extra-articular features: eyes (Sjogren''s, scleritis), skin (nodules, vasculitis), lungs (methotrexate pneumonitis)
- Current pain management: paracetamol alone, cannot use NSAIDs (asthma-like reaction to ibuprofen — likely cross-reactive)
- Screen for depression: low mood, tearfulness, sleep disturbance, hopelessness. Consider PHQ-9 if appropriate
- Review blood monitoring schedule for methotrexate (should be every 2-3 months when stable)

## Clinical Management

- **Short course oral prednisolone:** 15-20mg daily for 5-7 days then rapid taper over 2-3 weeks. This acts as a bridging therapy to control the flare while awaiting rheumatology input. Discuss side effects (insomnia, appetite increase, mood changes, glucose — monitor if diabetic risk)
- **Pain management:** Paracetamol regularly (1g QDS). Consider codeine 30mg PRN short-term. Topical capsaicin for hands if tolerated. Avoid all NSAIDs given asthma-like reaction (cross-reactivity likely with all COX inhibitors)
- **Urgent rheumatology referral:** Contact the rheumatology team (flare line/advice line if available) for urgent review. The flare despite maximum oral methotrexate may indicate need for biologic therapy escalation
- **Blood tests:** Repeat FBC, U&Es, LFTs (methotrexate monitoring), CRP/ESR (disease activity markers)
- **Depression:** Acknowledge the emotional impact. Current sertraline dose may need review. Offer follow-up to reassess mood once pain is better controlled. Consider counselling or self-referral to IAPT
- **Work:** Offer fitness note. Advise about Access to Work scheme for workplace adjustments
- **Self-management:** Gentle hand exercises, heat therapy, wax baths, pacing activities. Refer to occupational therapy if not already known

## References
- NICE NG100: Rheumatoid arthritis in adults - https://www.nice.org.uk/guidance/ng100
- NICE CKS: Rheumatoid arthritis - https://cks.nice.org.uk/topics/rheumatoid-arthritis/
- BSR guidelines: Management of RA - https://www.rheumatology.org.uk/
- BMJ Best Practice: Rheumatoid arthritis - https://bestpractice.bmj.com/topics/en-gb/231',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed disease activity: joints involved, morning stiffness duration, swelling", "Assessed functional impact on daily life and work", "Reviewed methotrexate adherence, dose, and monitoring blood results", "Explored possible triggers for the flare (recent infection)", "Screened for extra-articular features (eyes, skin, lungs)", "Identified NSAID allergy and implications for pain management", "Screened for depression and assessed current mental health", "Explored the patient''s concerns about joint damage"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Prescribed short course oral prednisolone as bridging therapy", "Managed pain safely avoiding NSAIDs (paracetamol, codeine PRN)", "Arranged urgent rheumatology review or contacted flare advice line", "Arranged appropriate blood tests (FBC, U&Es, LFTs, CRP/ESR)", "Addressed depression and considered adjusting sertraline or IAPT referral", "Offered a fitness note for work", "Provided self-management advice (hand exercises, heat therapy, pacing)", "Discussed the possibility of treatment escalation to biologics"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Showed empathy for the patient''s pain and distress", "Acknowledged the emotional and psychological impact of the flare", "Allowed the patient to express her feelings without rushing", "Addressed both physical and emotional needs", "Used clear language to explain the management plan", "Checked understanding and invited questions"]}
  }'::jsonb
);

-- =====================================================
-- CASE 6: Psoriasis Affecting Quality of Life (DERM-005, Dermatology, medium)
-- Video consultation - frustrated with ongoing skin condition
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Psoriasis Affecting Quality of Life',
  'Dermatology',
  'DERM-005',
  'Video consultation. A 35-year-old man with known plaque psoriasis has requested an appointment because his skin has worsened significantly and it is affecting his confidence, relationships, and work. He feels his current treatment is not working and wants something different.',
  '{"name": "Mr. Liam Fogarty", "age": 35, "gender": "Male"}',
  '{"patient": "Mr. Liam Fogarty", "age": 35, "gender": "Male", "pmh": "Plaque psoriasis (diagnosed age 19), anxiety disorder", "medications": "Betamethasone valerate 0.1% ointment (body), Calcipotriol/betamethasone dipropionate gel (scalp), Sertraline 50mg OD", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hiya doctor. Thanks for seeing me. I am at my wit''s end with this psoriasis. It has got so much worse over the past couple of months and honestly it is ruining my life. I need something better than what I have got because the creams are just not cutting it any more.",
    "freely_given_history": {
      "presenting_complaint": "My psoriasis has really flared up. I have got big thick plaques on both elbows, both knees, my lower back, and my scalp is the worst it has ever been. The scales keep falling onto my shoulders like dandruff and people notice it. I have also got some new patches on my chest and stomach that I have never had before. The itching is driving me mad, especially at night.",
      "psychosocial_impact": "I work as a personal trainer at a gym. I have to wear short sleeves and shorts, and clients can see my skin. I have had people actually recoil when they see my elbows. One client asked if it was contagious. I have started wearing long sleeves even when coaching which is uncomfortable and hot. My girlfriend and I have been together for about a year and I am really self-conscious about her seeing my body. I avoid being intimate because of it. My anxiety has been getting worse too.",
      "ice": {
        "ideas": "I think I need something stronger than creams. I have read about injections and tablets that can clear psoriasis and I want to know if I can try those.",
        "concerns": "I am worried this will never get better and I will be dealing with this for the rest of my life. I am also worried about my relationship because I keep pushing my girlfriend away.",
        "expectations": "I want a referral to a skin specialist. I have been managing this in the GP surgery since I was nineteen and I have never seen a dermatologist."
      }
    },
    "history_on_direct_questioning": {
      "skin_assessment": {
        "distribution": "Both elbows, both knees, lower back, across my scalp, and new patches on my chest and abdomen.",
        "severity": "The plaques on my elbows and knees are thick, red, and silvery. Some of them are cracking and bleeding. My scalp is covered in thick scale.",
        "body_surface_area": "If I had to guess, maybe about fifteen to twenty percent of my body is affected.",
        "nails": "Actually yes, my fingernails have got some pitting and one nail has lifted off a bit at the end.",
        "face": "No, my face is clear at the moment.",
        "genital": "No."
      },
      "current_treatment": {
        "compliance": "I use the betamethasone on my body most days. I use the scalp gel a few times a week. But honestly I have got a bit fed up with applying creams all the time. It takes ages and it makes a mess of my clothes.",
        "previous_treatments": "I have tried Dovonex on its own, coal tar shampoo, various emollients. Nothing has made a big difference. The steroid creams help a bit but as soon as I stop they come straight back.",
        "phototherapy": "No, I have never been offered that."
      },
      "joints": {
        "joint_pain": "Funny you should ask. My fingers have been a bit stiff in the mornings recently. And my right heel has been sore for about a month. I assumed it was from running.",
        "morning_stiffness": "Maybe about fifteen to twenty minutes in my fingers.",
        "swelling": "I have not noticed any swelling.",
        "back_pain": "I get lower back stiffness in the mornings but I thought that was from the gym."
      },
      "mental_health": {
        "anxiety": "My anxiety is definitely worse. I am more on edge and I am avoiding social situations.",
        "mood": "My mood is low. Not rock bottom but definitely not good.",
        "sleep": "I am scratching in my sleep. My girlfriend says I am tossing and turning all night.",
        "alcohol": "I have been drinking a bit more than usual. Probably three or four pints a couple of times a week. It is my way of unwinding."
      }
    },
    "ice": {
      "ideas": "I think I need systemic treatment. The creams are not enough.",
      "concerns": "I am worried about my job, my relationship, and my mental health. This is all connected.",
      "expectations": "I want a dermatology referral and I want to know about the newer treatments."
    },
    "specific_prompts": "If the doctor asks to see your skin on camera, show your elbows and knees willingly. If they ask about joints, mention the finger stiffness and heel pain. If they suggest a dermatology referral, show relief. If they only offer more creams, express frustration. If they ask about your DLQI score, you would rate your quality of life impact as very severe."
  }',
  'FRUSTRATED and emotionally worn down. You feel you have been fobbed off with creams for years. You are not angry at the doctor personally but you are passionate about wanting better treatment. If the doctor listens properly, takes your quality of life seriously, and offers a referral, you become positive and grateful. If they just offer more topical treatment, you become deflated.',
  'full',
  720,
  'medium',
  ARRAY['Assess psoriasis severity (BSA, DLQI)', 'Recognise need for secondary care referral', 'Screen for psoriatic arthritis (joint symptoms)', 'Assess mental health impact', 'Discuss treatment ladder including systemic options', 'Address occupational and relationship impact', 'Review alcohol intake and its effect on psoriasis', 'Use video to assess skin lesions'],
  '## Model Approach

**What this case is testing:** Assessment of moderate-to-severe psoriasis with significant quality of life impact, recognition of psoriatic arthritis symptoms, appropriate referral to dermatology, and holistic management including mental health and occupational impact.

## Data Gathering

- Assess severity: body surface area (approximately 15-20% — moderate to severe), distribution, plaque thickness, nail involvement
- Use video to visualise lesions on elbows, knees, scalp
- Calculate or estimate DLQI (Dermatology Life Quality Index) — score likely >10 indicating very large impact (threshold for systemic therapy referral)
- Screen for psoriatic arthritis: finger stiffness, heel pain (enthesitis), back stiffness — these are all suggestive symptoms requiring further assessment
- Review current treatment and compliance: long history of topical treatment only, treatment fatigue, no previous dermatology referral or phototherapy
- Assess mental health: worsening anxiety, low mood, sleep disturbance, social withdrawal
- Assess alcohol intake: 6-8 pints per week — alcohol can exacerbate psoriasis and is relevant for systemic therapy decisions (methotrexate hepatotoxicity)
- Assess occupational impact: personal trainer, visible skin, client reactions
- Assess relationship impact: intimacy avoidance, self-consciousness

## Clinical Management

- **Dermatology referral:** This patient clearly meets criteria for secondary care referral — BSA >10%, topical treatment failure, significant quality of life impact (likely DLQI >10), and possible psoriatic arthritis symptoms (NICE CG153)
- **Complete a DLQI:** Can be done in the consultation or sent as a questionnaire beforehand. Score >10 = very large impact, supports need for systemic therapy
- **Psoriatic arthritis screening:** Use PEST (Psoriasis Epidemiology Screening Tool) questionnaire. Finger stiffness, heel enthesitis, and nail changes are suggestive. Dermatology or rheumatology assessment needed
- **Interim management:** Continue current topical treatment. Consider calcipotriol/betamethasone dipropionate (Enstilar foam) for body — may be easier to apply than ointment and improve adherence. Emollients regularly
- **Mental health:** Acknowledge the psychological burden. Review sertraline — may need dose increase. Offer referral to psychological services. Signpost to Psoriasis Association for peer support
- **Alcohol advice:** Sensitively discuss alcohol as an exacerbating factor and its relevance for future systemic treatments
- **Work adjustments:** Discuss with occupational health if needed. Fitness note if required
- **Safety-netting:** If joints worsen, new joint swelling, significant worsening of skin before dermatology appointment — re-attend

## References
- NICE CG153: Psoriasis assessment and management - https://www.nice.org.uk/guidance/cg153
- NICE CKS: Psoriasis - https://cks.nice.org.uk/topics/psoriasis/
- BAD guidelines: Psoriasis - https://www.bad.org.uk/healthcare-professionals/clinical-standards/clinical-guidelines/psoriasis
- Psoriasis Association - https://www.psoriasis-association.org.uk/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed psoriasis severity: distribution, BSA, plaque characteristics, nail involvement", "Used video to observe skin lesions", "Assessed quality of life impact (DLQI or equivalent enquiry)", "Screened for psoriatic arthritis symptoms (fingers, heel, back)", "Reviewed treatment history and reasons for topical treatment failure", "Assessed mental health (anxiety, mood, sleep, social withdrawal)", "Asked about alcohol intake and its relevance", "Explored occupational and relationship impact"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Referred to dermatology for moderate-to-severe psoriasis with quality of life impact", "Discussed treatment options beyond topicals (phototherapy, systemic, biologics)", "Screened for psoriatic arthritis and considered rheumatology input", "Optimised interim topical treatment and emollients", "Addressed mental health — reviewed sertraline, offered psychological support", "Sensitively discussed alcohol as an exacerbating factor", "Provided practical support (fitness note, occupational advice)", "Signposted to Psoriasis Association or peer support"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Acknowledged the patient''s frustration with years of topical treatment", "Showed empathy for the impact on self-esteem, relationships, and work", "Listened to and validated the emotional burden of the condition", "Responded positively to the patient''s request for specialist referral", "Checked understanding and discussed expectations for dermatology", "Used supportive and non-judgemental language throughout"]}
  }'::jsonb
);

-- =====================================================
-- CASE 7: Globus Sensation (ENT-003, ENT, easy)
-- Video consultation - lump in throat, cancer anxiety
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Globus Sensation - Lump in Throat',
  'ENT',
  'ENT-003',
  'Video consultation. A 44-year-old woman has booked an appointment because she has been feeling a lump in her throat for the past six weeks. She is worried it could be throat cancer as her uncle recently died of oesophageal cancer.',
  '{"name": "Mrs. Sonia Kapoor", "age": 44, "gender": "Female"}',
  '{"patient": "Mrs. Sonia Kapoor", "age": 44, "gender": "Female", "pmh": "Gastro-oesophageal reflux disease, anxiety disorder (GAD)", "medications": "Lansoprazole 30mg OD, Propranolol 40mg BD PRN (anxiety)", "allergies": "Erythromycin (diarrhoea)"}',
  '{
    "opening_statement": "Hello doctor. I have had this constant feeling of a lump in my throat for about six weeks now. I keep trying to swallow it away but it will not go. I am really scared it might be cancer. My uncle died of throat cancer last year and I cannot stop thinking about it.",
    "freely_given_history": {
      "presenting_complaint": "It feels like there is something stuck in my throat, right in the middle. It is not painful but it is a very uncomfortable feeling, like a ball or a tightness. I notice it more when I swallow saliva than when I eat or drink. Actually, eating sometimes makes it better. It has been there pretty much all day every day for about six weeks. Some days are worse than others. It seems to be worse when I am stressed.",
      "psychosocial_impact": "I am constantly aware of it. I keep swallowing to check if it is still there, which I know makes it worse. I have been googling throat cancer symptoms and I have convinced myself that is what it is. I am not sleeping well because I lie in bed thinking about it. I have got two young children and the thought of not being there for them is unbearable.",
      "ice": {
        "ideas": "I think it could be cancer. My uncle had trouble swallowing and it turned out to be oesophageal cancer. He was only diagnosed at a late stage.",
        "concerns": "I am terrified of cancer. I keep checking my throat in the mirror. I have felt my neck for lumps about ten times a day.",
        "expectations": "I want a camera put down my throat to see what is there. I need to know for certain it is not cancer."
      }
    },
    "history_on_direct_questioning": {
      "swallowing": {
        "dysphagia": "No, I can swallow food and drink perfectly well. In fact, eating is the one time the lump feeling goes away.",
        "odynophagia": "No pain when swallowing.",
        "liquids_vs_solids": "No difference. Both go down fine.",
        "weight_loss": "No, my weight has been stable. If anything I have put on a couple of pounds because I have been comfort eating."
      },
      "other_throat_symptoms": {
        "voice": "My voice is fine. No hoarseness.",
        "sore_throat": "No sore throat.",
        "neck_lumps": "I have not felt any lumps. I keep checking.",
        "ear_pain": "No ear pain."
      },
      "reflux": {
        "heartburn": "I do get heartburn sometimes, mainly after spicy food or big meals. The lansoprazole helps.",
        "acid_taste": "Occasionally I get an acid taste in my mouth in the morning.",
        "throat_clearing": "Yes, I do clear my throat a lot actually. My husband always comments on it."
      },
      "general_health": {
        "smoking": "I have never smoked.",
        "alcohol": "I drink a glass of wine at the weekend. Very little.",
        "stress": "I am very stressed at the moment. I work part-time as a teaching assistant and we are being inspected. Plus the worry about my health is making my anxiety much worse."
      },
      "anxiety": {
        "current_level": "My anxiety is through the roof. I am googling symptoms constantly. I have been taking my propranolol every day when I usually only need it occasionally.",
        "physical_symptoms": "I have been getting tension headaches, tight shoulders, and I clench my jaw at night."
      }
    },
    "ice": {
      "ideas": "I know you are probably going to tell me it is not cancer but how can you know without looking?",
      "concerns": "What if you reassure me and then it turns out to be something sinister?",
      "expectations": "I would feel so much better if I could just have it checked properly with a camera."
    },
    "specific_prompts": "If the doctor explains globus sensation, ask what causes it. If they link it to your reflux and anxiety, acknowledge that makes sense but still ask about investigation. If they explain why urgent referral is not needed (no red flags), accept this but ask what you should watch for. If they address your anxiety, become tearful and admit you have been really struggling."
  }',
  'ANXIOUS and health-anxious. Your fear of cancer is genuine and driven by your uncle''s recent death. You need thorough assessment and clear explanation to be reassured. You respond well to empathetic communication. If the doctor dismisses your concern or rushes, you remain anxious. If they take time to explain, you gradually settle.',
  'full',
  720,
  'easy',
  ARRAY['Recognise globus sensation from history', 'Differentiate from dysphagia and red flag symptoms', 'Screen for 2-week wait referral criteria', 'Link to GORD and anxiety', 'Address cancer anxiety sensitively', 'Explain globus mechanism', 'Optimise reflux treatment', 'Provide clear safety-netting'],
  '## Model Approach

**What this case is testing:** Recognition of globus sensation, appropriate exclusion of sinister pathology via history, managing significant health anxiety related to a family cancer death, and sensitive explanation of the diagnosis.

## Data Gathering

- Characterise the throat sensation: constant feeling of lump, worse on swallowing saliva, better with food — classic globus pattern
- Differentiate from dysphagia: no difficulty swallowing food or liquids, no food sticking, no odynophagia — no dysphagia
- Screen for red flags requiring 2-week wait referral (NICE NG12): dysphagia, unexplained weight loss, hoarseness >3 weeks, neck lump, unilateral ear pain — ALL ABSENT
- Assess reflux symptoms: heartburn present, acid taste, throat clearing — likely laryngopharyngeal reflux contributing
- Check voice: no hoarseness (excludes laryngeal pathology concern)
- Ask about smoking and alcohol (risk factors for head and neck cancer — both low risk)
- Assess anxiety: significantly worsened, constant health checking behaviour, sleep disturbance, physical tension symptoms
- Understand the context: uncle''s recent death from oesophageal cancer is the key driver of anxiety
- Explore impact on daily life and functioning

## Clinical Management

- **Diagnosis:** Globus pharyngeus (globus sensation), likely exacerbated by gastro-oesophageal reflux and anxiety
- **Explain the diagnosis:** Globus is a very common condition where the muscles in the throat become tense, creating a sensation of a lump. It is not a lump or a growth. It is often linked to acid reflux irritating the throat and to stress and anxiety. The fact that food goes down normally and the lump feeling improves with eating is very characteristic
- **Reassurance about cancer:** No red flags present. No dysphagia, no weight loss, no hoarseness, non-smoker, minimal alcohol. The 2-week wait cancer referral criteria are not met. Her uncle had different risk factors
- **Optimise reflux treatment:** Ensure lansoprazole is taken 30 minutes before breakfast. Consider increasing to 30mg BD for 4-8 weeks. Lifestyle advice: avoid eating late, raise head of bed, reduce caffeine and spicy food
- **Address anxiety:** This is the key driver. Current anxiety management (PRN propranolol) is insufficient. Consider increasing sertraline or starting an SSRI. Offer referral to IAPT/talking therapy. Discuss health anxiety cycle (checking, googling, reassurance-seeking maintains anxiety)
- **Investigation:** Routine ENT referral or upper GI investigation is NOT indicated when no red flags are present. However, if symptoms persist beyond 4-6 weeks of treatment, consider ENT referral for nasendoscopy for reassurance and completeness
- **Safety-netting:** Return if develops difficulty swallowing food, unintentional weight loss, voice changes lasting >3 weeks, neck lump, blood in saliva, or unilateral ear pain

## References
- NICE CKS: Globus sensation - https://cks.nice.org.uk/topics/globus-sensation/
- NICE NG12: Suspected cancer recognition and referral - https://www.nice.org.uk/guidance/ng12
- BMJ Best Practice: Globus sensation - https://bestpractice.bmj.com/topics/en-gb/766
- NICE CKS: GORD in adults - https://cks.nice.org.uk/topics/gord-in-adults/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Characterised the throat sensation (lump feeling, better with food, worse with saliva)", "Differentiated globus from dysphagia (food and drink swallow normally)", "Screened for 2-week wait red flags (dysphagia, weight loss, hoarseness, neck lump)", "Asked about reflux symptoms (heartburn, acid taste, throat clearing)", "Assessed smoking and alcohol as cancer risk factors", "Explored the context of the uncle''s cancer death driving anxiety", "Assessed current anxiety severity and physical symptoms", "Explored impact on daily life, sleep, and functioning"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained globus sensation clearly and in patient-friendly terms", "Provided evidence-based reassurance that cancer is not suspected (no red flags)", "Optimised reflux management (timing of PPI, lifestyle advice)", "Addressed anxiety as both a contributing factor and a condition needing treatment", "Discussed the health anxiety cycle (checking, googling, reassurance-seeking)", "Offered psychological support (IAPT referral or medication review)", "Explained when investigation would be warranted", "Provided specific safety-netting with red flag symptoms to watch for"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Acknowledged the cancer fear and its link to the uncle''s death", "Took the patient''s concerns seriously without dismissing them", "Showed empathy when the patient became emotional", "Used clear and non-patronising language to explain the diagnosis", "Checked understanding and allowed questions", "Provided proportionate reassurance without false promises"]}
  }'::jsonb
);

-- =====================================================
-- CASE 8: Tennis Elbow (MSK-003, Musculoskeletal, easy)
-- Video consultation - lateral elbow pain affecting work
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Tennis Elbow - Lateral Elbow Pain',
  'Musculoskeletal',
  'MSK-003',
  'Video consultation. A 39-year-old man has booked an appointment because he has had pain on the outside of his right elbow for about eight weeks. He is right-handed and works as a plumber, and the pain is making it difficult to grip tools and lift things.',
  '{"name": "Mr. Craig Benson", "age": 39, "gender": "Male"}',
  '{"patient": "Mr. Craig Benson", "age": 39, "gender": "Male", "pmh": "No significant past medical history", "medications": "None regular. Occasional ibuprofen for the elbow", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Alright doctor. I have got this pain in my elbow that will not go away. It is on the outside of my right elbow and it has been there for about two months now. I am a plumber and it is really affecting my work. I cannot grip a wrench properly because the pain shoots down my forearm.",
    "freely_given_history": {
      "presenting_complaint": "The pain started about eight weeks ago. I think it came on gradually, there was no injury as such. I first noticed it when I was tightening some pipes at work. It is right on the bony bit on the outside of my elbow. The pain goes down the outside of my forearm towards my wrist when I grip something hard. Turning a screwdriver is agony. Even picking up a kettle or a mug of tea hurts.",
      "psychosocial_impact": "I am self-employed so if I do not work I do not get paid. I have had to turn down a couple of jobs this month because I just cannot do the heavy gripping work. I am getting worried about money. I have been trying to push through it but it is getting worse not better.",
      "ice": {
        "ideas": "My mate at work said it sounds like tennis elbow but I do not even play tennis. I am not sure if that is right or if there is something else going on.",
        "concerns": "I am worried I might have damaged something properly, like torn a tendon or something. I need my hands for work and I am scared it might be permanent.",
        "expectations": "I was hoping for a scan or an x-ray to see what is going on, and maybe some stronger painkillers or an injection."
      }
    },
    "history_on_direct_questioning": {
      "pain_assessment": {
        "site": "Right lateral epicondyle. Points directly to the bony prominence on the outside of the elbow.",
        "onset": "Gradual over about eight weeks. No specific injury or trauma.",
        "character": "Sharp pain when gripping or twisting. Dull ache at rest.",
        "radiation": "Goes down the top of my forearm towards my wrist.",
        "severity": "About six out of ten at rest. Eight out of ten when gripping hard.",
        "aggravating": "Gripping tools, turning screwdrivers, lifting, wringing out cloths, shaking hands.",
        "relieving": "Rest helps. Ibuprofen takes the edge off for a few hours. I have been icing it in the evening.",
        "night_pain": "It does not wake me at night. Occasionally aches if I lie on that arm."
      },
      "examination_via_video": {
        "inspection": "No visible swelling or redness. No bruising.",
        "tenderness": "If I press on the bony bit on the outside, it is really tender.",
        "resisted_wrist_extension": "If I make a fist and try to bend my wrist back against my other hand, it reproduces the pain exactly.",
        "grip_strength": "My grip is definitely weaker on the right compared to the left.",
        "elbow_movement": "I can bend and straighten my elbow fully. No locking or catching.",
        "neck": "No neck pain or stiffness. No tingling in my fingers."
      },
      "previous_treatment": {
        "painkillers": "Ibuprofen 400mg two or three times a day when it is bad. Paracetamol does nothing.",
        "rest": "I have tried resting it at weekends but by Monday I am back at work and it flares up again.",
        "other": "My wife bought me an elbow strap from the chemist. It helps a little bit when I wear it at work."
      }
    },
    "ice": {
      "ideas": "Is it tennis elbow? Will it get better on its own?",
      "concerns": "I am worried about how long this is going to take and whether I can keep working.",
      "expectations": "I would like to know the best way to treat it and how long before I am back to normal."
    },
    "specific_prompts": "If the doctor asks you to do some movements on camera, cooperate fully. If they confirm tennis elbow, ask how long it takes to get better. If they say it can take months, look disappointed. If they explain exercises, ask for a clear description. If they discuss a steroid injection, ask about the pros and cons."
  }',
  'STRAIGHTFORWARD and practical. You want a clear answer and a plan. You are not anxious but you are worried about your income. You appreciate a doctor who explains things simply and gives practical advice you can follow. If they suggest rest only without acknowledging your financial situation, push back.',
  'full',
  720,
  'easy',
  ARRAY['Diagnose lateral epicondylitis from history', 'Perform video-guided examination (Cozen''s test equivalent)', 'Explain the condition and expected recovery time', 'Discuss conservative management (exercises, load modification)', 'Consider steroid injection with informed discussion', 'Address occupational impact and self-employment concerns', 'Explain why imaging is not usually needed initially', 'Provide safety-netting and physiotherapy referral'],
  '## Model Approach

**What this case is testing:** Clinical diagnosis of lateral epicondylitis via video consultation, appropriate conservative management, discussion about steroid injection pros and cons, and addressing the occupational impact for a self-employed manual worker.

## Data Gathering

- Establish site of pain: lateral epicondyle (bony prominence on outside of elbow) — classic site for tennis elbow
- Gradual onset without trauma — typical for overuse tendinopathy
- Pain pattern: worse with gripping, twisting, lifting; better with rest — characteristic
- Occupation: plumber, right-handed, repetitive gripping and twisting — clear occupational risk factor
- Video examination: no swelling, tenderness over lateral epicondyle, pain on resisted wrist extension (Cozen''s test equivalent), full elbow ROM, no locking
- Exclude differentials: normal elbow ROM (not arthritis), no locking/catching (not loose body), no neck symptoms or finger tingling (not referred from cervical spine), no weakness other than pain-related
- Review current self-management: ibuprofen (partially helpful), ice, elbow strap (partially helpful), attempted rest
- Assess impact: self-employed, financial concerns, inability to take significant time off work

## Clinical Management

- **Diagnosis:** Lateral epicondylitis (tennis elbow) — an overuse tendinopathy of the common extensor origin. It is not caused by playing tennis; it is caused by repetitive gripping and twisting
- **Prognosis:** Most cases resolve within 12-18 months. With appropriate management, significant improvement often within 6-12 weeks. This is a self-limiting condition but recovery can be slow
- **First-line treatment — eccentric exercises:** Tyler twist / wrist extensor eccentric loading exercises. Perform 3 sets of 15 repetitions, twice daily. Key intervention with best evidence base. Can refer to physiotherapy for guidance
- **Load modification:** Modify work technique where possible — use tools with larger grips, alternate hands, take regular breaks, avoid repetitive forceful gripping. This does NOT mean complete rest
- **Elbow clasp/counterforce brace:** Continue using — worn just below the elbow, can reduce strain on the tendon during work
- **Analgesia:** Continue ibuprofen gel topically (may be better tolerated than oral). Paracetamol regularly. Avoid prolonged oral NSAID use
- **Steroid injection:** Can provide short-term pain relief (4-6 weeks) but evidence suggests higher recurrence rates at 6-12 months compared to physiotherapy alone. Discuss pros and cons. May be appropriate if severe pain is preventing engagement with exercises or if work situation is critical. Maximum 2-3 injections
- **Imaging:** X-ray and MRI are NOT indicated for typical lateral epicondylitis. Imaging would only be considered if diagnosis is uncertain or symptoms persist despite 6 months of treatment
- **Physiotherapy referral:** Recommended for supervised exercise programme, load management advice, and possible adjuncts (ultrasound, acupuncture)
- **Safety-netting:** If symptoms worsen, new symptoms (locking, tingling, neck pain), or no improvement after 3 months of exercises — return for review

## References
- NICE CKS: Tennis elbow - https://cks.nice.org.uk/topics/tennis-elbow/
- BMJ Best Practice: Lateral epicondylitis - https://bestpractice.bmj.com/topics/en-gb/588
- BSSH (British Society for Surgery of the Hand): Lateral epicondylitis - https://www.bssh.ac.uk/
- CSP (Chartered Society of Physiotherapy): Exercises for tennis elbow - https://www.csp.org.uk/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established site, onset, and character of pain (lateral epicondyle, gradual, grip-related)", "Identified occupational risk factor (plumber, repetitive gripping)", "Performed video-guided examination (tenderness, resisted wrist extension, elbow ROM)", "Excluded cervical spine referred pain (no neck symptoms, no tingling)", "Excluded other elbow pathology (full ROM, no locking, no swelling)", "Assessed current self-management and response to treatment", "Explored the occupational and financial impact", "Explored ICE including concern about tendon damage"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made correct clinical diagnosis of lateral epicondylitis", "Explained the condition and prognosis in understandable terms", "Prescribed eccentric exercises as first-line treatment", "Discussed load modification that is practical for his job", "Discussed steroid injection with balanced pros and cons", "Explained why imaging is not routinely needed", "Offered physiotherapy referral", "Provided safety-netting advice for persistent or worsening symptoms"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Acknowledged the impact on his work and income", "Showed understanding of the self-employment financial pressure", "Gave practical advice tailored to his occupation", "Explained things clearly without condescension", "Checked understanding and invited questions", "Was supportive and encouraged engagement with rehabilitation"]}
  }'::jsonb
);

-- =====================================================
-- CASE 9: Abnormal ECG Result Discussion (CARD-005, Cardiology, medium)
-- Telephone consultation - explaining incidental ECG finding
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Abnormal ECG Result Discussion - Incidental Finding',
  'Cardiology',
  'CARD-005',
  'Telephone consultation. A 52-year-old man had a routine ECG performed at his NHS health check last week. The ECG report shows left bundle branch block (LBBB), which is a new finding. He has been asked to call for his results and has no idea there is an abnormality.',
  '{"name": "Mr. Philip Ashworth", "age": 52, "gender": "Male"}',
  '{"patient": "Mr. Philip Ashworth", "age": 52, "gender": "Male", "pmh": "Hypertension (well controlled), hyperlipidaemia", "medications": "Amlodipine 5mg OD, Atorvastatin 20mg ON", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hello doctor. I had my NHS health check last week and the nurse did a heart tracing thing. She said I needed to phone for the results. Is everything alright? I assumed it was all fine because nobody contacted me urgently.",
    "freely_given_history": {
      "presenting_complaint": "I feel absolutely fine. I only went for the health check because my wife made me. I have not got any symptoms at all. I feel fit and well.",
      "psychosocial_impact": "I run my own landscaping business and I am out doing physical work five days a week. I have never had a day off sick. My wife is always nagging me to look after my health better but honestly I feel great.",
      "ice": {
        "ideas": "I do not know what could be wrong. The nurse said the tracing looked a bit different but she could not tell me what it meant.",
        "concerns": "I was not worried at all until you said the word abnormal. Now I am worried. Does this mean there is something wrong with my heart?",
        "expectations": "I want to know what is going on and whether I need to do anything about it."
      }
    },
    "history_on_direct_questioning": {
      "cardiac_symptoms": {
        "chest_pain": "No chest pain at all. Not at rest, not with exercise.",
        "breathlessness": "No. I can work physically all day without getting out of breath. I mow lawns, dig borders, carry heavy things.",
        "palpitations": "No. My heart feels normal.",
        "syncope": "Never fainted or felt like I was going to faint.",
        "ankle_swelling": "No.",
        "exercise_tolerance": "Excellent. I play five-a-side football with my mates on Wednesday evenings. No problems at all."
      },
      "risk_factors": {
        "smoking": "I stopped about ten years ago. Used to smoke about fifteen a day.",
        "diabetes": "No. My blood sugar was fine at the health check.",
        "blood_pressure": "It was 138 over 82 at the health check. I take my amlodipine every day.",
        "family_history": "My dad had a heart attack at sixty-three but he was a heavy smoker and quite overweight. He survived and is still going now at seventy-eight.",
        "weight": "I am about thirteen stone, five foot eleven. The nurse said my BMI was fine.",
        "alcohol": "I have a few beers at the weekend. Maybe four or five pints on a Saturday.",
        "exercise": "Very active. Physical job and football once a week."
      },
      "general_health": {
        "medications": "Just the amlodipine and the statin. I take them both every day.",
        "cholesterol": "The nurse said my cholesterol was fine. I cannot remember the exact numbers.",
        "other_conditions": "Nothing else. I am generally very healthy."
      }
    },
    "ice": {
      "ideas": "I do not understand what a bundle branch block means. Is it a blockage in my heart?",
      "concerns": "Am I at risk of a heart attack? Should I stop playing football? Can I still do my physical job?",
      "expectations": "Do I need more tests? I want to know that my heart is okay."
    },
    "specific_prompts": "When told about the LBBB, look confused and ask them to explain in simple terms. Ask if it is like a heart attack. Ask if you need to stop exercising. If they explain that further tests are needed (echo), ask what they are looking for. If they reassure you that many people with LBBB are fine, ask why it needs investigating then."
  }',
  'INITIALLY RELAXED, then CONFUSED and WORRIED when told about the abnormality. You do not understand medical terminology and need things explained very simply. Your main fear is that you are about to have a heart attack. You are a practical, no-nonsense person who wants straight answers. You calm down once given a clear explanation and a plan.',
  'full',
  720,
  'medium',
  ARRAY['Explain LBBB in patient-friendly terms', 'Differentiate from a heart attack or blockage', 'Discuss the significance of new LBBB', 'Arrange echocardiogram (NICE recommended)', 'Consider cardiology referral', 'Reassure about exercise while awaiting investigation', 'Address cardiovascular risk factors', 'Provide clear safety-netting'],
  '## Model Approach

**What this case is testing:** Breaking unexpected news about an incidental ECG finding, explaining LBBB in understandable terms, appropriate investigation with echocardiography, balancing reassurance with the need for further assessment, and addressing the patient''s immediate fears about heart attacks and exercise.

## Data Gathering

- Review the ECG finding: new left bundle branch block (LBBB) — not previously documented
- Ask about cardiac symptoms: chest pain, breathlessness, palpitations, syncope, ankle swelling — all absent
- Assess exercise tolerance: excellent — physically active job and plays football
- Review cardiovascular risk factors: ex-smoker (10 years ago), family history (father MI at 63), hypertension (controlled), hyperlipidaemia (on statin), no diabetes, active, BMI normal
- Check no previous ECGs on record for comparison (this is a new finding)
- Confirm current medications and adherence
- Assess alcohol intake: approximately 4-5 pints weekly — moderate
- Assess the patient''s understanding and emotional response to the news

## Clinical Management

- **Explain LBBB simply:** The heart''s electrical system has two main pathways (bundles) that carry electrical signals to make the heart squeeze. In LBBB, the signal down the left pathway is delayed, so the heart squeezes in a slightly different pattern. It is NOT a blockage in the blood vessels and it is NOT the same as a heart attack
- **Significance of new LBBB:** In an asymptomatic person, LBBB may be an incidental finding with no clinical significance. However, new LBBB can sometimes be associated with underlying heart conditions such as cardiomyopathy, valvular heart disease, or ischaemic heart disease. It requires investigation
- **Echocardiogram:** Arrange an echocardiogram to assess heart structure and function. This is a non-invasive ultrasound scan of the heart. NICE recommends echo for new LBBB to exclude structural heart disease
- **Cardiology referral:** Consider referral to cardiology for review. If echo is normal and the patient is asymptomatic, may not require ongoing cardiology follow-up
- **Exercise advice:** In the absence of symptoms, it is safe to continue normal physical activity including work and football while awaiting investigation. If any symptoms develop during exercise (chest pain, breathlessness, lightheadedness), stop immediately and seek help
- **Cardiovascular risk optimisation:** Review BP target (aim <140/90 in uncomplicated hypertension). Ensure statin dose is appropriate (may need increasing). Reinforce alcohol moderation and smoke-free status
- **Blood tests:** Consider bloods if not already done at health check: FBC, U&Es, lipid profile, glucose/HbA1c, TFTs, BNP (baseline before echo)
- **Safety-netting:** Report any new symptoms urgently — chest pain, breathlessness on exertion, palpitations, fainting, or unusual fatigue

## References
- NICE CKS: ECG interpretation and referral - https://cks.nice.org.uk/topics/ecg-identification/
- BMJ Best Practice: Bundle branch block - https://bestpractice.bmj.com/topics/en-gb/1198
- NICE NG106: Chronic heart failure (LBBB in context of HF) - https://www.nice.org.uk/guidance/ng106
- British Heart Foundation: Electrical problems - https://www.bhf.org.uk/informationsupport/conditions/electrical-problems',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Reviewed and explained the ECG finding (new LBBB)", "Asked about cardiac symptoms (chest pain, breathlessness, syncope, palpitations)", "Assessed current exercise tolerance thoroughly", "Reviewed cardiovascular risk factors (smoking history, family history, BP, lipids)", "Checked for any previous ECGs for comparison", "Confirmed current medications and adherence", "Assessed the patient''s understanding and emotional response", "Asked about alcohol and lifestyle factors"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained LBBB in clear, patient-friendly language", "Differentiated LBBB from a heart attack or arterial blockage", "Arranged echocardiogram to assess heart structure and function", "Considered cardiology referral for new LBBB", "Advised that exercise is safe to continue while asymptomatic", "Reviewed and optimised cardiovascular risk factors", "Considered baseline blood tests (BNP, bloods)", "Provided specific safety-netting symptoms to watch for"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Broke unexpected news sensitively over the telephone", "Used simple language to explain a complex medical finding", "Addressed the immediate fear about heart attacks directly", "Balanced reassurance with honesty about the need for investigation", "Checked understanding and allowed time for questions", "Acknowledged the patient''s anxiety and validated his concerns"]}
  }'::jsonb
);

-- =====================================================
-- CASE 10: Tinnitus Assessment (ENT-004, ENT, medium)
-- Video consultation - unilateral tinnitus, exclude acoustic neuroma
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Tinnitus Assessment - Unilateral Symptoms',
  'ENT',
  'ENT-004',
  'Video consultation. A 48-year-old woman has booked an appointment because she has had a constant ringing sound in her right ear for the past three months. It is gradually getting louder and she has noticed her hearing seems reduced on that side.',
  '{"name": "Mrs. Helen Drummond", "age": 48, "gender": "Female"}',
  '{"patient": "Mrs. Helen Drummond", "age": 48, "gender": "Female", "pmh": "Migraine without aura, cervical spondylosis", "medications": "Sumatriptan 50mg PRN, Naproxen 500mg PRN", "allergies": "Penicillin (anaphylaxis)"}',
  '{
    "opening_statement": "Hello doctor. I have had this ringing in my right ear for about three months now. It started off quite quiet and I thought it would go away on its own but it has been getting louder. I have also noticed that my hearing is not as good on that side. I am getting a bit worried about it.",
    "freely_given_history": {
      "presenting_complaint": "The ringing is in my right ear only. It is a constant high-pitched tone, like a whistle. It never stops. It is there all the time, day and night. I notice it most when it is quiet, like when I am trying to go to sleep or reading a book. It started about three months ago and has gradually got louder. I have also noticed that when I use the phone on my right ear, I cannot hear as well. I have started using my left ear for phone calls.",
      "psychosocial_impact": "It is really getting me down. I am a librarian and the quiet environment means I can hear the ringing all day. I am struggling to concentrate at work. At night, I have to have the radio on to mask it or I cannot get to sleep. My husband says I have been turning the TV up louder. I am starting to feel quite anxious about it.",
      "ice": {
        "ideas": "I looked it up online and I read about something called an acoustic neuroma. I am worried it could be that.",
        "concerns": "I am scared it could be a tumour in my ear. I am also worried about losing my hearing completely in that ear.",
        "expectations": "I think I need a hearing test and probably a scan to rule out anything serious."
      }
    },
    "history_on_direct_questioning": {
      "tinnitus_details": {
        "laterality": "Right ear only. The left ear is completely fine.",
        "character": "High-pitched continuous whistle or ring. Constant, never pulsatile.",
        "duration": "Three months. Gradually getting louder.",
        "triggers": "No specific triggers. It is there all the time.",
        "medications": "I take naproxen for my neck pain sometimes, maybe once or twice a week."
      },
      "hearing": {
        "subjective_loss": "Yes, definitely reduced on the right side. I noticed about six weeks ago when I could not hear my colleague whispering on my right side.",
        "onset": "Gradual, over the past couple of months.",
        "bilateral": "No, just the right side. The left ear is fine."
      },
      "associated_symptoms": {
        "vertigo": "No spinning. No dizziness.",
        "ear_discharge": "No discharge from either ear.",
        "ear_pain": "No ear pain.",
        "facial_symptoms": "No numbness or weakness of my face.",
        "headache": "I get my usual migraines but they are no different from normal."
      },
      "risk_factors": {
        "noise_exposure": "No. I have always worked in quiet environments. No concerts, no headphone use at loud volumes.",
        "family_history": "No family history of hearing loss or ear problems.",
        "head_injury": "No head injuries.",
        "ear_infections": "No recent ear infections."
      },
      "examination_via_video": {
        "ears": "No visible redness or swelling of either ear. No discharge.",
        "facial_symmetry": "My face looks normal and symmetrical. I can raise both eyebrows and close both eyes."
      }
    },
    "ice": {
      "ideas": "I am really worried about the acoustic neuroma possibility. Is that what this could be?",
      "concerns": "Will I go deaf in that ear? And if it is a tumour, what happens?",
      "expectations": "I want to be referred for proper tests. I do not think I can wait and see on this one."
    },
    "specific_prompts": "If the doctor acknowledges that unilateral tinnitus with hearing loss needs investigation, show relief that you are being taken seriously. If they try to reassure you without mentioning referral, push back and mention the acoustic neuroma concern. If they explain the referral pathway (audiology and ENT), ask how long it will take and what the tests involve."
  }',
  'WORRIED but articulate. You have done your research and you know that unilateral tinnitus is a red flag. You are not hysterical but you are persistent about wanting investigation. You are relieved and grateful when the doctor takes your concern seriously and arranges an appropriate referral. If the doctor is dismissive, you become more insistent.',
  'full',
  720,
  'medium',
  ARRAY['Recognise unilateral tinnitus with hearing loss as a red flag', 'Consider acoustic neuroma (vestibular schwannoma) in differential', 'Arrange urgent audiometry and ENT referral', 'Exclude other causes of unilateral tinnitus', 'Discuss the possibility of acoustic neuroma sensitively', 'Assess for associated neurological symptoms', 'Provide coping strategies for tinnitus in the interim', 'Address anxiety and sleep impact'],
  '## Model Approach

**What this case is testing:** Recognition that unilateral tinnitus with unilateral hearing loss is a red flag requiring urgent investigation to exclude retrocochlear pathology (acoustic neuroma/vestibular schwannoma), appropriate referral pathway, and sensitive communication about the possibility of a tumour.

## Data Gathering

- Establish tinnitus characteristics: unilateral (right only), continuous, non-pulsatile, high-pitched, progressive over 3 months — red flag pattern
- Confirm unilateral hearing loss: subjective reduction in right ear, gradual onset — this combination mandates investigation
- Assess for vestibular schwannoma features: unilateral tinnitus (present), unilateral hearing loss (present), vertigo (absent), facial numbness/weakness (absent), balance problems (absent)
- Exclude pulsatile tinnitus: not present — pulsatile tinnitus has a different differential (vascular causes)
- Ask about noise exposure history: none — makes noise-induced hearing loss unlikely
- Review medications: naproxen — NSAIDs can rarely be ototoxic in high doses but unlikely at her frequency
- Ask about ear infections, discharge, pain: all absent
- Assess cranial nerves via video: facial symmetry normal, no obvious abnormality
- Screen for Meniere''s disease: no vertigo, no aural fullness — unlikely
- Assess psychological impact: anxiety, sleep disruption, concentration difficulties at work

## Clinical Management

- **Red flag recognition:** Unilateral tinnitus with unilateral sensorineural hearing loss requires urgent investigation to exclude retrocochlear pathology, most importantly vestibular schwannoma (acoustic neuroma)
- **Referral pathway:** Urgent ENT referral (2-week wait pathway in many trusts for unilateral audiovestibular symptoms). Include request for pure tone audiometry and consideration for MRI internal auditory meatus (IAM) with gadolinium — gold standard for acoustic neuroma detection
- **Audiometry:** Arrange urgent audiometry (pure tone audiogram) if this can be done before or alongside the ENT referral. This will confirm and characterise the hearing loss
- **Sensitive discussion about acoustic neuroma:** Most cases of unilateral tinnitus are NOT caused by acoustic neuroma (incidence is approximately 1 in 100,000). However, it is important to investigate to rule it out. If found, acoustic neuromas are usually benign, slow-growing, and treatable. Being honest about the need for investigation without causing unnecessary alarm
- **Interim tinnitus management:** Background noise or white noise at night (radio, fan, sound app). Avoid silence. Tinnitus habituation techniques. Consider referral to tinnitus support services or audiology for tinnitus management if prolonged
- **Mental health support:** Acknowledge the anxiety and sleep impact. Consider short-term sleep hygiene advice. If anxiety worsens, consider treatment
- **Avoid delays:** This should not be a ''wait and see'' situation given the red flag combination. Investigate promptly
- **Safety-netting:** If facial weakness, numbness, balance problems, or sudden hearing loss develops before the appointment, attend A&E or contact urgently

## References
- NICE CKS: Tinnitus - https://cks.nice.org.uk/topics/tinnitus/
- NICE NG98: Hearing loss in adults - https://www.nice.org.uk/guidance/ng98
- NICE NG12: Suspected cancer recognition and referral (head and neck) - https://www.nice.org.uk/guidance/ng12
- BAA (British Academy of Audiology): Tinnitus guidelines - https://www.baaudiology.org/
- British Tinnitus Association - https://www.tinnitus.org.uk/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established unilateral tinnitus (right ear only, continuous, progressive)", "Confirmed unilateral hearing loss on the same side", "Recognised the red flag combination (unilateral tinnitus + unilateral hearing loss)", "Asked about vestibular schwannoma features (vertigo, facial symptoms, balance)", "Excluded pulsatile tinnitus (different differential diagnosis)", "Asked about noise exposure and ototoxic medications", "Assessed cranial nerve function via video (facial symmetry)", "Explored the psychological impact (anxiety, sleep, concentration)"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised need for urgent investigation (not wait and see)", "Arranged urgent ENT referral for unilateral audiovestibular symptoms", "Requested or arranged audiometry (pure tone audiogram)", "Discussed the possibility of acoustic neuroma sensitively and proportionately", "Provided interim tinnitus coping strategies (background noise, sleep hygiene)", "Addressed anxiety and offered support", "Did not falsely reassure or delay investigation", "Provided clear safety-netting (facial weakness, sudden hearing loss, balance problems)"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Took the patient''s concerns seriously from the outset", "Acknowledged that she had researched acoustic neuroma and validated her concern", "Discussed the possibility of a tumour honestly without causing panic", "Explained the investigation pathway and what to expect", "Showed empathy for the impact on her work and sleep", "Checked understanding and allowed time for questions"]}
  }'::jsonb
);
