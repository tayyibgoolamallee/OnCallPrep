-- Migration 073: 10 new third-party/telephone SCA cases
-- District nurses, community midwife, care home, paramedic, and relatives

-- =====================================================
-- CASE 1: District Nurse - Leg Ulcer Not Healing
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'District Nurse - Leg Ulcer Not Healing',
  'General Practice',
  'DN-001',
  'Telephone consultation. A district nurse is calling about a patient whose leg ulcer is not healing despite standard care. She would like your input on the management plan.',
  '{"name": "Mrs. Brenda Collins", "age": 78, "gender": "Female"}',
  '{"patient": "Mrs. Brenda Collins", "age": 78, "gender": "Female", "pmh": "Type 2 diabetes (HbA1c 64), peripheral vascular disease, hypertension, heart failure (NYHA II), previous DVT left leg 2019", "medications": "Metformin 1g BD, Amlodipine 10mg OD, Furosemide 40mg OD, Apixaban 5mg BD, Atorvastatin 40mg ON", "allergies": "Penicillin (rash)"}',
  '{
    "opening_statement": "Hello doctor, it is Karen here, one of the district nurses. I am calling about Mrs. Collins. I have been dressing her leg ulcer for about three months now and it is just not getting any better. I am getting a bit concerned and wanted to run it past you.",
    "freely_given_history": {
      "presenting_complaint": "The ulcer is on the left lower leg, just above the ankle on the inner side. It is about four centimetres across now and it has actually got a bit bigger over the past two weeks. The wound bed looks a bit sloughy and there is some yellow-green discharge. The surrounding skin is quite red and warm.",
      "psychosocial_impact": "Mrs. Collins is in a lot of pain with it. She is not sleeping well because of the pain and she has stopped going to her lunch club because she is embarrassed about the smell from the dressings.",
      "ice": {
        "ideas": "I am wondering if this might need antibiotics or if we should be thinking about referring to the tissue viability team.",
        "concerns": "I am worried about infection and also about her circulation given her vascular history. I am also not sure the compression bandaging is right for her given the PVD.",
        "expectations": "I was hoping you might review her or at least advise on whether she needs antibiotics, a wound swab, or a referral."
      }
    },
    "history_on_direct_questioning": {
      "wound_details": {
        "size": "About four centimetres wide, was about two centimetres when I first started dressing it.",
        "depth": "Shallow but the base is sloughy. Not down to tendon or bone.",
        "discharge": "Yellow-green, moderate amount. Smells a bit offensive.",
        "surrounding_skin": "Red, warm, some induration around the edges. The rest of the lower leg is dry and flaky.",
        "pain": "She says it is about seven out of ten. Worse at dressing changes."
      },
      "current_treatment": "I have been using a honey-based dressing with light compression. The compression was started after an ABPI was done about three months ago. The ABPI was 0.7 on the left.",
      "general_health": {
        "mobility": "She can walk with a frame around the house. Not going out much at the moment.",
        "appetite": "Not eating much. Has lost a bit of weight.",
        "diabetes_control": "Her HbA1c was 64 at last check. She does not always take her metformin.",
        "temperature": "She felt warm to touch today but I did not have a thermometer with me.",
        "systemic_symptoms": "She says she has been feeling more tired than usual."
      }
    },
    "secondary_history": {
      "previous_ulcers": "She had an ulcer on the same leg about two years ago which took about six months to heal.",
      "vascular_assessment": "Last seen by vascular surgery two years ago. They said she was not suitable for intervention at that time."
    },
    "ice": {
      "ideas": "I think this might be getting infected and I am not sure the current dressings are working.",
      "concerns": "I am worried about her PVD and whether the low ABPI means we should not be using compression at all.",
      "expectations": "I would really appreciate a face-to-face review or at least some guidance on the next steps."
    },
    "specific_prompts": "If the doctor tries to manage without seeing the patient, gently push back and explain that you think a face-to-face review would be safer. If the doctor is collaborative, share additional concerns about the patient''s nutrition and diabetes control."
  }',
  'PROFESSIONAL and knowledgeable. You know your patient well. You are polite but slightly concerned and want to make sure the right thing is done. If the doctor is collaborative, you share more detail. If they are dismissive, you become more insistent.',
  'full',
  720,
  'medium',
  ARRAY['Assess wound characteristics from nurse description', 'Consider infection vs colonisation', 'Review ABPI and compression appropriateness', 'Address pain management', 'Consider tissue viability or vascular referral', 'Collaborative working with district nursing team', 'Address holistic factors (nutrition, diabetes control)'],
  '## Model Approach

**What this case is testing:** Collaborative working with a district nurse, management of a non-healing leg ulcer with mixed aetiology (venous and arterial), and holistic patient care.

**Data Gathering:**
- Get detailed wound assessment from the nurse (size, depth, wound bed, discharge, surrounding skin)
- Review ABPI result and its implications (0.7 suggests mixed aetiology - modified compression only)
- Ask about signs of clinical infection vs colonisation
- Review current dressings and compression regime
- Assess the patient''s general health, nutrition, diabetes control, and mobility
- Consider differential: venous ulcer, arterial ulcer, mixed, diabetic foot ulcer, malignant ulcer

**Clinical Management:**
- Wound swab if signs of clinical infection (not routine swabbing)
- If clinical infection: oral antibiotics (consider allergy - not penicillin, use doxycycline or clarithromycin)
- Review compression: ABPI 0.7 = modified/reduced compression only, NOT full compression (NICE CKS)
- Refer to tissue viability nurse for specialist wound assessment
- Consider re-referral to vascular surgery given non-healing and PVD history
- Address pain: regular paracetamol, consider topical lidocaine at dressing changes
- Address diabetes control and nutrition (poor HbA1c, weight loss, poor appetite)
- Arrange face-to-face review to examine the wound and patient
- Consider blood tests: FBC, CRP, HbA1c, albumin (nutrition), glucose

**References:**
- NICE CKS: Leg ulcer venous - https://cks.nice.org.uk/topics/leg-ulcer-venous/
- SIGN 120: Management of chronic venous leg ulcers
- NICE CG19: Diabetic foot problems',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Gathered detailed wound assessment from the nurse (size, bed, discharge, surrounding skin)", "Reviewed and interpreted the ABPI result and its implications", "Asked about signs of clinical infection (warmth, erythema, discharge, smell, systemic symptoms)", "Assessed current dressing and compression regime appropriateness", "Asked about the patient''s general health (nutrition, diabetes control, mobility)", "Explored the nurse''s specific concerns and clinical observations", "Considered differential diagnoses for non-healing ulcer", "Gathered information efficiently via telephone"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Arranged wound swab if clinical infection suspected", "Prescribed appropriate antibiotic considering penicillin allergy", "Recognised that ABPI 0.7 requires modified compression only", "Referred to tissue viability nurse for specialist assessment", "Considered vascular surgery re-referral", "Addressed pain management at dressing changes", "Addressed holistic factors (nutrition, diabetes optimisation)", "Arranged face-to-face review to examine the patient", "Provided clear safety-netting for the nurse and patient"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and professional with the district nurse", "Valued the nurse''s clinical expertise and observations", "Demonstrated collaborative decision-making", "Listened carefully to the nurse''s concerns without being dismissive", "Used appropriate clinical language", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 2: District Nurse - Insulin Concern in Housebound Patient
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'District Nurse - Insulin Concern in Housebound Patient',
  'Endocrinology',
  'DN-002',
  'Telephone consultation. A district nurse is calling about a housebound patient whose blood sugars have been running very high despite insulin. She is concerned about the patient''s safety.',
  '{"name": "Mr. Harold Jennings", "age": 84, "gender": "Male"}',
  '{"patient": "Mr. Harold Jennings", "age": 84, "gender": "Male", "pmh": "Type 2 diabetes (insulin-dependent), dementia (moderate), chronic kidney disease stage 3b, atrial fibrillation, osteoarthritis", "medications": "Insulin Lantus 24 units ON, Insulin NovoRapid 8 units TDS, Apixaban 2.5mg BD, Paracetamol 1g QDS, Donepezil 10mg ON", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hello doctor, it is Sarah from the district nursing team. I visit Mr. Jennings three times a day to give him his insulin injections. I am really worried about his blood sugars this week. They have been up in the twenties and he is not looking right.",
    "freely_given_history": {
      "presenting_complaint": "His blood sugars have been between 22 and 28 for the past four days. Before that they were usually around 10 to 14. He seems more confused than usual and he has been drinking a lot of water. He is also going to the toilet more often. He vomited once yesterday.",
      "psychosocial_impact": "His wife is struggling to cope. She is his main carer and she is worried about him. He lives at home and the couple are quite isolated. Their son lives two hours away.",
      "ice": {
        "ideas": "I am thinking he might have an infection somewhere causing the sugars to spike. He had a urine infection last month.",
        "concerns": "I am worried about diabetic ketoacidosis or a hyperosmolar state. He is quite drowsy today.",
        "expectations": "I think he needs to be seen today. I was wondering if you could do a home visit or if we need to send him to hospital."
      }
    },
    "history_on_direct_questioning": {
      "current_readings": {
        "blood_sugars": "Ranging from 22 to 28 over the past four days. Today it was 26 before breakfast.",
        "ketones": "I do not have a ketone meter with me. I have not been able to check.",
        "insulin_doses": "He has been getting all his insulin as prescribed. I have not changed anything."
      },
      "systemic_review": {
        "temperature": "He felt warm yesterday. I do not have a thermometer today but he looks flushed.",
        "urine": "He is going more often. His wife says the urine looks dark and smells strong.",
        "breathing": "His breathing seems a bit faster than usual but he is not gasping.",
        "eating": "He has not been eating much for the past two days. Just sips of water and tea.",
        "consciousness": "He is drowsy. Responding but slower than usual. His dementia baseline is that he knows his wife and can have a short conversation."
      },
      "recent_changes": {
        "medications": "No changes to medications recently.",
        "infections": "He had a UTI last month treated with trimethoprim. Could this be another one?",
        "falls": "No recent falls."
      }
    },
    "ice": {
      "ideas": "I think he might have another infection driving the sugars up.",
      "concerns": "I am worried he could become dangerously unwell if we do not act today.",
      "expectations": "I really think he needs a medical review today, either a home visit or hospital."
    },
    "specific_prompts": "If the doctor suggests monitoring at home, express your concern that he is too unwell for that and that you think he needs urgent assessment. If they agree to act, be cooperative and helpful with the plan."
  }',
  'CONCERNED and professional. You know this patient well and can see he is deteriorating. You are firm but polite about the urgency. If the doctor takes your concerns seriously, you are relieved and cooperative.',
  'full',
  720,
  'hard',
  ARRAY['Recognise hyperglycaemic emergency in an elderly patient', 'Assess for DKA vs HHS', 'Consider underlying cause (infection)', 'Decision about hospital admission vs home management', 'Collaborative working with district nurse', 'Consider the patient holistic context (dementia, carer strain)', 'Urgent safety-netting'],
  '## Model Approach

**What this case is testing:** Recognition of a hyperglycaemic emergency (likely HHS) in an elderly housebound patient, decision-making about admission, and collaborative working with the district nurse.

**Data Gathering:**
- Current blood sugar readings and trajectory
- Assess for features of HHS: hyperglycaemia >30, dehydration, reduced consciousness, no significant ketosis
- Assess for DKA features: ketones (if available), Kussmaul breathing, abdominal pain
- Look for underlying cause: UTI (polyuria, dark urine, previous UTI), pneumonia, other infection
- Medication review: is insulin being administered correctly, any missed doses
- Assess consciousness level and compare to baseline (important in dementia)
- Assess eating, drinking, and hydration status

**Clinical Management:**
- This patient likely needs hospital admission: drowsy, persistent hyperglycaemia >22, vomiting, not eating, possible infection
- HHS has a high mortality rate in elderly patients - do not attempt to manage at home
- Arrange urgent admission: consider 999 ambulance given drowsiness and potential HHS
- While waiting: encourage oral fluids if conscious and safe to do so
- Do NOT increase insulin at home without ketone monitoring and proper assessment
- Communicate with wife about the plan and why hospital is needed
- Inform hospital about insulin regime, medications, dementia baseline, and carer situation

**References:**
- JBDS-IP: Management of HHS - https://abcd.care/joint-british-diabetes-societies-jbds-inpatient-care-group
- NICE NG17: Type 1 diabetes (DKA management principles)
- NICE CKS: Diabetes type 2 - https://cks.nice.org.uk/topics/diabetes-type-2/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Gathered blood sugar readings and trajectory over recent days", "Assessed for features of HHS vs DKA (consciousness, hydration, ketones, breathing)", "Asked about possible underlying cause (UTI symptoms, infection)", "Assessed current eating, drinking, and hydration status", "Compared current consciousness to dementia baseline", "Confirmed insulin has been administered correctly", "Asked about systemic symptoms (fever, vomiting, breathing)", "Gathered information efficiently from the nurse"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised this as a likely hyperglycaemic emergency requiring hospital admission", "Arranged urgent transfer to hospital (999 ambulance)", "Did not attempt to manage HHS at home", "Advised on interim measures while awaiting ambulance (oral fluids if safe)", "Planned communication with the hospital (insulin regime, baseline, medications)", "Considered the carer situation and communicated plan to wife", "Did not inappropriately increase insulin without proper monitoring", "Provided clear safety-netting for the nurse"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and professional with the district nurse", "Took the nurse''s concerns seriously and acted on them", "Acknowledged the nurse''s clinical judgement about urgency", "Demonstrated collaborative decision-making", "Showed concern for the carer''s situation", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 3: Community Midwife - Reduced Fetal Movements
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Community Midwife - Reduced Fetal Movements',
  'Obstetrics',
  'MW-001',
  'Telephone consultation. A community midwife is calling about a pregnant woman at 34 weeks who has reported reduced fetal movements. The midwife would like your advice on the urgency and management.',
  '{"name": "Mrs. Priya Sharma", "age": 31, "gender": "Female"}',
  '{"patient": "Mrs. Priya Sharma", "age": 31, "gender": "Female", "pmh": "Gestational diabetes (diet-controlled), hypothyroidism", "medications": "Levothyroxine 75mcg OD, Folic acid 400mcg OD", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hello doctor, it is Clare from the community midwifery team. I have just seen Mrs. Sharma at her antenatal appointment. She is 34 weeks pregnant and she has told me that the baby has not been moving as much as usual since yesterday evening. I have listened in and the fetal heart rate is present and normal at 142, but I am still concerned.",
    "freely_given_history": {
      "presenting_complaint": "Mrs. Sharma says the baby was moving well until yesterday evening. She noticed a definite reduction overnight and this morning. The baby has moved a couple of times today but much less than usual. This is her second pregnancy. She knows what normal movements feel like and says this is different.",
      "psychosocial_impact": "She is very anxious. Her friend lost a baby at 36 weeks last year and she is frightened the same could happen to her.",
      "ice": {
        "ideas": "I am thinking she needs to go to the day assessment unit for a CTG trace.",
        "concerns": "I am worried because she has gestational diabetes and reduced fetal movements can be a sign of fetal compromise. Her friend''s experience is also making this harder for her.",
        "expectations": "I need you to refer her to the day assessment unit for urgent review today. I cannot refer directly from the community."
      }
    },
    "history_on_direct_questioning": {
      "fetal_movements": {
        "pattern": "Usually very active, especially after meals. She counts about 10 movements in an hour normally.",
        "current": "Only felt about 3 movements since waking this morning. Yesterday evening she noticed a change too.",
        "previous_episodes": "She had one episode of reduced movements at 28 weeks. She went to triage and the CTG was normal."
      },
      "maternal_health": {
        "blood_sugars": "She is diet-controlled. Her readings have been within target. Fasting around 5.2, post-meal around 6.8.",
        "blood_pressure": "I checked it today: 128/82. It was 118/74 at her last appointment two weeks ago.",
        "urine": "Dipstick today: no protein, no glucose.",
        "symptoms": "No headache, no visual disturbance, no epigastric pain. No vaginal bleeding or fluid loss.",
        "general_wellbeing": "She says she feels physically fine but is very worried."
      },
      "obstetric_history": {
        "previous_pregnancy": "First baby born at 39 weeks, normal vaginal delivery, healthy baby.",
        "current_pregnancy": "Gestational diabetes diagnosed at 28 weeks. Diet-controlled. Growth scans have been normal so far."
      }
    },
    "ice": {
      "ideas": "I think she needs a CTG today to check the baby is okay.",
      "concerns": "I am worried about fetal compromise, especially with the gestational diabetes. The slightly higher blood pressure is also on my mind.",
      "expectations": "I need you to facilitate a referral to the maternity day assessment unit today."
    },
    "specific_prompts": "If the doctor suggests waiting or monitoring at home, firmly explain that RCOG guidance says reduced fetal movements after 28 weeks should be assessed the same day with CTG. If the doctor facilitates the referral promptly, be grateful and cooperative."
  }',
  'PROFESSIONAL and clear. You are an experienced midwife who knows the guidelines. You are polite but firm about the need for same-day assessment. If the doctor acts quickly, you are appreciative.',
  'full',
  720,
  'medium',
  ARRAY['Recognise reduced fetal movements as requiring urgent assessment', 'Apply RCOG Green-top Guideline 57', 'Facilitate same-day referral to maternity DAU', 'Consider risk factors (gestational diabetes, slightly rising BP)', 'Collaborative working with midwife', 'Support the anxious patient', 'Appropriate safety-netting'],
  '## Model Approach

**What this case is testing:** Recognition of reduced fetal movements as requiring same-day assessment, applying RCOG guidance, and collaborative working with the community midwife.

**Data Gathering:**
- Establish the change in fetal movement pattern (subjective maternal perception is key)
- Duration and severity of the reduction
- Risk factors: gestational diabetes, previous episode of RFM, maternal age, BMI
- Current maternal observations: BP (slightly rising), urine, blood sugars
- Screen for pre-eclampsia symptoms: headache, visual disturbance, epigastric pain, oedema
- Obstetric history and current pregnancy progress

**Clinical Management:**
- Reduced fetal movements after 28 weeks = same-day assessment with CTG (RCOG GTG 57)
- Do NOT advise kick counting charts or cold drinks and waiting - this delays assessment
- Refer urgently to maternity day assessment unit or triage today
- The midwife cannot refer directly - the GP needs to facilitate this
- Note the slightly rising BP (128/82 from 118/74) - may warrant monitoring for pre-eclampsia
- Gestational diabetes increases the risk of fetal compromise
- Document the referral and communicate risk factors to the receiving team
- Safety-net: if baby stops moving completely or she develops headache/visual changes/epigastric pain, go to A&E immediately

**References:**
- RCOG Green-top Guideline 57: Reduced Fetal Movements - https://www.rcog.org.uk/guidance/browse-all-guidance/green-top-guidelines/reduced-fetal-movements-green-top-guideline-no-57/
- NICE CG133: Hypertension in pregnancy (pre-eclampsia screening)',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established the change in fetal movement pattern and duration", "Asked about previous episodes of reduced fetal movements", "Assessed maternal observations (BP, urine, blood sugars)", "Screened for pre-eclampsia symptoms", "Identified risk factors (gestational diabetes, previous RFM episode)", "Explored the midwife''s clinical observations and concerns", "Gathered relevant obstetric history", "Gathered information efficiently via telephone"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised RFM after 28 weeks requires same-day CTG assessment (RCOG GTG 57)", "Facilitated urgent referral to maternity day assessment unit", "Did not advise kick counting or waiting", "Communicated risk factors to the receiving team", "Noted the rising BP trend and flagged for monitoring", "Provided specific safety-netting (stop moving completely, pre-eclampsia symptoms = A&E)", "Demonstrated understanding of the referral pathway", "Engaged the midwife in collaborative care"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and professional with the midwife", "Respected the midwife''s clinical expertise and judgement", "Acted promptly on the midwife''s concerns", "Acknowledged the patient''s anxiety about her friend''s loss", "Demonstrated collaborative multi-professional working", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 4: Care Home Nurse - Resident Refusing Medication
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Care Home Nurse - Resident Refusing Medication',
  'Geriatrics',
  'CH-001',
  'Telephone consultation. A care home nurse is calling about a resident with dementia who has started refusing all her medications over the past three days. The nurse is asking for guidance.',
  '{"name": "Mrs. Dorothy Evans", "age": 86, "gender": "Female"}',
  '{"patient": "Mrs. Dorothy Evans", "age": 86, "gender": "Female", "pmh": "Alzheimer''s dementia (moderate-severe), hypertension, osteoporosis, hypothyroidism, recurrent UTIs", "medications": "Donepezil 10mg ON, Amlodipine 5mg OD, Alendronic acid 70mg weekly, Levothyroxine 50mcg OD, Adcal D3 BD, Trimethoprim 100mg ON (prophylactic)", "allergies": "Codeine (confusion)"}',
  '{
    "opening_statement": "Hello doctor, it is Michelle from Oakwood Care Home. I am calling about Mrs. Evans in Room 12. She has been refusing all her tablets for the past three days. She just clamps her mouth shut and turns her head away. This is not like her at all.",
    "freely_given_history": {
      "presenting_complaint": "Mrs. Evans has been taking her medications without any problems until three days ago. She suddenly started refusing everything. She spits them out or just will not open her mouth. We have tried crushing them in yoghurt but she refuses that too. She seems more agitated than usual and has been calling out at night.",
      "psychosocial_impact": "The other residents are being disturbed by her calling out at night. Her daughter visits every Sunday and is going to be very worried when she finds out.",
      "ice": {
        "ideas": "I am not sure if she is in pain or if something else is going on. Some of the carers think she might have a sore mouth.",
        "concerns": "I am worried about her missing her heart tablet and her thyroid tablet. Also, she has not had her Donepezil for three days and I do not know if that will make her dementia worse.",
        "expectations": "I was hoping you could come and see her or at least advise us on what to do. Should we be trying to give the medications in a different form?"
      }
    },
    "history_on_direct_questioning": {
      "oral_assessment": {
        "mouth": "One of the carers said her mouth looks a bit red inside but we have not done a proper check. She will not open her mouth for us.",
        "dentures": "She wears full dentures. We have not checked if they are fitting properly.",
        "eating": "She has been eating less too. She is taking fluids but pushing food away."
      },
      "behaviour_changes": {
        "agitation": "More agitated than usual, especially in the evenings. She has been hitting out when carers try to assist with personal care.",
        "sleep": "Calling out at night. Not settling until very late.",
        "pain_indicators": "She winces when we touch her face and she has been rubbing her jaw."
      },
      "general_health": {
        "temperature": "36.8 when we checked this morning.",
        "urine": "She is continent with pads. Nothing unusual noticed.",
        "bowels": "She has not opened her bowels for four days.",
        "hydration": "Drinking less than usual. Maybe three or four cups of tea a day."
      }
    },
    "ice": {
      "ideas": "I think she might have a problem with her mouth or dentures causing pain.",
      "concerns": "I am worried about her missing essential medications and about the worsening agitation.",
      "expectations": "I would really like a visit so someone can examine her mouth and review her medications."
    },
    "specific_prompts": "If the doctor suggests covert medication, ask about the ethical and legal requirements for this. If the doctor suggests a visit, be grateful."
  }',
  'CARING and concerned about the resident. You are a competent nurse but feel out of your depth with this situation. If the doctor offers to visit, you are relieved. If they suggest covert medication, you want to know about the proper process for that.',
  'full',
  720,
  'hard',
  ARRAY['Identify possible cause of medication refusal (oral pain, dentures)', 'Consider capacity assessment under Mental Capacity Act', 'Discuss covert medication only with proper best interests process', 'Address the acute issue (possible oral thrush, dental problem)', 'Review medication essentiality and formulations', 'Collaborative working with care home staff', 'Consider safeguarding and DOLs if needed'],
  '## Model Approach

**What this case is testing:** Management of medication refusal in a patient with dementia, Mental Capacity Act considerations, identifying underlying cause, and collaborative working with care home.

**Data Gathering:**
- Establish timeline of medication refusal and any triggers
- Consider oral causes: thrush, dental abscess, ill-fitting dentures, oral ulceration
- Behavioural changes: agitation, pain indicators (facial wincing, jaw rubbing)
- Assess for intercurrent illness: UTI, constipation, pain
- Review which medications are essential vs can be temporarily paused
- Consider delirium superimposed on dementia

**Clinical Management:**
- Arrange a visit to examine the patient (mouth, general assessment)
- Likely cause: oral pain (possibly oral thrush, dental problem, or denture issue)
- If oral thrush: nystatin oral suspension (liquid, does not require swallowing tablets)
- Request dental review if dentures are the issue
- Address constipation (4 days without bowels) - this can cause agitation
- Covert medication: ONLY after formal capacity assessment and best interests decision under MCA 2005. Requires MDT discussion, family involvement, and documentation
- Review medication list: stop alendronic acid (can''t give crushed), consider liquid formulations for essential medications
- Consider whether the agitation represents delirium - investigate causes
- Stopping Donepezil abruptly can worsen cognition - prioritise restarting this

**References:**
- NICE NG97: Dementia - https://www.nice.org.uk/guidance/ng97
- Mental Capacity Act 2005 Code of Practice
- NICE CKS: Dementia - https://cks.nice.org.uk/topics/dementia/
- CQC: Covert administration of medicines guidance',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Identified the timeline and pattern of medication refusal", "Considered oral causes (thrush, dental pain, dentures)", "Recognised pain indicators (facial wincing, jaw rubbing, agitation)", "Assessed for intercurrent illness (constipation, UTI, delirium)", "Asked about eating, drinking, and hydration", "Compared current behaviour to baseline", "Explored the nurse''s observations and concerns", "Gathered information efficiently via telephone"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Arranged a home visit to examine the patient", "Identified likely oral cause and planned appropriate treatment", "Addressed constipation as a contributing factor to agitation", "Reviewed medications for essential vs non-essential (stop alendronic acid)", "Discussed covert medication only with proper MCA best interests process", "Considered liquid formulations for essential medications", "Prioritised restarting Donepezil (abrupt stopping worsens cognition)", "Planned communication with family", "Provided clear safety-netting for the care home"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and professional with the care home nurse", "Valued the nurse''s clinical observations", "Demonstrated understanding of MCA and covert medication ethics", "Took the situation seriously and did not dismiss the concerns", "Showed compassion for both the resident and care staff", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 5: Paramedic - Non-Conveyance Decision
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Paramedic - Non-Conveyance Decision',
  'General Practice',
  'PARA-001',
  'Telephone consultation. A paramedic is at a patient''s home. They were called by the patient''s wife for a fall. The paramedic has assessed the patient and does not think hospital admission is needed but wants to discuss the plan with the GP before leaving.',
  '{"name": "Mr. Kenneth Price", "age": 79, "gender": "Male"}',
  '{"patient": "Mr. Kenneth Price", "age": 79, "gender": "Male", "pmh": "Parkinson''s disease, postural hypotension, type 2 diabetes, benign prostatic hyperplasia, depression", "medications": "Co-careldopa 25/100 TDS, Midodrine 5mg TDS, Metformin 500mg BD, Tamsulosin 400mcg ON, Sertraline 100mg OD", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hello doctor, it is James from the ambulance service. I am with Mr. Price at his home address. His wife called 999 because he had a fall in the bathroom about two hours ago. I have assessed him and I do not think he needs to go to hospital, but I wanted to run it past his GP before we leave.",
    "freely_given_history": {
      "presenting_complaint": "Mr. Price was getting out of the bath. He stood up, felt dizzy, and fell backwards onto the bathroom floor. He did not hit his head. He was on the floor for about 20 minutes before his wife found him. He was conscious throughout.",
      "psychosocial_impact": "His wife is shaken up and worried about leaving him at home. She says this is the third fall in two months.",
      "ice": {
        "ideas": "I think this is a postural hypotension episode related to his Parkinson''s medications. His lying BP was 142/88 and his standing BP was 98/62.",
        "concerns": "I am not concerned about a head injury as he did not hit his head. But the recurrent falls and the postural drop are concerning. His wife is not confident about managing at home.",
        "expectations": "I was hoping the GP could review his medications and arrange a falls assessment. I want to make sure there is a proper follow-up plan before I leave."
      }
    },
    "history_on_direct_questioning": {
      "fall_assessment": {
        "mechanism": "Stood up quickly from the bath, felt dizzy, fell backwards.",
        "head_injury": "No head strike. No loss of consciousness.",
        "injuries": "Bruise to his left hip. Full range of movement. Weight-bearing. No bony tenderness.",
        "neuro_exam": "GCS 15. Pupils equal and reactive. No focal neurology beyond his Parkinson''s baseline.",
        "observations": "HR 78 regular, lying BP 142/88, standing BP 98/62 (significant postural drop). Temp 36.4. Sats 96% on air. BM 6.2."
      },
      "background": {
        "parkinsonism": "He says his Parkinson''s has been worse recently. More shuffling. More freezing episodes.",
        "previous_falls": "Two falls in the past two months, both when standing up. Wife says he has stopped going out because he is scared of falling.",
        "mood": "He seems quite flat. His wife says he has been low and not engaging with things he used to enjoy.",
        "home_setup": "Lives in a two-storey house. Bathroom is upstairs. No grab rails in the bathroom."
      }
    },
    "ice": {
      "ideas": "I think the postural hypotension is the main issue and his medications might need reviewing.",
      "concerns": "I am worried about leaving him without a proper follow-up plan. His wife is not coping well.",
      "expectations": "I would like the GP to see him in the next day or two and arrange a falls assessment. Can the GP also consider a referral for home adaptations?"
    },
    "specific_prompts": "If the doctor agrees to a follow-up plan and medication review, be satisfied and leave. If the doctor seems unsure about non-conveyance, explain your clinical findings and why you think hospital is not needed."
  }',
  'PROFESSIONAL and thorough. You have done a comprehensive assessment and are confident in your clinical findings. You are respectful of the GP''s input and want to ensure safe handover. If the doctor engages well, the conversation flows easily.',
  'full',
  720,
  'medium',
  ARRAY['Accept handover from paramedic professionally', 'Review postural hypotension management', 'Agree on safety of non-conveyance decision', 'Plan medication review', 'Arrange falls assessment referral', 'Consider home adaptations and OT referral', 'Support the carer', 'Address worsening Parkinson and mood'],
  '## Model Approach

**What this case is testing:** Collaborative working with a paramedic, accepting a non-conveyance handover, medication review for postural hypotension, and arranging comprehensive falls follow-up.

**Data Gathering:**
- Accept the paramedic''s clinical assessment and observations
- Confirm no head injury, no LOC, no focal neurology
- Note the significant postural drop (142/88 lying to 98/62 standing = 44mmHg systolic drop)
- Review medications contributing to postural hypotension
- Assess falls pattern: recurrent, all postural, fear of falling
- Note worsening Parkinson''s and mood

**Clinical Management:**
- Agree with non-conveyance if no head injury, no fracture, and patient is safe at home
- Arrange urgent GP review within 1-2 days for medication review
- Medications to review: Midodrine (is dose adequate?), Tamsulosin (alpha-blocker worsens postural drop), Sertraline (can worsen postural hypotension)
- Consider stopping Tamsulosin or switching to alternative
- Refer to falls clinic for multifactorial falls assessment (NICE CG161)
- Refer to occupational therapy for home assessment (grab rails in bathroom, consider downstairs facilities)
- Consider Parkinson''s nurse or neurology review for worsening symptoms
- Address carer strain: signpost to carer support
- Safety-net: call 999 if further falls with head injury, LOC, or inability to weight-bear

**References:**
- NICE CG161: Falls in older people - https://www.nice.org.uk/guidance/cg161
- NICE NG71: Parkinson''s disease - https://www.nice.org.uk/guidance/ng71
- NICE CKS: Falls risk assessment - https://cks.nice.org.uk/topics/falls-risk-assessment/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Accepted and reviewed the paramedic''s clinical assessment", "Noted the significant postural blood pressure drop", "Identified recurrent falls pattern (all postural)", "Reviewed medications contributing to postural hypotension", "Noted worsening Parkinson''s symptoms and low mood", "Assessed the home environment and carer capacity", "Asked about the paramedic''s specific concerns", "Gathered information efficiently via telephone"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Agreed with non-conveyance decision based on clinical findings", "Arranged urgent GP review within 1-2 days", "Identified medications to review (Tamsulosin, Sertraline contribution to postural hypotension)", "Referred to falls clinic for multifactorial assessment", "Arranged OT referral for home adaptations (grab rails, bathroom safety)", "Considered Parkinson''s team review for worsening symptoms", "Addressed carer strain and signposted to support", "Provided clear safety-netting for the patient and wife"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and professional with the paramedic", "Accepted the paramedic''s clinical expertise and assessment", "Demonstrated effective inter-professional handover", "Showed concern for both the patient and the carer", "Communicated the follow-up plan clearly", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 6: Daughter Calling About Elderly Father
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Daughter Calling About Elderly Father',
  'Geriatrics',
  'REL-001',
  'Telephone consultation. A patient''s daughter is calling because she is worried about her father who she thinks is declining. She visited him at the weekend and was shocked by how he looked.',
  '{"name": "Mr. Albert Murray", "age": 82, "gender": "Male"}',
  '{"patient": "Mr. Albert Murray", "age": 82, "gender": "Male", "pmh": "COPD (on home oxygen 2L), ischaemic heart disease, chronic kidney disease stage 4, depression", "medications": "Salbutamol inhaler PRN, Seretide 500 Accuhaler BD, Home oxygen 2L via nasal cannulae, Aspirin 75mg OD, Bisoprolol 2.5mg OD, Ramipril 2.5mg OD, Furosemide 40mg OD, Sertraline 50mg OD", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hello doctor, my name is Sandra. I am calling about my father, Albert Murray. I am really worried about him. I went to visit him at the weekend and I barely recognised him. He has lost so much weight and he just did not seem like himself at all.",
    "freely_given_history": {
      "presenting_complaint": "When I visited on Saturday, Dad looked terrible. He has lost a lot of weight, his clothes are hanging off him. The house was a mess which is not like him at all. There were unopened meals on wheels containers in the kitchen. He could barely get up from his chair without getting breathless. He said he has not been out of the house for weeks.",
      "psychosocial_impact": "I live three hours away so I cannot visit very often. I feel incredibly guilty. I have been calling him on the phone and he always says he is fine, but when I saw him it was obvious he is not. I do not think he is coping at home.",
      "ice": {
        "ideas": "I do not know if he is depressed or if his lungs are getting worse or if there is something else going on. He just seems to have given up.",
        "concerns": "I am terrified he is going to collapse at home and nobody will find him. He lives alone since Mum died last year. He does not have any neighbours who check on him.",
        "expectations": "I want someone to see him at home and properly assess what is going on. I also want to know what support is available because I do not think he can manage on his own much longer."
      }
    },
    "history_on_direct_questioning": {
      "weight_loss": "I would say he has lost at least a stone, maybe more. His trousers need a belt now and they used to fit fine.",
      "eating": "He says he cannot be bothered to cook. He gets meals on wheels but he is not eating them. He says he does not have an appetite.",
      "breathing": "His breathing seems worse to me. He is breathless just walking from his chair to the kitchen. He says he is using his blue inhaler more often.",
      "mood": "He said something that really worried me. He said there is no point in anything anymore now that Mum is gone. When I asked him what he meant, he changed the subject.",
      "self_care": "He did not look like he had washed for a while. He was in the same clothes he was wearing last time I visited two weeks ago.",
      "bereavement": "Mum died 14 months ago. They were married for 58 years. He has never been on his own before.",
      "social_support": "He has meals on wheels three times a week. No other formal support. He stopped going to his bowls club months ago."
    },
    "ice": {
      "ideas": "I think he is depressed and his physical health is getting worse too.",
      "concerns": "I am scared he might do something to himself. That comment about there being no point really frightened me.",
      "expectations": "I want a home visit, a proper assessment, and I want to know what help is out there for him."
    },
    "specific_prompts": "If the doctor discusses confidentiality and that they may not be able to share all details with you, accept this but explain that you just want to make sure he gets the help he needs. If the doctor offers a home visit and support plan, be very grateful."
  }',
  'WORRIED and emotional. You clearly love your father and feel guilty about not being closer. You may become tearful when talking about his comment about there being no point. If the doctor is empathetic and takes action, you are very grateful. If they seem dismissive, you become upset.',
  'full',
  720,
  'hard',
  ARRAY['Balance confidentiality with family concern', 'Recognise safeguarding and self-neglect risk', 'Screen for depression and suicidal ideation', 'Consider physical deterioration (COPD, weight loss, CKD)', 'Arrange home visit and comprehensive assessment', 'Consider social services referral and care package', 'Address bereavement and complicated grief', 'Support the carer-daughter'],
  '## Model Approach

**What this case is testing:** Managing a concerned relative''s call, balancing confidentiality, recognising adult safeguarding concerns (self-neglect), and arranging comprehensive support.

**Data Gathering:**
- Listen to the daughter''s concerns fully and empathetically
- Gather specific concerns: weight loss, not eating, worsening breathlessness, low mood, self-neglect
- The comment "no point anymore" - needs careful exploration as possible suicidal ideation
- Bereavement context: wife died 14 months ago, alone for first time
- Current support: meals on wheels only, no formal care package, isolated
- Physical health concerns: worsening COPD, weight loss (possible malignancy, depression, or failure to eat)

**Clinical Management:**
- Address confidentiality: explain you can listen to concerns and act on them but may not be able to share all details back
- Arrange urgent home visit to assess the patient directly
- At visit: mental health assessment (PHQ-9, suicide risk assessment), physical assessment (weight, COPD review, nutritional status)
- Consider adult safeguarding referral for self-neglect if appropriate
- Referral to social services for care needs assessment (Care Act 2014)
- Consider increasing meals on wheels, home care package, befriending services
- Review depression treatment: sertraline dose may need increasing
- Consider bereavement counselling referral (Cruse Bereavement Care)
- Bloods: FBC, U&Es, CRP, TFTs, albumin (nutrition), consider malignancy screen
- COPD review: is it exacerbating? Does he need pulmonary rehab or respiratory nurse?
- Safety-net with daughter: if he makes further concerning comments, encourage him to call Samaritans or dial 999

**References:**
- NICE CG90: Depression in adults - https://www.nice.org.uk/guidance/cg90
- Care Act 2014: Adult safeguarding and self-neglect
- NICE NG115: COPD - https://www.nice.org.uk/guidance/ng115',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Listened to the daughter''s concerns fully and empathetically", "Identified key issues: weight loss, not eating, worsening breathlessness, low mood", "Recognised the concerning comment about there being no point", "Assessed the level of self-neglect and isolation", "Gathered information about bereavement and its impact", "Assessed current support arrangements", "Considered physical causes for deterioration (COPD, malignancy, depression)", "Addressed confidentiality appropriately"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Arranged an urgent home visit to assess the patient", "Planned a comprehensive assessment (mental health, physical, nutritional)", "Identified self-neglect as a potential adult safeguarding concern", "Planned referral to social services for care needs assessment", "Considered increasing antidepressant dose and bereavement support", "Planned appropriate investigations (bloods, COPD review)", "Discussed crisis contacts with the daughter (Samaritans)", "Provided clear safety-netting and follow-up plan"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite, empathetic, and warm with the daughter", "Addressed confidentiality sensitively without shutting the daughter down", "Validated the daughter''s guilt and concerns", "Took the concerning comment about no point seriously", "Demonstrated compassion for the whole family situation", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 7: Son Calling - Mother Crushing Tablets
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Son Calling About Mother''s Medications',
  'Geriatrics',
  'REL-002',
  'Telephone consultation. A patient''s son is calling because he has been crushing his mother''s tablets to help her swallow them and wants to know if this is safe.',
  '{"name": "Mrs. Winifred Cook", "age": 91, "gender": "Female"}',
  '{"patient": "Mrs. Winifred Cook", "age": 91, "gender": "Female", "pmh": "Vascular dementia (severe), dysphagia (recent SALT assessment), osteoporosis, atrial fibrillation, hypertension", "medications": "Alendronic acid 70mg weekly, Rivaroxaban 20mg OD, Amlodipine 5mg OD, Memantine 10mg BD, Calcichew D3 Forte BD", "allergies": "Erythromycin (nausea)"}',
  '{
    "opening_statement": "Hello doctor, I hope you can help. My name is Richard and I am calling about my mother, Winifred Cook. She has been having trouble swallowing her tablets for the past few weeks. I have been crushing them up and mixing them into her porridge. I just wanted to check this is okay.",
    "freely_given_history": {
      "presenting_complaint": "Mum has been coughing and choking more when she tries to swallow her tablets. The speech and language therapist came out last week and said she has dysphagia. They put her on a soft diet. But nobody told us what to do about her tablets.",
      "psychosocial_impact": "I visit every morning to give her her medications and make sure she has breakfast. The carers come twice a day. I am doing my best but I am not a medical person and I do not know if I am doing the right thing.",
      "ice": {
        "ideas": "I thought crushing them would be fine because that is what we used to do for my father when he was ill.",
        "concerns": "A friend of mine who is a nurse said that some tablets should not be crushed. Now I am worried I have been doing something dangerous.",
        "expectations": "I just want to know which ones are safe to crush and if there are liquid versions available."
      }
    },
    "history_on_direct_questioning": {
      "swallowing": {
        "onset": "She has been coughing with tablets for about three weeks. It is getting worse.",
        "liquids": "She can still drink thickened fluids. The SALT recommended Stage 1 thickened fluids.",
        "food": "She manages soft food like porridge, mashed potato, and yoghurt."
      },
      "medications_being_crushed": {
        "current_practice": "I have been crushing all of them and mixing them into her morning porridge. I do it with a pestle and mortar.",
        "which_ones": "All of them. The alendronic acid, the blood thinner, the blood pressure tablet, the memory tablet, and the calcium tablets."
      },
      "general_health": {
        "dementia": "Her dementia has been getting worse over the past year. She does not really know who I am anymore but she is calm and settled.",
        "weight": "She has lost weight over the past couple of months. Her clothes are looser.",
        "chest_infections": "She had a chest infection about six weeks ago. She has a bit of a cough still."
      }
    },
    "ice": {
      "ideas": "I assumed it was fine to crush them all.",
      "concerns": "I am now worried I might have caused her harm, especially with the blood thinner and the bone tablet.",
      "expectations": "I want clear advice on what to do going forward."
    },
    "specific_prompts": "If the doctor reassures you that you have not caused harm, be relieved. If they explain which tablets must not be crushed, be attentive and ask for written instructions."
  }',
  'WELL-MEANING and caring but anxious that you have done something wrong. You are not medically trained. You need things explained simply. If the doctor is reassuring about your intentions, you relax. If they are critical, you become defensive.',
  'full',
  720,
  'medium',
  ARRAY['Identify medications that must NOT be crushed', 'Alendronic acid must not be crushed (oesophageal ulceration)', 'Rivaroxaban can be crushed but must be given with food', 'Review all medications for crushability and liquid alternatives', 'Address dysphagia management holistically', 'Consider medication rationalisation in severe dementia', 'Reassure the son about his intentions', 'Liaise with pharmacy about liquid formulations'],
  '## Model Approach

**What this case is testing:** Knowledge of which medications can and cannot be crushed, medication review in advanced dementia, and supporting a family carer.

**Data Gathering:**
- Establish which medications are being crushed and how
- SALT assessment findings and current swallowing recommendations
- General health and disease trajectory
- Current care arrangements and carer''s understanding

**Clinical Management:**
- STOP alendronic acid immediately: must NOT be crushed. If crushed, risk of oesophageal ulceration. Consider zoledronic acid IV infusion annual alternative or stop given prognosis
- Rivaroxaban: can be crushed and mixed with food (per SPC), but must be given with food for adequate absorption. Consider if anticoagulation is still appropriate given stage of dementia and goals of care
- Amlodipine: can be crushed safely
- Memantine: can be crushed. Also available as oral solution
- Calcichew D3: chewable, can be dissolved in water. May need to switch to liquid calcium/vitamin D
- Liaise with pharmacy for formulation advice (SPC checking for each medication)
- Consider medication rationalisation given severe dementia: is alendronic acid still appropriate? Is continued anticoagulation in the patient''s best interests?
- Reassure the son that his intentions were good and no immediate harm likely
- Consider best interests discussion about goals of care
- Arrange follow-up and link with pharmacy for ongoing support

**References:**
- NEWT Guidelines: Therapeutic options for patients unable to take solid oral dosage forms
- BNF: Individual drug SPCs for crushing advice
- NICE NG97: Dementia - https://www.nice.org.uk/guidance/ng97',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Identified all medications being crushed", "Understood the SALT assessment and current swallowing recommendations", "Asked how the tablets are being administered (crushed in porridge)", "Assessed the patient''s general health and dementia trajectory", "Explored the carer''s understanding and current practice", "Explored ICE (son''s concern about causing harm, need for clear guidance)", "Gathered relevant information about the patient''s functional status", "Consultation was clear and accessible"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Identified alendronic acid as the critical medication that must NOT be crushed", "Provided specific guidance on each medication (crushable vs not)", "Discussed alternative formulations (liquid memantine, dissolving calcichew)", "Considered medication rationalisation given severe dementia and prognosis", "Planned liaison with pharmacy for formulation advice", "Considered whether anticoagulation remains in the patient''s best interests", "Reassured the son that his intentions were good and harm was unlikely", "Arranged follow-up and clear written guidance"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and empathetic with the son", "Reassured without being dismissive of the concern", "Acknowledged the son''s dedication as a carer", "Used clear and non-medical language throughout", "Did not blame or criticise the son for crushing tablets", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 8: Practice Nurse - Abnormal Smear Result Discussion
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Abnormal Smear Result Discussion',
  'Women''s Health',
  'WH-005',
  'Video consultation. A 32-year-old woman has booked an appointment to discuss an abnormal cervical screening result. The result letter was sent to her and she is anxious about what it means.',
  '{"name": "Miss Jade Pearson", "age": 32, "gender": "Female"}',
  '{"patient": "Miss Jade Pearson", "age": 32, "gender": "Female", "pmh": "Anxiety disorder, previous chlamydia infection (age 24, treated)", "medications": "Sertraline 50mg OD, Microgynon 30", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hi doctor, I got a letter about my smear test and it says something about abnormal cells and HPV. I do not really understand what it means and I am really scared. Does this mean I have cancer?",
    "freely_given_history": {
      "presenting_complaint": "I had my smear test done by the nurse about three weeks ago. I got a letter saying the result showed HPV positive and low-grade dyskaryosis. The letter says I need to go for a colposcopy. I have been googling it and I am terrified.",
      "psychosocial_impact": "I have not slept properly since I got the letter. My anxiety is through the roof. I cried all weekend. My boyfriend has been supportive but I can tell he is worried too. I do not know anyone who has been through this.",
      "ice": {
        "ideas": "I think HPV means I have been unfaithful or that my boyfriend has cheated on me. I also think low-grade dyskaryosis means early cancer.",
        "concerns": "I am terrified this is cancer. I am also worried about the colposcopy and what they will do to me. Will it hurt?",
        "expectations": "I want someone to explain what this all means in simple language. I want to know if I am going to be okay."
      }
    },
    "history_on_direct_questioning": {
      "cervical_screening_history": {
        "previous_smears": "This is my third smear. The first two at ages 25 and 28 were normal.",
        "symptoms": "No abnormal bleeding. No post-coital bleeding. No unusual discharge."
      },
      "sexual_history": {
        "current_partner": "Been with my boyfriend for three years. We are in a monogamous relationship.",
        "previous_partners": "A few partners before my current boyfriend.",
        "contraception": "On the combined pill. No plans for pregnancy right now."
      },
      "general_health": {
        "smoking": "I smoke about five cigarettes a day. I know I should stop.",
        "anxiety": "My anxiety has been well controlled on sertraline until this result.",
        "vaccinations": "I do not think I had the HPV vaccine at school. I think it came in just after my year."
      }
    },
    "ice": {
      "ideas": "I think having HPV means someone has cheated.",
      "concerns": "I am scared I have cancer and that the colposcopy will be painful.",
      "expectations": "I want reassurance and a clear explanation of what happens next."
    },
    "specific_prompts": "If the doctor explains HPV sensitively and reassures you that it does not mean infidelity, show visible relief. If the doctor mentions that smoking increases cervical cancer risk, be receptive to quitting."
  }',
  'ANXIOUS and tearful at times. You have been catastrophising since getting the letter. If the doctor is calm, clear, and reassuring, you gradually become less anxious. If they use medical jargon without explaining, you become more worried.',
  'full',
  720,
  'easy',
  ARRAY['Explain HPV and its prevalence clearly', 'Clarify that HPV does not indicate infidelity', 'Explain low-grade dyskaryosis is NOT cancer', 'Explain the colposcopy process and what to expect', 'Address smoking as a cervical cancer risk factor', 'Manage anxiety sensitively', 'Reassure about the excellent prognosis of low-grade changes'],
  '## Model Approach

**What this case is testing:** Ability to explain an abnormal smear result clearly, address HPV misconceptions, manage health anxiety, and provide appropriate reassurance.

**Data Gathering:**
- Review the actual result: HPV positive, low-grade dyskaryosis
- Previous screening history (normal at 25 and 28)
- Current symptoms (none - important for reassurance)
- Sexual history (relevant for HPV discussion)
- Smoking status (modifiable risk factor for cervical cancer)
- HPV vaccination status
- Mental health impact of the result

**Clinical Management:**
- Explain HPV: extremely common virus, most sexually active people will get it at some point. It does NOT mean infidelity - HPV can remain dormant for years
- Explain low-grade dyskaryosis: NOT cancer. Means there are mild cell changes that are very common and often resolve on their own
- Explain colposcopy: a closer look at the cervix using a microscope. May involve a small biopsy. Not usually painful but can be uncomfortable. Takes about 15-20 minutes
- Reassure: the vast majority of low-grade changes go back to normal. Even if treatment is needed (LLETZ), it is very successful
- Smoking cessation: smoking increases the risk of HPV persistence and cervical cancer. Offer support
- HPV vaccination: may still be beneficial even if not had previously - discuss with colposcopy clinic
- Address anxiety: validate feelings, offer additional support if needed, consider increasing sertraline if anxiety worsening

**References:**
- NHS Cervical Screening Programme: https://www.gov.uk/guidance/cervical-screening-programme-overview
- Jo''s Cervical Cancer Trust: https://www.jostrust.org.uk/
- NICE CKS: Cervical screening - https://cks.nice.org.uk/topics/cervical-screening/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Reviewed and understood the screening result (HPV positive, low-grade dyskaryosis)", "Asked about previous screening history", "Checked for symptoms (abnormal bleeding, post-coital bleeding)", "Explored HPV misconceptions (infidelity concern)", "Assessed the psychological impact on the patient", "Asked about smoking status", "Explored ICE (cancer fear, colposcopy anxiety, need for reassurance)", "Consultation was sensitively paced"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained HPV clearly and corrected misconception about infidelity", "Explained that low-grade dyskaryosis is NOT cancer", "Described the colposcopy procedure in accessible terms", "Reassured about the excellent prognosis of low-grade changes", "Addressed smoking as a modifiable cervical cancer risk factor", "Discussed HPV vaccination if not previously received", "Signposted to Jo''s Cervical Cancer Trust for support", "Provided safety-netting (what to do if symptoms develop before colposcopy)"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was polite and empathetic throughout", "Addressed the patient''s fears with genuine warmth", "Used clear, jargon-free language", "Normalised the experience without being dismissive", "Validated the anxiety and emotional response", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 9: Domestic Violence Disclosure
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Domestic Violence Disclosure',
  'Safeguarding',
  'SG-003',
  'Video consultation. A 28-year-old woman has booked a routine appointment for a repeat contraception prescription. During the consultation, she discloses domestic abuse.',
  '{"name": "Mrs. Lauren Mitchell", "age": 28, "gender": "Female"}',
  '{"patient": "Mrs. Lauren Mitchell", "age": 28, "gender": "Female", "pmh": "Depression (2 years ago, resolved), no other significant history", "medications": "Microgynon 30 (repeat prescription)", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hi, I just need my pill repeating please. Sorry to bother you with something so simple.",
    "freely_given_history": {
      "presenting_complaint": "You initially just want a repeat prescription for your contraceptive pill. You are quiet and seem distracted. If the doctor asks an open question about how you are doing generally, you pause and then say: Actually doctor, there is something else. I do not really know how to say this. Things at home have not been great.",
      "psychosocial_impact": "If the doctor creates a safe space and asks sensitively, you gradually disclose that your husband has been controlling and aggressive. He checks your phone, controls the money, and has grabbed you hard enough to leave bruises on two occasions. The most recent was last week.",
      "ice": {
        "ideas": "You think this is partly your fault because you wind him up. You have been told by him that you are being dramatic.",
        "concerns": "You are frightened of what he will do if he finds out you have told someone. You have a three-year-old daughter at home.",
        "expectations": "You do not know what you want. You just needed to tell someone. You are not ready to leave yet but want to know what your options are."
      }
    },
    "history_on_direct_questioning": {
      "abuse_details": {
        "types": "Controlling behaviour: checks phone, controls finances, tells you what to wear, isolates you from friends and family. Physical: grabbed arms leaving bruises twice. Verbal: calls you stupid and worthless regularly.",
        "escalation": "It has been getting worse over the past six months. He lost his job and started drinking more.",
        "children": "Your three-year-old daughter has not been physically harmed but she has witnessed the shouting. She has become clingy and is having nightmares.",
        "sexual": "If asked very sensitively: he has pressured you into sex when you did not want to on several occasions. You do not consider it rape because he is your husband."
      },
      "safety": {
        "current_risk": "He does not know you are speaking to anyone about this. He thinks this is a routine pill appointment.",
        "weapons": "No weapons in the house.",
        "previous_police": "Never contacted the police.",
        "support": "Your mother lives nearby but does not know. You have one close friend who suspects something."
      },
      "mental_health": {
        "mood": "Low, anxious, not sleeping well. Feeling trapped.",
        "self_harm": "No thoughts of self-harm or suicide currently.",
        "coping": "Just trying to get through each day."
      }
    },
    "ice": {
      "ideas": "You think it might be partly your fault.",
      "concerns": "You are scared of him finding out. You are worried about your daughter.",
      "expectations": "You want to know your options but you are not ready to act yet."
    },
    "specific_prompts": "Only disclose the abuse if the doctor creates a safe, non-judgemental space. If they rush through the pill prescription without asking how you are, do not disclose. If the doctor mentions your daughter may be at risk, become defensive initially but then accept the concern. If the doctor mentions safeguarding referral, ask if that means social services will take your daughter away."
  }',
  'NERVOUS and quiet initially. You test the waters before disclosing. If the doctor is warm and gives you time, you open up gradually. You become emotional when talking about your daughter. If the doctor is rushed, you say nothing. You flinch slightly when discussing the physical abuse.',
  'full',
  720,
  'hard',
  ARRAY['Create a safe space for disclosure', 'Recognise coercive control as domestic abuse', 'Assess risk using DASH or similar framework', 'Safeguarding duty for the child witnessing abuse', 'Respect patient autonomy while being clear about risks', 'Document sensitively and safely', 'Signpost to specialist services (MARAC, IDVA, National Domestic Abuse Helpline)', 'Address the belief that it is her fault'],
  '## Model Approach

**What this case is testing:** Recognition and management of domestic abuse disclosure, safeguarding responsibilities for the child, risk assessment, and providing support while respecting autonomy.

**Data Gathering:**
- Create a safe, unhurried space for disclosure
- Assess the type and severity of abuse (physical, emotional, controlling, sexual)
- Assess escalation pattern
- Risk assessment: DASH checklist elements (frequency, severity, escalation, weapons, alcohol)
- Impact on the child: witnessing, behavioural changes, direct harm
- Patient''s safety: does the perpetrator know she is disclosing? Can she access phone safely?
- Support network: family, friends, financial independence
- Mental health: mood, self-harm risk, coping

**Clinical Management:**
- Validate: this is NOT her fault. Coercive control is a criminal offence (Serious Crime Act 2015)
- Explain marital rape is a crime - sex without consent is always wrong regardless of relationship
- Risk assessment: consider MARAC referral if high risk
- Safeguarding: the child witnessing domestic abuse IS an adverse childhood experience and a child protection concern. Must make a safeguarding referral. Explain sensitively that this is to help, not to remove the child
- Signpost to: National Domestic Abuse Helpline (0808 2000 247), local IDVA service, Women''s Aid, Refuge
- Safety planning: does she have a safe place to go? Can she keep important documents accessible?
- Document carefully: use coded entries if the perpetrator has access to medical records
- Offer follow-up appointment, ideally face-to-face
- Respect her autonomy: she is not ready to leave, and that is okay. Focus on safety planning

**References:**
- NICE QS116: Domestic violence and abuse - https://www.nice.org.uk/guidance/qs116
- NICE PH50: Domestic violence and abuse overview - https://www.nice.org.uk/guidance/ph50
- SafeLives DASH Risk Assessment - https://safelives.org.uk/
- National Domestic Abuse Helpline: 0808 2000 247',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Created a safe, unhurried space that allowed disclosure", "Assessed the types of abuse (physical, controlling, verbal, sexual)", "Assessed the escalation pattern and current risk", "Asked about the impact on the child (witnessing, behavioural changes)", "Assessed the patient''s support network and safety", "Screened for mental health impact (mood, self-harm)", "Explored ICE (belief it is her fault, fear of him finding out, concern for daughter)", "Consultation was sensitively paced and trauma-informed"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Validated that the abuse is not her fault", "Explained that coercive control is a criminal offence", "Identified the child safeguarding concern (witnessing abuse)", "Explained the safeguarding referral sensitively (to help, not remove the child)", "Signposted to specialist services (National DA Helpline, IDVA, Women''s Aid)", "Discussed safety planning", "Planned careful documentation (coded entries if perpetrator has record access)", "Respected her autonomy about not being ready to leave", "Offered follow-up and ongoing support"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was warm, empathetic, and non-judgemental throughout", "Created a safe space that enabled the disclosure", "Used sensitive language and avoided victim-blaming", "Handled the child safeguarding discussion with care", "Demonstrated genuine concern for her safety and wellbeing", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 10: Husband Calling - Wife with Postnatal Concerns
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Husband Calling About Wife''s Postnatal Concerns',
  'Mental Health',
  'REL-003',
  'Telephone consultation. A husband is calling because he is worried about his wife who gave birth six weeks ago. He says she is not herself and he is frightened she might harm herself.',
  '{"name": "Mrs. Amy Foster", "age": 34, "gender": "Female"}',
  '{"patient": "Mrs. Amy Foster", "age": 34, "gender": "Female", "pmh": "Previous episode of depression age 26 (treated with CBT, no medication), anxiety disorder", "medications": "None currently", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Doctor, I am sorry to call but I do not know what to do. My wife Amy had our baby six weeks ago and I am really, really worried about her. She is not the same person. I think something is seriously wrong.",
    "freely_given_history": {
      "presenting_complaint": "Since the baby was born Amy has been up and down, but the past two weeks she has been terrible. She barely sleeps even when the baby is sleeping. She is not eating. She cries for hours. Yesterday she said she wished she had never had the baby and that we would all be better off without her.",
      "psychosocial_impact": "I am trying to hold everything together. I am on paternity leave but it runs out next week. My mother has been helping but she lives an hour away. I am exhausted and scared. I do not want to leave Amy alone with the baby.",
      "ice": {
        "ideas": "I think she might have postnatal depression. My sister had it and she was nothing like this though.",
        "concerns": "I am terrified she is going to hurt herself. That comment about us being better off without her really frightened me. I also do not know if the baby is safe.",
        "expectations": "I want someone to see her urgently. I do not think this can wait. She will not call the doctor herself because she says there is nothing wrong."
      }
    },
    "history_on_direct_questioning": {
      "amys_symptoms": {
        "mood": "Crying constantly. Says she feels numb. No interest in anything.",
        "bonding": "She is struggling to bond with the baby. She feeds him because she has to but she does it mechanically. She said she does not feel any love.",
        "sleep": "She lies awake even when the baby is sleeping. She says her mind will not stop.",
        "eating": "She is barely eating. She has lost weight since the birth.",
        "thoughts": "She said we would all be better off without her. When I pushed, she said she has thought about taking all the paracetamol in the house but she has not done anything.",
        "baby_care": "She does the basics but I do most of it. She has not expressed any thoughts of harming the baby."
      },
      "risk_factors": {
        "previous_mh": "She had depression in her mid-twenties. Treated with CBT. No medication.",
        "birth_experience": "The birth was traumatic. Emergency caesarean after a long labour. She was very distressed.",
        "support": "I am there but running out of paternity leave. Mother-in-law helps when she can. Health visitor came last week and Amy told her everything was fine."
      }
    },
    "ice": {
      "ideas": "I think this is more than just baby blues.",
      "concerns": "I am scared she will act on those thoughts. I am also worried she is not telling professionals the truth.",
      "expectations": "I need someone to see her today or at least call her. She needs help now."
    },
    "specific_prompts": "If the doctor discusses confidentiality and offers to call Amy directly, agree but warn that she will probably say she is fine. If the doctor validates your concerns and takes them seriously, be grateful. If the doctor asks about the baby''s safety, do not be offended - acknowledge it is a fair question."
  }',
  'DISTRESSED and desperate. You are a caring husband who is clearly exhausted and out of his depth. You may become emotional when describing Amy''s comment about paracetamol. If the doctor takes your concerns seriously and acts urgently, you are relieved.',
  'full',
  720,
  'hard',
  ARRAY['Recognise severe postnatal depression with suicidal ideation', 'Take the husband''s concerns seriously as collateral history', 'Arrange urgent assessment (same day)', 'Consider perinatal mental health team referral', 'Assess risk to mother and baby', 'Address confidentiality sensitively', 'Support the husband as carer', 'Safety plan including removing means'],
  '## Model Approach

**What this case is testing:** Recognition of severe postnatal depression from collateral history, urgent risk assessment, perinatal mental health pathway, and supporting a concerned partner.

**Data Gathering:**
- Listen to the husband''s collateral history fully
- Key features: postnatal onset, worsening trajectory, suicidal ideation (paracetamol), poor bonding, not sleeping, not eating
- Risk assessment from collateral: has expressed wish to die, has thought about means (paracetamol), access to means at home
- Baby safety: no expressed thoughts of harming baby, but poor bonding and not coping
- Birth trauma: emergency caesarean, may contribute to PTSD/postnatal depression
- Previous mental health history
- Current support: husband''s paternity ending, health visitor was told everything is fine

**Clinical Management:**
- This requires URGENT same-day assessment
- Contact Amy directly: explain husband has called out of concern, approach with warmth not confrontation
- If she refuses contact: consider whether risk is high enough to override confidentiality
- Perinatal mental health team urgent referral
- Remove means: advise husband to remove all paracetamol and other medications from the house NOW
- Consider SSRI initiation: sertraline safe in breastfeeding (if she consents)
- Inform health visitor of concerns (with Amy''s consent ideally)
- If she refuses all help and risk remains high: consider Mental Health Act assessment
- Crisis plan: Samaritans, crisis team, A&E if acute risk
- Support the husband: validate his concern, acknowledge his exhaustion, signpost to support

**References:**
- NICE CG192: Antenatal and postnatal mental health - https://www.nice.org.uk/guidance/cg192
- NICE CKS: Depression postnatal - https://cks.nice.org.uk/topics/depression-antenatal-and-postnatal/
- Maternal Mental Health Alliance: https://maternalmentalhealthalliance.org/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Listened fully to the husband''s collateral history", "Identified features of severe postnatal depression (suicidal ideation, poor bonding, functional decline)", "Assessed suicide risk from collateral (expressed wish to die, identified means - paracetamol)", "Assessed risk to the baby (bonding, ability to care safely)", "Gathered information about birth experience and trauma", "Explored the husband''s concerns and current support", "Noted that the patient is not presenting her true state to professionals", "Gathered information efficiently and sensitively"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised this requires urgent same-day assessment", "Planned to contact Amy directly with a sensitive approach", "Advised immediate removal of means (paracetamol from the house)", "Planned urgent perinatal mental health team referral", "Discussed informing the health visitor of concerns", "Developed a crisis safety plan (Samaritans, crisis team, A&E)", "Considered SSRI initiation if patient consents (sertraline safe in breastfeeding)", "Supported the husband as carer and validated his concerns", "Addressed confidentiality considerations sensitively"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was empathetic and took the husband''s concerns seriously", "Validated the husband''s distress and exhaustion", "Handled confidentiality discussion sensitively", "Used clear and reassuring language", "Demonstrated genuine urgency about the situation", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);
