-- Migration 039: SCA Telephone and Third-Party Consultation Cases
-- Adds 25 new SCA cases (telephone consultations and third-party calls)
-- for practice with exam-style mix (3-4 telephone/third-party per exam).
-- Run after 037 (which has the first 34 cases).

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
  'GI-004',
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
  'MH-003',
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
  'PAED-005',
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
  'PAED-006',
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
  'RESP-005',
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
  'PAED-007',
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
  'URO-003',
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
  'DERM-003',
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
