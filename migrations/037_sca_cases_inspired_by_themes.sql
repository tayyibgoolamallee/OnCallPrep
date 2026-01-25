-- SCA Cases Inspired by Clinical Themes
-- These cases are original creations inspired by common SCA themes
-- All patient details, scenarios, and specific content have been changed
-- Learning objectives and clinical themes are preserved

-- =====================================================
-- CASE 1: Early Pregnancy Concerns (Inspired by bleeding in pregnancy theme)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Early Pregnancy Concerns',
  'Women''s Health',
  'WH-001',
  'You are a GP trainee. A 26-year-old woman, Ms. Sarah Chen, has booked an urgent video consultation. The receptionist notes she called this morning with concerns about her pregnancy.',
  '{"name": "Ms. Sarah Chen", "age": 26, "gender": "Female"}',
  '{"patient": "Ms. Sarah Chen", "age": 26, "gender": "Female", "pmh": "Previous uncomplicated pregnancy 3 years ago", "medications": "Folic acid 400mcg daily (started 2 weeks ago)", "allergies": "Penicillin (rash)", "social_summary": "Works as a teacher, non-smoker, occasional alcohol (1-2 units/week)", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Doctor, I''m really worried. I found out I was pregnant last week and now I''ve noticed some spotting. I don''t know if this is normal or if something is wrong.",
    "freely_given_history": {
      "presenting_complaint": "Light pink spotting noticed yesterday morning. No pain. Still present today but very light.",
      "psychosocial_impact": "Very anxious. This is a planned pregnancy and she is worried about losing it.",
      "ice": {
        "ideas": "Worried this might be a miscarriage",
        "concerns": "Scared she might lose the baby. Unsure if she needs to go to hospital",
        "expectations": "Wants to know if everything is okay and what she should do"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "site": "Vaginal bleeding",
        "onset": "Started yesterday morning, noticed when using toilet",
        "character": "Light pink spotting, not like a period",
        "amount": "Very light, only noticed on tissue paper",
        "clots": "No clots",
        "pain": "No abdominal pain, no cramping",
        "associated_symptoms": "No dizziness, no shoulder tip pain, no fever"
      },
      "pregnancy_history": {
        "lmp": "Last period was 9 weeks ago",
        "gestation": "Believes she is around 9 weeks pregnant",
        "pregnancy_test": "Positive home test 1 week ago, repeated this morning - still positive",
        "planned": "Yes, this was a planned pregnancy",
        "contraception": "Was using condoms, stopped 3 months ago when trying to conceive",
        "antenatal_care": "Not yet booked, was planning to book after 12 weeks",
        "scans": "No scans done yet"
      },
      "pmh": {
        "previous_pregnancies": "One previous pregnancy 3 years ago - normal vaginal delivery, no complications",
        "medical_conditions": "No medical conditions",
        "surgery": "No previous surgery"
      },
      "social_hx": {
        "occupation": "Primary school teacher",
        "living": "Lives with partner in own home",
        "smoking": "Never smoked",
        "alcohol": "Occasional glass of wine (1-2 units per week), stopped when found out pregnant",
        "recreational_drugs": "None"
      }
    }
  }',
  'ANXIOUS but trying to stay calm. Speak clearly but with underlying worry. If doctor is dismissive, become more insistent. If reassured appropriately, show relief but still want clear plan. May ask multiple questions about what to expect.',
  'full',
  720,
  'medium',
  ARRAY['Recognise early pregnancy bleeding requires assessment', 'Take systematic history of bleeding', 'Assess for red flags (ectopic pregnancy)', 'Explore ICE thoroughly', 'Appropriate referral to EPAU', 'Clear safety-netting advice', 'Address anxiety appropriately'],
  '## Model Approach

**Key Priorities:**
1. Establish rapport and acknowledge anxiety
2. Systematic history of bleeding (amount, pain, associated symptoms)
3. Assess for red flags (ectopic pregnancy, heavy bleeding, pain)
4. Explore pregnancy history and gestation
5. Clear management plan with appropriate referral

**Differential Diagnosis:**
- Threatened miscarriage
- Implantation bleeding (less likely at 9 weeks)
- Ectopic pregnancy (must exclude)
- Cervical causes (ectropion, polyp)

**Management:**
- Refer to Early Pregnancy Assessment Unit (EPAU) for same-day assessment
- Explain this is to rule out serious causes and check pregnancy viability
- Provide clear safety-netting: if bleeding becomes heavy, if pain develops, or if feels unwell - seek urgent medical attention
- Advise not to drive if attending EPAU (take taxi or have someone drive)
- Discuss antenatal booking and folic acid continuation
- Address smoking cessation if applicable (not in this case)',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established presenting complaint clearly", "Explored bleeding characteristics (amount, colour, clots)", "Asked about associated pain (especially shoulder tip)", "Obtained pregnancy history (LMP, gestation, tests)", "Explored previous pregnancy history", "Assessed for red flag symptoms", "Explored ICE thoroughly", "Obtained relevant social history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered threatened miscarriage", "Considered ectopic pregnancy appropriately", "Made appropriate referral to EPAU", "Provided clear safety-netting advice", "Addressed practical concerns (transport, childcare if needed)", "Discussed antenatal care", "Documented appropriately"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for anxiety", "Used clear, non-jargon language", "Listened actively", "Addressed concerns appropriately", "Explained urgency without causing panic", "Involved patient in decisions", "Maintained calm professional manner"]}}'
);

-- =====================================================
-- CASE 2: Abnormal Liver Function Tests (Inspired by LFT theme)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Routine Health Check - Abnormal Liver Tests',
  'Gastroenterology',
  'GI-001',
  'You are a GP trainee. A 38-year-old man, Mr. David Thompson, has booked a routine telephone appointment. He was invited for an NHS Health Check as he recently turned 38. Blood tests were taken 3 days ago by the practice nurse. The results show mildly abnormal liver function tests.',
  '{"name": "Mr. David Thompson", "age": 38, "gender": "Male"}',
  '{"patient": "Mr. David Thompson", "age": 38, "gender": "Male", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "IT consultant, works from home, sedentary lifestyle", "family_summary": "Father: T2DM age 65, Mother: well"}',
  '{
    "opening_statement": "Hi doctor, I got a text saying I need to book an appointment about my blood test results. I wasn''t expecting anything to be wrong - I feel fine.",
    "freely_given_history": {
      "presenting_complaint": "No symptoms. Feels completely well. Called because received text about abnormal blood results.",
      "psychosocial_impact": "Slightly concerned but not overly worried. Curious about what the results mean.",
      "ice": {
        "ideas": "Not sure what the results mean. Wondering if it''s something serious.",
        "concerns": "Mild concern but not panicking. Wants to understand if action needed.",
        "expectations": "Wants explanation of results and to know if anything needs to be done"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "symptoms": "No symptoms at all. Feels well in himself.",
        "jaundice": "No yellowing of skin or eyes",
        "itch": "No itching",
        "abdominal_pain": "No abdominal pain",
        "fatigue": "No unusual tiredness",
        "stool_colour": "Normal",
        "urine_colour": "Normal",
        "fever": "No fever",
        "weight_loss": "No unintentional weight loss"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "previous_liver_disease": "No",
        "blood_transfusions": "No",
        "tattoos": "No tattoos or piercings",
        "iv_drug_use": "No"
      },
      "dhx": {
        "regular": "No regular medications",
        "otc": "Occasional paracetamol for headaches (maybe once a month)",
        "herbal_supplements": "No",
        "recent_new_medications": "No"
      },
      "social_hx": {
        "occupation": "IT consultant, works from home",
        "living": "Lives alone in flat",
        "smoking": "Never smoked",
        "alcohol": "Drinks 2-3 times per week, usually 2-3 pints or equivalent. Estimates 12-15 units per week",
        "recreational_drugs": "None",
        "diet": "Mostly takeaways and ready meals. Doesn''t cook much. Eats out frequently",
        "exercise": "Very little. Sedentary job, drives everywhere. Maybe walks 10 minutes to shop once a week",
        "weight": "Not sure of exact weight but knows he''s put on weight over last few years. BMI from health check was 32.5"
      },
      "fhx": {
        "liver_disease": "No family history of liver disease",
        "diabetes": "Father has type 2 diabetes (diagnosed age 65)",
        "other": "No other significant family history"
      }
    },
    "test_results": {
      "alt": 87,
      "alt_range": "10-45 U/L",
      "alp": 52,
      "alp_range": "30-130 U/L",
      "bilirubin": 12,
      "bilirubin_range": "<21 μmol/L",
      "ggt": 89,
      "ggt_range": "<60 U/L",
      "bmi": 32.5,
      "bp": "142/88",
      "other_tests": "All other tests normal (FBC, U&E, HbA1c, TFTs, CRP)"
    }
  }',
  'CALM and RELAXED. Not overly worried. Answer questions directly. If doctor suggests lifestyle changes, show willingness but mention practical challenges (busy work, doesn''t enjoy cooking). If doctor is dismissive or doesn''t explain well, become slightly more concerned. Accept investigations and follow-up plans.',
  'full',
  720,
  'medium',
  ARRAY['Interpret abnormal LFTs in context', 'Assess for symptoms of liver disease', 'Take comprehensive alcohol history', 'Assess risk factors for NAFLD', 'Explain results in patient-friendly terms', 'Plan appropriate investigations', 'Provide lifestyle advice', 'Calculate NAFLD score if appropriate'],
  '## Model Approach

**Key Priorities:**
1. Reassure patient while taking concerns seriously
2. Systematic review of systems (especially liver-related symptoms)
3. Comprehensive alcohol history
4. Assess risk factors (obesity, sedentary lifestyle, diet)
5. Explain results and differential diagnosis
6. Plan investigations and lifestyle interventions

**Differential Diagnosis:**
- Non-alcoholic fatty liver disease (NAFLD) - most likely given BMI 32.5, sedentary lifestyle
- Alcohol-related liver disease (less likely given alcohol intake)
- Drug-induced (unlikely - no medications)
- Other causes (viral hepatitis, autoimmune - need to exclude)

**Management:**
- Further investigations: Hepatitis B & C screen, autoimmune liver screen, AST (for NAFLD score), lipid profile
- Abdominal ultrasound to assess for fatty liver
- Calculate NAFLD score once results available
- Lifestyle advice: Weight loss (5-10% can improve LFTs), healthy diet, reduce processed foods, regular exercise
- Consider Q-risk calculation (given family history of diabetes, raised BP)
- Face-to-face review to examine abdomen, recheck BP
- Safety-netting: Advise to return if develops jaundice, abdominal pain, or other symptoms
- Follow-up in 1-2 weeks to review investigation results',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Systematic review of systems", "Asked about liver-related symptoms", "Obtained comprehensive alcohol history", "Assessed diet and exercise", "Obtained BMI and weight history", "Explored risk factors for NAFLD", "Obtained family history", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Interpreted LFTs appropriately", "Considered NAFLD as likely diagnosis", "Planned appropriate investigations", "Discussed lifestyle interventions", "Addressed weight management", "Considered cardiovascular risk", "Provided clear safety-netting", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Reassured appropriately", "Used clear, non-jargon language", "Explained results in understandable terms", "Listened actively", "Addressed concerns", "Involved patient in management plan", "Demonstrated empathy for lifestyle challenges"]}}'
);

-- =====================================================
-- CASE 3: Child with Ear Discharge (Inspired by ear discharge theme)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Child with Ear Discharge',
  'Paediatrics',
  'PAED-001',
  'You are a GP trainee. A mother, Mrs. Emma Wilson, has booked a telephone consultation about her 5-year-old son, Oliver. The receptionist notes the mother called this morning concerned about ear discharge.',
  '{"name": "Oliver Wilson", "age": 5, "gender": "Male", "parent": "Mrs. Emma Wilson"}',
  '{"patient": "Oliver Wilson", "age": 5, "gender": "Male", "parent": "Mrs. Emma Wilson", "pmh": "Previous episode of otitis media 6 months ago, treated with amoxicillin. No known drug allergies.", "medications": "None currently", "allergies": "No known allergies", "social_summary": "Lives with mother and father, attends primary school", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about my son Oliver. He''s been complaining about his ear for a couple of days and now there''s discharge coming out. I''m worried he might need antibiotics.",
    "freely_given_history": {
      "presenting_complaint": "Oliver developed left ear pain 3 days ago. Yesterday noticed yellowish discharge from left ear. Also has been running a temperature.",
      "psychosocial_impact": "Mother is concerned. Oliver seems generally okay but the discharge is worrying her.",
      "ice": {
        "ideas": "Thinks it might be an ear infection",
        "concerns": "Worried about the discharge and whether he needs antibiotics",
        "expectations": "Wants to know if antibiotics are needed and what to do"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "ear_pain": "Started 3 days ago, left ear. Describes as sore. Was worse yesterday, seems slightly better today",
        "discharge": "Noticed yesterday - yellowish, coming from left ear. Noticed on pillow this morning",
        "fever": "Has been running a temperature. Mother gave Calpol yesterday and this morning. Temperature seems to be coming down",
        "hearing": "Not sure if hearing affected - seems to respond normally",
        "balance": "No balance problems, no dizziness",
        "rash": "No rash",
        "sore_throat": "No sore throat",
        "vomiting": "No vomiting",
        "appetite": "Eating and drinking normally",
        "urine_output": "Passing urine normally",
        "sleep": "Sleeping okay, though woke once last night complaining of ear"
      },
      "pmh": {
        "previous_ear_infections": "Had one episode of ear infection about 6 months ago. Treated with amoxicillin and got better",
        "other_conditions": "Generally healthy child",
        "immunisations": "Up to date with all immunisations"
      },
      "dhx": {
        "current": "None",
        "recent": "Given Calpol yesterday and today for fever",
        "allergies": "No known drug allergies"
      },
      "social_hx": {
        "school": "Attends primary school, year 1",
        "exposure": "No known exposure to other unwell children recently",
        "swimming": "Goes swimming once a week (last went 5 days ago)"
      }
    }
  }',
  'CONCERNED but CALM parent. Answer questions clearly. Show relief if doctor is reassuring. If doctor seems dismissive, become more insistent. Accept treatment plan if explained well. May ask about when child can return to school/swimming.',
  'full',
  720,
  'easy',
  ARRAY['Take focused paediatric history', 'Assess severity of infection', 'Consider differential diagnosis (AOM vs OME with perforation)', 'Explore red flags', 'Appropriate antibiotic prescribing', 'Provide clear safety-netting', 'Address parental concerns'],
  '## Model Approach

**Key Priorities:**
1. Establish rapport with parent
2. Systematic history of ear symptoms
3. Assess for red flags (mastoiditis, complications)
4. Determine if antibiotics indicated
5. Provide clear management plan and safety-netting

**Differential Diagnosis:**
- Acute otitis media with perforation and discharge (most likely)
- Otitis externa
- Chronic suppurative otitis media (less likely given acute presentation)

**Management:**
- Likely needs antibiotics given discharge, fever, and duration
- Consider amoxicillin (if no allergy) or alternative if penicillin allergy
- Advise pain relief (paracetamol/ibuprofen)
- Safety-netting: If worsening pain, spreading redness, facial weakness, or child becomes more unwell - seek urgent medical attention
- Advise to keep ear dry (no swimming until resolved)
- Follow-up if not improving in 48-72 hours
- Consider ENT referral if recurrent episodes',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established presenting complaint", "Explored ear symptoms systematically", "Asked about associated symptoms", "Assessed for red flags", "Obtained previous history", "Explored ICE with parent"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered appropriate diagnosis", "Made appropriate antibiotic decision", "Provided pain relief advice", "Gave clear safety-netting", "Addressed swimming/school", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for parental concern", "Used clear, non-jargon language", "Listened actively", "Addressed concerns appropriately", "Involved parent in decisions", "Maintained professional manner"]}}'
);

-- Continue with more cases...
-- I'll add a few more diverse cases to demonstrate the approach

-- =====================================================
-- CASE 4: Back Pain with Abnormal Blood Test (Inspired by back pain theme)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Back Pain and Blood Test Results',
  'Musculoskeletal',
  'MSK-001',
  'You are a GP trainee. A 52-year-old woman, Mrs. Patricia Martinez, has booked a telephone consultation. She was seen 2 weeks ago for lower back pain and blood tests were arranged. The results show an elevated ESR and CRP.',
  '{"name": "Mrs. Patricia Martinez", "age": 52, "gender": "Female"}',
  '{"patient": "Mrs. Patricia Martinez", "age": 52, "gender": "Female", "pmh": "Hypertension (well controlled), Osteoarthritis of knees", "medications": "Amlodipine 5mg OD, Paracetamol PRN", "allergies": "None known", "social_summary": "Works as a receptionist, non-smoker, occasional alcohol", "family_summary": "Mother: RA, Father: well"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about my back pain and the blood test results. The pain is still there and I got a message to call about the results.",
    "freely_given_history": {
      "presenting_complaint": "Lower back pain for 3 weeks. Still present. Also feeling more tired than usual.",
      "psychosocial_impact": "Pain is affecting her work. Worried about what the blood test results mean.",
      "ice": {
        "ideas": "Wondering if it''s something serious. Worried it might be related to her mother''s rheumatoid arthritis",
        "concerns": "Concerned about the elevated markers. Wants to know if it''s serious",
        "expectations": "Wants explanation of results and treatment for the pain"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "site": "Lower back, central and bilateral",
        "onset": "Started 3 weeks ago, gradual onset",
        "character": "Aching, stiff feeling",
        "radiation": "Radiates to both buttocks, not down legs",
        "severity": "6/10, worse in morning",
        "stiffness": "Stiff for about 30-45 minutes in morning",
        "timing": "Worse in morning, improves with movement",
        "exacerbating": "Worse after rest, better with activity",
        "relieving": "Better with movement, paracetamol helps a bit",
        "associated_symptoms": "Feeling more tired than usual. Some early morning stiffness in shoulders too"
      },
      "pmh": {
        "hypertension": "Well controlled on amlodipine",
        "osteoarthritis": "Knee OA, managed with paracetamol",
        "other": "No other medical conditions"
      },
      "dhx": {
        "regular": "Amlodipine 5mg OD",
        "prn": "Paracetamol 1g QDS for pain",
        "allergies": "None"
      },
      "social_hx": {
        "occupation": "Receptionist, desk-based work",
        "smoking": "Never smoked",
        "alcohol": "2-3 units per week",
        "exercise": "Usually walks 20 minutes daily, but reduced due to pain"
      },
      "fhx": {
        "rheumatoid_arthritis": "Mother has rheumatoid arthritis (diagnosed age 55)",
        "other": "No other significant family history"
      },
      "red_flags": {
        "weight_loss": "No unintentional weight loss",
        "night_pain": "No severe night pain",
        "bowel_bladder": "No bowel or bladder symptoms",
        "saddle_anaesthesia": "No",
        "trauma": "No recent trauma",
        "fever": "No fever",
        "history_cancer": "No"
      }
    },
    "test_results": {
      "esr": 48,
      "esr_range": "<30 mm/hr",
      "crp": 28,
      "crp_range": "<3 mg/L",
      "fbc": "Normal",
      "ue": "Normal",
      "lft": "Normal"
    }
  }',
  'CONCERNED but trying to stay positive. Answer questions clearly. Show increased concern if doctor mentions serious conditions. If reassured appropriately, show relief. May ask about work implications and when she can expect to feel better.',
  'full',
  720,
  'medium',
  ARRAY['Interpret raised inflammatory markers in context', 'Take systematic back pain history', 'Assess for red flags', 'Consider inflammatory causes (polymyalgia, spondyloarthropathy)', 'Explore family history of autoimmune conditions', 'Plan appropriate investigations', 'Provide management plan'],
  '## Model Approach

**Key Priorities:**
1. Acknowledge concerns about results
2. Systematic back pain history with focus on inflammatory features
3. Assess for red flags
4. Consider inflammatory vs mechanical causes
5. Explore family history (mother''s RA)
6. Plan investigations and management

**Differential Diagnosis:**
- Polymyalgia rheumatica (consider given age, morning stiffness, raised markers)
- Inflammatory spondyloarthropathy
- Mechanical back pain with coincidental raised markers
- Other inflammatory conditions

**Management:**
- Further investigations: Rheumatoid factor, anti-CCP, HLA-B27, FBC, U&E, LFTs, bone profile
- Consider trial of steroids if PMR suspected (but need to confirm diagnosis first)
- Pain management: Continue paracetamol, consider NSAID if no contraindications
- Safety-netting: If develops visual symptoms, severe headache, or jaw claudication (GCA symptoms) - seek urgent medical attention
- Follow-up in 1 week to review results and response to treatment
- Consider referral to rheumatology if inflammatory markers remain raised or diagnosis unclear',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established presenting complaint", "Explored back pain systematically (SOCRATES)", "Assessed for inflammatory features", "Screened for red flags", "Obtained PMH", "Explored family history", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Interpreted inflammatory markers appropriately", "Considered inflammatory causes", "Planned appropriate investigations", "Considered PMR as possibility", "Provided pain management", "Gave clear safety-netting (GCA)", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for concerns", "Used clear language to explain results", "Listened actively", "Addressed concerns about seriousness", "Involved patient in decisions", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 5: COPD Exacerbation (Inspired by COPD theme)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'COPD Exacerbation in Smoker',
  'Respiratory',
  'RESP-002',
  'You are a GP trainee. A 68-year-old man, Mr. Robert Singh, has booked an urgent video consultation. He has a history of COPD and is calling because his breathing has worsened over the last few days.',
  '{"name": "Mr. Robert Singh", "age": 68, "gender": "Male"}',
  '{"patient": "Mr. Robert Singh", "age": 68, "gender": "Male", "pmh": "COPD (diagnosed 5 years ago), Hypertension", "medications": "Salmeterol/Fluticasone 50/500 2 puffs BD, Tiotropium 18mcg OD, Ramipril 5mg OD", "allergies": "None known", "social_summary": "Retired factory worker, current smoker (40 pack-years), no alcohol", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Doctor, I''m really struggling with my breathing. It''s been getting worse over the last few days and I''m finding it hard to do anything.",
    "freely_given_history": {
      "presenting_complaint": "Increased breathlessness for 4 days. Worse than usual. Also has more phlegm.",
      "psychosocial_impact": "Unable to do usual activities. Worried about his breathing.",
      "ice": {
        "ideas": "Thinks it might be his COPD playing up",
        "concerns": "Worried it might be serious. Wants to know if he needs to go to hospital",
        "expectations": "Wants treatment to help his breathing"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "breathlessness": "Increased breathlessness for 4 days. Usually manages daily activities, now struggling to walk across room",
        "cough": "Increased cough, productive of yellow-green sputum",
        "sputum": "More sputum than usual, yellow-green colour, thicker than normal",
        "wheeze": "Some wheeze, worse than usual",
        "chest_tightness": "Feels tight in chest",
        "fever": "No fever",
        "associated_symptoms": "Feeling more tired than usual, sleeping propped up on pillows"
      },
      "pmh": {
        "copd": "Diagnosed 5 years ago. Usually stable. Last exacerbation 8 months ago",
        "hospital_admissions": "Admitted once 2 years ago with exacerbation",
        "other": "Hypertension, well controlled"
      },
      "dhx": {
        "regular": "Salmeterol/Fluticasone 50/500 2 puffs BD, Tiotropium 18mcg OD, Ramipril 5mg OD",
        "compliance": "Takes inhalers regularly. Technique checked 6 months ago",
        "rescue": "Has salbutamol inhaler, using more frequently (4-5 times per day instead of usual 1-2)",
        "allergies": "None"
      },
      "social_hx": {
        "smoking": "Current smoker, 20 cigarettes per day for 40 years (40 pack-years). Has tried to quit multiple times",
        "alcohol": "No alcohol",
        "occupation": "Retired factory worker",
        "living": "Lives with wife, has good support"
      },
      "red_flags": {
        "chest_pain": "No chest pain",
        "haemoptysis": "No blood in sputum",
        "drowsiness": "Not drowsy",
        "confusion": "Not confused",
        "cyanosis": "Not aware of blue lips/fingers"
      }
    }
  }',
  'BREATHLESS but trying to speak clearly. Show concern about breathing. If doctor suggests hospital, show reluctance initially but accept if explained well. If doctor addresses smoking, show some defensiveness but may be open to discussion if approached sensitively.',
  'full',
  720,
  'medium',
  ARRAY['Assess severity of COPD exacerbation', 'Take systematic respiratory history', 'Assess for red flags', 'Consider need for antibiotics/steroids', 'Address smoking cessation', 'Provide clear safety-netting', 'Consider hospital admission if severe'],
  '## Model Approach

**Key Priorities:**
1. Assess severity of exacerbation
2. Systematic respiratory history
3. Assess for red flags (indicating severe exacerbation)
4. Determine if antibiotics/steroids needed
5. Address smoking cessation sensitively
6. Clear management plan and safety-netting

**Differential Diagnosis:**
- COPD exacerbation (most likely)
- Lower respiratory tract infection
- Pneumonia
- Heart failure (consider given age, but less likely)

**Management:**
- Assess severity: Moderate exacerbation (increased symptoms, more sputum, but no red flags)
- Antibiotics: Consider if purulent sputum (yellow-green suggests bacterial component)
- Steroids: Oral prednisolone 30mg OD for 5-7 days (standard for moderate-severe exacerbation)
- Increase bronchodilator use: Continue salbutamol PRN, may need nebulised if severe
- Review inhaler technique
- Smoking cessation: Address sensitively, offer support
- Safety-netting: If worsening breathlessness, chest pain, confusion, or unable to manage at home - seek urgent medical attention or call 999
- Follow-up: Review in 48-72 hours or sooner if worsening
- Consider hospital admission if: Severe breathlessness, confusion, cyanosis, or unable to manage at home',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established presenting complaint", "Explored breathlessness systematically", "Assessed sputum characteristics", "Obtained COPD history", "Assessed inhaler compliance", "Screened for red flags", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Assessed severity appropriately", "Considered antibiotics for purulent sputum", "Considered steroids for exacerbation", "Addressed bronchodilator use", "Addressed smoking cessation sensitively", "Provided clear safety-netting", "Arranged appropriate follow-up", "Considered hospital admission if needed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for breathlessness", "Used clear, non-jargon language", "Listened actively", "Addressed concerns appropriately", "Approached smoking sensitively", "Involved patient in decisions", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 6: Type 2 Diabetes - Insulin Initiation Discussion
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Type 2 Diabetes - Considering Insulin',
  'Endocrinology',
  'ENDO-001',
  'You are a GP trainee. A 58-year-old man, Mr. James Mitchell, has booked a video consultation. He has type 2 diabetes and his recent HbA1c is 78 mmol/mol despite being on maximum oral medications.',
  '{"name": "Mr. James Mitchell", "age": 58, "gender": "Male"}',
  '{"patient": "Mr. James Mitchell", "age": 58, "gender": "Male", "pmh": "Type 2 diabetes (diagnosed 8 years ago), Hypertension, Hyperlipidaemia", "medications": "Metformin 1g BD, Gliclazide 160mg BD, Sitagliptin 100mg OD, Ramipril 5mg OD, Atorvastatin 20mg ON", "allergies": "None known", "social_summary": "Retired teacher, non-smoker, occasional alcohol", "family_summary": "Father: T2DM, Mother: well"}',
  '{
    "opening_statement": "Hello doctor, I got a call saying my diabetes results aren''t good and I need to discuss treatment options. I''m a bit worried about what this means.",
    "freely_given_history": {
      "presenting_complaint": "Called following recent HbA1c result of 78. Currently on three diabetes tablets.",
      "psychosocial_impact": "Worried about needing injections. Has heard negative things about insulin.",
      "ice": {
        "ideas": "Thinks insulin means his diabetes is getting worse. Worried about injections.",
        "concerns": "Doesn''t want to inject himself. Worried about side effects. Concerned about impact on daily life.",
        "expectations": "Hopes there might be another tablet option. Wants to understand why insulin is being suggested."
      }
    },
    "history_on_direct_questioning": {
      "diabetes_history": {
        "diagnosis": "Diagnosed 8 years ago",
        "current_medications": "Metformin 1g BD, Gliclazide 160mg BD, Sitagliptin 100mg OD - all at maximum doses",
        "previous_medications": "Tried various combinations over years",
        "compliance": "Takes medications regularly",
        "monitoring": "Checks blood sugars occasionally, usually 10-14 mmol/L",
        "symptoms": "Some increased thirst, passing urine more frequently"
      },
      "complications": {
        "eyes": "Annual eye screening - last one 6 months ago, no retinopathy",
        "feet": "Annual foot check - no problems",
        "kidneys": "Annual bloods - eGFR normal",
        "neuropathy": "No numbness or tingling in feet"
      },
      "lifestyle": {
        "diet": "Tries to watch what he eats but finds it difficult. Eats regular meals",
        "exercise": "Walks 20-30 minutes most days",
        "weight": "BMI 31, has lost 3kg over last year unintentionally"
      },
      "concerns_about_insulin": {
        "injections": "Very worried about having to inject. Has needle phobia",
        "hypoglycaemia": "Worried about going too low",
        "lifestyle": "Concerned about impact on work and social activities",
        "stigma": "Feels insulin means he''s failed"
      }
    }
  }',
  'UNDERSTANDING but WORRIED. Show concern about injections. If doctor explains benefits well and addresses concerns, show gradual acceptance. May ask many questions. If doctor is dismissive of concerns, become more resistant.',
  'full',
  720,
  'hard',
  ARRAY['Explore understanding of diabetes progression', 'Address insulin concerns and misconceptions', 'Explain benefits of insulin', 'Discuss injection technique and support', 'Address hypoglycaemia concerns', 'Explore lifestyle factors', 'Shared decision-making', 'Provide clear information'],
  '## Model Approach

**Key Priorities:**
1. Acknowledge concerns and explore understanding
2. Explain why insulin is being considered (HbA1c 78 despite max oral therapy)
3. Address misconceptions about insulin
4. Discuss practical aspects (injections, monitoring)
5. Explore lifestyle factors that might help
6. Shared decision-making

**Key Points to Address:**
- HbA1c 78 indicates poor control despite maximum oral therapy
- Insulin is a natural progression, not a failure
- Modern insulin pens are easy to use
- Benefits: Better control, reduced risk of complications
- Address needle phobia with support and education
- Discuss hypoglycaemia prevention and recognition
- Consider diabetes specialist nurse referral for education
- Lifestyle review (diet, exercise) should continue alongside

**Management:**
- Refer to diabetes specialist nurse for insulin initiation and education
- Provide written information about insulin
- Arrange follow-up to discuss decision
- Continue oral medications initially (may reduce/stop some with insulin)
- Address lifestyle factors
- Consider psychological support if needle phobia significant',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored diabetes history", "Assessed current control", "Explored understanding of diabetes", "Identified concerns about insulin", "Explored ICE thoroughly", "Assessed lifestyle factors", "Explored complications"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained need for insulin appropriately", "Addressed misconceptions", "Discussed benefits and risks", "Planned appropriate referral (DSN)", "Addressed lifestyle factors", "Provided clear information", "Arranged follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for concerns", "Used clear, non-jargon language", "Listened actively", "Addressed needle phobia sensitively", "Involved patient in shared decision-making", "Maintained supportive manner"]}}'
);

-- =====================================================
-- CASE 7: Abnormal Thyroid Function Tests
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Routine Blood Test - Abnormal Thyroid Function',
  'Endocrinology',
  'ENDO-002',
  'You are a GP trainee. A 34-year-old woman, Ms. Rachel Foster, has booked a telephone consultation. She had routine blood tests done 5 days ago as part of a health check. The results show an elevated TSH with low free T4, consistent with hypothyroidism.',
  '{"name": "Ms. Rachel Foster", "age": 34, "gender": "Female"}',
  '{"patient": "Ms. Rachel Foster", "age": 34, "gender": "Female", "pmh": "No significant past medical history", "medications": "Combined oral contraceptive pill", "allergies": "None known", "social_summary": "Marketing manager, non-smoker, occasional alcohol", "family_summary": "Mother: hypothyroidism, Father: well"}',
  '{
    "opening_statement": "Hi doctor, I got a text about my blood test results. I wasn''t expecting anything to be wrong - I feel fine really, just a bit tired sometimes but I put that down to work.",
    "freely_given_history": {
      "presenting_complaint": "No specific symptoms. Called because received message about abnormal blood results.",
      "psychosocial_impact": "Slightly concerned but not overly worried. Curious about what it means.",
      "ice": {
        "ideas": "Not sure what the results mean. Wondering if it''s something serious.",
        "concerns": "Mild concern. Wants to understand if treatment needed.",
        "expectations": "Wants explanation and to know if anything needs to be done"
      }
    },
    "history_on_direct_questioning": {
      "symptoms": {
        "fatigue": "Has been feeling more tired than usual over last few months, but put it down to work stress",
        "weight": "Gained about 4kg over last year, finds it harder to lose weight",
        "cold_intolerance": "Feels cold more easily than others, especially hands and feet",
        "hair": "Hair seems thinner, more hair loss than usual",
        "skin": "Skin seems drier, especially on elbows",
        "mood": "Feeling a bit low, less motivated",
        "constipation": "More constipated than usual",
        "menstrual": "Periods regular, on COCP",
        "concentration": "Finding it harder to concentrate at work"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "previous_thyroid": "No previous thyroid problems",
        "surgery": "No thyroid surgery",
        "radiotherapy": "No neck radiotherapy"
      },
      "dhx": {
        "regular": "Combined oral contraceptive pill",
        "other": "No other medications",
        "recent_changes": "No recent medication changes"
      },
      "social_hx": {
        "occupation": "Marketing manager, busy job",
        "stress": "Work has been stressful recently",
        "smoking": "Never smoked",
        "alcohol": "2-3 units per week"
      },
      "fhx": {
        "thyroid": "Mother has hypothyroidism (diagnosed age 40), on levothyroxine",
        "autoimmune": "No other autoimmune conditions in family"
      }
    },
    "test_results": {
      "tsh": 18.5,
      "tsh_range": "0.4-4.0 mU/L",
      "ft4": 8.2,
      "ft4_range": "9.0-25.0 pmol/L",
      "ft3": "Not done",
      "tpo_antibodies": "Not done"
    }
  }',
  'CALM but CURIOUS. Answer questions directly. Show interest in understanding the condition. If doctor explains well, show understanding. Accept treatment plan if explained appropriately.',
  'full',
  720,
  'medium',
  ARRAY['Interpret thyroid function tests', 'Take systematic history of hypothyroid symptoms', 'Assess for symptoms', 'Explore family history', 'Explain condition in patient-friendly terms', 'Plan appropriate treatment', 'Discuss monitoring'],
  '## Model Approach

**Key Priorities:**
1. Reassure while taking results seriously
2. Systematic review of hypothyroid symptoms
3. Explore family history (mother has hypothyroidism)
4. Explain condition and results
5. Discuss treatment with levothyroxine
6. Plan monitoring

**Differential Diagnosis:**
- Primary hypothyroidism (most likely - elevated TSH, low T4)
- Autoimmune thyroiditis (Hashimoto''s) - likely given family history
- Other causes less common

**Management:**
- Start levothyroxine - typically 50-100mcg OD, start lower if elderly/cardiac disease (not applicable here)
- Check TPO antibodies to confirm autoimmune cause
- Explain need for lifelong treatment
- Monitor TSH in 6-8 weeks and titrate dose
- Once stable, monitor annually
- Advise to take on empty stomach, 30 minutes before food
- Safety-netting: If develops chest pain, palpitations, or other symptoms - seek medical attention
- Follow-up in 6-8 weeks to check TSH and adjust dose',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Systematic review of hypothyroid symptoms", "Explored fatigue, weight, cold intolerance", "Asked about hair, skin, mood changes", "Obtained family history", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Interpreted thyroid function tests correctly", "Diagnosed hypothyroidism", "Planned levothyroxine treatment", "Discussed TPO antibodies", "Explained monitoring requirements", "Provided clear safety-netting", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Reassured appropriately", "Used clear, non-jargon language", "Explained condition well", "Listened actively", "Addressed concerns", "Involved patient in decisions"]}}'
);

-- =====================================================
-- CASE 8: Hair Loss in Young Female
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Hair Loss in Young Woman',
  'Dermatology',
  'DERM-001',
  'You are a GP trainee. A 24-year-old woman, Ms. Chloe Anderson, has booked a video consultation. She is concerned about hair loss that has been getting worse over the last 6 months.',
  '{"name": "Ms. Chloe Anderson", "age": 24, "gender": "Female"}',
  '{"patient": "Ms. Chloe Anderson", "age": 24, "gender": "Female", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "University student, non-smoker, no alcohol", "family_summary": "Mother: alopecia areata in past, Father: well"}',
  '{
    "opening_statement": "Hi doctor, I''m really worried about my hair. It''s been falling out a lot over the last few months and I don''t know what''s causing it. I''m starting to get really self-conscious about it.",
    "freely_given_history": {
      "presenting_complaint": "Hair loss for 6 months, getting worse. Noticed more hair in shower, on brush, on pillow.",
      "psychosocial_impact": "Very distressed. Affecting confidence. Avoiding social situations. Worried about appearance.",
      "ice": {
        "ideas": "Worried it might be something serious. Wondering if it''s stress or diet related.",
        "concerns": "Scared it might be permanent. Worried about going bald. Concerned about what others think.",
        "expectations": "Wants to know the cause and if it can be treated"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "onset": "Started about 6 months ago, gradual",
        "pattern": "Generalised thinning, all over scalp. Not patchy",
        "amount": "Losing a lot of hair daily - estimates 100-200 hairs per day",
        "scalp": "No itching, no scaling, no redness",
        "hair_quality": "Hair feels thinner, more brittle",
        "eyebrows": "Eyebrows normal",
        "body_hair": "Body hair normal",
        "nails": "Nails seem normal"
      },
      "triggers": {
        "stress": "University has been stressful - final year, exams, dissertation",
        "diet": "Trying to eat healthily but sometimes skips meals when busy",
        "illness": "No recent illness",
        "surgery": "No recent surgery",
        "medications": "No recent medication changes"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "thyroid": "No known thyroid problems",
        "anaemia": "No known anaemia",
        "autoimmune": "No autoimmune conditions"
      },
      "menstrual": {
        "periods": "Regular periods, every 28-30 days",
        "contraception": "Not on any contraception",
        "pcos": "No symptoms of PCOS"
      },
      "social_hx": {
        "occupation": "Final year university student",
        "stress": "Very stressed with final year, exams, job applications",
        "diet": "Sometimes restrictive when stressed, tries to eat well",
        "exercise": "Moderate exercise"
      },
      "fhx": {
        "hair_loss": "Mother had alopecia areata in her 30s, recovered",
        "other": "No other significant family history"
      }
    }
  }',
  'DISTRESSED and ANXIOUS. Show emotional impact. If doctor is empathetic and thorough, show some relief. If doctor is dismissive, become more upset. May ask many questions about treatment options.',
  'full',
  720,
  'medium',
  ARRAY['Take systematic history of hair loss', 'Assess pattern (diffuse vs patchy)', 'Explore triggers (stress, diet, illness)', 'Assess for underlying causes', 'Explore psychosocial impact', 'Plan appropriate investigations', 'Provide management plan', 'Address concerns sensitively'],
  '## Model Approach

**Key Priorities:**
1. Acknowledge distress and explore impact
2. Systematic history of hair loss pattern
3. Assess for triggers (stress, diet, illness)
4. Screen for underlying medical causes
5. Plan appropriate investigations
6. Provide management plan and support

**Differential Diagnosis:**
- Telogen effluvium (most likely - diffuse, stress-related, 6 months duration)
- Female pattern hair loss (androgenetic alopecia)
- Iron deficiency anaemia
- Thyroid dysfunction
- Other causes (less likely)

**Management:**
- Investigations: FBC (especially ferritin), TFTs, consider zinc, vitamin D
- Address stress: Discuss stress management, consider counselling if significant
- Diet: Ensure adequate nutrition, iron-rich foods
- Topical treatments: Consider minoxidil if appropriate (after investigations)
- Reassurance: Telogen effluvium often resolves with time and addressing triggers
- Follow-up: Review in 3 months with investigation results
- Consider dermatology referral if diagnosis unclear or not improving',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established presenting complaint", "Explored pattern of hair loss", "Assessed for triggers", "Screened for underlying causes", "Explored psychosocial impact", "Obtained relevant history", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered telogen effluvium", "Planned appropriate investigations", "Addressed stress and lifestyle", "Discussed treatment options", "Provided reassurance", "Arranged appropriate follow-up", "Considered referral if needed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for distress", "Used clear, supportive language", "Listened actively", "Addressed concerns sensitively", "Involved patient in decisions", "Maintained professional, caring manner"]}}'
);

-- =====================================================
-- CASE 9: Depression and Firearms Concern
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Mental Health Concerns - Depression Assessment',
  'Mental Health',
  'MH-001',
  'You are a GP trainee. A 45-year-old man, Mr. Thomas Wright, has booked a video consultation. He has been feeling low for several months and mentions he has access to firearms (he is a member of a shooting club).',
  '{"name": "Mr. Thomas Wright", "age": 45, "gender": "Male"}',
  '{"patient": "Mr. Thomas Wright", "age": 45, "gender": "Male", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "Factory worker, recently separated, lives alone", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Doctor, I''ve been feeling really down for a while now. Things just don''t seem to be getting better. I don''t know what to do.",
    "freely_given_history": {
      "presenting_complaint": "Low mood for 4-5 months. Getting worse. Feeling hopeless.",
      "psychosocial_impact": "Struggling with daily activities. Isolated. Not sleeping well.",
      "ice": {
        "ideas": "Thinks he might be depressed. Not sure what help is available.",
        "concerns": "Worried things won''t get better. Feeling hopeless.",
        "expectations": "Wants help to feel better"
      }
    },
    "history_on_direct_questioning": {
      "mood": {
        "low_mood": "Feeling low most days, for most of the day",
        "anhedonia": "Not enjoying things he used to enjoy",
        "hopelessness": "Feels hopeless about the future",
        "worthlessness": "Feels like a failure",
        "guilt": "Feels guilty about relationship breakdown"
      },
      "biological": {
        "sleep": "Difficulty falling asleep, waking early, not feeling rested",
        "appetite": "Reduced appetite, lost 5kg unintentionally",
        "energy": "Very low energy, struggling to get through day",
        "concentration": "Poor concentration at work",
        "libido": "Reduced libido"
      },
      "risk_assessment": {
        "suicidal_thoughts": "Has had thoughts that life isn''t worth living, but denies active plans",
        "self_harm": "No history of self-harm",
        "hopelessness": "Feels hopeless",
        "access_means": "Has access to firearms (shooting club member, keeps guns at home)",
        "previous_attempts": "No previous suicide attempts",
        "protective_factors": "Has some friends, enjoys shooting (though less recently)"
      },
      "triggers": {
        "relationship": "Separated from partner 6 months ago after 15-year relationship",
        "work": "Work is okay, no major issues",
        "other": "Feeling isolated since separation"
      },
      "pmh": {
        "mental_health": "No previous mental health problems",
        "medical": "No medical conditions"
      },
      "social_hx": {
        "living": "Lives alone since separation",
        "support": "Some friends, but feels isolated",
        "alcohol": "Drinking more than usual - 3-4 beers most evenings",
        "substances": "No recreational drugs"
      }
    }
  }',
  'LOW MOOD but ENGAGED. Show some hope that things can improve. If doctor addresses firearms sensitively, be cooperative. If doctor is judgmental, become defensive. Show willingness to accept help.',
  'full',
  720,
  'hard',
  ARRAY['Assess depression systematically', 'Conduct thorough risk assessment', 'Assess access to means (firearms)', 'Explore protective factors', 'Address firearms safety', 'Plan appropriate treatment', 'Consider crisis support', 'Document risk assessment'],
  '## Model Approach

**Key Priorities:**
1. Assess depression systematically (PHQ-9 if appropriate)
2. **CRITICAL: Assess suicide risk thoroughly**
3. **CRITICAL: Address firearms access - safety concern**
4. Explore protective factors
5. Plan treatment and safety measures
6. Consider crisis team if high risk

**Risk Assessment:**
- Suicidal ideation present (thoughts life not worth living)
- Access to means (firearms) - SIGNIFICANT RISK FACTOR
- Hopelessness present
- Recent relationship breakdown (trigger)
- No active plans stated, but access to lethal means increases risk

**Management:**
- **URGENT: Address firearms safety**
  - Discuss temporary removal/storage of firearms
  - Consider involving shooting club
  - Document clearly
- Treatment: Consider antidepressant (SSRI) if appropriate
- Psychological support: Refer to IAPT/counselling
- Safety plan: Develop with patient
- Follow-up: Arrange urgent follow-up (within 1 week)
- Consider crisis team if risk high
- Document risk assessment clearly
- Consider involving family/friends if patient agrees

**Important:** Access to firearms with suicidal ideation is a significant risk factor requiring careful management.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed depression systematically", "Explored mood, biological symptoms", "Conducted thorough risk assessment", "Assessed access to means (firearms)", "Explored protective factors", "Explored triggers", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed firearms safety appropriately", "Planned appropriate treatment", "Considered crisis support if needed", "Developed safety plan", "Arranged urgent follow-up", "Documented risk clearly"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy", "Approached firearms issue sensitively", "Built rapport", "Listened actively", "Addressed concerns", "Involved patient in safety planning", "Maintained non-judgmental approach"]}}'
);

-- =====================================================
-- CASE 10: Hypercalcaemia in Older Female
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Abnormal Calcium Results in Older Woman',
  'Endocrinology',
  'ENDO-003',
  'You are a GP trainee. A 72-year-old woman, Mrs. Margaret Harris, has booked a telephone consultation. She had routine blood tests done 4 days ago. The results show an elevated corrected calcium level of 2.85 mmol/L. She has a history of breast cancer treated 8 years ago.',
  '{"name": "Mrs. Margaret Harris", "age": 72, "gender": "Female"}',
  '{"patient": "Mrs. Margaret Harris", "age": 72, "gender": "Female", "pmh": "Breast cancer (treated 8 years ago - surgery and chemotherapy), Osteoporosis, Hypertension", "medications": "Alendronate 70mg weekly, Ramipril 5mg OD, Calcium and vitamin D supplements", "allergies": "None known", "social_summary": "Retired teacher, lives with husband, non-smoker, no alcohol", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I got a message about my blood test results. I wasn''t expecting anything to be wrong. Is everything okay?",
    "freely_given_history": {
      "presenting_complaint": "No specific symptoms. Called because received message about abnormal blood results.",
      "psychosocial_impact": "Slightly concerned, especially given her cancer history.",
      "ice": {
        "ideas": "Worried it might be related to her previous cancer. Hoping it''s nothing serious.",
        "concerns": "Concerned about cancer recurrence. Wants to understand what the results mean.",
        "expectations": "Wants explanation and to know if further tests needed"
      }
    },
    "history_on_direct_questioning": {
      "symptoms": {
        "bones": "No bone pain",
        "kidneys": "No kidney stones, passing urine normally",
        "abdominal": "No abdominal pain, no constipation",
        "mental": "Feeling well mentally, no confusion",
        "thirst": "No excessive thirst",
        "urine": "Passing urine normally, no increased frequency",
        "weakness": "No muscle weakness",
        "fatigue": "Feeling well, no unusual tiredness"
      },
      "pmh": {
        "cancer": "Breast cancer diagnosed 8 years ago. Had surgery (mastectomy) and chemotherapy. Regular follow-up with oncology, last review 6 months ago - all clear",
        "osteoporosis": "Diagnosed 5 years ago, on alendronate",
        "hypertension": "Well controlled on ramipril"
      },
      "dhx": {
        "regular": "Alendronate 70mg weekly, Ramipril 5mg OD",
        "supplements": "Takes calcium 1000mg and vitamin D 800 units daily (prescribed for osteoporosis)",
        "other": "No other medications"
      },
      "social_hx": {
        "occupation": "Retired teacher",
        "living": "Lives with husband, good support",
        "diet": "Normal diet"
      }
    },
    "test_results": {
      "corrected_calcium": 2.85,
      "corrected_calcium_range": "2.20-2.60 mmol/L",
      "phosphate": "Normal",
      "albumin": "Normal",
      "parathyroid_hormone": "Not done",
      "vitamin_d": "Not done",
      "creatinine": "Normal",
      "egfr": "Normal"
    }
  }',
  'CALM but CONCERNED. Show worry about cancer history. If doctor explains well and addresses cancer concerns, show some relief. Accept investigations if explained appropriately.',
  'full',
  720,
  'hard',
  ARRAY['Interpret hypercalcaemia', 'Assess for symptoms', 'Consider causes (malignancy, hyperparathyroidism, medications)', 'Explore cancer history', 'Assess medication contributions', 'Plan appropriate investigations', 'Address concerns about cancer'],
  '## Model Approach

**Key Priorities:**
1. Acknowledge concerns, especially given cancer history
2. Assess for symptoms of hypercalcaemia
3. Consider causes (malignancy, primary hyperparathyroidism, medications)
4. Review medications (calcium supplements, alendronate)
5. Plan investigations
6. Address cancer concerns appropriately

**Differential Diagnosis:**
- Primary hyperparathyroidism (most common cause of hypercalcaemia)
- Malignancy (consider given breast cancer history, but less likely if well and 8 years post-treatment)
- Medication-related (calcium supplements may contribute)
- Other causes (less likely)

**Management:**
- Further investigations:
  - Parathyroid hormone (PTH) - if elevated with high calcium = primary hyperparathyroidism
  - Vitamin D level
  - Consider PTH-related peptide if malignancy suspected
  - Consider imaging if malignancy suspected (but less likely given history)
- Review medications: Consider reducing/stopping calcium supplements temporarily (discuss with patient)
- Safety-netting: If develops symptoms (bone pain, kidney stones, confusion, excessive thirst) - seek urgent medical attention
- Follow-up: Review in 1-2 weeks with investigation results
- Consider endocrinology referral if primary hyperparathyroidism confirmed
- Reassure about cancer history while taking results seriously',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Systematic review of hypercalcaemia symptoms", "Explored bone, kidney, abdominal symptoms", "Assessed mental state", "Obtained cancer history", "Reviewed medications", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Interpreted hypercalcaemia appropriately", "Considered primary hyperparathyroidism", "Considered malignancy appropriately", "Reviewed medication contributions", "Planned appropriate investigations", "Addressed cancer concerns", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for cancer concerns", "Used clear, reassuring language", "Listened actively", "Addressed concerns appropriately", "Involved patient in decisions", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 11: Jaundice in Returning Traveller
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Jaundice After Travel',
  'Gastroenterology',
  'GI-002',
  'You are a GP trainee. A 29-year-old man, Mr. Liam O''Connor, has booked an urgent video consultation. He returned from a 3-week backpacking trip to Southeast Asia 2 weeks ago and has developed jaundice.',
  '{"name": "Mr. Liam O''Connor", "age": 29, "gender": "Male"}',
  '{"patient": "Mr. Liam O''Connor", "age": 29, "gender": "Male", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "Software developer, recently returned from travel", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Doctor, I''m really worried. I got back from Thailand and Vietnam a couple of weeks ago and now my eyes and skin have gone yellow. I feel really unwell.",
    "freely_given_history": {
      "presenting_complaint": "Jaundice noticed 3 days ago. Also feeling very tired, nauseous, and have lost my appetite.",
      "psychosocial_impact": "Very worried. Concerned it might be something serious from travel.",
      "ice": {
        "ideas": "Worried it might be hepatitis or something from the food/water abroad.",
        "concerns": "Scared it might be serious. Wants to know if he needs to go to hospital.",
        "expectations": "Wants to know what''s wrong and get treatment"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "jaundice": "Noticed yellowing of eyes 3 days ago, then skin. Getting worse",
        "urine": "Urine is very dark, like tea",
        "stools": "Stools are pale, clay-coloured",
        "itch": "Very itchy skin, especially at night",
        "fever": "Had fever on and off for last week",
        "abdominal_pain": "Right upper quadrant discomfort, not severe",
        "nausea": "Feeling nauseous, reduced appetite",
        "fatigue": "Very tired, struggling to work"
      },
      "travel_history": {
        "destination": "Thailand and Vietnam for 3 weeks, returned 2 weeks ago",
        "duration": "3 weeks total",
        "vaccinations": "Had travel vaccinations before trip (typhoid, hepatitis A)",
        "food_water": "Ate street food, drank bottled water mostly but had some ice in drinks",
        "activities": "Went swimming, visited rural areas",
        "illness_abroad": "Had some diarrhoea during trip, resolved",
        "malaria_prophylaxis": "Did not take malaria prophylaxis (not recommended for those areas)"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "liver_disease": "No previous liver problems",
        "blood_transfusions": "No",
        "tattoos": "No tattoos or piercings",
        "iv_drug_use": "No"
      },
      "social_hx": {
        "alcohol": "Social drinker, 5-10 units per week, stopped since feeling unwell",
        "smoking": "Never smoked",
        "recreational_drugs": "None"
      }
    }
  }',
  'UNWELL and WORRIED. Show concern about travel-related illness. If doctor takes travel history seriously, show relief. Accept urgent referral if explained well.',
  'full',
  720,
  'hard',
  ARRAY['Take comprehensive travel history', 'Assess for travel-related infections', 'Consider viral hepatitis (A, B, E)', 'Assess severity of jaundice', 'Screen for complications', 'Plan appropriate investigations', 'Consider urgent referral', 'Provide safety-netting'],
  '## Model Approach

**Key Priorities:**
1. Assess severity of jaundice and general condition
2. **CRITICAL: Comprehensive travel history**
3. Consider travel-related infections (hepatitis A, B, E, malaria, leptospirosis)
4. Assess for complications (acute liver failure)
5. Plan urgent investigations
6. Consider hospital referral

**Differential Diagnosis:**
- Hepatitis A (most likely - travel to endemic area, jaundice, dark urine, pale stools)
- Hepatitis E (consider - similar presentation, travel-related)
- Hepatitis B (less likely - would need exposure)
- Other travel-related infections (malaria, leptospirosis - less likely given presentation)
- Drug-induced (consider if took medications abroad)

**Management:**
- **URGENT: Assess for acute liver failure**
  - Check for encephalopathy, coagulopathy, hypoglycaemia
  - If signs of liver failure - urgent hospital admission
- Investigations: LFTs (likely already very abnormal), hepatitis serology (A, B, C, E), FBC, clotting, glucose
- Consider hospital referral for monitoring if severe
- Advise rest, avoid alcohol, maintain hydration
- Contact tracing: May need to notify public health if hepatitis A confirmed
- Safety-netting: If becomes confused, bleeding, or more unwell - seek urgent medical attention
- Follow-up: Review urgently with results',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed jaundice systematically", "Explored travel history comprehensively", "Assessed for complications", "Obtained vaccination history", "Explored food/water exposure", "Screened for other symptoms", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered travel-related infections", "Assessed for liver failure", "Planned appropriate investigations", "Considered urgent referral", "Addressed contact tracing", "Provided clear safety-netting", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for worry", "Used clear, reassuring language", "Listened actively", "Addressed travel concerns", "Involved patient in decisions", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 12: Insomnia in Child
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Sleep Problems in Young Child',
  'Paediatrics',
  'PAED-002',
  'You are a GP trainee. A mother, Mrs. Jennifer Taylor, has booked a telephone consultation about her 7-year-old daughter, Mia. Mia has been having difficulty sleeping for the last 3 months, which is affecting the whole family.',
  '{"name": "Mia Taylor", "age": 7, "gender": "Female", "parent": "Mrs. Jennifer Taylor"}',
  '{"patient": "Mia Taylor", "age": 7, "gender": "Female", "parent": "Mrs. Jennifer Taylor", "pmh": "Generally healthy child, no medical conditions", "medications": "None", "allergies": "No known allergies", "social_summary": "Lives with mother and father, attends primary school", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about my daughter Mia. She''s been having real trouble sleeping for the last few months and it''s affecting all of us. We''re all exhausted.",
    "freely_given_history": {
      "presenting_complaint": "Mia has been having difficulty falling asleep and waking frequently at night for 3 months. Getting worse.",
      "psychosocial_impact": "Affecting whole family. Parents exhausted. Mia tired during day, affecting school.",
      "ice": {
        "ideas": "Wondering if it''s anxiety or something medical. Not sure what''s causing it.",
        "concerns": "Worried about impact on Mia''s health and school. Concerned about using medication.",
        "expectations": "Wants to know the cause and how to help Mia sleep better"
      }
    },
    "history_on_direct_questioning": {
      "sleep_pattern": {
        "bedtime": "Goes to bed at 8pm, but takes 1-2 hours to fall asleep",
        "falling_asleep": "Lies awake, says she can''t switch off her brain",
        "waking": "Wakes 2-3 times per night, comes into parents'' room",
        "waking_time": "Wakes early, around 5:30am, struggles to get back to sleep",
        "total_sleep": "Probably getting 6-7 hours total, should be getting 9-11 hours",
        "naps": "No daytime naps"
      },
      "daytime_impact": {
        "tiredness": "Very tired during day, yawning, struggling to concentrate",
        "school": "Teacher has noticed she''s less focused, more irritable",
        "behaviour": "More irritable, emotional, having tantrums",
        "activities": "Still wants to do activities but gets tired quickly"
      },
      "potential_causes": {
        "anxiety": "Started new school year 4 months ago. Seems to worry about school, friends, making mistakes",
        "routine": "Bedtime routine is consistent, but Mia resists it",
        "screens": "Has tablet before bed sometimes (parents trying to reduce this)",
        "caffeine": "No caffeine",
        "bedroom": "Shares room with 5-year-old sister, who sleeps fine",
        "noise": "Room is quiet, dark",
        "bed": "Comfortable bed, no physical discomfort"
      },
      "pmh": {
        "medical": "No medical conditions",
        "medications": "None",
        "allergies": "None"
      },
      "social_hx": {
        "school": "Year 2, started new school year 4 months ago",
        "friends": "Has some friends but worries about fitting in",
        "family": "Lives with parents and younger sister. Parents recently had some arguments (trying to keep it from children)"
      }
    }
  }',
  'TIRED and FRUSTRATED parent. Show impact on family. If doctor addresses anxiety sensitively, show relief. If doctor is dismissive, become more insistent. May ask about medication options.',
  'full',
  720,
  'medium',
  ARRAY['Take systematic sleep history', 'Assess daytime impact', 'Explore potential causes (anxiety, routine, screens)', 'Assess for underlying medical causes', 'Address sleep hygiene', 'Consider anxiety management', 'Provide behavioural strategies', 'Address parental concerns'],
  '## Model Approach

**Key Priorities:**
1. Acknowledge impact on family
2. Systematic sleep history
3. Assess daytime impact
4. Explore potential causes (anxiety, routine, environmental)
5. Address sleep hygiene
6. Consider anxiety management
7. Provide behavioural strategies

**Differential Diagnosis:**
- Anxiety-related insomnia (most likely - new school, worries, difficulty switching off)
- Poor sleep hygiene (screens, routine issues)
- Behavioural insomnia
- Other causes (less likely - no medical symptoms)

**Management:**
- Sleep hygiene:
  - Consistent bedtime routine (calm activities before bed)
  - No screens 1 hour before bed
  - Bedroom environment (dark, quiet, comfortable)
  - Regular wake time
- Address anxiety:
  - Explore worries with Mia
  - Consider relaxation techniques (breathing, mindfulness for children)
  - Worry box/journal before bed
  - Consider school support if anxiety is school-related
- Behavioural strategies:
  - Graduated extinction if needed
  - Reward chart for staying in bed
  - Return to bed calmly if wakes
- Family support:
  - Ensure parents have support
  - Consider parenting support if needed
- Follow-up: Review in 2-3 weeks
- Consider CAMHS referral if anxiety significant or not improving',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic sleep history", "Assessed daytime impact", "Explored potential causes", "Assessed for anxiety", "Explored sleep hygiene", "Obtained relevant history", "Explored ICE with parent"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed sleep hygiene", "Considered anxiety management", "Provided behavioural strategies", "Addressed family impact", "Arranged appropriate follow-up", "Considered referral if needed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for family impact", "Used clear, supportive language", "Listened actively", "Addressed parental concerns", "Involved parent in management", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 13: Hyponatraemia in Older Male
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Low Sodium Levels in Elderly Patient',
  'Endocrinology',
  'ENDO-004',
  'You are a GP trainee. A 78-year-old man, Mr. Arthur Brown, has booked a telephone consultation. He had routine blood tests done 3 days ago following a fall. The results show a sodium level of 128 mmol/L.',
  '{"name": "Mr. Arthur Brown", "age": 78, "gender": "Male"}',
  '{"patient": "Mr. Arthur Brown", "age": 78, "gender": "Male", "pmh": "Hypertension, Heart failure (mild), Previous stroke 3 years ago", "medications": "Ramipril 5mg OD, Furosemide 40mg OD, Aspirin 75mg OD, Atorvastatin 20mg ON", "allergies": "None known", "social_summary": "Lives alone, independent, non-smoker, no alcohol", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I got a message about my blood test results. I had a bit of a fall last week and they did some tests. Is everything okay?",
    "freely_given_history": {
      "presenting_complaint": "Fell at home 5 days ago, went to A&E. No serious injury but had blood tests. Called about results.",
      "psychosocial_impact": "Slightly concerned but feeling well.",
      "ice": {
        "ideas": "Not sure what the results mean. Hoping it''s nothing serious.",
        "concerns": "Mild concern. Wants to understand if treatment needed.",
        "expectations": "Wants explanation and to know if anything needs to be done"
      }
    },
    "history_on_direct_questioning": {
      "symptoms": {
        "confusion": "No confusion, feeling mentally clear",
        "nausea": "No nausea",
        "headache": "No headache",
        "weakness": "Feeling a bit weaker than usual, but put it down to age",
        "falls": "Had fall 5 days ago - tripped on rug at home. No loss of consciousness",
        "dizziness": "Occasional dizziness, especially on standing",
        "thirst": "Not particularly thirsty",
        "urine": "Passing urine normally"
      },
      "pmh": {
        "heart_failure": "Mild heart failure, well controlled",
        "hypertension": "Well controlled on ramipril",
        "stroke": "Had stroke 3 years ago, made good recovery, no residual deficits",
        "other": "No other medical conditions"
      },
      "dhx": {
        "regular": "Ramipril 5mg OD, Furosemide 40mg OD, Aspirin 75mg OD, Atorvastatin 20mg ON",
        "compliance": "Takes medications regularly",
        "recent_changes": "No recent medication changes"
      },
      "social_hx": {
        "living": "Lives alone, manages independently",
        "diet": "Eats reasonably well, sometimes forgets to eat",
        "fluid_intake": "Drinks tea and water, probably 1-1.5L per day",
        "alcohol": "No alcohol"
      }
    },
    "test_results": {
      "sodium": 128,
      "sodium_range": "135-145 mmol/L",
      "potassium": 4.2,
      "potassium_range": "3.5-5.0 mmol/L",
      "urea": 8.5,
      "urea_range": "2.5-7.8 mmol/L",
      "creatinine": 145,
      "creatinine_range": "60-110 μmol/L",
      "egfr": 38,
      "glucose": "Normal",
      "tsh": "Normal"
    }
  }',
  'CALM and COOPERATIVE. Answer questions clearly. Show some concern if doctor mentions serious causes. Accept investigations and treatment if explained well.',
  'full',
  720,
  'hard',
  ARRAY['Interpret hyponatraemia', 'Assess for symptoms', 'Consider causes (SIADH, heart failure, medications, dehydration)', 'Review medications (diuretics, ACE inhibitors)', 'Assess fluid status', 'Plan appropriate investigations', 'Consider medication review'],
  '## Model Approach

**Key Priorities:**
1. Assess for symptoms of hyponatraemia
2. Review medications (diuretics, ACE inhibitors can cause hyponatraemia)
3. Consider causes (SIADH, heart failure, medications, dehydration)
4. Assess fluid status
5. Plan investigations
6. Consider medication review

**Differential Diagnosis:**
- Medication-related (diuretics + ACE inhibitor combination - likely contributing)
- SIADH (consider - can be caused by various conditions including stroke history)
- Heart failure-related (less likely if well controlled)
- Dehydration (unlikely given presentation)
- Other causes

**Management:**
- Further investigations:
  - Urine osmolality, urine sodium
  - Cortisol, TSH (already normal)
  - Consider chest X-ray if SIADH suspected
- Medication review:
  - Consider reducing/stopping furosemide if appropriate (discuss with patient)
  - Monitor closely if changing medications
- Fluid restriction may be needed if SIADH confirmed
- Safety-netting: If develops confusion, seizures, or worsening symptoms - seek urgent medical attention
- Follow-up: Review in 1 week with investigation results
- Consider endocrinology referral if SIADH confirmed or unclear cause',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Systematic review of hyponatraemia symptoms", "Assessed for confusion, weakness", "Reviewed medications carefully", "Assessed fluid status", "Obtained relevant history", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Interpreted hyponatraemia appropriately", "Considered medication causes", "Considered SIADH", "Planned appropriate investigations", "Considered medication review", "Provided clear safety-netting", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Reassured appropriately", "Used clear, non-jargon language", "Listened actively", "Addressed concerns", "Involved patient in decisions", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 14: Rectal Bleeding in Adult with Learning Disability
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Rectal Bleeding Consultation',
  'Gastroenterology',
  'GI-003',
  'You are a GP trainee. A support worker has booked a telephone consultation on behalf of Mr. Daniel Clarke, a 32-year-old man with a learning disability. The support worker reports that Mr. Clarke has noticed blood when he goes to the toilet over the last few days.',
  '{"name": "Mr. Daniel Clarke", "age": 32, "gender": "Male", "support": "Support worker present"}',
  '{"patient": "Mr. Daniel Clarke", "age": 32, "gender": "Male", "pmh": "Learning disability (moderate), Constipation (chronic)", "medications": "Lactulose 15ml BD, Senna 2 tablets ON", "allergies": "None known", "social_summary": "Lives in supported accommodation, has 1:1 support", "family_summary": "Mother involved in care, no significant family history"}',
  '{
    "opening_statement": "Hello doctor, I''m calling on behalf of Daniel. He''s been seeing blood when he goes to the toilet and we''re a bit worried about it. Daniel is here with me and can answer questions himself.",
    "freely_given_history": {
      "presenting_complaint": "Noticed blood when passing stool for last 4-5 days. Bright red blood, on tissue paper and in toilet.",
      "psychosocial_impact": "Daniel is worried but finding it hard to express. Support worker concerned.",
      "ice": {
        "ideas": "Not sure what''s causing it. Worried it might be serious.",
        "concerns": "Scared about what it might mean. Wants to know if he needs to see a doctor in person.",
        "expectations": "Wants to know what to do"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "bleeding": "Bright red blood, noticed for 4-5 days",
        "amount": "Small amount, mainly on tissue paper, some in toilet bowl",
        "frequency": "Every time he goes to toilet",
        "pain": "No pain when passing stool",
        "stool_consistency": "Stools are hard, difficult to pass",
        "straining": "Has to strain a lot to pass stool",
        "associated_symptoms": "No abdominal pain, no weight loss, no change in appetite"
      },
      "bowel_history": {
        "frequency": "Usually goes every 2-3 days, sometimes longer",
        "constipation": "Has always had problems with constipation",
        "diet": "Eats reasonably well but doesn''t like vegetables much",
        "fluid": "Drinks water and juice, probably 1-1.5L per day"
      },
      "pmh": {
        "learning_disability": "Moderate learning disability, lives in supported accommodation",
        "constipation": "Chronic constipation, on regular laxatives",
        "other": "No other medical conditions"
      },
      "dhx": {
        "regular": "Lactulose 15ml BD, Senna 2 tablets ON",
        "compliance": "Takes medications with support",
        "recent_changes": "No recent changes"
      },
      "red_flags": {
        "weight_loss": "No weight loss",
        "abdominal_pain": "No abdominal pain",
        "change_bowel_habit": "No change in frequency (always been constipated)",
        "family_history": "No family history of bowel cancer"
      }
    }
  }',
  'SUPPORT WORKER: Helpful, wants to ensure Daniel''s voice is heard. DANIEL: May need simple language, may be anxious. Answer questions with support worker''s help. Show relief if doctor explains clearly.',
  'full',
  720,
  'medium',
  ARRAY['Communicate effectively with patient with learning disability', 'Take history with support worker assistance', 'Assess rectal bleeding systematically', 'Consider likely causes (haemorrhoids, anal fissure)', 'Screen for red flags', 'Provide clear, simple explanations', 'Plan appropriate management'],
  '## Model Approach

**Key Priorities:**
1. Ensure patient can participate in consultation
2. Use simple, clear language
3. Systematic history of rectal bleeding
4. Assess for red flags
5. Consider likely causes (haemorrhoids, anal fissure from constipation)
6. Clear management plan

**Differential Diagnosis:**
- Haemorrhoids (most likely - bright red blood, constipation, straining)
- Anal fissure (likely - associated with constipation and straining)
- Colorectal cancer (less likely but must consider given age, though no red flags)
- Other causes (less likely)

**Management:**
- Likely haemorrhoids/anal fissure related to constipation
- Optimise constipation management:
  - Review laxatives (may need increase)
  - Encourage fluid intake
  - Dietary advice (fiber, though patient has preferences)
- Topical treatments: Consider haemorrhoid cream if appropriate
- Safety-netting: If bleeding increases, if develops pain, or if other symptoms - seek medical attention
- Consider face-to-face review for examination if needed
- Consider referral if red flags develop or not improving
- Follow-up: Review in 1-2 weeks',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Ensured patient participation", "Used appropriate communication", "Took history with support worker", "Explored bleeding systematically", "Assessed bowel habits", "Screened for red flags", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered likely causes appropriately", "Addressed constipation management", "Planned appropriate treatment", "Provided clear safety-netting", "Considered face-to-face review", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Communicated effectively with learning disability", "Used simple, clear language", "Involved patient appropriately", "Worked with support worker", "Demonstrated empathy", "Maintained patient dignity"]}}'
);

-- =====================================================
-- CASE 15: Severe Leg Pain in Palliative Patient
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Pain Management in Palliative Care',
  'Palliative Care',
  'PALL-001',
  'You are a GP trainee. A district nurse has contacted the practice about Mrs. Helen Morrison, a 67-year-old woman with advanced lung cancer who is receiving palliative care at home. The district nurse reports that Mrs. Morrison has developed severe pain in her right leg over the last 2 days and her current pain medications are not helping.',
  '{"name": "Mrs. Helen Morrison", "age": 67, "gender": "Female"}',
  '{"patient": "Mrs. Helen Morrison", "age": 67, "gender": "Female", "pmh": "Advanced lung cancer (diagnosed 8 months ago), Bone metastases confirmed 3 months ago", "medications": "Morphine sulphate MR 30mg BD, Morphine sulphate solution 5mg PRN, Paracetamol 1g QDS, Dexamethasone 4mg OD", "allergies": "None known", "social_summary": "Lives with husband, has good family support, district nurse visits daily", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Doctor, I''m in so much pain. My right leg is really hurting and the morphine isn''t helping. I can''t sleep and I''m really struggling.",
    "freely_given_history": {
      "presenting_complaint": "Severe right leg pain for 2 days. Getting worse. Current pain medications not effective.",
      "psychosocial_impact": "Unable to sleep. Very distressed. Family worried.",
      "ice": {
        "ideas": "Worried the cancer has spread. Scared the pain will get worse.",
        "concerns": "Very concerned about pain control. Worried about needing to go to hospital.",
        "expectations": "Wants stronger pain relief. Hopes to stay at home."
      }
    },
    "history_on_direct_questioning": {
      "pain": {
        "site": "Right thigh, deep pain",
        "onset": "Started 2 days ago, gradual onset",
        "character": "Constant, deep, aching pain",
        "severity": "8-9/10, severe",
        "radiation": "Radiates down to knee",
        "movement": "Worse with movement, better with rest",
        "night": "Worse at night, preventing sleep",
        "relieving": "Current morphine not helping much"
      },
      "current_medications": {
        "morphine_mr": "Morphine sulphate MR 30mg BD - taking regularly",
        "morphine_prn": "Morphine solution 5mg - taking 4-5 times per day, not helping much",
        "paracetamol": "Taking regularly",
        "dexamethasone": "Taking 4mg OD",
        "compliance": "Taking all medications as prescribed"
      },
      "pmh": {
        "cancer": "Lung cancer diagnosed 8 months ago, advanced disease",
        "metastases": "Bone metastases confirmed 3 months ago (spine, ribs, pelvis)",
        "treatment": "Had chemotherapy initially, now on palliative care only",
        "other": "No other medical conditions"
      },
      "red_flags": {
        "swelling": "No significant swelling",
        "redness": "No redness",
        "warmth": "No warmth",
        "trauma": "No recent trauma",
        "dvt_symptoms": "No calf swelling, no shortness of breath"
      },
      "social_hx": {
        "living": "Lives with husband, good support",
        "care": "District nurse visits daily, family very supportive",
        "preferences": "Wants to stay at home if possible"
      }
    }
  }',
  'DISTRESSED and IN PAIN. Show difficulty concentrating due to pain. If doctor addresses pain appropriately, show some relief. May become tearful. Show concern about staying at home.',
  'full',
  720,
  'hard',
  ARRAY['Assess pain systematically', 'Review current pain medications', 'Consider breakthrough pain management', 'Assess for new pathology (fracture, DVT)', 'Optimise pain control', 'Consider specialist palliative care input', 'Address concerns about staying at home'],
  '## Model Approach

**Key Priorities:**
1. Acknowledge distress and pain
2. Systematic pain assessment
3. Review current pain medications and effectiveness
4. Assess for new pathology (pathological fracture, DVT)
5. Optimise pain control
6. Consider specialist input
7. Address concerns about staying at home

**Differential Diagnosis:**
- Pathological fracture (consider - bone metastases, new severe pain)
- Bone pain from metastases (likely - known bone mets)
- DVT (consider - immobility, cancer)
- Other causes (less likely)

**Management:**
- **URGENT: Assess for pathological fracture**
  - Consider X-ray of leg if suspected
  - May need hospital admission if fracture confirmed
- Optimise pain control:
  - Increase breakthrough morphine dose (may need 10-15mg PRN)
  - Consider increasing background morphine
  - Consider adding co-analgesic (e.g., gabapentin for neuropathic component)
  - Review dexamethasone (may need increase if bone pain)
- Consider specialist palliative care team input
- Safety-netting: If pain worsens, if develops swelling/redness, or if unable to manage at home - seek urgent medical attention
- Follow-up: Review same day or next day
- Consider hospital admission if pain unmanageable at home',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed pain systematically", "Reviewed current medications", "Explored pain characteristics", "Assessed for new pathology", "Explored ICE", "Obtained relevant history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered pathological fracture", "Optimised pain control appropriately", "Considered specialist input", "Addressed staying at home", "Provided clear safety-netting", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for distress", "Used clear, supportive language", "Listened actively", "Addressed concerns", "Maintained professional, caring manner"]}}'
);

-- =====================================================
-- CASE 16: Domestic Violence Disclosure
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Safeguarding Concerns - Domestic Abuse',
  'Safeguarding',
  'SAF-001',
  'You are a GP trainee. A 31-year-old woman, Ms. Laura Bennett, has booked a video consultation. She has attended several times over the last 6 months with various complaints including headaches, anxiety, and sleep problems.',
  '{"name": "Ms. Laura Bennett", "age": 31, "gender": "Female"}',
  '{"patient": "Ms. Laura Bennett", "age": 31, "gender": "Female", "pmh": "Anxiety, Depression", "medications": "Sertraline 50mg OD, Propranolol 40mg BD PRN", "allergies": "None known", "social_summary": "Lives with partner, works part-time as receptionist", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Doctor, I need to talk to you about something. I''ve been coming here a lot recently and I think there''s something I need to tell you. I''m not sure if I should be saying this...",
    "freely_given_history": {
      "presenting_complaint": "Wants to discuss something personal. Hesitant to speak.",
      "psychosocial_impact": "Very anxious, tearful. Scared about consequences of speaking.",
      "ice": {
        "ideas": "Not sure if this is something she should tell the doctor.",
        "concerns": "Very worried about what will happen if she tells. Scared her partner will find out.",
        "expectations": "Wants help but doesn''t know what to do."
      }
    },
    "history_on_direct_questioning": {
      "disclosure": {
        "if_asked_directly": "My partner... he gets angry sometimes. He''s hit me a few times. I''m scared.",
        "frequency": "Has happened 3-4 times over last year, getting worse",
        "triggers": "Usually when he''s been drinking, or if I''ve done something wrong",
        "injuries": "Had bruises, once had a black eye (said she fell)",
        "current_safety": "He''s not here now, he''s at work. But I''m scared he''ll find out I told you",
        "children": "No children",
        "support": "Has a friend who knows, but no family nearby",
        "wants_help": "Wants help but doesn''t want to leave him, loves him, thinks he can change"
      },
      "previous_consultations": {
        "headaches": "Has attended with headaches, anxiety, sleep problems",
        "medications": "On sertraline and propranolol for anxiety",
        "mental_health": "Has been feeling low, anxious"
      },
      "social_hx": {
        "relationship": "Lives with partner of 4 years",
        "work": "Works part-time as receptionist",
        "isolation": "Feels isolated, partner doesn''t like her seeing friends much"
      }
    }
  }',
  'HESITANT and FEARFUL. Very anxious about disclosure. If doctor is supportive and non-judgmental, gradually open up. If doctor is dismissive or doesn''t take it seriously, become more withdrawn. Show fear about partner finding out.',
  'full',
  720,
  'hard',
  ARRAY['Recognise domestic abuse disclosure', 'Respond sensitively and supportively', 'Assess immediate safety', 'Explore support options', 'Respect patient autonomy', 'Consider safeguarding procedures', 'Provide information about support services', 'Document appropriately'],
  '## Model Approach

**Key Priorities:**
1. **CRITICAL: Respond sensitively and supportively**
2. Assess immediate safety
3. Explore support options
4. Respect patient autonomy (don''t force actions)
5. Provide information about support services
6. Consider safeguarding procedures
7. Document clearly

**Important Considerations:**
- Domestic abuse is a safeguarding issue
- Patient safety is paramount
- Respect patient autonomy - don''t force reporting
- Provide information and support
- Consider MARAC referral if appropriate
- Document clearly and confidentially

**Management:**
- Immediate safety:
  - Assess if safe to go home
  - Discuss safety planning
  - Provide emergency contacts (Refuge, Women''s Aid)
- Support services:
  - Provide information about local domestic abuse services
  - Consider referral to IDVA (Independent Domestic Violence Advisor)
  - Discuss options (staying, leaving, support)
- Medical:
  - Document injuries if visible (with consent)
  - Continue mental health support
- Safeguarding:
  - Consider safeguarding referral (discuss with patient if possible)
  - Consider MARAC if high risk
- Follow-up: Arrange follow-up appointment
- Safety-netting: Provide emergency contacts, discuss when to seek urgent help

**Important:** Handle sensitively, respect autonomy, ensure safety.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Recognised disclosure", "Assessed immediate safety", "Explored situation sensitively", "Assessed support network", "Explored ICE", "Obtained relevant history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Responded appropriately to disclosure", "Assessed safety", "Provided support services information", "Considered safeguarding procedures", "Respected patient autonomy", "Documented appropriately", "Arranged follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy and sensitivity", "Used supportive, non-judgmental language", "Listened actively", "Built trust", "Respected patient autonomy", "Maintained confidentiality appropriately"]}}'
);

-- =====================================================
-- CASE 17: Type 2 Diabetes in Traveller Community
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Diabetes Management Consultation',
  'Endocrinology',
  'ENDO-005',
  'You are a GP trainee. A 48-year-old man, Mr. Patrick O''Brien, has booked a video consultation. He is from the Traveller community and has type 2 diabetes. His recent HbA1c is 72 mmol/mol. He has missed several appointments recently.',
  '{"name": "Mr. Patrick O''Brien", "age": 48, "gender": "Male"}',
  '{"patient": "Mr. Patrick O''Brien", "age": 48, "gender": "Male", "pmh": "Type 2 diabetes (diagnosed 5 years ago), Hypertension", "medications": "Metformin 1g BD, Gliclazide 80mg BD, Ramipril 5mg OD", "allergies": "None known", "social_summary": "Traveller community, lives on site with extended family", "family_summary": "Strong family history of diabetes"}',
  '{
    "opening_statement": "Hello doctor. I know I''ve missed a few appointments. I''ve been busy with work and family stuff. I got a letter about my diabetes results and thought I should call.",
    "freely_given_history": {
      "presenting_complaint": "Called about diabetes results. Has missed appointments due to work/family commitments.",
      "psychosocial_impact": "Feels guilty about missing appointments. Worried about diabetes but finds it hard to prioritise.",
      "ice": {
        "ideas": "Knows his diabetes isn''t well controlled. Worried about complications.",
        "concerns": "Concerned about health but finds it hard to manage with lifestyle.",
        "expectations": "Wants help but needs it to fit around his life."
      }
    },
    "history_on_direct_questioning": {
      "diabetes": {
        "diagnosis": "Diagnosed 5 years ago",
        "current_medications": "Metformin 1g BD, Gliclazide 80mg BD",
        "compliance": "Takes medications most days, sometimes forgets",
        "monitoring": "Doesn''t check blood sugars regularly",
        "symptoms": "Some increased thirst, passing urine more",
        "complications": "Has annual eye screening, foot checks - last ones 8 months ago"
      },
      "lifestyle": {
        "diet": "Eats with extended family, traditional foods, finds it hard to change diet",
        "exercise": "Works physically (manual work), but no structured exercise",
        "weight": "BMI 34, has gained weight over last year",
        "alcohol": "Drinks socially with family, 10-15 units per week"
      },
      "barriers": {
        "appointments": "Finds it hard to attend regular appointments due to work, family commitments",
        "travel": "Sometimes travels for work, away for weeks at a time",
        "access": "Finds healthcare system difficult to navigate",
        "trust": "Some mistrust of healthcare system, prefers to manage things himself"
      },
      "social_hx": {
        "community": "Traveller community, lives on site with extended family",
        "support": "Has family support but they also have health issues",
        "work": "Works in construction, travels for work"
      }
    }
  }',
  'ENGAGED but PRACTICAL. Show willingness to engage but need for flexibility. If doctor is understanding of lifestyle challenges, show more engagement. If doctor is rigid, become more defensive. Show pride in community and family.',
  'full',
  720,
  'hard',
  ARRAY['Recognise cultural considerations', 'Address barriers to healthcare', 'Work with patient''s lifestyle', 'Provide flexible management', 'Build trust and rapport', 'Address diabetes control', 'Consider community-specific factors'],
  '## Model Approach

**Key Priorities:**
1. Build trust and rapport
2. Recognise cultural considerations
3. Address barriers to healthcare access
4. Work with patient''s lifestyle (flexible approach)
5. Address diabetes control
6. Provide practical, achievable advice

**Key Considerations:**
- Traveller communities face health inequalities
- Barriers to healthcare access (appointments, travel, trust)
- Need for flexible, culturally sensitive approach
- Work with patient''s lifestyle rather than against it

**Management:**
- Build rapport:
  - Acknowledge challenges with appointments
  - Non-judgmental approach
  - Work with patient''s lifestyle
- Diabetes management:
  - Review medications (may need adjustment)
  - Flexible monitoring approach
  - Practical dietary advice (working with traditional foods)
  - Consider community health worker if available
- Address barriers:
  - Flexible appointment times if possible
  - Consider telephone/video consultations when travelling
  - Provide clear, simple information
- Follow-up:
  - Agree on follow-up plan that works for patient
  - Consider longer intervals if needed
  - Provide clear contact information
- Safety-netting: Clear advice on when to seek urgent help',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored diabetes history", "Assessed current control", "Explored lifestyle factors", "Identified barriers to care", "Explored cultural considerations", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed diabetes control", "Provided flexible management", "Addressed barriers to care", "Considered cultural factors", "Built trust", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated cultural sensitivity", "Built trust and rapport", "Used non-judgmental approach", "Listened actively", "Respected patient''s lifestyle", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 18: Young Man with Hand Lesion
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Skin Lesion on Hand',
  'Dermatology',
  'DERM-002',
  'You are a GP trainee. A 22-year-old man, Mr. Alex Johnson, has booked a video consultation. He has noticed a lesion on his hand that has been present for several weeks.',
  '{"name": "Mr. Alex Johnson", "age": 22, "gender": "Male"}',
  '{"patient": "Mr. Alex Johnson", "age": 22, "gender": "Male", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "University student, works part-time in construction", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hi doctor, I''ve got this thing on my hand that won''t go away. It''s been there for a few weeks now and I''m a bit worried about it.",
    "freely_given_history": {
      "presenting_complaint": "Lesion on right hand, present for 4-5 weeks. Not going away.",
      "psychosocial_impact": "Mildly concerned. Wants to know what it is.",
      "ice": {
        "ideas": "Not sure what it is. Wondering if it''s something serious.",
        "concerns": "Mild concern. Wants to know if it needs treatment.",
        "expectations": "Wants to know what it is and if it needs to be removed"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "site": "Right hand, dorsum, near base of thumb",
        "onset": "Noticed 4-5 weeks ago, appeared gradually",
        "appearance": "Small raised bump, flesh-coloured, rough surface",
        "size": "About 3-4mm in diameter",
        "colour": "Flesh-coloured, slightly darker than surrounding skin",
        "surface": "Rough, warty appearance",
        "pain": "No pain, no itching",
        "bleeding": "No bleeding",
        "change": "Hasn''t changed much since appeared, maybe slightly bigger",
        "number": "Just this one lesion"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "skin_conditions": "No previous skin problems",
        "immunosuppression": "No immunosuppression"
      },
      "social_hx": {
        "occupation": "University student, works part-time in construction",
        "exposure": "Works with hands, uses tools, handles materials",
        "sun_exposure": "Moderate sun exposure, doesn''t use sunscreen regularly"
      }
    }
  }',
  'CALM but CURIOUS. Answer questions clearly. Show interest in understanding what it is. Accept treatment plan if explained well.',
  'full',
  720,
  'easy',
  ARRAY['Take systematic history of skin lesion', 'Assess lesion characteristics', 'Consider differential diagnosis', 'Assess for concerning features', 'Plan appropriate management', 'Provide clear explanation'],
  '## Model Approach

**Key Priorities:**
1. Systematic history of lesion
2. Assess characteristics (size, colour, surface, change)
3. Consider differential diagnosis
4. Assess for concerning features (ABCDE criteria)
5. Plan appropriate management

**Differential Diagnosis:**
- Viral wart (most likely - rough surface, warty appearance, young age)
- Seborrhoeic keratosis (consider - rough surface, but less common in young)
- Other benign lesions
- Malignant (less likely - but must consider)

**Management:**
- Likely viral wart given appearance and age
- Consider cryotherapy if bothersome
- Can also use topical treatments (salicylic acid)
- Reassurance if benign appearance
- Safety-netting: If changes in size, colour, or develops concerning features - seek medical attention
- Follow-up: Review if not improving or if concerns
- Consider referral if diagnosis unclear or concerning features',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic history of lesion", "Explored appearance, size, characteristics", "Assessed for concerning features", "Obtained relevant history", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered appropriate diagnosis", "Assessed for malignant features", "Planned appropriate treatment", "Provided clear safety-netting", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Used clear, non-jargon language", "Listened actively", "Addressed concerns", "Involved patient in decisions", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 19: Young Adult with Blood in Semen
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Haematospermia Consultation',
  'Urology',
  'URO-001',
  'You are a GP trainee. A 28-year-old man, Mr. Ryan Murphy, has booked a video consultation. He appears anxious and hesitant to discuss the reason for his appointment.',
  '{"name": "Mr. Ryan Murphy", "age": 28, "gender": "Male"}',
  '{"patient": "Mr. Ryan Murphy", "age": 28, "gender": "Male", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "Works in IT, in relationship", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Um, doctor, this is a bit embarrassing but I need to talk to you about something. I''ve noticed something that''s worrying me.",
    "freely_given_history": {
      "presenting_complaint": "Hesitant to discuss. Needs encouragement.",
      "psychosocial_impact": "Very anxious, embarrassed. Worried about what it means.",
      "ice": {
        "ideas": "Worried it might be something serious like cancer.",
        "concerns": "Very concerned. Scared to discuss. Worried about implications.",
        "expectations": "Wants to know what it is and if it''s serious"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "if_encouraged": "I''ve noticed blood... in my semen. When I ejaculate, there''s blood in it.",
        "onset": "First noticed 3 days ago, happened again yesterday",
        "frequency": "Has happened twice now",
        "amount": "Noticed blood mixed with semen, bright red",
        "pain": "No pain when ejaculating, no pain in penis or testicles",
        "urination": "No blood in urine, passing urine normally",
        "erection": "No problems with erections",
        "associated_symptoms": "No other symptoms"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "stis": "No history of STIs",
        "prostate": "No prostate problems (too young)",
        "trauma": "No recent trauma to genitals"
      },
      "social_hx": {
        "sexual_activity": "Sexually active, in monogamous relationship",
        "contraception": "Uses condoms",
        "partners": "One partner, together 2 years"
      }
    }
  }',
  'EMBARRASSED and ANXIOUS. Very hesitant to discuss. Needs gentle encouragement. If doctor is understanding and non-judgmental, gradually open up. Show significant relief if reassured appropriately.',
  'full',
  720,
  'medium',
  ARRAY['Create safe environment for discussion', 'Address embarrassment sensitively', 'Take systematic history', 'Assess for concerning features', 'Provide reassurance (usually benign)', 'Plan appropriate investigations if needed', 'Address concerns'],
  '## Model Approach

**Key Priorities:**
1. Create safe, non-judgmental environment
2. Address embarrassment sensitively
3. Systematic history of haematospermia
4. Assess for concerning features
5. Provide appropriate reassurance
6. Plan investigations if needed

**Differential Diagnosis:**
- Idiopathic haematospermia (most common - usually benign, self-limiting)
- Prostatitis (consider - can cause haematospermia)
- Urethritis (consider)
- Trauma (consider if history)
- Malignancy (rare, especially in young men)
- Other causes (less common)

**Management:**
- Reassurance: In young men, haematospermia is usually benign and self-limiting
- Investigations (if persistent or concerning):
  - Urine dipstick/MSU
  - STI screen if appropriate
  - Consider PSA if persistent (though very rare in this age group)
- Safety-netting: If persists >4-6 weeks, if develops other symptoms, or if very concerned - review
- Follow-up: Review in 2-3 weeks if not resolved
- Consider urology referral if persistent or concerning features
- Address anxiety and provide clear information',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Created safe environment", "Addressed embarrassment", "Took systematic history", "Assessed for concerning features", "Explored ICE", "Obtained relevant history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Provided appropriate reassurance", "Considered differential diagnosis", "Planned investigations if needed", "Arranged appropriate follow-up", "Considered referral if needed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for embarrassment", "Created non-judgmental environment", "Used sensitive language", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 20: Teenager Seeking Abortion
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Pregnancy Options Consultation',
  'Women''s Health',
  'WH-002',
  'You are a GP trainee. A 17-year-old girl, Miss Emily Davies, has booked a video consultation. She appears anxious and the receptionist notes she requested a female doctor if possible.',
  '{"name": "Miss Emily Davies", "age": 17, "gender": "Female"}',
  '{"patient": "Miss Emily Davies", "age": 17, "gender": "Female", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "College student, lives with parents", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hi doctor, I need to talk to you about something. I think I might be pregnant and I don''t know what to do. I''m really scared.",
    "freely_given_history": {
      "presenting_complaint": "Thinks she might be pregnant. Very anxious and scared.",
      "psychosocial_impact": "Very distressed. Worried about telling parents. Scared about options.",
      "ice": {
        "ideas": "Thinks she might be pregnant. Not sure what to do.",
        "concerns": "Very worried about telling parents. Scared about what will happen. Unsure about options.",
        "expectations": "Wants to know if she''s pregnant and what her options are"
      }
    },
    "history_on_direct_questioning": {
      "pregnancy": {
        "lmp": "Last period was 7 weeks ago, usually regular",
        "pregnancy_test": "Did home test yesterday - positive",
        "symptoms": "Feeling nauseous, tired, breasts tender",
        "contraception": "Was using condoms, not always consistently",
        "gestation": "Thinks around 6-7 weeks if pregnant"
      },
      "options": {
        "if_asked": "I don''t think I can have a baby. I''m only 17, I''m at college, my parents would be so angry. I think I want to... you know... not continue with it. But I don''t know how.",
        "support": "Hasn''t told anyone yet. Has a boyfriend but not sure if he''ll be supportive",
        "parents": "Very worried about telling parents, thinks they''ll be angry and disappointed",
        "decision": "Pretty sure she wants termination but wants to discuss options"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "previous_pregnancies": "No previous pregnancies"
      },
      "social_hx": {
        "living": "Lives with parents, still at college",
        "support": "Has some friends but hasn''t told anyone",
        "relationship": "Has boyfriend, been together 6 months"
      }
    }
  }',
  'ANXIOUS and DISTRESSED. Very scared. If doctor is supportive and non-judgmental, gradually open up. If doctor is judgmental, become more withdrawn. Show relief if options explained clearly.',
  'full',
  720,
  'hard',
  ARRAY['Create safe, non-judgmental environment', 'Confirm pregnancy', 'Explore options sensitively', 'Provide information about termination', 'Address confidentiality (Gillick competence)', 'Consider support needs', 'Provide appropriate referrals'],
  '## Model Approach

**Key Priorities:**
1. Create safe, supportive environment
2. Confirm pregnancy (urine test)
3. Explore options sensitively (continue, termination, adoption)
4. Provide information about termination services
5. Address confidentiality (Gillick competence - 17 years old)
6. Consider support needs
7. Provide appropriate referrals

**Key Considerations:**
- Patient is 17 (Gillick competent - can consent to treatment)
- Confidentiality important
- Non-judgmental approach essential
- Provide all options
- Support decision-making

**Management:**
- Confirm pregnancy: Urine pregnancy test
- Discuss options:
  - Continue pregnancy
  - Termination (medical/surgical)
  - Adoption
- If termination requested:
  - Refer to termination service (BPAS, MSI, NHS service)
  - Explain process and timeframes
  - Address confidentiality
- Support:
  - Consider counselling support
  - Discuss telling parents/partner (but respect patient autonomy)
  - Provide information about support services
- Follow-up: Arrange follow-up appointment
- Safety-netting: Clear advice on when to seek urgent help

**Important:** Non-judgmental, supportive approach. Respect patient autonomy and confidentiality.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Created safe environment", "Confirmed pregnancy", "Explored options sensitively", "Assessed support needs", "Explored ICE", "Obtained relevant history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Provided information about all options", "Addressed termination appropriately", "Considered confidentiality", "Provided appropriate referrals", "Arranged follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy", "Created non-judgmental environment", "Used sensitive, supportive language", "Listened actively", "Respected patient autonomy", "Maintained confidentiality"]}}'
);

-- =====================================================
-- CASE 21: Obesity in Child
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Weight Concerns in Child',
  'Paediatrics',
  'PAED-003',
  'You are a GP trainee. A mother, Mrs. Susan Parker, has booked a telephone consultation about her 9-year-old son, Jake. The school nurse has raised concerns about Jake''s weight.',
  '{"name": "Jake Parker", "age": 9, "gender": "Male", "parent": "Mrs. Susan Parker"}',
  '{"patient": "Jake Parker", "age": 9, "gender": "Male", "parent": "Mrs. Susan Parker", "pmh": "Generally healthy child, no medical conditions", "medications": "None", "allergies": "No known allergies", "social_summary": "Lives with mother and father, attends primary school", "family_summary": "Family history of obesity and type 2 diabetes"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about my son Jake. The school nurse has said he''s overweight and I''m a bit worried. I don''t want him to be bullied or have health problems.",
    "freely_given_history": {
      "presenting_complaint": "School nurse raised concerns about weight. Mother worried about health and bullying.",
      "psychosocial_impact": "Mother concerned. Worried about impact on Jake. Feels guilty about his weight.",
      "ice": {
        "ideas": "Not sure if it''s a problem. Worried about health implications.",
        "concerns": "Worried about bullying. Concerned about health. Feels it might be her fault.",
        "expectations": "Wants advice on how to help Jake lose weight"
      }
    },
    "history_on_direct_questioning": {
      "weight": {
        "current": "Jake weighs 48kg, height 1.35m, BMI 26.3 (above 95th centile)",
        "growth": "Has been gaining weight faster than height over last 2 years",
        "previous": "Was average weight until about age 7"
      },
      "lifestyle": {
        "diet": "Eats regular meals but large portions. Loves snacks, sweets, fizzy drinks. Eats when bored or upset",
        "exercise": "Doesn''t like PE at school. Prefers screen time. Plays video games 3-4 hours per day",
        "family": "Family eats together but portions are large. Family enjoys treats regularly"
      },
      "social": {
        "school": "Doing okay at school but sometimes gets teased about weight",
        "friends": "Has some friends but sometimes excluded from activities",
        "self_esteem": "Seems less confident than before, especially about physical activities"
      },
      "pmh": {
        "medical": "No medical conditions",
        "medications": "None"
      },
      "fhx": {
        "obesity": "Both parents overweight, maternal grandmother has type 2 diabetes",
        "other": "Strong family history of obesity"
      }
    }
  }',
  'CONCERNED but DEFENSIVE parent. Show love for child. If doctor is supportive and non-judgmental, engage more. If doctor is judgmental, become defensive. Show willingness to help but may feel overwhelmed.',
  'full',
  720,
  'hard',
  ARRAY['Address weight sensitively', 'Avoid blame or judgment', 'Assess lifestyle factors', 'Consider family factors', 'Provide practical, achievable advice', 'Address emotional eating', 'Consider family-based approach', 'Address bullying concerns'],
  '## Model Approach

**Key Priorities:**
1. Address sensitively, avoid blame
2. Assess lifestyle factors (diet, exercise, screen time)
3. Consider family factors
4. Provide practical, achievable advice
5. Address emotional/social aspects
6. Family-based approach

**Key Considerations:**
- Avoid blame or judgment
- Family-based approach works best
- Focus on health, not just weight
- Address emotional aspects
- Make changes achievable

**Management:**
- Sensitive approach:
  - Acknowledge concerns
  - Avoid blame
  - Focus on health and wellbeing
- Lifestyle changes (family-based):
  - Reduce screen time (aim for <2 hours/day)
  - Increase physical activity (make it fun, family activities)
  - Healthy eating (reduce portion sizes, limit treats, more fruit/veg)
  - Address emotional eating
- Family involvement:
  - Whole family make changes together
  - Support, don''t single out child
- Follow-up:
  - Review in 3 months
  - Monitor growth (height and weight)
  - Consider referral to dietitian if needed
- Address bullying:
  - Discuss with school if appropriate
  - Support child''s self-esteem
- Safety-netting: If develops concerning symptoms or weight continues to increase significantly',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed weight and growth", "Explored lifestyle factors", "Assessed family factors", "Explored social/emotional aspects", "Explored ICE with parent", "Obtained relevant history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed weight sensitively", "Provided family-based approach", "Addressed lifestyle factors", "Considered emotional aspects", "Arranged appropriate follow-up", "Considered referral if needed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy", "Avoided blame or judgment", "Used supportive language", "Listened actively", "Addressed parental concerns", "Maintained professional, caring manner"]}}'
);

-- =====================================================
-- CASE 22: Middle-Aged Man with Chronic Cough
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Persistent Cough Consultation',
  'Respiratory',
  'RESP-003',
  'You are a GP trainee. A 54-year-old man, Mr. Michael Thompson, has booked a telephone consultation. He has had a persistent cough for the last 3 months that is not improving.',
  '{"name": "Mr. Michael Thompson", "age": 54, "gender": "Male"}',
  '{"patient": "Mr. Michael Thompson", "age": 54, "gender": "Male", "pmh": "Hypertension, GORD", "medications": "Ramipril 5mg OD, Omeprazole 20mg OD", "allergies": "None known", "social_summary": "Works as a builder, current smoker (30 pack-years)", "family_summary": "Father: lung cancer age 70"}',
  '{
    "opening_statement": "Hello doctor, I''ve had this cough for months now and it''s not getting any better. It''s really annoying and I''m starting to worry about it.",
    "freely_given_history": {
      "presenting_complaint": "Persistent cough for 3 months. Not improving despite various treatments.",
      "psychosocial_impact": "Affecting work. Worried about what it might be.",
      "ice": {
        "ideas": "Worried it might be something serious. Wondering if it''s related to smoking.",
        "concerns": "Concerned about cancer given family history. Wants to know what''s causing it.",
        "expectations": "Wants to know the cause and get treatment"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "cough": "Dry cough, persistent, worse in morning and at night",
        "duration": "3 months, started gradually",
        "sputum": "No sputum, dry cough",
        "wheeze": "No wheeze",
        "breathlessness": "Slightly more breathless than usual, especially on exertion",
        "chest_pain": "No chest pain",
        "haemoptysis": "No blood in sputum",
        "fever": "No fever",
        "weight_loss": "Lost about 3kg over last 3 months, not trying to lose weight"
      },
      "pmh": {
        "hypertension": "Well controlled on ramipril",
        "gord": "Has GORD, on omeprazole, usually well controlled",
        "other": "No other medical conditions"
      },
      "dhx": {
        "regular": "Ramipril 5mg OD, Omeprazole 20mg OD",
        "recent": "Tried various cough medicines, not helping",
        "ace_inhibitor": "On ramipril (ACE inhibitor) - can cause cough"
      },
      "social_hx": {
        "smoking": "Current smoker, 20 cigarettes per day for 30 years (30 pack-years). Has tried to quit multiple times",
        "alcohol": "10-15 units per week",
        "occupation": "Builder, exposed to dust and chemicals",
        "asbestos": "May have had some asbestos exposure in past (construction work)"
      },
      "fhx": {
        "lung_cancer": "Father had lung cancer, diagnosed age 70, died age 72",
        "other": "No other significant family history"
      },
      "red_flags": {
        "haemoptysis": "No",
        "weight_loss": "Yes - 3kg unintentional",
        "chest_pain": "No",
        "dysphagia": "No",
        "hoarseness": "No"
      }
    }
  }',
  'WORRIED but ENGAGED. Show concern about family history. If doctor addresses concerns appropriately, show some relief. May be defensive about smoking. Accept investigations if explained well.',
  'full',
  720,
  'hard',
  ARRAY['Take systematic cough history', 'Assess for red flags', 'Consider ACE inhibitor cough', 'Consider smoking-related causes', 'Assess for malignancy risk', 'Plan appropriate investigations', 'Address smoking cessation'],
  '## Model Approach

**Key Priorities:**
1. Systematic cough history
2. Assess for red flags (weight loss, haemoptysis)
3. Consider ACE inhibitor cough (ramipril)
4. Consider smoking-related causes
5. Assess malignancy risk (smoking, family history, weight loss)
6. Plan investigations
7. Address smoking cessation

**Differential Diagnosis:**
- ACE inhibitor cough (consider - on ramipril, dry cough)
- Smoking-related (chronic bronchitis, COPD, malignancy risk)
- GORD-related (has GORD, can cause cough)
- Malignancy (consider - smoking, family history, weight loss, red flags)
- Other causes (less likely)

**Management:**
- **URGENT: Assess for malignancy**
  - Weight loss + smoking + family history = significant risk
  - Consider chest X-ray urgently
  - Consider 2-week wait referral if concerning features
- Consider ACE inhibitor:
  - Trial stopping ramipril (switch to alternative) if appropriate
  - Monitor if cough improves
- Investigations:
  - Chest X-ray (urgent given red flags)
  - Spirometry if COPD suspected
  - Consider CT if X-ray abnormal
- Address smoking cessation: Strongly encourage, offer support
- Safety-netting: If develops haemoptysis, worsening breathlessness, or other concerning symptoms - seek urgent medical attention
- Follow-up: Review urgently with X-ray results',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic cough history", "Assessed for red flags", "Explored smoking history", "Assessed family history", "Reviewed medications", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered ACE inhibitor cough", "Assessed malignancy risk appropriately", "Planned urgent investigations", "Addressed smoking cessation", "Provided clear safety-netting", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for concerns", "Used clear language", "Addressed smoking sensitively", "Listened actively", "Addressed concerns about family history", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 23: Duty of Candour Situation
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Medication Error Discussion',
  'Ethics & Communication',
  'ETH-001',
  'You are a GP trainee. A 65-year-old woman, Mrs. Dorothy White, has booked a telephone consultation. She was recently prescribed a medication by a colleague at the practice, and it has been discovered that there was an error in the prescription that may have caused her harm.',
  '{"name": "Mrs. Dorothy White", "age": 65, "gender": "Female"}',
  '{"patient": "Mrs. Dorothy White", "age": 65, "gender": "Female", "pmh": "Type 2 diabetes, Hypertension, Atrial fibrillation", "medications": "Metformin 1g BD, Ramipril 5mg OD, Warfarin 3mg OD (was on 5mg OD incorrectly for 2 weeks)", "allergies": "None known", "social_summary": "Retired teacher, lives with husband", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I got a call from the practice saying there was a problem with my medication. I''m a bit worried about what''s happened.",
    "freely_given_history": {
      "presenting_complaint": "Called about medication error. Practice discovered error in prescription.",
      "psychosocial_impact": "Worried about what happened. Wants to understand what went wrong.",
      "ice": {
        "ideas": "Not sure what the error was. Worried about impact on health.",
        "concerns": "Concerned about harm. Wants to know what happened and why.",
        "expectations": "Wants explanation and reassurance"
      }
    },
    "history_on_direct_questioning": {
      "error": {
        "if_explained": "I understand. So I was given the wrong dose of warfarin?",
        "details": "Was prescribed warfarin 5mg OD but should have been 3mg OD. Took wrong dose for 2 weeks",
        "discovery": "Practice discovered error during medication review",
        "symptoms": "No bleeding, no bruising, feeling well",
        "inr": "INR checked - was 4.2 (target 2-3), now corrected"
      },
      "pmh": {
        "af": "Atrial fibrillation, on warfarin for stroke prevention",
        "diabetes": "Type 2 diabetes, well controlled",
        "hypertension": "Well controlled"
      },
      "current_status": {
        "feeling": "Feeling well, no symptoms",
        "bleeding": "No bleeding, no bruising",
        "worries": "Worried about what could have happened"
      }
    }
  }',
  'WORRIED but UNDERSTANDING. Show concern about error. If doctor is open and honest, show appreciation. If doctor is defensive, become more concerned. Want clear explanation and reassurance.',
  'full',
  720,
  'hard',
  ARRAY['Practice duty of candour', 'Be open and honest about error', 'Apologise appropriately', 'Explain what happened', 'Assess for harm', 'Provide reassurance', 'Address concerns', 'Document appropriately'],
  '## Model Approach

**Key Priorities:**
1. **CRITICAL: Practice duty of candour**
2. Be open, honest, and transparent
3. Apologise appropriately
4. Explain what happened clearly
5. Assess for harm
6. Provide reassurance
7. Address concerns

**Duty of Candour Requirements:**
- Tell patient what happened
- Apologise
- Explain what will be done
- Provide support

**Management:**
- Open disclosure:
  - Explain error clearly (wrong warfarin dose for 2 weeks)
  - Apologise sincerely
  - Take responsibility
- Assess harm:
  - INR was elevated (4.2) but no bleeding
  - No apparent harm, but monitor
- Reassurance:
  - Error has been corrected
  - INR now in target range
  - No bleeding occurred
  - Will monitor closely
- Actions taken:
  - Prescription corrected
  - INR monitoring increased
  - Practice will review to prevent recurrence
- Follow-up:
  - Arrange INR check in 1 week
  - Review if any concerns
- Safety-netting: If develops bleeding, bruising, or other symptoms - seek urgent medical attention

**Important:** Duty of candour is a legal and ethical requirement. Be open, honest, and apologetic.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored understanding of error", "Assessed for harm", "Explored symptoms", "Explored ICE", "Obtained relevant history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Practiced duty of candour appropriately", "Apologised sincerely", "Explained error clearly", "Assessed for harm", "Provided reassurance", "Arranged appropriate follow-up", "Documented appropriately"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated honesty and transparency", "Apologised appropriately", "Used clear, empathetic language", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 24: Mental Health in Military Veteran
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Mental Health Concerns Consultation',
  'Mental Health',
  'MH-002',
  'You are a GP trainee. A 42-year-old man, Mr. David Cooper, has booked a video consultation. He is a military veteran who left the forces 3 years ago. His wife has been encouraging him to see a doctor about his mood.',
  '{"name": "Mr. David Cooper", "age": 42, "gender": "Male"}',
  '{"patient": "Mr. David Cooper", "age": 42, "gender": "Male", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "Former military, now works as security guard, married with 2 children", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor. My wife made me come. She thinks I need to talk to someone about how I''ve been feeling. I''m not sure I need to be here though.",
    "freely_given_history": {
      "presenting_complaint": "Wife concerned about mood. Patient reluctant but willing to discuss.",
      "psychosocial_impact": "Struggling but trying to cope. Relationship strained.",
      "ice": {
        "ideas": "Thinks he should be able to cope. Doesn''t want to be seen as weak.",
        "concerns": "Worried about stigma. Concerned about impact on work.",
        "expectations": "Not sure what to expect. Wants to understand if there''s a problem."
      }
    },
    "history_on_direct_questioning": {
      "mood": {
        "low_mood": "Has been feeling low for months, worse recently",
        "anhedonia": "Not enjoying things he used to enjoy",
        "irritability": "Very irritable, snapping at family",
        "sleep": "Difficulty sleeping, nightmares, waking early",
        "concentration": "Poor concentration",
        "energy": "Low energy, feeling exhausted"
      },
      "military": {
        "service": "Served in military for 15 years, left 3 years ago",
        "deployments": "Multiple deployments, saw active service",
        "trauma": "Experienced traumatic events, doesn''t want to discuss details",
        "adjustment": "Found it hard to adjust to civilian life"
      },
      "mental_health": {
        "ptsd_symptoms": "Nightmares, hypervigilance, avoiding reminders, feeling on edge",
        "alcohol": "Drinking more than usual - 4-5 beers most evenings to help sleep",
        "support": "Hasn''t sought help before, tried to cope alone",
        "stigma": "Worried about being seen as weak, doesn''t want to be ''that veteran''"
      },
      "social_hx": {
        "work": "Works as security guard, finds it stressful",
        "family": "Married with 2 children, relationship strained",
        "support": "Has some military friends but doesn''t see them much",
        "isolation": "Feels isolated, doesn''t talk about feelings"
      },
      "risk": {
        "suicidal_thoughts": "Has had thoughts that family would be better off without him, but no active plans",
        "self_harm": "No history of self-harm",
        "protective_factors": "Loves his children, wants to be there for them"
      }
    }
  }',
  'RELUCTANT but ENGAGED. Show military stoicism. If doctor is understanding and non-judgmental, gradually open up. If doctor is dismissive, become more defensive. Show concern about stigma.',
  'full',
  720,
  'hard',
  ARRAY['Recognise military veteran context', 'Assess for PTSD', 'Address stigma sensitively', 'Assess mental health systematically', 'Consider veteran-specific services', 'Address alcohol use', 'Assess risk', 'Provide appropriate support'],
  '## Model Approach

**Key Priorities:**
1. Recognise military veteran context
2. Address stigma sensitively
3. Assess for PTSD and depression
4. Assess risk
5. Consider veteran-specific services
6. Address alcohol use
7. Provide appropriate support

**Key Considerations:**
- Military veterans face unique challenges
- Stigma around mental health in military culture
- PTSD common in veterans
- Veteran-specific services available
- Need for sensitive, understanding approach

**Management:**
- Build rapport:
  - Acknowledge military service
  - Address stigma sensitively
  - Non-judgmental approach
- Mental health assessment:
  - Screen for PTSD (nightmares, hypervigilance, avoidance)
  - Assess depression
  - Assess risk (suicidal thoughts present but no plans)
- Treatment:
  - Consider antidepressant if appropriate
  - Consider trauma-focused therapy (CBT, EMDR)
  - Address alcohol use
- Veteran-specific services:
  - Consider referral to veteran mental health services
  - Combat Stress, Help for Heroes
  - Veterans'' mental health services
- Support:
  - Encourage engagement with support
  - Address relationship strain
  - Consider family support
- Follow-up: Arrange follow-up appointment
- Safety-netting: Clear advice on when to seek urgent help, crisis contacts

**Important:** Recognise veteran context, address stigma, provide veteran-specific support.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Recognised veteran context", "Assessed mental health systematically", "Screened for PTSD", "Assessed risk", "Explored alcohol use", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed stigma appropriately", "Considered PTSD", "Planned appropriate treatment", "Considered veteran-specific services", "Addressed alcohol use", "Arranged follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated understanding of veteran context", "Addressed stigma sensitively", "Used empathetic, non-judgmental language", "Listened actively", "Built trust", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 25: Painful Swollen Toe in Diabetic Patient
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Foot Problem in Diabetic Patient',
  'Endocrinology',
  'ENDO-006',
  'You are a GP trainee. A 58-year-old man, Mr. Stephen Roberts, has booked an urgent telephone consultation. He has type 2 diabetes and is calling about a problem with his foot.',
  '{"name": "Mr. Stephen Roberts", "age": 58, "gender": "Male"}',
  '{"patient": "Mr. Stephen Roberts", "age": 58, "gender": "Male", "pmh": "Type 2 diabetes (diagnosed 10 years ago), Hypertension, Diabetic neuropathy", "medications": "Metformin 1g BD, Gliclazide 80mg BD, Ramipril 5mg OD, Gabapentin 300mg TDS", "allergies": "None known", "social_summary": "Retired factory worker, lives alone", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I need to see someone about my foot. My big toe is really swollen and painful. I''ve got diabetes so I''m worried about it.",
    "freely_given_history": {
      "presenting_complaint": "Right big toe swollen and painful for 2 days. Getting worse.",
      "psychosocial_impact": "Unable to walk properly. Very worried given diabetes.",
      "ice": {
        "ideas": "Worried it might be an infection. Scared about complications from diabetes.",
        "concerns": "Very concerned about foot problems with diabetes. Worried about losing toe/foot.",
        "expectations": "Wants urgent assessment and treatment"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "site": "Right big toe, especially around nail",
        "onset": "Started 2 days ago, noticed after trimming toenails",
        "appearance": "Toe is red, swollen, warm to touch",
        "pain": "Very painful, 8/10, throbbing",
        "discharge": "Some pus coming from around nail",
        "fever": "Feeling hot and shivery, thinks might have temperature",
        "redness": "Redness spreading up toe slightly",
        "trauma": "Trimmed toenails 3 days ago, may have cut too close"
      },
      "diabetes": {
        "control": "Diabetes usually well controlled, HbA1c last checked 3 months ago was 58",
        "complications": "Has diabetic neuropathy in feet (numbness, tingling)",
        "foot_care": "Usually checks feet daily, has annual foot checks",
        "previous_problems": "No previous foot ulcers or infections"
      },
      "pmh": {
        "diabetes": "Type 2 diabetes, 10 years",
        "neuropathy": "Diabetic neuropathy, on gabapentin",
        "hypertension": "Well controlled",
        "other": "No other medical conditions"
      },
      "red_flags": {
        "spreading": "Redness spreading slightly",
        "systemic": "Feeling unwell, hot and shivery",
        "cellulitis": "Signs of cellulitis present"
      }
    }
  }',
  'WORRIED and IN PAIN. Show significant concern about diabetes complications. If doctor takes it seriously and arranges urgent assessment, show relief. May be anxious about outcomes.',
  'full',
  720,
  'hard',
  ARRAY['Recognise diabetic foot emergency', 'Assess for infection', 'Assess for spreading infection', 'Consider diabetic foot complications', 'Arrange urgent assessment', 'Provide clear safety-netting', 'Address diabetes control'],
  '## Model Approach

**Key Priorities:**
1. **URGENT: Recognise diabetic foot problem**
2. Assess for infection and spreading
3. Assess for systemic infection
4. Arrange urgent face-to-face assessment
5. Consider diabetic foot complications
6. Clear safety-netting

**Differential Diagnosis:**
- Paronychia with cellulitis (most likely)
- Diabetic foot infection (high risk given diabetes)
- Osteomyelitis (consider if deep infection)
- Other causes (less likely)

**Management:**
- **URGENT: Face-to-face assessment needed**
  - Cannot assess foot properly over telephone
  - Signs of infection with systemic symptoms
  - Diabetic patient = high risk
- Arrange same-day assessment:
  - Face-to-face appointment or
  - Consider urgent care/minor injuries if practice unavailable
- If seen:
  - Assess extent of infection
  - Consider antibiotics (likely needed)
  - Consider swab if discharge
  - Assess for deeper infection
- Safety-netting: If redness spreads rapidly, if becomes more unwell, or if unable to get seen - seek urgent medical attention or A&E
- Follow-up: Review same day or next day
- Consider diabetic foot team referral if severe

**Important:** Diabetic foot problems are emergencies. Urgent assessment required.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed foot problem systematically", "Explored infection signs", "Assessed for spreading", "Explored diabetes history", "Assessed for systemic symptoms", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised urgency appropriately", "Arranged urgent assessment", "Considered diabetic foot complications", "Provided clear safety-netting", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for concerns", "Used clear, reassuring language", "Addressed diabetes concerns", "Listened actively", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 26: Persistent Fatigue in Young Adult
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Fatigue Consultation',
  'General Medicine',
  'GEN-001',
  'You are a GP trainee. A 25-year-old woman, Ms. Hannah Green, has booked a video consultation. She has been experiencing persistent fatigue for the last 4 months.',
  '{"name": "Ms. Hannah Green", "age": 25, "gender": "Female"}',
  '{"patient": "Ms. Hannah Green", "age": 25, "gender": "Female", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "Works as a teacher, lives with partner", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hi doctor, I''ve been feeling really tired for months now and I don''t know why. It''s affecting my work and I''m starting to worry there might be something wrong.",
    "freely_given_history": {
      "presenting_complaint": "Persistent fatigue for 4 months. Not improving. Affecting daily life.",
      "psychosocial_impact": "Struggling at work. Affecting relationships. Very frustrated.",
      "ice": {
        "ideas": "Wondering if it''s anaemia, thyroid, or something else. Worried it might be serious.",
        "concerns": "Concerned about impact on life. Worried about serious illness.",
        "expectations": "Wants to know the cause and get treatment"
      }
    },
    "history_on_direct_questioning": {
      "fatigue": {
        "onset": "Started gradually 4 months ago",
        "severity": "Very tired, struggling to get through day, needs to nap",
        "pattern": "Worse in morning, slightly better in afternoon, exhausted by evening",
        "sleep": "Sleeping 8-9 hours but not feeling rested",
        "exercise": "Used to exercise regularly, now too tired",
        "concentration": "Poor concentration, brain fog",
        "activities": "Struggling with daily activities, work affected"
      },
      "associated_symptoms": {
        "muscle_aches": "Some muscle aches and pains",
        "joint_pain": "No joint pain",
        "headaches": "Occasional headaches",
        "sore_throat": "No sore throat",
        "lymph_nodes": "No swollen glands",
        "fever": "No fever",
        "weight": "No weight loss or gain",
        "appetite": "Appetite normal"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "mental_health": "No previous mental health problems",
        "infections": "No recent infections"
      },
      "menstrual": {
        "periods": "Regular periods, every 28 days",
        "contraception": "Combined oral contraceptive pill",
        "pms": "Some PMS symptoms but manageable"
      },
      "social_hx": {
        "work": "Works as primary school teacher, finds it stressful",
        "stress": "Work has been very stressful recently",
        "sleep_hygiene": "Goes to bed around 10pm, wakes 7am, but doesn''t feel rested",
        "diet": "Eats reasonably well but sometimes skips meals when busy"
      }
    }
  }',
  'FRUSTRATED but ENGAGED. Show impact on life. If doctor takes it seriously and investigates, show relief. May be worried about serious causes.',
  'full',
  720,
  'medium',
  ARRAY['Take systematic fatigue history', 'Assess for red flags', 'Consider common causes (anaemia, thyroid, mental health)', 'Explore lifestyle factors', 'Plan appropriate investigations', 'Address concerns'],
  '## Model Approach

**Key Priorities:**
1. Systematic fatigue history
2. Assess for red flags (weight loss, fever, lymphadenopathy)
3. Consider common causes
4. Explore lifestyle factors
5. Plan investigations
6. Address concerns

**Differential Diagnosis:**
- Mental health (depression, anxiety, stress) - likely given work stress
- Anaemia (consider - common cause)
- Thyroid dysfunction (consider)
- Chronic fatigue syndrome (consider if criteria met)
- Other causes (less likely)

**Management:**
- Investigations:
  - FBC (check for anaemia)
  - TFTs
  - U&E, LFTs, glucose
  - Consider B12, folate
  - Consider ferritin
- Address lifestyle:
  - Sleep hygiene
  - Stress management
  - Diet review
- Mental health:
  - Screen for depression/anxiety
  - Consider if stress-related
- Follow-up: Review in 2-3 weeks with results
- Safety-netting: If develops red flags (weight loss, fever, other symptoms) - seek medical attention
- Consider referral if no cause found and persistent

**Note:** Fatigue is common and often multifactorial. Systematic approach needed.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic fatigue history", "Assessed for red flags", "Explored lifestyle factors", "Screened for mental health", "Explored ICE", "Obtained relevant history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Planned appropriate investigations", "Addressed lifestyle factors", "Considered mental health", "Provided clear safety-netting", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for frustration", "Used clear language", "Listened actively", "Addressed concerns", "Involved patient in decisions", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 27: Microcytic Anaemia in Older Adult
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Anaemia Investigation',
  'Haematology',
  'HAEM-001',
  'You are a GP trainee. A 72-year-old woman, Mrs. Barbara Clark, has booked a telephone consultation. She had routine blood tests done 5 days ago and the results show a microcytic anaemia.',
  '{"name": "Mrs. Barbara Clark", "age": 72, "gender": "Female"}',
  '{"patient": "Mrs. Barbara Clark", "age": 72, "gender": "Female", "pmh": "Hypertension, Osteoarthritis", "medications": "Amlodipine 5mg OD, Ibuprofen 400mg TDS PRN", "allergies": "None known", "social_summary": "Retired, lives with husband, non-smoker, no alcohol", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I got a message about my blood test results. I wasn''t expecting anything to be wrong. I feel fine really, just a bit tired sometimes but I put that down to getting older.",
    "freely_given_history": {
      "presenting_complaint": "Called about blood test results showing anaemia. No specific symptoms.",
      "psychosocial_impact": "Slightly concerned but not overly worried.",
      "ice": {
        "ideas": "Not sure what anaemia means. Wondering if it''s serious.",
        "concerns": "Mild concern. Wants to understand what it means.",
        "expectations": "Wants explanation and to know if treatment needed"
      }
    },
    "history_on_direct_questioning": {
      "symptoms": {
        "fatigue": "Feeling a bit more tired than usual, but put it down to age",
        "breathlessness": "Slightly more breathless on exertion, but manages daily activities",
        "dizziness": "Occasional dizziness, especially on standing",
        "palpitations": "No palpitations",
        "pale": "Not aware of being pale",
        "hair_loss": "No hair loss",
        "brittle_nails": "No brittle nails"
      },
      "bleeding": {
        "bowel": "No blood in stools, no change in bowel habit",
        "urine": "No blood in urine",
        "gums": "Gums sometimes bleed when brushing, but always has",
        "nose": "No nosebleeds",
        "bruising": "Bruises easily, always has"
      },
      "diet": {
        "meat": "Eats meat 2-3 times per week",
        "vegetables": "Eats vegetables daily",
        "diet": "Generally eats well"
      },
      "pmh": {
        "medical_conditions": "Hypertension, osteoarthritis",
        "surgery": "No previous surgery",
        "bleeding": "No history of bleeding problems"
      },
      "dhx": {
        "regular": "Amlodipine 5mg OD",
        "prn": "Ibuprofen 400mg TDS for joint pain, takes most days",
        "aspirin": "No aspirin"
      },
      "social_hx": {
        "diet": "Eats well, balanced diet",
        "alcohol": "No alcohol"
      }
    },
    "test_results": {
      "hb": 98,
      "hb_range": "115-165 g/L",
      "mcv": 72,
      "mcv_range": "80-100 fL",
      "ferritin": 8,
      "ferritin_range": "15-200 μg/L",
      "b12": "Normal",
      "folate": "Normal"
    }
  }',
  'CALM but CURIOUS. Answer questions clearly. Show some concern if doctor mentions serious causes. Accept investigations if explained well.',
  'full',
  720,
  'medium',
  ARRAY['Interpret microcytic anaemia', 'Assess for symptoms', 'Consider causes (iron deficiency, blood loss)', 'Assess for GI blood loss', 'Review medications (NSAIDs)', 'Plan appropriate investigations', 'Address iron deficiency'],
  '## Model Approach

**Key Priorities:**
1. Interpret anaemia results
2. Assess for symptoms
3. Consider causes (iron deficiency most likely given low ferritin)
4. Assess for blood loss (especially GI)
5. Review medications (ibuprofen can cause GI bleeding)
6. Plan investigations
7. Address iron deficiency

**Differential Diagnosis:**
- Iron deficiency anaemia (most likely - microcytic, low ferritin)
  - Cause: Likely GI blood loss from NSAIDs (ibuprofen)
  - Other causes: Dietary (less likely given diet), other blood loss
- Other microcytic anaemias (less likely - thalassaemia, sideroblastic)

**Management:**
- Address iron deficiency:
  - Start iron replacement (ferrous sulphate 200mg BD)
  - Take with food to reduce side effects
  - Explain may take 3-6 months to correct
- Investigate cause:
  - **CRITICAL: Assess for GI blood loss**
  - Consider stopping/reducing ibuprofen if possible
  - Consider GI investigations (OGD, colonoscopy) given age and NSAID use
  - Consider faecal occult blood test
- Review medications:
  - Consider reducing/stopping ibuprofen
  - Consider alternative pain relief
  - Consider PPI if continuing NSAIDs
- Follow-up:
  - Review in 4-6 weeks to check response
  - Recheck FBC and ferritin
- Safety-netting: If develops GI bleeding, worsening symptoms, or other concerns - seek medical attention

**Important:** In older adults with iron deficiency, always consider GI blood loss, especially with NSAID use.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Interpreted anaemia results", "Assessed for symptoms", "Explored bleeding history", "Reviewed medications", "Assessed diet", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Diagnosed iron deficiency appropriately", "Considered GI blood loss", "Planned iron replacement", "Considered GI investigations", "Reviewed medications", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Reassured appropriately", "Used clear, non-jargon language", "Listened actively", "Addressed concerns", "Involved patient in decisions", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 28: Sudden-Onset Vertigo
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Dizziness Consultation',
  'Neurology',
  'NEURO-001',
  'You are a GP trainee. A 45-year-old woman, Mrs. Linda Foster, has booked an urgent telephone consultation. She woke up this morning with severe dizziness and is unable to get out of bed.',
  '{"name": "Mrs. Linda Foster", "age": 45, "gender": "Female"}',
  '{"patient": "Mrs. Linda Foster", "age": 45, "gender": "Female", "pmh": "Migraine (occasional), Hypertension", "medications": "Ramipril 5mg OD, Sumatriptan PRN", "allergies": "None known", "social_summary": "Works as an accountant, lives with husband", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Doctor, I need help. I woke up this morning and the room is spinning. I can''t stand up, I feel like I''m going to be sick. I''ve never felt like this before.",
    "freely_given_history": {
      "presenting_complaint": "Severe dizziness/vertigo since waking this morning. Unable to move.",
      "psychosocial_impact": "Very frightened. Unable to function. Husband concerned.",
      "ice": {
        "ideas": "Not sure what''s wrong. Worried it might be a stroke or something serious.",
        "concerns": "Very scared. Worried about serious causes. Wants to know if needs to go to hospital.",
        "expectations": "Wants urgent help and to know what''s wrong"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "type": "Room spinning, true vertigo",
        "onset": "Woke up with it this morning, sudden onset",
        "severity": "Severe, unable to stand, bed-bound",
        "movement": "Worse with any head movement, even slight",
        "position": "Lying still helps slightly, but still spinning",
        "nausea": "Severe nausea, feels like will vomit",
        "vomiting": "Has vomited twice",
        "hearing": "No hearing loss, no tinnitus",
        "ear": "No ear pain, no discharge",
        "vision": "Eyes feel like they''re moving (nystagmus)",
        "speech": "Speech normal",
        "weakness": "No weakness, no numbness",
        "headache": "No headache"
      },
      "pmh": {
        "migraine": "Has occasional migraines, last one 3 months ago",
        "hypertension": "Well controlled",
        "other": "No other medical conditions"
      },
      "previous_episodes": {
        "vertigo": "Never had vertigo before",
        "dizziness": "Occasional lightheadedness but nothing like this"
      },
      "red_flags": {
        "neurological": "No weakness, no numbness, no speech problems, no visual problems",
        "headache": "No headache",
        "hearing": "No hearing loss",
        "fever": "No fever"
      }
    }
  }',
  'VERY DISTRESSED and FRIGHTENED. Show severe symptoms. If doctor is reassuring and explains likely cause, show some relief. May be very anxious about stroke.',
  'full',
  720,
  'medium',
  ARRAY['Assess vertigo systematically', 'Distinguish vertigo from dizziness', 'Assess for red flags (stroke)', 'Consider BPPV vs vestibular neuritis', 'Provide symptomatic treatment', 'Provide clear safety-netting'],
  '## Model Approach

**Key Priorities:**
1. Assess for red flags (stroke, central causes)
2. Distinguish true vertigo from dizziness
3. Assess characteristics (BPPV vs vestibular neuritis)
4. Provide symptomatic treatment
5. Clear safety-netting

**Differential Diagnosis:**
- Vestibular neuritis (most likely - sudden onset, severe, no hearing loss, no previous episodes)
- BPPV (consider - but usually position-related, not constant)
- Migraine-associated vertigo (consider given migraine history)
- Stroke/TIA (must exclude - but no neurological signs)
- Other causes (less likely)

**Management:**
- Assess for red flags:
  - No neurological signs (good sign)
  - No hearing loss (suggests peripheral, not central)
  - Consider if stroke risk factors present
- Symptomatic treatment:
  - Prochlorperazine or cyclizine for nausea/vertigo
  - Advise rest, avoid head movements
  - Stay hydrated
- Safety-netting:
  - **CRITICAL: If develops neurological symptoms, headache, or hearing loss - seek urgent medical attention or call 999**
  - If not improving in 24-48 hours - review
- Follow-up:
  - Review in 24-48 hours if not improving
  - Consider ENT referral if persistent
  - Consider Epley manoeuvre if BPPV suspected

**Important:** Always exclude stroke in vertigo, but vestibular neuritis is common and usually benign.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed vertigo systematically", "Distinguished vertigo from dizziness", "Assessed for red flags", "Explored hearing, neurological symptoms", "Explored ICE", "Obtained relevant history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered appropriate diagnosis", "Excluded stroke appropriately", "Provided symptomatic treatment", "Gave clear safety-netting", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for distress", "Used clear, reassuring language", "Listened actively", "Addressed concerns about stroke", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 29: Sick Note Request for Skin Condition
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Fitness for Work Assessment',
  'Occupational Health',
  'OCC-001',
  'You are a GP trainee. A 28-year-old man, Mr. Kevin Mitchell, has booked a telephone consultation. He works as a chef and has developed a skin condition on his hands.',
  '{"name": "Mr. Kevin Mitchell", "age": 28, "gender": "Male"}',
  '{"patient": "Mr. Kevin Mitchell", "age": 28, "gender": "Male", "pmh": "Eczema (childhood, resolved)", "medications": "None", "allergies": "None known", "social_summary": "Works as a chef in a restaurant", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hi doctor, I need a sick note. I''ve got this rash on my hands and my boss says I can''t work with it because of food hygiene. I need a note to be off work.",
    "freely_given_history": {
      "presenting_complaint": "Rash on hands for 2 weeks. Boss says can''t work. Wants sick note.",
      "psychosocial_impact": "Worried about work. Needs to work to pay bills.",
      "ice": {
        "ideas": "Thinks it might be eczema or something from work.",
        "concerns": "Worried about losing job. Needs sick note.",
        "expectations": "Wants sick note and treatment"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "site": "Both hands, especially fingers and palms",
        "appearance": "Red, dry, cracked skin, some weeping areas",
        "onset": "Started 2 weeks ago, gradually getting worse",
        "itch": "Very itchy, especially at night",
        "pain": "Painful where skin is cracked",
        "work": "Worse at work, especially when hands are wet or in contact with cleaning products"
      },
      "occupation": {
        "job": "Works as a chef, handles food, uses cleaning products frequently",
        "gloves": "Wears gloves but hands get sweaty, makes it worse",
        "exposure": "Frequent hand washing, contact with detergents, food",
        "time_off": "Has been off work for 3 days, boss wants medical note"
      },
      "pmh": {
        "eczema": "Had eczema as a child, resolved in teens",
        "atopy": "Has hayfever",
        "other": "No other medical conditions"
      },
      "treatment": {
        "tried": "Has tried moisturisers, not helping much",
        "steroids": "Hasn''t tried steroid cream"
      }
    }
  }',
  'WORRIED and PRACTICAL. Show concern about work. If doctor addresses work concerns and provides practical solution, show relief. May be frustrated about work situation.',
  'full',
  720,
  'medium',
  ARRAY['Assess skin condition', 'Consider occupational causes', 'Address fitness for work', 'Provide appropriate treatment', 'Consider occupational health', 'Address work concerns'],
  '## Model Approach

**Key Priorities:**
1. Assess skin condition
2. Consider occupational causes (contact dermatitis)
3. Address fitness for work
4. Provide treatment
5. Consider occupational health
6. Address work concerns

**Differential Diagnosis:**
- Contact dermatitis (most likely - occupational, exposure to irritants)
- Atopic eczema (consider - history of eczema, atopy)
- Other causes (less likely)

**Management:**
- Treatment:
  - Topical steroid (moderate potency) for hands
  - Emollients frequently
  - Avoid irritants where possible
  - Consider barrier cream
- Fitness for work:
  - If weeping/infected - may need time off until controlled
  - If controlled with treatment - may be able to work with precautions
  - Consider occupational health referral
- Work modifications:
  - Discuss with employer about reducing irritant exposure
  - Proper glove use
  - Hand care at work
- Sick note:
  - If needed, provide short-term note
  - Review when condition improves
- Follow-up: Review in 1 week
- Safety-netting: If not improving or worsening - review

**Note:** Balance patient needs with food safety requirements.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed skin condition", "Explored occupational factors", "Assessed work impact", "Explored treatment tried", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Provided appropriate treatment", "Addressed fitness for work", "Considered occupational health", "Addressed work concerns", "Arranged follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for work concerns", "Used clear language", "Listened actively", "Addressed practical concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 30: Prescription Request After Prison Release
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Medication Request Consultation',
  'General Practice',
  'GEN-002',
  'You are a GP trainee. A 34-year-old man, Mr. Marcus Johnson, has booked a telephone consultation. He was recently released from prison and needs to register with a GP and get his medications.',
  '{"name": "Mr. Marcus Johnson", "age": 34, "gender": "Male"}',
  '{"patient": "Mr. Marcus Johnson", "age": 34, "gender": "Male", "pmh": "Type 2 diabetes, Hypertension, Depression", "medications": "Metformin 1g BD, Gliclazide 80mg BD, Ramipril 5mg OD, Sertraline 100mg OD", "allergies": "None known", "social_summary": "Recently released from prison, staying in temporary accommodation", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I just got out of prison last week and I need to register and get my medications. I''m running out and I don''t know what to do.",
    "freely_given_history": {
      "presenting_complaint": "Recently released from prison, needs to register and get medications.",
      "psychosocial_impact": "Anxious about accessing healthcare. Worried about running out of medications.",
      "ice": {
        "ideas": "Not sure how to register. Worried about getting medications in time.",
        "concerns": "Concerned about continuity of care. Worried about health if can''t get medications.",
        "expectations": "Wants to register and get prescriptions"
      }
    },
    "history_on_direct_questioning": {
      "medications": {
        "current": "Metformin 1g BD, Gliclazide 80mg BD, Ramipril 5mg OD, Sertraline 100mg OD",
        "supply": "Has about 3 days left of medications",
        "prison": "Was on these medications in prison, stable",
        "compliance": "Takes medications regularly"
      },
      "medical_history": {
        "diabetes": "Type 2 diabetes, diagnosed 5 years ago, usually well controlled",
        "hypertension": "Well controlled",
        "depression": "Has depression, on sertraline, stable"
      },
      "registration": {
        "previous_gp": "Was registered with GP before prison, practice closed",
        "address": "Currently in temporary accommodation, may move soon",
        "nhs_number": "Has NHS number"
      },
      "social_hx": {
        "accommodation": "Temporary accommodation, may be moving",
        "support": "Limited support network",
        "substance_use": "No current substance use (was in prison for non-drug related offence)"
      }
    }
  }',
  'ANXIOUS but COOPERATIVE. Show concern about accessing care. If doctor is helpful and understanding, show relief. May be defensive about prison history.',
  'full',
  720,
  'medium',
  ARRAY['Facilitate registration', 'Ensure medication continuity', 'Assess current health', 'Address barriers to care', 'Provide support', 'Consider social factors'],
  '## Model Approach

**Key Priorities:**
1. Facilitate registration urgently
2. Ensure medication continuity (critical)
3. Assess current health status
4. Address barriers to care
5. Provide support
6. Consider social factors

**Key Considerations:**
- People leaving prison face health inequalities
- Medication continuity is critical (especially diabetes, mental health)
- Need for urgent registration and prescriptions
- May have complex health and social needs

**Management:**
- Registration:
  - Facilitate urgent registration
  - Can register with temporary address
  - Obtain medical records from prison if possible
- Medications:
  - **URGENT: Provide prescriptions to ensure continuity**
  - Can prescribe based on patient report initially
  - Verify with prison records if available
  - Arrange regular prescriptions
- Health assessment:
  - Review current health status
  - Check diabetes control (may need HbA1c)
  - Review mental health
- Support:
  - Address barriers to care
  - Provide information about services
  - Consider social support if needed
- Follow-up:
  - Arrange follow-up appointment
  - Review medications once records available
- Safety-netting: Clear advice on when to seek urgent help

**Important:** Ensure medication continuity is priority. Don''t let people leave without medications.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored medication needs", "Assessed current health", "Explored registration status", "Explored social factors", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Facilitated registration", "Ensured medication continuity", "Addressed barriers to care", "Provided support", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy", "Used non-judgmental approach", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 31: Patient-Initiated DNACPR Request
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Advance Care Planning Discussion',
  'Ethics & Communication',
  'ETH-002',
  'You are a GP trainee. An 82-year-old man, Mr. Harold Wilson, has booked a video consultation. He has multiple medical conditions and wants to discuss his wishes regarding resuscitation.',
  '{"name": "Mr. Harold Wilson", "age": 82, "gender": "Male"}',
  '{"patient": "Mr. Harold Wilson", "age": 82, "gender": "Male", "pmh": "Heart failure, COPD, Chronic kidney disease stage 3, Previous stroke", "medications": "Multiple medications including diuretics, ACE inhibitor, inhalers", "allergies": "None known", "social_summary": "Lives alone, has good family support", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I''ve been thinking about things and I want to talk to you about what happens if I get really poorly. I don''t want to be resuscitated if my heart stops. I''ve had a good life and I don''t want to be kept alive artificially.",
    "freely_given_history": {
      "presenting_complaint": "Wants to discuss DNACPR. Has been thinking about end-of-life wishes.",
      "psychosocial_impact": "Has been reflecting on life. Wants to ensure wishes are known.",
      "ice": {
        "ideas": "Understands he has multiple health problems. Doesn''t want aggressive treatment.",
        "concerns": "Worried about being kept alive against his wishes. Wants to die naturally.",
        "expectations": "Wants DNACPR form completed. Wants his wishes documented."
      }
    },
    "history_on_direct_questioning": {
      "health_status": {
        "current": "Multiple health problems, managing at home with support",
        "function": "Getting frailer, needs more help with daily activities",
        "hospitalisations": "Has been in hospital 3 times in last year",
        "prognosis": "Understands his conditions are serious and progressive"
      },
      "wishes": {
        "resuscitation": "Does not want CPR if heart stops",
        "treatment": "Wants treatment for reversible conditions, but not aggressive life-prolonging",
        "place": "Wants to die at home if possible, not in hospital",
        "family": "Has discussed with family, they understand and support"
      },
      "capacity": {
        "understanding": "Understands what DNACPR means",
        "decision": "Has capacity to make this decision",
        "pressure": "Not under pressure from family, this is his own decision"
      },
      "pmh": {
        "heart_failure": "Moderate heart failure, stable on treatment",
        "copd": "Moderate COPD, uses inhalers",
        "ckd": "Stage 3 CKD, stable",
        "stroke": "Had stroke 2 years ago, made good recovery"
      },
      "social_hx": {
        "living": "Lives alone but has daily support from family",
        "family": "Has children and grandchildren, good relationships",
        "support": "Good family support network"
      }
    }
  }',
  'THOUGHTFUL and RESOLVED. Show that this is a considered decision. If doctor explores wishes appropriately, show appreciation. Want clear documentation of wishes.',
  'full',
  720,
  'hard',
  ARRAY['Assess capacity', 'Explore understanding of DNACPR', 'Explore wishes comprehensively', 'Ensure decision is patient''s own', 'Document appropriately', 'Consider advance care planning', 'Address family concerns'],
  '## Model Approach

**Key Priorities:**
1. Assess capacity
2. Explore understanding of DNACPR
3. Explore wishes comprehensively
4. Ensure decision is patient''s own (not coerced)
5. Document appropriately
6. Consider advance care planning

**Key Considerations:**
- Patient-initiated DNACPR is valid
- Must assess capacity
- Must ensure understanding
- Must ensure not coerced
- Should explore wishes comprehensively
- Consider advance care planning

**Management:**
- Assess capacity:
  - Patient understands what DNACPR means
  - Can retain information
  - Can weigh up decision
  - Can communicate decision
- Explore wishes:
  - What does patient want/not want?
  - Treatment preferences
  - Place of care preferences
  - Family involvement
- Document:
  - Complete DNACPR form if appropriate
  - Document discussion clearly
  - Ensure form is accessible (e.g., on Summary Care Record)
- Advance care planning:
  - Consider advance decision to refuse treatment
  - Consider lasting power of attorney
  - Discuss with family (with patient consent)
- Follow-up:
  - Review periodically
  - Update if wishes change
- Safety-netting: Ensure form is accessible to emergency services

**Important:** Patient-initiated DNACPR is valid. Must assess capacity and ensure understanding.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed capacity", "Explored understanding of DNACPR", "Explored wishes comprehensively", "Assessed for coercion", "Explored ICE", "Obtained relevant history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed DNACPR appropriately", "Documented clearly", "Considered advance care planning", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy", "Used clear, sensitive language", "Listened actively", "Respected patient autonomy", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 32: Medication Request in Patient with Epilepsy
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Epilepsy Medication Review',
  'Neurology',
  'NEURO-002',
  'You are a GP trainee. A 29-year-old woman, Ms. Sophie Turner, has booked a telephone consultation. She has epilepsy and is requesting a repeat prescription of her anti-epileptic medication.',
  '{"name": "Ms. Sophie Turner", "age": 29, "gender": "Female"}',
  '{"patient": "Ms. Sophie Turner", "age": 29, "gender": "Female", "pmh": "Epilepsy (diagnosed age 16), Well controlled on medication", "medications": "Lamotrigine 200mg BD", "allergies": "None known", "social_summary": "Works as a teacher, drives, lives with partner", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hi doctor, I need a repeat prescription for my epilepsy medication. I''m running low and need to order more.",
    "freely_given_history": {
      "presenting_complaint": "Needs repeat prescription for lamotrigine. Running low.",
      "psychosocial_impact": "Worried about running out. Needs medication to drive.",
      "ice": {
        "ideas": "Just needs prescription. Worried about running out.",
        "concerns": "Concerned about having a seizure if runs out. Needs to drive for work.",
        "expectations": "Wants prescription today"
      }
    },
    "history_on_direct_questioning": {
      "epilepsy": {
        "control": "Well controlled, no seizures for 3 years",
        "medication": "Lamotrigine 200mg BD, takes regularly",
        "compliance": "Never misses doses, very careful",
        "driving": "Drives, has DVLA license, declared epilepsy"
      },
      "current_status": {
        "seizures": "No seizures, well controlled",
        "side_effects": "No side effects from medication",
        "review": "Usually reviewed by neurologist annually, last review 6 months ago"
      },
      "prescription": {
        "supply": "Has about 5 days left",
        "usual": "Gets 2 months supply at a time",
        "urgent": "Needs prescription urgently to avoid running out"
      },
      "pmh": {
        "epilepsy": "Diagnosed age 16, well controlled",
        "other": "No other medical conditions"
      },
      "social_hx": {
        "driving": "Drives for work, needs license",
        "work": "Works as teacher, needs to be reliable",
        "pregnancy": "Not pregnant, not planning pregnancy"
      }
    }
  }',
  'CALM but URGENT. Show need for prescription. If doctor provides prescription promptly, show relief. May be anxious about running out.',
  'full',
  720,
  'easy',
  ARRAY['Ensure medication continuity', 'Assess epilepsy control', 'Review medication compliance', 'Consider driving regulations', 'Provide prescription promptly', 'Arrange appropriate follow-up'],
  '## Model Approach

**Key Priorities:**
1. Ensure medication continuity (critical)
2. Assess epilepsy control
3. Review compliance
4. Consider driving regulations
5. Provide prescription
6. Arrange follow-up

**Key Considerations:**
- Medication continuity is critical for epilepsy
- Running out can cause breakthrough seizures
- Driving regulations important
- Need for regular review

**Management:**
- **URGENT: Provide prescription to ensure continuity**
  - Critical not to run out
  - Can cause breakthrough seizures
- Review:
  - Assess control (well controlled - good)
  - Review compliance (excellent)
  - Check for side effects (none)
- Driving:
  - Patient has DVLA license
  - Must remain seizure-free to drive
  - Important to maintain control
- Prescription:
  - Provide usual supply (2 months)
  - Ensure continuity
- Follow-up:
  - Arrange regular review
  - Consider annual review with neurologist
- Safety-netting: If develops seizures or side effects - seek medical attention

**Important:** Medication continuity is critical. Don''t let epilepsy patients run out of medication.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed epilepsy control", "Reviewed medication compliance", "Explored driving status", "Assessed current status", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Ensured medication continuity", "Provided prescription promptly", "Considered driving regulations", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated understanding of urgency", "Used clear language", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 33: Low Platelet Count in Young Adult
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Abnormal Blood Test Results',
  'Haematology',
  'HAEM-002',
  'You are a GP trainee. A 24-year-old woman, Ms. Emma Watson, has booked a telephone consultation. She had routine blood tests done 4 days ago and the results show a low platelet count.',
  '{"name": "Ms. Emma Watson", "age": 24, "gender": "Female"}',
  '{"patient": "Ms. Emma Watson", "age": 24, "gender": "Female", "pmh": "No significant past medical history", "medications": "Combined oral contraceptive pill", "allergies": "None known", "social_summary": "University student, non-smoker, occasional alcohol", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hi doctor, I got a message about my blood test results. I wasn''t expecting anything to be wrong. Is everything okay?",
    "freely_given_history": {
      "presenting_complaint": "Called about blood test results showing low platelets. No symptoms.",
      "psychosocial_impact": "Slightly concerned but not overly worried.",
      "ice": {
        "ideas": "Not sure what it means. Wondering if it''s serious.",
        "concerns": "Mild concern. Wants to understand what it means.",
        "expectations": "Wants explanation and to know if treatment needed"
      }
    },
    "history_on_direct_questioning": {
      "symptoms": {
        "bleeding": "No unusual bleeding",
        "bruising": "No unusual bruising",
        "petechiae": "No petechiae or rash",
        "nosebleeds": "No nosebleeds",
        "gums": "Gums normal, no bleeding",
        "menstrual": "Periods normal, no heavy bleeding",
        "fatigue": "No unusual fatigue",
        "fever": "No fever",
        "illness": "No recent illness"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "bleeding_disorders": "No history of bleeding problems",
        "autoimmune": "No autoimmune conditions"
      },
      "dhx": {
        "regular": "Combined oral contraceptive pill",
        "other": "No other medications",
        "recent": "No recent medication changes"
      },
      "social_hx": {
        "alcohol": "Occasional alcohol, 5-10 units per week",
        "substances": "No recreational drugs",
        "travel": "No recent travel"
      }
    },
    "test_results": {
      "platelets": 85,
      "platelets_range": "150-400 x 10^9/L",
      "fbc": "Other counts normal (Hb, WCC normal)",
      "other_tests": "All other tests normal"
    }
  }',
  'CALM but CURIOUS. Answer questions clearly. Show some concern if doctor mentions serious causes. Accept investigations if explained well.',
  'full',
  720,
  'medium',
  ARRAY['Interpret thrombocytopenia', 'Assess for bleeding symptoms', 'Consider causes (ITP, drug-induced, viral)', 'Assess severity', 'Plan appropriate investigations', 'Provide clear safety-netting'],
  '## Model Approach

**Key Priorities:**
1. Interpret thrombocytopenia
2. Assess for bleeding symptoms (none - good sign)
3. Consider causes
4. Assess severity (mild - platelets 85)
5. Plan investigations
6. Provide safety-netting

**Differential Diagnosis:**
- Idiopathic thrombocytopenic purpura (ITP) (consider - young woman, isolated thrombocytopenia)
- Drug-induced (consider - COCP can rarely cause)
- Viral (consider - can cause transient thrombocytopenia)
- Other causes (less likely)

**Management:**
- Reassurance:
  - Mild thrombocytopenia (85)
  - No bleeding symptoms (good sign)
  - Usually not immediately dangerous
- Investigations:
  - Repeat FBC in 1-2 weeks (may be transient)
  - Consider viral screen if recent illness
  - Consider autoimmune screen if persistent
- Review medications:
  - Consider if COCP could be contributing (rare)
  - Usually safe to continue if no bleeding
- Safety-netting:
  - **CRITICAL: If develops bleeding, bruising, petechiae, or other symptoms - seek urgent medical attention**
  - Avoid contact sports if platelets very low
- Follow-up:
  - Review in 1-2 weeks with repeat FBC
  - Consider haematology referral if persistent or worsening

**Important:** Mild thrombocytopenia with no bleeding is usually not urgent, but needs monitoring.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Interpreted thrombocytopenia", "Assessed for bleeding symptoms", "Explored medications", "Explored recent illness", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Assessed severity appropriately", "Considered appropriate causes", "Planned investigations", "Provided clear safety-netting", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Reassured appropriately", "Used clear, non-jargon language", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 34: Enuresis in Child
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Bedwetting Concerns',
  'Paediatrics',
  'PAED-004',
  'You are a GP trainee. A mother, Mrs. Claire Mitchell, has booked a telephone consultation about her 8-year-old son, Tom. Tom is still wetting the bed at night.',
  '{"name": "Tom Mitchell", "age": 8, "gender": "Male", "parent": "Mrs. Claire Mitchell"}',
  '{"patient": "Tom Mitchell", "age": 8, "gender": "Male", "parent": "Mrs. Claire Mitchell", "pmh": "Generally healthy child, no medical conditions", "medications": "None", "allergies": "No known allergies", "social_summary": "Lives with mother and father, attends primary school", "family_summary": "Father had bedwetting as a child"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about my son Tom. He''s 8 years old and he''s still wetting the bed. It''s happening most nights and I''m worried about him. He''s starting to get embarrassed about it.",
    "freely_given_history": {
      "presenting_complaint": "8-year-old still wetting bed most nights. Getting worse recently.",
      "psychosocial_impact": "Child embarrassed. Affecting sleepovers, school trips. Parents concerned.",
      "ice": {
        "ideas": "Not sure if it''s normal at this age. Worried there might be a problem.",
        "concerns": "Worried about impact on child. Concerned about underlying cause.",
        "expectations": "Wants to know if treatment is available"
      }
    },
    "history_on_direct_questioning": {
      "enuresis": {
        "frequency": "Wets bed 5-6 nights per week",
        "amount": "Large amounts, soaks through",
        "pattern": "Happens in first half of night usually",
        "daytime": "No daytime wetting, dry during day",
        "duration": "Never been dry at night, always wet the bed",
        "recent_change": "Seems worse recently, more frequent"
      },
      "toileting": {
        "daytime": "Dry during day, no accidents",
        "frequency": "Passes urine normally during day",
        "constipation": "No constipation",
        "urgency": "No urgency, no frequency"
      },
      "pmh": {
        "medical": "No medical conditions",
        "utis": "No history of UTIs",
        "development": "Normal development otherwise"
      },
      "social": {
        "school": "Doing well at school",
        "stress": "School has been a bit stressful recently (new teacher)",
        "sleepovers": "Can''t go to sleepovers, very upset about it",
        "self_esteem": "Starting to feel bad about himself"
      },
      "fhx": {
        "enuresis": "Father wet the bed until age 10",
        "other": "No other significant family history"
      }
    }
  }',
  'CONCERNED but SUPPORTIVE parent. Show love for child. If doctor is understanding and provides practical advice, show relief. May feel guilty or frustrated.',
  'full',
  720,
  'medium',
  ARRAY['Assess enuresis systematically', 'Distinguish primary vs secondary', 'Assess for underlying causes', 'Address psychosocial impact', 'Provide treatment options', 'Consider family history', 'Address child''s concerns'],
  '## Model Approach

**Key Priorities:**
1. Assess enuresis pattern
2. Distinguish primary vs secondary (primary - never been dry)
3. Assess for underlying causes
4. Address psychosocial impact
5. Provide treatment options
6. Consider family history

**Differential Diagnosis:**
- Primary nocturnal enuresis (most likely - never been dry, family history)
- Secondary enuresis (less likely - would need trigger)
- Other causes (UTI, diabetes, constipation - screen for but unlikely)

**Management:**
- Reassurance:
  - Common problem
  - Family history (father) suggests genetic component
  - Usually resolves with time
- Treatment options:
  - Enuresis alarm (first-line, most effective)
  - Desmopressin (if alarm not suitable or for short-term use)
  - Star charts/rewards (supportive)
- Lifestyle:
  - Regular toileting before bed
  - Limit fluids before bed (but don''t restrict excessively)
  - Address constipation if present
- Support:
  - Reassure child (not their fault)
  - Address self-esteem
  - Support with sleepovers (waterproof sheets, etc.)
- Follow-up:
  - Review in 3 months
  - Consider referral to enuresis clinic if not improving
- Safety-netting: If develops daytime symptoms, pain, or other concerns - review

**Note:** Primary enuresis is common and usually resolves. Support and treatment can help.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed enuresis pattern", "Distinguished primary vs secondary", "Assessed for underlying causes", "Explored psychosocial impact", "Explored family history", "Explored ICE with parent"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Provided appropriate treatment options", "Addressed psychosocial impact", "Considered family history", "Arranged appropriate follow-up", "Considered referral if needed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy", "Used supportive language", "Listened actively", "Addressed parental concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 35: Uncontrolled Asthma in Young Adult
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Asthma Review Consultation',
  'Respiratory',
  'RESP-004',
  'You are a GP trainee. A 19-year-old woman, Ms. Jessica Brown, has booked a telephone consultation. She has asthma and has been using her reliever inhaler more frequently recently.',
  '{"name": "Ms. Jessica Brown", "age": 19, "gender": "Female"}',
  '{"patient": "Ms. Jessica Brown", "age": 19, "gender": "Female", "pmh": "Asthma (diagnosed age 8)", "medications": "Salbutamol 100mcg PRN, Beclomethasone 100mcg BD", "allergies": "None known", "social_summary": "University student, lives in halls, smokes occasionally", "family_summary": "Mother: asthma, Father: well"}',
  '{
    "opening_statement": "Hi doctor, I''ve been using my blue inhaler a lot more recently. I''m using it most days now and I''m a bit worried. My asthma used to be really well controlled.",
    "freely_given_history": {
      "presenting_complaint": "Using reliever inhaler more frequently. Asthma not as well controlled.",
      "psychosocial_impact": "Worried about asthma. Affecting daily activities slightly.",
      "ice": {
        "ideas": "Worried asthma is getting worse. Not sure why.",
        "concerns": "Concerned about needing more medication. Worried about having an attack.",
        "expectations": "Wants to know why and how to get it under control"
      }
    },
    "history_on_direct_questioning": {
      "asthma": {
        "symptoms": "Wheeze most days, especially at night and with exercise",
        "reliever_use": "Using salbutamol 3-4 times per day, most days",
        "preventer": "Takes beclomethasone BD, but sometimes forgets",
        "night_symptoms": "Wakes with cough/wheeze 2-3 times per week",
        "exercise": "Gets wheezy with exercise, limits what she does",
        "peak_flow": "Doesn''t check peak flow regularly"
      },
      "triggers": {
        "allergies": "Has hayfever, worse in spring/summer",
        "smoking": "Smokes occasionally, 5-10 cigarettes per week",
        "exercise": "Exercise triggers symptoms",
        "cold_weather": "Cold weather makes it worse",
        "stress": "Stress seems to make it worse (exams recently)"
      },
      "compliance": {
        "preventer": "Takes preventer most days but forgets sometimes, especially when busy",
        "technique": "Not sure if technique is right, hasn''t been checked recently"
      },
      "pmh": {
        "asthma": "Diagnosed age 8, usually well controlled",
        "hayfever": "Has hayfever, takes antihistamines PRN",
        "other": "No other medical conditions"
      },
      "social_hx": {
        "smoking": "Smokes occasionally, knows she shouldn''t",
        "university": "First year at university, living in halls",
        "stress": "Exams recently, been stressed"
      }
    }
  }',
  'WORRIED but ENGAGED. Show concern about asthma. If doctor addresses triggers and provides clear plan, show relief. May be defensive about smoking.',
  'full',
  720,
  'medium',
  ARRAY['Assess asthma control', 'Review medication compliance', 'Identify triggers', 'Address smoking', 'Optimise preventer therapy', 'Review inhaler technique', 'Provide asthma action plan'],
  '## Model Approach

**Key Priorities:**
1. Assess asthma control (poor - using reliever 3-4 times/day)
2. Review medication compliance (inconsistent)
3. Identify triggers
4. Address smoking (important)
5. Optimise preventer therapy
6. Review inhaler technique
7. Provide asthma action plan

**Asthma Control Assessment:**
- Poor control: Using reliever 3-4 times/day, night symptoms, exercise limitation
- Needs step-up in treatment

**Management:**
- Optimise preventer:
  - Ensure regular use (compliance issue)
  - May need step-up (consider combination inhaler)
  - Review inhaler technique (face-to-face)
- Address triggers:
  - Smoking cessation (critical)
  - Manage hayfever (may need regular antihistamine/steroid nasal spray)
  - Exercise management
- Education:
  - Importance of preventer
  - Correct technique
  - When to seek help
- Asthma action plan:
  - Provide written plan
  - When to increase treatment
  - When to seek urgent help
- Follow-up:
  - Review in 2-4 weeks
  - Consider face-to-face for technique check
- Safety-netting: If symptoms worsen, if reliever not helping, or if severe attack - seek urgent medical attention or call 999

**Important:** Poor control needs addressing. Smoking cessation is critical.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed asthma control", "Reviewed medication compliance", "Identified triggers", "Explored smoking", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Optimised preventer therapy", "Addressed smoking cessation", "Addressed triggers", "Provided asthma action plan", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy", "Addressed smoking sensitively", "Used clear language", "Listened actively", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 36: Visible Haematuria in Older Adult
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Blood in Urine Consultation',
  'Urology',
  'URO-002',
  'You are a GP trainee. A 68-year-old man, Mr. Peter Anderson, has booked an urgent telephone consultation. He has noticed blood in his urine.',
  '{"name": "Mr. Peter Anderson", "age": 68, "gender": "Male"}',
  '{"patient": "Mr. Peter Anderson", "age": 68, "gender": "Male", "pmh": "Hypertension, Benign prostatic hyperplasia", "medications": "Ramipril 5mg OD, Tamsulosin 400mcg OD", "allergies": "None known", "social_summary": "Retired, lives with wife, non-smoker, occasional alcohol", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I need to see someone urgently. I''ve noticed blood in my urine. It''s quite worrying. I''ve never had this before.",
    "freely_given_history": {
      "presenting_complaint": "Noticed blood in urine 2 days ago. Visible, red urine.",
      "psychosocial_impact": "Very worried. Concerned about serious causes.",
      "ice": {
        "ideas": "Worried it might be cancer or something serious.",
        "concerns": "Very concerned. Wants to know what''s causing it.",
        "expectations": "Wants urgent assessment and investigation"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "haematuria": "Visible blood in urine, red/pink colour",
        "onset": "Noticed 2 days ago, first time",
        "frequency": "Every time passes urine",
        "clots": "No clots",
        "pain": "No pain when passing urine",
        "frequency": "Passing urine more frequently than usual",
        "urgency": "Some urgency",
        "incomplete_emptying": "Feels like doesn''t empty completely"
      },
      "associated_symptoms": {
        "abdominal_pain": "No abdominal pain",
        "flank_pain": "No flank pain",
        "fever": "No fever",
        "weight_loss": "No weight loss",
        "trauma": "No recent trauma"
      },
      "pmh": {
        "bph": "Has BPH, on tamsulosin, usually well controlled",
        "hypertension": "Well controlled",
        "other": "No other medical conditions"
      },
      "social_hx": {
        "smoking": "Never smoked",
        "occupation": "Retired, previously worked in office",
        "exposure": "No known chemical exposure"
      },
      "red_flags": {
        "age": "68 years old (increased risk)",
        "visible": "Visible haematuria (always needs investigation)",
        "first_episode": "First episode"
      }
    }
  }',
  'WORRIED and ANXIOUS. Show significant concern. If doctor arranges urgent investigation, show some relief. May be very anxious about cancer.',
  'full',
  720,
  'hard',
  ARRAY['Recognise visible haematuria requires investigation', 'Assess for symptoms', 'Consider causes (malignancy, infection, stones)', 'Arrange urgent investigation', 'Consider 2-week wait referral', 'Provide clear safety-netting'],
  '## Model Approach

**Key Priorities:**
1. **URGENT: Recognise visible haematuria needs investigation**
2. Assess for symptoms
3. Consider causes (malignancy high on list given age)
4. Arrange urgent investigations
5. Consider 2-week wait referral
6. Provide clear safety-netting

**Differential Diagnosis:**
- Bladder cancer (consider - age, visible haematuria, no pain)
- Renal cancer (consider)
- UTI (consider - but less likely without pain/fever)
- Stones (consider - but less likely without pain)
- BPH-related (consider - has BPH)
- Other causes (less likely)

**Management:**
- **URGENT: Arrange investigations**
  - Urine dipstick/MSU (check for infection)
  - Urine cytology
  - Renal function
  - Consider 2-week wait urology referral (visible haematuria in older adult)
- Imaging:
  - Consider CT urogram or ultrasound
  - May be arranged by urology
- Safety-netting:
  - **CRITICAL: If develops severe pain, clots, or unable to pass urine - seek urgent medical attention or A&E**
  - If symptoms worsen - seek urgent help
- Follow-up:
  - Review with results
  - Urgent urology referral if appropriate

**Important:** Visible haematuria in older adults always needs investigation. Consider 2-week wait referral.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed haematuria systematically", "Explored associated symptoms", "Assessed for red flags", "Explored ICE", "Obtained relevant history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised urgency appropriately", "Arranged urgent investigations", "Considered 2-week wait referral", "Provided clear safety-netting", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for concerns", "Used clear, reassuring language", "Addressed cancer concerns", "Listened actively", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 37: Recurrent Fracture in Female Athlete
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Recurrent Injury Consultation',
  'Musculoskeletal',
  'MSK-002',
  'You are a GP trainee. A 22-year-old woman, Ms. Sarah Taylor, has booked a telephone consultation. She is a competitive runner and has had her second stress fracture in 12 months.',
  '{"name": "Ms. Sarah Taylor", "age": 22, "gender": "Female"}',
  '{"patient": "Ms. Sarah Taylor", "age": 22, "gender": "Female", "pmh": "Stress fracture of tibia 12 months ago, Stress fracture of metatarsal 2 months ago", "medications": "None", "allergies": "None known", "social_summary": "University student, competitive runner, very active", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hi doctor, I''ve had another stress fracture. This is my second one in a year and I''m really frustrated. I can''t train and I''m worried there might be something wrong.",
    "freely_given_history": {
      "presenting_complaint": "Second stress fracture in 12 months. Concerned about recurrent injuries.",
      "psychosocial_impact": "Very frustrated. Can''t train. Worried about future.",
      "ice": {
        "ideas": "Wondering if there''s an underlying problem. Worried about bone health.",
        "concerns": "Concerned about recurrent fractures. Worried about long-term impact.",
        "expectations": "Wants to know why and how to prevent more"
      }
    },
    "history_on_direct_questioning": {
      "fractures": {
        "first": "Stress fracture of tibia 12 months ago, took 3 months to heal",
        "second": "Stress fracture of 3rd metatarsal 2 months ago, still healing",
        "mechanism": "Both from running, no trauma"
      },
      "training": {
        "volume": "Runs 50-60 miles per week",
        "intensity": "High intensity, competitive runner",
        "increase": "Increased training volume over last year",
        "rest": "Doesn''t take much rest, trains through minor injuries"
      },
      "nutrition": {
        "diet": "Tries to eat healthily but very focused on weight",
        "calories": "Restricts calories, probably not eating enough for activity level",
        "calcium": "Doesn''t eat dairy, limited calcium intake"
      },
      "menstrual": {
        "periods": "Irregular periods, sometimes misses months",
        "contraception": "Not on contraception",
        "amenorrhoea": "Has had periods of amenorrhoea"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "eating_disorder": "No history of eating disorder (but restrictive eating)"
      },
      "social_hx": {
        "sport": "Very competitive, wants to improve times",
        "pressure": "Pressure to perform, maintain weight",
        "support": "Has coach, but coach pushes hard training"
      }
    }
  }',
  'FRUSTRATED but ENGAGED. Show concern about injuries. If doctor addresses underlying causes (RED-S), show interest. May be defensive about diet/training.',
  'full',
  720,
  'hard',
  ARRAY['Recognise recurrent stress fractures', 'Consider RED-S (Relative Energy Deficiency in Sport)', 'Assess menstrual function', 'Assess nutrition', 'Address training load', 'Consider bone health', 'Provide comprehensive management'],
  '## Model Approach

**Key Priorities:**
1. Recognise pattern of recurrent stress fractures
2. Consider RED-S (Relative Energy Deficiency in Sport)
3. Assess menstrual function (irregular/amenorrhoea)
4. Assess nutrition (likely inadequate)
5. Address training load
6. Consider bone health investigations
7. Provide comprehensive management

**Differential Diagnosis:**
- RED-S (most likely - recurrent fractures, irregular periods, restrictive eating, high training load)
- Osteoporosis (consider - but less likely at this age)
- Other causes (less likely)

**Management:**
- Address RED-S:
  - Energy availability (likely negative)
  - Menstrual function (irregular/amenorrhoea concerning)
  - Bone health (recurrent fractures)
- Nutrition:
  - Increase energy intake to match expenditure
  - Ensure adequate calcium and vitamin D
  - Consider dietitian referral
- Training:
  - Reduce training load
  - Allow adequate recovery
  - Gradual return to training
- Investigations:
  - Bone density scan (DEXA) if appropriate
  - Hormone levels (FSH, LH, oestradiol)
  - Calcium, vitamin D, PTH
- Follow-up:
  - Review in 1-2 months
  - Consider sports medicine referral
- Safety-netting: If develops more fractures or other symptoms - review

**Important:** Recurrent stress fractures in young female athletes should raise suspicion of RED-S.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed fracture history", "Explored training load", "Assessed nutrition", "Explored menstrual function", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered RED-S", "Addressed nutrition", "Addressed training load", "Planned investigations", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for frustration", "Used sensitive approach", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 38: Pregnant Woman with Epilepsy
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Pregnancy and Epilepsy Management',
  'Women''s Health',
  'WH-003',
  'You are a GP trainee. A 28-year-old woman, Ms. Rebecca Clarke, has booked a video consultation. She has epilepsy and has just found out she is 8 weeks pregnant.',
  '{"name": "Ms. Rebecca Clarke", "age": 28, "gender": "Female"}',
  '{"patient": "Ms. Rebecca Clarke", "age": 28, "gender": "Female", "pmh": "Epilepsy (diagnosed age 15), Well controlled", "medications": "Sodium valproate 500mg BD", "allergies": "None known", "social_summary": "Works as a teacher, lives with partner, non-smoker, no alcohol", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I''ve just found out I''m pregnant - about 8 weeks. I have epilepsy and I''m really worried about my medication. I''ve heard it can cause problems for the baby.",
    "freely_given_history": {
      "presenting_complaint": "Pregnant, 8 weeks. On sodium valproate for epilepsy. Very worried about medication.",
      "psychosocial_impact": "Very anxious. Worried about baby. Unsure what to do.",
      "ice": {
        "ideas": "Worried medication might harm baby. Not sure if should stop taking it.",
        "concerns": "Very concerned about birth defects. Worried about having seizures if stops medication.",
        "expectations": "Wants to know what to do about medication"
      }
    },
    "history_on_direct_questioning": {
      "pregnancy": {
        "gestation": "8 weeks pregnant",
        "planned": "Planned pregnancy",
        "antenatal": "Not yet booked antenatal care",
        "folic_acid": "Taking folic acid 400mcg daily"
      },
      "epilepsy": {
        "control": "Well controlled, no seizures for 5 years",
        "medication": "Sodium valproate 500mg BD, takes regularly",
        "seizure_type": "Generalised tonic-clonic seizures",
        "triggers": "Sleep deprivation, stress",
        "previous_pregnancies": "No previous pregnancies"
      },
      "medication_concerns": {
        "awareness": "Has heard valproate can cause birth defects",
        "worries": "Very worried about harming baby",
        "seizures": "Also worried about having seizures if changes medication"
      },
      "pmh": {
        "epilepsy": "Diagnosed age 15, well controlled",
        "other": "No other medical conditions"
      },
      "social_hx": {
        "support": "Good support from partner",
        "work": "Works as teacher, needs to be reliable"
      }
    }
  }',
  'VERY ANXIOUS and WORRIED. Show significant concern about baby. If doctor explains risks and management clearly, show some relief but still worried. Need clear guidance.',
  'full',
  720,
  'hard',
  ARRAY['Recognise valproate teratogenicity', 'Balance seizure control vs fetal risk', 'Provide clear information about risks', 'Consider medication change', 'Involve neurology/obstetrics', 'Address folic acid (high dose)', 'Provide support'],
  '## Model Approach

**Key Priorities:**
1. **CRITICAL: Recognise valproate teratogenicity**
2. Balance seizure control vs fetal risk
3. Provide clear information about risks
4. Consider medication change (but carefully)
5. Involve specialists (neurology, obstetrics)
6. Address folic acid (needs high dose)
7. Provide support

**Key Considerations:**
- Sodium valproate is teratogenic (increased risk of neural tube defects, developmental delay)
- However, uncontrolled seizures also risk to mother and baby
- Need specialist input (neurology, obstetrics)
- High-dose folic acid needed (5mg)

**Management:**
- **URGENT: Specialist referral**
  - Neurology (to review medication)
  - Obstetrics (high-risk pregnancy)
  - Consider joint clinic
- Medication:
  - **CRITICAL: Do not stop abruptly** (risk of seizures)
  - Consider switching to safer alternative (e.g., lamotrigine, levetiracetam)
  - But must be done carefully with neurology
  - May need to continue valproate if other options not suitable
- Folic acid:
  - Increase to 5mg daily (high dose)
  - Continue throughout pregnancy
- Support:
  - Provide clear information
  - Address anxiety
  - Regular monitoring
- Follow-up:
  - Urgent neurology/obstetrics review
  - Regular antenatal care
- Safety-netting: If develops seizures or other concerns - seek urgent medical attention

**Important:** Valproate in pregnancy needs urgent specialist review. Balance risks carefully.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed pregnancy", "Explored epilepsy control", "Assessed medication concerns", "Explored ICE", "Obtained relevant history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised valproate teratogenicity", "Arranged urgent specialist referral", "Addressed folic acid", "Provided clear information", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for anxiety", "Used clear, sensitive language", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 39: Advanced COPD Management
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'COPD Review Consultation',
  'Respiratory',
  'RESP-005',
  'You are a GP trainee. A 72-year-old man, Mr. George Harris, has booked a telephone consultation. He has advanced COPD and his breathing has been getting worse over the last few months.',
  '{"name": "Mr. George Harris", "age": 72, "gender": "Male"}',
  '{"patient": "Mr. George Harris", "age": 72, "gender": "Male", "pmh": "COPD (severe), Heart failure, Osteoporosis", "medications": "Multiple inhalers, Furosemide 40mg OD, Alendronate 70mg weekly", "allergies": "None known", "social_summary": "Retired, lives alone, current smoker (50 pack-years)", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I''m really struggling with my breathing. It''s been getting worse and worse. I can barely walk across the room now. I don''t know what to do.",
    "freely_given_history": {
      "presenting_complaint": "Progressive breathlessness over last 3-4 months. Getting worse. Very limited.",
      "psychosocial_impact": "Unable to do daily activities. Very isolated. Depressed.",
      "ice": {
        "ideas": "Thinks COPD is getting worse. Worried about future.",
        "concerns": "Very concerned about quality of life. Worried about needing oxygen or going into care.",
        "expectations": "Wants help to breathe better"
      }
    },
    "history_on_direct_questioning": {
      "breathlessness": {
        "severity": "Very breathless, MRC grade 4-5, can barely walk across room",
        "progression": "Getting worse over last 3-4 months",
        "rest": "Breathless at rest now",
        "daily_activities": "Can''t do daily activities, can''t shower, can''t cook",
        "sleep": "Sleeping propped up, wakes breathless"
      },
      "copd": {
        "diagnosis": "Severe COPD, diagnosed 8 years ago",
        "medications": "Multiple inhalers (LAMA, LABA/ICS), takes regularly",
        "compliance": "Takes inhalers, technique checked 6 months ago",
        "exacerbations": "Frequent exacerbations, 4-5 per year",
        "hospitalisations": "Admitted 3 times in last year"
      },
      "pmh": {
        "heart_failure": "Has heart failure, on furosemide",
        "osteoporosis": "On alendronate",
        "other": "Multiple comorbidities"
      },
      "social_hx": {
        "smoking": "Current smoker, 15 cigarettes per day, 50 pack-years. Has tried to quit multiple times",
        "living": "Lives alone, isolated",
        "support": "Limited support, family live far away",
        "depression": "Feels depressed, low mood, hopeless"
      },
      "red_flags": {
        "cyanosis": "Not aware of blue lips",
        "confusion": "No confusion",
        "ankle_swelling": "Some ankle swelling (heart failure)"
      }
    }
  }',
  'DESPERATE and DEPRESSED. Show significant impact on life. If doctor addresses comprehensively (including palliative care), show some relief. May be defensive about smoking.',
  'full',
  720,
  'hard',
  ARRAY['Assess severity of COPD', 'Review medications and compliance', 'Consider oxygen therapy', 'Address smoking cessation', 'Consider palliative care input', 'Address depression', 'Consider social support'],
  '## Model Approach

**Key Priorities:**
1. Assess severity (very severe - MRC 4-5)
2. Review medications and optimise
3. Consider oxygen therapy assessment
4. Address smoking cessation (critical)
5. Consider palliative care input
6. Address depression
7. Consider social support

**Key Considerations:**
- Advanced COPD with poor quality of life
- Multiple comorbidities
- Depression common in advanced COPD
- May benefit from palliative care approach
- Smoking cessation still important

**Management:**
- Optimise medications:
  - Review inhaler technique
  - Ensure optimal therapy
  - Consider triple therapy if not on
- Oxygen therapy:
  - Consider assessment for long-term oxygen therapy (LTOT)
  - May need ambulatory oxygen
  - Refer to respiratory team
- Smoking cessation:
  - Strongly encourage (still benefits even in advanced disease)
  - Offer support
- Palliative care:
  - Consider palliative care team input
  - Address quality of life
  - Advance care planning
- Depression:
  - Screen for depression
  - Consider treatment if appropriate
- Social support:
  - Consider social services assessment
  - Community support
- Follow-up:
  - Regular review
  - Respiratory team follow-up
- Safety-netting: If develops severe breathlessness, confusion, or other concerns - seek urgent medical attention

**Important:** Advanced COPD needs comprehensive approach including palliative care.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed breathlessness severity", "Reviewed COPD history", "Assessed impact on daily life", "Explored depression", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Optimised medications", "Considered oxygen therapy", "Addressed smoking cessation", "Considered palliative care", "Addressed depression", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy", "Used clear, supportive language", "Addressed smoking sensitively", "Listened actively", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 40: Elevated Blood Pressure in Middle-Aged Man
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Blood Pressure Review',
  'Cardiovascular',
  'CV-001',
  'You are a GP trainee. A 48-year-old man, Mr. Richard Moore, has booked a telephone consultation. He had a routine health check 3 days ago and his blood pressure was found to be elevated.',
  '{"name": "Mr. Richard Moore", "age": 48, "gender": "Male"}',
  '{"patient": "Mr. Richard Moore", "age": 48, "gender": "Male", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "Works as a manager, sedentary job, social drinker", "family_summary": "Father: hypertension and heart attack age 60, Mother: well"}',
  '{
    "opening_statement": "Hello doctor, I had a health check at work and they said my blood pressure was high. I wasn''t expecting that - I feel fine. They said I should see my GP.",
    "freely_given_history": {
      "presenting_complaint": "Elevated blood pressure found on health check. No symptoms.",
      "psychosocial_impact": "Slightly concerned but not overly worried.",
      "ice": {
        "ideas": "Not sure if it''s a problem. Wondering if needs treatment.",
        "concerns": "Mild concern. Wants to understand what it means.",
        "expectations": "Wants explanation and to know if treatment needed"
      }
    },
    "history_on_direct_questioning": {
      "blood_pressure": {
        "reading": "BP was 158/102 at health check",
        "previous": "Not sure of previous readings, hasn''t had BP checked for years",
        "symptoms": "No symptoms, feels well"
      },
      "risk_factors": {
        "smoking": "Never smoked",
        "alcohol": "Drinks 15-20 units per week (social drinking)",
        "diet": "Eats out frequently, doesn''t cook much, probably high salt",
        "exercise": "Very little exercise, sedentary job, drives everywhere",
        "weight": "BMI 29, has gained weight over last few years",
        "stress": "Work is stressful, long hours"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "medications": "No medications"
      },
      "fhx": {
        "hypertension": "Father had hypertension, diagnosed age 55",
        "heart_disease": "Father had heart attack age 60",
        "other": "No other significant family history"
      },
      "symptoms": {
        "headache": "No headaches",
        "visual": "No visual problems",
        "chest_pain": "No chest pain",
        "breathlessness": "No breathlessness"
      }
    }
  }',
  'CALM but CURIOUS. Answer questions clearly. Show some concern if doctor mentions risks. Accept lifestyle advice if explained well. May be resistant to medication.',
  'full',
  720,
  'medium',
  ARRAY['Confirm hypertension diagnosis', 'Assess cardiovascular risk', 'Explore lifestyle factors', 'Plan appropriate investigations', 'Address lifestyle modifications', 'Consider medication if needed', 'Calculate QRISK'],
  '## Model Approach

**Key Priorities:**
1. Confirm hypertension (needs repeat readings)
2. Assess cardiovascular risk
3. Explore lifestyle factors
4. Plan investigations
5. Address lifestyle modifications
6. Consider medication (if confirmed)
7. Calculate QRISK

**Key Considerations:**
- Single reading not diagnostic - need repeat
- Assess overall cardiovascular risk
- Lifestyle modifications first-line
- Family history of heart disease increases risk

**Management:**
- Confirm diagnosis:
  - Need repeat BP readings (ambulatory or clinic)
  - If consistently elevated, diagnose hypertension
- Assess risk:
  - Calculate QRISK
  - Family history increases risk
  - Lifestyle factors present
- Investigations:
  - U&E, creatinine, eGFR
  - FBC
  - Lipid profile
  - ECG
  - Urine dipstick
- Lifestyle modifications:
  - Reduce salt intake
  - Increase exercise
  - Weight loss
  - Reduce alcohol
  - Stress management
- Medication:
  - If confirmed and risk high, consider ACE inhibitor
  - Target <140/90 (or <135/85 if home monitoring)
- Follow-up:
  - Review with repeat readings
  - Monitor response to lifestyle changes
- Safety-netting: If develops symptoms (headache, visual problems, chest pain) - seek urgent medical attention

**Important:** Confirm diagnosis with repeat readings. Address lifestyle factors.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed blood pressure", "Explored risk factors", "Assessed family history", "Explored lifestyle factors", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Planned to confirm diagnosis", "Assessed cardiovascular risk", "Addressed lifestyle factors", "Planned investigations", "Considered medication if needed", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Reassured appropriately", "Used clear language", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 41: Safeguarding Concerns in Child
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Child Protection Concerns',
  'Safeguarding',
  'SAF-002',
  'You are a GP trainee. A school nurse has contacted the practice about concerns regarding a 6-year-old girl, Lily, who attends the local primary school. The school nurse reports that Lily has been coming to school with unexplained bruises and appears withdrawn.',
  '{"name": "Lily", "age": 6, "gender": "Female", "contact": "School nurse"}',
  '{"patient": "Lily", "age": 6, "gender": "Female", "pmh": "Generally healthy child", "medications": "None", "allergies": "No known allergies", "social_summary": "Lives with mother and stepfather, attends primary school", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I''m calling from the school. I''m concerned about one of our pupils, Lily. She''s been coming to school with bruises and she seems very withdrawn. I''m worried there might be something wrong at home.",
    "freely_given_history": {
      "presenting_complaint": "School nurse concerned about child with unexplained bruises and withdrawn behaviour.",
      "psychosocial_impact": "School staff very concerned. Child appears distressed.",
      "ice": {
        "ideas": "Worried about possible abuse or neglect.",
        "concerns": "Very concerned about child''s welfare.",
        "expectations": "Wants GP to assess and take appropriate action"
      }
    },
    "history_on_direct_questioning": {
      "concerns": {
        "bruises": "Multiple bruises on arms and legs, different stages of healing",
        "explanations": "Child says she fell, but explanations don''t match injuries",
        "frequency": "Bruises noticed over last 2-3 months, getting more frequent",
        "behaviour": "Child very withdrawn, doesn''t play with other children, seems scared",
        "attendance": "Attendance has been poor recently, lots of absences",
        "appearance": "Child sometimes comes to school in dirty clothes, unkempt"
      },
      "family": {
        "structure": "Lives with mother and stepfather",
        "recent_changes": "Stepfather moved in 6 months ago",
        "concerns": "School has noticed mother seems stressed, stepfather rarely seen"
      },
      "previous": {
        "concerns": "No previous concerns about this child",
        "siblings": "No siblings"
      }
    }
  }',
  'CONCERNED and PROFESSIONAL (school nurse). Provide information clearly. Want GP to take action. May be anxious about child''s welfare.',
  'full',
  720,
  'hard',
  ARRAY['Recognise safeguarding concerns', 'Assess risk to child', 'Consider child protection procedures', 'Document appropriately', 'Make safeguarding referral', 'Involve appropriate agencies', 'Maintain confidentiality appropriately'],
  '## Model Approach

**Key Priorities:**
1. **CRITICAL: Recognise safeguarding concerns**
2. Assess risk to child
3. Consider child protection procedures
4. Make safeguarding referral
5. Document clearly
6. Involve appropriate agencies

**Key Considerations:**
- Multiple unexplained bruises + withdrawn behaviour = safeguarding concern
- Stepfather moved in recently (timeline matches concerns)
- Poor attendance, unkempt appearance
- Need urgent safeguarding assessment

**Management:**
- **URGENT: Safeguarding referral**
  - Contact children''s social care immediately
  - Consider police if immediate risk
  - Follow local safeguarding procedures
- Assessment:
  - May need to see child (with appropriate consent/procedures)
  - Document all concerns clearly
  - Take photos of injuries if appropriate (with consent)
- Multi-agency:
  - Involve children''s social care
  - Consider police if criminal offence suspected
  - School already involved
- Documentation:
  - Document all concerns clearly
  - Record all actions taken
  - Maintain confidentiality appropriately
- Follow-up:
  - Regular review
  - Monitor situation
- Safety-netting: If immediate risk to child - contact police/emergency services

**Important:** This is a safeguarding issue. Urgent referral to children''s social care required.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Gathered information from school nurse", "Assessed concerns systematically", "Explored family circumstances", "Assessed risk", "Documented appropriately"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised safeguarding concerns", "Made appropriate safeguarding referral", "Involved appropriate agencies", "Documented clearly", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Communicated professionally with school nurse", "Demonstrated concern for child", "Maintained appropriate boundaries", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 42: Polycystic Kidney Disease in Young Adult
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Family History of Kidney Disease',
  'Nephrology',
  'NEPH-001',
  'You are a GP trainee. A 24-year-old man, Mr. Daniel Patel, has booked a video consultation. His father has polycystic kidney disease and he is worried he might have it too.',
  '{"name": "Mr. Daniel Patel", "age": 24, "gender": "Male"}',
  '{"patient": "Mr. Daniel Patel", "age": 24, "gender": "Male", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "Works as a software developer, non-smoker, occasional alcohol", "family_summary": "Father: polycystic kidney disease (diagnosed age 35), on dialysis"}',
  '{
    "opening_statement": "Hello doctor, I need to talk to you about something. My dad has polycystic kidney disease and he''s on dialysis now. I''m worried I might have it too. I don''t know what to do.",
    "freely_given_history": {
      "presenting_complaint": "Worried about inheriting polycystic kidney disease from father.",
      "psychosocial_impact": "Very anxious. Worried about future. Unsure about testing.",
      "ice": {
        "ideas": "Worried he might have the condition. Not sure if he should be tested.",
        "concerns": "Very concerned about developing kidney failure. Worried about impact on life.",
        "expectations": "Wants to know if he should be tested and what it means"
      }
    },
    "history_on_direct_questioning": {
      "family_history": {
        "father": "Father has polycystic kidney disease, diagnosed age 35, now on dialysis (age 58)",
        "inheritance": "Understands it can be inherited, 50% chance",
        "siblings": "Has one sister, age 22, not tested yet",
        "other_family": "No other family members known to have it"
      },
      "symptoms": {
        "kidney": "No kidney symptoms, no pain, passing urine normally",
        "blood_pressure": "No high blood pressure (not checked recently)",
        "headaches": "No headaches",
        "other": "No other symptoms"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "medications": "No medications"
      },
      "social_hx": {
        "occupation": "Works as software developer",
        "lifestyle": "Generally healthy lifestyle",
        "future": "Wants to have children in future, worried about passing it on"
      }
    }
  }',
  'ANXIOUS and WORRIED. Show significant concern about inheritance. If doctor explains testing and implications clearly, show some relief but still worried. May ask many questions.',
  'full',
  720,
  'hard',
  ARRAY['Recognise genetic condition', 'Explore family history', 'Discuss inheritance pattern', 'Address testing options', 'Consider genetic counselling', 'Address implications', 'Provide support'],
  '## Model Approach

**Key Priorities:**
1. Recognise genetic condition (autosomal dominant)
2. Explore family history
3. Discuss inheritance pattern (50% chance)
4. Address testing options
5. Consider genetic counselling
6. Address implications (including for children)
7. Provide support

**Key Considerations:**
- Autosomal dominant polycystic kidney disease (ADPKD)
- 50% chance of inheriting
- Testing available (ultrasound, genetic)
- Implications for future (kidney function, children)
- Genetic counselling important

**Management:**
- Explain inheritance:
  - Autosomal dominant (50% chance)
  - Can be passed to children
- Testing options:
  - Ultrasound (can detect cysts from age 20+)
  - Genetic testing (if available)
  - Blood pressure monitoring
  - Kidney function monitoring
- Genetic counselling:
  - Refer to genetic counselling service
  - Discuss implications
  - Support decision-making
- Screening:
  - If tests positive, regular monitoring
  - Blood pressure control
  - Kidney function monitoring
- Implications:
  - For patient (if positive)
  - For future children
  - Life insurance, etc.
- Follow-up:
  - Arrange genetic counselling
  - Consider screening if patient wants
- Safety-netting: If develops symptoms (pain, blood in urine, high BP) - seek medical attention

**Important:** Genetic conditions need careful counselling. Support patient in decision-making.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored family history", "Assessed symptoms", "Explored understanding", "Explored ICE", "Obtained relevant history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained inheritance pattern", "Discussed testing options", "Arranged genetic counselling", "Addressed implications", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for anxiety", "Used clear, sensitive language", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 43: Drug Abuse in Teenager
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Substance Use Concerns',
  'Mental Health',
  'MH-003',
  'You are a GP trainee. A 16-year-old boy, Jake, has booked a telephone consultation with his mother present. His mother is concerned about possible drug use.',
  '{"name": "Jake", "age": 16, "gender": "Male", "parent": "Mother present"}',
  '{"patient": "Jake", "age": 16, "gender": "Male", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "Lives with mother, attends secondary school", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I''m calling with my son Jake. I''m really worried - I think he might be using drugs. I found something in his room and his behaviour has changed.",
    "freely_given_history": {
      "presenting_complaint": "Mother concerned about possible drug use. Found suspicious items. Behaviour changes.",
      "psychosocial_impact": "Mother very worried. Relationship strained. Jake defensive.",
      "ice": {
        "ideas": "Mother thinks he''s using drugs. Jake denies it.",
        "concerns": "Mother very concerned. Jake defensive and angry.",
        "expectations": "Mother wants help. Jake wants to end call."
      }
    },
    "history_on_direct_questioning": {
      "concerns": {
        "if_asked": "Found what looks like cannabis in his room. Also found rolling papers. He''s been acting differently - moody, secretive, staying out late",
        "behaviour": "Mood swings, secretive, changed friends, school performance dropped",
        "physical": "Red eyes sometimes, seems tired, appetite changes"
      },
      "substance_use": {
        "if_asked_directly_jake": "I''ve tried it a few times, it''s not a big deal. Everyone does it.",
        "frequency": "Uses cannabis occasionally, maybe once or twice a week",
        "other_drugs": "No other drugs",
        "alcohol": "Drinks alcohol sometimes at parties"
      },
      "social": {
        "friends": "Hanging out with different crowd",
        "school": "School performance dropped, less interested",
        "family": "Relationship with mother strained, argues a lot"
      }
    }
  }',
  'MOTHER: Very worried and emotional. JAKE: Defensive and angry. If doctor is non-judgmental and supportive, Jake may open up slightly. If doctor is judgmental, Jake becomes more defensive.',
  'full',
  720,
  'hard',
  ARRAY['Create safe environment', 'Address substance use non-judgmentally', 'Assess risk', 'Involve young person appropriately', 'Consider confidentiality (Gillick competence)', 'Provide support and information', 'Consider referral'],
  '## Model Approach

**Key Priorities:**
1. Create safe, non-judgmental environment
2. Address substance use sensitively
3. Assess risk (frequency, other drugs, impact)
4. Involve young person (Gillick competent at 16)
5. Consider confidentiality
6. Provide support
7. Consider referral

**Key Considerations:**
- 16 years old (Gillick competent)
- Confidentiality important but balance with safeguarding
- Non-judgmental approach essential
- Assess risk appropriately

**Management:**
- Non-judgmental approach:
  - Don''t lecture or judge
  - Acknowledge concerns
  - Support both patient and parent
- Assess risk:
  - Frequency of use
  - Other substances
  - Impact on life
  - Risk-taking behaviour
- Support:
  - Provide information about risks
  - Harm reduction advice
  - Consider counselling/referral
- Confidentiality:
  - Respect young person''s confidentiality where appropriate
  - But balance with safeguarding if high risk
- Family support:
  - Support parent
  - Family therapy if appropriate
- Follow-up:
  - Arrange follow-up
  - Consider referral to young people''s substance misuse service
- Safety-netting: If develops concerning symptoms or high-risk behaviour - seek urgent help

**Important:** Non-judgmental approach. Balance confidentiality with safeguarding.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Created safe environment", "Assessed substance use", "Assessed risk", "Explored impact", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed substance use appropriately", "Provided support", "Considered referral", "Addressed confidentiality", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated non-judgmental approach", "Used sensitive language", "Listened actively", "Addressed concerns of both", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 44: Abnormal ECG Results
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'ECG Results Discussion',
  'Cardiovascular',
  'CV-002',
  'You are a GP trainee. A 55-year-old man, Mr. James Wilson, has booked a telephone consultation. He had an ECG done 4 days ago as part of a health check and the results show some abnormalities.',
  '{"name": "Mr. James Wilson", "age": 55, "gender": "Male"}',
  '{"patient": "Mr. James Wilson", "age": 55, "gender": "Male", "pmh": "Hypertension, Hyperlipidaemia", "medications": "Ramipril 5mg OD, Atorvastatin 20mg ON", "allergies": "None known", "social_summary": "Works as a manager, non-smoker, occasional alcohol", "family_summary": "Father: heart attack age 65, Mother: well"}',
  '{
    "opening_statement": "Hello doctor, I got a call about my ECG results. They said there were some abnormalities and I need to discuss them. I''m a bit worried - is everything okay?",
    "freely_given_history": {
      "presenting_complaint": "Called about abnormal ECG results. No symptoms.",
      "psychosocial_impact": "Slightly concerned but not overly worried.",
      "ice": {
        "ideas": "Not sure what the abnormalities mean. Hoping it''s nothing serious.",
        "concerns": "Mild concern. Wants to understand what it means.",
        "expectations": "Wants explanation and to know if treatment needed"
      }
    },
    "history_on_direct_questioning": {
      "symptoms": {
        "chest_pain": "No chest pain",
        "breathlessness": "No breathlessness",
        "palpitations": "No palpitations",
        "dizziness": "No dizziness",
        "syncope": "No fainting",
        "exercise_tolerance": "Normal exercise tolerance"
      },
      "pmh": {
        "hypertension": "Well controlled on ramipril",
        "hyperlipidaemia": "On atorvastatin",
        "other": "No other medical conditions"
      },
      "fhx": {
        "heart_disease": "Father had heart attack age 65",
        "other": "No other significant family history"
      },
      "social_hx": {
        "smoking": "Never smoked",
        "alcohol": "Occasional alcohol, 5-10 units per week",
        "exercise": "Moderate exercise, walks regularly"
      }
    },
    "ecg_findings": {
      "rhythm": "Sinus rhythm",
      "rate": "72 bpm",
      "q_waves": "Small Q waves in leads II, III, aVF (inferior leads)",
      "st_changes": "No ST elevation or depression",
      "t_waves": "T wave inversion in leads V1-V3",
      "other": "Otherwise normal"
    }
  }',
  'CALM but CURIOUS. Answer questions clearly. Show some concern if doctor mentions serious causes. Accept investigations if explained well.',
  'full',
  720,
  'medium',
  ARRAY['Interpret ECG findings', 'Assess for symptoms', 'Consider causes (old MI, normal variant)', 'Assess cardiovascular risk', 'Plan appropriate investigations', 'Provide reassurance if appropriate'],
  '## Model Approach

**Key Priorities:**
1. Interpret ECG findings
2. Assess for symptoms (none - good sign)
3. Consider causes (old MI, normal variant)
4. Assess cardiovascular risk
5. Plan investigations
6. Provide appropriate reassurance

**ECG Findings:**
- Q waves in inferior leads (suggestive of old inferior MI)
- T wave inversion in V1-V3 (can be normal variant)
- No acute changes

**Differential Diagnosis:**
- Old inferior myocardial infarction (consider - Q waves in inferior leads)
- Normal variant (consider - T wave inversion in V1-V3 can be normal)
- Other causes (less likely)

**Management:**
- Reassurance:
  - No acute changes
  - No symptoms (good sign)
  - May be old changes
- Investigations:
  - Echocardiogram (to assess heart function)
  - Consider exercise stress test if appropriate
  - Repeat ECG in context
- Risk assessment:
  - Already on statin and ACE inhibitor (good)
  - Continue cardiovascular risk management
- Follow-up:
  - Review with echo results
  - Continue current medications
- Safety-netting: If develops chest pain, breathlessness, or other symptoms - seek urgent medical attention

**Important:** Q waves suggest old MI but no symptoms. Need echo to assess function.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Interpreted ECG findings", "Assessed for symptoms", "Explored cardiovascular risk", "Explored ICE", "Obtained relevant history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered appropriate causes", "Planned investigations", "Addressed cardiovascular risk", "Provided reassurance", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Reassured appropriately", "Used clear language", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 45: Chronic Constipation in Child
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Bowel Problems in Child',
  'Paediatrics',
  'PAED-005',
  'You are a GP trainee. A mother, Mrs. Lisa Thompson, has booked a telephone consultation about her 5-year-old daughter, Emily. Emily has been having problems with constipation for several months.',
  '{"name": "Emily Thompson", "age": 5, "gender": "Female", "parent": "Mrs. Lisa Thompson"}',
  '{"patient": "Emily Thompson", "age": 5, "gender": "Female", "parent": "Mrs. Lisa Thompson", "pmh": "Generally healthy child", "medications": "None", "allergies": "No known allergies", "social_summary": "Lives with mother and father, attends reception class", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about my daughter Emily. She''s been having problems going to the toilet for months now. She gets really upset and it''s affecting everything.",
    "freely_given_history": {
      "presenting_complaint": "5-year-old with constipation for several months. Getting worse.",
      "psychosocial_impact": "Child distressed. Affecting daily life. Parents concerned.",
      "ice": {
        "ideas": "Not sure why she''s constipated. Worried there might be a problem.",
        "concerns": "Worried about impact on child. Concerned about underlying cause.",
        "expectations": "Wants treatment and to know why it''s happening"
      }
    },
    "history_on_direct_questioning": {
      "constipation": {
        "frequency": "Passes stool 1-2 times per week, sometimes less",
        "consistency": "Hard, pellet-like stools",
        "pain": "Cries when trying to pass stool, says it hurts",
        "withholding": "Holds on, tries to avoid going",
        "soiling": "Has some soiling/overflow, especially at school",
        "duration": "Problem for about 6 months, getting worse"
      },
      "diet": {
        "fluids": "Drinks water and juice, probably 1-1.5L per day",
        "fiber": "Doesn''t like vegetables, limited fiber intake",
        "dairy": "Loves dairy, drinks lots of milk",
        "toileting": "Tries to avoid going to toilet, holds on"
      },
      "toileting": {
        "routine": "No regular toilet routine",
        "school": "Avoids going at school, holds on all day",
        "fear": "Afraid of toilet, says it hurts"
      },
      "pmh": {
        "medical": "No medical conditions",
        "development": "Normal development"
      },
      "social": {
        "school": "Doing okay at school but soiling is embarrassing",
        "impact": "Affecting confidence, doesn''t want to go to school sometimes"
      }
    }
  }',
  'CONCERNED and FRUSTRATED parent. Show love for child. If doctor provides clear treatment plan, show relief. May feel guilty about not addressing it sooner.',
  'full',
  720,
  'medium',
  ARRAY['Assess constipation systematically', 'Address faecal impaction', 'Provide disimpaction if needed', 'Establish maintenance treatment', 'Address diet and fluids', 'Establish toilet routine', 'Address withholding behaviour'],
  '## Model Approach

**Key Priorities:**
1. Assess constipation pattern
2. Address faecal impaction (likely)
3. Provide disimpaction if needed
4. Establish maintenance treatment
5. Address diet and fluids
6. Establish toilet routine
7. Address withholding behaviour

**Differential Diagnosis:**
- Functional constipation (most likely)
- Faecal impaction with overflow (likely given soiling)
- Other causes (less likely)

**Management:**
- Disimpaction:
  - Likely has faecal impaction
  - May need disimpaction (macrogol or enema)
  - Clear out before maintenance
- Maintenance treatment:
  - Macrogol (Movicol) - start high dose, titrate
  - Continue until regular soft stools
  - May need for months
- Diet:
  - Increase fiber (gradually)
  - Ensure adequate fluids
  - Reduce excessive dairy if contributing
- Toilet routine:
  - Regular toilet times (after meals)
  - Make it positive, not punishment
  - Reward chart
- Address withholding:
  - Reassure child
  - Make toilet pleasant
  - Address fear
- Follow-up:
  - Review in 2 weeks
  - Adjust treatment as needed
- Safety-netting: If develops severe pain, vomiting, or other concerns - seek urgent medical attention

**Note:** Constipation in children needs aggressive treatment. Disimpaction first, then maintenance.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed constipation pattern", "Explored diet and fluids", "Assessed toileting routine", "Explored withholding", "Explored ICE with parent"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed faecal impaction", "Provided disimpaction", "Established maintenance treatment", "Addressed diet and routine", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy", "Used supportive language", "Listened actively", "Addressed parental concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 46: Restarting Antipsychotic Medication
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Mental Health Medication Review',
  'Mental Health',
  'MH-004',
  'You are a GP trainee. A 35-year-old woman, Ms. Karen White, has booked a telephone consultation. She has a history of schizophrenia and stopped taking her antipsychotic medication 3 months ago. Her family are concerned about her mental state.',
  '{"name": "Ms. Karen White", "age": 35, "gender": "Female"}',
  '{"patient": "Ms. Karen White", "age": 35, "gender": "Female", "pmh": "Schizophrenia (diagnosed age 22), Well controlled on medication previously", "medications": "None currently (stopped 3 months ago)", "allergies": "None known", "social_summary": "Lives alone, works part-time, limited support", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, my family made me call. They think I need to go back on my medication but I don''t think I need it. I feel fine. I stopped taking it because I don''t like the side effects.",
    "freely_given_history": {
      "presenting_complaint": "Stopped antipsychotic 3 months ago. Family concerned. Patient thinks fine.",
      "psychosocial_impact": "Family very worried. Patient defensive. Relationship strained.",
      "ice": {
        "ideas": "Patient thinks doesn''t need medication. Family thinks she does.",
        "concerns": "Patient concerned about side effects. Family concerned about relapse.",
        "expectations": "Patient wants to stay off medication. Family wants her back on."
      }
    },
    "history_on_direct_questioning": {
      "mental_state": {
        "if_asked": "I''m fine. I don''t need medication. My family are overreacting.",
        "symptoms": "May show signs of relapse (paranoia, thought disorder) but denies",
        "insight": "Poor insight, doesn''t think unwell",
        "function": "Still working part-time, managing daily activities"
      },
      "medication": {
        "previous": "Was on risperidone, stopped 3 months ago",
        "reason": "Stopped due to side effects (weight gain, sedation)",
        "compliance": "Was compliant before stopping"
      },
      "family_concerns": {
        "if_discussed": "Family report she''s been acting strangely, paranoid, not sleeping",
        "relapse": "Family worried about relapse",
        "support": "Family trying to support but patient resistant"
      },
      "pmh": {
        "schizophrenia": "Diagnosed age 22, multiple relapses when off medication",
        "hospitalisations": "Admitted 3 times in past when stopped medication"
      }
    }
  }',
  'DEFENSIVE but ENGAGED. Show poor insight. If doctor is understanding and addresses concerns, may be more open. If doctor is forceful, become more resistant.',
  'full',
  720,
  'hard',
  ARRAY['Assess mental state', 'Assess insight', 'Explore reasons for stopping', 'Address side effect concerns', 'Consider risk of relapse', 'Involve family appropriately', 'Consider mental health act if needed'],
  '## Model Approach

**Key Priorities:**
1. Assess mental state
2. Assess insight (likely poor)
3. Explore reasons for stopping medication
4. Address side effect concerns
5. Consider risk of relapse
6. Involve family appropriately
7. Consider mental health act if needed

**Key Considerations:**
- Stopped medication 3 months ago
- History of relapses when off medication
- Poor insight likely
- Family concerned
- May need urgent mental health assessment

**Management:**
- Assess mental state:
  - Signs of relapse?
  - Insight level
  - Risk assessment
- Address concerns:
  - Side effects (weight gain, sedation)
  - Consider alternative medication
  - Lower dose options
- Risk assessment:
  - History of relapses
  - Current mental state
  - Risk to self/others
- Mental health services:
  - Consider urgent mental health team assessment
  - May need crisis team
  - Consider CTO if appropriate
- Family:
  - Involve family (with consent if possible)
  - Support family
- Follow-up:
  - Urgent mental health review
  - Regular monitoring
- Safety-netting: If deteriorates or risk increases - seek urgent mental health assessment

**Important:** Poor insight and history of relapses. May need mental health act assessment.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed mental state", "Assessed insight", "Explored reasons for stopping", "Explored family concerns", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Assessed risk appropriately", "Addressed side effect concerns", "Arranged mental health assessment", "Considered mental health act", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy", "Used non-judgmental approach", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 47: Sexual Health Swab Results
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'STI Results Discussion',
  'Sexual Health',
  'SH-001',
  'You are a GP trainee. A 22-year-old woman, Ms. Amy Roberts, has booked a video consultation. She had sexual health screening done 5 days ago and needs to discuss the results.',
  '{"name": "Ms. Amy Roberts", "age": 22, "gender": "Female"}',
  '{"patient": "Ms. Amy Roberts", "age": 22, "gender": "Female", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "University student, sexually active", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hi doctor, I had some tests done at the sexual health clinic and they said I need to discuss the results with my GP. I''m a bit worried about what they found.",
    "freely_given_history": {
      "presenting_complaint": "Called about sexual health test results. Anxious about results.",
      "psychosocial_impact": "Worried about results. Concerned about implications.",
      "ice": {
        "ideas": "Worried about having an STI. Not sure what it means.",
        "concerns": "Concerned about treatment. Worried about telling partner.",
        "expectations": "Wants to know results and get treatment"
      }
    },
    "history_on_direct_questioning": {
      "results": {
        "if_explained": "So I have chlamydia? What does that mean?",
        "chlamydia": "Positive for chlamydia",
        "other_stis": "Negative for other STIs (gonorrhoea, HIV, syphilis)",
        "symptoms": "No symptoms, didn''t know had anything"
      },
      "sexual_history": {
        "partners": "Has had 2 partners in last 6 months",
        "protection": "Uses condoms sometimes but not always",
        "current": "Has current partner, been together 3 months"
      },
      "concerns": {
        "treatment": "Wants to know if it can be treated",
        "partner": "Very worried about telling partner",
        "fertility": "Worried about impact on fertility",
        "future": "Worried about having it again"
      }
    }
  }',
  'ANXIOUS and WORRIED. Show concern about results. If doctor explains clearly and provides reassurance, show some relief. Very worried about partner reaction.',
  'full',
  720,
  'medium',
  ARRAY['Explain results clearly', 'Provide treatment', 'Address partner notification', 'Discuss prevention', 'Address fertility concerns', 'Provide support'],
  '## Model Approach

**Key Priorities:**
1. Explain results clearly
2. Provide treatment (antibiotics)
3. Address partner notification (important)
4. Discuss prevention
5. Address fertility concerns
6. Provide support

**Key Considerations:**
- Chlamydia is treatable
- Partner notification essential
- Can be asymptomatic
- Can affect fertility if untreated

**Management:**
- Treatment:
  - Azithromycin 1g single dose (or doxycycline)
  - Very effective
  - Can be treated easily
- Partner notification:
  - **CRITICAL: Partner must be tested and treated**
  - Explain why (to prevent reinfection)
  - Support patient in telling partner
  - Can use partner notification service if preferred
- Prevention:
  - Use condoms
  - Regular testing if multiple partners
- Fertility:
  - Reassure - if treated, unlikely to affect fertility
  - Untreated can cause problems
  - Important to complete treatment
- Follow-up:
  - Test of cure in 2-3 weeks
  - Ensure partner treated
- Safety-netting: If develops symptoms (pelvic pain, discharge) - seek medical attention

**Important:** Partner notification is essential to prevent reinfection.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explained results clearly", "Explored sexual history", "Assessed concerns", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Provided appropriate treatment", "Addressed partner notification", "Discussed prevention", "Addressed fertility concerns", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy", "Used clear, non-judgmental language", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 48: Abdominal Pain in Young Adult
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Abdominal Pain Consultation',
  'Gastroenterology',
  'GI-004',
  'You are a GP trainee. A 19-year-old woman, Ms. Lucy Green, has booked an urgent video consultation. She has been experiencing abdominal pain for the last 2 days.',
  '{"name": "Ms. Lucy Green", "age": 19, "gender": "Female"}',
  '{"patient": "Ms. Lucy Green", "age": 19, "gender": "Female", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "University student, lives in halls", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hi doctor, I''ve got really bad stomach pain. It started yesterday and it''s getting worse. I don''t know what''s wrong.",
    "freely_given_history": {
      "presenting_complaint": "Abdominal pain for 2 days. Getting worse. Very painful.",
      "psychosocial_impact": "Unable to study. Very worried.",
      "ice": {
        "ideas": "Not sure what''s wrong. Worried it might be serious.",
        "concerns": "Very concerned about the pain. Wants to know what it is.",
        "expectations": "Wants pain relief and to know the cause"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "site": "Right lower quadrant, started around umbilicus",
        "onset": "Started yesterday morning, gradual onset",
        "character": "Constant, sharp pain",
        "severity": "7-8/10, severe",
        "radiation": "No radiation",
        "movement": "Worse with movement, better lying still",
        "associated": "Feeling nauseous, no appetite",
        "bowel": "No bowel movements since yesterday",
        "urinary": "Passing urine normally, no pain"
      },
      "red_flags": {
        "fever": "Feeling hot, thinks might have temperature",
        "vomiting": "Has vomited twice, bile-stained",
        "rebound": "Pain worse when presses on abdomen",
        "rigidity": "Abdomen feels tense"
      },
      "menstrual": {
        "periods": "Regular periods, last one 2 weeks ago",
        "contraception": "Not on contraception",
        "pregnancy": "Not pregnant (not sexually active)"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "surgery": "No previous surgery"
      }
    }
  }',
  'IN PAIN and WORRIED. Show significant pain. If doctor arranges urgent assessment, show relief. May be very anxious.',
  'full',
  720,
  'hard',
  ARRAY['Assess abdominal pain systematically', 'Assess for red flags', 'Consider appendicitis', 'Assess for peritonism', 'Arrange urgent assessment if needed', 'Provide clear safety-netting'],
  '## Model Approach

**Key Priorities:**
1. Systematic abdominal pain assessment
2. Assess for red flags (fever, vomiting, peritonism)
3. Consider appendicitis (likely given presentation)
4. Assess for peritonism
5. Arrange urgent assessment
6. Clear safety-netting

**Differential Diagnosis:**
- Appendicitis (most likely - RLQ pain, fever, vomiting, peritonism)
- Other causes (less likely)

**Management:**
- **URGENT: Assess for appendicitis**
  - RLQ pain + fever + vomiting + peritonism = likely appendicitis
  - Needs urgent surgical assessment
- Arrange urgent assessment:
  - A&E or surgical assessment
  - Cannot assess peritonism properly over video
  - Needs examination
- Safety-netting:
  - **CRITICAL: If pain worsens, if becomes more unwell, or if unable to get seen - seek urgent medical attention or A&E**
  - Don''t eat/drink (in case needs surgery)
- Follow-up:
  - After assessment
- Consider:
  - May need appendicectomy
  - IV antibiotics if confirmed

**Important:** Signs of appendicitis. Urgent surgical assessment needed.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed abdominal pain systematically", "Assessed for red flags", "Explored associated symptoms", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered appendicitis", "Arranged urgent assessment", "Provided clear safety-netting", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for pain", "Used clear, reassuring language", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 49: Generalised Itching in Young Adult
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Itching Consultation',
  'Dermatology',
  'DERM-003',
  'You are a GP trainee. A 26-year-old woman, Ms. Rachel Brown, has booked a video consultation. She has been experiencing generalised itching for the last 3 weeks.',
  '{"name": "Ms. Rachel Brown", "age": 26, "gender": "Female"}',
  '{"patient": "Ms. Rachel Brown", "age": 26, "gender": "Female", "pmh": "No significant past medical history", "medications": "None", "allergies": "None known", "social_summary": "Works as a teacher, lives with partner", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hi doctor, I''ve been really itchy all over for weeks now. It''s driving me crazy. I can''t sleep and I''m scratching all the time. There''s no rash or anything, just the itching.",
    "freely_given_history": {
      "presenting_complaint": "Generalised itching for 3 weeks. No rash. Very distressing.",
      "psychosocial_impact": "Affecting sleep. Very frustrating. Affecting work.",
      "ice": {
        "ideas": "Not sure what''s causing it. Wondering if it''s an allergy or something.",
        "concerns": "Very concerned about the itching. Wants to know the cause.",
        "expectations": "Wants treatment and to know why it''s happening"
      }
    },
    "history_on_direct_questioning": {
      "itching": {
        "distribution": "All over body, no specific area",
        "timing": "Worse at night, keeping awake",
        "severity": "Very severe, can''t stop scratching",
        "rash": "No rash, no visible skin changes",
        "triggers": "No obvious triggers",
        "relieving": "Nothing really helps, antihistamines don''t work"
      },
      "associated_symptoms": {
        "jaundice": "No jaundice",
        "urine": "Urine normal colour",
        "stools": "Stools normal",
        "weight": "No weight loss",
        "fatigue": "Feeling tired (but probably from lack of sleep)",
        "lymph_nodes": "No swollen glands"
      },
      "pmh": {
        "medical_conditions": "No medical conditions",
        "skin_conditions": "No previous skin problems",
        "allergies": "No known allergies"
      },
      "medications": {
        "current": "No medications",
        "recent": "No recent medication changes",
        "otc": "Tried antihistamines, not helping"
      },
      "social_hx": {
        "occupation": "Works as teacher",
        "stress": "Work has been stressful recently",
        "diet": "Normal diet, no changes"
      }
    }
  }',
  'FRUSTRATED and TIRED. Show impact of itching. If doctor investigates systematically, show relief. May be very distressed.',
  'full',
  720,
  'medium',
  ARRAY['Assess itching systematically', 'Consider systemic causes', 'Assess for liver disease', 'Assess for other causes', 'Plan appropriate investigations', 'Provide symptomatic treatment'],
  '## Model Approach

**Key Priorities:**
1. Systematic assessment of itching
2. Consider systemic causes (no rash suggests systemic)
3. Assess for liver disease
4. Assess for other causes
5. Plan investigations
6. Provide symptomatic treatment

**Differential Diagnosis:**
- Systemic cause (likely - no rash, generalised)
  - Liver disease (consider)
  - Renal disease (consider)
  - Haematological (consider)
  - Endocrine (consider)
  - Other causes
- Psychogenic (consider if no cause found)

**Management:**
- Investigations:
  - LFTs (liver disease)
  - U&E, creatinine (renal)
  - FBC (haematological)
  - TFTs (thyroid)
  - Glucose (diabetes)
- Symptomatic treatment:
  - Emollients
  - Consider sedating antihistamine at night
  - Avoid triggers if identified
- Follow-up:
  - Review in 2 weeks with results
  - Adjust treatment based on findings
- Safety-netting: If develops jaundice, rash, or other symptoms - seek medical attention

**Note:** Generalised itching without rash suggests systemic cause. Need investigations.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed itching systematically", "Explored associated symptoms", "Assessed for systemic causes", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Planned appropriate investigations", "Provided symptomatic treatment", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for frustration", "Used clear language", "Listened actively", "Addressed concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- CASE 50: Recurrent Abdominal Pain in Middle-Aged Woman
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Recurrent Abdominal Pain',
  'Gastroenterology',
  'GI-005',
  'You are a GP trainee. A 45-year-old woman, Mrs. Sandra Davis, has booked a telephone consultation. She has been experiencing recurrent abdominal pain for the last 6 months.',
  '{"name": "Mrs. Sandra Davis", "age": 45, "gender": "Female"}',
  '{"patient": "Mrs. Sandra Davis", "age": 45, "gender": "Female", "pmh": "Irritable bowel syndrome (diagnosed 10 years ago), Anxiety", "medications": "Mebeverine 135mg TDS, Citalopram 20mg OD", "allergies": "None known", "social_summary": "Works as a receptionist, lives with husband, non-smoker, no alcohol", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I''ve been having stomach pain on and off for months now. It''s different from my usual IBS. I''m worried there might be something else wrong.",
    "freely_given_history": {
      "presenting_complaint": "Recurrent abdominal pain for 6 months. Different from usual IBS.",
      "psychosocial_impact": "Affecting daily life. Very worried. Affecting work.",
      "ice": {
        "ideas": "Worried it might be something serious. Not sure if it''s just IBS.",
        "concerns": "Very concerned about cancer or something serious.",
        "expectations": "Wants to know the cause and get treatment"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "site": "Lower abdomen, central and left side",
        "onset": "Started 6 months ago, intermittent",
        "character": "Cramping, colicky pain",
        "severity": "5-6/10 when present",
        "timing": "Comes and goes, worse after eating sometimes",
        "bowel": "Alternating constipation and diarrhoea",
        "bloating": "Feels bloated, distended",
        "relieving": "Passing wind or stool sometimes helps"
      },
      "ibs": {
        "previous": "Has IBS, diagnosed 10 years ago, usually well controlled",
        "different": "This feels different, more persistent",
        "medications": "On mebeverine, helps a bit but not completely"
      },
      "red_flags": {
        "weight_loss": "No weight loss",
        "bleeding": "No blood in stools",
        "nocturnal": "No night pain",
        "family_history": "No family history of bowel cancer",
        "age": "45 years old"
      },
      "pmh": {
        "ibs": "IBS, well controlled usually",
        "anxiety": "Has anxiety, on citalopram",
        "other": "No other medical conditions"
      },
      "social_hx": {
        "stress": "Work has been stressful recently",
        "diet": "Tries to manage diet for IBS"
      }
    }
  }',
  'WORRIED but ENGAGED. Show concern about serious causes. If doctor investigates appropriately, show relief. May be anxious about cancer.',
  'full',
  720,
  'medium',
  ARRAY['Assess abdominal pain systematically', 'Distinguish from IBS', 'Assess for red flags', 'Consider investigations', 'Address anxiety', 'Provide management plan'],
  '## Model Approach

**Key Priorities:**
1. Systematic abdominal pain assessment
2. Distinguish from usual IBS
3. Assess for red flags (none present - good)
4. Consider investigations
5. Address anxiety
6. Provide management plan

**Differential Diagnosis:**
- IBS flare (likely - but patient says different)
- Functional abdominal pain
- Other causes (less likely - but need to exclude)

**Management:**
- Reassurance:
  - No red flags (good sign)
  - May be IBS flare or functional
- Investigations:
  - Consider FBC, U&E, LFTs, CRP
  - Consider coeliac screen
  - Consider faecal calprotectin (if available)
  - Consider colonoscopy if persistent or red flags develop
- Management:
  - Optimise IBS treatment
  - Dietary advice
  - Stress management
  - Address anxiety
- Follow-up:
  - Review in 4-6 weeks with results
  - Consider referral if persistent or red flags
- Safety-netting: If develops red flags (weight loss, bleeding, night pain) - seek urgent medical attention

**Note:** No red flags but persistent symptoms. Need investigations to exclude serious causes.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed abdominal pain systematically", "Distinguished from IBS", "Assessed for red flags", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Planned appropriate investigations", "Addressed IBS management", "Addressed anxiety", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for concerns", "Used clear, reassuring language", "Listened actively", "Addressed cancer concerns", "Maintained professional manner"]}}'
);

-- =====================================================
-- 50 CASES COMPLETED
-- =====================================================
-- Progress: 50/100+ cases completed
-- All cases are original, inspired by clinical themes but with completely changed details
-- All scenarios are neutral and non-revealing
-- Ready for migration
-- Continue adding remaining cases (51-100+) in next session
