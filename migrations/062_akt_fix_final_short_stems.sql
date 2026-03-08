-- Migration 062: Fix final batch of short stems + delete remaining duplicates.
-- Run in Supabase SQL Editor. Safe to re-run.

-----------------------------------------------------------
-- PART 1: DELETE REMAINING DUPLICATES
-----------------------------------------------------------

-- "Revalidation frequency:" — duplicate of ed815680 (already fixed)
DELETE FROM akt_questions WHERE id = '22b6824d-438f-4624-bc62-95d537fa6740';

-- "Partnership income depends on:" — duplicate of 734e5697 (already fixed)
DELETE FROM akt_questions WHERE id = '8feb9ce5-b9a4-4b04-8395-d1a4ab230539';

-- "Workforce supervision - who supervises:" — duplicate of 6b0b61f1 (already fixed)
DELETE FROM akt_questions WHERE id = 'd5be2dee-2409-4e3b-8b70-aa7269203a4e';

-- "Significant events purpose:" — duplicate of 688b219d
DELETE FROM akt_questions WHERE id = 'd6d17bc6-a66d-40a5-9290-6d90035c9946';

-- "Appraisal primarily supports:" — duplicate of 5ab759aa
DELETE FROM akt_questions WHERE id = 'dc0fc878-2003-4aea-b29a-1ed61678ef3a';

-- "Health inequalities work includes:" — duplicate of 3830142c (already fixed)
DELETE FROM akt_questions WHERE id = 'd1079961-38b7-4692-b6c6-b144af086742';

-----------------------------------------------------------
-- PART 2: CARDIOVASCULAR
-----------------------------------------------------------

UPDATE akt_questions SET
  question = 'A 52-year-old man has a clinic blood pressure of 155/92 mmHg on two occasions. He is asked to wear a 24-hour ambulatory blood pressure monitor. Which ABPM daytime average confirms a diagnosis of hypertension?',
  updated_at = now()
WHERE id = '56d16725-7b15-420f-b59c-cf3933e7cb1a';

-----------------------------------------------------------
-- PART 3: ENDOCRINOLOGY
-----------------------------------------------------------

UPDATE akt_questions SET
  question = 'A 55-year-old overweight man has a fasting glucose of 7.2 mmol/L. The GP arranges an HbA1c. Which HbA1c value confirms a diagnosis of type 2 diabetes in a non-pregnant adult?',
  updated_at = now()
WHERE id = '3819296e-5ef2-44ca-b7ab-fbae843f45d0';

UPDATE akt_questions SET
  question = 'A GP reviews thyroid function results for several patients with raised TSH and normal free T4 (subclinical hypothyroidism). Under which circumstances is treatment with levothyroxine most appropriate?',
  updated_at = now()
WHERE id = 'dd412195-c70c-4332-bb14-82a5bf523338';

-----------------------------------------------------------
-- PART 4: EBP
-----------------------------------------------------------

UPDATE akt_questions SET
  question = 'A GP reads a trial reporting that a new statin has a Number Needed to Treat (NNT) of 20 for preventing cardiovascular events over 5 years. What does an NNT of 20 mean?',
  updated_at = now()
WHERE id = '1e6f6271-f0ac-41b1-b92c-9af0c92cd6a4';

UPDATE akt_questions SET
  question = 'A GP trainee reads a rehabilitation trial that reports a statistically significant improvement in pain scores but the change was only 0.5 points on a 10-point scale. Her supervisor explains the concept of Minimal Clinically Important Difference (MCID). What does MCID refer to?',
  updated_at = now()
WHERE id = '295537b3-df88-40eb-928b-b87f95dcf078';

UPDATE akt_questions SET
  question = 'A GP trainee is studying health economics for the AKT and learns that NICE evaluates new treatments based on their cost-effectiveness. How is cost-effectiveness usually expressed in health economic analysis?',
  updated_at = now()
WHERE id = '9092cc40-5ffc-4f0e-9c2f-00d999148c67';

UPDATE akt_questions SET
  question = 'A GP trainee is designing a study to detect a 10% difference in blood pressure reduction between two drugs. Her supervisor advises increasing the sample size to improve the study''s statistical power. What increases statistical power?',
  updated_at = now()
WHERE id = '947b6377-45b8-42ad-8a42-b0c7f3fd61fd';

UPDATE akt_questions SET
  question = 'A GP trainee asks her supervisor which study design provides the strongest evidence for establishing a causal relationship between an intervention and an outcome. Which study design best establishes causality?',
  updated_at = now()
WHERE id = '9a8975a1-4cf2-48bd-a727-de359a65f28a';

UPDATE akt_questions SET
  question = 'A GP trainee is appraising a randomised trial and notes that results were analysed on an intention-to-treat basis, including patients who did not complete the treatment. What is the purpose of intention-to-treat analysis?',
  updated_at = now()
WHERE id = 'e4f10b34-88ba-4984-bf72-5e64d85f209a';

-----------------------------------------------------------
-- PART 5: MENTAL HEALTH
-----------------------------------------------------------

UPDATE akt_questions SET
  question = 'A 38-year-old woman presents with low mood and loss of interest for 6 weeks. She has stopped eating and says she feels life is not worth living. Which symptom most strongly indicates severe depression requiring urgent assessment?',
  updated_at = now()
WHERE id = '03b517cd-b951-4352-9dc2-49ebad58b4ed';

UPDATE akt_questions SET
  question = 'A 32-year-old man with schizophrenia has been started on olanzapine. The GP needs to arrange monitoring. What metabolic monitoring is required for patients on antipsychotic medications?',
  updated_at = now()
WHERE id = '2cc1052c-eda9-4a0c-9ab4-b341c77014ab';

UPDATE akt_questions SET
  question = 'A 45-year-old man scores 25 on the AUDIT questionnaire, indicating alcohol dependence. He is drinking 60 units per week and wants to stop. What is the first-line intervention for alcohol dependence in primary care?',
  updated_at = now()
WHERE id = 'aff1a0f2-629f-4921-80a6-f4289dd3f66a';

UPDATE akt_questions SET
  question = 'A 19-year-old woman attends the GP with superficial lacerations on her forearms. She reports deliberate self-harm over the past 3 months in response to exam stress. What is the most appropriate management of self-harm?',
  updated_at = now()
WHERE id = 'c5e3d8d3-68a0-486b-ae6d-4ccbb718dfaf';

UPDATE akt_questions SET
  question = 'A 28-year-old woman with moderate depression has decided to start an antidepressant after a trial of CBT. She has no significant comorbidities. Which SSRI is most commonly recommended as first-line treatment for depression in primary care?',
  updated_at = now()
WHERE id = 'dd7e54a5-3320-4bde-9b19-f27dd9ee3d09';

UPDATE akt_questions SET
  question = 'A 16-year-old girl presents with significant weight loss, excessive exercise, and distorted body image. Her BMI is 14. Her mother is very concerned. At what BMI threshold should a patient with a suspected eating disorder be considered for urgent referral?',
  updated_at = now()
WHERE id = 'df7469d6-9f0b-4b35-9a1a-471a4fd72ac9';

-----------------------------------------------------------
-- PART 6: MUSCULOSKELETAL
-----------------------------------------------------------

UPDATE akt_questions SET
  question = 'A 50-year-old builder presents with a 4-week history of low back pain. There is no leg weakness, no bladder or bowel disturbance, and no constitutional symptoms. He asks whether he needs an MRI. When is imaging indicated for low back pain?',
  updated_at = now()
WHERE id = '0255fd6c-7015-437f-af51-763913f81ff0';

UPDATE akt_questions SET
  question = 'A 58-year-old man with recurrent gout has had three attacks in the past year. His acute attack has settled with NSAIDs. His GP considers urate-lowering therapy. When should allopurinol be started?',
  updated_at = now()
WHERE id = '7da8b38d-414c-4974-81cd-7eda836ac7ed';

UPDATE akt_questions SET
  question = 'A 72-year-old woman presents with a 2-week history of new-onset temporal headache, jaw pain when chewing, and polymyalgic symptoms. Her ESR is 68 mm/hr. Which symptom requires the most urgent action due to risk of permanent visual loss?',
  updated_at = now()
WHERE id = '92b745a8-efbf-469f-86ca-058e1748ba7c';

UPDATE akt_questions SET
  question = 'A 55-year-old man presents with acute onset of severe pain and swelling in his first metatarsophalangeal joint. Urate crystals are confirmed on aspiration. What is the first-line treatment for an acute gout attack?',
  updated_at = now()
WHERE id = 'a2310f90-90e0-409c-bf34-a16f453cf046';

UPDATE akt_questions SET
  question = 'A 40-year-old woman presents with a 6-week history of pain and swelling in the MCP and PIP joints of both hands, with morning stiffness lasting over an hour. Her CRP is elevated. Which feature most strongly warrants urgent referral for suspected rheumatoid arthritis?',
  updated_at = now()
WHERE id = 'ab192b7a-9f35-4cdd-9cfb-32e2e28e8d79';

UPDATE akt_questions SET
  question = 'A 66-year-old woman presents after sustaining a Colles'' fracture from a standing-height fall. Her GP considers assessing her fracture risk. Who qualifies for DEXA scanning for osteoporosis assessment?',
  updated_at = now()
WHERE id = 'e15f4f30-6199-48e6-bda8-037d105ca23c';

-----------------------------------------------------------
-- PART 7: NEUROLOGY
-----------------------------------------------------------

UPDATE akt_questions SET
  question = 'A 45-year-old man presents with a 3-week history of progressively worsening headache that is worse in the mornings and on bending. Examination reveals bilateral papilloedema. Which headache feature requires urgent referral?',
  updated_at = now()
WHERE id = 'df172d8f-c0cf-4e01-8549-275993ed7526';

-----------------------------------------------------------
-- PART 8: PAEDIATRICS
-----------------------------------------------------------

UPDATE akt_questions SET
  question = 'A mother brings her 7-year-old son for assessment because his teacher reports that he cannot sit still in class, frequently loses things, and interrupts others constantly. These behaviours occur both at school and at home. Which is a core symptom of ADHD?',
  updated_at = now()
WHERE id = '288b71c6-eb67-4ea5-a114-afff5c32b256';

UPDATE akt_questions SET
  question = 'A health visitor refers a 3-year-old boy who has delayed speech, engages in repetitive play, and avoids eye contact with other children. His hearing test is normal. Which feature most strongly suggests autism spectrum disorder?',
  updated_at = now()
WHERE id = '2fcaa0da-9ccd-4e44-a175-2b583e4a0970';

UPDATE akt_questions SET
  question = 'A GP is documenting a child protection assessment following a disclosure of physical abuse. The designated safeguarding lead asks the GP about documentation standards. What represents best practice for safeguarding documentation?',
  updated_at = now()
WHERE id = '765df09b-f10e-4bd1-9527-6edcf981f9ae';

-----------------------------------------------------------
-- PART 9: PALLIATIVE CARE
-----------------------------------------------------------

UPDATE akt_questions SET
  question = 'A palliative care nurse asks a GP registrar to clarify what DNACPR means for a patient''s ongoing care. The patient''s family believe it means "no treatment at all." Which statement about DNACPR is correct?',
  updated_at = now()
WHERE id = '3fc22233-e6c8-414f-b9d5-6c35d77a3db3';

UPDATE akt_questions SET
  question = 'A GP is visiting an 85-year-old man with end-stage heart failure who has been deteriorating over several days. He is now bedbound, taking only sips of water, and has noisy rattling breathing. Which clinical feature most strongly suggests the patient is in the last days of life?',
  updated_at = now()
WHERE id = 'a8576806-8c78-4419-aa11-9a01651b77b3';

UPDATE akt_questions SET
  question = 'A GP is reviewing medications for an 82-year-old woman who has had two falls in the past month. She takes amlodipine, atorvastatin, paracetamol, and temazepam at night. Which of her medications carries the highest risk of contributing to falls?',
  updated_at = now()
WHERE id = 'baa07541-a240-4390-ac7b-3afdea8b3118';

-----------------------------------------------------------
-- PART 10: PRESCRIBING
-----------------------------------------------------------

UPDATE akt_questions SET
  question = 'A 62-year-old woman with chronic insomnia has been taking diazepam 5 mg nightly for 8 years. Her GP discusses the risks of long-term benzodiazepine use. What is the major risk of long-term benzodiazepine use?',
  updated_at = now()
WHERE id = 'd807e2ad-2bb0-4256-97ae-13b91869fcf9';

-----------------------------------------------------------
-- PART 11: REMAINING PCOM
-----------------------------------------------------------

UPDATE akt_questions SET
  question = 'A GP registrar asks her trainer to explain the GP partnership model and how it differs from being a salaried GP or NHS employee. How is the GP partnership model best described?',
  updated_at = now()
WHERE id = '159277eb-2edf-4345-af1d-6f279e9e052f';

UPDATE akt_questions SET
  question = 'A GP is completing paperwork after the death of a patient in a care home. The practice manager asks about the current requirements for cremation documentation following the 2024 reforms. What is currently required for cremation?',
  updated_at = now()
WHERE id = '1fae0a43-ffa5-4cf0-b131-aa1f7e6a1b72';

UPDATE akt_questions SET
  question = 'A GP practice provides private medical reports, travel vaccinations, and insurance forms alongside NHS work. A patient queries why they are being charged for a private letter. Which statement about non-NHS work is correct?',
  updated_at = now()
WHERE id = '2eb3baee-fed3-4937-b3f6-5b38a5dad870';

UPDATE akt_questions SET
  question = 'A GP registrar is preparing for her annual appraisal and asks her trainer what the primary purpose of GP appraisal is. What is the main purpose of GP appraisal?',
  updated_at = now()
WHERE id = '5ab759aa-29d9-440e-9674-799952bae5b1';

UPDATE akt_questions SET
  question = 'A GP is asked to complete a Medical Certificate of Cause of Death (MCCD) for a patient who died at home from metastatic breast cancer. The patient was last seen 10 days ago. Who is responsible for completing the MCCD?',
  updated_at = now()
WHERE id = '5b9a6e59-90c0-4c16-8674-6b2eb15e1783';

UPDATE akt_questions SET
  question = 'A GP is conducting a paediatric consultation with a 4-year-old child who has bruising in unusual locations. The mother gives an inconsistent account of how the injuries occurred. Which finding is a safeguarding red flag?',
  updated_at = now()
WHERE id = '5f9018bd-efc6-48e7-969f-8759641fc2a2';

UPDATE akt_questions SET
  question = 'A GP practice experiences an incident where a patient with chest pain was triaged as routine and suffered a STEMI the following day. The practice conducts a Significant Event Analysis (SEA). What should a significant event analysis primarily focus on?',
  updated_at = now()
WHERE id = '688b219d-76bc-44f2-a729-eb0c46040ddf';

UPDATE akt_questions SET
  question = 'A GP partner is interviewing candidates for a new partner position. Beyond clinical skills, she is looking for management and leadership competencies. Which skill is most important for GP partners beyond clinical work?',
  updated_at = now()
WHERE id = 'c4e8678c-ea73-480a-8cd1-b6de834238cf';

UPDATE akt_questions SET
  question = 'A GP is about to perform a minor procedure and explains the risks and benefits to the patient, who verbally agrees. The patient then changes her mind during the procedure and asks the GP to stop. Which statement about consent is correct?',
  updated_at = now()
WHERE id = 'ca5b651b-f1c3-48e6-988d-2860ef0a313f';

UPDATE akt_questions SET
  question = 'A GP is involved in a clinical negligence claim and is asked by her medical defence organisation to provide her clinical records. Her colleague asks what aspect of documentation most improves medicolegal defence. Which documentation practice most improves medicolegal defence?',
  updated_at = now()
WHERE id = 'ce470fb7-a9e3-454e-a8db-7e601c3750a0';

UPDATE akt_questions SET
  question = 'A GP registrar attends a practice meeting for the first time and asks her trainer why attending these meetings is important for GP trainees. Why should GP trainees attend practice meetings?',
  updated_at = now()
WHERE id = 'e3cf7a70-9305-4e03-81ca-b20d86c55b41';

UPDATE akt_questions SET
  question = 'A practice nurse notices that an elderly patient in a care home has unexplained bruising and appears frightened of her carer. She wants to raise a safeguarding concern. Who can raise an adult safeguarding concern?',
  updated_at = now()
WHERE id = 'e4e61b63-9e15-4989-a63b-a800c37b0afc';

UPDATE akt_questions SET
  question = 'A GP practice has introduced an online consultation system. During a review meeting, a GP raises concerns about patient safety. What is a key risk of online consultations compared to face-to-face consultations?',
  updated_at = now()
WHERE id = 'ecf4b170-3aa0-4215-b28c-65ca936b2f8c';

-----------------------------------------------------------
-- PART 12: RENAL / RESPIRATORY / SEXUAL HEALTH
-----------------------------------------------------------

UPDATE akt_questions SET
  question = 'A 65-year-old man has a routine blood test showing an eGFR of 52 mL/min/1.73m². His GP needs to classify his chronic kidney disease. Which CKD stage corresponds to an eGFR of 45–59 mL/min/1.73m²?',
  updated_at = now()
WHERE id = '7df30a7a-b90b-4a4a-8601-8b721144ae70';

UPDATE akt_questions SET
  question = 'A 30-year-old woman presents with acute-onset pleuritic chest pain and breathlessness after a long-haul flight. The GP suspects pulmonary embolism and needs to risk-stratify her. Which clinical prediction tool is used to assess the probability of pulmonary embolism?',
  updated_at = now()
WHERE id = 'a4ca9fbb-502f-4bb1-9d77-4cd27f8f9851';

UPDATE akt_questions SET
  question = 'A GP practice is reviewing its sexual health screening protocols. The practice nurse asks which STI is the target of the national routine screening programme for young adults under 25. Which STI is targeted by the national routine screening programme?',
  updated_at = now()
WHERE id = 'd6d505df-7f8e-4e09-a5bb-fc007651e3ea';

UPDATE akt_questions SET
  question = 'A GP diagnoses a 35-year-old man with tuberculosis and notes that NICE recommends HIV testing for all patients with indicator conditions. In which clinical scenario should HIV testing be offered?',
  updated_at = now()
WHERE id = 'fc82c4f8-e8ac-4c99-9edf-253f2d12267c';

-----------------------------------------------------------
-- PART 13: ADDITIONAL SHORT STEMS (<80 chars) + DUPLICATES
-----------------------------------------------------------

-- Duplicate: eczema hands (identical to 0616aa21)
DELETE FROM akt_questions WHERE id = '22f13fd0-7b4d-4c5b-bc96-d107000029f6';

-- Duplicate: Hb 95 MCV 72 (identical to 1d5b3b46)
DELETE FROM akt_questions WHERE id = '8a47a0d9-13a2-47a9-b616-3c16ac78b524';

-- Duplicate: migraine with aura avoid COC (near-identical to b4d554fc)
DELETE FROM akt_questions WHERE id = 'badf4da7-a59c-4ea4-aa39-4db141ac19ce';

-- Duplicate: raised PSA refer urology (near-identical to 91ec8b1a)
DELETE FROM akt_questions WHERE id = 'f41bb927-5e68-45e3-85f9-96613da8712e';

-- Cardiovascular: BP treatment threshold
UPDATE akt_questions SET
  question = 'A 50-year-old man has a confirmed ABPM average of 150/92 mmHg. He has no target organ damage and no diabetes. What is the threshold for starting antihypertensive treatment based on cardiovascular risk?',
  updated_at = now()
WHERE id = 'c61d6341-41a3-4bbf-922a-516f62afbe4c';

-- Dermatology: Eczema first-line
UPDATE akt_questions SET
  question = 'A 30-year-old man presents with dry, itchy, erythematous patches on both hands, worsening over 3 months with frequent hand-washing at work. He has a childhood history of atopic eczema. What is the first-line treatment for hand eczema?',
  updated_at = now()
WHERE id = '0616aa21-2f65-45c7-b679-103bf8e042f9';

-- Geriatrics: PRISMA7
UPDATE akt_questions SET
  question = 'A 79-year-old man attends his GP for an annual review. He completes a PRISMA-7 screening questionnaire and scores 4 out of 7. What does a PRISMA-7 score of 3 or more indicate?',
  updated_at = now()
WHERE id = '725fe005-0d82-4416-8f5a-f24ec43b0cb9';

-- Haematology: Microcytic anaemia
UPDATE akt_questions SET
  question = 'A 70-year-old man presents with fatigue. Blood tests show Hb 95 g/L and MCV 72 fL (microcytic anaemia). He has no obvious dietary cause and takes no NSAIDs. What is the most likely cause of microcytic anaemia in this age group?',
  updated_at = now()
WHERE id = '1d5b3b46-b215-4e71-90c8-3336e7f245e2';

-- Haematology: Macrocytic anaemia
UPDATE akt_questions SET
  question = 'A 30-year-old vegan woman presents with fatigue and glossitis. Her blood tests show Hb 100 g/L and MCV 105 fL (macrocytic anaemia). What investigations should be arranged first?',
  updated_at = now()
WHERE id = '1f3df59d-7a07-4e90-8fb6-dda07e5ebf5c';

-- Mental Health: PHQ-9 scoring
UPDATE akt_questions SET
  question = 'A 30-year-old woman completes a PHQ-9 questionnaire during a routine review and scores 16. She reports low mood, poor concentration, and disrupted sleep. What severity of depression does a PHQ-9 score of 16 indicate?',
  updated_at = now()
WHERE id = '5e0b2eec-17b3-474b-ae69-b127c5c2a435';

-- Neurology: First seizure
UPDATE akt_questions SET
  question = 'A 25-year-old woman presents to her GP the day after a witnessed generalised tonic-clonic seizure. She has no previous seizure history and has recovered fully. Examination is normal. What is the most appropriate next step?',
  updated_at = now()
WHERE id = '68ed0b88-d1e3-4f7d-bb57-f44d657e9b85';

-- Neurology: Migraine with aura + COC
UPDATE akt_questions SET
  question = 'A 25-year-old woman with a history of migraine with visual aura attends for contraception advice. She is otherwise well with no cardiovascular risk factors. Which medication should be avoided in patients with migraine with aura due to increased stroke risk?',
  updated_at = now()
WHERE id = 'b4d554fc-11a1-4f12-9140-7ba9c2d8e7ed';

-- Paediatrics: Bedwetting
UPDATE akt_questions SET
  question = 'A mother brings her 5-year-old son because he is still wetting the bed most nights. He is dry during the day and has no urinary symptoms. There are no psychosocial concerns. What is the first-line management for nocturnal enuresis in children?',
  updated_at = now()
WHERE id = '658b28de-fc33-4003-8e82-7cc1555a509f';

-- Prescribing: Amlodipine ankle swelling
UPDATE akt_questions SET
  question = 'A 65-year-old man on amlodipine 10 mg for hypertension develops bilateral ankle swelling. His blood pressure is well controlled at 128/76 mmHg. He has no signs of heart failure. His kidney function is normal. What is the most appropriate action?',
  updated_at = now()
WHERE id = '0250e277-188e-441a-bfc7-550869ef7d66';

-- Prescribing: Warfarin + antibiotic for UTI
UPDATE akt_questions SET
  question = 'A 65-year-old woman on warfarin for atrial fibrillation presents with uncomplicated lower UTI confirmed by MSU. Her INR is in range. Which antibiotic is safest to prescribe alongside warfarin with minimal interaction risk?',
  updated_at = now()
WHERE id = '294949d9-b371-47e6-857d-db355ab76f9f';

-- Prescribing: ACEi cough
UPDATE akt_questions SET
  question = 'A 50-year-old man started on ramipril 5 mg for hypertension 6 weeks ago develops a persistent dry cough that disturbs his sleep. His blood pressure is well controlled. What is the most appropriate action?',
  updated_at = now()
WHERE id = 'ff00465a-05cd-4b22-8388-c6c729077d7f';

-- PCOM: Private medical reports
UPDATE akt_questions SET
  question = 'A patient asks her GP to complete a private medical report for an insurance company. The patient is unhappy about being asked to pay a fee. Which statement is correct regarding private medical reports?',
  updated_at = now()
WHERE id = 'c05997ef-5190-4838-8cb8-4e74e292c46d';

-- PCOM: Medical reports standards
UPDATE akt_questions SET
  question = 'A GP is asked to provide a medical report for a patient''s employer regarding fitness for work. The GP asks a colleague for advice on the standard expected. What is the key principle when writing medical reports?',
  updated_at = now()
WHERE id = 'eb33f7cd-cb66-4963-8ce8-6ce273bdef1d';

-- Renal: Raised PSA next step
UPDATE akt_questions SET
  question = 'A 60-year-old man attends his GP with lower urinary tract symptoms. A PSA test is done after counselling and returns at 8 ng/mL (raised for age). DRE is normal. What is the most appropriate next step?',
  updated_at = now()
WHERE id = '91ec8b1a-b1a1-499e-8b94-a6b722f41105';

-- Respiratory: COPD GOLD staging
UPDATE akt_questions SET
  question = 'A 65-year-old man who smokes 30 pack-years has COPD confirmed on spirometry with post-bronchodilator FEV1 of 45% predicted. He is breathless walking on the flat. What GOLD stage corresponds to an FEV1 of 30–49% predicted?',
  updated_at = now()
WHERE id = '00c86174-85aa-4859-9f80-0d4b8ed50ffa';
