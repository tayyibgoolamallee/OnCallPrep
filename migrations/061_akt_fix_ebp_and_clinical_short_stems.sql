-- Migration 061: Rewrite remaining EBP and clinical short stems.
-- Run in Supabase SQL Editor. Safe to re-run.

-----------------------------------------------------------
-- PART 1: EBP STEMS (24 questions)
-----------------------------------------------------------

UPDATE akt_questions SET
  question = 'A GP notices that a patient''s blood pressure was very high at her first clinic visit but returned to normal at follow-up without treatment. A colleague suggests this may be due to regression to the mean. What does regression to the mean explain?',
  updated_at = now()
WHERE id = '1f8fd4ec-ea83-4cc3-a7a4-6c4c23f1a57f';

UPDATE akt_questions SET
  question = 'A GP trainee is designing a research project to investigate risk factors for a rare childhood cancer. Her supervisor advises that a case–control study would be the most appropriate design. For which type of condition are case–control studies most useful?',
  updated_at = now()
WHERE id = '5e0a7d39-f22b-462c-945f-5097f967f5b0';

UPDATE akt_questions SET
  question = 'A GP reads a trial reporting that a new antiplatelet drug reduces stroke risk from 10% to 7% over 5 years. She wants to explain the benefit to a patient in absolute terms. What is the Number Needed to Treat (NNT)?',
  updated_at = now()
WHERE id = '80210997-7658-483b-a78e-6025c65ba9aa';

UPDATE akt_questions SET
  question = 'A pharmaceutical company claims their new drug reduces cardiovascular events with a relative risk reduction of 25%. The baseline risk in the study population was 10% over 5 years. What is the NNT?',
  updated_at = now()
WHERE id = '8169d737-228d-4a73-b71e-781fdbfbeb26';

UPDATE akt_questions SET
  question = 'A GP trainee is learning about health economics and asks how NICE determines whether a new treatment is cost-effective compared to existing treatments. Which threshold does NICE typically use for cost-effectiveness?',
  updated_at = now()
WHERE id = '8397882f-5ca1-4a20-8cba-8e7aaa26f779';

UPDATE akt_questions SET
  question = 'A health economist explains to a GP that a new treatment provides an additional 0.5 QALYs compared to standard care. The GP asks what a QALY actually measures. What does a QALY combine?',
  updated_at = now()
WHERE id = '8455e1e3-e55d-4c87-878e-790c7e7929e0';

UPDATE akt_questions SET
  question = 'A GP trainee is discussing prostate cancer screening with her supervisor. The supervisor explains that PSA screening carries a risk of overdiagnosis. What does overdiagnosis mean in the context of screening?',
  updated_at = now()
WHERE id = '8dba5347-ea3b-4378-9a49-106a5ab6ece2';

UPDATE akt_questions SET
  question = 'A GP trainee is interpreting a meta-analysis and notices that the funnel plot shows marked asymmetry, with smaller studies clustered on one side. What does funnel plot asymmetry most likely suggest?',
  updated_at = now()
WHERE id = '91a87445-573e-430d-a49b-41e7faf499b9';

UPDATE akt_questions SET
  question = 'A GP practice is invited to participate in a research trial where entire practices (rather than individual patients) are randomised to receive the intervention or continue usual care. What type of trial randomises groups or practices rather than individuals?',
  updated_at = now()
WHERE id = '92b61f13-4472-491b-8949-511721eb6e21';

UPDATE akt_questions SET
  question = 'A public health registrar is advising the local commissioning group on implementing a new population screening programme. She references the Wilson–Jungner criteria. Which of the following is an essential principle for any screening programme?',
  updated_at = now()
WHERE id = '92e38f57-8cd1-4c9f-9f1a-43639178cb28';

UPDATE akt_questions SET
  question = 'A GP reads a trial comparing a new anticoagulant to warfarin for stroke prevention in AF. The stroke rate was 4% in the treatment group and 7% in the control group over 3 years. How is the absolute risk reduction (ARR) best defined?',
  updated_at = now()
WHERE id = '971a3369-941a-4506-8bf9-6821afbfb40e';

UPDATE akt_questions SET
  question = 'A GP uses a rapid strep test with high sensitivity and moderate specificity in a low-prevalence population. She notices the positive predictive value is lower than expected. What factor most influences positive predictive value (PPV)?',
  updated_at = now()
WHERE id = '98017a69-e02b-4e94-b974-929762947401';

UPDATE akt_questions SET
  question = 'A GP trainee is revising for the AKT and encounters a question about statistical errors. Her textbook explains that a Type II error (beta error) is a false negative result. What does a Type II error refer to?',
  updated_at = now()
WHERE id = 'aa7bcd01-c45b-4069-a9d9-7628226e9b37';

UPDATE akt_questions SET
  question = 'A GP practice introduces a rapid CRP point-of-care test for respiratory infections. The test has high sensitivity but low specificity. A colleague asks why the test produces many false positive results. Which factor most increases false positives?',
  updated_at = now()
WHERE id = 'af3e0913-80c7-4eaa-b5d2-04bc42cd78e5';

UPDATE akt_questions SET
  question = 'A GP trainee is learning about likelihood ratios and reads that a D-dimer test has a negative likelihood ratio of 0.05. She asks what a negative likelihood ratio close to zero indicates. What does this mean?',
  updated_at = now()
WHERE id = 'b4e670ef-ebc8-4946-97a2-6486086ba952';

UPDATE akt_questions SET
  question = 'A GP wants to explain to a patient that a new medication reduces heart attack risk from 4 in 100 to 2 in 100 over 10 years. A colleague suggests using natural frequencies rather than percentages. What is the best way to communicate risk to patients?',
  updated_at = now()
WHERE id = 'b777d53d-c0f5-4f79-8a8c-116d688db35c';

UPDATE akt_questions SET
  question = 'A GP trainee presents a journal article at a practice meeting and reports that the primary outcome had a p-value of 0.03. A senior colleague asks her to explain what this means. What does a p-value less than 0.05 indicate?',
  updated_at = now()
WHERE id = 'b8b9488a-982b-4bdb-8280-117fe8557ae9';

UPDATE akt_questions SET
  question = 'A GP trainee is appraising a diabetes trial that reports a significant reduction in HbA1c but does not report cardiovascular events or mortality. Her supervisor asks which outcome is truly patient-centred. Which of the following is a patient-centred outcome?',
  updated_at = now()
WHERE id = 'c7d71d78-b3e4-4e62-b481-cbc5959b6a94';

UPDATE akt_questions SET
  question = 'A GP is reading a Cochrane meta-analysis and notes that the I² statistic is 85%, indicating substantial heterogeneity. She asks what heterogeneity in a meta-analysis refers to. What does heterogeneity in meta-analysis mean?',
  updated_at = now()
WHERE id = 'd0ee4c0f-8e40-48d6-9e58-986571ad3210';

UPDATE akt_questions SET
  question = 'A public health consultant explains that screening programmes can appear to improve survival even when they do not reduce mortality, because of lead-time bias. What does lead-time bias cause screening to appear to do?',
  updated_at = now()
WHERE id = 'df295a0d-2016-44f8-bfec-67b6b1eed5eb';

UPDATE akt_questions SET
  question = 'A GP trainee reads a trial conducted in a single specialist centre with strict inclusion criteria. She questions whether the results would apply to her mixed urban GP population. Which concept describes whether study results can be applied to other populations?',
  updated_at = now()
WHERE id = 'edead862-0d11-42ea-b929-55456baa2f3f';

UPDATE akt_questions SET
  question = 'A GP trainee is appraising an observational study showing that coffee drinking is associated with lower rates of depression. However, coffee drinkers in the study also exercised more and had higher incomes. What type of distortion is this an example of?',
  updated_at = now()
WHERE id = 'f2e3caad-baf1-440f-af20-373c3843bf38';

UPDATE akt_questions SET
  question = 'A GP trainee is learning about diagnostic test interpretation and reads that likelihood ratios are more clinically useful than sensitivity and specificity alone. Why are likelihood ratios particularly useful?',
  updated_at = now()
WHERE id = 'ff8a03fb-66e8-474d-be79-c8a75919ac1c';

UPDATE akt_questions SET
  question = 'A GP trainee is revising statistical concepts for the AKT exam. She reads that a Type I error (alpha error) occurs when the null hypothesis is rejected when it is actually true. What does a Type I error represent?',
  updated_at = now()
WHERE id = 'ffbcfe47-3bcc-414a-8008-45d367fdfe00';

-----------------------------------------------------------
-- PART 2: CLINICAL SHORT STEMS (33 questions)
-----------------------------------------------------------

-- Endocrinology
UPDATE akt_questions SET
  question = 'A 45-year-old woman presents with fatigue, weight gain, and constipation over 3 months. Thyroid function tests are requested. Which set of results is consistent with primary hypothyroidism?',
  updated_at = now()
WHERE id = '867cd56c-389c-498d-b852-fb6434bd9b73';

-- Gastroenterology
UPDATE akt_questions SET
  question = 'A 72-year-old man with known atrial fibrillation on warfarin presents with sudden-onset severe abdominal pain that is disproportionate to the clinical findings on examination. What is the most likely diagnosis?',
  updated_at = now()
WHERE id = 'a9449daf-ed21-41c8-9241-8256577818ae';

-- Infectious Diseases
UPDATE akt_questions SET
  question = 'A 3-year-old child is brought to the GP with a temperature of 39.2°C and a non-blanching petechial rash on her trunk and limbs. She is irritable but responding to her parents. What is the most appropriate immediate action?',
  updated_at = now()
WHERE id = '8ee70979-6461-4d66-adab-102cc52d9dff';

-- Mental Health: Lithium monitoring
UPDATE akt_questions SET
  question = 'A 42-year-old man with bipolar disorder has been stable on lithium for 3 years. His serum lithium levels have been consistently within the therapeutic range. How frequently should lithium levels and renal/thyroid function be monitored in a stable patient?',
  updated_at = now()
WHERE id = '2ac42ec9-54c9-46eb-a06b-b2a91329eede';

-- Mental Health: Suicidal ideation
UPDATE akt_questions SET
  question = 'A 28-year-old man attends his GP and discloses that he has been having thoughts of ending his life. He has a plan and access to means. He has no psychiatric history. What is the most appropriate immediate action?',
  updated_at = now()
WHERE id = '889da2ee-2916-43aa-9155-0d90a3cdf6fa';

-- Musculoskeletal: Vitamin D
UPDATE akt_questions SET
  question = 'A 55-year-old woman has a confirmed vitamin D level of 18 nmol/L (deficient). She has no symptoms of hypocalcaemia. What is the standard loading regimen for vitamin D replacement?',
  updated_at = now()
WHERE id = '20393e9c-996f-4393-8f05-70cd38d315ef';

-- Musculoskeletal: Bisphosphonate counselling
UPDATE akt_questions SET
  question = 'A 68-year-old woman with osteoporosis is started on alendronic acid 70 mg once weekly. The GP needs to counsel her on how to take the medication safely. What is the key counselling point for bisphosphonate use?',
  updated_at = now()
WHERE id = '375a4f25-0a56-4ace-9e8e-76cd25fcd6a0';

-- Musculoskeletal: Tennis elbow
UPDATE akt_questions SET
  question = 'A 40-year-old office worker presents with lateral elbow pain that worsens when gripping objects and pouring from a kettle. Examination reveals tenderness over the lateral epicondyle. What is the first-line treatment for lateral epicondylitis (tennis elbow)?',
  updated_at = now()
WHERE id = '55aa4bd8-8612-49f0-bb78-c2c475e81c92';

-- Musculoskeletal: Adjusted calcium
UPDATE akt_questions SET
  question = 'A GP receives blood results showing a total calcium of 2.15 mmol/L and an albumin of 28 g/L. She needs to calculate the adjusted calcium. What does adjusted calcium correct for?',
  updated_at = now()
WHERE id = '729a092f-058e-49f0-a2e3-7f07335b268d';

-- Musculoskeletal: Sciatica
UPDATE akt_questions SET
  question = 'A 35-year-old man presents with a 2-week history of low back pain radiating down his left leg to the foot. There are no red flag features and neurological examination is normal. What is the initial management of uncomplicated sciatica?',
  updated_at = now()
WHERE id = '73e81364-61af-412d-b91b-6969418a8c0f';

-- Musculoskeletal: Cauda equina
UPDATE akt_questions SET
  question = 'A 50-year-old woman with a 6-week history of low back pain develops new urinary incontinence and numbness in her perineal area. She also notices difficulty passing urine. Which symptom most strongly suggests cauda equina syndrome?',
  updated_at = now()
WHERE id = '83e674ce-8e22-43f3-a3b9-947dfca6a27b';

-- Musculoskeletal: Hypercalcaemia
UPDATE akt_questions SET
  question = 'A 58-year-old woman is found to have a mildly elevated adjusted calcium of 2.72 mmol/L on routine blood tests. She is otherwise well with no bone pain, abdominal symptoms, or renal impairment. What is the most common cause of mild hypercalcaemia in primary care?',
  updated_at = now()
WHERE id = 'c6d4d65b-590f-4933-aacf-fc6b431f7739';

-- Paediatrics: Sitting milestone
UPDATE akt_questions SET
  question = 'A health visitor asks a GP to review a 9-month-old infant whose mother is concerned about motor development. The child is not yet sitting unsupported. At what age should a child typically be able to sit unsupported?',
  updated_at = now()
WHERE id = '15ff4681-d7e9-4df5-909a-deddc1d9143a';

-- Paediatrics: 12-week vaccine
UPDATE akt_questions SET
  question = 'A practice nurse is reviewing the childhood immunisation schedule and asks which vaccination is administered at 12 weeks of age as part of the routine UK immunisation programme. Which vaccine is given at 12 weeks?',
  updated_at = now()
WHERE id = '312eda33-a148-488f-9c99-5dd6452d1197';

-- Paediatrics: Fever under 3 months
UPDATE akt_questions SET
  question = 'A mother brings her 6-week-old baby to the GP with a temperature of 38.3°C. The baby is feeding well and appears alert. What is the most appropriate management for a temperature ≥38°C in a child under 3 months?',
  updated_at = now()
WHERE id = '6067c0a8-d6b6-4a50-b2f4-50a768c83074';

-- Paediatrics: Red flag at 18 months
UPDATE akt_questions SET
  question = 'A mother brings her 18-month-old son for a routine developmental review. She is concerned because he is not yet walking independently, though he cruises along furniture. Which developmental milestone would be considered a red flag if absent at 18 months?',
  updated_at = now()
WHERE id = '860f268a-73e1-44c9-bd4d-2ae214e8b228';

-- Paediatrics: Failure to thrive
UPDATE akt_questions SET
  question = 'A GP is reviewing the growth chart of a 10-month-old infant who has dropped from the 50th to the 9th centile for weight over 3 months. The child is active but appears thin. Which finding is most supportive of a diagnosis of faltering growth (failure to thrive)?',
  updated_at = now()
WHERE id = '88f0533b-225e-4a43-93b5-cff8872570d9';

-- Palliative Care: End-of-life planning
UPDATE akt_questions SET
  question = 'A GP is caring for a 75-year-old man with advanced lung cancer. His performance status is declining and the oncologist has advised best supportive care. The GP initiates a discussion about end-of-life preferences. What should end-of-life care planning primarily involve?',
  updated_at = now()
WHERE id = '56cbfce6-a16e-43ee-a16a-10c479a1afd1';

-- Palliative Care: DNACPR discussion
UPDATE akt_questions SET
  question = 'A 78-year-old woman with end-stage heart failure is admitted to hospital with worsening symptoms. The medical team believes CPR would be unlikely to succeed and wishes to discuss DNACPR. What represents best practice for DNACPR discussions?',
  updated_at = now()
WHERE id = '5875c111-5b7b-48a4-a7e6-bf18055e3f17';

-- Palliative Care: Frailty
UPDATE akt_questions SET
  question = 'An 82-year-old woman attends her GP for a routine review. She has lost 5 kg over 6 months, walks slowly with a stick, and reports feeling exhausted after minimal activity. Her grip strength is reduced. Which feature is most suggestive of frailty?',
  updated_at = now()
WHERE id = '985b5ed8-ae3d-455a-9547-186f6ea9fc6b';

-- Prescribing: INR monitoring
UPDATE akt_questions SET
  question = 'A 70-year-old man with atrial fibrillation is being started on anticoagulation. The GP discusses the options with him, including warfarin and DOACs. The patient asks which anticoagulant requires regular blood tests for INR monitoring. Which anticoagulant requires routine INR monitoring?',
  updated_at = now()
WHERE id = '3021c6c0-d697-4a5c-a54e-0bf550c46532';

-- Prescribing: NSAID risk
UPDATE akt_questions SET
  question = 'A GP is reviewing the medications of several patients and needs to identify those at highest risk of harm from NSAIDs. Which of the following patients is at the highest risk of serious adverse effects from NSAID use?',
  updated_at = now()
WHERE id = '411c9d7b-3506-4a64-a495-0a17f054732d';

-- Prescribing: Hyperkalaemia
UPDATE akt_questions SET
  question = 'A GP reviews blood results for a 68-year-old man with CKD stage 3 and type 2 diabetes. His potassium has risen to 5.8 mmol/L. The GP reviews his medications for potential causes. Which of his medications most commonly causes hyperkalaemia?',
  updated_at = now()
WHERE id = 'd1321d58-cfc7-4c87-9f29-62dea854dd63';

-- Renal: OAB first-line
UPDATE akt_questions SET
  question = 'A 55-year-old woman presents with urinary urgency, frequency, and occasional urge incontinence. There is no evidence of UTI or prolapse. She is diagnosed with overactive bladder (OAB). What is the first-line management of overactive bladder?',
  updated_at = now()
WHERE id = '2a9129b2-6da6-4596-8156-9b7460135d39';

-- Renal: Recurrent UTI prevention
UPDATE akt_questions SET
  question = 'A 30-year-old woman presents with her fourth episode of cystitis in 12 months. Each episode has been confirmed with MSU culture. She asks about prevention strategies. What is the first-line advice for recurrent UTI prevention?',
  updated_at = now()
WHERE id = '2b754078-d7aa-4587-a350-596344789eed';

-- Renal: Renal colic analgesia
UPDATE akt_questions SET
  question = 'A 35-year-old man presents to the GP with acute-onset severe left-sided loin pain radiating to the groin. He is writhing in pain and unable to sit still. Urinalysis shows microscopic haematuria. What is the first-line analgesia for suspected renal colic?',
  updated_at = now()
WHERE id = '45e72053-8014-4939-954e-c79b915c365a';

-- Renal: Hyperkalaemia ECG
UPDATE akt_questions SET
  question = 'A GP reviews an ECG for a 72-year-old man with CKD stage 4 whose potassium has been reported at 6.5 mmol/L. She looks for ECG features of hyperkalaemia. What is the earliest and most characteristic ECG change in hyperkalaemia?',
  updated_at = now()
WHERE id = '67954b69-e9e3-4327-a0d9-db53c1058d1f';

-- Renal: PSA causes
UPDATE akt_questions SET
  question = 'A 62-year-old man has a PSA level of 7.5 ng/mL. He is anxious about prostate cancer. The GP explains that several benign conditions can also raise PSA. Which of the following can cause a raised PSA level?',
  updated_at = now()
WHERE id = '85fb4818-56a9-47a6-b530-a943912c8a0c';

-- Renal: Female incontinence
UPDATE akt_questions SET
  question = 'A 48-year-old woman who has had three vaginal deliveries presents with involuntary leakage of urine when she coughs, sneezes, or exercises. There is no urinary urgency. What is the most common type of urinary incontinence in women?',
  updated_at = now()
WHERE id = 'e65528af-f5f5-47d4-a1dd-180bdc0b3314';

-- Respiratory: Asthma diagnosis
UPDATE akt_questions SET
  question = 'A 25-year-old woman presents with episodic wheeze and cough, worse at night and with exercise. Spirometry shows normal FEV1/FVC ratio. The GP requests peak flow monitoring. Which finding on peak flow diary most strongly supports a diagnosis of asthma?',
  updated_at = now()
WHERE id = '1d3f9e29-1e96-4a68-925a-33d70558fba5';

-- Respiratory: COPD antibiotics
UPDATE akt_questions SET
  question = 'A 68-year-old man with known COPD presents with increased breathlessness and cough over 3 days. He has been producing green sputum. His oxygen saturations are 93% on air. Under what circumstances should antibiotics be prescribed for an acute exacerbation of COPD?',
  updated_at = now()
WHERE id = '7501c5fa-cdf7-47f3-b65f-fe3d5e5126c4';

-- Respiratory: Asthma step-up
UPDATE akt_questions SET
  question = 'A 30-year-old woman with asthma is using her salbutamol inhaler 4–5 times per week despite a low-dose inhaled corticosteroid (ICS). She has had two exacerbations in the past year. According to NICE/BTS guidelines, what is the next step in asthma management?',
  updated_at = now()
WHERE id = 'b6f848e7-fd58-4981-b563-a3a315f115a0';

-- Women''s Health: Cervical screening
UPDATE akt_questions SET
  question = 'A 28-year-old woman attends her GP for a routine cervical smear. She asks how often she needs cervical screening. According to the NHS cervical screening programme, how frequently are women aged 25–49 invited for cervical screening?',
  updated_at = now()
WHERE id = 'df27ae02-eeef-401c-93a5-9a2ba100aaa8';
