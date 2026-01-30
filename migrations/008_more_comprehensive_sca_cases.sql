-- Additional Comprehensive SCA Cases with Full Actor Scripts
-- Continuation of 007 - Cases 9-25

-- =====================================================
-- CASE 9: GI-001 - Gastroenterology (Dyspepsia)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'GI-001: Persistent Indigestion',
  'Gastroenterology',
  'GI-001',
  'You are a GP trainee. Mr. George Wilson, a 62-year-old man, has come about persistent heartburn and indigestion that is not improving with over-the-counter remedies.

',
  '{"name": "Mr. George Wilson", "age": 62, "gender": "Male"}',
  '{"patient": "Mr. George Wilson", "age": 62, "gender": "Male", "pmh": "Osteoarthritis", "medications": "Ibuprofen 400mg TDS, Paracetamol PRN", "allergies": "None", "social_summary": "Retired, lives with wife, drinks moderately", "family_summary": "Father had stomach ulcer"}',
  '{
    "opening_statement": "Doctor, I''ve had this terrible heartburn for about 6 weeks now. Gaviscon doesn''t touch it anymore.",
    "freely_given_history": {
      "presenting_complaint": "Burning sensation in upper abdomen and chest after eating. Worse at night. Taking antacids with minimal relief.",
      "psychosocial_impact": "Affecting his sleep. Wife worried because he''s off his food.",
      "ice": {
        "ideas": "Thinks it might be an ulcer like his father had",
        "concerns": "Worried it could be something more serious - cancer",
        "expectations": "Wants a scan or camera test to see what''s going on"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "location": "Epigastric, radiating up behind sternum",
        "character": "Burning, gnawing",
        "onset": "Gradual, over 6 weeks",
        "timing": "Worse after meals, especially fatty foods, and when lying down",
        "severity": "6/10",
        "relieving": "Sitting up helps a bit, antacids minimal effect now",
        "exacerbating": "Bending over, lying flat, large meals"
      },
      "red_flags": {
        "dysphagia": "No difficulty swallowing",
        "weight_loss": "Maybe lost 2-3kg but not really trying",
        "vomiting": "No vomiting",
        "haematemesis": "No blood in vomit",
        "melaena": "No black stools - stools normal colour",
        "anaemia_symptoms": "No unusual tiredness or breathlessness",
        "early_satiety": "Gets full more quickly than before"
      },
      "pmh": {
        "gi": "No previous stomach problems",
        "arthritis": "Osteoarthritis of knees for 5 years",
        "h_pylori": "Never tested"
      },
      "dhx": {
        "regular": "Ibuprofen 400mg three times daily for knee pain - been on it for 2 years",
        "otc": "Gaviscon, Rennies - not helping anymore",
        "compliance": "Takes ibuprofen regularly, sometimes with food, sometimes not",
        "allergies": "None"
      },
      "social_hx": {
        "occupation": "Retired teacher",
        "smoking": "Never smoked",
        "alcohol": "10-15 units per week, wine with dinner",
        "diet": "Good varied diet, enjoys fatty foods",
        "stress": "Generally relaxed since retirement"
      },
      "fhx": {
        "gi": "Father had peptic ulcer, required surgery",
        "cancer": "No GI cancers in family"
      }
    }
  }',
  'CONCERNED but not anxious. Express the pain clearly when describing symptoms. Show frustration that antacids aren''t working anymore. When asked about ibuprofen, be surprised if told it could be the cause - "But I''ve been taking it for years!" Be receptive to advice but want reassurance about cancer.',
  'full',
  720,
  'intermediate',
  ARRAY['Identify NSAID use as cause', 'Screen for alarm features', 'Age >55 with new dyspepsia = red flag', 'Consider urgent 2WW referral', 'Discuss stopping NSAID', 'H. pylori testing'],
  '## Model Approach

**Key Concerns:**
- Age 62 with NEW dyspepsia = alarm feature (NICE)
- Long-term NSAID use (high risk for ulcer)
- Weight loss and early satiety warrant investigation
- Father''s ulcer history

**Red Flag Assessment:**
- Age >55 with new symptoms ✓
- Weight loss (minor but present) ✓
- Early satiety ✓
- No dysphagia, haematemesis, melaena

**Management:**
1. **Urgent consideration:** 2WW referral for OGD given age and symptoms
2. **Stop ibuprofen** - switch to paracetamol, topical NSAIDs, or consider physio
3. **Start PPI** - omeprazole 20mg OD
4. **H. pylori test** - stool antigen (if not referred urgently)
5. **Safety-net** for worsening symptoms

**NSAID Discussion:**
- Explain link between ibuprofen and stomach irritation/ulcers
- Offer alternatives for knee pain',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored dyspepsia symptoms systematically", "Asked about alarm features", "Identified weight loss", "Asked about dysphagia", "Asked about GI bleeding symptoms", "Identified chronic NSAID use", "Linked NSAID to symptoms", "Asked about H. pylori history", "Explored family history", "Assessed cancer risk factors"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised red flags for referral", "Considered 2WW OGD referral", "Planned to stop NSAID", "Started appropriate PPI", "Discussed alternative analgesia", "Considered H. pylori testing", "Explained risks clearly", "Provided safety-netting", "Arranged appropriate follow-up", "Documented rationale"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Addressed cancer worry sensitively", "Explained NSAID link clearly", "Did not dismiss concerns", "Involved in decision-making", "Explained referral rationale", "Gave clear next steps", "Supportive manner", "Checked understanding"]}}'
);

-- =====================================================
-- CASE 10: ENDO-001 - Endocrine (Diabetes Review)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'ENDO-001: Diabetes Control Issues',
  'Endocrine',
  'ENDO-001',
  'You are a GP trainee. Mrs. Priya Sharma, a 48-year-old woman with Type 2 diabetes, has come for her annual review. Her recent HbA1c has come back at 72 mmol/mol (target <53).

',
  '{"name": "Mrs. Priya Sharma", "age": 48, "gender": "Female"}',
  '{"patient": "Mrs. Priya Sharma", "age": 48, "gender": "Female", "pmh": "T2DM (5 years), Hypertension, Obesity (BMI 34)", "medications": "Metformin 1g BD, Gliclazide 80mg BD, Ramipril 5mg OD, Atorvastatin 20mg OD", "allergies": "None", "social_summary": "Works in catering, married, 3 children", "family_summary": "Both parents have T2DM"}',
  '{
    "opening_statement": "Hello doctor. I got a letter about my blood test. Is everything okay?",
    "freely_given_history": {
      "presenting_complaint": "Here for diabetes review. Knows her sugar control hasn''t been good but finding it hard to manage.",
      "psychosocial_impact": "Feels guilty about her diet. Stressed with work and family. Often too tired to cook healthy meals.",
      "ice": {
        "ideas": "Thinks she just needs to try harder with diet",
        "concerns": "Worried about ending up on injections like her mother",
        "expectations": "Hoping for advice on diet, doesn''t want more tablets"
      }
    },
    "history_on_direct_questioning": {
      "diabetes_control": {
        "home_monitoring": "Checks occasionally - usually 9-14 mmol/L fasting",
        "hypos": "No hypoglycaemic episodes",
        "symptoms": "More tired than usual, some increased thirst, no polyuria",
        "complications_screen": {
          "eyes": "Last eye check 8 months ago - was okay",
          "feet": "No foot problems, checks them sometimes",
          "kidneys": "Doesn''t know about kidney tests"
        }
      },
      "lifestyle": {
        "diet": "Struggles with diet - works in catering so snacks available constantly. Eats traditional Indian food at home - rice, chapati, curries. Portion sizes probably too big.",
        "exercise": "Very little - on feet at work but no formal exercise. Too tired after work.",
        "weight": "Gained about 5kg in past year"
      },
      "medications": {
        "compliance": "Takes Metformin but often misses evening dose. Gliclazide usually takes. Sometimes forgets morning tablets when rushing.",
        "side_effects": "Metformin causes some stomach upset",
        "understanding": "Not really sure how the tablets work"
      },
      "pmh": {
        "hypertension": "Well controlled, takes Ramipril",
        "other": "No CVD history"
      },
      "social_hx": {
        "occupation": "Catering manager - long hours, stressful, constant food around",
        "family": "Husband, 3 teenage children. Does most of the cooking.",
        "support": "Family supportive but husband also has diabetes",
        "smoking": "Never",
        "alcohol": "Rarely - occasional glass of wine"
      },
      "fhx": {
        "diabetes": "Mother on insulin, father on tablets. Both have complications.",
        "cvd": "Father had heart attack at 60"
      }
    }
  }',
  'APOLOGETIC and a bit DEFENSIVE about diet. Look down when discussing weight gain. Express frustration about work environment. When insulin is mentioned, look worried and say "I really don''t want injections." Be more engaged when practical solutions are discussed. Show interest in understanding how medications work.',
  'full',
  720,
  'intermediate',
  ARRAY['Explore barriers to control', 'Non-judgmental lifestyle discussion', 'Medication review and optimisation', 'Consider third agent or insulin', 'Screen for complications', 'Agree realistic goals'],
  '## Model Approach

**Assessment:**
- HbA1c 72 (target <53) - significantly above target
- On dual therapy (metformin + SU) - not at target
- Multiple barriers identified
- High cardiovascular risk

**Barriers Identified:**
1. Work environment (catering - constant food)
2. Medication compliance issues
3. Lack of exercise
4. Cultural dietary factors
5. Fatigue and time constraints

**Management Plan:**
1. **Non-judgmental discussion** of barriers
2. **Medication optimisation:**
   - Address compliance first
   - Consider adding third agent (SGLT2i ideal - weight loss, CV benefit)
   - Discuss insulin only if needed
3. **Lifestyle support:**
   - Dietitian referral (culturally appropriate advice)
   - Realistic exercise goals
   - Diabetes education course
4. **Screening:**
   - Foot check today
   - Confirm eye screening up to date
   - Check kidney function
5. **Follow-up:** 3 months with repeat HbA1c',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored diabetes control and home monitoring", "Asked about hypo symptoms", "Explored diet in detail", "Asked about exercise", "Assessed medication compliance", "Explored work and lifestyle barriers", "Asked about complications", "Checked screening status", "Explored family history", "Understood cultural factors"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed compliance issues first", "Considered medication optimisation", "Knew third-line options", "Discussed SGLT2i benefits", "Addressed insulin fears sensitively", "Offered dietitian referral", "Planned complications screening", "Set realistic goals", "Arranged appropriate follow-up", "Considered cardiovascular risk"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Non-judgmental approach", "Acknowledged barriers", "Didn''t lecture about diet", "Addressed insulin concerns", "Used motivational interviewing", "Collaborative goal-setting", "Culturally sensitive", "Supportive and encouraging"]}}'
);

-- =====================================================
-- CASE 11: DERM-001 - Dermatology (Skin Lesion)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'DERM-001: Changing Skin Lesion',
  'Dermatology',
  'DERM-001',
  'You are a GP trainee. Mr. Robert Taylor, a 58-year-old man, has come about a mole on his back that his wife noticed has changed.

',
  '{"name": "Mr. Robert Taylor", "age": 58, "gender": "Male"}',
  '{"patient": "Mr. Robert Taylor", "age": 58, "gender": "Male", "pmh": "None significant", "medications": "None regular", "allergies": "None", "social_summary": "Builder, outdoor work, sun exposure", "family_summary": "Nothing significant"}',
  '{
    "opening_statement": "Doctor, my wife noticed a mole on my back has changed. She''s been nagging me to come in for weeks.",
    "freely_given_history": {
      "presenting_complaint": "Wife noticed a mole on upper back has got bigger and darker over past 3-4 months. He can''t see it himself.",
      "psychosocial_impact": "Initially dismissive but wife''s persistence has made him worried. Now anxious about skin cancer.",
      "ice": {
        "ideas": "Didn''t think it was anything but now worrying it could be cancer",
        "concerns": "His mate had melanoma last year - this has made him more anxious",
        "expectations": "Wants it looked at properly and reassurance, or referral if needed"
      }
    },
    "history_on_direct_questioning": {
      "lesion_history": {
        "duration": "Mole has been there for years but changed in past 3-4 months",
        "change_size": "Wife says it''s definitely bigger - maybe doubled in size",
        "change_colour": "Was brown, now has darker areas and seems uneven",
        "change_shape": "Wife says it looks irregular now, used to be round",
        "symptoms": "Occasionally itches. No bleeding. No pain.",
        "other_lesions": "Has lots of moles and sunspots from outdoor work"
      },
      "risk_factors": {
        "sun_exposure": "Works outdoors as builder for 35 years. Doesn''t use sunscreen. Has had sunburn many times.",
        "sunbeds": "Never used",
        "skin_type": "Fair skin, burns easily, rarely tans",
        "previous_skin_cancer": "No",
        "mole_count": "Lots of moles - probably more than 50"
      },
      "pmh": {
        "skin": "No previous skin cancers or pre-cancers",
        "immunosuppression": "No",
        "other": "Generally well"
      },
      "fhx": {
        "melanoma": "No family history of melanoma",
        "other_skin_cancer": "Father had something removed from his face (doesn''t know what)"
      },
      "social_hx": {
        "occupation": "Builder - outdoor work for 35 years",
        "hobbies": "Golf, gardening - more sun exposure",
        "smoking": "Ex-smoker, quit 10 years ago",
        "alcohol": "15-20 units per week"
      },
      "examination_findings": "If examined: 12mm lesion on right upper back. Asymmetrical shape. Irregular border. Colour variation (brown, dark brown, black areas). Not raised."
    }
  }',
  'INITIALLY DISMISSIVE - "Wife made me come." Become more SERIOUS and ANXIOUS when asked about changes - "Is this bad, doctor?" Mention your mate''s melanoma. If referred urgently, look worried but also relieved something is being done. Ask "Do you think it''s cancer?"',
  'full',
  720,
  'intermediate',
  ARRAY['Apply ABCDE criteria', 'Recognise melanoma risk factors', 'Assess using 7-point checklist', 'Urgent 2WW referral criteria', 'Explain referral sensitively', 'Discuss sun protection'],
  '## Model Approach

**Assessment - 7-Point Checklist:**
Major features (2 points each):
- Change in size ✓
- Irregular shape ✓
- Irregular colour ✓

Minor features (1 point each):
- Diameter >6mm ✓ (12mm)
- Inflammation ✗
- Oozing/crusting ✗
- Itch ✓

Score: 7+ points = Urgent referral

**ABCDE:**
- Asymmetry ✓
- Border irregular ✓
- Colour variation ✓
- Diameter >6mm ✓
- Evolution ✓

**Risk Factors Present:**
- Fair skin, burns easily
- Extensive sun exposure (builder 35 years)
- Multiple moles (>50)
- History of sunburn
- Age 58

**Management:**
1. **2WW urgent referral** to dermatology
2. Explain referral is precautionary
3. Advise not to traumatise the lesion
4. Discuss sun protection going forward
5. Offer mole check for other concerning lesions',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Asked about changes in size, shape, colour", "Applied ABCDE or 7-point checklist", "Asked about symptoms (itch, bleeding)", "Explored duration of changes", "Assessed sun exposure history", "Asked about previous sunburn", "Asked about skin type", "Asked about family history of melanoma", "Explored occupational exposure", "Asked about other suspicious lesions"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised need for urgent referral", "Knew 2WW criteria", "Explained referral sensitively", "Did not falsely reassure", "Did not delay referral", "Gave advice about sun protection", "Discussed what to expect", "Documented findings clearly", "Considered photography if available", "Arranged follow-up if not seen"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Addressed initial dismissiveness", "Took concerns seriously", "Explained findings clearly", "Balanced honesty with sensitivity", "Did not cause undue alarm", "Answered questions honestly", "Acknowledged friend''s melanoma", "Supportive manner"]}}'
);

-- =====================================================
-- CASE 12: NEURO-001 - Neurology (Headache)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'NEURO-001: Recurrent Headaches',
  'Neurology',
  'NEURO-001',
  'You are a GP trainee. Miss Emma Collins, a 32-year-old marketing executive, has come about headaches that have been affecting her work.

',
  '{"name": "Miss Emma Collins", "age": 32, "gender": "Female"}',
  '{"patient": "Miss Emma Collins", "age": 32, "gender": "Female", "pmh": "None", "medications": "Ibuprofen PRN, Combined oral contraceptive", "allergies": "None", "social_summary": "High-stress job, poor sleep, skips meals", "family_summary": "Mother has migraines"}',
  '{
    "opening_statement": "Doctor, I keep getting these terrible headaches. They''re really affecting my work and I need something to help.",
    "freely_given_history": {
      "presenting_complaint": "Recurrent severe headaches for 6 months, occurring 2-3 times per week. Missing work because of them.",
      "psychosocial_impact": "Affecting work performance and relationships. Had to cancel plans multiple times. Feeling frustrated and down.",
      "ice": {
        "ideas": "Thinks they''re probably migraines like her mother has",
        "concerns": "Worried there could be something serious like a brain tumour",
        "expectations": "Wants effective treatment - triptans like her mother uses"
      }
    },
    "history_on_direct_questioning": {
      "headache_characteristics": {
        "site": "Usually right-sided, around temple and behind eye",
        "character": "Throbbing, pulsating",
        "severity": "8-9/10 at worst",
        "duration": "Usually 6-8 hours if untreated, sometimes all day",
        "frequency": "2-3 times per week for past 6 months",
        "onset": "Gradual onset over 30-60 minutes",
        "aura": "No visual disturbance, no numbness or weakness",
        "associated": "Nausea (sometimes vomits), can''t tolerate light or noise, wants to lie in dark room"
      },
      "triggers": {
        "identified": "Stress, missing meals, poor sleep, period time",
        "alcohol": "Red wine seems to trigger",
        "other": "Bright lights, strong smells"
      },
      "red_flags": {
        "thunderclap": "No sudden severe onset",
        "progressive": "Similar severity each time",
        "neurology": "No weakness, no visual loss, no speech problems",
        "fever": "No fever or neck stiffness",
        "morning": "Not worse in morning, not worse lying down",
        "new_type": "Same pattern each time"
      },
      "medication_use": {
        "current": "Ibuprofen 400mg - takes 3-4 times per week, helps a bit",
        "tried": "Paracetamol didn''t help",
        "frequency": "Using painkillers most days of the week"
      },
      "pmh": {
        "headaches": "Started getting headaches more frequently 6 months ago",
        "other": "Otherwise well"
      },
      "dhx": {
        "regular": "Combined oral contraceptive (Microgynon) for 10 years",
        "otc": "Ibuprofen 400mg 3-4 times per week",
        "allergies": "None"
      },
      "social_hx": {
        "work": "Marketing executive - high pressure, long hours, lots of screen time",
        "sleep": "5-6 hours per night, irregular schedule",
        "meals": "Often skips breakfast, irregular eating",
        "caffeine": "3-4 coffees per day",
        "alcohol": "Social drinking at weekends",
        "exercise": "Gym 2-3 times per week when can"
      },
      "fhx": {
        "migraine": "Mother has migraines, takes sumatriptan",
        "other": "Nothing else significant"
      }
    }
  }',
  'FRUSTRATED and wants solution. Speak quickly about impact on work. Look relieved when migraine diagnosis confirmed. If medication overuse mentioned, look surprised - "But I only take them because of the headaches!" Be receptive to triptan suggestion but also want to understand about preventing them.',
  'full',
  720,
  'easy',
  ARRAY['Diagnose migraine without aura', 'Exclude secondary headache', 'Identify medication overuse', 'COCP and migraine discussion', 'Acute and preventive treatment', 'Lifestyle modification'],
  '## Model Approach

**Diagnosis:** Migraine without aura + likely medication overuse headache

**Migraine Features:**
- Unilateral, throbbing
- Moderate-severe intensity
- Nausea, photophobia, phonophobia
- Duration 4-72 hours
- Family history supportive
- Triggers identified

**Concerns:**
1. **Medication overuse headache** - ibuprofen 3-4x weekly
2. **Combined pill** - need to check for aura

**Red Flags - All Absent:**
- No thunderclap onset
- No progressive worsening
- No focal neurology
- No systemic symptoms
- Same pattern each time

**Management:**
1. **Acute treatment:** Triptan (sumatriptan 50mg) - take early
2. **Address medication overuse:**
   - Reduce ibuprofen to max 2 days/week
   - Explain MOH concept
3. **Preventive consideration:** 
   - >4 migraine days/month = consider prophylaxis
   - Options: propranolol, amitriptyline, topiramate
4. **Lifestyle:**
   - Regular sleep, meals
   - Reduce caffeine
   - Headache diary
5. **COCP:**
   - Safe without aura
   - Counsel to report any aura symptoms',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic headache history", "Applied migraine criteria (ICHD)", "Asked about aura specifically", "Screened for red flags", "Identified medication overuse", "Explored triggers", "Asked about COCP use", "Explored lifestyle factors", "Asked about family history", "Assessed impact on function"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made appropriate migraine diagnosis", "Excluded secondary causes", "Prescribed appropriate acute treatment", "Addressed medication overuse", "Considered preventive treatment", "Gave lifestyle advice", "Discussed COCP safety", "Suggested headache diary", "Arranged follow-up", "Considered referral criteria"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Validated impact on life", "Explained medication overuse sensitively", "Didn''t blame for painkiller use", "Gave hope for improvement", "Clear explanation of plan", "Involved in decisions", "Addressed tumour worry", "Supportive approach"]}}'
);

-- =====================================================
-- CASE 13: ADDICTION-001 - Substance Misuse (Alcohol)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'ADDICTION-001: Drinking Concerns',
  'Substance Misuse',
  'ADDICTION-001',
  'You are a GP trainee. Mr. Kevin O''Brien, a 47-year-old man, has come because his wife is concerned about his drinking. He has reluctantly agreed to see you.

',
  '{"name": "Mr. Kevin O''Brien", "age": 47, "gender": "Male"}',
  '{"patient": "Mr. Kevin O''Brien", "age": 47, "gender": "Male", "pmh": "Hypertension", "medications": "Lisinopril 10mg OD", "allergies": "None", "social_summary": "Sales manager, married, stressful job", "family_summary": "Father was alcoholic"}',
  '{
    "opening_statement": "(Defensive) My wife made me come. She thinks I drink too much. I keep telling her it''s just work stress - everyone in sales drinks.",
    "freely_given_history": {
      "presenting_complaint": "Wife concerned about drinking. He thinks she''s overreacting. Admits he drinks most days but says it''s just to unwind.",
      "psychosocial_impact": "Wife threatening to leave if he doesn''t cut down. Arguments at home. Has missed a few Monday mornings at work.",
      "ice": {
        "ideas": "Thinks he just needs to cut down a bit and wife will be happy",
        "concerns": "Deep down worried he might have a problem like his father did",
        "expectations": "Hoping to get some advice to pacify his wife"
      }
    },
    "history_on_direct_questioning": {
      "alcohol_history": {
        "quantity": "Usually a bottle of wine per night during week, more at weekends. Probably 60-70 units per week.",
        "pattern": "Drinks every day. Starts when gets home from work, about 6pm.",
        "tolerance": "Needs more to feel the effect than he used to",
        "dependence_features": {
          "withdrawal": "Feels shaky in the morning, better after a drink. Has had a drink before work occasionally.",
          "craving": "Thinks about alcohol during the day",
          "control": "Finds it hard to stop once started, meant to have one glass but finishes bottle",
          "priority": "Has cancelled family events to stay home and drink",
          "harmful_use": "Missed work, arguments with wife, less time with kids"
        },
        "previous_attempts": "Has tried to cut down many times, never lasts more than a few days"
      },
      "cage_responses": {
        "cut_down": "Yes - wife always asking him to",
        "annoyed": "Yes - gets angry when criticised",
        "guilty": "Yes - especially about missing kids'' events",
        "eye_opener": "Yes - has had morning drinks"
      },
      "consequences": {
        "health": "Wonders if drinking is why he feels tired and has indigestion",
        "work": "Missed Monday mornings, made a mistake on a client account",
        "relationships": "Wife threatening divorce, kids avoid him when he''s drinking",
        "legal": "No drink driving or legal issues"
      },
      "pmh": {
        "hypertension": "On treatment but BP still high",
        "mental_health": "Feels low sometimes, especially mornings",
        "liver": "Never had liver tests"
      },
      "fhx": {
        "alcohol": "Father was alcoholic - died at 55 from liver failure. Doesn''t want to be like him."
      }
    }
  }',
  'DEFENSIVE at first - minimize drinking and blame wife/work stress. Cross arms and look away when challenged. When asked about father, become quieter and more reflective. If doctor is non-judgmental and empathetic, gradually open up more. Show some insight when asked about father. At the end, show willingness to accept help if offered sensitively.',
  'full',
  720,
  'advanced',
  ARRAY['Use CAGE or AUDIT screening', 'Assess alcohol dependence', 'Explore consequences sensitively', 'Assess motivation to change', 'Discuss treatment options', 'Consider referral to specialist services'],
  '## Model Approach

**Assessment:**
- High-risk drinking (60-70 units/week)
- Features of alcohol dependence:
  - Tolerance
  - Withdrawal symptoms
  - Compulsion/craving
  - Loss of control
  - Continued use despite harm
- CAGE positive (4/4)

**Motivational Stage:**
- Pre-contemplation/contemplation
- Ambivalent about change
- Defensive but insight emerging (father)

**Management:**
1. **Non-judgmental approach** essential
2. **Brief intervention:**
   - Feedback on assessment
   - Responsibility is patient''s
   - Advice clearly given
   - Menu of options
   - Empathy throughout
   - Self-efficacy supported
3. **Medical assessment:**
   - LFTs, FBC, GGT
   - BP review
4. **Referral options:**
   - Local alcohol service
   - Consider community detox if motivated
   - AA information
5. **Safety:**
   - Advise against abrupt cessation (seizure risk)
   - Follow-up arranged

**Key Points:**
- Do not lecture or confront
- Use motivational interviewing
- Explore ambivalence
- Build on insight about father',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Quantified alcohol intake accurately", "Used screening tool (CAGE/AUDIT)", "Assessed dependence features", "Asked about withdrawal symptoms", "Explored consequences", "Asked about previous quit attempts", "Explored family history sensitively", "Assessed mood", "Considered physical complications", "Explored motivation to change"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Used brief intervention framework", "Did not lecture or confront", "Assessed stage of change", "Offered appropriate referral", "Discussed treatment options", "Planned medical investigations", "Warned about sudden cessation", "Considered mental health", "Arranged follow-up", "Documented appropriately"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Non-judgmental throughout", "Handled defensiveness well", "Used motivational interviewing", "Explored ambivalence", "Built rapport despite resistance", "Used family history sensitively", "Empathetic approach", "Patient-centred"]}}'
);

-- =====================================================
-- CASE 14: PALLIATIVE-001 - Palliative Care
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'PALLIATIVE-001: Advanced Cancer Discussion',
  'Palliative Care',
  'PALLIATIVE-001',
  'You are a GP trainee. Mrs. Dorothy Evans, a 72-year-old woman with metastatic lung cancer, has come to discuss her care. She was recently told by oncology that further treatment is not possible.

',
  '{"name": "Mrs. Dorothy Evans", "age": 72, "gender": "Female"}',
  '{"patient": "Mrs. Dorothy Evans", "age": 72, "gender": "Female", "pmh": "Metastatic lung cancer (diagnosed 8 months ago), COPD, Hypertension", "medications": "MST 30mg BD, Oramorph PRN, Prednisolone, Omeprazole", "allergies": "Codeine (nausea)", "social_summary": "Widowed, lives alone, daughter nearby", "family_summary": "Husband died 5 years ago from heart disease"}',
  '{
    "opening_statement": "(Quietly) Doctor, the hospital said there''s nothing more they can do. I''m not really sure what happens now.",
    "freely_given_history": {
      "presenting_complaint": "Seen oncology last week - told chemotherapy isn''t working and further treatment isn''t possible. Feeling lost about what happens next.",
      "psychosocial_impact": "Scared about how things will progress. Worried about being a burden on daughter. Some sleepless nights.",
      "ice": {
        "ideas": "Understands she is dying but not sure of timeframe",
        "concerns": "Worried about pain and suffering at the end, worried about dying alone",
        "expectations": "Wants to know what support is available and how to stay comfortable"
      }
    },
    "history_on_direct_questioning": {
      "understanding": {
        "diagnosis": "Knows she has lung cancer that has spread",
        "prognosis": "Oncologist mentioned months rather than years but wasn''t specific",
        "what_stopping_treatment_means": "Understands there''s no cure but still unsure what to expect"
      },
      "current_symptoms": {
        "pain": "Some pain in chest and back - morphine helps but makes her drowsy",
        "breathlessness": "Gets breathless on minimal exertion, uses oxygen sometimes",
        "appetite": "Not eating much, lost weight",
        "fatigue": "Very tired, sleeps a lot during day",
        "other": "Some nausea, constipation from morphine"
      },
      "preferences": {
        "place_of_care": "Wants to stay at home as long as possible",
        "place_of_death": "Would prefer to die at home if possible",
        "resuscitation": "Hasn''t been asked about this but wouldn''t want to be resuscitated",
        "hospital": "Doesn''t want to keep going to hospital"
      },
      "support": {
        "family": "Daughter lives 10 minutes away, visits daily. Very supportive.",
        "social": "Some friends from church visit occasionally",
        "practical": "Daughter helps with shopping and cleaning",
        "spiritual": "Faith is important to her"
      },
      "advance_care": {
        "lasting_power_of_attorney": "Daughter has LPA for health and finances",
        "will": "Will is up to date"
      }
    }
  }',
  'CALM but VULNERABLE. Speak softly and sometimes pause to collect thoughts. Look sad when discussing the future. When asked about preferences, become more engaged - this matters to you. Express relief when told about palliative care support. Ask "Will it hurt at the end?" and "Will you still look after me?"',
  'full',
  720,
  'advanced',
  ARRAY['Explore understanding sensitively', 'Assess current symptoms', 'Discuss preferred place of care', 'Introduce palliative care services', 'Discuss anticipatory medications', 'Address fears about dying'],
  '## Model Approach

**Assessment:**
- Clear understanding of diagnosis and prognosis
- Main concerns: pain, suffering, dying alone, being a burden
- Preferences: home care, home death, not for resuscitation
- Good family support
- Faith important

**Key Discussions:**

1. **Explore Understanding:**
   - Check what she''s been told
   - Clarify any misunderstandings
   - Gauge readiness for more information

2. **Symptom Management:**
   - Review pain control (adequate on current regime?)
   - Address constipation and nausea
   - Consider breathlessness management

3. **Introduce Palliative Care Services:**
   - Community palliative care team
   - Hospice at home
   - Marie Curie nurses
   - District nurses

4. **Anticipatory Care:**
   - Anticipatory prescribing (just in case meds)
   - DNACPR discussion (she''s indicated preference)
   - Preferred place of death documentation

5. **Address Fears:**
   - Reassure about pain management
   - Explain likely trajectory
   - Confirm ongoing GP support
   - 24/7 out-of-hours support

6. **Practical:**
   - Fast-track DS1500 for benefits
   - Equipment (hospital bed, commode)
   - Coordinate with daughter',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored understanding of diagnosis", "Explored understanding of prognosis", "Asked about current symptoms", "Assessed pain control", "Explored fears and concerns", "Asked about preferences for care", "Asked about preferred place of death", "Explored resuscitation wishes", "Assessed support network", "Asked about spiritual needs"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Reviewed current symptom management", "Planned anticipatory prescribing", "Introduced palliative care services", "Discussed DNACPR sensitively", "Planned documentation of preferences", "Considered practical support", "Coordinated with family", "Arranged follow-up", "Ensured continuity of care", "Considered DS1500"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Allowed silence and emotion", "Listened without rushing", "Addressed fears directly", "Gave honest but hopeful information", "Reassured about ongoing support", "Acknowledged spiritual needs", "Involved family appropriately", "Demonstrated compassion throughout"]}}'
);

-- =====================================================
-- CASE 15: URG-001 - Urgent/Emergency
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'URG-001: Sudden Severe Headache',
  'Urgent/Emergency',
  'URG-001',
  'You are a GP trainee. Mrs. Janet Wright, a 52-year-old woman, has telephoned the surgery urgently. The receptionist has put her through to you.

This is a telephone consultation.',
  '{"name": "Mrs. Janet Wright", "age": 52, "gender": "Female"}',
  '{"patient": "Mrs. Janet Wright", "age": 52, "gender": "Female", "pmh": "Hypertension", "medications": "Amlodipine 5mg OD", "allergies": "None known", "social_summary": "Teacher, lives with husband", "family_summary": "Mother had stroke at 70"}',
  '{
    "opening_statement": "(Sounds distressed) Doctor, I need help. I''ve got the most awful headache. It came on suddenly about 30 minutes ago. I''ve never had anything like it.",
    "freely_given_history": {
      "presenting_complaint": "Sudden onset severe headache 30 minutes ago. Describes as worst headache of her life. Was just sitting having coffee.",
      "psychosocial_impact": "Very frightened. Called in sick to work. Husband has gone to work, she''s alone.",
      "ice": {
        "ideas": "Something feels very wrong - this is different",
        "concerns": "Terrified it might be a stroke or something bursting",
        "expectations": "Needs to be seen urgently or told what to do"
      }
    },
    "history_on_direct_questioning": {
      "headache_characteristics": {
        "onset": "Came on suddenly - reached maximum intensity within seconds (thunderclap)",
        "activity": "Was just sitting having coffee, not doing anything strenuous",
        "location": "Back of head and neck, severe",
        "severity": "10/10 - worst headache ever",
        "character": "Like being hit on the head"
      },
      "associated_symptoms": {
        "neck_stiffness": "Neck feels stiff and sore",
        "photophobia": "Light hurts eyes",
        "nausea": "Feels sick",
        "vomiting": "Vomited once",
        "neurological": "No weakness, no visual loss, no speech problems",
        "consciousness": "Felt briefly faint initially but okay now"
      },
      "current_state": {
        "pain_now": "Still 9/10",
        "position": "Lying down with curtains closed",
        "able_to_move": "Can move but prefers to stay still"
      },
      "pmh": {
        "headaches": "Gets occasional tension headaches but nothing like this",
        "hypertension": "On treatment",
        "bleeding_disorders": "No",
        "anticoagulants": "No"
      },
      "fhx": {
        "sah": "Doesn''t know of any aneurysms in family",
        "stroke": "Mother had stroke at 70"
      }
    }
  }',
  'FRIGHTENED and DISTRESSED. Speak with urgency in voice. Describe the headache graphically - "like an explosion in my head." When asked about calling 999, initially say "Is it really that serious?" but accept readily when explained. Ask "Am I going to be okay?"',
  'full',
  720,
  'advanced',
  ARRAY['Recognise thunderclap headache', 'SAH until proven otherwise', 'Immediate 999 referral', 'Do not delay', 'Clear instructions to patient', 'Safety-netting if waits for ambulance'],
  '## Model Approach

**EMERGENCY SITUATION**

**Red Flags Present:**
- Thunderclap onset (maximum intensity within seconds)
- Worst headache ever
- Neck stiffness
- Photophobia
- Vomiting

**Diagnosis Until Proven Otherwise:** 
Subarachnoid Haemorrhage (SAH)

**Immediate Action:**
1. **Call 999 immediately** - do not delay
2. Explain need for emergency assessment
3. Advise to stay lying down
4. Someone to let ambulance in
5. Do not take aspirin

**What NOT to Do:**
- Do not bring to surgery
- Do not wait to see if it improves
- Do not give analgesia advice that delays 999
- Do not be falsely reassuring

**Communication:**
- Calm, clear instructions
- Explain why urgent (brain bleed needs ruling out)
- Reassure that getting help is the right thing
- Stay on phone until 999 called',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Identified thunderclap onset", "Established time course", "Asked about neck stiffness", "Asked about photophobia", "Asked about vomiting", "Asked about neurological symptoms", "Assessed current consciousness", "Identified this as different from usual headaches", "Assessed for red flags", "Did not delay with extensive history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised emergency immediately", "Called/advised 999 without delay", "Did not offer alternative management", "Did not bring to surgery", "Gave clear instructions", "Advised not to take aspirin", "Explained what to expect", "Ensured someone to let ambulance in", "Did not falsely reassure", "Appropriate urgency"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Remained calm", "Clear instructions despite patient distress", "Explained urgency sensitively", "Reassured about getting help", "Did not alarm unnecessarily", "Answered her question honestly", "Maintained control of call", "Professional and supportive"]}}'
);

-- =====================================================
-- CASE 16: ETHICS-001 - Ethical/Complex (Confidentiality)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'ETHICS-001: Confidentiality Request',
  'Ethics/Complex',
  'ETHICS-001',
  'You are a GP trainee. Mr. James Chen, a 35-year-old man, has come to discuss recent blood results. During the consultation, he makes a request about confidentiality.

',
  '{"name": "Mr. James Chen", "age": 35, "gender": "Male"}',
  '{"patient": "Mr. James Chen", "age": 35, "gender": "Male", "pmh": "None significant", "medications": "None", "allergies": "None", "social_summary": "IT consultant, married, one child aged 2", "family_summary": "Nothing significant"}',
  '{
    "opening_statement": "Doctor, thank you for seeing me. I got a call about my blood tests. But before we start, I need to ask you something important. Can you promise me absolute confidentiality?",
    "freely_given_history": {
      "presenting_complaint": "Had routine blood tests including HIV screen. Has been called back about results.",
      "psychosocial_impact": "Extremely anxious. Has something to confess. Terrified about what this means for his marriage.",
      "ice": {
        "ideas": "Suspects his HIV test might be positive",
        "concerns": "Terrified his wife will find out he had an affair",
        "expectations": "Wants doctor to keep this secret from his wife no matter what"
      }
    },
    "history_on_direct_questioning": {
      "context": {
        "reason_for_test": "Had unprotected sex with someone he met at a conference 3 months ago. Felt guilty and got tested.",
        "symptoms": "Had flu-like illness 4 weeks ago that resolved",
        "wife_knows": "Wife does not know about the affair or the test"
      },
      "results": {
        "hiv": "If asked: HIV test is positive (reactive, confirmed)",
        "other_tests": "Hepatitis negative"
      },
      "risk_assessment": {
        "wife_contact": "Has had unprotected sex with wife since the affair",
        "ongoing_risk": "Affair is over, one-off encounter"
      },
      "request": {
        "what_he_wants": "Wants to be treated for HIV but doesn''t want wife to know - ever",
        "rationale": "Says it would destroy his marriage and affect his child"
      }
    }
  }',
  'NERVOUS and PLEADING. Start by extracting promise of confidentiality before revealing information. When HIV result given, look devastated. Become increasingly desperate when discussing wife - "You can''t tell her, it would destroy everything." Challenge doctor when told wife needs to know - "But isn''t everything I tell you confidential?" If doctor explains sensitively, eventually accept need to tell wife but ask for help with how.',
  'full',
  720,
  'advanced',
  ARRAY['Handle confidentiality request', 'Deliver HIV result sensitively', 'Explain limits of confidentiality', 'Discuss partner notification', 'Balance competing interests', 'Offer support for disclosure'],
  '## Model Approach

**Ethical Framework:**
1. Patient confidentiality is fundamental BUT not absolute
2. GMC guidance: may breach confidentiality to prevent serious harm to others
3. Wife is at serious risk (HIV transmission)

**Approach:**

1. **Initial Request:**
   - Cannot promise absolute confidentiality before knowing content
   - Explain confidentiality has limits
   - Reassure will handle sensitively

2. **Delivering HIV Result:**
   - Clear, sensitive communication
   - Allow time for reaction
   - Support and empathy

3. **Partner Notification:**
   - Explain wife needs to know (at risk)
   - Encourage patient to tell her himself
   - Offer support for disclosure
   - Explain partner notification services
   - If refuses, explain may need to consider disclosure

4. **Next Steps:**
   - Refer to HIV specialist services
   - Discuss treatment options (ART)
   - Offer psychological support
   - Follow-up arranged

**Key Points:**
- Cannot promise absolute confidentiality
- Serious harm to third party (wife) justifies disclosure
- Prefer patient discloses themselves
- Give time but set expectations',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored reason for confidentiality request", "Took sexual history sensitively", "Established risk to third party", "Confirmed HIV result understanding", "Explored patient''s concerns", "Asked about ongoing risk", "Assessed patient''s mental state", "Explored support network", "Understood barriers to disclosure", "Assessed for immediate risk"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Did not promise absolute confidentiality", "Explained limits of confidentiality", "Delivered result sensitively", "Explained need for partner notification", "Encouraged patient-led disclosure", "Offered support for disclosure", "Explained partner notification services", "Referred to HIV services", "Considered mental health support", "Documented carefully"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Handled sensitively throughout", "Did not judge or lecture", "Empathetic to difficult situation", "Firm but supportive about disclosure", "Managed distress appropriately", "Balanced compassion with duty", "Offered practical support", "Maintained professional approach"]}}'
);

-- =====================================================
-- CASE 17: PREG-001 - Pregnancy/Obstetrics
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'PREG-001: Medication in Pregnancy',
  'Pregnancy/Obstetrics',
  'PREG-001',
  'You are a GP trainee. Mrs. Lisa Thompson, a 32-year-old woman, has come because she has just found out she is pregnant. She takes regular medication and is worried about whether she should continue.

',
  '{"name": "Mrs. Lisa Thompson", "age": 32, "gender": "Female"}',
  '{"patient": "Mrs. Lisa Thompson", "age": 32, "gender": "Female", "pmh": "Epilepsy (well-controlled), Depression", "medications": "Sodium valproate 500mg BD, Sertraline 100mg OD, Folic acid 400mcg OD", "allergies": "None", "social_summary": "Teacher, married, planned pregnancy", "family_summary": "Nothing significant"}',
  '{
    "opening_statement": "Doctor, I just did a pregnancy test and it''s positive! We''ve been trying for a year. But I''m really worried about my tablets - are they safe?",
    "freely_given_history": {
      "presenting_complaint": "Positive pregnancy test, approximately 5 weeks pregnant (1 week late). Concerned about her epilepsy and depression medication.",
      "psychosocial_impact": "Excited about pregnancy but terrified about medication risks. Didn''t think about this before trying to conceive.",
      "ice": {
        "ideas": "Read online that some epilepsy drugs cause birth defects",
        "concerns": "Terrified she has already harmed her baby",
        "expectations": "Wants to know if she should stop her medications immediately"
      }
    },
    "history_on_direct_questioning": {
      "pregnancy": {
        "lmp": "5 weeks ago",
        "planned": "Yes - been trying for a year",
        "previous_pregnancies": "None",
        "preconception_counselling": "No - didn''t think to ask"
      },
      "epilepsy": {
        "type": "Generalised tonic-clonic seizures",
        "last_seizure": "2 years ago - well controlled",
        "previous_medications": "Tried lamotrigine previously but didn''t control seizures well",
        "current_control": "Very well controlled on valproate"
      },
      "mental_health": {
        "depression": "History of moderate depression, on sertraline for 3 years",
        "current_state": "Stable, no recent episodes",
        "previous_episodes": "Two episodes in 20s, one requiring time off work"
      },
      "medications": {
        "valproate": "Sodium valproate 500mg twice daily - neurologist started this 4 years ago",
        "sertraline": "100mg daily - GP started 3 years ago",
        "folic_acid": "Only taking 400mcg - started when trying to conceive"
      },
      "fhx": {
        "neural_tube_defects": "None known"
      }
    }
  }',
  'Initially EXCITED about pregnancy but become ANXIOUS and TEARFUL when discussing medications. Look very worried when valproate risks are mentioned. Ask repeatedly "Have I harmed my baby?" Be relieved but still anxious when plan is made. Need reassurance that you''re doing the right thing.',
  'full',
  720,
  'advanced',
  ARRAY['Recognise valproate risk in pregnancy', 'Urgent specialist referral needed', 'Do not abruptly stop medications', 'Higher dose folic acid', 'Sensitive communication', 'Multidisciplinary planning'],
  '## Model Approach

**Critical Issue:**
Sodium valproate is teratogenic with significant risks:
- Neural tube defects (1-2%)
- Other major malformations
- Neurodevelopmental disorders (30-40%)

**MHRA Pregnancy Prevention Programme:**
Valproate should NOT be prescribed to women of childbearing potential unless on PPP

**Immediate Actions:**

1. **Do NOT stop valproate abruptly** (seizure risk)

2. **Urgent referral:**
   - Obstetrics for early dating scan and counselling
   - Neurology for medication review
   - Same-day/next-day priority

3. **Folic acid:**
   - Increase to 5mg daily immediately
   - Should have been on 5mg pre-conception

4. **Sertraline:**
   - Generally considered safer option in pregnancy
   - Continue for now - risk of stopping outweighs risk of medication

**Communication:**
- Honest about risks
- Balanced information (can''t undo exposure, many pregnancies normal)
- Support and empathy
- Clear plan with specialist input',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Confirmed pregnancy details", "Reviewed all medications", "Understood indication for valproate", "Assessed current seizure control", "Reviewed mental health status", "Checked folic acid dose", "Asked about preconception counselling", "Explored what patient knows", "Assessed family history", "Explored patient concerns"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised valproate teratogenicity", "Did not stop valproate abruptly", "Arranged urgent specialist referral", "Increased folic acid to 5mg", "Considered sertraline safety", "Planned multidisciplinary input", "Discussed options honestly", "Arranged early dating scan", "Documented clearly", "Arranged follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Sensitive about medication concerns", "Did not alarm unnecessarily", "Gave balanced information", "Addressed fear about harming baby", "Acknowledged lack of preconception counselling", "Gave hope but honest information", "Offered support", "Handled distress appropriately"]}}'
);

-- =====================================================
-- CASE 18: SAFEGUARD-001 - Safeguarding (Adult)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'SAFEGUARD-001: Unexplained Injuries',
  'Safeguarding',
  'SAFEGUARD-001',
  'You are a GP trainee. Mrs. Angela Price, a 68-year-old woman, has come to see you about "aches and pains." As the consultation progresses, you notice some concerning features.

',
  '{"name": "Mrs. Angela Price", "age": 68, "gender": "Female"}',
  '{"patient": "Mrs. Angela Price", "age": 68, "gender": "Female", "pmh": "Osteoarthritis, Type 2 diabetes, Anxiety", "medications": "Paracetamol, Metformin, Sertraline", "allergies": "None", "social_summary": "Widowed, lives with adult son who is her carer", "family_summary": "N/A"}',
  '{
    "opening_statement": "(Quiet, avoiding eye contact) I just came about my arthritis, doctor. The pain has been worse lately.",
    "freely_given_history": {
      "presenting_complaint": "Says arthritis pain is worse. Seems hesitant and doesn''t elaborate. Keeps looking at the door.",
      "psychosocial_impact": "Seems withdrawn and anxious. Not engaging as would expect.",
      "ice": {
        "ideas": "If asked, says just wants painkillers for arthritis",
        "concerns": "Initially denies any concerns but shows obvious distress",
        "expectations": "Says just wants a prescription"
      }
    },
    "history_on_direct_questioning": {
      "concerning_observations": {
        "appearance": "Bruising visible on both upper arms when adjusts sleeve (finger-mark pattern)",
        "demeanour": "Flinches when you move suddenly, very quiet, won''t make eye contact",
        "accompanied": "Mentions son is waiting in reception"
      },
      "if_asked_about_bruises": {
        "initial_response": "Oh those... I just bumped into the door frame. I''m so clumsy.",
        "if_pressed_gently": "Becomes tearful, says she doesn''t want to talk about it",
        "if_safe_space_created": "(Eventually) Things have been difficult at home. My son gets frustrated with me sometimes."
      },
      "home_situation": {
        "living": "Lives with 42-year-old son who is supposed to be her carer",
        "son": "Son lost his job 6 months ago, been drinking more. Gets angry easily.",
        "financial": "Son controls her pension money",
        "help": "Son is supposed to help with her care but she often goes without meals or medication when he''s been drinking",
        "previous_help": "No - too ashamed to tell anyone, doesn''t want son in trouble"
      },
      "physical_concerns": {
        "other_injuries": "If examined: old yellowing bruises on back, appears unkempt, looks thin",
        "medications": "Sometimes misses diabetes tablets when son forgets to give them",
        "nutrition": "Lost weight recently, not eating regularly"
      },
      "safety": {
        "immediate_danger": "Son is waiting outside. Scared of what he''ll do if he knows she''s talked to doctor",
        "wishes": "Doesn''t want to make a fuss, loves her son, just wants things to go back to how they were"
      }
    }
  }',
  'FRIGHTENED and GUARDED initially. Avoid eye contact, speak quietly. Give inconsistent explanations for injuries. If doctor creates safe, non-judgmental space and shows genuine concern, gradually become more tearful and eventually disclose. Express fear about son finding out. Say "Please don''t report this - he''s my son, he doesn''t mean it." Ask "What will happen to him?"',
  'full',
  720,
  'advanced',
  ARRAY['Recognise indicators of abuse', 'Create safe space for disclosure', 'Ask directly but sensitively', 'Assess immediate safety', 'Understand duty to act', 'Involve safeguarding team'],
  '## Model Approach

**Recognition:**
Indicators of elder abuse/domestic abuse:
- Unexplained injuries (finger-mark bruising)
- Inconsistent explanations
- Appearing frightened
- Withdrawn behaviour
- Evidence of neglect
- Financial control by another

**Approach:**

1. **Create Safety:**
   - See patient alone (son in waiting room)
   - Non-judgmental approach
   - Time and privacy

2. **Direct but Sensitive Inquiry:**
   - "I''ve noticed some bruises. Can you tell me how you got them?"
   - "Has anyone hurt you?"
   - "Do you feel safe at home?"

3. **Assess Immediate Risk:**
   - Is son in waiting room? - Yes
   - Immediate danger if returns home?
   - Any weapons involved?

4. **Safeguarding Actions:**
   - Adult safeguarding referral (duty to report suspected abuse)
   - Document carefully with body map
   - Consider capacity assessment
   - Police involvement if immediate risk

5. **Support Patient:**
   - Explain why you must act
   - Acknowledge her concerns about son
   - Offer practical support
   - Follow-up arrangement

**Key Points:**
- Capacity to make decisions must be considered
- Cannot guarantee confidentiality if abuse suspected
- Duty of care overrides patient''s wish not to report
- Multi-agency approach needed',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Noticed concerning physical signs", "Asked about injuries sensitively", "Created safe space for disclosure", "Asked directly about abuse", "Assessed home situation", "Explored financial abuse", "Assessed nutritional state", "Assessed immediate safety", "Assessed capacity", "Documented findings carefully"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made safeguarding referral", "Understood duty to report", "Assessed immediate safety", "Planned safe discharge", "Considered police involvement", "Documented with body map", "Explained actions to patient", "Arranged follow-up", "Involved MDT", "Addressed medical needs"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Non-judgmental throughout", "Created safe space", "Allowed time for disclosure", "Sensitive to complex feelings about son", "Explained actions compassionately", "Acknowledged fear", "Offered support and hope", "Maintained trust while acting"]}}'
);

-- Additional cases continuing...

-- =====================================================
-- CASE 19: ENT-001 - Ear/Nose/Throat
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'ENT-001: Hearing Difficulty',
  'ENT',
  'ENT-001',
  'You are a GP trainee. Mr. Peter Shaw, a 70-year-old man, has come because his wife says he can''t hear properly. He is reluctant to be here.

',
  '{"name": "Mr. Peter Shaw", "age": 70, "gender": "Male"}',
  '{"patient": "Mr. Peter Shaw", "age": 70, "gender": "Male", "pmh": "Hypertension, Type 2 diabetes", "medications": "Amlodipine 5mg OD, Metformin 500mg BD", "allergies": "None", "social_summary": "Retired engineer, married", "family_summary": "Father was deaf in old age"}',
  '{
    "opening_statement": "(Loudly) The wife made me come. She says I can''t hear but I hear fine. She just mumbles.",
    "freely_given_history": {
      "presenting_complaint": "Wife complains he can''t hear. He disagrees but admits TV volume is an issue at home.",
      "psychosocial_impact": "Causing arguments at home. Wife threatening not to repeat herself anymore.",
      "ice": {
        "ideas": "Thinks wife exaggerates, maybe some wax in ears",
        "concerns": "Doesn''t want to wear hearing aids - makes you look old",
        "expectations": "Hoping you''ll say ears just need syringing"
      }
    },
    "history_on_direct_questioning": {
      "hearing_loss": {
        "onset": "Gradual over several years if he''s honest",
        "laterality": "Both ears, perhaps right worse",
        "type": "Worse for conversation, especially women''s and children''s voices",
        "situations": "Worse in noisy environments like restaurants, when people not facing him",
        "tinnitus": "Some ringing in ears, been there years",
        "vertigo": "No dizziness or balance problems",
        "discharge": "No ear discharge",
        "pain": "No ear pain"
      },
      "impact": {
        "communication": "Misses parts of conversations, says pardon a lot",
        "social": "Avoiding social situations because can''t follow conversation",
        "tv": "TV loud - neighbours have complained",
        "telephone": "Struggles on phone"
      },
      "risk_factors": {
        "noise_exposure": "Worked as engineer - noisy factory environment for 40 years. Didn''t always wear ear protection.",
        "ototoxic_drugs": "No",
        "family_history": "Father went deaf in his 70s"
      },
      "pmh": {
        "ear_problems": "No previous ear surgery or infections",
        "diabetes": "Well controlled"
      },
      "examination": {
        "ears": "If examined: No wax, tympanic membranes normal, Rinne positive bilaterally, Weber midline"
      }
    }
  }',
  'DISMISSIVE and DEFENSIVE at first. Blame wife for mumbling. If doctor persists kindly, gradually admit some difficulty. Express strong reluctance about hearing aids - "I''m not wearing those things." Be more receptive when doctor explains modern hearing aids. Agree to audiology referral reluctantly.',
  'full',
  720,
  'easy',
  ARRAY['Take hearing history', 'Assess impact on life', 'Examine ears', 'Identify presbycusis', 'Address hearing aid concerns', 'Refer to audiology'],
  '## Model Approach

**Diagnosis:** Likely presbycusis (age-related sensorineural hearing loss)
- Gradual onset
- Bilateral
- High-frequency loss pattern (women/children voices)
- Noise exposure history adds risk
- Family history supportive

**Assessment:**
- No red flags (sudden loss, vertigo, discharge)
- Significant impact on function and relationships
- Denial/minimisation common

**Management:**

1. **Examination:**
   - Otoscopy (exclude wax, pathology)
   - Tuning fork tests (Rinne/Weber)

2. **Referral to Audiology:**
   - Hearing assessment
   - Hearing aid fitting if appropriate

3. **Address Concerns:**
   - Modern hearing aids are discreet
   - Explain benefits for relationships and safety
   - Acknowledge reluctance sensitively

4. **Other Measures:**
   - Face person when speaking
   - Reduce background noise
   - Assistive devices (TV listeners)

**Communication:**
- Involve wife''s perspective but patient-centred
- Address vanity concerns non-judgmentally
- Emphasise quality of life benefits',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took systematic hearing history", "Asked about onset and progression", "Assessed both ears", "Asked about tinnitus and vertigo", "Explored noise exposure history", "Assessed functional impact", "Asked about family history", "Examined ears", "Performed tuning fork tests", "Ruled out red flags"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made appropriate diagnosis", "Referred to audiology", "Addressed hearing aid concerns", "Gave communication strategies", "Considered assistive devices", "Ruled out treatable causes", "Explained likely diagnosis", "Arranged follow-up", "Considered safety implications", "Documented appropriately"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Handled denial sensitively", "Did not dismiss concerns", "Addressed vanity worries", "Involved wife appropriately", "Patient-centred approach", "Empathetic about impact", "Clear explanation", "Supportive manner"]}}'
);

-- =====================================================
-- CASE 20: RENAL-001 - Renal/Urology
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'RENAL-001: Abnormal Kidney Function',
  'Renal/Urology',
  'RENAL-001',
  'You are a GP trainee. Mr. David Burton, a 65-year-old man, has been called in to discuss blood test results. His eGFR has come back at 38.

',
  '{"name": "Mr. David Burton", "age": 65, "gender": "Male"}',
  '{"patient": "Mr. David Burton", "age": 65, "gender": "Male", "pmh": "Type 2 diabetes (15 years), Hypertension", "medications": "Metformin 1g BD, Ramipril 10mg OD, Amlodipine 10mg OD, Atorvastatin 40mg OD, Aspirin 75mg OD", "allergies": "None", "social_summary": "Retired accountant, married", "family_summary": "Mother had kidney failure requiring dialysis"}',
  '{
    "opening_statement": "Doctor, I got a letter about my blood tests. It said something about my kidneys? Is that serious?",
    "freely_given_history": {
      "presenting_complaint": "Called in about routine blood tests. eGFR 38 (previous was 52 one year ago). Didn''t know there was a kidney problem.",
      "psychosocial_impact": "Worried because his mother ended up on dialysis.",
      "ice": {
        "ideas": "Thinks kidneys are failing, will need dialysis",
        "concerns": "Very worried about ending up like his mother - dialysis 3 times a week",
        "expectations": "Wants to know how serious it is and what can be done"
      }
    },
    "history_on_direct_questioning": {
      "symptoms": {
        "urinary": "Gets up 2-3 times at night to urinate (always has with prostate)",
        "oedema": "Maybe slight ankle swelling end of day",
        "fatigue": "A bit more tired than usual",
        "itch": "No",
        "nausea": "No",
        "breathlessness": "No"
      },
      "diabetes_control": {
        "hba1c": "Last was 58 (not well controlled)",
        "complications": "Has some tingling in feet, eyes checked annually (mild background retinopathy)"
      },
      "blood_pressure": {
        "home_readings": "Usually around 150/90 despite medications",
        "adherence": "Takes all tablets regularly"
      },
      "pmh": {
        "diabetes": "T2DM for 15 years",
        "hypertension": "10 years",
        "prostate": "Enlarged prostate, on watchful waiting",
        "previous_kidney": "Never told about kidney problems before"
      },
      "dhx": {
        "current": "Metformin, Ramipril, Amlodipine, Atorvastatin, Aspirin",
        "nsaids": "Takes ibuprofen occasionally for back pain - maybe once or twice a week",
        "recent_changes": "No recent changes"
      },
      "investigations_available": {
        "egfr": "Current: 38, One year ago: 52, Two years ago: 58",
        "urine_acr": "65 mg/mmol (elevated)",
        "potassium": "5.2 (slightly elevated)"
      }
    }
  }',
  'WORRIED but engaged. Listen carefully when kidney function explained. Look particularly concerned when mother''s dialysis mentioned. Ask "Am I going to need dialysis?" Be relieved when told about slowing progression. Ask what you can do to help your kidneys.',
  'full',
  720,
  'intermediate',
  ARRAY['Explain CKD staging clearly', 'Identify causes (diabetes, HTN)', 'Explain ACE inhibitor role', 'Avoid nephrotoxins (NSAIDs)', 'Optimise BP and diabetes', 'Plan monitoring'],
  '## Model Approach

**Assessment:**
- CKD Stage 3b (eGFR 30-44)
- Progressive (eGFR falling: 58→52→38 over 2 years)
- Likely diabetic nephropathy (long-standing T2DM + proteinuria)
- Contributing factors: suboptimal BP, NSAID use

**Key Findings:**
- eGFR 38 (stage 3b CKD)
- Proteinuria (ACR 65)
- Declining trajectory
- Potassium slightly elevated
- Background retinopathy (microvascular disease)

**Management:**

1. **Explain Clearly:**
   - What eGFR means
   - Current stage (moderate reduction)
   - Not imminent dialysis but needs attention

2. **Optimise BP:**
   - Target <130/80 in CKD with proteinuria
   - May need medication adjustment
   - Continue ACE inhibitor (renoprotective)

3. **Stop Nephrotoxins:**
   - Stop ibuprofen completely
   - Avoid NSAIDs
   - Sick day rules for Ramipril and Metformin

4. **Optimise Diabetes:**
   - HbA1c target 48-58
   - Consider SGLT2i (additional renal protection)

5. **Monitor:**
   - 3-monthly eGFR initially
   - Watch potassium (on ACE inhibitor)
   - Renal ultrasound if not done

6. **Lifestyle:**
   - Salt restriction
   - Healthy weight
   - Stop smoking if applicable

**Referral:**
- Consider nephrology if rapid decline or eGFR <30',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Reviewed trajectory of eGFR", "Identified CKD stage", "Asked about urinary symptoms", "Asked about oedema", "Identified likely cause (diabetic)", "Reviewed BP control", "Identified NSAID use", "Reviewed diabetes control", "Checked current medications", "Explored family history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained findings clearly", "Stopped nephrotoxins (NSAIDs)", "Optimised BP management", "Continued ACE inhibitor", "Considered SGLT2i", "Explained sick day rules", "Planned monitoring", "Considered nephrology referral", "Addressed lifestyle", "Documented appropriately"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Addressed dialysis fears", "Gave realistic reassurance", "Explained without alarming", "Empowered patient with actions", "Clear explanation of CKD", "Addressed family history concerns", "Checked understanding", "Supportive approach"]}}'
);
