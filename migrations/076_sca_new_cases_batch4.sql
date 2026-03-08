-- Migration 076: 9 new SCA full cases (batch 4)
-- Obstetrics, Ethics, Gastroenterology, General Practice, Infectious Disease,
-- Respiratory, Paediatrics, Rheumatology

-- =====================================================
-- CASE 1: Itching in Pregnancy (OBS-002)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Itching in Pregnancy - Possible Obstetric Cholestasis',
  'Obstetrics',
  'OBS-002',
  'Telephone consultation. A 32-year-old woman who is 34 weeks pregnant has called the surgery because she has been itching badly for the past few days, especially at night. She is worried something is wrong.',
  '{"name": "Mrs. Natasha Kovac", "age": 32, "gender": "Female"}',
  '{"patient": "Mrs. Natasha Kovac", "age": 32, "gender": "Female", "pmh": "Mild asthma, previous uncomplicated pregnancy and delivery (2021)", "medications": "Salbutamol inhaler PRN, folic acid 400mcg OD, Pregnacare vitamin", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hello doctor, thank you for calling me back. I am sorry to bother you but I have been so itchy for the past four or five days and it is driving me absolutely mad. I am thirty-four weeks pregnant and I just cannot sleep because of it.",
    "freely_given_history": {
      "presenting_complaint": "The itching started about five days ago. It is mainly on the palms of my hands and the soles of my feet but it is also on my arms and tummy. It gets much worse at night and I have been barely sleeping. I have not noticed a rash. I have not changed any washing powder or started using anything new. The skin just looks normal but the itch is unbearable.",
      "psychosocial_impact": "I am exhausted because I am not sleeping at all. My partner works nights so I am on my own with our three-year-old in the evenings. I have been getting quite tearful because I feel so tired and uncomfortable. I have been scratching so much that my hands are raw.",
      "ice": {
        "ideas": "My friend had something called cholestasis when she was pregnant and she said itching was the main thing. She had to be induced early. I have been googling it and I am really worried.",
        "concerns": "I am scared that this could be harmful to the baby. My friend told me the baby can be stillborn if it is not picked up. I am terrified.",
        "expectations": "I just want to know if the baby is safe. I want a blood test or something to check. I need someone to take this seriously."
      }
    },
    "history_on_direct_questioning": {
      "itch_details": {
        "location": "Palms and soles mainly, also forearms and abdomen.",
        "onset": "About five days ago, gradually getting worse.",
        "character": "Intense, constant, worse at night. No rash or visible skin changes.",
        "relieving_factors": "Nothing helps. I have tried moisturiser, calamine lotion, and antihistamines but nothing makes a difference.",
        "aggravating_factors": "Worse at night, worse when I am warm in bed."
      },
      "pregnancy_details": {
        "gestation": "Thirty-four weeks.",
        "antenatal_care": "All routine scans and blood tests have been normal. No problems so far.",
        "fetal_movements": "Baby is moving normally. I have been keeping an eye on that.",
        "blood_pressure": "Was normal at my last midwife appointment two weeks ago.",
        "urine": "Has been clear at all my appointments."
      },
      "other_symptoms": {
        "dark_urine": "Now you mention it, my wee has been a bit darker than usual over the past couple of days.",
        "pale_stools": "I have not noticed.",
        "jaundice": "No, my partner has not said I look yellow.",
        "abdominal_pain": "I have had a bit of discomfort in the top of my tummy on the right side but I thought it was just the baby pushing up.",
        "nausea": "A little bit but nothing like the morning sickness I had earlier.",
        "bleeding": "No bleeding at all."
      }
    },
    "secondary_history": {
      "previous_pregnancy": "My first pregnancy was completely straightforward. No itching, no complications. I had a normal delivery at thirty-nine weeks.",
      "family_history": "My mum had gallstones but I do not know of anyone else in the family who had problems in pregnancy.",
      "liver_history": "I have never had any liver problems myself."
    },
    "ice": {
      "ideas": "I think this might be obstetric cholestasis because of what my friend said and what I have read online.",
      "concerns": "I am really frightened about the baby. The thought that something could happen to the baby because of this is keeping me up even more than the itching.",
      "expectations": "I want a blood test today if possible. I want to know the baby is safe and I want someone to help me with this awful itching."
    },
    "specific_prompts": "If the doctor tries to reassure you without arranging blood tests, become more anxious and insistent. Mention your friend''s experience again. If the doctor acknowledges your concerns and arranges bile acid and LFT testing, become noticeably relieved and cooperative. If the doctor explains the plan clearly, ask whether you should be worried about early delivery."
  }',
  'ANXIOUS but articulate. You are an intelligent woman who has done her own research. You are clearly frightened about the baby''s safety. If the doctor takes your concerns seriously and explains things well, you calm down and engage positively. If the doctor is dismissive or suggests waiting without investigation, you become more upset and push back firmly but politely.',
  'full',
  720,
  'hard',
  ARRAY['Recognise the presentation is suspicious for obstetric cholestasis', 'Arrange urgent bile acid levels and LFTs', 'Assess for red flags (pre-eclampsia, HELLP, acute fatty liver)', 'Address the patient''s significant anxiety about fetal safety', 'Discuss ursodeoxycholic acid if diagnosis confirmed', 'Safety-net clearly about fetal movements', 'Liaise with obstetric team or arrange same-day assessment', 'Discuss likely need for planned early delivery (37 weeks)'],
  '## Model Approach

**What this case is testing:** Recognition of obstetric cholestasis as a cause of pruritus in pregnancy, appropriate urgent investigation, and sensitive communication with an anxious patient about fetal risk.

**Data Gathering:**
- Detailed history of pruritus: onset, distribution (palms and soles is characteristic of OC), timing (worse at night), absence of rash
- Associated symptoms: dark urine, pale stools, right upper quadrant discomfort, jaundice
- Current gestation and antenatal history
- Fetal movements (crucial safety question)
- Exclude other causes: dermatological (PEP/PUPPP, eczema), pre-eclampsia (BP, proteinuria, headache, visual disturbance), HELLP syndrome
- Previous pregnancy history and family history of OC or gallstones
- ICE: patient has researched OC and is very anxious about fetal safety

**Clinical Management:**
- Arrange urgent blood tests: serum bile acids (key diagnostic test, >10 micromol/L suggestive), LFTs (ALT/AST may be raised), clotting screen
- Explain that bile acids can take several days to return - may need repeating weekly
- If bile acids raised: start ursodeoxycholic acid (UDCA) 250mg BD, titrate up as per obstetric guidance
- Emollients for symptomatic relief; aqueous cream with menthol can provide temporary relief
- Antihistamines have limited evidence in OC but chlorphenamine may help sleep
- Refer urgently to obstetric team or antenatal day unit for same-day assessment if significantly symptomatic
- Discuss that OC is associated with increased risk of stillbirth, preterm birth, and meconium; planned delivery at 37 weeks is typical
- Clear safety-netting: monitor fetal movements, attend triage if reduced movements, seek urgent care if jaundice or worsening symptoms
- Provide written information (RCOG patient information leaflet)

**References:**
- RCOG Green-top Guideline No. 43: Obstetric Cholestasis - https://www.rcog.org.uk/guidance/browse-all-guidance/green-top-guidelines/obstetric-cholestasis-green-top-guideline-no-43/
- NICE CKS: Obstetric cholestasis - https://cks.nice.org.uk/topics/obstetric-cholestasis/
- BMJ Best Practice: Intrahepatic cholestasis of pregnancy - https://bestpractice.bmj.com/topics/en-gb/1109',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Explored pruritus in detail (distribution, timing, absence of rash, onset)", "Identified characteristic features of OC (palms, soles, worse at night, no rash)", "Asked about associated symptoms (dark urine, pale stools, RUQ discomfort)", "Assessed current gestation and fetal movements", "Screened for differential diagnoses (pre-eclampsia, HELLP, dermatological causes)", "Explored previous pregnancy and family history for OC risk factors", "Explored ICE effectively (recognised fear about fetal safety)", "Gathered information efficiently via telephone"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Arranged urgent serum bile acids and LFTs", "Discussed that bile acids may take time to return and may need repeating", "Discussed ursodeoxycholic acid as treatment if OC confirmed", "Offered symptomatic relief advice (emollients, menthol, chlorphenamine)", "Referred urgently to obstetric team or antenatal day unit", "Discussed the association with adverse fetal outcomes and planned early delivery", "Provided clear safety-netting about fetal movements and when to seek urgent care", "Engaged the patient in shared decision-making and addressed her specific fears"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was empathetic and took the patient''s concerns seriously from the outset", "Acknowledged the patient''s anxiety about fetal safety", "Validated her research and her friend''s experience without dismissing it", "Explained things clearly in non-medical language", "Provided reassurance appropriately without minimising the risk", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 2: Request to Amend Medical Records (ETH-004)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Request to Amend Medical Records',
  'Ethics & Communication',
  'ETH-004',
  'Telephone consultation. A patient has called to request that certain information be removed from their medical record. The receptionist has passed the call to you.',
  '{"name": "Mr. Daniel Osei", "age": 41, "gender": "Male"}',
  '{"patient": "Mr. Daniel Osei", "age": 41, "gender": "Female", "pmh": "Depression (2019-2021, now resolved), alcohol misuse (documented 2020, patient disputes this), hypertension", "medications": "Amlodipine 5mg OD", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hello doctor, thank you for taking my call. I need to talk to you about something on my medical records. I have been trying to sort this out for a while and nobody seems to be helping me. I need something removed from my notes.",
    "freely_given_history": {
      "presenting_complaint": "I applied for a new job recently and they asked for a medical report from my GP. When I got the copy of what was being sent, I saw that there is a note on my records saying I had alcohol misuse in 2020. I never had an alcohol problem. That should not be on there. I need it taken off before the report goes out because it could cost me this job.",
      "psychosocial_impact": "This job is really important to me. It is a senior management role and I have been working towards it for years. If they see alcohol misuse on my records, they will not give me the job. I have already been stressed about this for weeks and it is affecting my sleep.",
      "ice": {
        "ideas": "I think there has been a mistake. The doctor I saw back then asked me how much I drank and I was honest. I was drinking a bit more during lockdown like everyone else, but that does not make me an alcoholic. They should not have written that.",
        "concerns": "I am terrified this is going to ruin my career. I also do not want this following me around for the rest of my life.",
        "expectations": "I want the alcohol misuse entry removed from my records completely. I was told I have a right to have incorrect information taken off."
      }
    },
    "history_on_direct_questioning": {
      "alcohol_history": {
        "2020_consumption": "During the first lockdown I was probably drinking a bottle of wine most nights. Sometimes a bit more at weekends. It was a stressful time.",
        "current_consumption": "I barely drink now. Maybe a glass of wine at the weekend, sometimes not even that.",
        "dependence_features": "I never had shaking or withdrawal symptoms. I never drank in the morning. I never missed work because of drinking.",
        "previous_advice": "The doctor at the time told me I was drinking too much and should cut down. I did cut down and that was the end of it."
      },
      "mental_health": {
        "depression": "I was on antidepressants for about eighteen months. I came off them in 2021 and I have been fine since. I do not mind that being on my records because it is accurate.",
        "current_mood": "I have been stressed about this job situation but I am not depressed."
      },
      "understanding_of_rights": "I looked online and it says under GDPR I have the right to have inaccurate information corrected. I think this is inaccurate because I did not have a clinical alcohol problem."
    },
    "secondary_history": {
      "previous_attempts": "I called the surgery about this two months ago and the receptionist said I needed to speak to a doctor. I then sent a letter but I have not had a reply.",
      "job_timeline": "The medical report needs to go out within the next two weeks. They are holding the job offer pending the medical."
    },
    "ice": {
      "ideas": "I believe this was incorrectly coded and I have a legal right to have it corrected.",
      "concerns": "If this is not removed, I could lose a life-changing career opportunity. I feel like I am being punished for being honest with a doctor.",
      "expectations": "I want the entry removed or at the very least changed to something that does not suggest I had an alcohol problem."
    },
    "specific_prompts": "If the doctor explains that records cannot simply be deleted but that a note can be added with your perspective, be initially resistant but then accept this if it is explained well. If the doctor offers to discuss what goes into the medical report and your right to see it beforehand, become more cooperative. If the doctor is dismissive of your concerns about the job, become frustrated."
  }',
  'DETERMINED and slightly frustrated. You have been trying to sort this out for weeks and feel nobody has listened. You are not aggressive but you are firm. You feel strongly that the record is unfair. If the doctor is empathetic and explains the legal position clearly, you can accept a compromise. If the doctor refuses to engage, you become more frustrated and may mention making a formal complaint.',
  'full',
  720,
  'medium',
  ARRAY['Understand the legal framework for amending medical records (GDPR, DPA 2018)', 'Explain that GP records cannot simply be deleted but can have annotations added', 'Acknowledge the patient''s frustration and the impact on their career', 'Discuss subject access requests and patient rights regarding medical reports', 'Consider whether the original entry was clinically accurate', 'Discuss the Access to Medical Reports Act 1988', 'Offer practical solutions (annotation, discuss report content)', 'Maintain professional integrity while being empathetic'],
  '## Model Approach

**What this case is testing:** Understanding of medical record keeping, GDPR principles, the Access to Medical Reports Act, and balancing patient autonomy with clinical record integrity. Requires sensitive communication about a contested record entry.

**Data Gathering:**
- Clarify exactly what the patient wants changed and why
- Understand the context of the original entry (what was documented, by whom, when)
- Explore the patient''s alcohol history at the time and current status
- Understand the urgency (job offer pending medical report)
- Explore previous attempts to resolve this
- ICE: fear of career impact, feeling of injustice, expectation of deletion

**Clinical Management:**
- Explain the legal framework:
  - Under GDPR (UK GDPR / DPA 2018), patients have the right to rectification of inaccurate data
  - However, clinical records that reflect the clinician''s professional judgement at the time cannot simply be deleted
  - If the entry is the clinician''s honest clinical opinion based on the information available, it is not "inaccurate" in GDPR terms even if the patient disagrees
  - A dissenting note can be added to the record reflecting the patient''s view
- Discuss the Access to Medical Reports Act 1988:
  - The patient has the right to see the medical report before it is sent to the employer
  - The patient can request amendments or add a statement of disagreement
  - The patient can withhold consent for the report to be sent
- Offer practical solutions:
  - Add a note to the record stating that the patient disputes the alcohol misuse coding
  - Discuss with the patient what will be included in the employer report
  - Offer to write the report in a way that provides a balanced and fair view
- If the patient remains dissatisfied, explain the formal complaints process and the ICO as an avenue for data protection concerns
- Consider whether the original coding was proportionate (AUDIT score, brief intervention vs coded alcohol misuse)

**References:**
- GMC: Confidentiality guidance - https://www.gmc-uk.org/professional-standards/professional-standards-for-doctors/confidentiality
- BMA: Access to health records - https://www.bma.org.uk/advice-and-support/ethics/confidentiality-and-health-records/access-to-health-records
- ICO: Right to rectification - https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/individual-rights/right-to-rectification/
- Access to Medical Reports Act 1988 - https://www.legislation.gov.uk/ukpga/1988/28/contents',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Clarified exactly what the patient wants removed and the context of the original entry", "Explored the alcohol history at the time of the original documentation", "Assessed the patient''s current alcohol consumption", "Understood the urgency and the impact of the medical report on the job application", "Explored previous attempts to resolve this issue", "Explored ICE (fear of career impact, feeling of injustice)", "Assessed the patient''s understanding of their data protection rights", "Gathered information sensitively and efficiently"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained the GDPR right to rectification and its limitations for clinical records", "Explained that clinical records reflecting professional judgement cannot simply be deleted", "Offered to add a dissenting note or annotation to the record", "Discussed the Access to Medical Reports Act 1988 (right to see report before sending)", "Offered practical solutions regarding the content of the employer medical report", "Explained the patient''s right to withhold consent for the report", "Discussed the formal complaints pathway and ICO if the patient remains dissatisfied", "Provided a clear and balanced plan that respects both clinical integrity and patient rights"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was empathetic and acknowledged the patient''s frustration", "Validated the patient''s concern about the impact on their career", "Avoided being defensive or dismissive of the request", "Explained complex legal concepts in clear language", "Maintained professional integrity without being adversarial", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 3: Ulcerative Colitis Flare (GI-006)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Ulcerative Colitis Flare on Maintenance Therapy',
  'Gastroenterology',
  'GI-006',
  'Video consultation. A 28-year-old man with known ulcerative colitis presents with worsening bloody diarrhoea despite being on maintenance therapy. He looks tired and pale on camera.',
  '{"name": "Mr. Ryan Gallagher", "age": 28, "gender": "Male"}',
  '{"patient": "Mr. Ryan Gallagher", "age": 28, "gender": "Male", "pmh": "Ulcerative colitis (diagnosed 2020, left-sided), iron deficiency anaemia (2022)", "medications": "Mesalazine 2.4g OD (Octasa), Ferrous fumarate 210mg BD", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hi doctor, thanks for seeing me. I have been having a really bad flare-up for the past two weeks and it is getting worse. I am having lots of bloody diarrhoea and I just feel exhausted all the time.",
    "freely_given_history": {
      "presenting_complaint": "For the past two weeks I have been going to the toilet about eight to ten times a day. There is a lot of blood mixed in with the stool every time. I am also getting a lot of urgency and sometimes I do not make it in time, which is really embarrassing. I have been having cramps in my lower tummy as well, especially before I need to go.",
      "psychosocial_impact": "I work in an open-plan office and it is really difficult. I have had a couple of accidents at work and I have been making excuses to work from home. I am worried my boss is going to start asking questions. My girlfriend and I were supposed to go on holiday next month but I do not see how I can go like this. I have been feeling really low about it all.",
      "ice": {
        "ideas": "I think the mesalazine has stopped working. My last flare was about eighteen months ago and it settled with a course of steroids. I am wondering if I need steroids again or maybe a stronger medication.",
        "concerns": "I am worried this flare is worse than the previous ones. I have never had this much blood before. I am also worried about losing my job if I keep having to work from home.",
        "expectations": "I would like something to get this under control quickly. I am also worried about whether my current medication is still the right one for me long-term."
      }
    },
    "history_on_direct_questioning": {
      "bowel_symptoms": {
        "frequency": "Eight to ten times a day, including two or three times at night.",
        "blood": "Bright red blood mixed in every time. Quite a lot of it.",
        "urgency": "Really bad. I sometimes have less than a minute''s warning.",
        "incontinence": "I have had two accidents in the past week. Once at work and once at home.",
        "tenesmus": "Yes, I often feel like I need to go again straight after.",
        "mucus": "Yes, quite a lot of mucus as well."
      },
      "systemic_symptoms": {
        "appetite": "Not great. I have lost about four kilos in the past two weeks.",
        "fever": "I have felt a bit hot and cold but I have not checked my temperature.",
        "fatigue": "I am absolutely shattered. I can barely keep my eyes open by the afternoon.",
        "joint_pains": "My knees and ankles have been a bit sore over the past week actually."
      },
      "medication_adherence": {
        "mesalazine": "I have been taking it every day. I have not missed any doses.",
        "iron": "I ran out about three weeks ago and have not got round to reordering it."
      },
      "previous_flares": {
        "last_flare": "About eighteen months ago. I was put on prednisolone for eight weeks and it settled down. I also had a course of mesalazine enemas.",
        "colonoscopy": "My last colonoscopy was about a year ago. They said it was moderate inflammation on the left side."
      }
    },
    "secondary_history": {
      "extra_intestinal": "I have had mouth ulcers on and off for the past few weeks. The joint pains are new.",
      "smoking": "I have never smoked.",
      "family_history": "My uncle has Crohn''s disease."
    },
    "ice": {
      "ideas": "I think the mesalazine is not enough for me anymore. I have read about biologic injections online.",
      "concerns": "I am really worried about the amount of blood. I also do not want to keep going on and off steroids because I know they have side effects.",
      "expectations": "I want something that will get this flare under control quickly and then a plan so it does not keep happening."
    },
    "specific_prompts": "If the doctor calculates your Truelove and Witts score or asks about severity systematically, engage positively and provide details. If the doctor discusses stepping up therapy or biologics, ask about the side effects. If the doctor suggests hospital admission, look worried but accept the advice if it is explained clearly."
  }',
  'TIRED and worried but cooperative. You look visibly unwell on the video. You are open and honest about symptoms. You are keen for something to change because your current medication is clearly not working. If the doctor is thorough and explains things well, you are compliant and grateful.',
  'full',
  720,
  'medium',
  ARRAY['Assess severity of UC flare using Truelove and Witts criteria', 'Recognise this may be a moderate-to-severe flare requiring urgent action', 'Arrange appropriate investigations (bloods, stool, faecal calprotectin)', 'Consider need for oral corticosteroids', 'Discuss stepping up maintenance therapy with gastroenterology input', 'Identify extra-intestinal manifestations (arthralgia, oral ulcers)', 'Assess for red flags requiring hospital admission', 'Address psychosocial impact and occupational difficulties'],
  '## Model Approach

**What this case is testing:** Assessment of an acute ulcerative colitis flare, severity grading using Truelove and Witts criteria, acute and long-term management, and recognition of extra-intestinal manifestations.

**Data Gathering:**
- Assess flare severity systematically (Truelove and Witts): stool frequency (>6/day with blood = severe), pulse, temperature, haemoglobin, ESR/CRP
- Characterise bowel symptoms: frequency, blood, urgency, incontinence, nocturnal symptoms, tenesmus
- Assess systemic features: weight loss, fever, fatigue, malaise
- Check for extra-intestinal manifestations: arthralgia, mouth ulcers, skin lesions (erythema nodosum, pyoderma gangrenosum), eye symptoms
- Review medication adherence and current therapy
- Previous flare history and colonoscopy findings
- ICE: wants effective treatment, worried about blood loss and work impact

**Clinical Management:**
- Severity assessment: this presentation (8-10 bloody stools/day, weight loss, possible fever, tachycardia, arthralgia) suggests moderate-to-severe flare per Truelove and Witts
- Urgent blood tests: FBC (anaemia), CRP/ESR (inflammation), U&Es, LFTs, albumin (nutritional status), iron studies
- Stool sample: faecal calprotectin (if not already in flare), MC&S to exclude infective cause (C. difficile)
- Acute management: oral prednisolone 40mg OD reducing course (typically 8 weeks) per BSG guidelines
- Consider mesalazine dose optimisation and addition of topical therapy (enemas) if left-sided disease
- Urgent gastroenterology referral for review and consideration of step-up therapy (thiopurines, biologics) given recurrent flares on mesalazine monotherapy
- If meeting criteria for severe flare: consider same-day hospital assessment for IV steroids
- Resume iron supplementation
- Safety-net: attend A&E if massive rectal bleeding, inability to keep fluids down, worsening systemic symptoms, severe abdominal pain
- Discuss sick note for work if needed, address occupational impact

**References:**
- NICE NG130: Ulcerative colitis - https://www.nice.org.uk/guidance/ng130
- BSG consensus guidelines on the management of IBD in adults - https://www.bsg.org.uk/clinical-resource/bsg-consensus-guidelines-on-the-management-of-inflammatory-bowel-disease-in-adults/
- NICE CKS: Ulcerative colitis - https://cks.nice.org.uk/topics/ulcerative-colitis/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed flare severity systematically (stool frequency, blood, systemic features)", "Applied or referenced Truelove and Witts severity criteria", "Identified extra-intestinal manifestations (arthralgia, mouth ulcers)", "Reviewed current medication and adherence", "Asked about previous flare history and colonoscopy findings", "Assessed systemic symptoms (weight loss, fever, fatigue)", "Explored ICE (concerns about treatment, blood loss, work impact)", "Gathered information efficiently within the consultation"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Arranged urgent blood tests (FBC, CRP, U&Es, LFTs, albumin, iron studies)", "Requested stool MC&S to exclude infective cause", "Initiated or discussed oral corticosteroids for acute flare", "Considered optimising mesalazine and adding topical therapy", "Made urgent gastroenterology referral for step-up therapy consideration", "Recognised indications for hospital admission if severe flare", "Provided specific safety-netting (A&E if massive bleeding, unable to keep fluids down)", "Addressed occupational impact and offered a sick note if needed"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was empathetic about the impact on the patient''s quality of life", "Addressed the embarrassment of incontinence sensitively", "Acknowledged the patient''s concerns about work and relationships", "Explained the management plan clearly in understandable language", "Was reassuring without minimising the severity of the flare", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 4: Opioid Medication Review (GP-008)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Opioid Medication Review - Deprescribing Discussion',
  'General Practice',
  'GP-008',
  'Video consultation. A 56-year-old woman attending for a medication review. She has been on long-term opioids for chronic lower back pain and is requesting a repeat prescription. The practice has flagged her for a structured opioid review.',
  '{"name": "Mrs. Karen Whitfield", "age": 56, "gender": "Female"}',
  '{"patient": "Mrs. Karen Whitfield", "age": 56, "gender": "Female", "pmh": "Chronic lower back pain (lumbar disc degeneration), obesity (BMI 34), type 2 diabetes, depression, fibromyalgia", "medications": "Co-codamol 30/500 QDS, Morphine sulphate MR 30mg BD, Oramorph 10mg/5ml PRN (using 20-30ml daily), Amitriptyline 25mg ON, Metformin 1g BD, Sertraline 100mg OD", "allergies": "Ibuprofen (gastric upset)"}',
  '{
    "opening_statement": "Hello doctor. I have come for my medication review. I just need my repeat prescriptions sorting out really. I have been on the same painkillers for years and they keep me going.",
    "freely_given_history": {
      "presenting_complaint": "My back pain has been the same for years really. I have good days and bad days but I cannot manage without my painkillers. The co-codamol and the morphine tablets keep the pain at a manageable level. I also use the Oramorph when it gets really bad, which is most days to be honest.",
      "psychosocial_impact": "I had to give up my job as a teaching assistant three years ago because of the pain. I do not go out much anymore. I mainly watch television and I struggle with the housework. My husband does most of the cooking and cleaning now. I feel quite useless really. I do not sleep well either.",
      "ice": {
        "ideas": "The painkillers are the only thing that helps. I have tried physiotherapy and it did not work. I cannot take anti-inflammatories because of my stomach. I just need to carry on with what I am on.",
        "concerns": "I have heard that doctors are trying to take people off their pain medication. I am really worried about that because I cannot cope without them.",
        "expectations": "I just want my prescriptions renewed. I do not want anything to change."
      }
    },
    "history_on_direct_questioning": {
      "pain_assessment": {
        "severity": "On a bad day it is about seven out of ten even with the painkillers. On a good day it is about four or five.",
        "function": "I can manage around the house slowly. I cannot walk more than about a hundred metres. I use a stick when I go out.",
        "sleep": "I wake up two or three times a night with pain. I take Oramorph at night to help me sleep.",
        "activities": "I do not do any exercise. I used to swim but I stopped when the pain got bad."
      },
      "opioid_assessment": {
        "dose_escalation": "The morphine dose was increased about a year ago from 20mg to 30mg BD because I was not getting enough relief. The Oramorph was added about six months ago.",
        "side_effects": "I get constipated. I take laxatives but they do not always work. I sometimes feel a bit drowsy in the morning.",
        "tolerance": "The painkillers do not seem to work as well as they used to. I sometimes think about asking for something stronger.",
        "withdrawal": "If I miss a dose of the morphine I start to feel awful. I get sweaty and shaky and the pain is unbearable."
      },
      "other_treatments_tried": {
        "physiotherapy": "I had six sessions about two years ago but it made the pain worse so I stopped.",
        "psychology": "Nobody has ever mentioned psychology for pain.",
        "injections": "I had a steroid injection in my back once but it only helped for a couple of weeks."
      },
      "mood": {
        "depression": "I have been on sertraline for a few years. It helps a bit. I do get very low sometimes, especially when the pain is bad. I feel like the pain has taken over my life.",
        "anxiety": "I worry a lot about the pain getting worse and about losing my medication."
      }
    },
    "secondary_history": {
      "opioid_use": "I have been on some form of opioid for about five years now. The doses have gone up over time.",
      "falls": "I had a fall about two months ago. I was a bit drowsy from the Oramorph and I tripped on the stairs. I bruised my hip but nothing was broken."
    },
    "ice": {
      "ideas": "The painkillers are all I have. Nothing else works.",
      "concerns": "I am terrified of being in more pain. I cannot go back to how it was before the morphine.",
      "expectations": "I just want to keep my medication. Please do not take it away from me."
    },
    "specific_prompts": "If the doctor mentions reducing your opioids, initially resist strongly. Say things like ''Please do not take my painkillers away'' and ''Nothing else works for me.'' If the doctor acknowledges your pain, explains the evidence about long-term opioids sensitively, and proposes a very gradual reduction with support, you can become cautiously open to discussion. If the doctor is abrupt or dismissive, become upset and refuse to engage."
  }',
  'DEFENSIVE and anxious initially. You are very attached to your opioid medication and see it as your lifeline. You are resistant to any suggestion of change. However, if the doctor is empathetic, validates your pain, and explains the rationale for a structured review carefully (not ''taking your painkillers away''), you can gradually become open to discussion. You respond well to being listened to and to a collaborative approach.',
  'full',
  720,
  'hard',
  ARRAY['Conduct a structured opioid medication review', 'Assess for opioid-related harm (tolerance, dose escalation, side effects, falls)', 'Explore the evidence that long-term opioids provide limited benefit in chronic non-cancer pain', 'Discuss deprescribing sensitively without being paternalistic', 'Explore non-pharmacological pain management strategies', 'Assess mood and the relationship between pain and depression', 'Identify opioid dependence features', 'Develop a collaborative gradual reduction plan if appropriate'],
  '## Model Approach

**What this case is testing:** Conducting a sensitive structured opioid review in a patient with chronic pain, recognising opioid-related harm, discussing deprescribing collaboratively, and exploring multimodal pain management.

**Data Gathering:**
- Assess current pain: severity, functional impact, interference with daily activities
- Detailed opioid assessment: current doses (total daily morphine equivalent = 30mg MR BD + co-codamol 30/500 QDS + Oramorph 20-30ml = approximately 100-120mg oral morphine equivalent/day - high dose)
- Assess for opioid-related harm: tolerance (needing increasing doses), dose escalation, constipation, drowsiness, falls, opioid-induced hyperalgesia
- Screen for dependence features: withdrawal symptoms on missed doses, dose escalation, anxiety about losing medication
- Assess mood: depression and chronic pain are closely linked, bidirectional relationship
- Review previous non-pharmacological treatments and why they were not continued
- ICE: fear of pain, fear of medication being removed, defensive posture

**Clinical Management:**
- Validate the patient''s pain and acknowledge the suffering - do NOT start by saying opioids need to be reduced
- Share the evidence: NICE NG193 states that opioids should not be used for chronic primary pain; for chronic pain generally, long-term opioids have limited evidence beyond 12 weeks and carry significant harm
- Calculate total oral morphine equivalent dose (approx 100-120mg/day - this is above the 90mg threshold that increases risk significantly)
- Discuss specific harms relevant to this patient: constipation, drowsiness, falls (she has fallen), weight gain (BMI 34), opioid-induced hyperalgesia (pain may be worse because of opioids)
- Propose a GRADUAL reduction plan: reduce by no more than 10% of dose every 2-4 weeks, starting with the Oramorph
- Discuss alternative approaches: pain management programme (multidisciplinary), graded exercise, CBT for pain, mindfulness
- Optimise non-opioid analgesia: amitriptyline dose optimisation (can increase to 50-75mg for pain), consider duloxetine (dual benefit for pain and depression)
- Address depression: review sertraline effectiveness, consider switching to duloxetine
- Referral to community pain management service
- Follow-up plan: regular reviews during any reduction, reassurance that reduction will be gradual and supported

**References:**
- NICE NG193: Chronic pain - https://www.nice.org.uk/guidance/ng193
- Faculty of Pain Medicine: Opioids Aware - https://fpm.ac.uk/opioids-aware
- RCGP: Safer Prescribing in Chronic Pain - https://elearning.rcgp.org.uk/mod/book/view.php?id=12646
- PHE guidance: Dependence-forming medicines - https://www.gov.uk/government/publications/prescribed-medicines-review-report',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed current pain severity and functional impact", "Calculated or estimated total oral morphine equivalent daily dose", "Assessed for opioid-related harms (tolerance, dose escalation, constipation, falls, drowsiness)", "Identified features of opioid dependence (withdrawal on missed doses, anxiety about losing medication)", "Assessed mood and the bidirectional relationship with chronic pain", "Reviewed previous non-pharmacological treatments and barriers", "Explored ICE (fear of losing medication, pain controlling her life)", "Gathered information sensitively and without judgement"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained the evidence about limited benefit of long-term opioids in chronic non-cancer pain", "Discussed specific harms relevant to this patient (falls, constipation, hyperalgesia, high dose)", "Proposed a gradual reduction plan (no more than 10% every 2-4 weeks)", "Discussed starting with Oramorph reduction as the first step", "Suggested non-pharmacological alternatives (pain management programme, CBT, graded exercise)", "Considered optimising non-opioid analgesia (amitriptyline dose, duloxetine)", "Referred to community pain management service or multidisciplinary team", "Provided a clear follow-up plan with regular supported reviews"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Validated the patient''s pain and did not dismiss her experience", "Avoided paternalistic language (not ''taking painkillers away'')", "Used motivational interviewing techniques (asked permission, explored ambivalence)", "Addressed the patient''s fear and anxiety about dose reduction", "Was collaborative rather than prescriptive", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 5: Suspected Lyme Disease (ID-001)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Suspected Lyme Disease - Expanding Rash After Tick Exposure',
  'Infectious Disease',
  'ID-001',
  'Video consultation. A 38-year-old man presents with an expanding circular rash on his thigh that appeared a few days after a countryside walk. He is concerned about Lyme disease.',
  '{"name": "Mr. James Harrington", "age": 38, "gender": "Male"}',
  '{"patient": "Mr. James Harrington", "age": 38, "gender": "Male", "pmh": "Hay fever", "medications": "Cetirizine 10mg OD PRN (seasonal)", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hi doctor, thanks for seeing me. I have got this weird rash on my leg that has been getting bigger over the past week. I went walking in the New Forest about ten days ago and I think I might have been bitten by a tick. I am worried it could be Lyme disease.",
    "freely_given_history": {
      "presenting_complaint": "About ten days ago I went on a long walk through the New Forest with my dog. Three days after that I noticed a small red mark on my upper left thigh. I thought it was just an insect bite. But it has been getting bigger every day. It is now about the size of my palm. The middle of it has sort of cleared up and it looks like a ring. The outer edge is quite red. It is not itchy really, just a bit warm.",
      "psychosocial_impact": "I am quite an outdoorsy person. I walk the dog in the countryside most weekends. My wife looked it up and showed me pictures of Lyme disease rashes and it looks exactly like that. I am now worried about going outside. I have also been reading about the long-term effects and I am quite anxious.",
      "ice": {
        "ideas": "I think this is Lyme disease. The rash looks exactly like the pictures online. I know you get it from tick bites.",
        "concerns": "I am worried about the long-term effects. I have read that if it is not treated early it can affect your heart and your joints and even your brain. I do not want to end up with chronic Lyme disease.",
        "expectations": "I would like a blood test to confirm it and I think I need antibiotics. I have read that doxycycline is what they give you."
      }
    },
    "history_on_direct_questioning": {
      "rash_details": {
        "location": "Upper left thigh, inner aspect.",
        "size": "About eight to ten centimetres across now. It was only about two centimetres a week ago.",
        "appearance": "Red ring with central clearing. The edge is quite well defined. It is flat, not raised or blistered.",
        "itch": "Not really itchy. Slightly warm to touch.",
        "other_rashes": "No other rashes anywhere else."
      },
      "tick_history": {
        "tick_found": "I did not actually see a tick on me, but my dog had a couple and I was walking through long grass and bracken.",
        "tick_removal": "I did not find or remove a tick from myself."
      },
      "systemic_symptoms": {
        "fever": "I have felt a bit fluey for the past three or four days. A bit hot and cold.",
        "fatigue": "Yes, I have been more tired than usual. I thought it was just because I have been busy at work.",
        "headache": "A mild headache on and off for the past few days.",
        "muscle_aches": "My muscles have been a bit achey. Like I have done a hard workout.",
        "joint_pains": "No joint swelling or pain.",
        "neck_stiffness": "No.",
        "neurological": "No numbness, tingling, weakness, or facial droop."
      }
    },
    "secondary_history": {
      "travel": "I have not been abroad recently. Just countryside walks in Hampshire and the New Forest.",
      "previous_bites": "I have been bitten by ticks before but never had a reaction like this.",
      "occupation": "I work in IT from home."
    },
    "ice": {
      "ideas": "I am pretty sure this is Lyme disease from the rash and the tick area.",
      "concerns": "I am frightened about what happens if it is not treated quickly. I do not want neurological problems.",
      "expectations": "I want antibiotics started today and a blood test to confirm."
    },
    "specific_prompts": "If the doctor examines the rash on camera and confirms it looks like erythema migrans, feel relieved that they are taking it seriously. If the doctor explains that treatment should be started based on clinical diagnosis without waiting for blood tests, ask why blood tests are not needed. If the doctor prescribes doxycycline, ask how long you need to take it and whether you can still go outside."
  }',
  'HEALTH-CONSCIOUS and informed. You have clearly researched Lyme disease online and you are articulate about your symptoms. You are mildly anxious but mainly keen to get the right treatment quickly. You engage well with a doctor who takes you seriously and explains things clearly.',
  'full',
  720,
  'medium',
  ARRAY['Recognise erythema migrans as a clinical diagnosis of Lyme disease', 'Understand that blood tests are often negative in early Lyme disease', 'Start empirical treatment with doxycycline without waiting for serology', 'Assess for systemic features and exclude disseminated Lyme disease', 'Provide tick prevention advice for the future', 'Address patient anxiety about long-term complications', 'Know when to refer (neurological, cardiac, or joint involvement)', 'Safety-net for development of new symptoms'],
  '## Model Approach

**What this case is testing:** Recognition of erythema migrans, understanding that Lyme disease is a clinical diagnosis in early stages, appropriate empirical antibiotic treatment, and patient education about tick prevention.

**Data Gathering:**
- Detailed rash history: expanding erythema with central clearing (bull''s eye), timing after tick exposure area, size progression
- Tick exposure history: walking in endemic area (New Forest), exposure to long grass/bracken
- Assess for systemic symptoms of early disseminated Lyme: fever, myalgia, fatigue, headache (patient has these)
- Screen for complications of disseminated Lyme: facial palsy, meningism, radiculopathy, cardiac symptoms (palpitations, syncope), large joint arthritis
- Visual assessment of rash via video (characteristic appearance supports clinical diagnosis)
- ICE: patient has researched and is anxious about long-term effects

**Clinical Management:**
- Erythema migrans (expanding rash >5cm with central clearing after tick exposure) is a CLINICAL diagnosis - treat empirically
- NICE NG95: do NOT wait for serology to start treatment; serological tests are often negative in early Lyme disease and a negative test does not exclude the diagnosis
- First-line treatment: Doxycycline 100mg BD for 21 days (NICE NG95)
- Alternative if doxycycline contraindicated: amoxicillin 1g TDS for 21 days
- Advise: complete the full course, avoid sun exposure on doxycycline, take with food/water
- Serology can be sent for surveillance/confirmation but should NOT delay treatment
- Photo-document the rash if possible
- Tick prevention advice: wear long trousers tucked into socks, use DEET insect repellent, check for ticks after walks, remove ticks promptly with a tick removal tool
- Safety-net: return if rash worsens or does not improve within days of starting antibiotics, or if new symptoms develop (facial weakness, palpitations, joint swelling, severe headache)
- If neurological or cardiac involvement: urgent referral to infectious diseases or neurology

**References:**
- NICE NG95: Lyme disease - https://www.nice.org.uk/guidance/ng95
- PHE: Lyme disease epidemiology and surveillance - https://www.gov.uk/government/collections/lyme-disease-guidance-data-and-analysis
- NICE CKS: Lyme disease - https://cks.nice.org.uk/topics/lyme-disease/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took detailed rash history (expanding, central clearing, timing after tick exposure)", "Assessed the rash visually via video and identified features of erythema migrans", "Asked about tick exposure and endemic area activity", "Screened for systemic symptoms of early Lyme disease (fever, myalgia, fatigue, headache)", "Screened for features of disseminated Lyme (facial palsy, cardiac, joint, neurological)", "Assessed the timeline from exposure to rash onset", "Explored ICE (anxiety about long-term effects, expectation of antibiotics)", "Gathered information efficiently and systematically"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised erythema migrans as a clinical diagnosis not requiring serology before treatment", "Prescribed doxycycline 100mg BD for 21 days as first-line per NICE NG95", "Explained why serological testing is unreliable in early disease", "Provided clear advice on completing the antibiotic course and sun precautions", "Gave specific tick prevention advice for future countryside walks", "Provided clear safety-netting (return if rash worsens, new neurological or cardiac symptoms)", "Discussed when referral to secondary care would be needed", "Engaged the patient in shared decision-making"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Took the patient''s concerns seriously from the start", "Acknowledged the patient''s research without being dismissive", "Provided reassurance about prognosis with early treatment", "Addressed anxiety about long-term complications in a balanced way", "Explained things clearly and in non-technical language", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 6: Post-ICU Follow-up (RESP-006)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Post-ICU Follow-up - Post-Intensive Care Syndrome',
  'Respiratory',
  'RESP-006',
  'Video consultation. A 52-year-old man who was discharged from hospital six weeks ago following a prolonged ICU admission with COVID pneumonia. He has been referred back to the GP by the hospital discharge team. He looks thin and is visibly short of breath at rest on the video.',
  '{"name": "Mr. Anthony Driscoll", "age": 52, "gender": "Male"}',
  '{"patient": "Mr. Anthony Driscoll", "age": 52, "gender": "Male", "pmh": "Type 2 diabetes, hypertension, previous smoker (quit 2018), obstructive sleep apnoea (on CPAP)", "medications": "Metformin 500mg BD (reduced from 1g BD during admission), Ramipril 5mg OD, Atorvastatin 20mg ON, Enoxaparin 40mg OD SC (prophylactic, due to stop next week), Salbutamol inhaler PRN", "allergies": "Codeine (nausea)"}',
  '{
    "opening_statement": "Hello doctor. I am not sure where to start really. I was in the ICU for three weeks with COVID and I came home about six weeks ago. I just do not feel like myself at all. I cannot do anything. I feel like a completely different person.",
    "freely_given_history": {
      "presenting_complaint": "I was in hospital for five weeks altogether, three of those in ICU. I was on a ventilator for about ten days. Since coming home I have been struggling with everything. I get breathless just walking to the kitchen. I have no energy at all. I have lost about two stone while I was in hospital. My muscles have wasted away and I feel so weak. I am also having trouble with my memory and concentration.",
      "psychosocial_impact": "Before all this I was a fit and active man. I ran my own plumbing business. I cannot work at the moment and I do not know when I will be able to. I am worried about money. My wife has had to take time off work to look after me. I am having nightmares about being in the ICU. I wake up in a panic feeling like I cannot breathe. I sometimes have flashbacks during the day where I feel like I am back in hospital with a tube in my throat.",
      "ice": {
        "ideas": "I do not know what is wrong with me. I thought I would bounce back after a few weeks but I seem to be getting worse if anything. I am starting to think I will never be the same again.",
        "concerns": "I am worried my lungs are permanently damaged. I am also worried about my mental health because the nightmares and flashbacks are really frightening. And I cannot support my family if I cannot work.",
        "expectations": "I need help. I need someone to coordinate my care because I feel like I have been abandoned since leaving hospital. I have not seen anyone apart from the district nurse who takes my blood."
      }
    },
    "history_on_direct_questioning": {
      "respiratory": {
        "breathlessness": "I am breathless at rest sometimes. I cannot walk more than about twenty metres without stopping. Before hospital I could walk miles.",
        "cough": "I have a dry cough that comes and goes. It is not productive.",
        "oxygen": "I was on home oxygen for the first two weeks after discharge. It was stopped when my saturations were above 94%.",
        "exercise_tolerance": "Minimal. I can get to the bathroom and back. Stairs take me about five minutes."
      },
      "cognitive": {
        "memory": "My short-term memory is terrible. I forget conversations, I cannot follow a TV programme, I lose track of what I am saying mid-sentence.",
        "concentration": "I cannot concentrate for more than a few minutes.",
        "reading": "I used to read a lot but I cannot take anything in now."
      },
      "psychological": {
        "nightmares": "Most nights. They are about being in the ICU, about dying, about not being able to breathe.",
        "flashbacks": "A few times a week. They come out of nowhere. Certain sounds trigger them, like alarms or beeping.",
        "mood": "I feel very low. I have cried more in the past six weeks than in my entire life. I feel like a burden on my wife.",
        "anxiety": "I am anxious a lot. I check my oxygen saturations constantly on a finger monitor. If it drops below 95 I panic.",
        "suicidal_thoughts": "No. I want to get better. I have not thought about harming myself."
      },
      "physical": {
        "weight_loss": "About two stone during hospital. I have not regained any of it.",
        "appetite": "Poor. I do not enjoy food. Everything tastes different since COVID.",
        "muscle_weakness": "Severe. I can barely grip things. I cannot open jars or carry a kettle.",
        "sleep": "Broken by nightmares. I probably sleep three or four hours a night.",
        "pain": "Aches in my shoulders and hips. The ICU team said it was from being prone."
      }
    },
    "secondary_history": {
      "icu_stay": "I was ventilated for ten days, proned several times, had a tracheostomy, and was on IV sedation. I have very fragmented memories of the ICU. Some of them might not be real.",
      "hospital_follow_up": "I have a chest X-ray booked for twelve weeks post-discharge. I have not been given any other follow-up appointments yet.",
      "rehabilitation": "Nobody has mentioned rehabilitation. I was seen by a physiotherapist on the ward before discharge but not since."
    },
    "ice": {
      "ideas": "I think something is seriously wrong with me beyond just recovering from COVID. My wife thinks I might have PTSD.",
      "concerns": "I am terrified I will never get back to normal. I am worried about my business failing and about my marriage.",
      "expectations": "I want someone to take charge of my care. I want a plan. I want to know if my lungs are going to recover. I want help with the nightmares."
    },
    "specific_prompts": "If the doctor acknowledges the post-ICU syndrome and explains that what you are experiencing is a recognised condition, feel validated and relieved that it has a name. If the doctor talks about rehabilitation and psychology support, engage positively. If the doctor screens for PTSD formally, answer the questions openly. If the doctor seems overwhelmed and tries to address everything superficially, express frustration that you need a proper plan."
  }',
  'EMOTIONALLY VULNERABLE but determined. You are a man who is used to being strong and independent and you are clearly struggling with feeling so helpless. You may become tearful when talking about the nightmares or about being a burden. You are not depressed in a flat way; you are distressed and frustrated. You engage best with a doctor who listens, validates, and offers a structured plan.',
  'full',
  720,
  'hard',
  ARRAY['Recognise post-intensive care syndrome (PICS) - physical, cognitive, and psychological domains', 'Screen for PTSD symptoms (nightmares, flashbacks, hypervigilance)', 'Assess respiratory recovery and arrange appropriate follow-up investigations', 'Address cognitive impairment (ICU-acquired cognitive dysfunction)', 'Refer to pulmonary rehabilitation and post-ICU follow-up clinic', 'Consider psychological support (IAPT, trauma-focused CBT)', 'Address practical concerns (financial, work, benefits)', 'Coordinate a multi-professional recovery plan'],
  '## Model Approach

**What this case is testing:** Recognition and management of post-intensive care syndrome (PICS), screening for ICU-related PTSD, coordinating multi-professional rehabilitation, and providing holistic support to a patient with complex recovery needs.

**Data Gathering:**
- Assess the three domains of PICS:
  - Physical: breathlessness, exercise tolerance, muscle weakness (ICU-acquired weakness), weight loss, fatigue, pain
  - Cognitive: memory, concentration, executive function (ICU-acquired cognitive impairment)
  - Psychological: nightmares, flashbacks, hypervigilance (PTSD screen), mood, anxiety, suicidal ideation
- Understand the ICU stay: duration, ventilation, proning, sedation, tracheostomy, delirium
- Assess current functional status and activities of daily living
- Review current medications and outstanding follow-up
- Assess nutritional status and weight recovery
- ICE: feeling abandoned by the system, wanting coordinated care, fear of permanent disability

**Clinical Management:**
- Name the condition: explain post-intensive care syndrome (PICS) as a recognised entity with physical, cognitive, and psychological components
- Respiratory:
  - Check oxygen saturations via video (if pulse oximeter available)
  - Arrange repeat bloods: FBC, CRP, U&Es, LFTs, HbA1c (diabetes management during illness)
  - Ensure chest X-ray at 12 weeks is booked (already arranged)
  - Consider spirometry when able, and referral for respiratory follow-up if not improving
  - Refer to pulmonary rehabilitation programme
- Psychological:
  - Formal PTSD screening (PCL-5 or similar)
  - Refer to IAPT or clinical psychology for trauma-focused CBT
  - Consider whether the nightmares warrant short-term pharmacological support
  - Validate the experience and normalise the symptoms
- Cognitive:
  - Cognitive assessment if symptoms persist (MoCA or similar)
  - Referral to neuropsychology if significant impairment
  - Practical strategies: written lists, reminders, pacing activities
- Physical:
  - Refer to community physiotherapy or rehabilitation team
  - Nutritional support: dietitian referral, high-protein diet for muscle recovery
  - Review CPAP compliance for OSA
- Practical:
  - Discuss fit note for work (may need extended period)
  - Signpost to benefits advice (PIP, ESA if self-employed)
  - Consider ICUsteps charity for peer support
- Coordinate: write to post-ICU follow-up clinic if available, act as care coordinator in primary care

**References:**
- NICE NG188: COVID-19 rapid guideline: managing the long-term effects - https://www.nice.org.uk/guidance/ng188
- FICM: Framework for post-ICU follow-up - https://www.ficm.ac.uk/
- NICE CG83: Rehabilitation after critical illness - https://www.nice.org.uk/guidance/cg83
- ICUsteps charity: https://www.icusteps.org/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Assessed all three domains of PICS (physical, cognitive, psychological)", "Took a detailed respiratory history (breathlessness, exercise tolerance, oxygen history)", "Assessed cognitive function (memory, concentration, executive function)", "Screened for PTSD symptoms (nightmares, flashbacks, hypervigilance, avoidance)", "Asked about mood and specifically screened for suicidal ideation", "Assessed functional status and impact on daily living", "Explored ICE (feeling abandoned, wanting a plan, fear of permanent disability)", "Gathered information sensitively and allowed the patient to express distress"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Named and explained post-intensive care syndrome as a recognised condition", "Referred to pulmonary rehabilitation for physical recovery", "Referred for psychological support (IAPT or clinical psychology for trauma-focused CBT)", "Addressed cognitive symptoms and suggested appropriate assessment or strategies", "Arranged appropriate investigations (bloods, ensure CXR booked, consider spirometry)", "Addressed practical needs (fit note, benefits advice, work capacity)", "Provided a coordinated multi-professional plan rather than piecemeal advice", "Provided safety-netting and a clear follow-up plan"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was empathetic and allowed the patient to express emotion without rushing", "Validated the patient''s experience and normalised the PICS symptoms", "Avoided dismissive phrases like ''it will just take time''", "Acknowledged the impact on the patient''s identity and role as a provider", "Used clear, non-medical language to explain the recovery plan", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 7: Travel Vaccination Advice (GP-009)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Travel Vaccination Advice - Trip to Sub-Saharan Africa',
  'General Practice',
  'GP-009',
  'Video consultation. A 45-year-old woman is planning a three-week trip to Kenya and Tanzania in eight weeks'' time and wants advice about travel vaccinations and health precautions.',
  '{"name": "Mrs. Linda Chandra", "age": 45, "gender": "Female"}',
  '{"patient": "Mrs. Linda Chandra", "age": 45, "gender": "Female", "pmh": "Asthma (well-controlled), migraine with aura", "medications": "Clenil (beclometasone) 200mcg BD, Salbutamol PRN, Sumatriptan 50mg PRN, Combined oral contraceptive pill (Microgynon)", "allergies": "Egg allergy (mild - gets mild urticaria, can eat well-cooked egg)"}',
  '{
    "opening_statement": "Hello doctor. I am going on a big trip to Africa in about eight weeks and I want to make sure I am up to date with all my jabs and everything I need to stay safe out there.",
    "freely_given_history": {
      "presenting_complaint": "My husband and I are going to Kenya and Tanzania for three weeks. We are doing a safari and then a few days on the coast near Mombasa. We are also planning to climb Mount Kilimanjaro. I know I need vaccinations and maybe malaria tablets but I do not really know what I need.",
      "psychosocial_impact": "This is a once-in-a-lifetime trip. We have been saving for years. I just want to make sure I stay healthy and enjoy it. I do not want to be worrying about disease the whole time.",
      "ice": {
        "ideas": "I think I need yellow fever, typhoid, and maybe hepatitis jabs. I have read online about malaria tablets but I am not sure which ones are best. My friend said some of them give you terrible nightmares.",
        "concerns": "I am a bit worried about the egg allergy and whether that affects which vaccines I can have. I am also worried about altitude sickness on Kilimanjaro.",
        "expectations": "I want a clear plan of what I need. I am happy to pay for the private travel vaccines. I just want to be properly prepared."
      }
    },
    "history_on_direct_questioning": {
      "travel_details": {
        "destination": "Kenya and Tanzania. Starting in Nairobi, then the Masai Mara, Serengeti, and Ngorongoro Crater. Then a few days in Zanzibar and coastal Mombasa. Then Mount Kilimanjaro.",
        "duration": "Three weeks.",
        "departure": "In about eight weeks.",
        "accommodation": "Mainly safari lodges and a beach hotel. Kilimanjaro will be camping.",
        "activities": "Safari game drives, beach, and trekking Kilimanjaro (five-day route)."
      },
      "vaccination_history": {
        "childhood_vaccines": "I think I had everything as a child. I am not sure about boosters.",
        "previous_travel_vaccines": "I had hepatitis A and typhoid about ten years ago for a trip to India. I have never had yellow fever.",
        "tetanus": "I cannot remember when my last tetanus was. It might have been at school.",
        "covid": "I have had three COVID vaccinations."
      },
      "medical_details": {
        "asthma": "Well-controlled. I use my preventer inhaler twice a day and rarely need the reliever. No hospital admissions.",
        "migraine": "I get migraines with aura about once every two to three months. Sumatriptan works well.",
        "egg_allergy": "It is mild. I get a bit of a rash if I eat something with a lot of egg in it, like a quiche. I can eat cake and things with cooked egg in them without a problem.",
        "contraception": "I am on Microgynon. I have been on it for years without problems."
      }
    },
    "secondary_history": {
      "altitude_experience": "I have never been to high altitude before. Kilimanjaro summit is about 5,900 metres.",
      "travel_companions": "My husband is fit and well with no medical problems."
    },
    "ice": {
      "ideas": "I think I need quite a lot of vaccinations and malaria tablets.",
      "concerns": "I am worried about the egg allergy and vaccines, about altitude sickness, and about malaria tablet side effects.",
      "expectations": "I want a complete list of what I need and a plan for getting it all done in time."
    },
    "specific_prompts": "If the doctor mentions the yellow fever vaccine and egg allergy, ask whether it is safe for you. If the doctor mentions altitude sickness, ask what you can do to prevent it. If the doctor discusses malaria prophylaxis options, ask about the one that does not cause nightmares. If the doctor notices the contraceptive pill and migraine with aura, engage with the discussion."
  }',
  'ORGANISED and proactive. You have a notebook and are writing things down. You ask sensible follow-up questions. You are easy to consult with because you are engaged and motivated to protect your health. You may ask about altitude sickness and diarrhoea prevention if the doctor does not mention them.',
  'full',
  720,
  'easy',
  ARRAY['Advise on recommended travel vaccinations for East Africa', 'Discuss yellow fever vaccination (mandatory) and egg allergy considerations', 'Discuss malaria prophylaxis options and help choose an appropriate one', 'Address altitude sickness prevention for Kilimanjaro', 'Review current medications in context of travel', 'Note contraceptive pill and migraine with aura (unrelated incidental finding)', 'Discuss travel health kit and general precautions', 'Advise on food and water hygiene'],
  '## Model Approach

**What this case is testing:** Travel health consultation for Sub-Saharan Africa including vaccination advice, malaria prophylaxis, altitude sickness prevention, and identifying an incidental prescribing concern (COCP with migraine with aura).

**Data Gathering:**
- Detailed itinerary: countries, regions, duration, accommodation type, activities
- Previous vaccination history and any travel vaccines previously received
- Medical history including allergies (egg allergy relevant to yellow fever vaccine)
- Current medications review
- Altitude exposure plans (Kilimanjaro = 5,895m)
- ICE: wants comprehensive preparation, concerned about egg allergy and malaria tablets

**Clinical Management:**
- Vaccinations for Kenya/Tanzania:
  - Yellow fever: MANDATORY for entry (certificate required). The vaccine is grown in eggs but JCVI/PHE advise that people with mild egg allergy (urticaria only) can receive it in primary care. Severe egg allergy would require specialist centre. This patient has mild allergy - can proceed with standard precautions
  - Hepatitis A: booster if >10 years since primary course (patient had it 10 years ago - likely needs a booster)
  - Typhoid: booster needed (only lasts 3 years for injection)
  - Diphtheria/tetanus/polio: check and boost if needed
  - Consider: hepatitis B, meningococcal ACWY, rabies (safari/camping in rural areas)
  - Cholera: generally not required for tourist travel
- Malaria prophylaxis:
  - Kenya and Tanzania are high-risk malaria areas
  - Options: atovaquone-proguanil (Malarone), doxycycline, or mefloquine
  - Mefloquine associated with neuropsychiatric side effects (nightmares the friend mentioned)
  - Atovaquone-proguanil is well-tolerated, start 1-2 days before, continue 7 days after
  - Also advise mosquito bite prevention: DEET repellent, treated bed nets, long sleeves at dusk
- Altitude sickness (Kilimanjaro):
  - Discuss acute mountain sickness (AMS): headache, nausea, dizziness
  - Gradual ascent, adequate hydration, recognise symptoms
  - Consider acetazolamide 125mg BD prophylaxis starting 1-2 days before ascent
  - Asthma: ensure adequate inhaler supply, cold air may trigger symptoms at altitude
- Incidental finding:
  - Migraine WITH AURA is a contraindication to the combined oral contraceptive pill (UKMEC 4) due to increased stroke risk
  - This should be flagged and discussed, with switch to progestogen-only method
- General advice: travel health kit, sun protection, food and water hygiene, travel insurance, standby treatment for traveller''s diarrhoea

**References:**
- NaTHNaC: Country information - https://travelhealthpro.org.uk/
- NICE CKS: Travel vaccinations - https://cks.nice.org.uk/topics/immunizations-travel/
- BNF: Malaria prophylaxis - https://bnf.nice.org.uk/treatment-summaries/malaria-prophylaxis/
- UKMEC: Contraception guidance - https://www.fsrh.org/standards-and-guidance/documents/ukmec-2016/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took a detailed travel itinerary (countries, regions, activities, duration)", "Reviewed previous vaccination history and identified gaps", "Asked about egg allergy in the context of yellow fever vaccination", "Assessed altitude exposure plans (Kilimanjaro)", "Reviewed current medications including contraception", "Identified migraine with aura and COCP as a prescribing concern", "Explored ICE (concerns about egg allergy, malaria tablet side effects, altitude)", "Gathered information systematically and efficiently"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recommended appropriate travel vaccinations (yellow fever, hepatitis A booster, typhoid, diphtheria/tetanus/polio)", "Addressed egg allergy and yellow fever vaccine safety appropriately", "Discussed malaria prophylaxis options with their pros and cons", "Discussed altitude sickness prevention (gradual ascent, acetazolamide)", "Identified COCP with migraine with aura as UKMEC 4 and discussed switching", "Provided general travel health advice (food hygiene, insect bite prevention, travel kit)", "Ensured adequate time for vaccination schedule (8 weeks before travel)", "Engaged the patient in shared decision-making about prophylaxis options"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was enthusiastic and supportive about the patient''s trip", "Explained recommendations clearly without causing unnecessary alarm", "Addressed each concern individually and thoroughly", "Encouraged the patient''s proactive approach to travel health", "Provided practical and actionable advice", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 8: Periorbital Cellulitis in Child (PAED-010)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Periorbital Cellulitis in Child - Urgent Assessment',
  'Paediatrics',
  'PAED-010',
  'Telephone consultation. A mother is calling about her 4-year-old son who has developed a red, swollen eye and a fever. The child has had a cold for the past few days.',
  '{"name": "Archie Bennett", "age": 4, "gender": "Male"}',
  '{"patient": "Archie Bennett", "age": 4, "gender": "Male", "pmh": "Recurrent ear infections, grommets inserted age 3", "medications": "None regular", "allergies": "No known allergies"}',
  '{
    "opening_statement": "Hello doctor, I am really worried about my little boy Archie. He is four. His eye has gone really red and swollen and puffy and he has a temperature. It has come on quite quickly and it looks awful.",
    "freely_given_history": {
      "presenting_complaint": "Archie has had a runny nose and a cough for about four days. He seemed to be getting better yesterday but this morning when he woke up his left eye was really swollen and red. The skin around the eye is puffy and hot to touch. He keeps saying his eye hurts. He has a temperature of 38.6 degrees. He has been a bit clingy and not himself but he has been eating and drinking.",
      "psychosocial_impact": "I am really frightened. It looks terrible. My mum said it could be something serious with the eye. I do not know if I should take him to A and E or if you can help.",
      "ice": {
        "ideas": "My mum thinks it might be an infection behind the eye. I have seen things online about orbital cellulitis and it scared me.",
        "concerns": "I am terrified it could affect his eyesight. He keeps rubbing the eye and crying.",
        "expectations": "I want someone to look at him today. I am not sure if I should bring him to the surgery or go straight to the hospital."
      }
    },
    "history_on_direct_questioning": {
      "eye_symptoms": {
        "swelling": "The whole area around his left eye is swollen. The eyelid is so puffy he can barely open it.",
        "redness": "The skin is very red and hot. It is mainly the upper and lower eyelid and a bit below.",
        "discharge": "A bit of yellow crusty stuff in the corner of the eye. Not a lot of pus coming out.",
        "vision": "When I can get him to open the eye he seems to be able to see my fingers. He does not seem to have blurred vision but he is only four so it is hard to tell.",
        "eye_movements": "I think he can move the eye normally but it is really hard to tell because he keeps shutting it and crying when I try to look.",
        "protrusion": "I do not think the eye is sticking out. Both eyes look about the same when I look from above.",
        "pain_on_movement": "He cries when I try to get him to look to the side but I am not sure if that is because it hurts or because he is upset."
      },
      "systemic_symptoms": {
        "temperature": "38.6 this morning. I gave him Calpol about an hour ago.",
        "behaviour": "He is a bit clingy and whiny but he is still playing with his cars on the sofa. He is not floppy or lethargic.",
        "eating_drinking": "He ate some toast and has been drinking his juice. Not as much as normal though.",
        "rash": "No rash anywhere.",
        "headache": "He has not complained of a headache but he is only four so he might not say."
      },
      "recent_illness": {
        "cold_symptoms": "Runny nose, cough, and a bit of a snore for about four days. He has had green snot for the past two days.",
        "ear_problems": "He has not been pulling at his ears.",
        "previous_similar": "He has never had anything like this before."
      }
    },
    "secondary_history": {
      "insect_bites": "I do not think he has been bitten. We have not been anywhere unusual.",
      "trauma": "No injury to the eye or face.",
      "contacts": "His sister had a cold last week but she is fine now."
    },
    "ice": {
      "ideas": "I think the cold has caused an infection in the eye area.",
      "concerns": "I am worried about his eyesight and about the infection spreading. My mum mentioned meningitis.",
      "expectations": "I want him seen today. I want to know if he needs to go to hospital."
    },
    "specific_prompts": "If the doctor asks you to describe the red flags in detail (eye movements, protrusion, vision), try your best but explain that Archie is being uncooperative. If the doctor recommends going to A and E or the paediatric assessment unit, accept this readily. If the doctor suggests waiting or just starting oral antibiotics without examination, push back and say you feel he needs to be seen. If the doctor offers to see him at the surgery urgently, accept but ask if he needs hospital instead."
  }',
  'WORRIED MOTHER. You are clearly anxious and your voice is a bit shaky. You want someone to take this seriously. You are cooperative and will do your best to describe what you can see. You will accept advice to go to hospital if it is explained clearly. If the doctor minimises the situation, you become more anxious and insistent.',
  'full',
  720,
  'hard',
  ARRAY['Differentiate preseptal (periorbital) from orbital cellulitis via telephone', 'Recognise the limitations of telephone assessment for this presentation', 'Identify red flags for orbital cellulitis (proptosis, ophthalmoplegia, reduced vision, pain on eye movement)', 'Understand that orbital cellulitis is a medical emergency', 'Assess the child''s general condition and systemic wellbeing', 'Make a safe decision about same-day referral pathway', 'Consider sinusitis as the underlying cause', 'Provide clear safety-netting for the parent'],
  '## Model Approach

**What this case is testing:** Differentiation between preseptal and orbital cellulitis via telephone in a child, recognition of the limitations of remote assessment, and making safe referral decisions.

**Data Gathering:**
- Detailed eye assessment via parent description:
  - Preseptal signs: eyelid swelling and erythema, preserved eye movements, normal vision, no proptosis, no pain on eye movement
  - Orbital signs (red flags): proptosis, restricted/painful eye movements (ophthalmoplegia), reduced visual acuity, relative afferent pupillary defect, systemic toxicity
- Preceding illness: URTI with green nasal discharge suggests possible sinusitis (commonest cause of orbital cellulitis in children)
- Systemic assessment: temperature, behaviour, alertness, feeding, hydration
- Exclude other causes: insect bite, trauma, allergic reaction, dacryocystitis
- Assess the child''s general condition (is the child toxic or well-appearing?)
- ICE: mother is frightened, wants same-day assessment

**Clinical Management:**
- Key clinical decision: preseptal vs orbital cellulitis
  - Preseptal cellulitis: infection anterior to the orbital septum, generally manageable with oral antibiotics
  - Orbital cellulitis: infection posterior to the orbital septum, a medical EMERGENCY requiring IV antibiotics and CT imaging
  - In a 4-year-old with preceding sinusitis, fever, and periorbital swelling, orbital cellulitis must be excluded
- TELEPHONE LIMITATION: it is very difficult to reliably differentiate preseptal from orbital cellulitis by telephone, especially in a 4-year-old who is uncooperative with examination
- SAFE DECISION: refer for same-day paediatric assessment (paediatric assessment unit or A&E)
  - The child needs a proper eye examination including visual acuity (if possible), eye movements, pupil assessment, and assessment for proptosis
  - CT orbits with contrast may be needed if orbital cellulitis is suspected
- If clearly preseptal (mild swelling, no systemic features, preserved eye movements) AND clinician can examine the child in surgery: co-amoxiclav first-line (NICE CKS)
- However, given the fever 38.6, the preceding sinusitis, and inability to examine remotely, the safest option is same-day hospital assessment
- Interim advice: continue regular paracetamol, encourage fluids, do not attempt to force the eye open
- Safety-net: call 999 if the child becomes drowsy, stops drinking, develops a rash, or the swelling spreads rapidly

**References:**
- NICE CKS: Periorbital and orbital cellulitis - https://cks.nice.org.uk/topics/cellulitis-periorbital-orbital/
- BMJ Best Practice: Orbital cellulitis - https://bestpractice.bmj.com/topics/en-gb/622
- RCEM: Paediatric periorbital cellulitis - https://www.rcem.ac.uk/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Systematically assessed for features differentiating preseptal from orbital cellulitis", "Asked about eye movements, proptosis, visual acuity, and pain on eye movement", "Assessed the child''s general condition and systemic features", "Identified preceding sinusitis as a risk factor for orbital cellulitis", "Excluded other causes (trauma, insect bite, allergic reaction)", "Assessed feeding, drinking, and behaviour as markers of severity in a child", "Explored the parent''s concerns and ICE effectively", "Recognised the limitations of telephone assessment for this presentation"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Recognised that preseptal vs orbital cellulitis cannot be reliably differentiated by telephone in a young child", "Made a safe decision to refer for same-day paediatric assessment", "Explained why hospital assessment is the safest option", "Discussed what the hospital assessment would involve (examination, possible CT)", "Provided interim advice (paracetamol, fluids, do not force eye open)", "Provided clear safety-netting (call 999 if child deteriorates, becomes drowsy, rash, rapid spread)", "Considered sinusitis as the underlying cause and its significance", "Engaged the parent in the plan and addressed their specific concerns"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Was calm and reassuring with an anxious parent", "Validated the mother''s concern and did not minimise the presentation", "Communicated urgency without causing panic", "Used clear, jargon-free language", "Was patient when the parent struggled to assess the child''s eye", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);

-- =====================================================
-- CASE 9: Methotrexate Blood Monitoring Discussion (RHEUM-003)
-- =====================================================
INSERT INTO sca_cases (
  title, category, category_code, scenario, patient_info, case_notes, actor_info, actor_behaviour,
  case_type, time_limit, difficulty, key_points, model_answer, is_pro, published, marking_criteria
) VALUES (
  'Methotrexate Blood Monitoring Discussion',
  'Rheumatology',
  'RHEUM-003',
  'Telephone consultation. A patient on methotrexate for rheumatoid arthritis has missed her last two blood monitoring appointments. The practice pharmacist has flagged this and asked you to call her to discuss the importance of monitoring.',
  '{"name": "Mrs. Eileen Storey", "age": 67, "gender": "Female"}',
  '{"patient": "Mrs. Eileen Storey", "age": 67, "gender": "Female", "pmh": "Rheumatoid arthritis (diagnosed 2018), osteoporosis, hypertension, chronic kidney disease stage 2", "medications": "Methotrexate 15mg once weekly (oral), Folic acid 5mg six days a week (not on methotrexate day), Alendronate 70mg once weekly, Ramipril 5mg OD, Adcal D3 two tablets daily", "allergies": "Sulfonamides (rash)"}',
  '{
    "opening_statement": "Oh hello doctor. I was not expecting you to ring. Is everything alright? Has something come up on my blood tests?",
    "freely_given_history": {
      "presenting_complaint": "I have not had my blood tests done for a little while, I know. I was supposed to go about six weeks ago and then again two weeks ago but I have not been. I have been meaning to but I just have not got round to it. The methotrexate seems to be working fine and I feel well.",
      "psychosocial_impact": "The blood tests are a bit of a nuisance to be honest. I have to get the bus to the surgery and my husband used to drive me but he passed away four months ago. I have been on my own since then and I just find it hard to get motivated to go out. Some days I barely leave the house.",
      "ice": {
        "ideas": "I thought the blood tests were just routine. I did not think it was urgent. The methotrexate has been working well for my arthritis and I feel fine so I did not think there was any rush.",
        "concerns": "Now you are calling me I am a bit worried. Have I done something wrong? Is the methotrexate dangerous?",
        "expectations": "I would like to keep taking the methotrexate because my joints were terrible before I started it. I do not want to go back to how I was."
      }
    },
    "history_on_direct_questioning": {
      "methotrexate_details": {
        "dose": "Fifteen milligrams once a week. I take it on a Thursday evening.",
        "adherence": "I have not missed any doses. I always remember because I have an alarm on my phone.",
        "folic_acid": "Yes, I take that every day except Thursday.",
        "duration": "I have been on it for about six years now.",
        "last_blood_test": "I think it was about four months ago. Everything was normal then."
      },
      "side_effects": {
        "nausea": "I used to feel a bit sick the day after taking it but that settled down years ago.",
        "mouth_ulcers": "No.",
        "hair": "My hair has thinned a bit over the years but nothing dramatic.",
        "bruising_bleeding": "I have noticed I bruise more easily than I used to but I thought that was just my age.",
        "infections": "I had a chest infection about six weeks ago. The out-of-hours doctor gave me antibiotics and it cleared up.",
        "breathlessness": "I do get a bit breathless when I walk up the hill to the bus stop but I put that down to being unfit."
      },
      "current_symptoms": {
        "joints": "My arthritis is much better than before the methotrexate. My hands and knees are still a bit stiff in the morning but nothing like they were.",
        "general_health": "I feel alright in myself. A bit tired but I am not sleeping well since my husband died.",
        "appetite": "Not great. I am not cooking proper meals for just myself.",
        "mood": "I have been quite low since my husband passed. I miss him terribly. Some days I do not see the point in much."
      }
    },
    "secondary_history": {
      "bereavement": "My husband Eric died four months ago from a heart attack. It was very sudden. We were married for forty-three years. I have not really dealt with it.",
      "social_support": "My daughter lives about an hour away. She comes at weekends when she can. I have some neighbours who check on me but I keep myself to myself mostly.",
      "driving": "I have never driven. Eric always did the driving."
    },
    "ice": {
      "ideas": "I think the blood tests are just checking everything is ticking along okay.",
      "concerns": "I am worried now that I might have caused damage to myself by missing the tests. I am also worried you might stop the methotrexate.",
      "expectations": "I want to carry on with the methotrexate but I would like some help getting the blood tests done. It is just getting there that is the problem."
    },
    "specific_prompts": "If the doctor explains the specific risks of not monitoring (liver damage, bone marrow suppression), listen carefully and take it seriously. If the doctor offers practical solutions for getting blood tests done (phlebotomist home visit, flexible appointment times), respond positively. If the doctor asks about your mood and bereavement, become a bit tearful but appreciate being asked. If the doctor only focuses on the blood tests without asking how you are coping generally, feel a bit dismissed."
  }',
  'INITIALLY CASUAL about the missed blood tests but becomes more serious when the risks are explained. You are a warm, polite older woman who is clearly grieving and somewhat isolated. You are not deliberately non-compliant; you are struggling with practical barriers and bereavement. If the doctor shows genuine interest in how you are coping, you open up. If the doctor is purely task-focused, you remain pleasant but guarded.',
  'full',
  720,
  'medium',
  ARRAY['Explain the importance of regular methotrexate blood monitoring', 'Identify the specific risks of unmonitored methotrexate (bone marrow suppression, hepatotoxicity, renal impairment)', 'Explore reasons for non-attendance (practical barriers, bereavement)', 'Screen for methotrexate side effects and red flag symptoms', 'Arrange urgent blood tests and offer practical solutions for access', 'Identify bereavement and low mood as underlying factors', 'Check for concerning symptoms (easy bruising, infections, breathlessness)', 'Holistic approach addressing both the medication safety and the patient''s wellbeing'],
  '## Model Approach

**What this case is testing:** Understanding of methotrexate shared care monitoring requirements, identifying and addressing barriers to compliance, recognising bereavement as a factor, and providing holistic care while ensuring medication safety.

**Data Gathering:**
- Establish the timeline of missed monitoring (last blood test approximately 4 months ago, should be monthly or at minimum every 3 months for stable patients)
- Explore reasons for non-attendance: practical barriers (transport, bereavement) not deliberate non-compliance
- Review methotrexate: dose, duration, adherence, folic acid co-prescription
- Screen for methotrexate side effects and red flags:
  - Bone marrow suppression: easy bruising, bleeding, recurrent infections, fatigue
  - Hepatotoxicity: nausea, abdominal pain, jaundice
  - Pulmonary toxicity (methotrexate pneumonitis): breathlessness, dry cough
  - Renal impairment: baseline CKD stage 2 increases risk
- Assess bereavement: when, how coping, social support, mood, appetite, sleep
- ICE: did not realise urgency of monitoring, worried about losing medication, wants practical help

**Clinical Management:**
- Explain WHY monitoring is essential:
  - Methotrexate can suppress the bone marrow (risk of life-threatening pancytopenia)
  - Can cause liver fibrosis/cirrhosis with long-term use
  - Can cause renal impairment (and she already has CKD)
  - Can rarely cause methotrexate pneumonitis
  - Monitoring detects these problems BEFORE they become dangerous
- Required monitoring: FBC, U&Es, LFTs at MINIMUM every 3 months for stable patients (BSR/BHPR guidelines), more frequently if dose changes
- Arrange URGENT blood tests this week: FBC (check for bone marrow suppression - note easy bruising), U&Es (CKD), LFTs
- Concerning symptoms to investigate: easy bruising (possible thrombocytopenia), breathlessness (possible methotrexate pneumonitis or anaemia), recurrent infection (possible neutropenia)
- If bloods are significantly abnormal: may need to withhold methotrexate pending results
- Practical solutions for access: home phlebotomy visit, early morning appointments, arrange transport support
- Address bereavement: screen for depression (PHQ-9), offer bereavement counselling referral (Cruse), explore social isolation and support
- Follow-up: review blood results within 48 hours, plan for regular monitoring going forward with practical support in place

**References:**
- BSR/BHPR guidelines for DMARD monitoring - https://academic.oup.com/rheumatology/article/56/6/865/3053478
- NICE CKS: Methotrexate - https://cks.nice.org.uk/topics/dmards/methotrexate/
- NICE CG79: Rheumatoid arthritis in adults - https://www.nice.org.uk/guidance/ng100
- Cruse Bereavement Support - https://www.cruse.org.uk/',
  false,
  true,
  '{
    "domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Established the timeline and extent of missed blood monitoring", "Explored reasons for non-attendance (transport barriers, bereavement, motivation)", "Screened for methotrexate side effects and red flags (bruising, infections, breathlessness)", "Reviewed methotrexate dose, duration, and adherence", "Assessed folic acid co-prescription compliance", "Explored bereavement and its impact on mood, daily function, and motivation", "Explored ICE (did not realise urgency, worried about losing medication)", "Gathered information sensitively and holistically"]},
    "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Explained the specific risks of unmonitored methotrexate (bone marrow suppression, liver toxicity, renal impairment)", "Arranged urgent blood tests (FBC, LFTs, U&Es)", "Identified concerning symptoms requiring investigation (easy bruising, breathlessness, infection)", "Offered practical solutions for blood test access (home visit, transport help, flexible times)", "Addressed the bereavement and offered appropriate support (counselling referral, social services)", "Made a clear plan for ongoing regular monitoring with practical support", "Discussed what would happen if blood results were abnormal", "Provided clear safety-netting (stop methotrexate and seek urgent help if sore throat, bruising, bleeding, breathlessness)"]},
    "domain3": {"title": "Domain 3: Relating to Others", "items": ["Approached the call without being accusatory about missed appointments", "Showed genuine interest in the patient as a whole person, not just the blood tests", "Acknowledged the bereavement and gave space for the patient to talk about it", "Was warm and empathetic throughout", "Balanced clinical urgency with sensitivity about her circumstances", "Confirmed the plan and next steps clearly"]}
  }'::jsonb
);
