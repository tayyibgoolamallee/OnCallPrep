-- Final Comprehensive SCA Cases with Full Actor Scripts
-- Cases 21-30

-- =====================================================
-- CASE 21: RHEUM-001 - Rheumatology (Acute Joint)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'RHEUM-001: Hot Swollen Joint',
  'Rheumatology',
  'RHEUM-001',
  'You are a GP trainee. Mr. William Foster, a 55-year-old man, has telephoned urgently about a painful swollen knee that developed overnight.

',
  '{"name": "Mr. William Foster", "age": 55, "gender": "Male"}',
  '{"patient": "Mr. William Foster", "age": 55, "gender": "Male", "pmh": "Gout (one previous episode), Type 2 diabetes, Hypertension", "medications": "Bendroflumethiazide 2.5mg OD, Lisinopril 20mg OD, Metformin 1g BD", "allergies": "Penicillin", "social_summary": "Pub landlord, heavy alcohol", "family_history": "Father had gout"}',
  '{
    "opening_statement": "(In pain) Doctor, my knee is killing me. It blew up overnight and I can''t put any weight on it. I think it might be my gout again.",
    "freely_given_history": {
      "presenting_complaint": "Woke with severely painful, swollen right knee. Came on overnight. Can''t walk on it.",
      "psychosocial_impact": "Can''t work - runs a pub. In agony, hasn''t slept.",
      "ice": {
        "ideas": "Thinks it''s gout flare up like he had 2 years ago",
        "concerns": "Worried he won''t be able to work this weekend (busy pub)",
        "expectations": "Wants strong painkillers and quick fix"
      }
    },
    "history_on_direct_questioning": {
      "presenting_complaint": {
        "joint_affected": "Right knee",
        "onset": "Woke up at 4am with it, was fine when went to bed",
        "severity": "10/10 pain, excruciating",
        "swelling": "Very swollen, hot to touch",
        "redness": "Yes - looks red",
        "movement": "Can''t bend it or put weight on it",
        "other_joints": "No other joints affected"
      },
      "systemic_features": {
        "fever": "Feels a bit hot, maybe feverish",
        "unwell": "Feels generally unwell",
        "rigors": "No shaking/rigors"
      },
      "history": {
        "previous_gout": "Had gout in big toe 2 years ago, was given colchicine",
        "recent_illness": "Had a cold last week, otherwise well",
        "trauma": "No injury to knee",
        "skin_break": "No recent cuts or wounds near knee",
        "recent_surgery": "No"
      },
      "risk_factors": {
        "diabetes": "Type 2, on Metformin, HbA1c was 62 last time",
        "immunosuppression": "No",
        "joint_replacement": "No prosthetic joints"
      },
      "pmh": {
        "gout": "One episode 2 years ago",
        "diabetes": "T2DM 5 years",
        "hypertension": "On bendroflumethiazide"
      },
      "dhx": {
        "regular": "Bendroflumethiazide (can precipitate gout), Lisinopril, Metformin",
        "recent": "No recent antibiotics"
      },
      "social_hx": {
        "occupation": "Pub landlord",
        "alcohol": "Heavy - probably 40-50 units/week",
        "diet": "Pub food, steaks, rich food"
      }
    }
  }',
  'IN SIGNIFICANT PAIN. Wince when describing symptoms. Want quick fix - "Just give me something for the pain, doc." If told needs urgent assessment, initially resist - "Can''t you just give me what I had last time?" Accept when explained why this is different and potentially serious.',
  'full',
  720,
  'intermediate',
  ARRAY['Differentiate gout from septic arthritis', 'Recognise red flags', 'Urgent assessment needed', 'Cannot assume gout', 'Appropriate analgesia', 'Safety-netting'],
  '## Model Approach

**Critical Question:** Is this septic arthritis?

**Cannot Assume Gout Because:**
- Hot, swollen joint could be septic arthritis until proven otherwise
- Septic arthritis is a medical emergency (joint destruction within hours)
- Diabetes = risk factor for septic arthritis
- Systemic features (fever, unwell) present

**Red Flags for Septic Arthritis:**
- Fever ✓
- Hot, red, swollen joint ✓
- Unable to weight bear ✓
- Systemically unwell ✓
- Immunocompromised (diabetes) ✓

**Management:**

1. **Same-day urgent assessment:**
   - Cannot exclude septic arthritis remotely
   - Needs joint aspiration
   - Refer to acute medical unit or A&E

2. **Explain urgency:**
   - "While this could be gout, we need to make sure it''s not an infected joint"
   - Joint infection can cause permanent damage

3. **Do NOT:**
   - Treat empirically as gout without examination
   - Give steroids (could mask septic arthritis)
   - Delay referral

4. **Analgesia:**
   - Paracetamol is safe
   - NSAIDs cautious (diabetes, renal)
   - Avoid oral steroids until diagnosis confirmed',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established acute monoarthritis", "Asked about systemic features", "Identified fever", "Asked about ability to weight-bear", "Explored diabetes as risk factor", "Asked about recent illness/skin break", "Differentiated from previous gout", "Assessed for red flags", "Took medication history", "Identified thiazide as gout risk"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised need to exclude septic arthritis", "Did not assume gout", "Arranged urgent assessment", "Did not give oral steroids", "Gave appropriate analgesia advice", "Explained urgency clearly", "Did not delay for GP examination", "Safety-netted appropriately", "Considered aspiration need", "Documented rationale"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Addressed pain concerns", "Explained why urgent referral needed", "Didn''t dismiss as just gout", "Handled resistance appropriately", "Clear communication", "Empathetic about pain", "Addressed work concerns", "Maintained urgency without alarming"]}}'
);

-- =====================================================
-- CASE 22: IMG-001 - IMG Specific (Communication)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'IMG-001: Breaking Bad News',
  'Communication Skills',
  'IMG-001',
  'You are a GP trainee. Mrs. Patricia Moore, a 58-year-old woman, has come to discuss results of investigations for weight loss and fatigue. The CT scan has shown a pancreatic mass with liver metastases, highly suggestive of cancer.

',
  '{"name": "Mrs. Patricia Moore", "age": 58, "gender": "Female"}',
  '{"patient": "Mrs. Patricia Moore", "age": 58, "gender": "Female", "pmh": "No significant past history", "medications": "None regular", "allergies": "None", "social_summary": "Retired nurse, married, 2 adult children", "family_summary": "Mother died of breast cancer"}',
  '{
    "opening_statement": "Hello doctor. I''ve come for my results. I''ve been quite worried actually.",
    "freely_given_history": {
      "presenting_complaint": "Had investigations for 6 months of weight loss and tiredness. CT scan was done last week.",
      "psychosocial_impact": "Has been anxious waiting for results. Husband is with her in the waiting room.",
      "ice": {
        "ideas": "Suspects it might be something serious - she was a nurse",
        "concerns": "Worried it could be cancer - saw her mother die from it",
        "expectations": "Wants to know the truth, wants husband to come in if it''s bad news"
      }
    },
    "history_on_direct_questioning": {
      "what_she_knows": {
        "investigations": "Knows she had CT because bloods showed something wrong with liver",
        "suspicions": "Has suspected cancer for a while - the weight loss, the fatigue, the look on the GP''s face last time"
      },
      "if_asked_about_husband": {
        "response": "Yes please, can he come in? I''d rather he heard this with me."
      },
      "reaction_to_news": {
        "initial": "Goes quiet, tears, then asks practical questions",
        "questions_she_asks": [
          "Is it definitely cancer?",
          "How long do I have?",
          "Is there any treatment?",
          "Will I suffer?",
          "Who do I see next?"
        ]
      },
      "coping": {
        "support": "Strong relationship with husband, close to children",
        "faith": "Some faith, finds it comforting",
        "previous_loss": "Watched mother die - knows what terminal cancer looks like"
      }
    }
  }',
  'Initially ANXIOUS but COMPOSED. Ask if husband can come in before you give results. When cancer is confirmed, become QUIET and TEARFUL. Ask questions in measured way - you are a retired nurse and want clear information. Don''t want platitudes. Ask directly "Am I going to die from this?" Show appreciation for honest, compassionate communication.',
  'full',
  720,
  'advanced',
  ARRAY['Use SPIKES framework', 'Ask about having support present', 'Establish understanding first', 'Give warning shot', 'Deliver news clearly', 'Allow silence and emotion'],
  '## Model Approach

**SPIKES Framework:**

**S - Setting:**
- Private room, no interruptions
- Tissues available
- Offer husband to be present

**P - Perception:**
- "What have you been told so far?"
- "What are you expecting these results might show?"
- She suspects cancer - builds on this

**I - Invitation:**
- "Would you like me to explain what the scan showed?"
- "How much detail would you like me to go into?"

**K - Knowledge:**
- Warning shot: "I''m afraid the results aren''t what we were hoping for"
- Clear language: "The scan shows there is a growth in the pancreas and some spots on the liver. I''m very sorry to tell you this appears to be cancer."
- Pause - allow reaction

**E - Emotions:**
- Acknowledge: "This is devastating news, I''m so sorry"
- Allow silence
- Offer tissues
- Validate feelings

**S - Strategy/Summary:**
- Only when she''s ready
- Explain next steps (oncology referral)
- Answer questions honestly but with sensitivity
- "How long" - be honest about uncertainty
- Offer follow-up appointment
- Written information
- Contact details

**Key Points:**
- Do not rush
- Silence is okay
- Answer questions honestly
- Do not give false hope but do not remove all hope
- Acknowledge when you don''t know
- Ensure support is in place before she leaves',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored what she already knows", "Asked about expectations", "Offered support person to be present", "Assessed understanding", "Asked how much detail she wants", "Explored coping resources", "Assessed immediate support", "Asked about questions", "Checked understanding of news", "Assessed emotional state"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Delivered news clearly", "Used appropriate language", "Gave warning shot", "Allowed time and silence", "Answered questions honestly", "Explained next steps", "Arranged oncology referral", "Offered follow-up", "Gave contact details", "Documented sensitively"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Compassionate throughout", "Allowed silence", "Did not rush", "Acknowledged emotion", "Offered tissues/comfort", "Honest but sensitive", "Did not give false hope", "Treated with dignity", "Involved husband appropriately", "Showed humanity"]}}'
);

-- =====================================================
-- CASE 23: OCCUPATIONAL-001 - Occupational Health
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'OCCUPATIONAL-001: Fit Note Request',
  'Occupational Health',
  'OCCUPATIONAL-001',
  'You are a GP trainee. Mr. Simon Blake, a 38-year-old man, has come requesting a sick note. He says he cannot work due to "stress."

',
  '{"name": "Mr. Simon Blake", "age": 38, "gender": "Male"}',
  '{"patient": "Mr. Simon Blake", "age": 38, "gender": "Male", "pmh": "No significant history", "medications": "None", "allergies": "None", "social_summary": "Team leader at call centre, married with one child", "family_summary": "Nothing significant"}',
  '{
    "opening_statement": "Doctor, I need a sick note. I can''t go back to that place. Work is making me ill.",
    "freely_given_history": {
      "presenting_complaint": "Feels stressed and anxious due to work. Has been off for 2 weeks already (self-certificated). Wants another 4 weeks off.",
      "psychosocial_impact": "Dreads going to work. Not sleeping well. Snappy with wife and child. Feels hopeless about the situation.",
      "ice": {
        "ideas": "Thinks he needs time off to recover",
        "concerns": "Worried about losing his job, but more worried about going back",
        "expectations": "Wants a 4-week sick note for stress"
      }
    },
    "history_on_direct_questioning": {
      "work_situation": {
        "job": "Team leader at call centre for 5 years",
        "issue": "New manager started 6 months ago, very demanding, unrealistic targets, micromanages, criticises in front of team",
        "escalation": "Has raised concerns with HR but nothing changed",
        "colleagues": "Others feel the same, two have already left",
        "previous_enjoyment": "Used to love job, been there 5 years with good record"
      },
      "mental_state": {
        "mood": "Low mood, especially when thinks about work",
        "anxiety": "Anxious, especially Sunday evenings, physical symptoms (palpitations, sweating)",
        "sleep": "Poor - wakes at 4am worrying about work",
        "concentration": "Poor concentration",
        "appetite": "Eating more (comfort eating)",
        "anhedonia": "Can still enjoy things outside of work",
        "suicidal": "No suicidal thoughts or self-harm"
      },
      "functioning": {
        "home": "Fine at home when not thinking about work",
        "outside_work": "Can go out, see friends, activities normal",
        "symptoms_when": "Symptoms all related to work or anticipation of work"
      },
      "previous_sick_leave": {
        "time_off": "Off for 2 weeks so far (self-cert), now needs fit note",
        "effect": "Felt better after first week, but anxious about returning"
      },
      "what_would_help": {
        "thoughts": "Doesn''t know - maybe change of department or leaving altogether"
      }
    }
  }',
  'STRESSED and DESPERATE. Speak quickly about work problems. Look genuinely distressed when describing manager. If doctor explores properly, become more reflective. Be ambivalent about whether time off is the answer. Be open to suggestions about workplace adjustments.',
  'full',
  720,
  'intermediate',
  ARRAY['Distinguish work stress from clinical disorder', 'Assess mental health properly', 'Consider fit note options', 'May be fit with adjustments', 'Avoid prolonged sick leave pitfalls', 'Signpost appropriately'],
  '## Model Approach

**Assessment:**
This is work-related stress with adjustment reaction, not clinical depression:
- Symptoms context-specific (work-related)
- No anhedonia outside work
- No suicidal ideation
- Normal functioning outside work
- Clear workplace precipitant

**Fit Note Options:**

1. **Not fit for work** - traditional sick note
2. **May be fit for work** with adjustments:
   - Phased return
   - Altered hours
   - Amended duties
   - Workplace adaptations

**Approach:**

1. **Validate experience** - workplace bullying is real and harmful

2. **Assess mental health properly** - not depression requiring medication

3. **Discuss fit note options:**
   - Long sick leave can worsen anxiety about return
   - "May be fit" note allows workplace adjustments
   - Empowers employer to make reasonable changes

4. **Practical suggestions:**
   - Formal grievance if not already done
   - Occupational health referral
   - ACAS advice
   - Consider union involvement

5. **Support:**
   - Self-help resources for anxiety
   - Consider counselling
   - Follow-up to review

**Fit Note Decision:**
May be fit - with phased return, reduced hours initially, meeting with HR about concerns',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored work situation in detail", "Assessed mental state properly", "Distinguished stress from depression", "Asked about suicidal thoughts", "Assessed functioning outside work", "Explored what has been tried", "Asked about previous sick leave", "Explored expectations", "Assessed workplace factors", "Considered adjustment disorder"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Considered fit note options", "Discussed may be fit with adjustments", "Explained risks of prolonged absence", "Suggested workplace interventions", "Offered appropriate support", "Considered OH referral", "Didn''t just issue sick note", "Explored solutions", "Arranged follow-up", "Documented appropriately"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Validated his distress", "Did not dismiss as not a real problem", "Explored options collaboratively", "Empathetic approach", "Did not lecture about work", "Balanced support with practical advice", "Empowered patient", "Clear explanation of options"]}}'
);

-- =====================================================
-- CASE 24: CHRONIC-001 - Chronic Disease Management
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'CHRONIC-001: COPD Exacerbation Management',
  'Chronic Disease',
  'CHRONIC-001',
  'You are a GP trainee. Mrs. Barbara Clark, a 67-year-old woman with COPD, has called requesting a home visit. She says her breathing has got worse over the past few days.

This is a telephone consultation before deciding on management.',
  '{"name": "Mrs. Barbara Clark", "age": 67, "gender": "Female"}',
  '{"patient": "Mrs. Barbara Clark", "age": 67, "gender": "Female", "pmh": "COPD (severe - FEV1 35%), Previous exacerbations requiring hospital", "medications": "Fostair 200/6 2 puffs BD, Spiriva 18mcg OD, Ventolin PRN, Carbocisteine 750mg TDS", "allergies": "None", "social_summary": "Widowed, lives alone, ex-smoker, daughter lives nearby", "family_summary": "N/A"}',
  '{
    "opening_statement": "(Breathless on phone) Doctor... I''m struggling today... my breathing is worse... can someone come out?",
    "freely_given_history": {
      "presenting_complaint": "Breathing worse for 3 days. More sputum than usual, changed colour. Using Ventolin more but not helping.",
      "psychosocial_impact": "Scared she''ll end up in hospital again. Last admission was awful.",
      "ice": {
        "ideas": "Thinks she has a chest infection",
        "concerns": "Doesn''t want to go to hospital",
        "expectations": "Hoping for antibiotics and steroids to start at home"
      }
    },
    "history_on_direct_questioning": {
      "current_symptoms": {
        "breathlessness": "Much worse than usual - getting breathless walking to kitchen",
        "baseline": "Usually can walk around house and to front gate, today struggling to move around flat",
        "sputum": "More than usual, changed from white to green",
        "cough": "Worse cough, productive",
        "wheeze": "Yes, can hear herself wheezing",
        "chest_pain": "No chest pain",
        "fever": "Feels a bit hot, hasn''t checked temperature"
      },
      "severity_markers": {
        "speaking": "Can speak in short sentences",
        "confusion": "No confusion, alert and oriented",
        "cyanosis": "Lips not blue (checked in mirror)",
        "inhaler_use": "Using Ventolin every 2 hours, not lasting",
        "oxygen": "Has home oxygen but only uses at night usually"
      },
      "exacerbation_history": {
        "frequency": "2-3 exacerbations per year",
        "previous_admissions": "Admitted once last year for 5 days",
        "rescue_pack": "Has rescue pack at home but hasn''t started it - wasn''t sure if should",
        "rescue_pack_contents": "Prednisolone 30mg and Amoxicillin"
      },
      "pmh": {
        "copd_severity": "Severe COPD, FEV1 35% last time checked",
        "other": "No heart failure, no diabetes"
      },
      "social": {
        "living": "Alone but daughter lives 5 minutes away",
        "coping": "Can manage basic needs but struggling today",
        "support": "Daughter can come over"
      }
    }
  }',
  'BREATHLESS - pause between sentences. Sound worried but not panicked. Express strong preference to stay at home - "I really don''t want to go to hospital, doctor." Be relieved when rescue pack option discussed. Ask if daughter should come over.',
  'full',
  720,
  'intermediate',
  ARRAY['Assess severity over phone', 'Identify exacerbation', 'Use rescue pack appropriately', 'Decide admission vs home', 'Safety-netting critical', 'Arrange follow-up'],
  '## Model Approach

**Telephone Assessment:**

**Severity Assessment:**
- Can speak in sentences ✓
- Not confused ✓
- No cyanosis ✓
- Increased work of breathing but managing
- Has support available
- Moderate exacerbation - likely manageable at home

**Red Flags Absent:**
- Severe breathlessness at rest
- Confusion or drowsiness
- Cyanosis
- Inability to speak
- Failure to respond to inhaler
- Living alone with no support

**Management - Home with Rescue Pack:**

1. **Start rescue pack:**
   - Prednisolone 30mg daily for 5 days
   - Amoxicillin as per pack

2. **Optimise inhalers:**
   - Increase Ventolin to 4-6 puffs via spacer, 4-hourly
   - Continue regular inhalers

3. **Home oxygen:**
   - Use if has it and oxygen levels low

4. **Support:**
   - Daughter to come over
   - Someone should check on her

5. **Safety-netting (crucial):**
   - Call 999 if: lips blue, can''t speak, confused, not improving
   - Review in 24-48 hours (visit or phone)

**Documentation:**
- Thorough phone assessment documented
- Safety-net clearly communicated
- Review arranged',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed breathlessness severity", "Established baseline function", "Asked about sputum change", "Checked for confusion", "Asked about cyanosis", "Assessed speech ability", "Asked about inhaler response", "Checked rescue pack availability", "Explored social support", "Asked about exacerbation history"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Made appropriate severity assessment", "Activated rescue pack", "Gave inhaler advice", "Considered oxygen", "Arranged social support", "Gave clear safety-netting", "Explained when to call 999", "Arranged follow-up", "Avoided unnecessary admission", "Documented thoroughly"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Calm and reassuring", "Addressed hospital fears", "Empowered home management", "Clear instructions despite breathlessness", "Checked understanding", "Involved daughter", "Supportive approach", "Gave confidence to manage"]}}'
);

-- =====================================================
-- CASE 25: LEARNING-001 - Learning Disability
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'LEARNING-001: Health Check Adjustment',
  'Learning Disability',
  'LEARNING-001',
  'You are a GP trainee. Mr. Michael Thomas, a 35-year-old man with moderate learning disability, has come for his annual health check. He is accompanied by his support worker, Jane.

',
  '{"name": "Mr. Michael Thomas", "age": 35, "gender": "Male", "accompanied_by": "Support worker Jane"}',
  '{"patient": "Mr. Michael Thomas", "age": 35, "gender": "Male", "pmh": "Moderate learning disability, Epilepsy, Obesity (BMI 35)", "medications": "Sodium valproate 500mg BD", "allergies": "None known", "social_summary": "Lives in supported accommodation, attends day centre", "family_summary": "N/A"}',
  '{
    "opening_statement": "(Michael looks at floor) Jane told me I have to come here. (Jane: He''s a bit nervous about doctors.)",
    "freely_given_history": {
      "presenting_complaint": "Annual learning disability health check. Michael seems reluctant to engage initially.",
      "psychosocial_impact": "Dislikes hospitals and doctors - had bad experience as child. Jane is his regular support worker.",
      "from_support_worker": {
        "concerns": "Michael has been more tired lately. Eating more than usual. Constipation has been an issue.",
        "medications": "Takes his epilepsy tablets regularly - no seizures for 2 years",
        "changes": "Nothing major but staff have noticed he seems more withdrawn"
      }
    },
    "history_on_direct_questioning": {
      "if_speaking_to_michael_directly": {
        "how_feeling": "I''m okay (looks at Jane for reassurance)",
        "any_pain": "No... my tummy hurts sometimes",
        "eating": "I like food. Chips are my favourite",
        "toilet": "I don''t like going. It hurts sometimes (constipation)",
        "sleep": "I sleep okay. Sometimes I''m tired",
        "happy_sad": "I''m happy at my house. I don''t like coming here"
      },
      "from_support_worker": {
        "mood": "He seemed a bit flat recently - less interested in his usual activities",
        "behaviour": "No challenging behaviour",
        "seizures": "Last seizure 2 years ago",
        "medication_side_effects": "Has gained weight - valproate probably contributing",
        "constipation": "Ongoing issue - not drinking enough, diet could be better",
        "annual_checks": "Eyes and hearing not checked for 2 years, BP and bloods not done recently"
      },
      "examination": {
        "weight": "BMI 35",
        "bp": "145/92",
        "thyroid": "Needs blood test",
        "abdo": "Soft, faecal loading palpable"
      }
    }
  }',
  'MICHAEL: Anxious initially - avoid eye contact, give short answers. Brighten up if doctor speaks kindly and directly to you (not just to Jane). Like it when doctor asks about your interests. Be proud when talking about your art at day centre.

JANE: Helpful and informative. Gently prompt Michael to answer when he can. Fill in gaps when needed. Advocate for his needs.',
  'full',
  720,
  'intermediate',
  ARRAY['Adapt communication appropriately', 'Speak to patient not just carer', 'Use easy-read concepts', 'Complete LD health check systematically', 'Consider consent capacity', 'Address specific LD health needs'],
  '## Model Approach

**Communication Adaptations:**
- Speak directly to Michael
- Use simple, clear language
- Allow extra time for responses
- Use concrete questions
- Check understanding
- Visual aids if available
- Include support worker appropriately

**LD Health Check Components:**

1. **Physical Health:**
   - Weight/BMI - obesity (35) - needs addressing
   - BP - elevated (145/92) - monitor
   - Constipation - common in LD - address
   - Dysphagia risk - assess
   - Epilepsy review - well controlled

2. **Sensory:**
   - Vision check - arrange if overdue
   - Hearing check - arrange

3. **Medication:**
   - Valproate side effects (weight gain, constipation)
   - Compliance - good

4. **Mental Health:**
   - Possible low mood - needs assessment
   - Baseline behaviour comparison

5. **Lifestyle:**
   - Diet and exercise
   - Sexual health if appropriate
   - Social engagement

6. **Screening:**
   - Annual bloods (TFTs, FBC, LFTs)
   - Age-appropriate cancer screening

7. **Health Action Plan:**
   - Easy-read document
   - Agreed goals
   - Who does what

**Management:**
- Address constipation (fluids, fibre, laxatives)
- Weight management plan
- Monitor BP
- Bloods: TFTs, HbA1c, lipids, LFTs
- Arrange sensory checks
- Explore low mood further',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Spoke directly to patient", "Adapted communication", "Used support worker appropriately", "Covered LD health check areas", "Asked about epilepsy control", "Explored constipation", "Assessed mood sensitively", "Checked sensory screening", "Reviewed medications", "Examined appropriately"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Addressed constipation", "Planned weight management", "Monitored BP appropriately", "Arranged blood tests", "Arranged sensory checks", "Considered valproate side effects", "Created health action plan", "Involved patient in decisions", "Arranged follow-up", "Coordinated with support team"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Adapted to patient needs", "Reduced anxiety successfully", "Spoke to Michael directly", "Used appropriate language", "Allowed time for responses", "Showed respect and dignity", "Involved support worker correctly", "Made consultation positive experience"]}}'
);

-- =====================================================
-- CASE 26: DOMESTIC-001 - Domestic Abuse
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'DOMESTIC-001: Hidden Presentation',
  'Safeguarding',
  'DOMESTIC-001',
  'You are a GP trainee. Mrs. Rachel Green, a 34-year-old woman, has come requesting sleeping tablets. As the consultation progresses, you become concerned about her home situation.

',
  '{"name": "Mrs. Rachel Green", "age": 34, "gender": "Female"}',
  '{"patient": "Mrs. Rachel Green", "age": 34, "gender": "Female", "pmh": "Anxiety (5 years), Previous depression", "medications": "Sertraline 100mg OD", "allergies": "None", "social_summary": "Married, 2 children (ages 5 and 7), part-time admin job", "family_summary": "N/A"}',
  '{
    "opening_statement": "(Nervous, looking at phone) Hi doctor, I just need something to help me sleep. I''ve been really struggling.",
    "freely_given_history": {
      "presenting_complaint": "Not sleeping well for months. Anxious, can''t relax, wakes with every noise.",
      "psychosocial_impact": "Exhausted, struggling at work, short-tempered with kids, feels trapped.",
      "ice": {
        "ideas": "Thinks sleeping tablets might help her cope",
        "concerns": "Won''t disclose initially, but worried about safety",
        "expectations": "Hoping for quick prescription"
      }
    },
    "history_on_direct_questioning": {
      "sleep_history": {
        "pattern": "Can''t fall asleep until husband is asleep. Wakes at every noise. Hypervigilant.",
        "nightmares": "Bad dreams about arguments"
      },
      "concerning_observations": {
        "appearance": "Wearing long sleeves despite warm weather",
        "demeanour": "Jumpy, checks phone frequently, looks at door",
        "bruises": "If asked to examine - bruises on upper arms, old bruise on ribcage"
      },
      "if_asked_sensitively_about_home": {
        "initial_response": "Everything is fine at home (looks away)",
        "if_safe_space_created": "(tearful) Things haven''t been good with my husband...",
        "disclosure": "He has a temper. Pushes me sometimes. Has grabbed my arms. Last week he threw something at me.",
        "escalation": "Getting worse. Started after he lost his job 6 months ago.",
        "children": "He hasn''t hurt the children but they''ve seen things. They''re scared of him when he''s angry."
      },
      "safety_assessment": {
        "frequency": "Several times a month, sometimes weekly",
        "weapons": "No weapons",
        "threats_to_kill": "Has said ''I''ll kill you'' in anger but she thinks he doesn''t mean it",
        "strangulation": "No",
        "sexual_abuse": "Won''t say, looks away",
        "control": "Checks her phone, questions where she goes, controls money"
      },
      "support": {
        "family": "Parents live nearby but she hasn''t told them - too ashamed",
        "friends": "One friend knows something is wrong but not the full picture",
        "previous_help": "Has never talked to anyone about this before"
      },
      "current_safety": {
        "husband_whereabouts": "At home with children while she''s here",
        "danger_today": "Not immediate danger but scared of his reaction if he finds out she''s talked"
      }
    }
  }',
  'GUARDED initially. Give vague answers about sleep. Look at phone nervously. If doctor asks directly and sensitively about safety at home, become tearful but relieved. Say "I''ve never told anyone this before." Express fear about husband finding out. Ask "What will happen to my children?"',
  'full',
  720,
  'advanced',
  ARRAY['Recognise domestic abuse indicators', 'Ask directly but sensitively', 'Assess safety and risk', 'Know local referral pathways', 'Consider children (safeguarding)', 'Document carefully and safely'],
  '## Model Approach

**Recognition:**
Indicators of domestic abuse:
- Hypervigilant/jumpy
- Checking phone
- Vague about home life
- Unexplained injuries
- Controlling partner
- Sleep disturbance pattern (hypervigilant at night)

**Approach:**

1. **Create Safe Space:**
   - See alone (ensure partner not in waiting room)
   - Direct question when appropriate: "Are you safe at home?"
   - Non-judgmental response

2. **Risk Assessment (DASH-RIC):**
   - Frequency and severity
   - Escalation
   - Strangulation (high risk factor)
   - Threats to kill
   - Control and coercion
   - Sexual abuse
   - Pregnancy (if applicable)

3. **Immediate Safety:**
   - Is she safe to go home today?
   - Are children safe?
   - Does he know she''s disclosed?

4. **Children:**
   - Witnessing abuse is harm
   - May need safeguarding referral
   - Discuss with her

5. **Support and Resources:**
   - National DV helpline (24hr)
   - Local domestic abuse services
   - MARAC referral if high risk
   - Signpost but don''t push

6. **Documentation:**
   - Detailed, factual
   - Mark as confidential
   - Body map if injuries seen
   - Consider coding carefully

7. **Follow-up:**
   - Safe way to contact
   - Codeword for appointments',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Recognised concerning indicators", "Asked about home safety directly", "Created safe space for disclosure", "Assessed nature of abuse", "Asked about escalation", "Asked about strangulation", "Assessed risk to children", "Explored control and coercion", "Assessed immediate safety", "Asked about support network"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Knew local DV resources", "Offered helpline numbers", "Considered MARAC referral", "Addressed children safeguarding", "Did not give sleeping tablets in isolation", "Made safe documentation", "Considered coding carefully", "Arranged safe follow-up", "Respected her autonomy", "Didn''t pressure to leave"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Created safe non-judgmental space", "Asked sensitively", "Believed disclosure", "Did not blame or judge", "Empowered rather than directed", "Acknowledged fear", "Gave hope", "Compassionate throughout"]}}'
);

-- =====================================================
-- CASE 27: MUS-001 - Medically Unexplained Symptoms
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'MUS-001: Multiple Symptoms',
  'Medically Unexplained Symptoms',
  'MUS-001',
  'You are a GP trainee. Mrs. Karen White, a 45-year-old woman, has come with multiple symptoms. Looking at her records, you see she has had numerous investigations over the past 2 years, all normal.

',
  '{"name": "Mrs. Karen White", "age": 45, "gender": "Female"}',
  '{"patient": "Mrs. Karen White", "age": 45, "gender": "Female", "pmh": "IBS, Fibromyalgia, Chronic fatigue, Multiple GP consultations", "medications": "Amitriptyline 10mg nocte, Paracetamol", "allergies": "Codeine (nausea)", "social_summary": "Divorced, works part-time, lives alone", "family_summary": "Mother had similar issues"}',
  '{
    "opening_statement": "Doctor, I know I''ve been here a lot but I really need your help. I''ve got new symptoms and I''m worried something is being missed.",
    "freely_given_history": {
      "presenting_complaint": "New symptoms of tingling in hands, dizziness, and feeling like her heart is racing. Previous symptoms still ongoing (fatigue, widespread pain, bloating).",
      "psychosocial_impact": "Can''t work full-time anymore, relationship broke down, feels nobody believes her.",
      "ice": {
        "ideas": "Worried she has MS or a heart condition",
        "concerns": "Feels doctors think she''s making it up, worried something serious is being missed",
        "expectations": "Wants new tests - MRI, heart scan"
      }
    },
    "history_on_direct_questioning": {
      "current_symptoms": {
        "tingling": "Both hands, comes and goes, no pattern, no weakness",
        "dizziness": "Light-headed, not room-spinning, worse when stressed",
        "palpitations": "Awareness of heart beating, has checked pulse - regular at 80",
        "ongoing": "Fatigue, widespread pain, bloating, headaches - all longstanding"
      },
      "previous_investigations": {
        "bloods": "Multiple FBC, TFTs, B12, glucose, ANA, ESR - all normal",
        "imaging": "Abdo USS, CT head (2 years ago) - normal",
        "cardiology": "ECG normal, echo normal 1 year ago",
        "neurology": "Nerve conduction studies - normal",
        "gastro": "Endoscopy 2 years ago - normal"
      },
      "pattern": {
        "onset": "Symptoms started around time of divorce 3 years ago",
        "course": "New symptoms keep appearing, old ones persist",
        "relief": "Nothing really helps"
      },
      "mental_health": {
        "mood": "Gets low when symptoms are bad",
        "anxiety": "Worries a lot about health, checks body for symptoms",
        "sleep": "Poor due to pain and worry",
        "previous": "Was told might be depressed but doesn''t think so"
      },
      "psychosocial": {
        "divorce": "Difficult divorce 3 years ago, felt abandoned",
        "work": "Had to reduce hours due to symptoms",
        "support": "Few friends, mother has similar issues"
      }
    }
  }',
  'FRUSTRATED but GENUINE. You truly believe something is wrong. Become defensive if feel dismissed - "I''m not making this up." Soften if doctor takes symptoms seriously and explains them. Be cautiously interested if mind-body connection explored without feeling blamed. Express relief if validated.',
  'full',
  720,
  'advanced',
  ARRAY['Avoid unnecessary investigation', 'Validate symptoms as real', 'Explain mind-body connection', 'Don''t dismiss or collude', 'Positive diagnosis not exclusion', 'Offer ongoing support'],
  '## Model Approach

**Recognition:**
Persistent physical symptoms (formerly MUS/somatisation):
- Multiple symptoms, multiple systems
- Extensive normal investigations
- Pattern of new symptoms emerging
- Psychosocial stressor (divorce)
- Health anxiety features
- Functional impairment

**Key Principles:**

1. **Validate Symptoms:**
   - Symptoms are REAL (not "all in head")
   - Do not dismiss or minimise
   - "I can see these symptoms are causing you real suffering"

2. **Avoid Investigation Spiral:**
   - More tests rarely help
   - Can reinforce health anxiety
   - Explain why not testing rather than refusing

3. **Explain Mechanism:**
   - Mind-body connection is biological not imaginary
   - Nervous system can cause real physical symptoms
   - Stress, emotions affect body
   - Analogy: blushing, butterflies, stress headache

4. **Positive Diagnosis:**
   - Not a diagnosis of exclusion
   - Has a name and explanation
   - Functional neurological symptoms

5. **Management:**
   - Continuity of care (same GP)
   - Regular scheduled appointments (not symptom-driven)
   - Gentle exploration of psychosocial factors
   - Consider psychological therapy (CBT)
   - Low-dose amitriptyline (already on)
   - Reduce symptom focus

6. **What NOT to Do:**
   - Don''t dismiss
   - Don''t do more tests to reassure
   - Don''t tell her it''s "just anxiety"
   - Don''t label as difficult patient',
  true,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Reviewed previous investigations", "Explored current symptoms", "Recognised pattern of presentations", "Explored psychosocial factors", "Asked about onset timing", "Assessed for health anxiety features", "Explored mood sensitively", "Asked about life stressors", "Assessed functional impact", "Explored beliefs about symptoms"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Avoided unnecessary investigations", "Explained why not testing", "Validated symptoms as real", "Explained mind-body connection", "Offered ongoing support", "Suggested regular appointments", "Considered psychological therapy", "Continuity of care", "Didn''t dismiss as psychiatric", "Made positive diagnosis"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Did not dismiss or minimise", "Validated suffering", "Did not suggest imagined symptoms", "Handled frustration well", "Explained sensitively", "Collaborative approach", "Offered hope", "Maintained relationship"]}}'
);

-- =====================================================
-- CASE 28: TRAVEL-001 - Travel Health
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'TRAVEL-001: Pre-Travel Advice',
  'Travel Health',
  'TRAVEL-001',
  'You are a GP trainee. Mr. James Lewis, a 55-year-old man, has come for travel advice before a trip to Kenya and Tanzania.

',
  '{"name": "Mr. James Lewis", "age": 55, "gender": "Male"}',
  '{"patient": "Mr. James Lewis", "age": 55, "gender": "Male", "pmh": "Type 2 diabetes, Hypertension, Previous DVT 3 years ago", "medications": "Metformin 1g BD, Ramipril 5mg OD, Rivaroxaban 20mg OD", "allergies": "Penicillin", "social_summary": "Company director, frequent traveller", "family_summary": "N/A"}',
  '{
    "opening_statement": "Doctor, I''m going to Kenya and Tanzania next month for a safari. I need to get sorted with vaccines and malaria tablets.",
    "freely_given_history": {
      "trip_details": "3-week trip. Flying to Nairobi, then safari in Masai Mara and Serengeti, ending at Zanzibar beach.",
      "psychosocial_impact": "Important trip - retirement present to himself. Wife also going.",
      "ice": {
        "ideas": "Knows he needs some jabs and malaria tablets",
        "concerns": "Worried about interacting with his blood thinners",
        "expectations": "Wants everything sorted in one go if possible"
      }
    },
    "history_on_direct_questioning": {
      "trip_details": {
        "dates": "Leaving in 4 weeks",
        "duration": "3 weeks",
        "itinerary": "Nairobi (2 nights), Masai Mara safari (4 nights), cross to Serengeti (4 nights), Zanzibar (1 week beach)",
        "accommodation": "Mix of safari lodges and beach resort",
        "activities": "Game drives, walking safari, beach relaxation"
      },
      "medical_history": {
        "diabetes": "Well controlled, HbA1c 52, on Metformin",
        "hypertension": "Well controlled",
        "dvt": "Had DVT 3 years ago after long flight, now on rivaroxaban lifelong",
        "other": "Otherwise fit and active"
      },
      "previous_travel": {
        "history": "Has been to South Africa before, took malaria tablets without issue",
        "vaccines": "Can''t remember when last had boosters"
      },
      "current_vaccines": {
        "status": "Needs checking - thinks childhood vaccines done but no recent boosters"
      },
      "risk_factors": {
        "immunosuppression": "No",
        "splenectomy": "No",
        "flight": "11-hour flight - DVT risk"
      }
    }
  }',
  'ORGANISED and wanting to be prepared. Take notes on phone. Ask relevant questions about side effects and interactions. Be concerned about DVT risk on flight - want clear advice. Ask about travel insurance with pre-existing conditions.',
  'full',
  720,
  'easy',
  ARRAY['Assess destination risks', 'Required vs recommended vaccines', 'Malaria prophylaxis choice', 'Consider anticoagulation implications', 'DVT prevention on flight', 'Travel insurance advice'],
  '## Model Approach

**Risk Assessment:**
- East Africa (Kenya, Tanzania, Zanzibar)
- Safari with outdoor activities
- Previous DVT, on anticoagulation
- Diabetic

**Vaccination Requirements:**

1. **Required:**
   - Yellow fever (certificate may be checked)

2. **Recommended:**
   - Hepatitis A
   - Typhoid
   - Consider: Hep B, Rabies (safari with wildlife exposure), Cholera (Zanzibar)
   - Ensure routine vaccines up to date (tetanus/diphtheria, MMR)

**Malaria Prevention:**

1. **Chemoprophylaxis:**
   - High risk area - essential
   - Options: Malarone (atovaquone-proguanil), Doxycycline, Mefloquine
   - On Rivaroxaban: Malarone OK, Doxycycline OK
   - Start before travel, continue after

2. **Bite Prevention:**
   - DEET repellent
   - Long sleeves at dusk
   - Bed nets if needed

**Specific Concerns:**

1. **DVT/Flight:**
   - Already on anticoagulation (protective)
   - Still advise: movement, hydration, compression stockings
   - Aisle seat

2. **Diabetes:**
   - Carry medications in hand luggage
   - Letter from GP
   - Consider sick day rules abroad

3. **Anticoagulation:**
   - Medical letter
   - International certificate of anticoagulation
   - Know INR/access to testing if needed

4. **Travel Insurance:**
   - Essential with pre-existing conditions
   - Declare all conditions
   - Check cover for repatriation',
  false,
  true,
  '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established full itinerary", "Asked about accommodation", "Asked about activities", "Reviewed medical history", "Considered DVT risk", "Reviewed current medications", "Asked about previous vaccines", "Asked about previous travel", "Identified all risk factors", "Assessed timeline (4 weeks)"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Advised appropriate vaccines", "Explained yellow fever requirement", "Chose appropriate malaria prophylaxis", "Considered drug interactions", "Gave DVT prevention advice", "Advised on diabetes management", "Recommended medical letters", "Advised on travel insurance", "Gave bite prevention advice", "Arranged vaccine appointments"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Organised clear advice", "Addressed specific concerns", "Explained rationale", "Checked understanding", "Gave written information", "Supportive approach", "Practical advice", "Enabled safe travel"]}}'
);
