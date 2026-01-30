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
  'You are a GP. A 26-year-old woman, Ms. Sarah Chen, has booked an urgent video consultation. The receptionist notes she called this morning with concerns about her pregnancy.',
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
  'You are a GP. A 38-year-old man, Mr. David Thompson, has booked a routine telephone appointment. He was invited for an NHS Health Check as he recently turned 38. Blood tests were taken 3 days ago by the practice nurse. The results show mildly abnormal liver function tests.',
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
  'You are a GP. A mother, Mrs. Emma Wilson, has booked a telephone consultation about her 5-year-old son, Oliver. The receptionist notes the mother called this morning concerned about ear discharge.',
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
  'You are a GP. A 52-year-old woman, Mrs. Patricia Martinez, has booked a telephone consultation. She was seen 2 weeks ago for lower back pain and blood tests were arranged. The results show an elevated ESR and CRP.',
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
  'You are a GP. A 68-year-old man, Mr. Robert Singh, has booked an urgent video consultation. He has a history of COPD and is calling because his breathing has worsened over the last few days.',
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
  'You are a GP. A 58-year-old man, Mr. James Mitchell, has booked a video consultation. He has type 2 diabetes and his recent HbA1c is 78 mmol/mol despite being on maximum oral medications.',
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


**Differential Diagnosis:**

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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored diabetes history comprehensively", "Assessed current medication regime and compliance", "Obtained blood glucose monitoring results", "Explored understanding of diabetes progression", "Identified specific concerns about insulin", "Assessed for diabetic complications", "Explored lifestyle factors (diet, exercise, weight)", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained need for insulin appropriately (HbA1c 78 despite max therapy)", "Addressed misconceptions about insulin sensitively", "Discussed benefits of insulin (better control, reduced complications)", "Addressed needle phobia and injection concerns", "Discussed hypoglycaemia prevention and recognition", "Planned appropriate referral to diabetes specialist nurse", "Addressed lifestyle factors alongside medication", "Arranged appropriate follow-up for shared decision-making"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for concerns about injections", "Used clear, non-jargon language throughout", "Listened actively to patient concerns", "Addressed needle phobia sensitively and supportively", "Explained insulin as natural progression not failure", "Involved patient in shared decision-making", "Maintained supportive, non-judgmental manner"]}}'
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
  'You are a GP. A 34-year-old woman, Ms. Rachel Foster, has booked a telephone consultation. She had routine blood tests done 5 days ago as part of a health check. The results show an elevated TSH with low free T4, consistent with hypothyroidism.',
  '{"name": "Ms. Rachel Foster", "age": 34, "gender": "Female"}',
  '{"patient": "Ms. Rachel Foster", "age": 34, "gender": "Female", "pmh": "No significant past medical history", "medications": "Combined oral contraceptive pill", "allergies": "None known", "social_summary": "Marketing manager, busy job, non-smoker, occasional alcohol", "family_summary": "Mother: hypothyroidism, Father: well"}',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Systematic review of hypothyroid symptoms (fatigue, weight, cold intolerance)", "Explored hair, skin, and mood changes", "Assessed menstrual function", "Obtained comprehensive family history (mother with hypothyroidism)", "Explored work stress and lifestyle factors", "Reviewed current medications", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Interpreted thyroid function tests correctly (elevated TSH, low T4)", "Diagnosed hypothyroidism appropriately", "Planned levothyroxine treatment with appropriate starting dose", "Discussed TPO antibodies for autoimmune confirmation", "Explained need for lifelong treatment clearly", "Explained monitoring requirements (TSH in 6-8 weeks, then annually)", "Provided clear safety-netting advice", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Reassured appropriately while taking results seriously", "Used clear, non-jargon language throughout", "Explained condition in understandable terms", "Listened actively to patient concerns", "Addressed concerns about seriousness", "Involved patient in treatment decisions", "Maintained professional, empathetic manner"]}}'
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
  'You are a GP. A 24-year-old woman, Ms. Chloe Anderson, has booked a video consultation. She is concerned about hair loss that has been getting worse over the last 6 months.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established presenting complaint clearly with timeline", "Explored pattern of hair loss (diffuse vs patchy)", "Assessed amount and characteristics of hair loss", "Explored potential triggers (stress, diet, illness)", "Screened for underlying medical causes (thyroid, anaemia)", "Assessed psychosocial impact on confidence and daily life", "Explored family history of hair loss", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered telogen effluvium as likely diagnosis", "Planned appropriate investigations (FBC, ferritin, TFTs)", "Addressed stress management and lifestyle factors", "Discussed dietary considerations and nutrition", "Discussed treatment options (minoxidil if appropriate)", "Provided appropriate reassurance about prognosis", "Arranged appropriate follow-up", "Considered dermatology referral if needed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for distress and emotional impact", "Used clear, supportive language throughout", "Listened actively to patient concerns", "Addressed concerns about permanence and appearance sensitively", "Acknowledged impact on confidence and social situations", "Involved patient in management decisions", "Maintained professional, caring manner"]}}'
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
  'You are a GP. A 45-year-old man, Mr. Thomas Wright, has booked a video consultation. He has been feeling low for several months and mentions he has access to firearms (he is a member of a shooting club).',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed depression systematically using structured approach", "Explored mood, biological symptoms, and cognitive symptoms", "Conducted thorough suicide risk assessment", "Assessed access to means (firearms) - critical safety factor", "Explored protective factors and support network", "Identified triggers (relationship breakdown, isolation)", "Explored alcohol use and its impact", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed firearms safety appropriately and urgently", "Planned appropriate treatment (antidepressant if indicated)", "Considered psychological support (IAPT/counselling referral)", "Developed safety plan with patient", "Arranged urgent follow-up (within 1 week)", "Considered crisis team involvement if risk high", "Documented risk assessment clearly and comprehensively", "Considered involving family/friends with patient consent"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for low mood and distress", "Approached firearms issue sensitively and non-judgmentally", "Built rapport to enable open discussion", "Listened actively to patient concerns", "Addressed concerns about treatment and prognosis", "Involved patient in safety planning", "Maintained professional, supportive manner throughout"]}}'
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
  'You are a GP. A 72-year-old woman, Mrs. Margaret Harris, has booked a telephone consultation. She had routine blood tests done 4 days ago. The results show an elevated corrected calcium level of 2.85 mmol/L. She has a history of breast cancer treated 8 years ago.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Systematic review of hypercalcaemia symptoms (bones, kidneys, mental state)", "Explored bone pain, kidney stones, and abdominal symptoms", "Assessed mental state and cognitive function", "Obtained comprehensive cancer history and follow-up status", "Reviewed all medications including supplements", "Explored understanding of results and concerns", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Interpreted hypercalcaemia appropriately in clinical context", "Considered primary hyperparathyroidism as likely cause", "Considered malignancy appropriately given cancer history", "Reviewed medication contributions (calcium supplements)", "Planned appropriate investigations (PTH, vitamin D, PTH-rp if needed)", "Addressed cancer recurrence concerns sensitively", "Arranged appropriate follow-up with investigation results", "Considered endocrinology referral if primary hyperparathyroidism confirmed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for cancer concerns", "Used clear, reassuring language throughout", "Listened actively to patient concerns", "Addressed concerns about cancer recurrence appropriately", "Explained results in understandable terms", "Involved patient in management decisions", "Maintained professional, supportive manner"]}}');

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
  'You are a GP. A 29-year-old man, Mr. Liam O''Connor, has booked an urgent video consultation. He returned from a 3-week backpacking trip to Southeast Asia 2 weeks ago and has developed jaundice.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed jaundice systematically (onset, progression, associated symptoms)", "Explored comprehensive travel history (destination, duration, activities)", "Assessed vaccination history and prophylaxis", "Explored food and water exposure abroad", "Assessed for complications (liver failure signs)", "Explored risk factors (tattoos, transfusions, IV drug use)", "Obtained social history including alcohol", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered travel-related infections appropriately (hepatitis A, B, E)", "Assessed for acute liver failure and complications", "Planned appropriate investigations (LFTs, hepatitis serology, clotting)", "Considered urgent hospital referral if severe", "Addressed contact tracing and public health notification", "Provided clear safety-netting advice", "Arranged appropriate urgent follow-up", "Addressed supportive care (rest, hydration, avoid alcohol)"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for worry and concern", "Used clear, reassuring language while taking seriously", "Listened actively to travel history", "Addressed travel-related concerns appropriately", "Explained urgency without causing excessive panic", "Involved patient in management decisions", "Maintained professional, caring manner"]}}');

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
  'You are a GP. A mother, Mrs. Jennifer Taylor, has booked a telephone consultation about her 7-year-old daughter, Mia. Mia has been having difficulty sleeping for the last 3 months, which is affecting the whole family.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic sleep history (bedtime, falling asleep, waking, total sleep)", "Assessed daytime impact on school and behaviour", "Explored potential causes (anxiety, routine, screens, environment)", "Assessed for underlying medical causes", "Explored family circumstances and stressors", "Assessed sleep hygiene factors", "Explored ICE with parent thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed sleep hygiene appropriately (routine, screens, environment)", "Considered anxiety management strategies", "Provided behavioural strategies (graduated extinction, reward charts)", "Addressed family impact and provided support", "Discussed school support if anxiety school-related", "Arranged appropriate follow-up", "Considered CAMHS referral if anxiety significant", "Addressed parental concerns about medication"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for family impact and exhaustion", "Used clear, supportive language throughout", "Listened actively to parental concerns", "Addressed concerns about impact on child and family", "Provided practical, achievable advice", "Involved parent in management plan", "Maintained professional, caring manner"]}}');

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
  'You are a GP. A 78-year-old man, Mr. Arthur Brown, has booked a telephone consultation. He had routine blood tests done 3 days ago following a fall. The results show a sodium level of 128 mmol/L.',
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
  ARRAY['Interpret hyponatraemia', 'Assess for symptoms', 'Consider causes (SIADH, heart failure, medications)', 'Review medications (diuretics, ACE inhibitors)', 'Assess fluid status', 'Plan appropriate investigations', 'Consider medication review'],
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Systematic review of hyponatraemia symptoms (confusion, nausea, weakness)", "Assessed for falls and dizziness", "Reviewed all medications comprehensively", "Assessed fluid intake and dietary habits", "Obtained relevant medical history (heart failure, stroke)", "Explored understanding of results", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Interpreted hyponatraemia appropriately in clinical context", "Considered medication causes (diuretics + ACE inhibitor)", "Considered SIADH given stroke history", "Planned appropriate investigations (urine osmolality, sodium, cortisol)", "Considered medication review and adjustment", "Addressed fluid restriction if SIADH confirmed", "Provided clear safety-netting advice", "Arranged appropriate follow-up and considered endocrinology referral"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Reassured appropriately while taking results seriously", "Used clear, non-jargon language throughout", "Listened actively to patient concerns", "Addressed concerns about seriousness", "Explained investigations and management clearly", "Involved patient in medication review decisions", "Maintained professional, empathetic manner"]}}');

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
  'You are a GP. A support worker has booked a telephone consultation on behalf of Mr. Daniel Clarke, a 32-year-old man with a learning disability. The support worker reports that Mr. Clarke has noticed blood when he goes to the toilet over the last few days.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Ensured patient participation and used appropriate communication", "Took history with support worker assistance effectively", "Explored bleeding characteristics systematically (amount, frequency, colour)", "Assessed bowel habits and constipation history", "Screened for red flags (weight loss, pain, change in bowel habit)", "Explored diet and fluid intake", "Explored ICE with both patient and support worker"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered likely causes appropriately (haemorrhoids, anal fissure)", "Addressed constipation management comprehensively", "Discussed topical treatments if appropriate", "Provided clear safety-netting advice", "Considered face-to-face review for examination", "Arranged appropriate follow-up", "Considered referral if red flags develop", "Addressed patient needs appropriately"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Communicated effectively with patient with learning disability", "Used simple, clear language throughout", "Involved patient appropriately in consultation", "Worked collaboratively with support worker", "Demonstrated empathy for patient concerns", "Maintained patient dignity and autonomy", "Maintained professional, caring manner"]}}');

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
  'You are a GP. A district nurse has contacted the practice about Mrs. Helen Morrison, a 67-year-old woman with advanced lung cancer who is receiving palliative care at home. The district nurse reports that Mrs. Morrison has developed severe pain in her right leg over the last 2 days and her current pain medications are not helping.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed pain systematically using pain scales and characteristics", "Explored pain site, onset, character, severity, and radiation", "Reviewed current pain medications and their effectiveness", "Assessed for new pathology (fracture, DVT signs)", "Explored impact on sleep and daily activities", "Obtained comprehensive cancer and metastases history", "Explored patient preferences and concerns", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered pathological fracture and arranged appropriate assessment", "Optimised pain control appropriately (increased breakthrough dose)", "Considered increasing background morphine if needed", "Considered co-analgesics (gabapentin for neuropathic pain)", "Reviewed dexamethasone dose for bone pain", "Considered specialist palliative care team input", "Addressed staying at home concerns", "Arranged appropriate urgent follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for distress and pain", "Used clear, supportive language throughout", "Listened actively to patient concerns", "Addressed concerns about pain control and prognosis", "Acknowledged impact on quality of life", "Involved patient in pain management decisions", "Maintained professional, caring manner"]}}');

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
  'You are a GP. A 31-year-old woman, Ms. Laura Bennett, has booked a video consultation. She has attended several times over the last 6 months with various complaints including headaches, anxiety, and sleep problems.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Recognised disclosure of domestic abuse appropriately", "Assessed immediate safety and risk to patient", "Explored frequency, triggers, and pattern of abuse", "Assessed for injuries and their explanations", "Explored support network and isolation", "Explored patient''s wishes and concerns", "Explored ICE thoroughly", "Obtained relevant social and relationship history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Responded appropriately to disclosure with sensitivity", "Assessed safety and discussed safety planning", "Provided information about support services (Refuge, Women''s Aid, IDVA)", "Considered safeguarding referral appropriately", "Considered MARAC referral if high risk", "Respected patient autonomy in decision-making", "Documented clearly and confidentially", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy and sensitivity throughout", "Used supportive, non-judgmental language", "Listened actively and created safe space", "Built trust to enable disclosure", "Respected patient autonomy and choices", "Maintained confidentiality appropriately", "Maintained professional, caring manner"]}}');

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
  'You are a GP. A 48-year-old man, Mr. Patrick O''Brien, has booked a video consultation. He is from the Traveller community and has type 2 diabetes. His recent HbA1c is 72 mmol/mol. He has missed several appointments recently.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored diabetes history and current control comprehensively", "Assessed medication compliance and monitoring", "Identified barriers to healthcare access", "Explored lifestyle factors (diet, exercise, work patterns)", "Explored cultural and community factors", "Assessed understanding of diabetes and complications", "Explored support network and family circumstances", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed diabetes control with flexible approach", "Provided culturally sensitive management plan", "Addressed barriers to care (flexible appointments, remote consultations)", "Worked with patient''s lifestyle rather than against it", "Considered community health worker involvement if available", "Built trust through understanding and flexibility", "Arranged appropriate follow-up that works for patient", "Addressed health inequalities appropriately"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated cultural sensitivity and awareness", "Built trust and rapport through understanding", "Used non-judgmental approach throughout", "Listened actively to patient concerns and barriers", "Respected patient''s lifestyle and community", "Addressed mistrust of healthcare system sensitively", "Maintained professional, respectful manner"]}}');

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
  'You are a GP. A 22-year-old man, Mr. Alex Johnson, has booked a video consultation. He has noticed a lesion on his hand that has been present for several weeks.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic history of lesion (site, onset, appearance)", "Explored lesion characteristics (size, colour, surface, texture)", "Assessed for change over time", "Explored associated symptoms (pain, itching, bleeding)", "Assessed for multiple lesions", "Obtained relevant medical history", "Explored occupational exposure", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered appropriate differential diagnosis", "Assessed for malignant features (ABCDE criteria)", "Planned appropriate treatment (cryotherapy or topical)", "Provided reassurance if benign appearance", "Discussed treatment options clearly", "Provided clear safety-netting advice", "Arranged appropriate follow-up", "Considered referral if diagnosis unclear"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Used clear, non-jargon language throughout", "Listened actively to patient concerns", "Addressed concerns about seriousness", "Explained diagnosis and treatment options clearly", "Involved patient in treatment decisions", "Maintained professional manner"]}}');

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
  'You are a GP. A 28-year-old man, Mr. Ryan Murphy, has booked a video consultation. He appears anxious and hesitant to discuss the reason for his appointment.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Created safe, non-judgmental environment for discussion", "Addressed embarrassment sensitively", "Took systematic history of haematospermia", "Assessed frequency, amount, and characteristics", "Explored associated symptoms (pain, urinary symptoms)", "Assessed for risk factors (STIs, trauma)", "Explored sexual history appropriately", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Provided appropriate reassurance (usually benign in young men)", "Considered differential diagnosis appropriately", "Planned investigations if persistent (urine, STI screen)", "Discussed when further investigation needed", "Arranged appropriate follow-up", "Considered urology referral if persistent", "Addressed anxiety and concerns", "Provided clear information"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for embarrassment", "Created non-judgmental, safe environment", "Used sensitive, supportive language", "Listened actively to patient concerns", "Addressed concerns about seriousness", "Maintained confidentiality appropriately", "Maintained professional, caring manner"]}}');

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
  'You are a GP. A 17-year-old girl, Miss Emily Davies, has booked a video consultation. She appears anxious and the receptionist notes she requested a female doctor if possible.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Created safe, supportive environment for discussion", "Confirmed pregnancy with appropriate test", "Explored options sensitively (continue, termination, adoption)", "Assessed support network and family circumstances", "Explored concerns about telling parents and partner", "Assessed decision-making capacity (Gillick competence)", "Explored understanding of options", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Provided information about all options appropriately", "Addressed termination services and referral if requested", "Considered confidentiality and Gillick competence", "Provided appropriate referrals (termination service, counselling)", "Addressed support needs", "Discussed telling parents/partner (respecting autonomy)", "Arranged appropriate follow-up", "Addressed safety-netting"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for distress and anxiety", "Created non-judgmental, supportive environment", "Used sensitive, supportive language throughout", "Listened actively to patient concerns", "Respected patient autonomy in decision-making", "Maintained confidentiality appropriately", "Maintained professional, caring manner"]}}');

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
  'You are a GP. A mother, Mrs. Susan Parker, has booked a telephone consultation about her 9-year-old son, Jake. The school nurse has raised concerns about Jake''s weight.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed weight and growth trajectory appropriately", "Explored lifestyle factors comprehensively (diet, exercise, screen time)", "Assessed family eating patterns and portion sizes", "Explored emotional eating and triggers", "Assessed social impact (bullying, self-esteem)", "Explored family history of obesity and diabetes", "Assessed child''s preferences and barriers to change", "Explored ICE with parent thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed weight sensitively without blame or judgment", "Provided family-based approach to lifestyle changes", "Addressed screen time and physical activity", "Discussed healthy eating with practical advice", "Addressed emotional eating and triggers", "Considered referral to dietitian if needed", "Arranged appropriate follow-up", "Addressed bullying and self-esteem concerns"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for parental concerns", "Avoided blame or judgment throughout", "Used supportive, non-judgmental language", "Listened actively to parental concerns", "Addressed concerns about impact on child", "Provided practical, achievable advice", "Maintained professional, caring manner"]}}');

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
  'You are a GP. A 54-year-old man, Mr. Michael Thompson, has booked a telephone consultation. He has had a persistent cough for the last 3 months that is not improving.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic cough history (duration, character, timing)", "Assessed for red flags comprehensively (weight loss, haemoptysis)", "Explored smoking history in detail", "Assessed family history of lung cancer", "Explored occupational exposure (dust, asbestos)", "Reviewed all medications including ACE inhibitor", "Explored associated symptoms", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered ACE inhibitor cough and trial of stopping", "Assessed malignancy risk appropriately (smoking, family history, weight loss)", "Planned urgent investigations (chest X-ray given red flags)", "Considered 2-week wait referral if appropriate", "Addressed smoking cessation strongly", "Provided clear safety-netting advice", "Arranged appropriate urgent follow-up", "Considered spirometry if COPD suspected"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for concerns", "Used clear language throughout", "Addressed smoking sensitively", "Addressed cancer concerns given family history", "Listened actively to patient concerns", "Explained urgency without causing excessive panic", "Maintained professional manner"]}}');

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
  'You are a GP. A 65-year-old woman, Mrs. Dorothy White, has booked a telephone consultation. She was recently prescribed a medication by a colleague at the practice, and it has been discovered that there was an error in the prescription that may have caused her harm.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored patient''s understanding of the error", "Assessed for any harm or symptoms", "Explored current health status", "Assessed INR and coagulation status", "Explored patient''s concerns and worries", "Explored understanding of what happened", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Practiced duty of candour appropriately and comprehensively", "Apologised sincerely and took responsibility", "Explained error clearly and transparently", "Assessed for harm (elevated INR but no bleeding)", "Provided appropriate reassurance", "Explained actions taken to correct error", "Arranged appropriate follow-up and monitoring", "Documented error and discussion appropriately"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated honesty and transparency throughout", "Apologised appropriately and sincerely", "Used clear, empathetic language", "Listened actively to patient concerns", "Addressed concerns about harm and future", "Maintained professional, accountable manner", "Built trust through openness"]}}');

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
  'You are a GP. A 42-year-old man, Mr. David Cooper, has booked a video consultation. He is a military veteran who left the forces 3 years ago. His wife has been encouraging him to see a doctor about his mood.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Recognised military veteran context and service history", "Assessed mental health systematically (mood, sleep, concentration)", "Screened for PTSD symptoms (nightmares, hypervigilance, avoidance)", "Assessed suicide risk comprehensively", "Explored alcohol use and its impact", "Explored adjustment to civilian life", "Assessed support network and isolation", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed stigma sensitively and appropriately", "Considered PTSD and depression as diagnoses", "Planned appropriate treatment (antidepressant, trauma therapy)", "Considered veteran-specific services (Combat Stress, Help for Heroes)", "Addressed alcohol use and its impact", "Arranged appropriate follow-up", "Considered family support and relationship strain", "Provided clear safety-netting and crisis contacts"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated understanding of veteran context and culture", "Addressed stigma sensitively and supportively", "Used empathetic, non-judgmental language", "Listened actively to patient concerns", "Built trust to enable disclosure", "Addressed concerns about being seen as weak", "Maintained professional, respectful manner"]}}');

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
  'You are a GP. A 58-year-old man, Mr. Stephen Roberts, has booked an urgent telephone consultation. He has type 2 diabetes and is calling about a problem with his foot.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed foot problem systematically (site, onset, appearance)", "Explored infection signs (redness, swelling, discharge, warmth)", "Assessed for spreading infection and systemic symptoms", "Explored diabetes history and control", "Assessed for diabetic complications (neuropathy)", "Explored previous foot problems", "Assessed for trauma or precipitating factors", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised urgency appropriately (diabetic foot emergency)", "Arranged urgent face-to-face assessment", "Considered diabetic foot complications", "Planned appropriate treatment (antibiotics if needed)", "Considered diabetic foot team referral if severe", "Provided clear safety-netting advice", "Arranged appropriate urgent follow-up", "Addressed diabetes control in context"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for concerns about diabetes complications", "Used clear, reassuring language while taking seriously", "Addressed diabetes concerns appropriately", "Listened actively to patient concerns", "Explained urgency without causing excessive panic", "Maintained professional, caring manner"]}}');

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
  'You are a GP. A 25-year-old woman, Ms. Hannah Green, has booked a video consultation. She has been experiencing persistent fatigue for the last 4 months.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic fatigue history (onset, severity, pattern, impact)", "Assessed for red flags (weight loss, fever, lymphadenopathy)", "Explored associated symptoms comprehensively", "Explored lifestyle factors (work stress, sleep, diet)", "Screened for mental health causes", "Assessed menstrual function", "Explored impact on daily activities and work", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Planned appropriate investigations (FBC, TFTs, B12, folate, ferritin)", "Addressed lifestyle factors (sleep hygiene, stress management, diet)", "Considered mental health causes and screening", "Provided appropriate reassurance", "Arranged appropriate follow-up", "Considered referral if no cause found", "Addressed concerns about serious illness", "Provided clear safety-netting"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for frustration and impact", "Used clear, supportive language throughout", "Listened actively to patient concerns", "Addressed concerns about serious illness", "Acknowledged impact on work and relationships", "Involved patient in management decisions", "Maintained professional, caring manner"]}}');

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
  'You are a GP. A 72-year-old woman, Mrs. Barbara Clark, has booked a telephone consultation. She had routine blood tests done 5 days ago and the results show a microcytic anaemia.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Interpreted anaemia results correctly (microcytic, low ferritin)", "Assessed for symptoms of anaemia comprehensively", "Explored bleeding history (bowel, urine, gums, nose)", "Reviewed all medications including NSAIDs", "Assessed diet and nutritional intake", "Obtained relevant medical history", "Explored understanding of results", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Diagnosed iron deficiency anaemia appropriately", "Considered GI blood loss as likely cause (NSAID use)", "Planned iron replacement with appropriate dosing", "Considered GI investigations (OGD, colonoscopy) given age and NSAID use", "Reviewed medications and considered alternatives", "Arranged appropriate follow-up to monitor response", "Provided clear safety-netting advice", "Considered faecal occult blood test"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Reassured appropriately while taking results seriously", "Used clear, non-jargon language throughout", "Listened actively to patient concerns", "Addressed concerns about seriousness", "Explained investigations and treatment clearly", "Involved patient in management decisions", "Maintained professional, empathetic manner"]}}');

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
  'You are a GP. A 45-year-old woman, Mrs. Linda Foster, has booked an urgent telephone consultation. She woke up this morning with severe dizziness and is unable to get out of bed.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed vertigo systematically (type, onset, severity, triggers)", "Distinguished true vertigo from dizziness", "Assessed for red flags comprehensively (neurological signs, headache)", "Explored hearing, ear symptoms, and vision", "Assessed for associated symptoms (nausea, vomiting)", "Obtained relevant medical history (migraine)", "Explored previous episodes", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered appropriate diagnosis (vestibular neuritis vs BPPV)", "Excluded stroke appropriately given absence of neurological signs", "Provided symptomatic treatment (prochlorperazine/cyclizine)", "Gave clear safety-netting advice for red flags", "Arranged appropriate follow-up", "Considered ENT referral if persistent", "Considered Epley manoeuvre if BPPV suspected", "Addressed migraine-associated vertigo as possibility"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for distress and fear", "Used clear, reassuring language while taking seriously", "Listened actively to patient concerns", "Addressed concerns about stroke appropriately", "Explained likely cause and treatment clearly", "Maintained professional, caring manner"]}}');

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
  'You are a GP. A 28-year-old man, Mr. Kevin Mitchell, has booked a telephone consultation. He works as a chef and has developed a skin condition on his hands.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed skin condition systematically (site, appearance, onset)", "Explored occupational factors (job, exposure, gloves)", "Assessed work impact and requirements", "Explored previous skin conditions and atopy", "Explored treatment tried", "Assessed severity and weeping", "Explored work concerns and job security", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Provided appropriate treatment (topical steroid, emollients)", "Addressed fitness for work appropriately", "Considered occupational health referral", "Discussed work modifications and precautions", "Addressed sick note request appropriately", "Arranged appropriate follow-up", "Considered barrier creams and protective measures", "Balanced patient needs with food safety"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for work concerns", "Used clear, practical language", "Listened actively to patient concerns", "Addressed practical concerns about job and income", "Explained treatment and work implications clearly", "Maintained professional manner"]}}');

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
  'You are a GP. A 34-year-old man, Mr. Marcus Johnson, has booked a telephone consultation. He was recently released from prison and needs to register with a GP and get his medications.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored medication needs comprehensively", "Assessed current health status", "Explored registration status and previous GP", "Assessed accommodation and social circumstances", "Explored barriers to healthcare access", "Assessed support network", "Explored understanding of healthcare system", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Facilitated urgent registration appropriately", "Ensured medication continuity urgently (critical for diabetes, mental health)", "Addressed barriers to care", "Provided prescriptions based on patient report initially", "Arranged health assessment and monitoring", "Provided support and information about services", "Arranged appropriate follow-up", "Considered social support if needed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for anxiety about accessing care", "Used non-judgmental approach throughout", "Listened actively to patient concerns", "Addressed concerns about continuity of care", "Provided clear, helpful information", "Maintained professional, supportive manner"]}}');

-- =====================================================
-- CASE 31: Low Platelet Count in Young Adult
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Abnormal Blood Test Results',
  'Haematology',
  'HAEM-002',
  'You are a GP. A 24-year-old woman, Ms. Emma Watson, has booked a telephone consultation. She had routine blood tests done 4 days ago and the results show a low platelet count.',
  '{"name": "Ms. Emma Watson", "age": 24, "gender": "Female"}',
  '{"patient": "Ms. Emma Watson", "age": 24, "gender": "Female", "pmh": "No significant past medical history", "medications": "Combined oral contraceptive pill", "allergies": "None known", "social_summary": "University student, non-smoker, occasional alcohol", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hi doctor, I got a message about my blood test results. I wasn''t expecting anything to be wrong - I feel fine. Is everything okay?",
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Interpreted thrombocytopenia appropriately", "Assessed for bleeding symptoms comprehensively", "Explored bruising, petechiae, and bleeding history", "Reviewed all medications including COCP", "Explored recent illness or infections", "Assessed for risk factors", "Explored understanding of results", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Assessed severity appropriately (mild, no bleeding)", "Considered appropriate causes (ITP, drug-induced, viral)", "Planned investigations (repeat FBC, viral screen, autoimmune screen)", "Reviewed medications and considered contributions", "Provided appropriate reassurance", "Gave clear safety-netting advice", "Arranged appropriate follow-up", "Considered haematology referral if persistent"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Reassured appropriately while taking results seriously", "Used clear, non-jargon language throughout", "Listened actively to patient concerns", "Addressed concerns about seriousness", "Explained investigations and monitoring clearly", "Involved patient in management decisions", "Maintained professional, empathetic manner"]}}');

-- =====================================================
-- CASE 32: Enuresis in Child
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Bedwetting Concerns',
  'Paediatrics',
  'PAED-004',
  'You are a GP. A mother, Mrs. Claire Mitchell, has booked a telephone consultation about her 8-year-old son, Tom. Tom is still wetting the bed at night.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed enuresis pattern comprehensively (frequency, amount, timing)", "Distinguished primary vs secondary enuresis", "Assessed for underlying causes (UTI, diabetes, constipation)", "Explored toileting habits and daytime continence", "Assessed psychosocial impact (bullying, self-esteem, sleepovers)", "Explored family history of enuresis", "Assessed for stressors or triggers", "Explored ICE with parent thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Provided appropriate treatment options (enuresis alarm, desmopressin)", "Addressed psychosocial impact and self-esteem", "Considered family history in management", "Discussed lifestyle measures (toileting routine, fluid management)", "Arranged appropriate follow-up", "Considered referral to enuresis clinic if needed", "Addressed sleepover concerns with practical support", "Provided reassurance about prognosis"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for parental and child concerns", "Used supportive, non-judgmental language", "Listened actively to parental concerns", "Addressed concerns about impact on child", "Provided practical, achievable advice", "Involved parent in management plan", "Maintained professional, caring manner"]}}');

-- =====================================================
-- CASE 33: Uncontrolled Asthma in Young Adult
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Asthma Review Consultation',
  'Respiratory',
  'RESP-004',
  'You are a GP. A 19-year-old woman, Ms. Jessica Brown, has booked a telephone consultation. She has asthma and has been using her reliever inhaler more frequently recently.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed asthma control comprehensively (symptoms, reliever use, night symptoms)", "Reviewed medication compliance and technique", "Identified triggers (allergies, smoking, exercise, stress)", "Explored hayfever and its management", "Assessed exercise tolerance and limitations", "Explored lifestyle factors (university, stress)", "Assessed understanding of asthma management", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Optimised preventer therapy appropriately", "Addressed smoking cessation strongly", "Addressed triggers (hayfever management, exercise)", "Planned step-up in treatment if needed", "Arranged inhaler technique review", "Provided asthma action plan", "Arranged appropriate follow-up", "Addressed education needs"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for concerns", "Addressed smoking sensitively", "Used clear, supportive language", "Listened actively to patient concerns", "Addressed concerns about needing more medication", "Involved patient in management plan", "Maintained professional manner"]}}');

-- =====================================================
-- CASE 34: Visible Haematuria in Older Adult
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Blood in Urine Consultation',
  'Urology',
  'URO-002',
  'You are a GP. A 68-year-old man, Mr. Peter Anderson, has booked an urgent telephone consultation. He has noticed blood in his urine.',
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
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed haematuria systematically (onset, frequency, characteristics)", "Explored associated symptoms (pain, frequency, urgency)", "Assessed for red flags comprehensively", "Obtained relevant medical history (BPH)", "Explored occupational exposure", "Assessed risk factors", "Explored understanding and concerns", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised urgency appropriately (visible haematuria in older adult)", "Arranged urgent investigations (urine, cytology, renal function)", "Considered 2-week wait urology referral appropriately", "Planned imaging if needed", "Provided clear safety-netting advice", "Arranged appropriate urgent follow-up", "Considered malignancy appropriately given age", "Addressed BPH as contributing factor"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for concerns", "Used clear, reassuring language while taking seriously", "Addressed cancer concerns appropriately", "Listened actively to patient concerns", "Explained urgency without causing excessive panic", "Maintained professional, caring manner"]}}');

-- =====================================================
-- CASE 35: Telephone - Chest Pain Follow-up
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Chest Pain Follow-up',
  'Cardiology',
  'CARD-003',
  'You are a GP. A 58-year-old man, Mr. David Thompson, has booked a telephone consultation for follow-up of chest pain. He was seen in A&E 3 days ago for chest pain and discharged with advice to see his GP.',
  '{"name": "Mr. David Thompson", "age": 58, "gender": "Male"}',
  '{"patient": "Mr. David Thompson", "age": 58, "gender": "Male", "pmh": "Hypertension, type 2 diabetes, previous MI 5 years ago", "medications": "Ramipril 5mg OD, Metformin 1g BD, Atorvastatin 80mg ON, Aspirin 75mg OD, Bisoprolol 5mg OD", "allergies": "No known allergies", "social_summary": "Retired, lives with wife, ex-smoker (stopped 5 years ago)", "family_summary": "Father died of MI at 65"}',
  '{
    "opening_statement": "Hello doctor, I was in A&E a few days ago with chest pain. They did some tests and said everything was fine, but I''m still worried. They told me to see my GP.",
    "freely_given_history": {
      "presenting_complaint": "Had chest pain 3 days ago. Went to A&E. They did ECG and blood tests. Said it wasn''t a heart attack and sent me home. Still having some discomfort.",
      "psychosocial_impact": "Anxious about his heart given previous MI. Worried it might happen again.",
      "ice": {
        "ideas": "Worried it might be his heart again",
        "concerns": "Scared about having another heart attack. Unsure if the pain is serious.",
        "expectations": "Wants to know if he needs more tests or if everything is okay"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "chest_pain": "Started 3 days ago. Central chest discomfort, not really pain. Feels like pressure. Comes and goes.",
        "onset": "Started suddenly while watching TV. No exertion.",
        "character": "Pressure-like, not sharp. Not stabbing.",
        "radiation": "No radiation to arms or jaw",
        "severity": "Mild to moderate. Not severe.",
        "duration": "Lasts a few minutes then goes. Comes back intermittently.",
        "triggers": "No clear triggers. Not related to exertion.",
        "relieving_factors": "Seems to settle on its own. Not related to position.",
        "associated_symptoms": "No shortness of breath. No nausea. No sweating. No dizziness.",
        "current_status": "Still having episodes but less frequent. Not as bad as 3 days ago."
      },
      "pmh": {
        "previous_mi": "Had a heart attack 5 years ago. Had a stent put in. Been well since.",
        "hypertension": "High blood pressure, well controlled",
        "diabetes": "Type 2 diabetes, well controlled",
        "other_conditions": "No other conditions"
      },
      "medications": {
        "current": "Ramipril, Metformin, Atorvastatin, Aspirin, Bisoprolol - all taken regularly",
        "compliance": "Takes all medications as prescribed",
        "recent_changes": "No recent changes"
      },
      "social_hx": {
        "smoking": "Stopped smoking 5 years ago after heart attack",
        "alcohol": "Occasional glass of wine",
        "exercise": "Goes for walks daily"
      }
    }
  }',
  'ANXIOUS but trying to stay calm. Voice shows worry. If doctor is reassuring and explains clearly, show some relief. May ask multiple questions about risk and what to watch for.',
  'full',
  720,
  'medium',
  ARRAY['Take focused cardiac history', 'Assess for cardiac vs non-cardiac chest pain', 'Review A&E findings appropriately', 'Consider differential diagnosis', 'Provide appropriate reassurance or further investigation', 'Clear safety-netting advice', 'Address anxiety appropriately'],
  '## Model Approach


**Key Priorities:**

1. Take focused cardiac history
2. Assess current symptoms vs A&E presentation
3. Review A&E findings (if available) or discuss what was done
4. Consider differential diagnosis (cardiac vs non-cardiac)
5. Provide appropriate management plan
6. Clear safety-netting advice


**Differential Diagnosis:**

- Cardiac: Angina (stable or unstable), previous MI complications
- Non-cardiac: Musculoskeletal, GORD, anxiety
- Other: Less likely given history


**Management:**

- Review A&E notes if available (ECG, troponin results)
- If A&E ruled out acute MI appropriately:
  - Consider this may be stable angina or non-cardiac
  - Consider further assessment: exercise tolerance test or cardiology review
  - Optimise secondary prevention medications
- If symptoms persist or worsen:
  - Consider urgent cardiology review
  - May need further investigations
- Safety-netting:
  - **CRITICAL: If develops severe chest pain, especially with exertion, shortness of breath, or feels unwell - call 999 immediately**
  - If symptoms worsen or become more frequent - seek urgent medical attention
- Follow-up:
  - Arrange face-to-face review to examine and discuss further
  - Consider cardiology referral if ongoing concerns


**Important:** Given previous MI and ongoing symptoms, need to take seriously while providing appropriate reassurance.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic cardiac history (pain characteristics, triggers, relieving factors)", "Assessed current symptoms vs A&E presentation", "Explored associated symptoms comprehensively", "Reviewed medications and compliance", "Obtained relevant cardiac history (previous MI)", "Assessed risk factors", "Explored understanding of A&E visit", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered cardiac vs non-cardiac causes appropriately", "Reviewed A&E findings and interpretation", "Considered further investigations if needed (exercise test, cardiology review)", "Optimised secondary prevention medications", "Provided clear safety-netting advice", "Arranged appropriate follow-up", "Considered cardiology referral if appropriate", "Addressed ongoing cardiac risk"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for anxiety given previous MI", "Used clear, reassuring language while taking seriously", "Listened actively to concerns", "Addressed fears about another heart attack appropriately", "Explained findings and plan clearly", "Involved patient in management decisions", "Maintained professional, supportive manner"]}}'
);

-- =====================================================
-- CASE 36: Telephone - Medication Query
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Medication Side Effects Query',
  'General Practice',
  'GP-001',
  'You are a GP. A 72-year-old woman, Mrs. Margaret Foster, has booked a telephone consultation. The receptionist notes she called earlier today with concerns about her new medication.',
  '{"name": "Mrs. Margaret Foster", "age": 72, "gender": "Female"}',
  '{"patient": "Mrs. Margaret Foster", "age": 72, "gender": "Female", "pmh": "Osteoarthritis, hypertension, depression", "medications": "Paracetamol 1g QDS, Ramipril 5mg OD, Sertraline 50mg OD (started 2 weeks ago), Ibuprofen 400mg TDS PRN", "allergies": "No known allergies", "social_summary": "Lives alone, widowed 2 years ago, independent", "family_summary": "Daughter lives nearby"}',
  '{
    "opening_statement": "Hello doctor, I started that new tablet you gave me for my mood a couple of weeks ago, and I''m not sure if it''s working or if I''m having side effects. I feel a bit strange.",
    "freely_given_history": {
      "presenting_complaint": "Started sertraline 2 weeks ago. Feeling nauseous, having trouble sleeping, and feeling a bit jittery. Not sure if this is normal.",
      "psychosocial_impact": "Anxious about the medication. Unsure if she should continue or stop.",
      "ice": {
        "ideas": "Thinks the medication might be causing problems",
        "concerns": "Worried about side effects. Unsure if she should keep taking it.",
        "expectations": "Wants to know if this is normal and what to do"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "nausea": "Feeling sick, especially in the mornings. Not actually vomiting. Started about a week after starting medication.",
        "sleep": "Having trouble falling asleep. Waking up early. Feeling restless at night.",
        "jittery": "Feeling a bit shaky and anxious. More anxious than before starting medication.",
        "mood": "Mood not really improved yet. Still feeling low.",
        "appetite": "Appetite reduced, not eating as much",
        "other_symptoms": "No dizziness. No headaches. No rash.",
        "timing": "Symptoms started about 1 week after starting medication"
      },
      "medications": {
        "sertraline": "Started 2 weeks ago, taking 50mg once daily in the morning as prescribed",
        "compliance": "Taking regularly, not missed any doses",
        "other_medications": "Taking other medications as usual - ramipril, paracetamol, ibuprofen when needed",
        "interactions": "Not aware of any interactions"
      },
      "pmh": {
        "depression": "Diagnosed with depression 3 months ago after husband died. Started on sertraline 2 weeks ago.",
        "hypertension": "Well controlled",
        "osteoarthritis": "Managed with painkillers"
      },
      "social_hx": {
        "support": "Daughter visits regularly, good support network",
        "alcohol": "Occasional glass of wine",
        "sleep_hygiene": "Generally good sleep routine"
      }
    }
  }',
  'ANXIOUS and UNCERTAIN. Voice shows concern. If doctor explains side effects are common and temporary, show some relief but still worried. May ask if she should stop the medication.',
  'full',
  720,
  'easy',
  ARRAY['Recognise common SSRI side effects', 'Assess severity of side effects', 'Consider timing (early side effects vs ongoing)', 'Explore mood improvement', 'Provide appropriate advice (continue vs adjust)', 'Clear safety-netting', 'Address concerns appropriately'],
  '## Model Approach


**Key Priorities:**

1. Assess side effects systematically
2. Recognise common early SSRI side effects
3. Assess severity and impact
4. Consider timing (early side effects often improve)
5. Explore mood improvement
6. Provide appropriate management plan


**Differential Diagnosis:**

- Common early SSRI side effects (nausea, insomnia, anxiety - often improve with time)
- Medication intolerance (if severe or persistent)
- Worsening depression/anxiety (less likely given timing)
- Other causes (less likely)


**Management:**

- **Reassure:** These are common early side effects of sertraline
  - Nausea, insomnia, and increased anxiety are typical in first 2-4 weeks
  - Usually improve as body adjusts to medication
- **Advice:**
  - Continue medication if side effects are tolerable
  - Take with food to reduce nausea
  - Consider taking in evening if insomnia is issue (discuss with doctor first)
  - Side effects usually improve within 2-4 weeks
- **If severe:**
  - Consider reducing dose temporarily or switching medication
  - May need to discuss with doctor
- **Mood improvement:**
  - Can take 4-6 weeks to see full benefit
  - Early side effects don''t mean medication won''t work
- **Safety-netting:**
  - If side effects become severe or intolerable - contact GP
  - If develops suicidal thoughts - seek urgent help
  - If symptoms worsen significantly - seek help
- **Follow-up:**
  - Review in 2-3 weeks to assess side effects and mood
  - May need dose adjustment or medication change if side effects persist


**Important:** Early SSRI side effects are common and usually improve. Need to balance continuing medication for benefit vs managing side effects.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed side effects systematically (nausea, sleep, anxiety)", "Explored timing of symptoms in relation to medication start", "Assessed severity and impact on daily life", "Explored mood improvement or lack thereof", "Reviewed medication compliance and timing", "Assessed for other symptoms", "Explored understanding of medication", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised common early SSRI side effects appropriately", "Provided appropriate reassurance about temporary nature", "Considered practical advice (taking with food, timing)", "Assessed whether to continue, adjust, or change medication", "Explained expected timeline for side effects and benefit", "Provided clear safety-netting advice", "Arranged appropriate follow-up", "Considered dose adjustment if needed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for concerns about medication", "Used clear, reassuring language", "Listened actively to worries", "Addressed concerns about side effects appropriately", "Explained medication effects clearly", "Involved patient in decisions about continuing medication", "Maintained professional, supportive manner"]}}'
);

-- =====================================================
-- CASE 37: Third-Party - NOK Calling About Elderly Parent
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'NOK - Elderly Parent Concerns',
  'Geriatrics',
  'GER-002',
  'You are a GP. A daughter, Mrs. Jennifer Adams, has booked a telephone consultation. She is calling about her 84-year-old mother, Mrs. Edith Adams, who is registered at your practice. The daughter is concerned about her mother''s memory and safety.',
  '{"name": "Mrs. Edith Adams", "age": 84, "gender": "Female", "caller": "Mrs. Jennifer Adams (daughter)"}',
  '{"patient": "Mrs. Edith Adams", "age": 84, "gender": "Female", "caller": "Mrs. Jennifer Adams", "pmh": "Hypertension, osteoarthritis, previous fall 6 months ago", "medications": "Ramipril 2.5mg OD, Paracetamol 1g QDS, Ibuprofen 400mg TDS PRN", "allergies": "No known allergies", "social_summary": "Lives alone, widowed 5 years ago, daughter visits daily", "family_summary": "Daughter is main carer"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about my mother, Edith Adams. I''m really worried about her. Her memory seems to be getting worse and I''m concerned she''s not safe living on her own anymore.",
    "freely_given_history": {
      "presenting_complaint": "Mother''s memory has been declining over the past 6 months. Forgetting appointments, leaving things on the stove, getting confused. Daughter is worried about safety.",
      "psychosocial_impact": "Daughter is very worried and stressed. Unsure what to do. Mother doesn''t want to discuss it.",
      "ice": {
        "ideas": "Thinks it might be dementia",
        "concerns": "Worried mother isn''t safe alone. Scared she might have a fall or leave the gas on.",
        "expectations": "Wants to know if mother needs assessment and what support is available"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "memory_problems": "Forgetting recent events, repeating questions, forgetting appointments. Getting worse over past 6 months.",
        "safety_concerns": "Left cooker on twice in past month. Forgot to turn off taps. Got lost in local area once.",
        "daily_living": "Still managing personal care. Cooking is becoming difficult. Shopping is challenging.",
        "mood": "Seems more withdrawn. Less interested in things she used to enjoy.",
        "sleep": "Sleep seems okay, though sometimes confused at night",
        "falls": "No recent falls, but daughter worried about risk",
        "medications": "Daughter unsure if mother is taking medications correctly",
        "other_symptoms": "No obvious physical symptoms. No incontinence mentioned."
      },
      "pmh": {
        "hypertension": "Well controlled",
        "osteoarthritis": "Managed with painkillers",
        "previous_fall": "Had a fall 6 months ago, no serious injury",
        "other_conditions": "No other significant conditions"
      },
      "social_hx": {
        "living_situation": "Lives alone in own home. Daughter visits daily. No other family nearby.",
        "support": "Daughter provides most support. No formal carers.",
        "finances": "Managing finances okay, though daughter helps more now"
      },
      "capacity": {
        "patient_awareness": "Mother doesn''t think there''s a problem. Gets defensive when daughter raises concerns.",
        "consent": "Daughter calling with mother''s knowledge but mother not present for call"
      }
    }
  }',
  'WORRIED and STRESSED. Voice shows significant concern. May become emotional. If doctor takes concerns seriously and offers assessment, show relief. May ask about care options and support.',
  'full',
  720,
  'hard',
  ARRAY['Consider confidentiality and capacity', 'Assess cognitive concerns systematically', 'Explore safety concerns', 'Consider differential diagnosis', 'Plan appropriate assessment', 'Discuss support options', 'Address family concerns appropriately'],
  '## Model Approach


**Key Priorities:**

1. **Consider confidentiality and capacity:**
   - Daughter calling about patient - need to consider patient''s capacity and consent
   - If patient has capacity, need their consent to discuss
   - If concerns about capacity, may need to assess
2. Assess cognitive concerns systematically
3. Explore safety concerns
4. Consider differential diagnosis
5. Plan appropriate assessment
6. Discuss support options


**Differential Diagnosis:**

- Dementia (Alzheimer''s, vascular, mixed)
- Mild cognitive impairment
- Delirium (less likely given chronic course)
- Depression (can cause cognitive symptoms)
- Other causes (less likely)


**Management:**

- **Confidentiality and consent:**
  - Need to discuss with patient directly if has capacity
  - If concerns about capacity, may need to assess capacity
  - Can accept information from family but need patient involvement
- **Assessment:**
  - Arrange face-to-face consultation with patient (may need to invite daughter)
  - Cognitive assessment (MMSE, MoCA, or similar)
  - Physical examination
  - Blood tests (B12, folate, TFTs, glucose, FBC, U&E)
  - Consider CT head if appropriate
- **Safety:**
  - Assess immediate safety concerns
  - Consider social services referral for care assessment
  - Discuss safety measures (gas safety, medication management)
- **Support:**
  - Discuss memory clinic referral if dementia suspected
  - Consider social services assessment
  - Discuss carer support for daughter
  - Consider medication review
- **Follow-up:**
  - Arrange urgent assessment given safety concerns
  - Regular review


**Important:** Need to balance patient autonomy and confidentiality with safety concerns. Family concerns are important but need patient involvement.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Considered confidentiality and capacity appropriately", "Assessed cognitive concerns systematically (memory, confusion, safety)", "Explored safety concerns comprehensively (cooker, falls, medication)", "Assessed impact on daily living activities", "Explored mood and behavioural changes", "Obtained relevant medical history", "Assessed support network and family circumstances", "Explored ICE with family member thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed confidentiality and capacity appropriately", "Planned appropriate cognitive assessment", "Considered differential diagnosis (dementia, depression, delirium)", "Arranged appropriate investigations", "Addressed immediate safety concerns", "Considered memory clinic referral if appropriate", "Discussed social services assessment", "Arranged appropriate urgent follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for family concerns", "Addressed confidentiality sensitively", "Used clear, supportive language", "Listened actively to worries", "Addressed safety concerns appropriately", "Explained assessment process clearly", "Involved family in planning while respecting patient autonomy", "Maintained professional, caring manner"]}}'
);

-- =====================================================
-- CASE 38: Third-Party - District Nurse Calling About Wound
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'District Nurse - Wound Care',
  'Wound Care',
  'WC-001',
  'You are a GP. A district nurse, Sister Mary O''Brien, has booked a telephone consultation. She is calling about a patient, Mr. Robert Mitchell, who she is visiting for wound care. She has concerns about the wound not healing.',
  '{"name": "Mr. Robert Mitchell", "age": 78, "gender": "Male", "caller": "Sister Mary O''Brien (District Nurse)"}',
  '{"patient": "Mr. Robert Mitchell", "age": 78, "gender": "Male", "caller": "Sister Mary O''Brien", "pmh": "Type 2 diabetes, peripheral vascular disease, previous leg ulcer 2 years ago", "medications": "Metformin 1g BD, Gliclazide 80mg BD, Aspirin 75mg OD, Atorvastatin 20mg ON", "allergies": "No known allergies", "social_summary": "Lives alone, limited mobility, district nurse visits 3 times per week", "family_summary": "Son visits weekly"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about Mr. Robert Mitchell. I''ve been visiting him for wound care on his left leg for the past 6 weeks, and I''m concerned the wound isn''t healing as expected. I think he might need a review.",
    "freely_given_history": {
      "presenting_complaint": "Patient has a leg ulcer on left lower leg. Started 6 weeks ago after a minor injury. Wound is not healing, appears infected, and patient''s diabetes control may be affecting healing.",
      "psychosocial_impact": "Patient is frustrated. Limited mobility affecting quality of life.",
      "ice": {
        "ideas": "Thinks wound might be infected or need different treatment",
        "concerns": "Worried about infection and delayed healing",
        "expectations": "Wants medical review and possibly antibiotics or different dressings"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "wound_location": "Left lower leg, anterior aspect, about 5cm above ankle",
        "wound_size": "Approximately 3cm x 2cm, depth about 0.5cm",
        "wound_appearance": "Wound bed looks unhealthy - sloughy, some exudate. Surrounding skin red and inflamed. Edges not healing.",
        "exudate": "Moderate amount, yellowish. Not purulent but concerning.",
        "pain": "Patient reports pain, especially when dressing changed",
        "odour": "Slight odour, not strong",
        "healing": "No signs of healing over past 2 weeks. May be getting worse.",
        "duration": "6 weeks since initial injury"
      },
      "patient_factors": {
        "diabetes_control": "District nurse unsure of recent HbA1c. Patient says blood sugars ''a bit high''.",
        "mobility": "Limited mobility, walks with stick. Leg elevation difficult.",
        "nutrition": "Patient lives alone, diet may not be optimal",
        "circulation": "Known peripheral vascular disease. Pedal pulses present but weak.",
        "compliance": "Patient generally compliant with dressings"
      },
      "pmh": {
        "diabetes": "Type 2 diabetes, control uncertain",
        "pvd": "Peripheral vascular disease",
        "previous_ulcer": "Had leg ulcer 2 years ago, took 4 months to heal",
        "other_conditions": "No other significant conditions"
      },
      "current_treatment": {
        "dressings": "Using appropriate dressings, changed 3 times per week",
        "compression": "Not using compression (may be contraindicated given PVD)",
        "antibiotics": "No current antibiotics",
        "other": "Patient elevating leg when possible"
      }
    }
  }',
  'PROFESSIONAL but CONCERNED. Speak clearly and provide clinical details. If doctor takes concerns seriously and arranges review, show appreciation. May ask about antibiotic choice or dressing changes.',
  'full',
  720,
  'medium',
  ARRAY['Take focused wound history from healthcare professional', 'Assess wound characteristics', 'Consider factors affecting healing (diabetes, circulation)', 'Consider infection', 'Plan appropriate management', 'Consider specialist referral if needed', 'Coordinate care with district nurse'],
  '## Model Approach


**Key Priorities:**

1. Take focused wound history from district nurse
2. Assess wound characteristics and healing
3. Consider factors affecting healing (diabetes, PVD, nutrition)
4. Assess for infection
5. Plan appropriate management
6. Coordinate care with district nurse


**Differential Diagnosis:**

- Infected leg ulcer (likely given appearance)
- Non-healing ulcer due to poor circulation
- Non-healing ulcer due to poor diabetes control
- Mixed factors (infection + poor healing factors)


**Management:**

- **Assessment:**
  - Arrange face-to-face review to examine wound
  - Assess wound appearance, size, exudate, surrounding skin
  - Check pedal pulses and circulation
  - Assess for signs of infection (increased exudate, odour, surrounding cellulitis)
- **Investigations:**
  - Wound swab for culture and sensitivity
  - Check HbA1c to assess diabetes control
  - Consider vascular assessment if circulation poor
- **Treatment:**
  - If infected: Consider antibiotics (guided by swab results, but may need to start empirically)
  - Optimise diabetes control if poor
  - Review wound care and dressings
  - Consider compression if appropriate (but caution with PVD)
  - Consider specialist referral (tissue viability, vascular, diabetic foot clinic)
- **Coordination:**
  - Discuss plan with district nurse
  - Ensure clear communication about treatment plan
  - Regular review
- **Follow-up:**
  - Review in 1 week to assess response
  - Consider tissue viability or vascular referral if not improving


**Important:** Non-healing leg ulcers need comprehensive assessment. Infection, poor circulation, and diabetes control all need addressing.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took focused wound history from healthcare professional", "Assessed wound characteristics (size, appearance, exudate, healing)", "Explored factors affecting healing (diabetes, circulation, mobility)", "Assessed for signs of infection", "Obtained relevant medical history (diabetes, PVD)", "Explored current treatment and dressings", "Assessed patient factors (mobility, nutrition, compliance)", "Explored district nurse concerns thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Arranged appropriate face-to-face review", "Planned wound swab for culture", "Considered diabetes control optimisation", "Considered antibiotic treatment if infected", "Reviewed wound care and dressings", "Considered specialist referral (tissue viability, vascular, diabetic foot)", "Coordinated care with district nurse appropriately", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated respect for district nurse expertise", "Used clear, professional language", "Listened actively to concerns", "Explained management plan clearly", "Coordinated care effectively", "Maintained professional, collaborative manner", "Ensured clear communication about treatment plan"]}}'
);

-- =====================================================
-- CASE 39: Telephone - Acute Abdominal Pain
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Acute Abdominal Pain',
  'Gastroenterology',
  'GI-003',
  'You are a GP. A 45-year-old woman, Ms. Lisa Parker, has booked an urgent telephone consultation. The receptionist notes she called this morning with severe abdominal pain.',
  '{"name": "Ms. Lisa Parker", "age": 45, "gender": "Female"}',
  '{"patient": "Ms. Lisa Parker", "age": 45, "gender": "Female", "pmh": "Irritable bowel syndrome, previous appendicectomy age 20", "medications": "Mebeverine 135mg TDS PRN", "allergies": "No known allergies", "social_summary": "Works as office manager, lives with partner", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Doctor, I''m in a lot of pain. My stomach has been really hurting since yesterday evening and it''s getting worse. I don''t know if I should go to hospital or if you can help.",
    "freely_given_history": {
      "presenting_complaint": "Severe abdominal pain started yesterday evening. Right lower quadrant pain. Getting worse. Nauseous but not vomiting.",
      "psychosocial_impact": "In significant pain. Anxious about what it might be.",
      "ice": {
        "ideas": "Worried it might be something serious",
        "concerns": "Scared it might need surgery or be serious",
        "expectations": "Wants to know if she needs to go to hospital or if GP can help"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "pain_location": "Right lower quadrant, started yesterday evening",
        "pain_character": "Sharp, stabbing pain. Constant but comes in waves.",
        "pain_severity": "Severe, 8/10. Worse when moving.",
        "radiation": "No radiation",
        "onset": "Started suddenly yesterday evening after dinner",
        "associated_symptoms": "Nauseous but not vomiting. No fever. No diarrhoea. No urinary symptoms.",
        "bowel_habits": "Last bowel movement yesterday morning, normal. No diarrhoea or constipation.",
        "appetite": "Lost appetite, not eating",
        "urinary_symptoms": "No urinary symptoms",
        "menstrual": "Period finished 1 week ago, normal cycle"
      },
      "pmh": {
        "ibs": "Diagnosed with IBS 5 years ago. Usually managed with mebeverine.",
        "appendicectomy": "Had appendix removed age 20",
        "other_conditions": "No other conditions"
      },
      "medications": {
        "current": "Mebeverine PRN, not taken recently",
        "recent_changes": "No recent changes"
      },
      "social_hx": {
        "alcohol": "Occasional glass of wine",
        "diet": "Normal diet"
      }
    }
  }',
  'IN PAIN and ANXIOUS. Voice shows distress. Speak with urgency. If doctor arranges urgent assessment, show some relief. May ask if she needs to go to A&E.',
  'full',
  720,
  'medium',
  ARRAY['Assess acute abdominal pain systematically', 'Consider red flags', 'Assess for surgical causes', 'Consider differential diagnosis', 'Decide on urgent assessment vs safety-netting', 'Clear safety-netting advice', 'Address pain and anxiety'],
  '## Model Approach


**Key Priorities:**

1. Assess acute abdominal pain systematically
2. Consider red flags (peritonism, systemic symptoms)
3. Assess for surgical causes
4. Consider differential diagnosis
5. Decide on urgent assessment vs safety-netting
6. Clear safety-netting advice


**Differential Diagnosis:**

- Appendicitis (consider despite previous appendicectomy - stump appendicitis possible)
- Ovarian cyst (torsion, rupture)
- Ectopic pregnancy (if possibility)
- Diverticulitis
- Gastroenteritis
- IBS flare (less likely given severity)
- Other causes (less likely)


**Management:**

- **URGENT ASSESSMENT NEEDED:**
  - Severe right lower quadrant pain with systemic symptoms (nausea, loss of appetite) needs urgent assessment
  - Cannot exclude surgical cause over telephone
- **Advice:**
  - Arrange urgent face-to-face review or consider A&E if very severe
  - If arranging GP review, must be same-day
  - If pain becomes unbearable or develops other symptoms - go to A&E
- **Safety-netting:**
  - **CRITICAL: If pain becomes severe, develops fever, or feels unwell - go to A&E immediately**
  - If develops vomiting, unable to keep fluids down - seek urgent help
  - If pain spreads or becomes generalised - seek urgent help
- **Follow-up:**
  - Urgent review to assess and examine
  - May need hospital referral if surgical cause suspected


**Important:** Severe acute abdominal pain cannot be safely assessed over telephone. Needs urgent face-to-face assessment.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed abdominal pain systematically (site, character, severity, onset)", "Explored associated symptoms comprehensively", "Assessed for red flags (peritonism, systemic symptoms)", "Obtained relevant medical history (IBS, appendicectomy)", "Explored bowel and urinary symptoms", "Assessed menstrual history if relevant", "Explored understanding and concerns", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised need for urgent assessment appropriately", "Considered surgical causes (appendicitis, ovarian cyst, ectopic)", "Planned appropriate urgent review (face-to-face or A&E)", "Provided clear safety-netting advice", "Considered differential diagnosis appropriately", "Addressed pain management if appropriate", "Arranged appropriate urgent follow-up", "Considered hospital referral if needed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for pain and distress", "Used clear, calm language", "Listened actively to concerns", "Addressed anxiety appropriately", "Explained urgency without causing panic", "Maintained professional, caring manner", "Provided reassurance while taking seriously"]}}'
);

-- =====================================================
-- CASE 40: Third-Party - Palliative Care Nurse
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Palliative Care Nurse - Symptom Management',
  'Palliative Care',
  'PC-001',
  'You are a GP. A specialist palliative care nurse, Sister Helen Walsh, has booked a telephone consultation. She is calling about a patient, Mrs. Patricia O''Connor, who is receiving end-of-life care at home. The patient has developed new symptoms that need management.',
  '{"name": "Mrs. Patricia O''Connor", "age": 78, "gender": "Female", "caller": "Sister Helen Walsh (Palliative Care Nurse)"}',
  '{"patient": "Mrs. Patricia O''Connor", "age": 78, "gender": "Female", "caller": "Sister Helen Walsh", "pmh": "Metastatic breast cancer, bone metastases, currently receiving palliative care", "medications": "Morphine sulphate MR 30mg BD, Morphine solution 10mg PRN, Dexamethasone 4mg OD, Omeprazole 20mg OD", "allergies": "No known allergies", "social_summary": "Lives with husband, palliative care team visiting daily", "family_summary": "Husband is main carer"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about Mrs. Patricia O''Connor. I''ve been visiting her daily for palliative care, and she''s developed some new symptoms that I think need addressing. She''s become quite agitated and restless, and I''m concerned about her comfort.",
    "freely_given_history": {
      "presenting_complaint": "Patient with metastatic breast cancer, receiving end-of-life care at home. Over past 2 days, has become increasingly agitated, restless, and confused. Also developed some noisy breathing. Family very distressed.",
      "psychosocial_impact": "Patient distressed, family very upset. Husband finding it difficult to cope.",
      "ice": {
        "ideas": "Thinks it might be terminal agitation or respiratory secretions",
        "concerns": "Worried about patient comfort and family distress",
        "expectations": "Wants medication review and symptom management"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "agitation": "Patient restless, picking at bedclothes, trying to get out of bed. Started 2 days ago, getting worse.",
        "confusion": "Confused, not recognising family at times. Disorientated.",
        "breathing": "Noisy breathing, rattly. Started yesterday. Not distressed by it but family distressed.",
        "pain": "Pain seems controlled with current morphine. Not complaining of pain.",
        "other_symptoms": "Reduced oral intake. Sleeping more but restless when awake.",
        "timing": "Symptoms started 2 days ago, gradual onset"
      },
      "current_medications": {
        "morphine": "Morphine MR 30mg BD, solution 10mg PRN. Using PRN occasionally, not frequently.",
        "dexamethasone": "4mg OD, been on this for 2 weeks",
        "other": "Omeprazole, other medications as prescribed"
      },
      "clinical_context": {
        "prognosis": "Patient in last weeks of life. Prognosis days to weeks.",
        "care_setting": "At home with husband. Palliative care team visiting daily.",
        "family": "Husband very distressed. Family finding symptoms difficult to witness.",
        "patient_wishes": "Patient wanted to die at home. Family supportive of this."
      },
      "pmh": {
        "cancer": "Metastatic breast cancer, diagnosed 2 years ago. Bone metastases.",
        "other_conditions": "No other significant conditions"
      }
    }
  }',
  'PROFESSIONAL but CONCERNED. Speak with empathy. Provide clear clinical details. If doctor addresses symptoms appropriately, show appreciation. May ask about specific medications or dosages.',
  'full',
  720,
  'hard',
  ARRAY['Recognise terminal agitation and respiratory secretions', 'Assess symptom severity', 'Consider medication causes', 'Plan appropriate symptom management', 'Address family distress', 'Coordinate with palliative care team', 'Consider end-of-life medications'],
  '## Model Approach


**Key Priorities:**

1. Recognise terminal agitation and respiratory secretions
2. Assess symptom severity and impact
3. Consider medication causes (opioid toxicity, steroid effects)
4. Plan appropriate symptom management
5. Address family distress
6. Coordinate with palliative care team


**Differential Diagnosis:**

- Terminal agitation (common in end-of-life)
- Respiratory secretions (death rattle)
- Opioid toxicity (less likely given current dose)
- Delirium (terminal delirium)
- Other causes (less likely)


**Management:**

- **Terminal agitation:**
  - Consider midazolam (2.5-5mg SC/IM PRN or continuous)
  - May need regular medication if persistent
  - Review if opioid toxicity contributing (unlikely here)
- **Respiratory secretions:**
  - Consider hyoscine butylbromide (20mg SC/IM PRN or continuous) or hyoscine hydrobromide
  - Positioning (side-lying, head elevated)
  - Reassure family that patient not distressed by noise
- **Family support:**
  - Explain these are common end-of-life symptoms
  - Reassure that patient likely not distressed
  - Provide emotional support
  - Consider additional support for family
- **Coordination:**
  - Discuss plan with palliative care nurse
  - Ensure medications available (may need to prescribe)
  - Regular review
- **Follow-up:**
  - Review daily with palliative care team
  - Adjust medications as needed


**Important:** Terminal agitation and respiratory secretions are common in end-of-life. Need appropriate medications and family support.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed terminal symptoms systematically (agitation, confusion, breathing)", "Explored symptom severity and impact on patient and family", "Reviewed current medications and dosages", "Assessed pain control", "Obtained relevant clinical context (prognosis, care setting)", "Explored family circumstances and distress", "Assessed patient wishes and care preferences", "Explored palliative care nurse concerns thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised terminal agitation appropriately", "Recognised respiratory secretions appropriately", "Planned appropriate medications (midazolam, hyoscine)", "Considered medication causes (opioid toxicity)", "Addressed family distress and provided support", "Coordinated care with palliative care team", "Arranged appropriate medications and review", "Considered end-of-life care principles"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for patient and family", "Used clear, sensitive language", "Listened actively to concerns", "Addressed family distress appropriately", "Explained symptoms and management clearly", "Coordinated care effectively with healthcare team", "Maintained professional, compassionate manner"]}}'
);

-- =====================================================
-- CASE 41: Telephone - Urgent Mental Health Concern
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Urgent Mental Health Concern',
  'Mental Health',
  'MH-002',
  'You are a GP. A 34-year-old man, Mr. James Wilson, has booked an urgent telephone consultation. The receptionist notes he called this morning and sounded distressed.',
  '{"name": "Mr. James Wilson", "age": 34, "gender": "Male"}',
  '{"patient": "Mr. James Wilson", "age": 34, "gender": "Male", "pmh": "Depression, anxiety, previous self-harm 2 years ago", "medications": "Sertraline 100mg OD, Propranolol 40mg BD PRN", "allergies": "No known allergies", "social_summary": "Lives alone, works as software developer, recently made redundant", "family_summary": "Parents live nearby, supportive"}',
  '{
    "opening_statement": "Doctor, I don''t know what to do. I''m really struggling. I feel like I can''t cope anymore. I''ve been having really dark thoughts.",
    "freely_given_history": {
      "presenting_complaint": "Patient with history of depression and anxiety. Recently made redundant. Feeling overwhelmed, having suicidal thoughts. Not made plans but having thoughts.",
      "psychosocial_impact": "Very distressed. Struggling to cope. Isolated.",
      "ice": {
        "ideas": "Knows he needs help but unsure what to do",
        "concerns": "Scared about his thoughts. Worried he might act on them.",
        "expectations": "Wants help and support"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "mood": "Feeling very low, hopeless. Can''t see a way forward.",
        "suicidal_thoughts": "Having thoughts of ''not wanting to be here''. Not made specific plans. No intent at moment but thoughts are persistent.",
        "self_harm": "No current self-harm. Previous self-harm 2 years ago (cutting).",
        "sleep": "Sleeping poorly, waking early. Feeling exhausted.",
        "appetite": "Appetite reduced, not eating much",
        "concentration": "Can''t concentrate, struggling to function",
        "anxiety": "Very anxious, feeling panicky",
        "triggers": "Made redundant 3 weeks ago. Financial worries. Relationship ended 2 months ago.",
        "coping": "Not coping. Isolated. Not seeing friends."
      },
      "risk_assessment": {
        "suicidal_intent": "No current intent, but persistent thoughts",
        "plans": "No specific plans, but thoughts of ''ending it''",
        "means": "Not discussed means",
        "protective_factors": "Parents nearby and supportive. Has pets. Previously engaged with services.",
        "previous_self_harm": "Previous self-harm 2 years ago, required hospital treatment",
        "alcohol_drugs": "Not using alcohol or drugs",
        "support": "Parents supportive but patient not reaching out"
      },
      "medications": {
        "sertraline": "Taking 100mg OD, been on this for 6 months",
        "compliance": "Taking regularly",
        "effectiveness": "Was helping but not now",
        "recent_changes": "No recent changes"
      },
      "pmh": {
        "depression": "Diagnosed 3 years ago. Previous episode 2 years ago with self-harm.",
        "anxiety": "Anxiety disorder, managed with propranolol PRN",
        "other_conditions": "No other conditions"
      },
      "social_hx": {
        "employment": "Recently made redundant 3 weeks ago. Was software developer.",
        "relationships": "Relationship ended 2 months ago",
        "support": "Parents nearby, supportive but patient not reaching out",
        "isolation": "Feeling isolated, not seeing friends"
      }
    }
  }',
  'DISTRESSED and VULNERABLE. Voice shows significant distress. May become emotional. If doctor takes seriously and offers support, show some relief. May be hesitant to engage.',
  'full',
  720,
  'hard',
  ARRAY['Conduct urgent mental health assessment', 'Assess suicide risk systematically', 'Explore protective factors', 'Consider immediate safety', 'Plan appropriate support', 'Consider crisis team involvement', 'Address risk appropriately'],
  '## Model Approach


**Key Priorities:**

1. **URGENT: Conduct suicide risk assessment**
2. Assess mental state and severity
3. Explore protective factors
4. Consider immediate safety
5. Plan appropriate support
6. Consider crisis team or urgent mental health review


**Risk Assessment:**

- **Suicidal thoughts:** Present, persistent, but no current intent or specific plans
- **Previous self-harm:** History of self-harm 2 years ago
- **Protective factors:** Parents supportive, has pets, previously engaged with services
- **Risk level:** Moderate to high risk - needs urgent assessment and support


**Differential Diagnosis:**

- Severe depression with suicidal ideation
- Adjustment disorder with depressed mood (given recent redundancy)
- Mixed anxiety and depression
- Other causes (less likely)


**Management:**

- **URGENT ASSESSMENT:**
  - Cannot safely assess suicide risk over telephone alone
  - Needs urgent face-to-face assessment (same-day)
  - Consider crisis team involvement if available
- **Safety planning:**
  - Discuss safety plan with patient
  - Remove means if accessible
  - Ensure support network aware (with patient consent)
  - Provide crisis numbers (Samaritans, crisis team)
- **Medication review:**
  - Sertraline may need increasing or changing
  - Consider urgent psychiatric review
- **Support:**
  - Arrange urgent mental health review
  - Consider crisis team referral
  - Consider increasing support (counselling, IAPT)
  - Address practical concerns (financial, employment)
- **Follow-up:**
  - Urgent same-day review
  - Regular follow-up
  - Consider mental health team referral


**Important:** Suicidal ideation requires urgent assessment. Cannot be safely managed over telephone alone. Needs face-to-face risk assessment.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Conducted systematic mental health assessment", "Assessed suicide risk comprehensively (thoughts, plans, intent, means)", "Explored protective factors and support network", "Assessed mood, sleep, appetite, concentration", "Obtained relevant mental health history", "Explored triggers and recent stressors", "Assessed medication compliance and effectiveness", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised urgency appropriately", "Arranged urgent face-to-face assessment", "Considered crisis team involvement", "Developed safety plan with patient", "Reviewed medications and considered changes", "Considered mental health team referral", "Addressed practical concerns", "Arranged appropriate urgent follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for distress", "Created safe, non-judgmental environment", "Listened actively and validated concerns", "Addressed suicidal thoughts sensitively", "Explained assessment and support clearly", "Involved patient in safety planning", "Maintained professional, supportive manner"]}}'
);

-- =====================================================
-- CASE 42: Telephone - Test Results Discussion
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Test Results Discussion',
  'General Practice',
  'GP-002',
  'You are a GP. A 52-year-old woman, Mrs. Susan Brown, has booked a telephone consultation to discuss recent blood test results. The receptionist notes she had blood tests done last week.',
  '{"name": "Mrs. Susan Brown", "age": 52, "gender": "Female"}',
  '{"patient": "Mrs. Susan Brown", "age": 52, "gender": "Female", "pmh": "Hypertension, family history of diabetes", "medications": "Ramipril 5mg OD", "allergies": "No known allergies", "social_summary": "Works as teacher, non-smoker, occasional alcohol", "family_summary": "Mother has type 2 diabetes, father had heart attack at 60"}',
  '{
    "opening_statement": "Hello doctor, I had some blood tests done last week and I''m calling to find out the results. I''ve been a bit worried about them.",
    "freely_given_history": {
      "presenting_complaint": "Had routine blood tests last week. Received text to call GP. Anxious about results.",
      "psychosocial_impact": "Worried about what results might show. Family history of diabetes.",
      "ice": {
        "ideas": "Worried it might be diabetes or something serious",
        "concerns": "Scared about results. Unsure what they mean.",
        "expectations": "Wants to know what the results show and what to do"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "reason_for_tests": "Routine check-up. GP suggested blood tests given family history.",
        "symptoms": "No specific symptoms. Feeling generally well.",
        "concerns": "Worried about diabetes given family history",
        "understanding": "Not sure what results mean"
      },
      "test_results": {
        "hba1c": "HbA1c: 48 mmol/mol (normal <42, pre-diabetes 42-47, diabetes ≥48)",
        "glucose": "Fasting glucose: 7.2 mmol/L (elevated)",
        "cholesterol": "Total cholesterol: 6.8 mmol/L (elevated)",
        "other": "Other results normal"
      },
      "pmh": {
        "hypertension": "High blood pressure, well controlled with ramipril",
        "family_history": "Mother has type 2 diabetes, father had heart attack at 60",
        "other_conditions": "No other conditions"
      },
      "lifestyle": {
        "diet": "Diet could be better, eats out frequently",
        "exercise": "Limited exercise, sedentary job",
        "weight": "BMI 28, has gained weight over past few years",
        "smoking": "Non-smoker",
        "alcohol": "Occasional glass of wine"
      }
    }
  }',
  'ANXIOUS but CALM. Voice shows concern. If doctor explains results clearly and provides plan, show some relief but still worried. May ask multiple questions about implications.',
  'full',
  720,
  'medium',
  ARRAY['Explain test results clearly', 'Assess diabetes diagnosis', 'Consider pre-diabetes vs diabetes', 'Discuss lifestyle modifications', 'Plan appropriate management', 'Address concerns appropriately', 'Provide clear follow-up'],
  '## Model Approach


**Key Priorities:**

1. Explain test results clearly
2. Assess diabetes diagnosis (HbA1c 48 = diabetes)
3. Discuss implications
4. Plan appropriate management
5. Address concerns
6. Provide clear follow-up


**Test Results Interpretation:**

- **HbA1c: 48 mmol/mol** = Diabetes (threshold is 48)
- **Fasting glucose: 7.2 mmol/L** = Elevated, consistent with diabetes
- **Cholesterol: 6.8 mmol/L** = Elevated, needs addressing
- **Diagnosis: Type 2 diabetes** (newly diagnosed)


**Management:**

- **Diagnosis:**
  - Explain that results indicate type 2 diabetes
  - HbA1c of 48 is at the threshold for diabetes
  - Fasting glucose also elevated
  - This is a new diagnosis
- **Initial management:**
  - Lifestyle modifications (diet, exercise, weight loss)
  - Diabetes education and support
  - Consider metformin if appropriate
  - Address cardiovascular risk (cholesterol, blood pressure)
- **Investigations:**
  - Check for complications (retinal screening, foot check, urine for protein)
  - Monitor blood glucose
- **Follow-up:**
  - Arrange face-to-face consultation to discuss in detail
  - Diabetes review appointment
  - Consider diabetes education programme
  - Regular monitoring


**Important:** New diagnosis of diabetes needs careful explanation, support, and comprehensive management plan.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explained test results clearly", "Interpreted HbA1c and glucose results appropriately", "Assessed diabetes diagnosis correctly", "Obtained relevant medical history", "Explored lifestyle factors", "Assessed cardiovascular risk factors", "Explored understanding and concerns", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Diagnosed type 2 diabetes appropriately", "Planned lifestyle modifications", "Considered medication (metformin) if appropriate", "Addressed cardiovascular risk (cholesterol, BP)", "Planned appropriate investigations", "Arranged diabetes education and support", "Arranged appropriate follow-up", "Considered complication screening"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for concerns", "Used clear, non-jargon language", "Explained diagnosis sensitively", "Listened actively to worries", "Addressed concerns about diabetes appropriately", "Explained management plan clearly", "Maintained professional, supportive manner"]}}'
);

-- =====================================================
-- CASE 43: Third-Party - Care Home Manager
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Care Home Manager - Resident Concerns',
  'Geriatrics',
  'GER-003',
  'You are a GP. A care home manager, Ms. Karen Thompson, has booked a telephone consultation. She is calling about a resident, Mr. Arthur Davies, who has developed new symptoms that concern the care home staff.',
  '{"name": "Mr. Arthur Davies", "age": 89, "gender": "Male", "caller": "Ms. Karen Thompson (Care Home Manager)"}',
  '{"patient": "Mr. Arthur Davies", "age": 89, "gender": "Male", "caller": "Ms. Karen Thompson", "pmh": "Dementia, hypertension, previous stroke 3 years ago", "medications": "Ramipril 2.5mg OD, Donepezil 5mg OD, Aspirin 75mg OD", "allergies": "No known allergies", "social_summary": "Lives in care home, no family nearby", "family_summary": "Nephew visits monthly"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about Mr. Arthur Davies, one of our residents. He''s been unwell over the past 24 hours and I''m concerned he might need a medical review. He''s become quite confused and not himself.",
    "freely_given_history": {
      "presenting_complaint": "Resident with dementia, baseline confusion. Over past 24 hours, has become significantly more confused, agitated, and not eating. Staff concerned about infection or other cause.",
      "psychosocial_impact": "Resident distressed, staff concerned. Family not immediately available.",
      "ice": {
        "ideas": "Thinks it might be a UTI or infection",
        "concerns": "Worried about resident''s wellbeing and whether needs medical attention",
        "expectations": "Wants medical review and advice"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "confusion": "Baseline confusion due to dementia, but significantly worse over past 24 hours. More agitated, not recognising staff.",
        "behaviour": "Agitated, restless. Picking at things. Not settling.",
        "appetite": "Not eating. Refusing food and drinks.",
        "mobility": "Usually mobile with frame, but now not wanting to get up.",
        "sleep": "Not sleeping well, restless at night",
        "other_symptoms": "Staff noticed he seems ''not right''. May have been incontinent more than usual.",
        "timing": "Started yesterday morning, gradual onset"
      },
      "baseline": {
        "usual_state": "Baseline confusion due to dementia, but usually settled and cooperative",
        "mobility": "Usually mobile with frame, independent in care home",
        "cognition": "Baseline mild-moderate dementia, but usually recognises staff",
        "appetite": "Usually good appetite"
      },
      "pmh": {
        "dementia": "Diagnosed 2 years ago, mild-moderate",
        "stroke": "Previous stroke 3 years ago, left residual weakness",
        "hypertension": "Well controlled",
        "other_conditions": "No other significant conditions"
      },
      "medications": {
        "current": "Ramipril, Donepezil, Aspirin - all taken regularly",
        "recent_changes": "No recent changes"
      },
      "care_setting": {
        "care_home": "Lives in residential care home",
        "family": "Nephew visits monthly, not immediately available",
        "staff": "Care home staff providing care, concerned about changes"
      }
    }
  }',
  'PROFESSIONAL but CONCERNED. Speak clearly and provide clinical details. If doctor arranges review, show appreciation. May ask about whether resident needs to go to hospital.',
  'full',
  720,
  'medium',
  ARRAY['Recognise delirium in dementia patient', 'Assess for infection (UTI common)', 'Consider differential diagnosis', 'Plan appropriate assessment', 'Coordinate with care home', 'Consider capacity and best interests', 'Address staff concerns'],
  '## Model Approach


**Key Priorities:**

1. Recognise acute confusion (delirium) in dementia patient
2. Assess for common causes (UTI, infection, medication)
3. Consider differential diagnosis
4. Plan appropriate assessment
5. Coordinate with care home
6. Consider capacity and best interests


**Differential Diagnosis:**

- **Delirium (most likely)** - acute confusion on background of dementia
  - Common causes: UTI, other infection, medication, constipation
- Worsening dementia (less likely given acute onset)
- Other causes (less likely)


**Management:**

- **Assessment:**
  - Arrange urgent face-to-face review (may need to visit care home or arrange urgent appointment)
  - Assess for infection (check temperature, examine if possible)
  - Urine dipstick/MSU (UTI very common cause of delirium in elderly)
  - Consider other investigations (bloods, chest if indicated)
- **Treatment:**
  - If UTI suspected: Start antibiotics (guided by culture)
  - Address other causes if found
  - Review medications
- **Supportive care:**
  - Ensure adequate hydration
  - Monitor closely
  - Consider if hospital admission needed (usually not if can manage in care home)
- **Coordination:**
  - Discuss plan with care home manager
  - Ensure clear communication
  - Regular review
- **Follow-up:**
  - Review within 24-48 hours
  - Monitor response to treatment


**Important:** Acute confusion in dementia patient is usually delirium. UTI is very common cause. Needs urgent assessment.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed acute confusion systematically", "Compared to baseline dementia state", "Explored for signs of infection (UTI, other)", "Assessed behaviour and functional changes", "Obtained relevant medical history", "Explored medication changes", "Assessed care setting and support", "Explored care home manager concerns thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised delirium appropriately", "Considered common causes (UTI, infection)", "Arranged appropriate urgent assessment", "Planned investigations (urine, bloods if needed)", "Considered antibiotic treatment if UTI", "Coordinated care with care home", "Arranged appropriate follow-up", "Considered hospital admission if needed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated respect for care home staff", "Used clear, professional language", "Listened actively to concerns", "Explained assessment and plan clearly", "Coordinated care effectively", "Maintained professional, collaborative manner", "Addressed staff concerns appropriately"]}}'
);

-- =====================================================
-- CASE 44: Telephone - Sick Child (Parent Calling)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Sick Child - Parent Call',
  'Paediatrics',
  'PAED-002',
  'You are a GP. A father, Mr. Tom Reeves, has booked a telephone consultation about his 3-year-old daughter, Molly. The receptionist notes he called this morning concerned about fever and rash.',
  '{"name": "Molly Reeves", "age": 3, "gender": "Female", "caller": "Mr. Tom Reeves (father)"}',
  '{"patient": "Molly Reeves", "age": 3, "gender": "Female", "caller": "Mr. Tom Reeves", "pmh": "Generally healthy, no known allergies", "medications": "None", "allergies": "No known allergies", "social_summary": "Lives with both parents, attends nursery", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about my daughter Molly. She''s been poorly for a couple of days with a temperature and now she''s got a rash. I''m worried it might be something serious like meningitis.",
    "freely_given_history": {
      "presenting_complaint": "3-year-old with fever for 2 days, developed rash today. Father worried about meningitis.",
      "psychosocial_impact": "Father anxious. Wants to know if child needs to be seen urgently.",
      "ice": {
        "ideas": "Worried about meningitis",
        "concerns": "Rash and fever - scared it could be serious",
        "expectations": "Wants to know if child needs to go to hospital"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "fever": "Temperature up to 39 for 2 days. Comes down with Calpol. Not responding poorly to Calpol.",
        "rash": "Started this morning. Pink spots, started on trunk, spreading. Not itchy. Doesn''t fade when glass pressed (father tried).",
        "diet": "Drinking less than usual but taking some fluids. Eating less.",
        "wet_nappies": "Fewer wet nappies than usual but still passing urine",
        "activity": "More lethargic than usual, but interactive when fever down",
        "other_symptoms": "No stiff neck. No headache (can''t fully assess). No photophobia. Had runny nose 3 days ago.",
        "contacts": "Other children at nursery have had colds"
      },
      "red_flags": {
        "non_blanching_rash": "Father says rash doesn''t fade with glass test - needs clarification",
        "neck_stiffness": "No",
        "consciousness": "Fully conscious, responsive"
      }
    }
  }',
  'ANXIOUS parent. Voice shows worry. If doctor assesses systematically and gives clear safety-netting, show some relief. May need reassurance about meningitis.',
  'full',
  720,
  'medium',
  ARRAY['Assess sick child systematically', 'Clarify rash characteristics (blanching vs non-blanching)', 'Consider differential (viral vs meningococcal)', 'Provide clear safety-netting', 'Decide on urgent assessment if needed', 'Address parental anxiety'],
  '## Model Approach

**Key Priorities:**
1. Systematic paediatric history (fever, rash, fluid intake, activity)
2. **Critical: Clarify rash** – blanching (viral) vs non-blanching (meningococcal – emergency)
3. Assess for red flags (neck stiffness, reduced consciousness, non-blanching rash)
4. Safety-netting and when to seek urgent help
5. Plan: reassure if viral likely vs same-day/urgent if uncertain

**Differential:** Viral rash (e.g. viral exanthem), scarlet fever, meningococcal septicaemia (exclude)

**Management:** If non-blanching rash or red flags – advise 999/urgent assessment. If blanching rash, well child – safety-netting and review if worsening.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic paediatric history (fever, rash, fluids, activity)", "Clarified rash characteristics including blanching test", "Assessed for red flags (neck stiffness, consciousness)", "Explored fluid intake and urine output", "Assessed recent viral symptoms and contacts", "Explored parental concerns and understanding", "Explored ICE thoroughly"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered meningococcal disease and when to escalate", "Differentiated viral vs serious cause appropriately", "Provided clear safety-netting advice", "Decided on urgent assessment vs safety-netting", "Addressed parental anxiety appropriately", "Arranged appropriate follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for parental worry", "Used clear, calm language", "Listened to concerns", "Explained assessment and plan clearly", "Maintained professional, reassuring manner"]}}'
);

-- =====================================================
-- CASE 45: Telephone - Prescription Request
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Prescription Request',
  'General Practice',
  'GP-003',
  'You are a GP. A 61-year-old man, Mr. Peter Grant, has booked a telephone consultation. He is calling to request a repeat prescription for his blood pressure medication. He has run out and is away visiting family.',
  '{"name": "Mr. Peter Grant", "age": 61, "gender": "Male"}',
  '{"patient": "Mr. Peter Grant", "age": 61, "gender": "Male", "pmh": "Hypertension, atrial fibrillation", "medications": "Ramipril 10mg OD, Apixaban 5mg BD, Bisoprolol 2.5mg OD", "allergies": "No known allergies", "social_summary": "Retired, currently staying with daughter 100 miles away", "family_summary": "Daughter lives away"}',
  '{
    "opening_statement": "Hello doctor, I''ve run out of my blood pressure tablets and my blood thinner. I''m at my daughter''s for two more weeks and I didn''t bring enough. Can I get a prescription to collect from a pharmacy near her?",
    "freely_given_history": {
      "presenting_complaint": "Request for repeat prescription while away from home. Needs Ramipril and Apixaban.",
      "psychosocial_impact": "Anxious about running out. Knows he shouldn''t stop Apixaban.",
      "ice": {
        "ideas": "Expects prescription can be sent or he can collect elsewhere",
        "concerns": "Worried about missing doses",
        "expectations": "Wants prescription to collect locally"
      }
    },
    "history_on_direct_questioning": {
      "medications": {
        "ramipril": "10mg OD, run out 2 days ago",
        "apixaban": "5mg BD, has 3 days left",
        "bisoprolol": "Has 1 week left",
        "compliance": "Usually takes all regularly"
      },
      "location": {
        "where": "Staying with daughter, 100 miles from home",
        "duration": "Two more weeks",
        "pharmacy": "Can get to local pharmacy near daughter"
      },
      "pmh": {
        "hypertension": "Well controlled",
        "af": "Atrial fibrillation, on apixaban for stroke prevention",
        "other": "No other conditions"
      }
    }
  }',
  'CALM but keen to resolve. If doctor arranges prescription (e.g. EPS to nominated pharmacy or paper for different area), show gratitude. May ask about temporary supply.',
  'full',
  720,
  'easy',
  ARRAY['Verify identity and medication list', 'Consider urgency (apixaban)', 'Arrange prescription (EPS/paper/away pharmacy)', 'Advise on temporary supply if needed', 'Safety-netting about not missing anticoagulant'],
  '## Model Approach

**Key Priorities:**
1. Verify patient identity and correct medications/doses
2. Recognise importance of not missing anticoagulant (apixaban)
3. Arrange prescription: EPS to nominated pharmacy (if patient can nominate one near daughter), or paper prescription to collect, or advise registering temporarily at practice near daughter
4. If delay: advise temporary supply from local pharmacy (emergency supply) or same-day prescription
5. Safety-netting: do not stop apixaban; collect prescription as soon as possible

**Management:** Issue prescription (electronically or paper) for collection at pharmacy near daughter; or advise emergency supply from local pharmacy while arranging prescription. Ensure follow-up and repeat arrangements when back home.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Verified patient identity", "Confirmed current medications and doses", "Established location and duration away", "Explored how to get prescription (pharmacy access)", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised urgency of anticoagulant continuity", "Arranged prescription (EPS/paper/away pharmacy) appropriately", "Considered emergency supply if needed", "Advised on not missing doses", "Arranged follow-up/repeats"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Clear communication", "Listened to patient needs", "Professional manner"]}}'
);

-- =====================================================
-- CASE 46: Third-Party - Health Visitor
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Health Visitor - Infant Feeding',
  'Paediatrics',
  'PAED-003',
  'You are a GP. A health visitor, Ms. Rachel Green, has booked a telephone consultation. She is calling about a 6-week-old baby, Leo Patel, whose mother is struggling with breastfeeding and low mood. The health visitor is concerned about both infant feeding and maternal wellbeing.',
  '{"name": "Leo Patel", "age": 0, "gender": "Male", "caller": "Ms. Rachel Green (Health Visitor)"}',
  '{"patient": "Leo Patel", "age": 6, "gender": "Male", "caller": "Ms. Rachel Green", "parent": "Mrs. Priya Patel", "pmh": "Full-term delivery, no neonatal concerns", "medications": "None", "allergies": "None", "social_summary": "First baby, mother struggling", "family_summary": "Father supportive, mother tearful at visits"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about Leo Patel, a 6-week-old I''m seeing with the health visiting team. Mum is really struggling with feeding and we''re worried about her mood. She seems very low and we''re concerned about baby''s weight gain.",
    "freely_given_history": {
      "presenting_complaint": "6-week-old with feeding concerns; mother with low mood. Health visitor seeking GP involvement for feeding support and possible maternal mental health.",
      "psychosocial_impact": "Mother distressed; health visitor concerned about bonding and safety.",
      "ice": {
        "ideas": "Feels both baby and mother need support",
        "concerns": "Worried about failure to thrive and postnatal depression",
        "expectations": "Wants GP to see mother and baby, consider feeding plan and maternal mental health"
      }
    },
    "history_on_direct_questioning": {
      "feeding": {
        "breastfeeding": "Mixed feeding, mother wants to breastfeed but finding it very difficult",
        "weight": "Weight gain slow, below 9th centile on last check",
        "output": "Wet and dirty nappies adequate but not generous",
        "latch": "Latch reported as painful, baby sometimes sleepy at breast"
      },
      "mother": {
        "mood": "Tearful at visits, low mood, exhausted",
        "sleep": "Very broken sleep",
        "support": "Husband supportive but mother isolated",
        "bonding": "Health visitor concerned bonding may be affected"
      },
      "baby": {
        "health": "Otherwise well, no jaundice, no illness",
        "examination": "No concerns from health visitor examination"
      }
    }
  }',
  'PROFESSIONAL and CONCERNED. Provide clear observations. If doctor agrees to see family and coordinate with HV, show appreciation.',
  'full',
  720,
  'medium',
  ARRAY['Consider infant feeding and weight gain', 'Consider maternal mental health', 'Coordinate with health visitor', 'Plan feeding support and possible formula', 'Consider postnatal depression assessment', 'Safeguarding and bonding'],
  '## Model Approach

**Key Priorities:**
1. Take history from health visitor (feeding, weight, maternal mood)
2. Consider slow weight gain causes (feeding technique, supply, maternal mental health)
3. Consider postnatal depression and impact on feeding and bonding
4. Plan: see mother and baby (face-to-face), feeding plan (breastfeeding support vs formula), maternal mental health assessment (e.g. Whooley, referral if needed)
5. Coordinate with health visitor and agree follow-up

**Management:** Arrange face-to-face with mother and baby; feeding support (e.g. lactation referral or formula if indicated); assess maternal mood and refer/support as needed; regular weight checks; document and share plan with health visitor.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took feeding and weight history from HV", "Assessed maternal mood and support", "Explored baby health and examination findings", "Explored HV concerns and ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Planned face-to-face assessment", "Considered feeding support and formula", "Considered maternal mental health assessment", "Coordinated with health visitor", "Arranged follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Respected HV role", "Clear communication", "Collaborative approach"]}}'
);

-- =====================================================
-- CASE 47: Telephone - Breathlessness
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Breathlessness',
  'Respiratory',
  'RESP-002',
  'You are a GP. A 68-year-old man, Mr. Frank Norris, has booked a telephone consultation. He has had increasing breathlessness over the past week and wants advice. He has a history of COPD.',
  '{"name": "Mr. Frank Norris", "age": 68, "gender": "Male"}',
  '{"patient": "Mr. Frank Norris", "age": 68, "gender": "Male", "pmh": "COPD (moderate), IHD", "medications": "Tiotropium 18mcg OD, Salbutamol PRN, Aspirin 75mg OD", "allergies": "No known allergies", "social_summary": "Ex-smoker (stopped 2 years ago), lives with wife", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Doctor, I''m getting more short of breath. I''ve got COPD and I''ve been worse this last week. I''m using my blue inhaler more and I''m worried I might need something else or need to go in.",
    "freely_given_history": {
      "presenting_complaint": "Worsening breathlessness over 1 week. Using salbutamol more. No fever, no major sputum change.",
      "psychosocial_impact": "Anxious. Limited activity. Wants to know if exacerbation and what to do.",
      "ice": {
        "ideas": "Thinks it might be a chest infection or flare-up",
        "concerns": "Worried about needing hospital",
        "expectations": "Wants treatment and clear plan"
      }
    },
    "history_on_direct_questioning": {
      "breathlessness": {
        "onset": "Gradual over past week",
        "severity": "Short of breath on minimal exertion, worse than baseline",
        "nocturnal": "Waking at night short of breath once or twice"
      },
      "sputum": "Slightly more than usual, same colour (white/clear)",
      "fever": "No fever",
      "inhalers": "Using salbutamol 4–6 times daily (usually 1–2)",
      "other_symptoms": "No pleuritic pain, no leg swelling, no chest pain"
    }
  }',
  'Mildly ANXIOUS. Cooperative. If doctor suggests steroids/antibiotics and safety-netting, show relief.',
  'full',
  720,
  'medium',
  ARRAY['Assess COPD exacerbation', 'Differentiate viral vs bacterial', 'Consider steroids and/or antibiotics', 'Safety-netting and when to escalate', 'Review inhaler technique and maintenance'],
  '## Model Approach

**Key Priorities:**
1. History consistent with COPD exacerbation (increased breathlessness, increased salbutamol use)
2. Assess severity (no red flags: no confusion, no cyanosis, no severe distress – moderate exacerbation possible)
3. Consider steroids (e.g. prednisolone 30mg OD 7–14 days) and antibiotics if purulent sputum or other indicators
4. Safety-netting: worsening breathlessness, inability to speak in sentences, severe distress – 999/A&E
5. Follow-up in 1–2 weeks; consider rescue pack if not already

**Management:** Treat as moderate exacerbation (steroids ± antibiotics per guidelines); ensure rescue pack and clear safety-netting; follow-up.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed breathlessness and exacerbation features", "Explored sputum, fever, inhaler use", "Assessed severity and red flags", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered COPD exacerbation management", "Considered steroids and antibiotics", "Safety-netting and escalation", "Follow-up and rescue pack"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Clear explanation", "Reassurance", "Professional manner"]}}'
);

-- =====================================================
-- CASE 48: Third-Party - Pharmacist
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Pharmacist - Medication Query',
  'General Practice',
  'GP-004',
  'You are a GP. A community pharmacist, Mr. David Lee, has booked a telephone consultation. He is calling about a patient, Mrs. Dorothy Hughes, who has been given a new prescription for methotrexate. The pharmacist has concerns about monitoring and patient understanding.',
  '{"name": "Mrs. Dorothy Hughes", "age": 72, "gender": "Female", "caller": "Mr. David Lee (Pharmacist)"}',
  '{"patient": "Mrs. Dorothy Hughes", "age": 72, "gender": "Female", "caller": "Mr. David Lee", "pmh": "Rheumatoid arthritis", "medications": "Methotrexate 10mg once weekly (new), Folic acid 5mg once weekly", "allergies": "No known allergies", "social_summary": "Lives alone, independent", "family_summary": "Daughter nearby"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about Mrs. Dorothy Hughes. She''s just brought in a new prescription for methotrexate from your practice. I want to check she''s had the right blood tests and that she understands how to take it – weekly, and to avoid trimethoprim. I''m also not sure if she''s on a DMARD monitoring scheme.",
    "freely_given_history": {
      "presenting_complaint": "New methotrexate prescription; pharmacist checking monitoring and counselling.",
      "psychosocial_impact": "Pharmacist wants to ensure safe prescribing.",
      "ice": {
        "ideas": "Wants to confirm monitoring and counselling are in place",
        "concerns": "Liability and patient safety",
        "expectations": "Confirmation of monitoring and any missing tests"
      }
    },
    "history_on_direct_questioning": {
      "monitoring": {
        "baseline_lft_fbc": "Pharmacist unsure if done",
        "monitoring_plan": "Unclear if practice has DMARD monitoring",
        "patient_counselling": "Patient unsure about alcohol, trimethoprim, and when to take folic acid"
      },
      "prescription": {
        "dose": "Methotrexate 10mg once weekly",
        "folic_acid": "Folic acid 5mg once weekly (day after methotrexate?)"
      }
    }
  }',
  'PROFESSIONAL and COLLABORATIVE. If GP confirms monitoring and counselling plan, satisfied.',
  'full',
  720,
  'easy',
  ARRAY['Confirm methotrexate monitoring (baseline FBC, LFT, renal)', 'DMARD monitoring scheme', 'Patient counselling (weekly dose, alcohol, trimethoprim)', 'Safety-netting'],
  '## Model Approach

**Key Priorities:**
1. Confirm baseline FBC, LFT, U&E (and possibly chest X-ray per local protocol) before or at start
2. Confirm ongoing monitoring (e.g. 2-weekly then 12-weekly FBC/LFT)
3. Confirm patient counselling: once weekly (same day), folic acid day after; avoid trimethoprim; limit alcohol; report fever/sore throat/mouth ulcers
4. Thank pharmacist for checking; document and ensure monitoring in place

**Management:** Confirm monitoring plan; ensure patient has been counselled (or arrange); document; consider DMARD monitoring scheme.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Clarified prescription and monitoring from pharmacist", "Explored what patient has been told", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Confirmed/arranged baseline and ongoing monitoring", "Confirmed counselling points", "Documented and coordinated with pharmacist"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Respected pharmacist role", "Clear communication", "Collaborative"]}}'
);

-- =====================================================
-- CASE 49: Telephone - Headache
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Headache',
  'Neurology',
  'NEUR-001',
  'You are a GP. A 44-year-old woman, Ms. Claire Dixon, has booked a telephone consultation. She has had a severe headache for 3 days and is worried it might be something serious. She has a history of migraines.',
  '{"name": "Ms. Claire Dixon", "age": 44, "gender": "Female"}',
  '{"patient": "Ms. Claire Dixon", "age": 44, "gender": "Female", "pmh": "Migraine", "medications": "Sumatriptan PRN, Paracetamol", "allergies": "No known allergies", "social_summary": "Works full-time, non-smoker", "family_summary": "Mother has migraines"}',
  '{
    "opening_statement": "Doctor, I''ve had a really bad headache for three days. It''s different from my usual migraines – it''s not going away with my usual tablets and I''m worried there might be something wrong like a clot or tumour.",
    "freely_given_history": {
      "presenting_complaint": "Severe headache 3 days. Different from usual migraine. Not fully responsive to usual treatment.",
      "psychosocial_impact": "Anxious. Off work. Wants reassurance or investigation.",
      "ice": {
        "ideas": "Worried about serious cause",
        "concerns": "Brain tumour, clot",
        "expectations": "Wants scan or reassurance"
      }
    },
    "history_on_direct_questioning": {
      "headache": {
        "site": "Bilateral, frontal and temporal",
        "character": "Throbbing, constant",
        "severity": "8/10",
        "onset": "Started 3 days ago, gradual",
        "associated": "Nausea, some photophobia. No vomiting. No neck stiffness. No fever. No limb weakness. No visual change."
      },
      "red_flags": "No sudden onset thunderclap; no focal neurology; no papilloedema (not examined); no fever/neck stiffness"
    }
  }',
  'ANXIOUS. If doctor takes history seriously and explains plan (e.g. consider migraine variant vs need for examination/imaging), show some relief.',
  'full',
  720,
  'medium',
  ARRAY['Take headache history', 'Screen for red flags', 'Differentiate migraine vs new pathology', 'Plan examination and/or imaging if needed', 'Safety-netting'],
  '## Model Approach

**Key Priorities:**
1. Systematic headache history and red-flag screen (thunderclap, focal neurology, fever/neck stiffness, papilloedema, onset >50, progressive)
2. This sounds like prolonged migraine-type headache but different from her usual – cannot fully exclude serious cause by phone
3. Plan: face-to-face examination (including fundoscopy if possible, neurology); if red flags or persistent concern, consider imaging/referral
4. Safety-netting: sudden worsening, focal signs, vomiting, confusion – urgent assessment

**Management:** Arrange face-to-face; examine; treat as migraine if no red flags; consider imaging if indicated.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took headache history", "Screened for red flags", "Explored difference from usual migraines", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Planned face-to-face examination", "Considered imaging/referral if red flags", "Safety-netting", "Treatment plan"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Empathy", "Clear explanation", "Reassurance"]}}'
);

-- =====================================================
-- CASE 50: Third-Party - NOK (Spouse, Capacity)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'NOK - Spouse Capacity Concern',
  'Geriatrics',
  'GER-004',
  'You are a GP. A husband, Mr. John Wright, has booked a telephone consultation. He is calling about his wife, Mrs. Margaret Wright, who has had a fall and is refusing to go to hospital. He is worried about her capacity and safety at home.',
  '{"name": "Mrs. Margaret Wright", "age": 82, "gender": "Female", "caller": "Mr. John Wright (husband)"}',
  '{"patient": "Mrs. Margaret Wright", "age": 82, "gender": "Female", "caller": "Mr. John Wright", "pmh": "Dementia (early), osteoporosis, hypertension", "medications": "Donepezil 5mg OD, Ramipril 5mg OD, Calcium/Vit D", "allergies": "No known allergies", "social_summary": "Lives with husband, he is main carer", "family_summary": "Two sons, not local"}',
  '{
    "opening_statement": "Doctor, my wife had a fall this morning. She says she''s fine and won''t go to hospital, but she hit her head and she''s confused. I don''t know if she has the capacity to refuse. I''m really worried.",
    "freely_given_history": {
      "presenting_complaint": "Wife fell, hit head, refusing hospital. Husband concerned about capacity and head injury.",
      "psychosocial_impact": "Husband distressed. Conflict between respecting wife''s wishes and keeping her safe.",
      "ice": {
        "ideas": "Thinks she might need to go to hospital",
        "concerns": "Capacity, head injury, safety",
        "expectations": "Wants GP advice on what to do"
      }
    },
    "history_on_direct_questioning": {
      "fall": {
        "mechanism": "Fell in kitchen, may have tripped",
        "head_strike": "Yes, hit head on cupboard",
        "loc": "No loss of consciousness",
        "current_state": "Alert but confused, more than usual (has dementia)"
      },
      "wife_wishes": "Refusing to go to hospital. Says she is fine.",
      "capacity": "Husband unsure if she understands risk of head injury"
    }
  }',
  'DISTRESSED and TORN. Wants to do right by wife but worried. If doctor explains capacity and options (assessment, best interests), show some relief.',
  'full',
  720,
  'hard',
  ARRAY['Assess head injury and fall', 'Consider capacity to refuse treatment', 'Balance autonomy and safety', 'Best interests if lack of capacity', 'Coordinate with ambulance/ED if needed'],
  '## Model Approach

**Key Priorities:**
1. Fall and head injury: assess mechanism, LOC, current confusion (may need head injury guidance – high risk if confusion, head strike)
2. Capacity: assess whether wife can understand, retain, weigh, communicate decision to refuse hospital (may need face-to-face)
3. If lacks capacity: act in best interests; consider emergency services if high-risk head injury
4. If has capacity: respect refusal but ensure she has information; document; safety-netting
5. Support husband; consider urgent visit or paramedic assessment

**Management:** Urgent assessment (visit or paramedic) to assess injury and capacity; if high-risk head injury and lack of capacity, consider best-interest decision for hospital assessment.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed fall and head injury", "Explored current mental state", "Explored wife''s wishes and understanding", "Explored husband''s concerns and ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered capacity assessment", "Considered head injury guidance and referral", "Balanced autonomy and best interests", "Coordinated urgent assessment"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Empathy for husband", "Clear explanation of capacity", "Supportive"]}}'
);

-- =====================================================
-- CASE 51: Telephone - Follow-up After Discharge
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Follow-up After Discharge',
  'General Practice',
  'GP-005',
  'You are a GP. A 71-year-old woman, Mrs. Irene Shaw, has booked a telephone consultation for follow-up after being discharged from hospital 5 days ago with a PE. She has questions about her new medication and when she can drive.',
  '{"name": "Mrs. Irene Shaw", "age": 71, "gender": "Female"}',
  '{"patient": "Mrs. Irene Shaw", "age": 71, "gender": "Female", "pmh": "PE (recent), hypertension", "medications": "Rivaroxaban 15mg BD (2 weeks then 20mg OD), Ramipril 5mg OD", "allergies": "No known allergies", "social_summary": "Lives with husband, drives", "family_summary": "Husband has dementia"}',
  '{
    "opening_statement": "Hello doctor, I was in hospital last week with a clot on my lung. I''ve been sent home with new tablets and I''m not sure how long to take them, and when I can drive again. The hospital said to see my GP.",
    "freely_given_history": {
      "presenting_complaint": "Recent PE, discharged on rivaroxaban. Questions about duration of treatment and driving.",
      "psychosocial_impact": "Anxious. Wants to get back to normal. Cares for husband.",
      "ice": {
        "ideas": "Expects to be on tablets for a while",
        "concerns": "Driving, bleeding risk, duration",
        "expectations": "Clear advice on medication and driving"
      }
    },
    "history_on_direct_questioning": {
      "current_state": "Feeling better, no chest pain, no haemoptysis",
      "medication": "Taking rivaroxaban as prescribed, no bleeding",
      "driving": "Stopped driving since admission, wants to know when safe"
    }
  }',
  'CALM and SEEKING INFORMATION. If doctor explains duration (e.g. 3 months minimum), driving (DVLA guidance – usually when stable), and safety-netting, satisfied.',
  'full',
  720,
  'easy',
  ARRAY['Confirm diagnosis and discharge plan', 'Explain anticoagulation duration', 'DVLA/driving advice', 'Safety-netting (bleeding, recurrence)', 'Follow-up'],
  '## Model Approach

**Key Priorities:**
1. Confirm PE diagnosis and discharge plan (rivaroxaban regimen)
2. Duration: usually at least 3 months for provoked PE; longer if unprovoked or recurrent
3. Driving: DVLA – must not drive for 4 weeks after PE; then can drive if stable and no other restrictions
4. Safety-netting: signs of bleeding, recurrence (chest pain, breathlessness) – seek urgent help
5. Follow-up: ensure anticoagulation review (e.g. haematology/vascular) and repeat imaging if planned

**Management:** Explain duration and driving; safety-netting; arrange follow-up as per hospital plan.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Confirmed discharge diagnosis and medication", "Assessed current symptoms", "Explored understanding and ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained anticoagulation duration", "Gave driving advice", "Safety-netting", "Follow-up plan"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Clear explanation", "Reassurance", "Professional manner"]}}'
);

-- =====================================================
-- CASE 52: Third-Party - School Nurse
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'School Nurse - Asthma Concern',
  'Paediatrics',
  'PAED-004',
  'You are a GP. A school nurse, Mrs. Anita Kumar, has booked a telephone consultation. She is calling about a 10-year-old pupil, Jake Morrison, who has had two episodes of wheezing at school in the past month. She is concerned his asthma may not be well controlled and that the school does not have an up-to-date care plan.',
  '{"name": "Jake Morrison", "age": 10, "gender": "Male", "caller": "Mrs. Anita Kumar (School Nurse)"}',
  '{"patient": "Jake Morrison", "age": 10, "gender": "Male", "caller": "Mrs. Anita Kumar", "pmh": "Asthma", "medications": "Salbutamol PRN, possibly preventer (unclear)", "allergies": "No known allergies", "social_summary": "Lives with mother, attends primary school", "family_summary": "Mother single parent"}',
  '{
    "opening_statement": "Hello doctor, I''m the school nurse at St. Mary''s. I''m calling about Jake Morrison in Year 5. He''s had two episodes of wheezing at school in the last month and used his blue inhaler. I''m not sure if he''s on a preventer or if we have an up-to-date asthma plan for school. Can you advise?",
    "freely_given_history": {
      "presenting_complaint": "Child with asthma, episodes at school; need for review and school care plan.",
      "psychosocial_impact": "School nurse wants to keep child safe and compliant with policy.",
      "ice": {
        "ideas": "Thinks asthma may need review",
        "concerns": "Safety at school, correct treatment",
        "expectations": "Review and updated care plan"
      }
    },
    "history_on_direct_questioning": {
      "episodes": "Two in past month, both relieved by salbutamol",
      "preventer": "School nurse unsure if he has preventer",
      "care_plan": "School has old plan or none"
    }
  }',
  'PROFESSIONAL. If GP agrees to review and provide care plan, satisfied.',
  'full',
  720,
  'easy',
  ARRAY['Clarify current asthma treatment', 'Consider preventer and control', 'Arrange review with parent/child', 'Provide/update school asthma plan'],
  '## Model Approach

**Key Priorities:**
1. Acknowledge call; clarify you will need to check records and possibly speak to parent
2. Plan: review asthma (symptoms, preventer use, adherence); arrange appointment with parent/child; update school asthma plan
3. Ensure school has emergency plan and consent for salbutamol
4. Follow-up with school nurse once plan in place

**Management:** Review asthma; arrange appointment; issue/update school asthma plan; communicate with school nurse.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took history from school nurse", "Clarified episodes and current treatment", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Planned asthma review", "Planned school care plan", "Coordinated with school nurse"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Respected school nurse role", "Clear communication", "Collaborative"]}}'
);

-- =====================================================
-- CASE 53: Telephone - Urinary Symptoms
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Urinary Symptoms',
  'Urology',
  'URO-001',
  'You are a GP. A 55-year-old man, Mr. Ray Cooper, has booked a telephone consultation. He has had pain when passing urine and increased frequency for 3 days. He has had a fever since yesterday.',
  '{"name": "Mr. Ray Cooper", "age": 55, "gender": "Male"}',
  '{"patient": "Mr. Ray Cooper", "age": 55, "gender": "Male", "pmh": "Recurrent UTIs (as per patient), BPH", "medications": "Tamsulosin 400mcg OD", "allergies": "No known allergies", "social_summary": "Lives with wife", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Doctor, I''ve got pain when I pass water and I''m going all the time. I''ve had a temperature since yesterday. I think it''s another water infection – can I have antibiotics?",
    "freely_given_history": {
      "presenting_complaint": "Dysuria, frequency, fever – likely UTI. Patient has had similar before.",
      "psychosocial_impact": "Uncomfortable. Wants antibiotics quickly.",
      "ice": {
        "ideas": "Expects antibiotics",
        "concerns": "Pain and fever",
        "expectations": "Prescription and advice"
      }
    },
    "history_on_direct_questioning": {
      "symptoms": "Dysuria, frequency, fever 24 hours, no loin pain, no rigors",
      "urine": "Cloudy, no visible blood",
      "previous": "Has had UTIs before, usually responds to antibiotics"
    }
  }',
  'COOPERATIVE. Wants quick resolution. If doctor prescribes and gives safety-netting, satisfied.',
  'full',
  720,
  'easy',
  ARRAY['Assess UTI vs pyelonephritis', 'Consider urine culture', 'Appropriate antibiotic (e.g. nitrofurantoin/trimethoprim)', 'Safety-netting'],
  '## Model Approach

**Key Priorities:**
1. History consistent with lower UTI (dysuria, frequency, fever). No red flags for pyelonephritis (no loin pain, no rigors)
2. Consider urine culture (especially if recurrent/resistant)
3. Antibiotic: nitrofurantoin or trimethoprim (check allergies, avoid trimethoprim if on methotrexate); 3–7 days
4. Safety-netting: if fever persists, loin pain, or worsening – seek review
5. Consider BPH and retention if incomplete emptying

**Management:** Prescribe antibiotic; advise fluids; safety-netting; send urine if culture indicated.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed urinary and systemic symptoms", "Differentiated lower vs upper UTI", "Explored previous episodes and ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Appropriate antibiotic choice", "Considered urine culture", "Safety-netting"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Clear advice", "Professional manner"]}}'
);

-- =====================================================
-- CASE 54: Third-Party - Out-of-Hours Doctor
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'OOH Doctor - Handover',
  'General Practice',
  'GP-006',
  'You are a GP. An out-of-hours doctor, Dr. Sarah Mills, has booked a telephone consultation to hand over a patient she saw last night. Mrs. Betty Collins, 79, was seen at home with a fall and possible UTI. She was started on antibiotics and the OOH doctor wants to ensure follow-up and possible frailty review.',
  '{"name": "Mrs. Betty Collins", "age": 79, "gender": "Female", "caller": "Dr. Sarah Mills (OOH Doctor)"}',
  '{"patient": "Mrs. Betty Collins", "age": 79, "gender": "Female", "caller": "Dr. Sarah Mills", "pmh": "Hypertension, osteoarthritis, previous fall", "medications": "Ramipril 5mg OD, Paracetamol 1g QDS", "allergies": "No known allergies", "social_summary": "Lives alone, daughter visits weekly", "family_summary": "Daughter is main contact"}',
  '{
    "opening_statement": "Hi, I''m Dr. Mills from the OOH service. I saw Mrs. Betty Collins at home last night after a fall. She was confused and had a positive dipstick. I''ve started her on nitrofurantoin. I''d like to hand her over for follow-up and wonder if she needs a frailty or falls review.",
    "freely_given_history": {
      "presenting_complaint": "Handover: fall, possible UTI, antibiotics started; request for follow-up and frailty assessment.",
      "psychosocial_impact": "OOH doctor wants continuity and safety.",
      "ice": {
        "ideas": "Expects follow-up and possibly frailty review",
        "concerns": "Patient safety, recurrence",
        "expectations": "Confirmation of follow-up plan"
      }
    },
    "history_on_direct_questioning": {
      "ooh_assessment": "Fall at home, no fracture suspected, confused, dipstick positive, started nitrofurantoin",
      "follow_up": "OOH doctor requests GP follow-up and consideration of frailty/falls review"
    }
  }',
  'PROFESSIONAL. If GP agrees to follow-up and frailty/falls review, satisfied.',
  'full',
  720,
  'easy',
  ARRAY['Accept handover and document', 'Plan follow-up (UTI response)', 'Consider frailty and falls review', 'Coordinate with OOH'],
  '## Model Approach

**Key Priorities:**
1. Accept handover; document OOH assessment and treatment
2. Plan: follow-up in 2–3 days to review UTI and confusion; consider urine culture if not sent
3. Consider frailty assessment and falls review (medication, mobility, home hazards)
4. Consider referral to falls service or community matron if appropriate
5. Ensure daughter/carer aware of plan

**Management:** Document; arrange follow-up; consider frailty/falls review and referral.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Accepted handover details", "Clarified OOH assessment and treatment", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Planned follow-up", "Considered frailty/falls review", "Coordinated with OOH"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Professional handover", "Clear communication", "Collaborative"]}}'
);

-- =====================================================
-- CASE 55: Telephone - Skin Rash (Child)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Skin Rash - Child',
  'Dermatology',
  'DERM-002',
  'You are a GP. A mother, Mrs. Lucy Hart, has booked a telephone consultation about her 4-year-old son, Noah, who has developed a rash. It started on his chest and has spread. He has no fever and is otherwise well.',
  '{"name": "Noah Hart", "age": 4, "gender": "Male", "caller": "Mrs. Lucy Hart (mother)"}',
  '{"patient": "Noah Hart", "age": 4, "gender": "Male", "caller": "Mrs. Lucy Hart", "pmh": "Eczema (mild)", "medications": "Eczema cream when needed", "allergies": "No known allergies", "social_summary": "Lives with parents, attends nursery", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about my son Noah. He''s got a rash on his chest that''s spread to his tummy and back. It''s red and bumpy. He doesn''t have a temperature and he''s fine in himself. I''m not sure if it''s his eczema or something else like chickenpox.",
    "freely_given_history": {
      "presenting_complaint": "Child with rash, no fever, well. Mother unsure if eczema flare or viral/chickenpox.",
      "psychosocial_impact": "Mild concern. Wants diagnosis and advice.",
      "ice": {
        "ideas": "Might be eczema or chickenpox",
        "concerns": "Contagious, need for nursery",
        "expectations": "Advice and whether to be seen"
      }
    },
    "history_on_direct_questioning": {
      "rash": "Red, bumpy, started chest, spread to trunk. Not blistering. Not itchy (or mild).",
      "fever": "No fever",
      "wellbeing": "Eating, drinking, playing normally",
      "contacts": "No known chickenpox contacts",
      "eczema": "Has mild eczema, usually on limbs"
    }
  }',
  'CALM. If doctor explains likely viral rash or eczema and gives safety-netting, satisfied. May ask about nursery.',
  'full',
  720,
  'easy',
  ARRAY['Take rash history', 'Differentiate viral rash vs eczema vs chickenpox', 'Safety-netting', 'Advise on nursery if needed'],
  '## Model Approach

**Key Priorities:**
1. Rash: distribution, morphology (blistering vs papular), fever, wellbeing
2. Likely viral exanthem or eczema flare; chickenpox if vesicular and typical distribution
3. If no fever, well child, no blisters – often viral rash; can advise observation and safety-netting
4. If uncertain or blistering – consider face-to-face or photo
5. Nursery: usually can attend if well and no chickenpox

**Management:** Reassure if viral/eczema; safety-netting; face-to-face or photo if diagnosis unclear.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took rash history", "Assessed fever and wellbeing", "Explored contacts and eczema", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Differentiated rash type", "Safety-netting", "Advice on nursery"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Clear explanation", "Reassurance", "Professional manner"]}}'
);

-- =====================================================
-- CASE 56: Telephone - Request for Sick Note
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Request for Sick Note',
  'General Practice',
  'GP-007',
  'You are a GP. A 38-year-old woman, Ms. Fiona Reid, has booked a telephone consultation. She has been off work for 2 weeks with stress and anxiety and is requesting a fit note. She is not sure how long she will need off.',
  '{"name": "Ms. Fiona Reid", "age": 38, "gender": "Female"}',
  '{"patient": "Ms. Fiona Reid", "age": 38, "gender": "Female", "pmh": "Anxiety", "medications": "Sertraline 50mg OD (started 2 weeks ago)", "allergies": "No known allergies", "social_summary": "Works in retail, single", "family_summary": "Lives alone"}',
  '{
    "opening_statement": "Hello doctor, I''ve been off work for two weeks with stress. I''m on sertraline now. My work want a fit note. I''m not sure how long I need – I don''t feel ready to go back yet.",
    "freely_given_history": {
      "presenting_complaint": "Request for fit note; off work 2 weeks with stress/anxiety; on sertraline; unsure of duration.",
      "psychosocial_impact": "Anxious about work and judgement.",
      "ice": {
        "ideas": "Expects note for at least another week or two",
        "concerns": "Work pressure, being seen as weak",
        "expectations": "Fit note and support"
      }
    },
    "history_on_direct_questioning": {
      "current_state": "Still low mood, anxiety. Sertraline just started.",
      "work": "Retail, finds it stressful",
      "support": "No counselling yet, may want referral"
    }
  }',
  'Mildly ANXIOUS. Wants note without feeling judged. If doctor issues note and discusses support, relieved.',
  'full',
  720,
  'easy',
  ARRAY['Assess fitness for work', 'Issue fit note if appropriate', 'Consider phased return', 'Support (IAPT, counselling)', 'Review'],
  '## Model Approach

**Key Priorities:**
1. Brief assessment of mental health and impact on work
2. If unfit: issue fit note (may be 2 weeks initially; can use "may be fit" with adjustments if appropriate)
3. Discuss phased return and adjustments with patient (and employer if patient agrees)
4. Support: ensure IAPT/counselling in place or offered
5. Review in 2 weeks to reassess

**Management:** Issue fit note; discuss support and review.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed current mental health", "Explored work context and ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Decided on fit note and duration", "Considered phased return", "Offered support and review"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Non-judgmental", "Supportive", "Clear explanation"]}}'
);

-- =====================================================
-- CASE 57: Third-Party - Hospice Nurse
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Hospice Nurse - Medication Review',
  'Palliative Care',
  'PC-002',
  'You are a GP. A hospice nurse, Sister Claire O''Neill, has booked a telephone consultation. She is calling about a patient, Mr. Derek Webb, who is at home on the Liverpool Care Pathway (LCP) and whose family are asking for a review of his syringe driver. They feel he is still in pain.',
  '{"name": "Mr. Derek Webb", "age": 76, "gender": "Male", "caller": "Sister Claire O''Neill (Hospice Nurse)"}',
  '{"patient": "Mr. Derek Webb", "age": 76, "gender": "Male", "caller": "Sister Claire O''Neill", "pmh": "Metastatic prostate cancer", "medications": "Syringe driver: morphine 20mg/24h, midazolam 10mg/24h", "allergies": "No known allergies", "social_summary": "At home with family", "family_summary": "Wife and daughter caring"}',
  '{
    "opening_statement": "Hello doctor, I''m calling about Mr. Derek Webb. He''s on a syringe driver at home and the family feel he''s still in pain – he''s grimacing and restless. Could we review the driver and consider increasing the morphine or adding an anti-inflammatory?",
    "freely_given_history": {
      "presenting_complaint": "End-of-life patient; family report ongoing pain; request to review syringe driver.",
      "psychosocial_impact": "Family distressed; nurse wants to optimise comfort.",
      "ice": {
        "ideas": "Expects dose increase or addition",
        "concerns": "Patient comfort",
        "expectations": "Revised prescription"
      }
    },
    "history_on_direct_questioning": {
      "current_driver": "Morphine 20mg/24h, midazolam 10mg/24h",
      "pain": "Family report grimacing, restlessness",
      "other_symptoms": "No nausea, no agitation otherwise"
    }
  }',
  'PROFESSIONAL. If GP agrees to increase morphine and/or add PRN or dexamethasone, satisfied.',
  'full',
  720,
  'medium',
  ARRAY['Review syringe driver', 'Consider pain vs agitation', 'Increase morphine or add PRN/adjuvant', 'Document and communicate with nurse'],
  '## Model Approach

**Key Priorities:**
1. Accept nurse assessment; consider whether pain or agitation (midazolam may need increase if agitation)
2. If pain: increase morphine in syringe driver (e.g. 50% increase) or add PRN subcutaneous morphine; consider dexamethasone if bone pain
3. If agitation: consider increasing midazolam
4. Document and send prescription/instruction to nurse
5. Safety-netting: ensure family and nurse have contact for further changes

**Management:** Adjust syringe driver (morphine ± midazolam); add PRN or dexamethasone if indicated; document; communicate with nurse.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took history from hospice nurse", "Clarified current driver and symptoms", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Reviewed syringe driver", "Adjusted analgesia/ sedation appropriately", "Documented and coordinated with nurse"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Respected nurse expertise", "Clear communication", "Collaborative"]}}'
);

-- =====================================================
-- CASE 58: Telephone - Allergy Reaction
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Allergy Reaction',
  'Allergy',
  'ALL-001',
  'You are a GP. A 29-year-old woman, Ms. Hannah Brooks, has booked an urgent telephone consultation. She developed a rash and facial swelling an hour ago after eating nuts. She is not sure if she has ever had a reaction before.',
  '{"name": "Ms. Hannah Brooks", "age": 29, "gender": "Female"}',
  '{"patient": "Ms. Hannah Brooks", "age": 29, "gender": "Female", "pmh": "No known allergies previously", "medications": "None", "allergies": "Unknown", "social_summary": "Lives with flatmates", "family_summary": "No significant family history"}',
  '{
    "opening_statement": "Doctor, I ate some nuts about an hour ago and now I''ve got a rash and my face is swollen. I''m a bit itchy. I don''t know if I''m allergic – I''ve never had this before. Should I go to hospital?",
    "freely_given_history": {
      "presenting_complaint": "Possible allergic reaction: rash, facial swelling, itch after nuts. First time.",
      "psychosocial_impact": "Anxious. Unsure of severity.",
      "ice": {
        "ideas": "Might be allergy",
        "concerns": "Severity, anaphylaxis",
        "expectations": "Advice on what to do"
      }
    },
    "history_on_direct_questioning": {
      "symptoms": "Rash (urticarial?), facial swelling, itch. No throat swelling. No breathing difficulty. No dizziness.",
      "severity": "Mild-moderate; no airway/breathing/circulation concern"
    }
  }',
  'ANXIOUS. If doctor advises antihistamine and safety-netting (or 999 if worsening), show relief.',
  'full',
  720,
  'medium',
  ARRAY['Assess severity (anaphylaxis vs mild)', 'Safety-netting (airway, breathing)', 'Antihistamine and when to use 999', 'Allergy follow-up'],
  '## Model Approach

**Key Priorities:**
1. Assess for anaphylaxis: airway, breathing, circulation. If any concern – 999.
2. If mild (rash, swelling, itch only): advise antihistamine (e.g. cetirizine 10mg); observe; avoid nuts; safety-netting: if throat swelling, breathing difficulty, collapse – 999.
3. Consider advising to have antihistamine at home; consider allergy referral for testing and potential adrenaline.
4. Document possible nut allergy.

**Management:** If mild – antihistamine and safety-netting; consider allergy referral; document.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed reaction severity", "Excluded anaphylaxis", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Appropriate advice (antihistamine vs 999)", "Safety-netting", "Allergy follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Calm explanation", "Reassurance", "Professional manner"]}}'
);

-- =====================================================
-- CASE 59: Third-Party - Social Worker (Safeguarding)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Social Worker - Safeguarding',
  'Safeguarding',
  'SG-001',
  'You are a GP. A social worker, Ms. Tina Okonkwo, has booked a telephone consultation. She is calling about a vulnerable adult, Mr. Leonard Fry, 81, who lives alone. She has concerns about self-neglect and possible exploitation by a relative who has moved in. She is asking for a medical view and whether the GP can support a safeguarding referral.',
  '{"name": "Mr. Leonard Fry", "age": 81, "gender": "Male", "caller": "Ms. Tina Okonkwo (Social Worker)"}',
  '{"patient": "Mr. Leonard Fry", "age": 81, "gender": "Male", "caller": "Ms. Tina Okonkwo", "pmh": "Dementia (mild), hypertension", "medications": "Donepezil 5mg OD, Ramipril 5mg OD", "allergies": "No known allergies", "social_summary": "Lives alone, nephew recently moved in", "family_summary": "Nephew is only relative in contact"}',
  '{
    "opening_statement": "Hello doctor, I''m the social worker for Mr. Leonard Fry. I have concerns about self-neglect – he''s lost weight, his house is in a poor state – and his nephew has moved in recently and we''re worried about financial exploitation. I''d like to make a safeguarding referral and would value a medical input on his capacity and health.",
    "freely_given_history": {
      "presenting_complaint": "Safeguarding concern: self-neglect, possible exploitation; request for medical view and support for referral.",
      "psychosocial_impact": "Social worker needs GP input for safeguarding process.",
      "ice": {
        "ideas": "Expects GP to support referral and provide information",
        "concerns": "Patient safety and exploitation",
        "expectations": "Medical information and referral support"
      }
    },
    "history_on_direct_questioning": {
      "concerns": "Self-neglect (weight loss, environment), nephew moved in, financial concerns",
      "capacity": "Social worker unsure of capacity for residence and financial decisions",
      "patient_view": "Patient has not complained; may not see nephew as problem"
    }
  }',
  'PROFESSIONAL. If GP agrees to provide information and support referral, satisfied.',
  'full',
  720,
  'hard',
  ARRAY['Consider confidentiality and consent', 'Capacity assessment', 'Support safeguarding referral', 'Share information appropriately', 'Document'],
  '## Model Approach

**Key Priorities:**
1. **Confidentiality:** Share information with consent where possible; if lack of capacity or vital interest, may share in best interests under safeguarding.
2. **Capacity:** Consider assessment of capacity for relevant decisions (residence, finances).
3. **Safeguarding:** Support referral to adult safeguarding; provide medical information as appropriate (health, capacity, risks).
4. **Document:** Record conversation, consent or best-interest decision, and referral.
5. **Follow-up:** Ensure patient remains on GP radar; consider face-to-face review.

**Management:** Agree to support referral; provide medical information as appropriate; document; consider capacity assessment and review.',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Clarified safeguarding concerns", "Explored capacity and patient view", "Explored ICE"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed confidentiality and consent", "Supported safeguarding referral", "Considered capacity assessment", "Documented appropriately"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Professional collaboration", "Clear communication", "Sensitive to safeguarding"]}}'
);

-- End of telephone and third-party consultation cases (59 cases total; 25 new telephone/third-party cases 35-59)
