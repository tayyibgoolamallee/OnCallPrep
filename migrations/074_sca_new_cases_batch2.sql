-- Migration 074: 10 new SCA full cases (batch 2)
-- Mixed categories: Obstetrics, Paediatrics, Women's Health, Ethics, Mental Health

-- =====================================================
-- CASE 1: Bleeding in Early Pregnancy
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Bleeding in Early Pregnancy',
  'Obstetrics',
  'WH-006',
  'Video consultation. A 29-year-old woman is calling about vaginal bleeding at approximately eight weeks of pregnancy. She is at home and visibly anxious on camera.',
  '{"name": "Mrs. Sophie Brennan", "age": 29, "gender": "Female"}',
  '{"patient": "Mrs. Sophie Brennan", "age": 29, "gender": "Female", "pmh": "No significant past medical history, one previous early miscarriage at 6 weeks (2023)", "medications": "Folic acid 400mcg OD, Pregnacare vitamin", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hi doctor, thank you for seeing me. I am about eight weeks pregnant and I started bleeding this morning. I am really scared because I lost a baby before.",
    "freely_given_history": {
      "presenting_complaint": "I woke up this morning and noticed some blood on my underwear. It is bright red and there has been a small amount every time I go to the toilet since then. I have also had some cramping in my lower tummy, mainly on the left side. I did a positive pregnancy test three weeks ago and I have had no problems until today.",
      "psychosocial_impact": "I am absolutely terrified. My husband is at work and I am at home on my own. Last time I had a miscarriage it was devastating and it took me a year to feel ready to try again. I cannot go through that again. I have been crying all morning.",
      "ice": {
        "ideas": "I think I am having another miscarriage. That is what happened last time, it started with a bit of bleeding and then I lost the baby.",
        "concerns": "I am scared the baby has died. I am also worried because the pain is on one side and my friend said that could mean an ectopic pregnancy.",
        "expectations": "I want a scan as soon as possible to see if the baby is okay. I do not want to just wait and see."
      }
    },
    "history_on_direct_questioning": {
      "bleeding_details": {
        "amount": "It is not soaking through a pad. I would say it is about two tablespoons worth each time I go to the toilet.",
        "colour": "Bright red, no clots so far.",
        "onset": "Started this morning around seven o''clock. About four hours ago.",
        "associated_pain": "Cramping in the lower abdomen, mainly on the left side. It comes and goes. About four out of ten for pain."
      },
      "pregnancy_details": {
        "lmp": "My last period was about eight weeks ago. I am fairly sure of my dates because we were tracking with an app.",
        "positive_test": "Positive home test three weeks ago. I have not had a booking appointment yet, that is next week.",
        "symptoms": "I have had morning sickness and sore breasts. The nausea has eased off a bit over the past two days which is worrying me.",
        "previous_scans": "No scans this pregnancy."
      },
      "previous_obstetric_history": {
        "miscarriage": "I had a miscarriage at six weeks in 2023. It happened naturally and I did not need any treatment. It was confirmed on a scan at the early pregnancy unit.",
        "other_pregnancies": "No other pregnancies."
      },
      "general_health": {
        "haemodynamic_status": "I feel a bit dizzy when I stand up. Not fainted. No shoulder tip pain.",
        "temperature": "I do not have a thermometer but I do not feel hot or cold.",
        "cervical_history": "Smears all normal. No STIs."
      }
    },
    "secondary_history": {
      "contraception_history": "We stopped using condoms when we started trying. No hormonal contraception for over a year.",
      "rhesus_status": "I think I am rhesus negative. They told me that at the hospital last time."
    },
    "ice": {
      "ideas": "I think I am losing this baby too.",
      "concerns": "I am really frightened about an ectopic because of the left-sided pain.",
      "expectations": "I need a scan today if possible. I cannot just sit at home not knowing."
    },
    "specific_prompts": "If the doctor reassures you that bleeding can occur in healthy pregnancies, ask about the left-sided pain specifically. If the doctor arranges an urgent early pregnancy unit referral, show relief. If the doctor mentions your rhesus status, confirm you are rhesus negative and ask what that means for this pregnancy."
  }',
  'ANXIOUS and tearful. You are sitting at home alone and visibly distressed on the video call. You have been through a miscarriage before and the fear is very real. If the doctor is calm and empathetic, you settle slightly but remain worried. If they minimise your concerns, you become more upset.',
  'full',
  720,
  'medium',
  ARRAY['Assess severity and nature of bleeding in early pregnancy', 'Screen for ectopic pregnancy (left-sided pain, dizziness)', 'Arrange urgent early pregnancy unit referral for scan', 'Address rhesus negative status and anti-D prophylaxis', 'Consider differential: threatened miscarriage, ectopic, molar pregnancy', 'Manage patient anxiety sensitively given previous miscarriage', 'Provide appropriate safety-netting'],
  '## Model Approach

**What this case is testing:** Assessment of vaginal bleeding in early pregnancy, recognition of potential ectopic pregnancy risk, referral pathways, and sensitive management of a patient with previous pregnancy loss.

**Data Gathering:**
- Establish the nature of bleeding: onset, amount, colour, presence of clots or tissue
- Assess pain: location (left-sided is important), severity, character
- Confirm gestation and certainty of dates (LMP, positive test timing)
- Previous obstetric history: previous miscarriage is a risk factor
- Screen for ectopic pregnancy symptoms: unilateral pain, shoulder tip pain, dizziness, syncope
- Assess haemodynamic stability: dizziness on standing, pallor, heart rate
- Ask about rhesus status (patient thinks she is rhesus negative)
- Review pregnancy symptoms (nausea easing can be normal or concerning)

**Clinical Management:**
- Urgent referral to Early Pregnancy Assessment Unit (EPAU) for transvaginal ultrasound today or next available slot
- Left-sided pain with bleeding raises concern for ectopic pregnancy - must be excluded
- If haemodynamically unstable (not the case here but important to assess): 999 ambulance to A&E
- Rhesus negative: will need anti-D immunoglobulin if bleeding continues or after any surgical intervention (NICE NG126)
- Advise: use pads not tampons, avoid sexual intercourse until assessed, attend A&E if bleeding becomes heavy, pain worsens, she feels faint, or develops shoulder tip pain
- Do NOT perform a vaginal examination in primary care in early pregnancy bleeding
- Acknowledge previous miscarriage and its emotional impact
- Provide information about the Miscarriage Association for support
- Arrange follow-up after EPAU assessment

**References:**
- NICE NG126: Ectopic pregnancy and miscarriage - https://www.nice.org.uk/guidance/ng126
- NICE CKS: Miscarriage - https://cks.nice.org.uk/topics/miscarriage/
- RCOG Green-top Guideline 25: Management of early pregnancy loss
- Miscarriage Association: https://www.miscarriageassociation.org.uk/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed the bleeding in detail (amount, colour, onset, clots)", "Explored the pain characteristics including left-sided location", "Confirmed gestation and certainty of dates", "Screened for ectopic pregnancy symptoms (unilateral pain, dizziness, shoulder tip pain)", "Assessed haemodynamic stability (dizziness on standing)", "Asked about rhesus status", "Explored previous miscarriage history and its emotional impact", "Explored ICE (fear of another miscarriage, concern about ectopic, desire for urgent scan)"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Arranged urgent referral to Early Pregnancy Assessment Unit for ultrasound", "Recognised left-sided pain requires ectopic pregnancy exclusion", "Identified rhesus negative status and need for anti-D consideration", "Advised against vaginal examination in primary care", "Provided specific safety-netting (heavy bleeding, increased pain, faintness, shoulder tip pain = A&E)", "Advised use of pads not tampons and avoidance of intercourse", "Signposted to Miscarriage Association for emotional support", "Arranged follow-up after EPAU assessment"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was calm, empathetic, and reassuring throughout", "Acknowledged the patient''s previous loss and its impact", "Validated the patient''s anxiety without dismissing her concerns", "Explained the plan clearly and in accessible language", "Demonstrated genuine concern for the patient''s wellbeing", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 2: Childhood Behavioural Concerns
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Childhood Behavioural Concerns',
  'Paediatrics',
  'PAED-008',
  'Video consultation. A mother is attending to discuss concerns about her seven-year-old son''s behaviour at school. The school has suggested he might have ADHD and she is unsure what to do.',
  '{"name": "Oliver Kavanagh", "age": 7, "gender": "Male"}',
  '{"patient": "Oliver Kavanagh", "age": 7, "gender": "Male", "pmh": "Born at 38 weeks by normal vaginal delivery, no neonatal concerns, immunisations up to date, mild speech delay (discharged from SALT age 5)", "medications": "None", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hi doctor, the school has been on at me about Oliver''s behaviour. His teacher says he cannot sit still and he is disruptive in class. She basically told me to come and get him tested for ADHD. I do not know what to think.",
    "freely_given_history": {
      "presenting_complaint": "Oliver''s teacher called me in for a meeting last week. She said he is constantly fidgeting, he gets up and walks around the classroom, he interrupts other children, and he cannot focus on tasks for more than a few minutes. She says he is falling behind with his reading and writing. She gave me a leaflet about ADHD and said I should speak to the GP.",
      "psychosocial_impact": "I feel like they are labelling him. He is only seven. He is a lovely boy at home. He is full of energy but I thought that was just normal for his age. Other parents at the school gate have been asking what is wrong with him and I feel embarrassed. Oliver is starting to say he hates school and does not want to go.",
      "ice": {
        "ideas": "I do not think there is anything wrong with him. I think the school just cannot handle active boys. His dad was exactly the same at school.",
        "concerns": "I am worried that if he gets a label it will follow him forever. But I am also worried that if there is something going on and I ignore it, he will fall further behind.",
        "expectations": "I want to know what you think. Is this just normal behaviour? Does he need some kind of assessment? I do not want him put on medication."
      }
    },
    "history_on_direct_questioning": {
      "behaviour_at_school": {
        "attention": "His teacher says he cannot concentrate for more than about five minutes on any task. He loses things constantly: his pencil, his reading book, his PE kit.",
        "hyperactivity": "He is always on the go. He runs in the corridor, he climbs on things in the playground. He cannot wait his turn.",
        "impulsivity": "He shouts out answers without putting his hand up. He has pushed other children when frustrated. He had a meltdown last week and threw a chair.",
        "social": "He has one good friend. Some of the other children have stopped wanting to play with him because he is too rough.",
        "academic": "He is behind in reading and writing. His maths is actually quite good."
      },
      "behaviour_at_home": {
        "routine": "He is better at home when it is just us. He can play Lego for ages if he is interested. But homework is a nightmare. He cries and refuses to do it.",
        "sleep": "He takes ages to fall asleep. He is still awake at 9pm most nights even if I put him to bed at 7.30. He wakes up early, around 5.30am.",
        "eating": "He is a fussy eater. He will only eat about five different foods. Mainly chicken nuggets, pasta, and toast.",
        "screen_time": "He watches a lot of YouTube and plays games on the tablet. Probably three or four hours a day. That is the only time he is calm."
      },
      "developmental_history": {
        "milestones": "He walked at 13 months. His speech was a bit late. He had speech therapy until he was five. He is fine now with talking.",
        "birth": "Normal birth, no problems. He was a big baby, nine pounds.",
        "family_history": "His dad was always in trouble at school. He was never assessed for anything though. My brother has dyslexia."
      },
      "home_situation": {
        "parents": "I am a single mum. His dad and I separated two years ago. Oliver sees his dad every other weekend.",
        "impact_of_separation": "The behaviour at school started getting worse about a year after we split up. He was upset about it but seemed to settle."
      }
    },
    "ice": {
      "ideas": "I think he might just be an active boy who is bored at school.",
      "concerns": "But what if there is actually something going on and I am ignoring it?",
      "expectations": "I want honest advice. I do not want him labelled but I do not want to bury my head in the sand either."
    },
    "specific_prompts": "If the doctor validates that your concerns about labelling are understandable, relax a bit. If the doctor explains what an ADHD assessment actually involves, be interested and reassured that it is not just about giving medication. If they mention parenting strategies, be open but slightly defensive initially."
  }',
  'DEFENSIVE initially but willing to listen. You love Oliver fiercely and feel judged by the school. If the doctor takes time to understand the full picture and does not just agree with the school''s label, you warm up. If they immediately suggest medication, you will resist strongly.',
  'full',
  720,
  'medium',
  ARRAY['Take a comprehensive behavioural history across settings', 'Consider differential diagnoses (ADHD, ASD, anxiety, adjustment disorder)', 'Explore the psychosocial context (parental separation)', 'Address parental concerns about labelling', 'Explain the ADHD referral and assessment pathway', 'Discuss non-pharmacological strategies first', 'Consider the impact of sleep and screen time on behaviour'],
  '## Model Approach

**What this case is testing:** Assessment of a child with behavioural concerns reported by school, taking a comprehensive history, considering differential diagnoses beyond ADHD, addressing parental anxieties, and explaining referral pathways.

**Data Gathering:**
- Detailed behavioural history across settings (school AND home)
- ADHD symptom domains: inattention, hyperactivity, impulsivity
- Duration: symptoms present for >6 months and across >1 setting for ADHD diagnosis
- Note that he CAN concentrate on activities of interest (Lego) - this does not exclude ADHD (hyperfocus)
- Developmental history: speech delay (discharged), milestones
- Family history: father had similar difficulties (ADHD has strong genetic component)
- Psychosocial context: parental separation two years ago, worsening behaviour timeline
- Sleep difficulties and excessive screen time (both exacerbate attention difficulties)
- Consider differentials: ADHD, anxiety, adjustment disorder, ASD features, hearing problems, learning difficulty

**Clinical Management:**
- Validate the mother''s concerns about labelling - these are reasonable
- Explain that assessment is not about labelling but understanding Oliver''s needs so he can be supported
- Referral to community paediatrics or CAMHS for ADHD/neurodevelopmental assessment
- School should complete Conners or SDQ questionnaire as part of assessment
- While awaiting assessment: suggest strategies at school (visual timetable, movement breaks, seating position)
- Address sleep hygiene: consistent bedtime routine, reduce screen time before bed, no screens in bedroom
- Reduce overall screen time (3-4 hours per day is excessive for a 7-year-old)
- Consider whether the parental separation has been adequately processed - school counsellor
- Reassure that medication is not the first-line approach; behavioural strategies and environmental modifications come first
- Suggest parenting support (Triple P or Incredible Years if available locally)

**References:**
- NICE NG87: ADHD diagnosis and management - https://www.nice.org.uk/guidance/ng87
- NICE CKS: ADHD - https://cks.nice.org.uk/topics/attention-deficit-hyperactivity-disorder/
- RCGP: ADHD in children toolkit',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took detailed behavioural history across both school and home settings", "Explored ADHD symptom domains (inattention, hyperactivity, impulsivity)", "Asked about developmental history including speech delay", "Explored psychosocial context (parental separation and its timeline)", "Assessed sleep pattern and screen time habits", "Asked about family history of similar difficulties", "Explored the mother''s ICE (fear of labelling, uncertainty about what is normal)", "Considered differential diagnoses beyond ADHD (anxiety, adjustment, ASD)"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Validated the mother''s concern about labelling sensitively", "Explained that assessment aims to understand Oliver''s needs rather than label him", "Made appropriate referral to community paediatrics or CAMHS for assessment", "Suggested school should complete behavioural questionnaire (Conners/SDQ)", "Addressed sleep hygiene and excessive screen time as modifiable factors", "Discussed non-pharmacological strategies first (behavioural, environmental)", "Considered the impact of parental separation and suggested school counselling", "Provided safety-netting and explained the assessment process and timeline"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was warm and non-judgemental with the mother", "Did not dismiss her views or automatically agree with the school''s opinion", "Acknowledged her distress and parental guilt", "Used accessible language and avoided medical jargon", "Demonstrated child-centred thinking throughout", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 3: Teenager Requesting Contraception
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Teenager Requesting Contraception',
  'Women''s Health',
  'WH-007',
  'Video consultation. A 15-year-old girl has booked an appointment requesting contraception. She is attending on her own and appears nervous.',
  '{"name": "Chloe Williams", "age": 15, "gender": "Female"}',
  '{"patient": "Chloe Williams", "age": 15, "gender": "Female", "pmh": "No significant past medical history, immunisations up to date", "medications": "None", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hi. I would like to go on the pill please. My friend is on it and she said I just need to ask the doctor.",
    "freely_given_history": {
      "presenting_complaint": "I have got a boyfriend and we have been together for about four months. We have not had sex yet but we are thinking about it. My friend told me I should get the pill before we do. I do not want to get pregnant.",
      "psychosocial_impact": "I am nervous about coming here. I do not want my mum to find out because she would go mad. She does not even know I have a boyfriend. My friend came with me to the waiting room but she is not here in the consultation.",
      "ice": {
        "ideas": "I think the pill is the best option because my friend takes it and she says it is easy.",
        "concerns": "I am worried you might tell my mum. I am also worried about side effects. My friend said the pill can make you gain weight.",
        "expectations": "I just want a prescription for the pill today if possible. I want this to be confidential."
      }
    },
    "history_on_direct_questioning": {
      "relationship": {
        "boyfriend": "His name is Josh. He is 16, he is in the year above me at school. We have been together for four months.",
        "pressure": "He has not pressured me at all. It was actually my idea. He said he is happy to wait until I am ready.",
        "consent": "I want to do this. Nobody is making me. We have talked about it and we both want to.",
        "previous_sexual_activity": "I have not had sex before. Neither has Josh."
      },
      "understanding": {
        "contraception_knowledge": "I know the pill stops you getting pregnant. I do not really know how it works though.",
        "sti_awareness": "My friend said you do not need condoms if you are on the pill. Is that right?",
        "consequences": "I know that getting pregnant at my age would be really bad. I want to be sensible about it."
      },
      "health_assessment": {
        "periods": "My periods started when I was twelve. They are regular, every 28 to 30 days. They last about five days. No problems.",
        "weight": "I am a normal weight I think. Not overweight.",
        "smoking": "I do not smoke.",
        "migraines": "I do not get migraines.",
        "family_history": "Nobody in my family has had blood clots as far as I know."
      },
      "safeguarding": {
        "home_life": "I live with my mum and my little brother. Mum works a lot. Things are okay at home.",
        "school": "I am doing well at school. I want to be a nurse.",
        "substance_use": "I have tried alcohol a couple of times at parties but I do not drink regularly. No drugs."
      }
    },
    "ice": {
      "ideas": "I think the pill is the simplest option.",
      "concerns": "I really need this to stay confidential. Please do not tell my mum.",
      "expectations": "I want to leave today with a prescription and know what to do."
    },
    "specific_prompts": "If the doctor asks about your boyfriend''s age and whether you are being pressured, answer honestly and do not be offended. If the doctor explains about condoms for STI protection, be receptive. If the doctor explains Fraser competence and confirms confidentiality, show visible relief."
  }',
  'NERVOUS but mature for your age. You are thoughtful and have clearly thought about this decision. You relax significantly once the doctor confirms confidentiality. You are engaged and ask sensible questions. If the doctor is judgemental, you clam up.',
  'full',
  720,
  'easy',
  ARRAY['Assess Fraser competence (Gillick competence)', 'Confirm the relationship is consensual and age-appropriate', 'Safeguarding assessment (no coercion, exploitation)', 'Explain confidentiality clearly', 'Discuss contraceptive options including condoms for STI protection', 'Provide sexual health education sensitively', 'Encourage parental involvement without insisting'],
  '## Model Approach

**What this case is testing:** Assessment of Fraser competence in an under-16 requesting contraception, safeguarding considerations, confidentiality, and provision of sexual health advice in a non-judgemental manner.

**Data Gathering:**
- Assess Fraser competence: does Chloe understand the advice, the risks of unprotected sex, and is she likely to have sex regardless of whether contraception is provided?
- Safeguarding screen: age of the boyfriend (16, so close in age and not concerning), no coercion or pressure, consensual decision, no exploitation
- Relationship details: duration, nature, both apparently willing
- Sexual history: neither has had sex before
- Medical history for contraception: menstrual history, smoking, migraines, family history of VTE, BMI
- Understanding of contraception and STI prevention
- Home situation and general wellbeing

**Clinical Management:**
- Confirm that Chloe meets Fraser competence criteria and can receive contraception confidentially
- Explain confidentiality clearly: you will not tell her mother. The only exception would be if you believed she was at risk of serious harm
- Encourage her to consider telling a trusted adult, but do not insist
- Discuss contraceptive options: combined pill (her preference), but also explain alternatives (progesterone-only pill, implant, injection, condoms)
- Stress that the pill does NOT protect against STIs - condoms should be used as well, especially in new relationships
- Correct the misconception from her friend about not needing condoms on the pill
- If prescribing the combined pill: check no contraindications (UKMEC criteria), explain how to take it, what to do if she misses a pill, common side effects
- Offer chlamydia screening and discuss STI testing
- Provide information about local sexual health services (C-Card scheme for free condoms)
- Arrange follow-up in three months to check blood pressure and how she is getting on

**References:**
- NICE CKS: Contraception - https://cks.nice.org.uk/topics/contraception/
- Fraser Guidelines (Gillick competence) - https://www.nspcc.org.uk/keeping-children-safe/sex-relationships/
- FSRH: Contraception for young people - https://www.fsrh.org/
- UKMEC: UK Medical Eligibility Criteria for Contraceptive Use',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed Fraser competence systematically (understanding, maturity, likely to have sex regardless)", "Conducted appropriate safeguarding screen (boyfriend''s age, consent, no coercion)", "Took relevant medical history for contraception (periods, smoking, migraines, VTE history)", "Explored Chloe''s understanding of contraception and STI prevention", "Asked about the relationship in a non-judgemental way", "Explored home situation and general wellbeing", "Explored ICE (confidentiality concern, weight gain worry, desire for the pill)", "Consultation was sensitively paced and age-appropriate"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Confirmed Fraser competence and right to confidential care", "Explained confidentiality clearly including its limits", "Discussed contraceptive options beyond just the pill", "Stressed that the pill does not protect against STIs and condoms are needed", "Corrected the misconception about not needing condoms", "Checked for contraindications using UKMEC criteria", "Offered STI screening and information about sexual health services", "Arranged appropriate follow-up", "Encouraged parental involvement without insisting"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was warm, non-judgemental, and put Chloe at ease", "Used age-appropriate language throughout", "Respected Chloe''s autonomy and maturity", "Created a safe space for honest discussion", "Praised Chloe for being responsible in seeking contraception", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 4: Duty of Candour Discussion
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Duty of Candour Discussion',
  'Ethics & Communication',
  'ETH-003',
  'Telephone consultation. A GP colleague from the same practice is calling you for advice. She has realised she made a prescribing error three days ago and is unsure how to handle it.',
  '{"name": "Dr. Hannah Leighton", "age": 38, "gender": "Female"}',
  '{"patient": "Dr. Hannah Leighton", "age": 38, "gender": "Female", "pmh": "Not applicable - this is a colleague calling for advice", "medications": "Not applicable", "allergies": "Not applicable"}',
  '{
    "opening_statement": "Hi, thanks for taking my call. I need to talk to you about something and I am really worried. I think I have made a mistake with a prescription and I do not know what to do.",
    "freely_given_history": {
      "presenting_complaint": "Three days ago I saw a patient, Mrs. Patel, who is 72 and has chronic kidney disease stage 4. She came in with a gout flare-up and I prescribed her naproxen 500mg twice daily for a week. I completely forgot about her kidney function. The pharmacist flagged it when she went to collect the prescription yesterday and called the surgery. I have checked her bloods from last month and her eGFR was 22. NSAIDs are absolutely contraindicated.",
      "psychosocial_impact": "I have been awake all night worrying about this. I feel sick. I keep going over it in my head. I should have checked her renal function. I was running 45 minutes late and I just did not think. I am terrified I have harmed her and that I could lose my registration.",
      "ice": {
        "ideas": "I know I need to tell the patient but I do not know how. I have never had to do this before. Part of me wants to just make sure she stops the tablets and hope no harm was done.",
        "concerns": "I am scared she will make a complaint. I am scared of what the GMC will say. I am also worried about whether she has taken the tablets and if her kidneys have been damaged.",
        "expectations": "I need advice on exactly what to do. Step by step. Should I tell the patient? Do I have to report myself? Do I tell the partners?"
      }
    },
    "history_on_direct_questioning": {
      "the_error": {
        "what_was_prescribed": "Naproxen 500mg twice daily for seven days for an acute gout flare.",
        "patient_details": "Mrs. Patel, 72, CKD stage 4, eGFR 22. She is also on ramipril and furosemide.",
        "when_discovered": "The pharmacist called yesterday. I checked and realised my mistake immediately.",
        "patient_contact": "I have not spoken to Mrs. Patel yet. The pharmacist did not dispense the naproxen. So she has not taken any. But I am not 100 percent sure she did not get it elsewhere."
      },
      "context": {
        "workload": "I was running very late that day. We were two doctors down with sickness. I had 38 patients to see.",
        "clinical_system": "The computer did show a warning about renal function and NSAIDs. I must have clicked past it. I do that sometimes when I am busy.",
        "previous_incidents": "Nothing like this before. I have always been careful."
      },
      "emotional_state": {
        "feelings": "I feel like a terrible doctor. I keep thinking what if the pharmacist had not caught it. She could have ended up on dialysis.",
        "support": "I have not told anyone except you. My husband knows something is wrong but I have not told him the details.",
        "coping": "I did not sleep last night. I called in sick this morning because I cannot face seeing patients."
      }
    },
    "ice": {
      "ideas": "I know I need to be honest but I am terrified of the consequences.",
      "concerns": "I am worried about my career, the patient, and whether this means I am not a safe doctor.",
      "expectations": "I want you to tell me what to do. I trust your judgement."
    },
    "specific_prompts": "If the doctor explains duty of candour clearly, listen carefully and accept it. If they reassure you that this does not make you a bad doctor, show some relief. If they suggest a significant event analysis, be receptive. If they dismiss the seriousness, push back."
  }',
  'DISTRESSED and vulnerable. You are normally a confident and competent colleague. You are shaken and scared. If your colleague is supportive and gives clear guidance, you gradually become calmer. If they are judgemental or dismissive, you become more upset.',
  'full',
  720,
  'hard',
  ARRAY['Explain professional duty of candour (GMC guidance)', 'Advise on immediate patient safety actions', 'Discuss the significant event analysis process', 'Support a distressed colleague', 'Explain the difference between a mistake and negligence', 'Advise on informing the practice (MDU/MPS notification)', 'Address the emotional impact on the colleague', 'Discuss system factors that contributed to the error'],
  '## Model Approach

**What this case is testing:** Knowledge of duty of candour, supporting a distressed colleague, advising on the correct process after a prescribing error, and addressing system factors.

**Data Gathering:**
- Understand exactly what happened: what was prescribed, to whom, clinical context
- Establish whether patient has come to harm (in this case, pharmacist intercepted the prescription)
- Understand the context: workload pressure, system warnings overridden
- Assess colleague''s emotional state and wellbeing
- Explore what she has done so far (nothing, has not contacted patient)
- Assess risk: is she safe to practise today? Has she called in sick?

**Clinical Management:**
- Immediate patient safety: confirm the naproxen was not dispensed or obtained elsewhere. Contact Mrs. Patel to check she has not taken any NSAIDs. If she has, arrange urgent renal function bloods
- Duty of candour: explain this is a professional and legal obligation (Health and Social Care Act 2008, Regulation 20). She must tell the patient what happened, apologise, and explain what steps are being taken
- Being open with the patient: this is not an admission of negligence. An apology is not an admission of liability (Compensation Act 2006, Section 2)
- Significant Event Analysis: this should be reported within the practice as a significant event. The purpose is learning, not blame
- Contact MDU/MPS (medical defence organisation) for advice and support before speaking to the patient
- Inform the practice partners or clinical lead
- System factors: the workload (38 patients, two doctors down) is a system issue. Clicking past computer warnings is a known risk. The practice should review its processes
- Emotional support: reassure her that making a mistake does not make her a bad doctor. All doctors make errors. What matters is how she responds. Suggest she speaks to the GP Health Service or her own GP if struggling
- She should not feel she needs to self-refer to the GMC for this (the pharmacist safety net worked). However, the practice should keep a record

**References:**
- GMC: Duty of candour - https://www.gmc-uk.org/professional-standards/professional-standards-for-doctors/duty-of-candour
- GMC: Good Medical Practice - https://www.gmc-uk.org/professional-standards/professional-standards-for-doctors/good-medical-practice
- NHS England: Significant Event Audit guidance
- GP Health Service: https://gphealth.nhs.uk/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established the full details of the prescribing error", "Confirmed whether the patient has actually taken the medication", "Explored the clinical context (CKD stage 4, eGFR 22, concomitant medications)", "Assessed the system factors that contributed (workload, warnings overridden)", "Evaluated the colleague''s emotional state and fitness to practise", "Explored what steps she has already taken", "Asked about the pharmacist''s actions and whether the prescription was dispensed", "Gathered information sensitively and without judgement"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Advised on immediate patient safety (confirm naproxen not taken, check renal function if taken)", "Explained duty of candour as a professional and legal obligation", "Advised on how to have the conversation with the patient (open, honest, apologetic)", "Recommended contacting MDU or MPS before speaking to the patient", "Advised on significant event analysis within the practice", "Addressed system factors (workload, computer warning fatigue)", "Provided emotional support and reassurance that errors do not equal incompetence", "Signposted to GP Health Service or own GP for wellbeing support", "Advised on informing practice partners or clinical lead"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was supportive and non-judgemental with the colleague", "Demonstrated empathy for her distress and fear", "Balanced support with clear professional guidance", "Normalised error without minimising the seriousness", "Helped the colleague feel less isolated", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 5: Eating Disorder in Young Woman
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Eating Disorder in Young Woman',
  'Mental Health',
  'MH-006',
  'Video consultation. A 19-year-old university student has been brought to the appointment by her flatmate. On camera she appears thin and is wearing oversized clothing. She has reluctantly agreed to attend.',
  '{"name": "Miss Ellie Carrington", "age": 19, "gender": "Female"}',
  '{"patient": "Miss Ellie Carrington", "age": 19, "gender": "Female", "pmh": "No significant past medical history", "medications": "None", "allergies": "No known allergies"}',
  '{
    "opening_statement": "My flatmate made me come. She is being dramatic. I am fine, honestly. I just wanted to lose a bit of weight.",
    "freely_given_history": {
      "presenting_complaint": "If the doctor creates a safe and non-confrontational space, you gradually open up. You started dieting about a year ago after a comment from a relative about you putting on weight at Christmas. It started with cutting out snacks, then meals, and now you eat very little. You count every calorie. You also exercise excessively, running every day even when you feel unwell.",
      "psychosocial_impact": "You are in your second year at university studying English Literature. Your grades have dropped because you cannot concentrate. You have pulled away from your friends. Your flatmate found you passed out in the kitchen two weeks ago and that is what triggered her to make you come.",
      "ice": {
        "ideas": "You do not think you have an eating disorder. You think you are in control of your eating. You can see that you have lost weight but you still feel fat when you look in the mirror.",
        "concerns": "If pressed, you admit you are worried about your hair falling out and the fact that your periods have stopped. You are also cold all the time.",
        "expectations": "You are here to get your flatmate off your back. You do not want to be referred anywhere. You do not want to gain weight."
      }
    },
    "history_on_direct_questioning": {
      "eating_pattern": {
        "typical_day": "Black coffee for breakfast. Maybe a small salad for lunch, about 100 calories. For dinner, some vegetables or nothing. Total intake is probably about 400 to 500 calories a day.",
        "restriction": "You avoid all carbohydrates, fats, dairy, and sugar. You read every food label obsessively.",
        "binging": "No binging episodes.",
        "purging": "You have made yourself sick a few times after eating more than planned. Maybe five or six times in total.",
        "laxatives": "You have used laxatives twice when you felt bloated."
      },
      "exercise": {
        "pattern": "You run at least 10 kilometres every day, sometimes more. You also do body weight exercises in your room.",
        "compulsion": "If you miss a run, you feel extremely anxious and eat even less to compensate."
      },
      "physical_symptoms": {
        "weight": "You are not sure of your exact weight. You weigh yourself multiple times a day. You think you are about 44 kilograms. You are 168 centimetres tall.",
        "periods": "Your periods stopped about five months ago. They were regular before.",
        "hair": "Your hair has been falling out. You find clumps in the shower.",
        "other": "You are dizzy when you stand up. You bruise easily. Your hands and feet are always cold. You get palpitations sometimes."
      },
      "mental_health": {
        "mood": "Low. You feel anxious most of the time. You are terrified of gaining weight.",
        "self_harm": "No self-harm or suicidal thoughts.",
        "body_image": "You know other people think you are too thin but when you look in the mirror you still see fat."
      }
    },
    "secondary_history": {
      "family": "Your mum is very image-conscious and has always been on diets. Your older sister had bulimia at university but recovered.",
      "triggers": "It all started after your uncle said you were getting chubby at Christmas dinner."
    },
    "ice": {
      "ideas": "You do not think you have an eating disorder. You think you are being healthy.",
      "concerns": "Deep down you know the fainting and hair loss is not normal.",
      "expectations": "You do not want help with eating. You might accept help for the physical symptoms."
    },
    "specific_prompts": "If the doctor is confrontational or tells you that you must eat more, shut down and become defensive. If the doctor is gentle and validates your feelings while expressing concern, gradually show more openness. If they mention that your BMI suggests you might be medically unwell, be scared but more willing to engage."
  }',
  'RESISTANT and minimising initially. You do not believe you have a problem. You are articulate and intelligent. If the doctor is warm and non-judgemental, you slowly drop your guard. If they are forceful, you close down completely. You become visibly worried when physical health risks are mentioned.',
  'full',
  720,
  'hard',
  ARRAY['Recognise features of anorexia nervosa', 'Assess physical risk (BMI, amenorrhoea, syncope, bradycardia)', 'Build rapport with a resistant patient', 'Assess for purging behaviours', 'Consider medical investigations (bloods, ECG)', 'Refer to eating disorders service urgently', 'Discuss risks without being confrontational', 'Consider MARSIPAN risk assessment framework'],
  '## Model Approach

**What this case is testing:** Recognition of anorexia nervosa in a young woman who is resistant to help, building rapport, assessing physical risk, and appropriate referral to specialist eating disorders services.

**Data Gathering:**
- Build rapport before gathering sensitive information - do not be confrontational
- Dietary history: daily intake (approximately 400-500 calories), restriction pattern, food rules
- Exercise: compulsive daily running (10km+), anxiety if missed
- Weight and height: approximately 44kg at 168cm = BMI approximately 15.6 (severely underweight)
- Physical symptoms: amenorrhoea (5 months), hair loss (lanugo or telogen effluvium), dizziness, palpitations, cold extremities, bruising, syncope
- Purging behaviours: occasional self-induced vomiting and laxative use
- Mental health: body dysmorphia (sees fat when objectively underweight), anxiety, low mood, no suicidal ideation
- Family history: sister had bulimia, mother diet-focused
- Trigger: relative''s comment about weight

**Clinical Management:**
- BMI 15.6 is in the severe range for anorexia nervosa and carries significant physical risk
- Urgent blood tests: FBC, U&Es (potassium, sodium, phosphate), LFTs, TFTs, glucose, calcium, magnesium, albumin
- Arrange ECG: risk of QTc prolongation and arrhythmia at this BMI
- Physical observations: lying and standing BP and pulse (assess for bradycardia and postural hypotension)
- Urgent referral to specialist eating disorders service (NICE NG69 recommends early specialist involvement)
- Consider MARSIPAN (Management of Really Sick Patients with Anorexia Nervosa) risk assessment if BMI <15 or rapidly declining
- Do NOT simply tell her to eat more - this is counterproductive
- Acknowledge her autonomy while being clear about the medical risks (hair loss, amenorrhoea, cardiac risk, bone density)
- If she refuses referral: explain the risks clearly, offer follow-up, leave the door open
- Contact the university wellbeing service with her consent
- Involve the flatmate if Ellie agrees (support network)

**References:**
- NICE NG69: Eating disorders recognition and treatment - https://www.nice.org.uk/guidance/ng69
- MARSIPAN: Management of Really Sick Patients with Anorexia Nervosa - https://www.rcpsych.ac.uk/improving-care/campaigning-for-better-mental-health-policy/college-reports/2022-college-reports/cr233
- NICE CKS: Eating disorders - https://cks.nice.org.uk/topics/eating-disorders/
- Beat Eating Disorders: https://www.beateatingdisorders.org.uk/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Elicited dietary history sensitively (daily intake, restriction, food rules)", "Asked about exercise pattern and compulsive nature", "Assessed weight and height to estimate BMI (approximately 15.6)", "Identified physical red flags (amenorrhoea, syncope, hair loss, palpitations, cold extremities)", "Screened for purging behaviours (vomiting, laxative use)", "Assessed body image distortion (sees fat when underweight)", "Explored family history and the triggering event", "Built rapport before gathering sensitive information"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised BMI 15.6 as severely underweight with significant physical risk", "Arranged urgent blood tests (U&Es, FBC, LFTs, TFTs, bone profile, glucose)", "Planned ECG to assess cardiac risk", "Made urgent referral to specialist eating disorders service", "Discussed medical risks clearly without being confrontational", "Did not simply instruct the patient to eat more", "Offered ongoing support and left the door open for future engagement", "Provided signposting to Beat eating disorders helpline", "Considered MARSIPAN framework for risk assessment"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was warm, non-judgemental, and patient throughout", "Built rapport effectively with a resistant patient", "Validated the patient''s feelings without colluding with the eating disorder", "Used motivational interviewing techniques where appropriate", "Showed genuine concern without being paternalistic", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 6: Medically Unexplained Symptoms
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Medically Unexplained Symptoms',
  'Mental Health',
  'MH-007',
  'Video consultation. A 41-year-old woman is attending with multiple physical symptoms. She has had extensive investigations over the past two years, all of which have been normal. She is attending for the fourth time in six weeks.',
  '{"name": "Mrs. Rachel Donovan", "age": 41, "gender": "Female"}',
  '{"patient": "Mrs. Rachel Donovan", "age": 41, "gender": "Female", "pmh": "Irritable bowel syndrome, tension headaches, chronic fatigue (investigated - normal), previous laparoscopy for pelvic pain (normal)", "medications": "Paracetamol PRN, Mebeverine 135mg TDS, Co-codamol 8/500 PRN", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Doctor, I am sorry to be back again but I really am not well. I have got these new pains in my chest and I am worried it is my heart. Nobody seems to be able to work out what is wrong with me.",
    "freely_given_history": {
      "presenting_complaint": "I have been getting pains in my chest for the past three weeks. It is a tight feeling across the front of my chest. It comes and goes. Sometimes it lasts a few minutes, sometimes half an hour. I have also been getting tingling in my hands and a feeling like there is a lump in my throat. On top of all my other problems it is just getting too much.",
      "psychosocial_impact": "I have been off work for three months now. I work as a teaching assistant but I cannot manage the job with all these symptoms. My husband is getting frustrated. He says the doctors have told me there is nothing wrong but I know there is something. We have been arguing about it a lot.",
      "ice": {
        "ideas": "I think there must be something they are missing. I have read online about fibromyalgia and chronic Lyme disease and I wonder if it could be one of those. I also saw a programme about a woman who had cancer and was told for years it was in her head.",
        "concerns": "I am terrified that I have something serious that is being ignored. Every time a doctor tells me my tests are normal I feel relieved for about a day and then I start worrying about the next symptom.",
        "expectations": "I want more tests. I want a referral to a specialist. I want someone to find out what is wrong with me."
      }
    },
    "history_on_direct_questioning": {
      "symptom_history": {
        "chest_pain": "Tight, across the front, not related to exertion. No radiation to arm or jaw. Not worse with breathing. Sometimes worse when stressed.",
        "other_current_symptoms": "Tingling in both hands. Lump-in-throat feeling (globus). Abdominal bloating and pain. Headaches most days. Fatigue so bad I can barely get out of bed some days. Aching all over.",
        "previous_investigations": "Two sets of blood tests (all normal), CT head for headaches (normal), upper GI endoscopy for abdominal pain (normal), laparoscopy for pelvic pain (normal), echocardiogram six months ago for palpitations (normal), thyroid function tests (normal)."
      },
      "psychological_assessment": {
        "mood": "If asked carefully: you admit you have been feeling low and anxious. You do not sleep well because you lie awake worrying about what is wrong with you.",
        "anxiety": "You get anxious about health every day. You check your body constantly for new symptoms. You google symptoms regularly, sometimes for hours.",
        "stress": "You admit life has been stressful. Your mother died 18 months ago. Your marriage is under strain. You are not working.",
        "previous_mh": "You have never been diagnosed with anything mental health-related. You would be offended if someone said it was all in your head."
      },
      "functional_impact": {
        "work": "Off sick for three months. Occupational health have been in touch.",
        "social": "You have stopped seeing friends. You cancel plans because you do not feel well enough.",
        "daily_life": "Some days you stay in bed. Your husband does most of the housework now."
      }
    },
    "ice": {
      "ideas": "I think there is a physical cause that has been missed.",
      "concerns": "I am frightened of being labelled as a hypochondriac.",
      "expectations": "I want to be believed. I want more tests if needed. I want a diagnosis."
    },
    "specific_prompts": "If the doctor suggests the symptoms might be linked to stress or anxiety, initially reject this and say you know the difference between being stressed and being ill. If the doctor validates that the symptoms are real and explains how the brain and body interact, gradually become more receptive. If they simply refuse more tests, become upset."
  }',
  'FRUSTRATED and weary. You have been going round in circles with doctors. You feel dismissed and misunderstood. If the doctor validates that your symptoms are real but introduces the idea of a mind-body link gently, you become cautiously open. If they dismiss you or suggest it is all psychological, you become angry and tearful.',
  'full',
  720,
  'medium',
  ARRAY['Validate that the symptoms are real, not imagined', 'Avoid unnecessary further investigation', 'Introduce the concept of persistent physical symptoms sensitively', 'Explore psychosocial factors (bereavement, marital strain, health anxiety)', 'Avoid the term medically unexplained symptoms with the patient', 'Consider IAPT referral for health anxiety', 'Negotiate a shared management plan', 'Reduce co-codamol use and address medication dependence risk'],
  '## Model Approach

**What this case is testing:** Management of persistent physical symptoms (formerly MUS), validating the patient''s experience while avoiding unnecessary investigations, introducing a biopsychosocial model, and negotiating a collaborative management plan.

**Data Gathering:**
- Listen to the new symptom (chest pain) and assess appropriately but proportionately
- Chest pain assessment: character, radiation, exertion, breathing - features suggest non-cardiac chest pain
- Review the extensive investigation history (all normal)
- Screen for anxiety and depression sensitively (not as an accusation)
- Explore health anxiety behaviours (body checking, googling, reassurance seeking)
- Psychosocial context: bereavement (mother died 18 months ago), marital strain, off work
- Functional impact: significant - off work, socially withdrawn, reduced daily functioning
- Review current medications: co-codamol PRN is a concern (opioid dependence risk)

**Clinical Management:**
- Validate symptoms: they are real, not imagined. The pain she feels is genuine
- Avoid the label "medically unexplained" with the patient - use "persistent physical symptoms" which is less dismissive
- Explain the biopsychosocial model: when the brain is under stress (bereavement, worry, poor sleep), it can amplify pain signals. This is neuroscience, not weakness
- Negotiate: it is reasonable to do a brief chest assessment (ECG if not done recently, basic obs) but avoid repeating extensive investigations already done
- Do NOT order more scans or blood tests unless clinically indicated - this perpetuates the cycle of reassurance-seeking
- Referral to IAPT (Improving Access to Psychological Therapies) for health anxiety or persistent physical symptoms pathway
- Consider a single named GP to coordinate care and reduce conflicting messages
- Address co-codamol use: risk of medication overuse headache and opioid dependence
- Suggest gradual activity increase (graded exercise, return to valued activities)
- Bereavement: consider counselling referral (Cruse or local bereavement service)
- Negotiate a follow-up schedule: regular planned appointments (e.g. fortnightly) rather than crisis-driven attendance

**References:**
- NICE CG113: Generalised anxiety disorder and panic disorder - https://www.nice.org.uk/guidance/cg113
- RCGP: Persistent physical symptoms guidance
- NICE CKS: Medically unexplained symptoms - https://cks.nice.org.uk/topics/medically-unexplained-symptoms/
- Improving Access to Psychological Therapies (IAPT) programme',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Listened to the new chest pain symptoms and assessed proportionately", "Reviewed the extensive normal investigation history", "Screened for anxiety and depression sensitively", "Identified health anxiety behaviours (body checking, googling, reassurance seeking)", "Explored psychosocial stressors (bereavement, marriage, work)", "Assessed functional impact (work, social, daily activities)", "Explored ICE (fear of missed diagnosis, fear of being labelled a hypochondriac)", "Reviewed current medications including co-codamol use"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Validated that the symptoms are real and not imagined", "Used the term persistent physical symptoms rather than medically unexplained", "Introduced the biopsychosocial model gently and clearly", "Avoided ordering unnecessary further investigations while keeping proportionate assessment", "Referred to IAPT or psychological therapies for health anxiety", "Addressed co-codamol use and risk of medication overuse headache", "Suggested a single named GP to coordinate care", "Proposed regular planned follow-up rather than crisis-driven attendance", "Offered bereavement counselling referral"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was empathetic and did not dismiss the patient''s symptoms", "Validated the patient''s frustration and fear of being disbelieved", "Introduced psychological factors without being accusatory", "Negotiated rather than dictated the management plan", "Demonstrated genuine interest in the patient''s whole situation", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 7: Gambling Addiction
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Gambling Addiction',
  'Mental Health',
  'MH-008',
  'Video consultation. A 36-year-old man has booked an appointment to discuss stress. During the consultation, it becomes apparent that gambling is the underlying cause of his difficulties.',
  '{"name": "Mr. Dean Hargreaves", "age": 36, "gender": "Male"}',
  '{"patient": "Mr. Dean Hargreaves", "age": 36, "gender": "Male", "pmh": "No significant past medical history", "medications": "None", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hi doctor, I have booked in because I am not coping very well. I have been really stressed and I am not sleeping. I just feel like everything is falling apart.",
    "freely_given_history": {
      "presenting_complaint": "If the doctor explores the stress with open questions, you reveal that the stress is financial. You are in serious debt. If they explore the debt further, you admit that the debt is from gambling. You have been betting online for about three years. It started as a bit of fun during lockdown but it has got completely out of control.",
      "psychosocial_impact": "You owe about thirty-five thousand pounds on credit cards and loans. Your wife does not know the full extent of it. She found a credit card statement last month and you told her it was only five thousand. She was furious even at that. You are terrified she will leave you and take the kids. You have two children aged five and three.",
      "ice": {
        "ideas": "You know gambling is a problem but you keep telling yourself you can win it back. Every time you try to stop, you last a few days and then go back to it.",
        "concerns": "You are worried about losing your family. You are also worried about bailiffs coming to the house. You had a letter from a debt collection agency last week.",
        "expectations": "You do not really know what you want from the doctor. You just needed to tell someone. You feel completely alone with this."
      }
    },
    "history_on_direct_questioning": {
      "gambling_history": {
        "onset": "Started during COVID lockdown. Bored at home, started with football betting apps. Small amounts at first.",
        "current_pattern": "You bet every day now. Mostly online slots and in-play football betting. You sometimes stay up all night gambling on your phone in bed after your wife falls asleep.",
        "amount": "You are betting hundreds of pounds a week. Sometimes you win and that keeps you going. But overall you have lost about thirty-five thousand over three years.",
        "attempts_to_stop": "You have deleted the apps three times. Each time you reinstalled them within a week. You have tried self-exclusion on one site but just signed up to another.",
        "chasing_losses": "You always chase your losses. If you lose, you bet more to try to win it back. It never works."
      },
      "impact": {
        "financial": "Thirty-five thousand in debt. Multiple credit cards maxed out. A personal loan. You have been using your children''s savings to bet.",
        "relationship": "Your wife suspects something is wrong but does not know the full picture. You have been irritable and distant. You argue frequently.",
        "work": "You work as an electrician. Your concentration is poor. You nearly had an accident on site last week because you were checking your phone.",
        "children": "You feel terrible guilt about the children''s savings. Your five-year-old has started asking why you look sad all the time."
      },
      "mental_health": {
        "mood": "Low and anxious. You feel ashamed constantly.",
        "sleep": "You cannot sleep. You lie awake worrying about money or you gamble on your phone.",
        "suicidal_ideation": "If asked directly and sensitively: you have had thoughts that your family would be better off without you. You have thought about driving into a bridge on the motorway. You have not made any plans but the thoughts come most days.",
        "alcohol": "You have been drinking more. About 30 units a week. You drink to numb the feelings."
      }
    },
    "ice": {
      "ideas": "You know this is an addiction but admitting that feels like failure.",
      "concerns": "You are scared of losing your wife and children. You are terrified of the debt.",
      "expectations": "You want someone to help you but you do not know what help looks like."
    },
    "specific_prompts": "If the doctor asks directly about suicidal thoughts, you will be honest but become emotional. If the doctor is non-judgemental about the gambling, you feel safer and disclose more. If they suggest GamCare or the National Gambling Helpline, be receptive. If they ask about the children''s safety, do not be offended - acknowledge it is a fair question."
  }',
  'ASHAMED and guarded initially. You present with stress because you cannot bring yourself to say gambling straight away. As the doctor is non-judgemental, you gradually reveal more. You become emotional when talking about your children. You are relieved when someone finally knows the truth.',
  'full',
  720,
  'medium',
  ARRAY['Explore the underlying cause of the stress presentation', 'Recognise gambling disorder as a behavioural addiction', 'Assess suicide risk (active ideation with potential means)', 'Explore the financial, relational, and occupational impact', 'Refer to gambling support services (GamCare, National Gambling Helpline)', 'Assess alcohol use', 'Consider the children''s welfare', 'Address the shame and stigma sensitively'],
  '## Model Approach

**What this case is testing:** Recognition of gambling disorder presenting as stress, thorough risk assessment including suicidal ideation, non-judgemental exploration of a stigmatised condition, and appropriate signposting to specialist gambling support.

**Data Gathering:**
- Explore the presenting complaint (stress) with open questions to uncover the underlying cause
- Detailed gambling history: onset, pattern, frequency, amounts, chasing losses, attempts to stop
- Financial impact: extent of debt, sources of money (including children''s savings)
- Relationship impact: wife''s awareness, marital strain
- Occupational impact: near-accident at work, concentration
- Mental health assessment: low mood, anxiety, shame
- Suicide risk assessment: has active ideation (driving into bridge), frequent thoughts, access to means (drives daily)
- Alcohol use: 30 units per week (hazardous drinking)
- Impact on children: emotional impact on 5-year-old, children''s savings used

**Clinical Management:**
- Suicide risk: this patient has active suicidal ideation with identified means - this needs urgent action
- Safety plan: ask him to commit to calling Samaritans (116 123) or 999 if thoughts become overwhelming. Remove or limit access to means where possible
- Consider urgent referral to crisis team if risk is imminent
- Gambling support: refer to GamCare (0808 8020 133), National Gambling Helpline, GamStop (self-exclusion across all UK licensed gambling sites)
- Consider referral to NHS Northern Gambling Service or local community gambling service
- StepChange for debt advice (0800 138 1111) - free debt counselling
- Address alcohol: 30 units per week is hazardous. AUDIT-C screening. Consider brief intervention
- Consider antidepressant if depression is significant (SSRI)
- Encourage disclosure to wife with support (couples counselling via Relate)
- Children''s welfare: the children are not at direct risk but emotional impact and financial neglect (savings) should be noted. No safeguarding referral needed currently but monitor
- Follow-up: arrange early review within one week given suicide risk

**References:**
- NICE CKS: Gambling disorder - available via primary care guidance
- GamCare: https://www.gamcare.org.uk/
- GamStop (self-exclusion): https://www.gamstop.co.uk/
- NHS Northern Gambling Service: https://www.leedsandyorkpft.nhs.uk/our-services/gambling/
- StepChange debt advice: https://www.stepchange.org/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Used open questions to explore the underlying cause of stress", "Took a detailed gambling history (onset, pattern, amounts, chasing losses)", "Assessed the financial impact including use of children''s savings", "Explored the impact on relationships, work, and family", "Conducted a thorough suicide risk assessment (ideation, means, frequency)", "Assessed alcohol consumption (30 units per week)", "Explored ICE (shame, fear of losing family, not knowing what help exists)", "Assessed children''s welfare sensitively"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Identified active suicidal ideation and developed a safety plan", "Provided crisis contacts (Samaritans 116 123, 999)", "Referred to GamCare or National Gambling Helpline", "Recommended GamStop for self-exclusion across UK gambling sites", "Signposted to StepChange for free debt counselling", "Addressed hazardous alcohol use and planned brief intervention", "Arranged early follow-up within one week given suicide risk", "Encouraged supported disclosure to wife", "Considered antidepressant if depression significant"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was non-judgemental and created a safe space for disclosure", "Addressed shame and stigma sensitively", "Validated the courage it took to disclose the gambling", "Used empathetic language throughout", "Responded appropriately when the patient became emotional", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 8: Enuresis in a Child
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Enuresis in a Child',
  'Paediatrics',
  'PAED-009',
  'Telephone consultation. A father is calling about his seven-year-old son who is still wetting the bed at night. The family are going on a school camping trip in two months and the father is worried about his son being embarrassed.',
  '{"name": "Ethan Brooks", "age": 7, "gender": "Male"}',
  '{"patient": "Ethan Brooks", "age": 7, "gender": "Male", "pmh": "No significant past medical history, immunisations up to date, no previous continence concerns in daytime", "medications": "None", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hello doctor, I am calling about my son Ethan. He is seven and he is still wetting the bed nearly every night. His school is doing a camping trip in May and I am really worried about him being teased. Can you give him something to stop it?",
    "freely_given_history": {
      "presenting_complaint": "Ethan has never been consistently dry at night. He was dry during the day by age three but the nights have always been a problem. He wets the bed about five or six nights out of seven. We have tried restricting drinks in the evening and lifting him when we go to bed but nothing has worked.",
      "psychosocial_impact": "Ethan is starting to get upset about it. He does not go to sleepovers because he is embarrassed. His younger sister who is five is dry at night and she has made comments about it which upsets him. He is a happy boy normally but this is really getting to him. The camping trip is the deadline because he is so excited about it but also terrified.",
      "ice": {
        "ideas": "I have heard there is a tablet you can give them that stops the wetting. A friend''s son had it for a school trip and it worked. I think it was called desmopressin.",
        "concerns": "I am worried he will be bullied at the camping trip. I am also worried there might be something physically wrong with him.",
        "expectations": "I would like to try the medication for the camping trip at least. But I am also open to other suggestions if there are any."
      }
    },
    "history_on_direct_questioning": {
      "enuresis_details": {
        "type": "He has never been dry at night for more than two weeks at a time. This is not something that started after being dry.",
        "frequency": "Five to six nights a week. Sometimes every night for weeks.",
        "daytime": "No daytime wetting at all. He goes to the toilet normally during the day.",
        "volume": "Large volumes. The bed is soaked through every morning. He is a heavy sleeper and does not wake up even when wet.",
        "bowels": "He opens his bowels every day. No constipation. No soiling."
      },
      "fluid_intake": {
        "daytime": "He drinks mostly water and squash during the day. Probably about four or five cups.",
        "evening": "We stop drinks at six o''clock. His bedtime is half seven.",
        "caffeine": "He has cola at weekends sometimes but not during the week.",
        "milk": "He has a cup of milk with his dinner."
      },
      "family_history": {
        "parents": "I wet the bed until I was about ten. My wife was dry by five.",
        "siblings": "His younger sister was dry at night by four."
      },
      "general_health": {
        "growth": "He is growing normally. He is average height and weight for his age.",
        "diabetes_screen": "He is not drinking excessively during the day. No weight loss. No increased thirst.",
        "uti_symptoms": "No burning when he wees. No frequency during the day. No smelly or cloudy urine.",
        "emotional": "He is generally happy at school. No behavioural problems. He has friends."
      },
      "what_they_have_tried": {
        "lifting": "We lift him to the toilet when we go to bed at about 10pm. He barely wakes up and wees on auto-pilot.",
        "fluid_restriction": "We stop drinks after 6pm.",
        "reward_charts": "We tried a star chart but it did not make any difference.",
        "alarms": "We have not tried a bedwetting alarm. I did not know about them until I read about them online."
      }
    },
    "ice": {
      "ideas": "I think he might need medication to help him.",
      "concerns": "I am worried about the camping trip and his self-esteem.",
      "expectations": "I want a plan that will help him before May if possible."
    },
    "specific_prompts": "If the doctor recommends an enuresis alarm as the first-line treatment, be open to it but ask whether medication can be used alongside or as a backup for the camping trip specifically. If the doctor explains that lifting is not recommended, be surprised but accepting."
  }',
  'PRACTICAL and caring. You are a hands-on dad who wants to help his son. You are not overly anxious but you are motivated by the camping trip deadline. If the doctor gives clear, structured advice, you are very engaged and will follow through.',
  'full',
  720,
  'easy',
  ARRAY['Differentiate primary from secondary enuresis', 'Assess for underlying causes (constipation, diabetes, UTI)', 'Explain that primary nocturnal enuresis is common and developmental', 'Recommend enuresis alarm as first-line treatment (NICE)', 'Discuss desmopressin for short-term use (e.g. camping trip)', 'Advise that lifting is not recommended (does not promote learning)', 'Address the child''s self-esteem', 'Explain the role of family history'],
  '## Model Approach

**What this case is testing:** Assessment and management of primary nocturnal enuresis in a child, appropriate use of enuresis alarms and desmopressin, addressing parental concerns about self-esteem, and managing the practical deadline of a school trip.

**Data Gathering:**
- Establish primary vs secondary enuresis (Ethan has never been consistently dry = primary)
- Frequency and severity (5-6 nights per week, large volumes, heavy sleeper)
- Daytime continence (dry during the day - important distinction)
- Bowel habit: constipation is the commonest associated factor - rule out (not constipated here)
- Fluid intake pattern: note fluid restriction after 6pm (actually not ideal)
- Screen for diabetes: no polyuria, polydipsia, or weight loss
- Screen for UTI: no daytime frequency, dysuria, or systemic symptoms
- Family history: father wet the bed until age 10 (strong genetic component)
- What has been tried: lifting (not helpful), fluid restriction, reward charts (not effective for enuresis)
- Emotional impact on the child

**Clinical Management:**
- Reassure: primary nocturnal enuresis is very common (affects 15-20% of 5-year-olds, 5% of 10-year-olds). It is developmental, not the child''s fault
- Family history: father was the same - this is strongly genetic and Ethan will almost certainly grow out of it
- First-line treatment: enuresis alarm (NICE CG111). Most effective long-term treatment. Takes 2-4 weeks to see improvement, full response in 6-16 weeks. Available through the school nursing or enuresis service
- Stop lifting: this does not teach the child to recognise a full bladder and can perpetuate the problem
- Fluid advice: do NOT restrict fluids excessively. Encourage regular drinking during the day (6-8 drinks). Avoid caffeine (cola). Last drink one hour before bed, not three hours
- Desmopressin: appropriate for short-term use such as the camping trip. Nasal spray or melt tablet. Restrict fluids from one hour before to eight hours after the dose. Trial at home before the trip to check effectiveness
- Referral to enuresis service or school nurse continence team for alarm provision and support
- Address self-esteem: use ERIC (The Children''s Bowel and Bladder Charity) resources. Reassure Ethan this is not his fault
- No reward charts for dry nights (child cannot control an involuntary process)

**References:**
- NICE CG111: Nocturnal enuresis - https://www.nice.org.uk/guidance/cg111
- NICE CKS: Bedwetting (enuresis) - https://cks.nice.org.uk/topics/bedwetting-enuresis/
- ERIC (The Children''s Bowel and Bladder Charity): https://www.eric.org.uk/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established this is primary nocturnal enuresis (never consistently dry)", "Confirmed daytime continence is normal", "Screened for constipation (commonest associated factor)", "Screened for underlying causes (diabetes, UTI)", "Assessed fluid intake pattern including caffeine", "Explored family history (father was enuretic)", "Asked about what has been tried and what has not worked", "Assessed the emotional impact on Ethan"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Reassured that primary nocturnal enuresis is common and developmental", "Recommended enuresis alarm as first-line treatment (NICE CG111)", "Discussed desmopressin for short-term use at the camping trip", "Advised stopping lifting as it does not promote bladder learning", "Corrected fluid restriction advice (encourage daytime drinking, avoid excessive evening restriction)", "Referred to enuresis service or school nurse continence team", "Signposted to ERIC for family resources and support", "Addressed Ethan''s self-esteem and reassured this is not his fault"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was warm and reassuring with the father", "Acknowledged the practical deadline of the camping trip", "Demonstrated understanding of the impact on the child''s self-esteem", "Gave clear and practical advice without being patronising", "Engaged the father as an active partner in the management plan", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 9: Gender Dysphoria Referral
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Gender Dysphoria Referral',
  'Mental Health',
  'MH-009',
  'Video consultation. A 22-year-old patient assigned female at birth has booked an appointment to discuss being referred to a Gender Identity Clinic. They have been thinking about this for several years and have recently come out to their family.',
  '{"name": "Alex Thornton", "age": 22, "gender": "Non-binary (assigned female at birth)"}',
  '{"patient": "Alex Thornton", "age": 22, "gender": "Non-binary (assigned female at birth)", "pmh": "Generalised anxiety disorder (diagnosed age 18), mild acne", "medications": "Sertraline 50mg OD", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hi. I go by Alex and my pronouns are they and them. I have been thinking about this for a long time and I would like to be referred to a gender identity clinic. I want to start the process of transitioning.",
    "freely_given_history": {
      "presenting_complaint": "I have felt uncomfortable in my body for as long as I can remember. As a child I hated wearing dresses and always felt more like a boy. As I got older, I realised it was not just about clothes. I feel like my body does not match who I am inside. I have known since I was about fourteen but I was not ready to talk about it until now.",
      "psychosocial_impact": "I came out to my parents three months ago. My mum has been amazing but my dad is struggling with it. He keeps calling me by my old name. My younger brother is fine. I changed my name at work six months ago and most colleagues have been supportive but I have had a few nasty comments.",
      "ice": {
        "ideas": "I have done a lot of research online. I know the waiting list for GICs is very long. I want to get referred as soon as possible so I can start the process.",
        "concerns": "I am worried about the long wait. I have read it can be three to five years. I am also worried about whether I will be taken seriously. I had a bad experience with a previous GP who told me it was just a phase.",
        "expectations": "I want a referral to a GIC today. I am not asking for hormones from you. I just want to be on the waiting list. I also want to know if there is anything else I can access while I wait."
      }
    },
    "history_on_direct_questioning": {
      "gender_identity": {
        "identity": "I identify as non-binary but I lean more towards masculine. I use they/them pronouns. I have been living as Alex for about a year.",
        "dysphoria": "I experience significant chest dysphoria. I bind my chest daily. I also feel uncomfortable with my hips and my voice. Menstruation is extremely distressing for me.",
        "social_transition": "I changed my name by deed poll six months ago. I dress in masculine clothing. Most people who meet me now assume I am male.",
        "goals": "I would like to explore testosterone therapy and I am very interested in top surgery eventually. I do not think I want lower surgery but I want to discuss my options."
      },
      "mental_health": {
        "anxiety": "My anxiety has been better since I started living as Alex. The sertraline helps. I feel more like myself now than I ever have.",
        "depression": "I had a period of depression at university which I now understand was related to gender dysphoria. I feel much better since coming out.",
        "self_harm": "I used to self-harm in my late teens. I have not done so for over two years. It stopped when I accepted my identity.",
        "suicidal_ideation": "No current suicidal thoughts. I had passive thoughts when I was eighteen but not since then."
      },
      "physical_health": {
        "binding": "I bind my chest with a proper binder, not bandages. I wear it for about ten hours a day. I know I should take breaks. I get some rib discomfort.",
        "periods": "My periods are regular but I find them extremely distressing. I have read about options to stop them.",
        "sexual_health": "I am not sexually active currently. I had a girlfriend until recently.",
        "general": "Otherwise fit and well. I do not smoke. I drink socially."
      },
      "support_network": {
        "family": "Mum supportive, dad struggling, brother fine.",
        "friends": "I have a good group of friends, several of whom are also trans or non-binary.",
        "work": "I work as a graphic designer. The company has been generally supportive."
      }
    },
    "ice": {
      "ideas": "I know who I am. I am not confused. I have thought about this for eight years.",
      "concerns": "I am worried about the wait and about not being believed.",
      "expectations": "I want the referral today and some advice on what I can access in the meantime."
    },
    "specific_prompts": "If the doctor uses your correct pronouns and name throughout, show appreciation. If the doctor tries to question whether this might be a phase, become frustrated but remain polite. If they discuss the referral process clearly and what interim support is available, be very satisfied. If they offer to prescribe something to stop your periods, be very interested."
  }',
  'CONFIDENT and articulate. You have done extensive research and you know what you want. You are nervous about being dismissed but you are self-assured about your identity. If the doctor is respectful and uses your correct name and pronouns, you relax and engage fully. If they misgender you or question your identity, you become guarded.',
  'full',
  720,
  'hard',
  ARRAY['Use correct name and pronouns throughout', 'Make appropriate referral to Gender Identity Clinic', 'Discuss current waiting times transparently', 'Explore interim support options (bridging prescriptions, counselling)', 'Assess mental health sensitively without gatekeeping', 'Discuss options for menstrual suppression', 'Address safe binding practices', 'Provide signposting to support organisations (Mermaids, Gendered Intelligence)'],
  '## Model Approach

**What this case is testing:** Respectful and affirming consultation with a patient requesting referral to a Gender Identity Clinic, knowledge of the referral pathway, interim support options, and addressing associated health needs.

**Data Gathering:**
- Use correct name (Alex) and pronouns (they/them) throughout
- Explore gender identity history: longstanding (since age 14), clear and consistent
- Assess current dysphoria: chest dysphoria (binding), distress with menstruation, discomfort with body shape and voice
- Social transition: name change by deed poll, living as Alex for a year, largely positive response
- Mental health: anxiety (on sertraline, improving since transition), history of depression and self-harm (resolved since accepting identity), no current suicidal ideation
- Physical health: safe binding practices, rib discomfort, menstrual distress
- Support network: good support from mother, friends, and workplace
- Goals: testosterone, top surgery, menstrual suppression

**Clinical Management:**
- GIC referral: any GP can refer directly to a Gender Identity Clinic. In England the main NHS GICs include Tavistock (adults), Leeds, Sheffield, Nottingham, and Exeter. Referral is a straightforward letter
- Be transparent about waiting times: currently 3-5+ years for most GICs. This is unacceptable but is the reality
- Interim support: consider whether shared care or bridging prescriptions for hormones are appropriate (some GPs do this, guided by GMC and NHS England interim guidance). This requires specialist input and is not mandatory but should be discussed
- Menstrual suppression: can prescribe a continuous combined oral contraceptive, continuous progesterone-only pill, or depot medroxyprogesterone acetate (Depo-Provera) to stop periods while awaiting GIC. This is within GP competence and does not require GIC involvement
- Safe binding: advise no more than 8-10 hours, take regular breaks, do not bind with bandages, stop if pain or breathing difficulty
- Signpost to: Gendered Intelligence, CliniQ, Switchboard LGBT+ helpline, local trans support groups
- Do NOT use gender dysphoria as a reason to withhold the GIC referral or suggest it is a phase
- Mental health: the anxiety and previous depression are related to gender dysphoria, not separate from it. Do not use mental health as a gatekeeping barrier
- Follow-up: arrange regular review while awaiting GIC appointment

**References:**
- NHS England: Gender dysphoria service specification - https://www.england.nhs.uk/commissioning/spec-services/npc-crg/gender-dysphoria-clinical-programme/
- GMC: Trans healthcare ethical guidance - https://www.gmc-uk.org/professional-standards/professional-standards-for-doctors/good-medical-practice
- NICE: Gender dysphoria information - referenced through NHS England
- Gendered Intelligence: https://genderedintelligence.co.uk/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Used correct name (Alex) and pronouns (they/them) consistently", "Explored gender identity history sensitively and respectfully", "Assessed current gender dysphoria (chest, menstruation, body, voice)", "Assessed mental health without using it as a gatekeeping barrier", "Asked about safe binding practices and physical effects", "Explored the patient''s transition goals (testosterone, top surgery)", "Assessed support network and family response", "Explored ICE (fear of not being believed, concern about waiting times)"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made appropriate referral to Gender Identity Clinic", "Was transparent about current waiting times", "Discussed interim support options (bridging prescriptions, shared care)", "Offered menstrual suppression (continuous pill, Depo-Provera) which is within GP competence", "Advised on safe binding practices (duration, breaks, stopping if pain)", "Signposted to trans support organisations (Gendered Intelligence, Switchboard)", "Did not question the patient''s identity or suggest it was a phase", "Arranged regular follow-up while awaiting GIC appointment"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was respectful, affirming, and non-judgemental throughout", "Used correct name and pronouns without prompting", "Acknowledged the patient''s expertise in their own identity", "Validated the frustration about waiting times and previous negative GP experience", "Demonstrated cultural competence in gender diversity", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 10: Veteran with PTSD Symptoms
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Veteran with PTSD Symptoms',
  'Mental Health',
  'MH-010',
  'Telephone consultation. A 34-year-old ex-military veteran has called to speak to a doctor. He has not seen a GP in over three years and is reluctant to engage with healthcare services. His wife called the surgery and booked the appointment for him.',
  '{"name": "Mr. Craig Malone", "age": 34, "gender": "Male"}',
  '{"patient": "Mr. Craig Malone", "age": 34, "gender": "Male", "pmh": "Fractured right tibia (military service, 2016, fully healed), no other recorded history", "medications": "None prescribed (self-medicating with alcohol and over-the-counter sleeping tablets)", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Look, my wife made me call. I do not really think I need to speak to a doctor. She is just worrying about nothing.",
    "freely_given_history": {
      "presenting_complaint": "If the doctor is patient and does not push too hard, you gradually reveal that you have not been sleeping properly for years. You have nightmares about things that happened when you were deployed. You wake up shouting and drenched in sweat. Your wife says you thrash about in your sleep. During the day you feel on edge all the time. Loud noises make you jump. You cannot go to crowded places because you feel panicky.",
      "psychosocial_impact": "You left the army three years ago after twelve years of service. You did two tours in Afghanistan. You have not been able to hold down a job since leaving. You have had four jobs in three years. You either walk out or get fired for losing your temper. Your wife is at breaking point. She says she does not recognise you anymore. You have two children aged four and six.",
      "ice": {
        "ideas": "You think you should just man up and get on with it. Your mates from the regiment would think you were weak for talking to a doctor about this.",
        "concerns": "Deep down you know something is wrong. You are worried you are losing your wife. You are also worried about your temper because you punched a wall last week when your son would not stop crying.",
        "expectations": "You do not know what you expect. You just want the nightmares to stop. You want to feel normal again."
      }
    },
    "history_on_direct_questioning": {
      "ptsd_symptoms": {
        "re_experiencing": "You have nightmares three or four nights a week. They are about specific incidents in Afghanistan. You sometimes have flashbacks during the day triggered by smells or sounds. The smell of diesel is a particular trigger.",
        "avoidance": "You avoid anything to do with the military. You threw away all your photos and medals. You do not watch the news. You will not drive past the barracks. You avoid talking about what happened.",
        "hyperarousal": "You are always on edge. You sit with your back to the wall in restaurants. You check doors and windows multiple times before bed. You cannot relax. Fireworks night is a nightmare, literally.",
        "emotional_numbing": "You feel disconnected from your wife and children. You love them but you cannot feel it. You do not experience joy or pleasure. You go through the motions."
      },
      "coping_mechanisms": {
        "alcohol": "You drink every night. About eight to ten cans of lager. You start drinking at about four in the afternoon. Sometimes more at weekends. You have tried to cut down but the nightmares get worse without it.",
        "sleeping_tablets": "You buy Nytol from the supermarket. You take two or three every night. They do not really work.",
        "cannabis": "If asked directly and non-judgementally: you smoke cannabis most evenings. A mate from the regiment gets it for you. It is the only thing that helps you switch off.",
        "exercise": "You used to run but you stopped about a year ago. You do not have the motivation."
      },
      "risk_assessment": {
        "anger": "You have a short fuse. You shout at your wife and children. You punched a wall last week. You have never hit your wife or children but you are scared you might one day.",
        "suicidal_ideation": "If asked directly: you have thought about it. You thought about driving your car off the road after a really bad night about two months ago. You did not do it because of the children. You do not have a plan currently.",
        "self_harm": "No deliberate self-harm. The wall punching is the closest."
      },
      "military_history": {
        "service": "Twelve years in the infantry. Two tours in Afghanistan, 2013 and 2015. Saw combat. Lost friends. You do not want to go into details.",
        "discharge": "Medical discharge due to the leg fracture but you know the mental health issues were already there.",
        "military_support": "You have not contacted any veterans charities. You see them as for weak people."
      }
    },
    "ice": {
      "ideas": "You think this is just what happens to soldiers and you should deal with it yourself.",
      "concerns": "You are scared of losing your family. You are scared of your own anger.",
      "expectations": "You just want to sleep without nightmares. You do not want to sit in a group and talk about your feelings."
    },
    "specific_prompts": "If the doctor is pushy or uses a lot of medical jargon, shut down. If they are calm, respectful, and give you space, gradually open up. If they acknowledge your service without being patronising, that helps. If they mention Op COURAGE (NHS veterans mental health service), be cautiously interested but wary. If they mention Combat Stress, say you have heard of them but never called."
  }',
  'GUARDED and reluctant initially. You present a tough exterior but you are suffering badly underneath. You respond well to a calm, no-nonsense approach. You do not want sympathy but you do want to be heard. If the doctor earns your trust during the consultation, you gradually reveal more. If they are dismissive or condescending, you will end the call.',
  'full',
  720,
  'hard',
  ARRAY['Build rapport with a reluctant and guarded patient', 'Recognise PTSD symptoms (re-experiencing, avoidance, hyperarousal, emotional numbing)', 'Assess suicide risk sensitively', 'Assess alcohol dependence and substance misuse', 'Refer to Op COURAGE (NHS veterans mental health service)', 'Consider safeguarding implications of anger and children in the home', 'Discuss evidence-based treatments for PTSD (trauma-focused CBT, EMDR)', 'Address barriers to help-seeking in veterans (stigma, masculinity norms)'],
  '## Model Approach

**What this case is testing:** Recognition and assessment of PTSD in a military veteran, building rapport with a reluctant patient, assessing suicide and safeguarding risk, addressing alcohol and substance misuse, and knowledge of veteran-specific support pathways.

**Data Gathering:**
- Build rapport first: do not rush into questions. Acknowledge his reluctance and his wife''s concern
- PTSD symptom clusters: re-experiencing (nightmares, flashbacks, triggers), avoidance (military items, news, barracks), hyperarousal (hypervigilance, exaggerated startle, sleep disturbance), emotional numbing (detachment from family)
- Duration: symptoms present for over three years since leaving the army
- Suicide risk: has had suicidal ideation (driving off road), protective factor is children, no current plan
- Alcohol: 8-10 cans nightly = approximately 50-60 units per week (dependent drinking). Uses alcohol to suppress nightmares
- Cannabis use: regular evening use (self-medication)
- OTC sleeping tablet misuse (Nytol)
- Anger and risk to family: punched a wall, shouts at wife and children, frightened of escalation
- Military history: combat exposure, loss of comrades, medical discharge
- Functional impact: unable to maintain employment, relationship breaking down

**Clinical Management:**
- PTSD is the likely diagnosis (symptoms >1 month, significant functional impairment, trauma exposure)
- Referral to Op COURAGE (NHS Transition, Intervention and Liaison Service for veterans). This is the NHS-commissioned pathway specifically for veterans
- Op COURAGE can assess and provide trauma-focused psychological therapy (CBT or EMDR as per NICE NG116)
- Alternative: Combat Stress (charity for veterans with mental health difficulties)
- Alcohol: this is dependent-level drinking. Advise against sudden cessation (withdrawal risk). Consider referral to alcohol services. PTSD and alcohol are interlinked - treating the PTSD often reduces the drinking
- Cannabis: acknowledge it as self-medication. Do not judge. Explain that cannabis can worsen PTSD symptoms long-term
- Medication: consider an SSRI (sertraline or paroxetine are NICE-recommended for PTSD if psychological therapy is refused or during the wait). Do NOT prescribe benzodiazepines
- Safeguarding: the anger is a concern. He has not harmed his family but is frightened he might. The children are witnessing shouting and wall-punching. Consider whether a safeguarding referral is needed. Currently, offering support and treatment is the proportionate response, but monitor
- Practicalities: help with employment - refer to Walking With The Wounded or RFEA (Regular Forces Employment Association)
- Follow-up: early review in one to two weeks. Provide crisis contacts (Samaritans 116 123, Veterans Crisis Line via Combat Stress, 999 if imminent risk)
- Do NOT insist on group therapy - he has said he does not want this. Individual therapy is available

**References:**
- NICE NG116: Post-traumatic stress disorder - https://www.nice.org.uk/guidance/ng116
- Op COURAGE (NHS veterans mental health service): https://www.nhs.uk/nhs-services/armed-forces-community/mental-health/veterans-reservists/
- Combat Stress: https://combatstress.org.uk/
- NICE CKS: PTSD - https://cks.nice.org.uk/topics/post-traumatic-stress-disorder/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Built rapport with a reluctant patient before gathering detailed history", "Identified all four PTSD symptom clusters (re-experiencing, avoidance, hyperarousal, emotional numbing)", "Conducted a sensitive suicide risk assessment (ideation, previous episode, protective factors)", "Assessed alcohol use quantitatively (dependent-level drinking)", "Asked about cannabis and OTC medication use non-judgementally", "Assessed anger and risk to family (wall-punching, shouting, fear of escalation)", "Explored barriers to help-seeking (stigma, masculinity norms, distrust of services)", "Explored ICE (wants nightmares to stop, scared of losing family, does not want group therapy)"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Referred to Op COURAGE (NHS veterans mental health service)", "Discussed evidence-based PTSD treatments (trauma-focused CBT, EMDR)", "Considered SSRI initiation (sertraline or paroxetine as per NICE NG116)", "Addressed alcohol dependence and risk of sudden cessation", "Acknowledged cannabis use as self-medication without judgement", "Assessed safeguarding implications for children in the home", "Provided crisis contacts (Samaritans, Combat Stress helpline, 999)", "Arranged early follow-up within one to two weeks", "Did not insist on group therapy, offered individual therapy options"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was calm, respectful, and did not rush the patient", "Acknowledged military service without being patronising", "Addressed stigma about help-seeking sensitively", "Demonstrated understanding of veteran culture and barriers", "Earned the patient''s trust during the consultation", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);
