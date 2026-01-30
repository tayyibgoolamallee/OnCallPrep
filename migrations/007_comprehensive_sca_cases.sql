-- Comprehensive SCA Cases with Full Actor Scripts
-- Each case includes: category code, doctor stem, actor info, behaviour prompts, marking criteria

-- First, update the schema to support richer case structure
ALTER TABLE sca_cases ADD COLUMN IF NOT EXISTS category VARCHAR(100);
ALTER TABLE sca_cases ADD COLUMN IF NOT EXISTS category_code VARCHAR(20);
ALTER TABLE sca_cases ADD COLUMN IF NOT EXISTS actor_info JSONB;
ALTER TABLE sca_cases ADD COLUMN IF NOT EXISTS actor_behaviour TEXT;
ALTER TABLE sca_cases ADD COLUMN IF NOT EXISTS case_notes JSONB;

-- Clear existing full cases to replace with comprehensive versions
DELETE FROM sca_cases WHERE case_type = 'full';

-- =====================================================
-- CASE 1: CVS-001 - Cardiovascular (Chest Pain)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'CVS-001: Urgent Chest Discomfort',
  'Cardiovascular',
  'CVS-001',
  'You are a GP trainee in a busy practice. A 45-year-old man, Mr. James Mitchell, has been booked in for an urgent appointment. The receptionist notes he called this morning complaining of chest discomfort.

',
  '{"name": "Mr. James Mitchell", "age": 45, "gender": "Male"}',
  '{"patient": "Mr. James Mitchell", "age": 45, "gender": "Male", "pmh": "Hypertension (2 years), High cholesterol", "medications": "Ramipril 5mg OD, Atorvastatin 20mg OD", "allergies": "None known", "social_summary": "Office manager, smoker, moderate alcohol", "family_summary": "Father MI at 55, Mother T2DM"}',
  '{
    "opening_statement": "Doctor, I''ve been having this chest pain since this morning. It''s really worrying me.",
    "freely_given_history": {
      "presenting_complaint": "Central chest pain started 2 hours ago. Describes as tight and heavy feeling. Came on while sitting at his desk at work.",
      "psychosocial_impact": "Very anxious about the pain. Worried it might be his heart. Says he cannot concentrate at work.",
      "ice": {
        "ideas": "Thinks it might be a heart attack like his father had",
        "concerns": "Worried he might die or have permanent damage",
        "expectations": "Wants to know if he needs hospital and expects some tests"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "site": "Central chest, behind sternum",
        "onset": "Started 2 hours ago, came on gradually over 5 minutes",
        "character": "Tight, heavy, crushing sensation",
        "radiation": "Radiates to left arm and jaw",
        "associations": "Mild shortness of breath, feeling nauseous, slight dizziness",
        "timing": "Constant since onset, but severity varies",
        "exacerbating": "Worse with deep breath and movement",
        "severity": "7/10 at worst, now 4/10",
        "relieving": "Slightly better when sitting still"
      },
      "pmh": {
        "hypertension": "Diagnosed 2 years ago, well controlled on Ramipril. Last BP 3 months ago was 138/85",
        "cholesterol": "High cholesterol diagnosed same time. On Atorvastatin. Last check 6 months ago was 5.2",
        "diabetes": "No",
        "previous_heart_disease": "No known heart disease, no previous chest pain episodes",
        "other": "Generally fit and well otherwise"
      },
      "dhx": {
        "regular": "Ramipril 5mg OD, Atorvastatin 20mg OD",
        "otc": "Occasional ibuprofen for headaches (2-3 times per month)",
        "supplements": "None",
        "compliance": "Takes medications regularly, last dose this morning",
        "allergies": "No known drug allergies"
      },
      "social_hx": {
        "occupation": "Office manager, sedentary job, works 9-5 Monday to Friday",
        "living": "Lives in own house with wife and two children (ages 12 and 15)",
        "smoking": "20 cigarettes per day for 25 years (25 pack-years). Tried to quit twice unsuccessfully",
        "alcohol": "15-20 units per week, mostly weekends. No alcohol-related problems",
        "recreational_drugs": "None",
        "diet": "Mostly convenience food due to busy lifestyle",
        "exercise": "Minimal - walks to work (10 minutes) but otherwise sedentary"
      },
      "fhx": {
        "cardiovascular": "Father had MI at age 55",
        "diabetes": "Mother has T2DM (diagnosed age 60)",
        "other": "No other significant family history"
      }
    }
  }',
  'ANXIOUS and WORRIED. Speak quickly and ask multiple questions about whether this is serious. Frequently mention your father''s heart attack. If the doctor seems dismissive, become more insistent. If reassured appropriately, calm down but remain vigilant. Clutch your chest occasionally when describing the pain.',
  'full',
  720,
  'medium',
  ARRAY['Recognise cardiac red flags', 'Take systematic SOCRATES history', 'Assess CV risk factors', 'Address anxiety about father''s MI', 'Appropriate safety-netting', 'Consider urgent referral'],
  '## Model Approach

**Key Priorities:**
1. Establish rapport and address immediate anxiety
2. Systematic chest pain history (SOCRATES)
3. Cardiovascular risk assessment
4. Clear safety-netting and management plan

**Differential Diagnosis:**
- ACS (high suspicion given risk factors)
- Stable angina
- Musculoskeletal
- GORD
- Anxiety

**Management:**
- If ongoing pain: 999, aspirin 300mg
- If settled: Same-day cardiology/ED assessment
- ECG if available
- Clear written safety-net instructions',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established presenting complaint", "Explored SOCRATES systematically", "Asked about associated symptoms", "Obtained PMH including HTN and cholesterol", "Obtained drug history and compliance", "Obtained smoking and alcohol history", "Obtained family history (father''s MI)", "Explored ICE thoroughly", "Assessed cardiovascular risk factors", "Considered examination findings"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered ACS as primary differential", "Considered other causes appropriately", "Recognised high cardiovascular risk", "Made appropriate urgent management plan", "Discussed referral/999 if needed", "Provided clear safety-netting", "Gave written instructions", "Arranged appropriate follow-up", "Considered aspirin", "Documented appropriately"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Demonstrated empathy for anxiety", "Acknowledged fear about father", "Used clear non-jargon language", "Listened actively", "Addressed concerns appropriately", "Explained urgency without causing panic", "Involved patient in decisions", "Maintained calm professional manner"]}}'
);

-- =====================================================
-- CASE 2: RESP-001 - Respiratory (Chronic Cough)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'RESP-001: Persistent Cough',
  'Respiratory',
  'RESP-001',
  'You are a GP trainee. A 58-year-old man, Mr. Brian Thompson, has come to see you about a cough that has been troubling him for several weeks.

',
  '{"name": "Mr. Brian Thompson", "age": 58, "gender": "Male"}',
  '{"patient": "Mr. Brian Thompson", "age": 58, "gender": "Male", "pmh": "Hypertension, Type 2 diabetes", "medications": "Ramipril 10mg OD, Metformin 1g BD", "allergies": "None known", "social_summary": "Non-smoker, retired builder", "family_summary": "Nothing significant"}',
  '{
    "opening_statement": "Doctor, I''ve had this annoying cough for about 3 weeks now. It just won''t go away.",
    "freely_given_history": {
      "presenting_complaint": "Dry, tickly cough for 3 weeks. Worse at night. No sputum production.",
      "psychosocial_impact": "It''s disturbing his sleep and his wife is complaining. Feeling tired during the day.",
      "ice": {
        "ideas": "Wonders if it''s a lingering cold or maybe something more serious",
        "concerns": "Worried it could be lung cancer as he was a builder and exposed to dust",
        "expectations": "Hoping for something to stop the cough, maybe antibiotics"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "onset": "Started about 3 weeks ago, came on gradually",
        "character": "Dry, tickly, non-productive",
        "timing": "Constant but worse at night and when lying down",
        "severity": "Moderate - disturbing sleep",
        "sputum": "None",
        "haemoptysis": "No blood",
        "associated": "No fever, no weight loss, no night sweats, no breathlessness at rest",
        "triggers": "Worse when lying flat, sometimes when talking"
      },
      "pmh": {
        "hypertension": "Diagnosed 5 years ago, on Ramipril. Recently increased dose 6 weeks ago",
        "diabetes": "T2DM for 3 years, well controlled on Metformin, last HbA1c 52",
        "respiratory": "No asthma, no COPD, no previous lung problems",
        "cardiac": "No heart failure symptoms",
        "gord": "Occasional heartburn but nothing significant"
      },
      "dhx": {
        "regular": "Ramipril 10mg OD (increased from 5mg 6 weeks ago), Metformin 1g BD",
        "otc": "Tried over-the-counter cough syrup without benefit",
        "compliance": "Good compliance with all medications",
        "allergies": "None known",
        "recent_changes": "Ramipril dose doubled 6 weeks ago for better BP control"
      },
      "social_hx": {
        "occupation": "Retired builder - 35 years in construction with asbestos exposure possible",
        "living": "Lives with wife in bungalow",
        "smoking": "Never smoked",
        "alcohol": "Occasional - 5-6 units per week",
        "pets": "No pets"
      },
      "fhx": {
        "respiratory": "No family history of lung disease",
        "other": "Father had stroke at 70"
      }
    }
  }',
  'MATTER-OF-FACT but slightly FRUSTRATED. You''ve had this cough for weeks and it''s really annoying. If the doctor doesn''t ask about your medications, don''t volunteer the recent Ramipril increase - only mention it if directly asked about medication changes. Express surprise if ACE inhibitor is mentioned as the cause - you didn''t know this was a side effect.',
  'full',
  720,
  'easy',
  ARRAY['Identify ACE inhibitor cough', 'Link to recent dose increase', 'Exclude red flags', 'Explain medication side effect', 'Plan switch to ARB', 'Safety-net for persistent symptoms'],
  '## Model Approach

**Key Insight:** ACE inhibitor-induced cough
- Timing correlates with recent Ramipril dose increase
- Dry, non-productive cough
- Worse at night (classic)

**Differential:**
1. ACE inhibitor cough (most likely)
2. Post-nasal drip
3. GORD
4. Asthma
5. Lung malignancy (need to exclude given occupational history)

**Management:**
1. Switch Ramipril to ARB (e.g., Losartan 50mg)
2. Cough should improve within 1-4 weeks
3. Safety-net: CXR if cough persists after stopping ACE-i
4. Follow-up to check BP on new medication',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established cough characteristics", "Asked about haemoptysis and red flags", "Asked about weight loss and night sweats", "Identified recent medication change", "Linked timing to Ramipril increase", "Explored occupational history", "Asked about smoking history", "Explored ICE", "Considered differential diagnoses", "Reviewed full medication list"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Identified ACE inhibitor as likely cause", "Planned switch to ARB", "Chose appropriate alternative", "Explained mechanism to patient", "Provided realistic timeline for improvement", "Safety-netted for persistent cough", "Considered CXR if needed", "Planned BP monitoring", "Arranged follow-up", "Documented rationale"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Acknowledged frustration", "Explained side effect clearly", "Reassured about common cause", "Used clear language", "Addressed cancer concern", "Validated occupational worry", "Involved in decision", "Supportive manner"]}}'
);

-- =====================================================
-- CASE 3: WH-001 - Women''s Health (Contraception)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'WH-001: Contraception Review',
  'Women''s Health',
  'WH-001',
  'You are a GP trainee. Mrs. Claire Davies, a 38-year-old woman, has come to request a repeat prescription for her contraceptive pill.

',
  '{"name": "Mrs. Claire Davies", "age": 38, "gender": "Female"}',
  '{"patient": "Mrs. Claire Davies", "age": 38, "gender": "Female", "pmh": "None significant", "medications": "Microgynon 30 (15 years)", "allergies": "None", "social_summary": "Smokes 10-15/day, married", "family_summary": "Mother had DVT"}',
  '{
    "opening_statement": "Hi doctor, I just need my pill please. I''ve been on it for years with no problems.",
    "freely_given_history": {
      "presenting_complaint": "Routine repeat prescription request for combined pill. Has been on Microgynon for 15 years.",
      "psychosocial_impact": "Very happy with current contraception. No desire to change.",
      "ice": {
        "ideas": "Thinks she should just continue as there have been no problems",
        "concerns": "Doesn''t understand why anyone would question her pill",
        "expectations": "Quick appointment to get her prescription"
      }
    },
    "history_on_direct_questioning": {
      "contraception": {
        "current": "Microgynon 30 - on it for 15 years",
        "compliance": "Excellent - rarely misses a pill",
        "side_effects": "None",
        "problems": "None",
        "previous": "Tried Cerazette briefly but had breakthrough bleeding"
      },
      "pmh": {
        "vte": "No personal history of DVT or PE",
        "migraine": "No migraines",
        "cardiovascular": "No hypertension, no heart problems",
        "liver": "No liver disease",
        "breast": "No breast cancer"
      },
      "dhx": {
        "regular": "Microgynon 30 only",
        "otc": "Occasional paracetamol",
        "allergies": "None"
      },
      "social_hx": {
        "smoking": "Smokes 10-15 cigarettes per day for 20 years. No plans to quit - enjoys it.",
        "alcohol": "10-15 units per week",
        "occupation": "Works in retail",
        "relationship": "Married, monogamous relationship"
      },
      "fhx": {
        "vte": "Mother had DVT at age 50 after hip surgery",
        "other": "Father has hypertension"
      },
      "bp": "If asked to check: 128/82",
      "bmi": "If asked: BMI 26"
    }
  }',
  'INITIALLY RELAXED and IMPATIENT - this should be a quick appointment. Become DEFENSIVE and RESISTANT if told you cannot have the pill. Say things like "But I''ve been on it for years with no problems" and "My friend smokes more than me and she''s on the pill." If the doctor explains risks clearly and calmly, gradually become more accepting but express disappointment. Ask about alternatives reluctantly.',
  'full',
  720,
  'intermediate',
  ARRAY['Recognise UKMEC Category 4', 'Age 35+ and smoking = contraindicated', 'Handle difficult conversation', 'Explain VTE risk clearly', 'Offer appropriate alternatives', 'Maintain rapport despite not prescribing'],
  '## Model Approach

**Key Issue:** COCP absolutely contraindicated (UKMEC 4)
- Age 38 + smoking = unacceptable VTE/stroke risk
- Cannot continue regardless of previous tolerance

**Communication Challenge:**
- Patient expects routine prescription
- Need to decline without damaging rapport
- Explain risk without causing panic

**Alternatives to Offer:**
1. Progestogen-only pill (Desogestrel/Cerazette)
2. IUS (Mirena) - excellent option
3. Copper IUD
4. Implant (Nexplanon)
5. Barrier methods

**Management:**
1. Explain cannot continue COCP
2. Discuss VTE risk in clear terms
3. Offer alternatives positively
4. Smoking cessation discussion
5. Bridging contraception if needed',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Confirmed current contraception", "Asked about smoking in detail", "Asked about migraine history", "Checked VTE history", "Obtained family history of VTE", "Checked blood pressure", "Asked about BMI", "Reviewed contraindications systematically", "Explored previous contraception", "Asked about future pregnancy plans"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Correctly identified UKMEC 4", "Did not prescribe COCP", "Explained risk clearly", "Offered appropriate alternatives", "Discussed pros and cons of each", "Considered patient preferences", "Offered smoking cessation", "Provided bridging if needed", "Arranged follow-up", "Documented discussion"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Handled resistance calmly", "Did not become defensive", "Maintained rapport", "Explained without lecturing", "Acknowledged her frustration", "Validated years of no problems", "Presented alternatives positively", "Showed empathy throughout"]}}'
);

-- =====================================================
-- CASE 4: MH-001 - Mental Health (Depression)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'MH-001: Low Mood and Fatigue',
  'Mental Health',
  'MH-001',
  'You are a GP trainee. Mr. David Roberts, a 55-year-old man, has come to see you. The appointment was booked as "feeling tired."

',
  '{"name": "Mr. David Roberts", "age": 55, "gender": "Male"}',
  '{"patient": "Mr. David Roberts", "age": 55, "gender": "Male", "pmh": "Type 2 diabetes, Hypertension", "medications": "Metformin 1g BD, Ramipril 10mg OD", "allergies": "None", "social_summary": "Divorced, lives alone, factory supervisor", "family_summary": "Father had depression"}',
  '{
    "opening_statement": "I just feel so tired all the time, doctor. I don''t know what''s wrong with me.",
    "freely_given_history": {
      "presenting_complaint": "Persistent tiredness for about 3 months. Doesn''t enjoy things like he used to. Work feels like a struggle.",
      "psychosocial_impact": "Struggling at work, not seeing friends, staying in bed at weekends. Feels like a burden.",
      "ice": {
        "ideas": "Thinks maybe it''s his diabetes or something physical",
        "concerns": "Worried he''s becoming like his father who had depression",
        "expectations": "Hoping for some blood tests to find the cause"
      }
    },
    "history_on_direct_questioning": {
      "mood": {
        "low_mood": "Yes - feeling low most days for past 3 months",
        "anhedonia": "Yes - used to enjoy football and pub with friends, now can''t be bothered",
        "tearfulness": "Occasionally - especially at night",
        "irritability": "Yes - more snappy with colleagues",
        "hopelessness": "Sometimes feels like things won''t improve",
        "worthlessness": "Feels like he''s letting everyone down"
      },
      "biological": {
        "sleep": "Early morning waking (4-5am), can''t get back to sleep. Used to sleep well.",
        "appetite": "Reduced - eating less, lost about 4kg in 3 months without trying",
        "energy": "Very low - exhausted by lunchtime",
        "concentration": "Poor - making mistakes at work, forgetting things",
        "libido": "Reduced - not interested"
      },
      "risk": {
        "self_harm": "No thoughts of self-harm",
        "suicidal_ideation": "Has had fleeting thoughts that people would be better off without him, but no plans or intent",
        "protective_factors": "Children (live away but in touch), doesn''t want to upset them"
      },
      "pmh": {
        "diabetes": "T2DM for 5 years, last HbA1c 58 - slightly above target",
        "hypertension": "Well controlled",
        "previous_mental_health": "No previous depression or anxiety diagnosed"
      },
      "dhx": {
        "regular": "Metformin 1g BD, Ramipril 10mg OD",
        "compliance": "Sometimes forgets when feeling really low",
        "allergies": "None"
      },
      "social_hx": {
        "relationship": "Divorced 2 years ago - wife left him for someone else",
        "living": "Lives alone in flat, children (2) live 2 hours away, sees them monthly",
        "work": "Factory supervisor - 30 years at same company, feeling stressed with new management",
        "alcohol": "Increased - now 25-30 units per week (up from 10-15)",
        "smoking": "Ex-smoker, quit 10 years ago",
        "support": "Few friends, doesn''t want to burden children"
      },
      "fhx": {
        "mental_health": "Father had depression, was on medication for years",
        "other": "Mother had T2DM"
      }
    }
  }',
  'SUBDUED and LOW. Speak quietly and slowly. Make poor eye contact. Pause before answering questions as if it''s an effort. If asked about suicidal thoughts, pause and look down before admitting to fleeting thoughts. Become slightly tearful if asked about the divorce. If the doctor is empathetic, open up more. If they seem rushed, become more withdrawn.',
  'full',
  720,
  'medium',
  ARRAY['Recognise depression', 'Conduct suicide risk assessment', 'Explore biological symptoms', 'Identify psychosocial factors', 'Address alcohol use', 'Discuss treatment options sensitively'],
  '## Model Approach

**Diagnosis:** Moderate-severe depression
- Core symptoms: Low mood, anhedonia, fatigue
- Biological symptoms: Early morning waking, weight loss, poor concentration
- Risk factors: Divorce, isolation, FH, increased alcohol

**Risk Assessment (Essential):**
- Passive suicidal ideation present
- No plans or intent
- Protective factors: Children
- Risk: Moderate - needs monitoring

**Management:**
1. Validate his experience
2. Blood tests: TFTs, FBC, HbA1c, U&Es, LFTs
3. Discuss treatment options:
   - Antidepressant (SSRI - sertraline first line)
   - Talking therapy (self-refer to IAPT)
4. Address alcohol - explain worsening effect
5. Safety-netting and follow-up in 1-2 weeks
6. Crisis numbers provided',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored mood symptoms thoroughly", "Asked about anhedonia", "Assessed biological symptoms (sleep, appetite, energy)", "Explored concentration and memory", "Conducted suicide risk assessment sensitively", "Asked about self-harm", "Identified protective factors", "Explored alcohol use", "Asked about divorce and social support", "Explored family history of mental health", "Considered organic causes"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made appropriate assessment of depression", "Quantified severity", "Conducted appropriate risk assessment", "Planned blood tests to exclude organic causes", "Discussed antidepressant options", "Discussed talking therapy", "Addressed increased alcohol use", "Provided crisis numbers", "Arranged early follow-up", "Documented risk clearly"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Created safe space for disclosure", "Demonstrated genuine empathy", "Allowed silences appropriately", "Asked about suicide sensitively", "Normalised help-seeking", "Validated his feelings", "Explained depression without stigma", "Instilled hope appropriately", "Used patient''s own language"]}}'
);

-- =====================================================
-- CASE 5: OLDER-001 - Older Persons (Confusion)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'OLDER-001: Memory Concerns',
  'Older Persons',
  'OLDER-001',
  'You are a GP trainee. Mrs. Patricia Evans, a 78-year-old retired nurse, has come with her daughter who is concerned about her memory. The appointment was booked by the daughter.

',
  '{"name": "Mrs. Patricia Evans", "age": 78, "gender": "Female"}',
  '{"patient": "Mrs. Patricia Evans", "age": 78, "gender": "Female", "pmh": "Hypertension, Osteoarthritis", "medications": "Amlodipine 5mg OD, Paracetamol PRN", "allergies": "Penicillin", "social_summary": "Widowed, lives alone, daughter nearby", "family_summary": "Mother had dementia"}',
  '{
    "opening_statement": "(Patient): I don''t know why I''m here, doctor. My daughter worries too much. (Daughter): Mum, you''ve been forgetting things. I''m really worried.",
    "freely_given_history": {
      "patient_perspective": "Admits to occasionally forgetting things but says everyone does at her age. Feels she''s coping fine.",
      "daughter_perspective": "Mum has been forgetting appointments, asking the same questions repeatedly, left the gas on twice, got lost driving to shops she''s been to for years.",
      "psychosocial_impact": "Daughter is anxious. Patient minimises concerns but seems slightly confused at times.",
      "ice": {
        "ideas_patient": "Just normal ageing, nothing serious",
        "ideas_daughter": "Worried it might be dementia like grandmother",
        "concerns": "Daughter worried about safety at home and driving",
        "expectations": "Daughter wants a memory test and proper assessment"
      }
    },
    "history_on_direct_questioning": {
      "memory_symptoms": {
        "onset": "Gradual over past 6-12 months (per daughter)",
        "progression": "Slowly getting worse",
        "short_term": "Forgets recent conversations, asks same questions",
        "long_term": "Preserved - remembers nursing career, children''s births",
        "word_finding": "Occasional difficulty finding right words",
        "navigation": "Got lost going to familiar shops last month"
      },
      "function": {
        "adls": "Managing basic ADLs - washing, dressing",
        "iadls": "Struggling with cooking (burnt pans), managing money (bills unpaid), medications (inconsistent)",
        "driving": "Still driving - daughter very concerned about this",
        "safety": "Left gas on twice, front door open overnight once"
      },
      "mood": {
        "depression": "No significant low mood",
        "anxiety": "Some anxiety about being a burden",
        "sleep": "Sleeping reasonably well"
      },
      "pmh": {
        "hypertension": "Well controlled on Amlodipine",
        "stroke_tia": "No",
        "head_injury": "No",
        "thyroid": "No known thyroid problems"
      },
      "dhx": {
        "regular": "Amlodipine 5mg OD",
        "prn": "Paracetamol for arthritis",
        "compliance": "Daughter concerned she''s missing doses",
        "allergies": "Penicillin - rash"
      },
      "social_hx": {
        "living": "Lives alone in house she''s been in for 40 years. Husband died 3 years ago.",
        "support": "Daughter lives 10 minutes away, visits 2-3 times per week",
        "hobbies": "Used to do crosswords - struggling with them now",
        "alcohol": "Occasional sherry"
      },
      "fhx": {
        "dementia": "Mother had Alzheimer''s disease, diagnosed at 75, died at 82",
        "other": "Father had heart disease"
      }
    }
  }',
  'PATIENT: Slightly DEFENSIVE and MINIMISING. Brush off concerns with "I''m just getting older" and "Everyone forgets things." Look to daughter dismissively when she mentions concerns. If asked directly about specific incidents, pause and look slightly confused, then minimise. If treated with dignity, become more cooperative.

DAUGHTER: WORRIED but trying not to upset mum. Interject with specific examples when mum minimises. Look frustrated when mum dismisses concerns. Express worry about driving.',
  'full',
  720,
  'advanced',
  ARRAY['Take collateral history', 'Assess cognition appropriately', 'Explore safety concerns', 'Address driving', 'Balance autonomy and safety', 'Plan appropriate referral'],
  '## Model Approach

**Key Challenges:**
1. Patient lacks insight
2. Collateral history essential
3. Driving safety issue
4. Balancing autonomy and safety

**Assessment:**
- Likely early dementia (progressive, affecting function)
- Need formal cognitive testing
- Need to address safety concerns
- Need to address driving

**Management:**
1. Cognitive screening (GPCOG, 6-CIT, or MMSE)
2. Blood tests: FBC, U&Es, LFTs, TFTs, B12/folate, glucose
3. Refer to memory clinic
4. Discuss driving - advise to stop pending assessment, explain DVLA requirements
5. Safety: Consider medication dosette, gas safety check
6. Support for daughter

**Driving Discussion:**
- Must advise to stop driving pending formal assessment
- Patient responsibility to notify DVLA
- If patient refuses and lacks capacity, doctor may need to breach confidentiality',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Obtained history from both patient and daughter", "Explored onset and progression", "Assessed short and long-term memory", "Explored functional impact", "Asked about safety incidents", "Explored driving concerns", "Asked about mood", "Obtained collateral history effectively", "Explored family history of dementia", "Considered reversible causes"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Planned cognitive screening", "Planned appropriate blood tests", "Arranged memory clinic referral", "Addressed driving appropriately", "Explained DVLA requirements", "Considered home safety measures", "Planned medication support", "Considered capacity", "Supported carer", "Arranged follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Maintained patient dignity", "Balanced both perspectives", "Did not dismiss patient", "Handled driving sensitively", "Acknowledged daughter''s concerns", "Explained without alarming", "Respected autonomy while addressing safety", "Showed empathy to both"]}}'
);

-- =====================================================
-- CASE 6: SH-001 - Sexual Health
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'SH-001: Sensitive Genital Symptoms',
  'Sexual Health',
  'SH-001',
  'You are a GP trainee. A 24-year-old woman, Miss Jade Williams, has booked an appointment. The booking note says "personal problem."

',
  '{"name": "Miss Jade Williams", "age": 24, "gender": "Female"}',
  '{"patient": "Miss Jade Williams", "age": 24, "gender": "Female", "pmh": "None", "medications": "None regular", "allergies": "None", "social_summary": "Works as hairdresser, single", "family_summary": "Nothing significant"}',
  '{
    "opening_statement": "(Hesitant, looks uncomfortable) Hi doctor... I''ve got a bit of an embarrassing problem... down below.",
    "freely_given_history": {
      "presenting_complaint": "Has noticed some discharge and discomfort ''down there'' for about a week. Initially reluctant to give details.",
      "psychosocial_impact": "Very embarrassed. Has been avoiding intimacy with new partner. Worried about what this might mean.",
      "ice": {
        "ideas": "Worried she might have caught something",
        "concerns": "Scared it might be something serious, worried about telling partner",
        "expectations": "Wants to get tested and treated, wants to know if she needs to tell anyone"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "discharge": "Yellow-green discharge for 1 week, increased amount, unusual smell",
        "pain": "Some lower abdominal discomfort, mild",
        "dysuria": "Slight stinging when passing urine",
        "bleeding": "No abnormal bleeding",
        "itch": "Minimal",
        "dyspareunia": "Has avoided sex since symptoms started"
      },
      "sexual_history": {
        "partners": "New partner for 6 weeks - met on dating app. Previous long-term boyfriend ended 3 months ago.",
        "contraception": "Condoms - usually, but admits didn''t use them every time with new partner",
        "last_sti_screen": "Never had one",
        "partner_symptoms": "Hasn''t asked him",
        "previous_sti": "None"
      },
      "menstrual": {
        "lmp": "2 weeks ago, normal",
        "cycle": "Regular 28-day cycle",
        "contraception": "Condoms only"
      },
      "pmh": {
        "gynae": "No previous gynae problems",
        "other": "Generally well"
      },
      "dhx": {
        "regular": "None",
        "allergies": "None"
      },
      "social_hx": {
        "occupation": "Hairdresser",
        "living": "Lives in flat share with friend",
        "alcohol": "Social - weekends",
        "smoking": "Occasional when drinking",
        "drugs": "Has used cocaine on nights out but not regularly"
      }
    }
  }',
  'EMBARRASSED and HESITANT initially. Avoid eye contact. Use euphemisms like "down there" and "personal problem." If the doctor is matter-of-fact and non-judgmental, gradually become more open. If asked directly about sexual history, pause and say "This is so embarrassing" before answering. Express relief when the doctor normalises the situation.',
  'full',
  720,
  'intermediate',
  ARRAY['Create safe environment', 'Take sensitive sexual history', 'Consider STI differentials', 'Discuss partner notification', 'Appropriate testing', 'Maintain confidentiality'],
  '## Model Approach

**Creating Safety:**
- Normalise the consultation
- Use clear, non-judgmental language
- Explain confidentiality

**Differential:**
1. Chlamydia (most common)
2. Gonorrhoea (discharge colour suggestive)
3. Trichomoniasis
4. Bacterial vaginosis
5. Consider PID if abdominal pain significant

**Management:**
1. Full STI screen (chlamydia, gonorrhoea, HIV, syphilis, hepatitis)
2. Consider empirical treatment if high clinical suspicion
3. Discuss partner notification (usually via partner notification service)
4. Condom advice
5. Consider pregnancy test
6. Follow-up for results

**Partner Notification:**
- She should inform partner
- Can use partner notification services
- Partner needs testing and treatment',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Created comfortable environment", "Used appropriate language", "Took sensitive sexual history", "Asked about number and gender of partners", "Asked about condom use", "Explored symptoms systematically", "Asked about previous STI testing", "Asked about drug use", "Considered pregnancy risk", "Explored ICE sensitively"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered appropriate differentials", "Planned comprehensive STI screen", "Discussed empirical treatment if indicated", "Addressed partner notification", "Explained process sensitively", "Gave contraceptive advice", "Arranged follow-up for results", "Considered PID if severe", "Maintained confidentiality", "Documented appropriately"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Non-judgmental throughout", "Normalised the consultation", "Made patient feel at ease", "Explained confidentiality", "Used appropriate language", "Checked understanding", "Showed sensitivity", "Empowered patient"]}}'
);

-- =====================================================
-- CASE 7: PEDS-001 - Paediatrics (Concerned Parent)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'PEDS-001: Unwell Child',
  'Paediatrics',
  'PEDS-001',
  'You are a GP trainee. Mrs. Sarah Ahmed has brought her 2-year-old son, Zain, who has been unwell for 2 days with a fever.

',
  '{"name": "Zain Ahmed", "age": 2, "gender": "Male", "accompanied_by": "Mother - Sarah Ahmed"}',
  '{"patient": "Zain Ahmed", "age": "2 years", "gender": "Male", "pmh": "None - previously well child", "medications": "Calpol given at home", "allergies": "None known", "immunisations": "Up to date", "birth_history": "Normal delivery, no neonatal problems"}',
  '{
    "opening_statement": "(Holding child, looking anxious) Doctor, I''m really worried about Zain. He''s had a temperature for 2 days and he''s just not himself.",
    "freely_given_history": {
      "presenting_complaint": "2 days of fever up to 39°C. More clingy than usual. Not eating as much.",
      "psychosocial_impact": "Mother is worried because he''s never been this unwell. Has been up with him at night. Feels guilty she might have missed something.",
      "ice": {
        "ideas": "Worried it might be meningitis - has seen the adverts",
        "concerns": "Scared the fever won''t come down and he might have a fit",
        "expectations": "Wants him checked over properly and wants to know what to look out for"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "fever": "Up to 39°C, comes down with Calpol but goes back up. Started 2 days ago.",
        "duration": "2 days",
        "activity": "More tired than usual, clingy, wants to be held. Playing less but still interested in favourite toys.",
        "feeding": "Eating about half normal amount. Drinking OK - having water and diluted juice.",
        "urine": "Wet nappies - perhaps slightly fewer than usual",
        "rash": "No rash anywhere",
        "cough": "Mild runny nose, no significant cough",
        "ears": "Pulling at right ear occasionally",
        "vomiting": "No vomiting",
        "diarrhoea": "No diarrhoea",
        "breathing": "Breathing seems normal, no wheeze"
      },
      "red_flags": {
        "rash": "No rash - mother has checked with glass",
        "drowsiness": "Tired but rousable, makes eye contact, cries when upset",
        "bulging_fontanelle": "N/A - fontanelle closed",
        "neck_stiffness": "No - can move head normally",
        "breathing": "No fast breathing, no chest recession, no grunting",
        "colour": "Normal colour, not pale or mottled",
        "feeding": "Reduced but still taking fluids",
        "wet_nappies": "Still having wet nappies"
      },
      "pmh": {
        "previous_illness": "Never been this unwell before, occasional colds only",
        "hospitalisations": "None",
        "birth": "Normal vaginal delivery at term, no problems"
      },
      "dhx": {
        "regular": "None",
        "recent": "Calpol (paracetamol) - correct dose for weight, every 4-6 hours",
        "allergies": "None known"
      },
      "immunisations": {
        "status": "Fully up to date including MMR",
        "recent": "No recent immunisations"
      },
      "social": {
        "nursery": "Attends nursery 3 days per week - there are other children off sick",
        "contacts": "No known contact with serious illness",
        "home": "Lives with mum, dad and older sister (age 5)"
      }
    }
  }',
  'ANXIOUS MOTHER - First-time dealing with unwell toddler. Speak quickly, ask lots of questions. Look at child frequently with concern. If doctor examines child thoroughly, become slightly reassured. If doctor seems to rush or not take concerns seriously, become more anxious and ask more questions. If told it''s "just a virus," initially seem unsatisfied and need more explanation about what to watch for.',
  'full',
  720,
  'intermediate',
  ARRAY['Assess fever in child systematically', 'Screen for red flags', 'Examine for focus of infection', 'Address parental anxiety', 'Safety-net thoroughly', 'Explain when to seek help'],
  '## Model Approach

**Assessment:**
- 2-year-old with fever for 2 days
- Most likely viral URTI +/- otitis media (ear pulling)
- No red flag features
- Moderate risk (NICE traffic light)

**Red Flag Screen (All Negative):**
- No non-blanching rash
- Alert and interactive
- Normal breathing
- Good colour
- Still drinking
- Wet nappies

**Likely Diagnosis:**
- Viral upper respiratory tract infection
- Possible otitis media (ear pulling)

**Management:**
1. Examine child including ears
2. Reassure - likely viral illness
3. Explain natural history (may take 5-7 days)
4. Antipyretic advice (paracetamol/ibuprofen)
5. Fluid encouragement
6. Detailed safety-netting:
   - When to seek help
   - What to look for
   - How to check for rash

**Safety-net:**
- Return if: Rash, drowsy, breathing fast, not drinking, getting worse, or you''re worried',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic fever history", "Asked about feeding and fluid intake", "Asked about wet nappies", "Screened for red flags systematically", "Asked about rash - glass test", "Asked about activity level", "Asked about breathing", "Explored possible focus (ears, throat, chest)", "Asked about nursery contacts", "Checked immunisation status"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Used NICE traffic light approach", "Identified likely focus of infection", "Considered differential appropriately", "Gave appropriate antipyretic advice", "Gave fluid advice", "Provided thorough safety-netting", "Explained what to look for", "Explained when to return", "Gave realistic timeframe for improvement", "Arranged appropriate follow-up if needed"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Acknowledged parental anxiety", "Took concerns seriously", "Examined child appropriately", "Explained findings clearly", "Used parent-friendly language", "Checked understanding", "Empowered parent with knowledge", "Validated the worry about meningitis"]}}'
);

-- =====================================================
-- CASE 8: MSK-001 - Musculoskeletal (Joint Pain)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'MSK-001: Joint Stiffness and Pain',
  'Musculoskeletal',
  'MSK-001',
  'You are a GP trainee. Mr. John Harrison, a 52-year-old man, has come about pain and stiffness in his hands that has been bothering him for several weeks.

',
  '{"name": "Mr. John Harrison", "age": 52, "gender": "Male"}',
  '{"patient": "Mr. John Harrison", "age": 52, "gender": "Male", "pmh": "Psoriasis (20 years)", "medications": "Topical betamethasone for psoriasis flares", "allergies": "None", "social_summary": "Plumber, active lifestyle", "family_summary": "Mother has rheumatoid arthritis"}',
  '{
    "opening_statement": "Doctor, my hands have been really stiff and painful, especially in the mornings. It''s affecting my work.",
    "freely_given_history": {
      "presenting_complaint": "Pain and stiffness in fingers and hands for about 6 weeks. Worse in the mornings. Hands feel like they need warming up.",
      "psychosocial_impact": "Struggling to grip his tools at work. Worried he won''t be able to continue as a plumber.",
      "ice": {
        "ideas": "Wonders if it''s just wear and tear from years of manual work",
        "concerns": "Worried he might end up like his mother with bad arthritis",
        "expectations": "Wants to know what it is and if there''s treatment to help"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "location": "Both hands - mainly the finger joints. Also noticed some knee stiffness.",
        "onset": "Gradual onset over 6 weeks",
        "character": "Stiff, aching, sometimes swollen",
        "morning_stiffness": "About 45 minutes to an hour before hands feel loosened up",
        "pattern": "Worse in morning and after rest, improves with activity",
        "swelling": "Has noticed some swelling of fingers, particularly right middle finger which looks like a sausage",
        "severity": "6/10 some days, affecting work",
        "other_joints": "Knees a bit stiff, lower back aches sometimes"
      },
      "associated": {
        "psoriasis": "Has had psoriasis for 20 years - currently flaring on elbows and scalp",
        "nails": "Has noticed some pitting of nails recently",
        "eyes": "No eye problems",
        "fatigue": "Yes, more tired than usual"
      },
      "pmh": {
        "psoriasis": "Diagnosed age 32, mainly affects elbows, knees, scalp. Currently not well controlled.",
        "other": "Generally fit and well otherwise"
      },
      "dhx": {
        "regular": "Betamethasone cream for psoriasis flares",
        "otc": "Ibuprofen - taking regularly now for pain, helps a bit",
        "allergies": "None"
      },
      "social_hx": {
        "occupation": "Self-employed plumber for 25 years",
        "living": "Lives with wife",
        "smoking": "Never smoked",
        "alcohol": "10-12 units per week",
        "exercise": "Usually active but doing less because of pain"
      },
      "fhx": {
        "arthritis": "Mother has RA - on injections for it",
        "psoriasis": "Uncle has psoriasis"
      }
    }
  }',
  'WORRIED about work and future. Describe pain when showing hands - grimace and rub them. If asked to demonstrate grip, do so weakly. Express particular concern about the swollen "sausage finger." When psoriatic arthritis is mentioned, look surprised and say "I didn''t know psoriasis could affect joints." If referred urgently, express relief that something is being done.',
  'full',
  720,
  'intermediate',
  ARRAY['Recognise inflammatory arthritis pattern', 'Link psoriasis to joint symptoms', 'Identify dactylitis', 'Urgent rheumatology referral', 'Appropriate interim management', 'Address work concerns'],
  '## Model Approach

**Diagnosis:** Likely Psoriatic Arthritis (PsA)
- Known psoriasis
- Inflammatory pattern (morning stiffness >30 mins)
- Dactylitis ("sausage digit")
- Nail changes
- Polyarticular involvement

**Key Features:**
- Morning stiffness >30 minutes = inflammatory
- Sausage finger = dactylitis = classic PsA
- Nail pitting = associated with PsA
- Axial involvement (back pain)

**Management:**
1. Urgent rheumatology referral (NICE - within 3 weeks)
2. Bloods: CRP, ESR, RF, anti-CCP, FBC, U&Es, LFTs
3. X-rays hands
4. Interim symptom relief: regular NSAID if no contraindication
5. Continue current psoriasis treatment
6. Advise may need disease-modifying treatment

**Work:**
- Acknowledge impact on livelihood
- Reassure that with treatment, many people continue working
- May need adaptations short-term',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic joint history", "Asked about morning stiffness duration", "Identified dactylitis", "Asked about psoriasis control", "Asked about nail changes", "Asked about enthesitis", "Asked about back pain", "Asked about eye symptoms", "Explored family history", "Assessed functional impact"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised psoriatic arthritis", "Planned urgent rheumatology referral", "Knew NICE guidelines for referral", "Ordered appropriate bloods", "Arranged X-rays", "Gave appropriate interim analgesia", "Explained likely diagnosis", "Discussed disease-modifying treatment", "Addressed work concerns", "Arranged follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Acknowledged work impact", "Explained link between psoriasis and arthritis", "Reassured about treatment options", "Used clear language", "Checked understanding", "Addressed concerns about future", "Gave hope about prognosis with treatment", "Empathetic approach"]}}'
);
