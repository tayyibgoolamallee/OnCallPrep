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

-- Note: This migration demonstrates the approach for creating original SCA cases
-- inspired by clinical themes. Each case has:
-- - Completely changed patient details (names, ages, specific scenarios)
-- - Original scenarios and presentations
-- - Preserved learning objectives and clinical themes
-- - Appropriate difficulty levels and marking criteria
--
-- To expand this further, you would continue adding cases covering:
-- - Diabetes management
-- - Mental health presentations
-- - Safeguarding concerns
-- - Chronic disease management
-- - Acute presentations
-- - And other common SCA themes
--
-- Each case should be original while maintaining educational value and
-- appropriate clinical complexity for SCA examination preparation.
