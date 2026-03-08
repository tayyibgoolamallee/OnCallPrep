-- Migration 059: Fix remaining short stems and duplicates.
-- Deletes duplicate questions (keeping one copy).
-- Rewrites short stems into proper scenario-based questions.
-- Run in Supabase SQL Editor. Safe to re-run.

-----------------------------------------------------------
-- PART 1: DELETE DUPLICATES
-----------------------------------------------------------

-- "A wide confidence interval suggests:" — keep 921c8bb5, delete b4184763
DELETE FROM akt_questions WHERE id = 'b4184763-2dc5-4234-be59-1a47b46f027b';

-- "Total triage aims to:" — keep 0266d886, delete c86a2039
DELETE FROM akt_questions WHERE id = 'c86a2039-05db-4fc3-96a2-212c32404431';

-----------------------------------------------------------
-- PART 2: REWRITE SHORT EBP STEMS
-----------------------------------------------------------

-- Wide confidence interval
UPDATE akt_questions SET
  question = 'A GP reads a meta-analysis reporting that a new antihypertensive reduces stroke risk with a 95% confidence interval of 0.45 to 1.12. What does this wide confidence interval most likely indicate?',
  explanation = 'A wide confidence interval indicates greater uncertainty about the true effect size. This typically results from a small sample size, high variability in the data, or both. In this example, the CI crosses 1.0 (the null value for relative risk), meaning the result is not statistically significant. Narrow confidence intervals indicate more precise estimates, usually from larger sample sizes. Option A is wrong because a wide CI suggests weak, not strong, evidence. Option B is wrong because wide CIs indicate imprecision. Option C is wrong because larger samples produce narrower CIs. Option E is wrong because CIs relate to precision, not bias. Reference: RCGP AKT Content Guide — https://www.rcgp.org.uk/mrcgp-exams/applied-knowledge-test',
  updated_at = now()
WHERE id = '921c8bb5-5394-410a-85a6-dbd7ddba8c49';

-- Critical appraisal purpose
UPDATE akt_questions SET
  question = 'A GP trainee is asked to present a journal article at an educational meeting. She needs to assess whether the study findings are valid and applicable to her patients. What is the primary purpose of the critical appraisal process?',
  explanation = 'Critical appraisal systematically evaluates the validity (internal validity — was the study conducted well?), importance (clinical significance of the results), and applicability (external validity — can the results be applied to your patients?) of published evidence. Option B is wrong because critical appraisal aims to evaluate evidence, not reject it. Option C is wrong because it involves understanding, not memorising, statistics. Option D is wrong because guidelines are informed by critical appraisal, not replaced by it. Option E is wrong because critical appraisal streamlines decision-making. Reference: RCGP AKT Content Guide — https://www.rcgp.org.uk/mrcgp-exams/applied-knowledge-test',
  updated_at = now()
WHERE id = '56803c50-eb7a-4c70-a615-3c7ec24d6de6';

-- Bayesian reasoning
UPDATE akt_questions SET
  question = 'A 50-year-old man presents with chest pain. His pre-test probability of coronary artery disease is estimated at 30%. An exercise ECG is positive. A GP trainee asks how to interpret this result. Which reasoning framework best describes updating the probability of disease using test results?',
  explanation = 'Bayesian reasoning updates probability by combining pre-test probability with new evidence (test results) to calculate post-test probability. It uses likelihood ratios to quantify how much a test result changes the probability of disease. This is how clinicians naturally think — the probability of a diagnosis changes as new information becomes available. Option B is wrong because Bayesian reasoning explicitly uses pre-test probability. Option C is wrong because uncertainty is never eliminated, only reduced. Option D is wrong because Bayesian reasoning supports, not replaces, clinical judgement. Option E is wrong because Bayesian reasoning is the application of statistics to clinical decision-making. Reference: RCGP AKT Content Guide — https://www.rcgp.org.uk/mrcgp-exams/applied-knowledge-test',
  updated_at = now()
WHERE id = '42c8ebdc-bff4-42fb-87cf-b9d3e5465db8';

-- Relative risk reduction misleading
UPDATE akt_questions SET
  question = 'A pharmaceutical representative tells a GP that a new statin reduces cardiovascular events by 50%. The GP notes that the baseline risk in the study population was 2% over 5 years. Why might this relative risk reduction be misleading?',
  explanation = 'Relative risk reduction (RRR) can overstate the clinical benefit because it does not account for baseline risk. A 50% RRR sounds impressive, but if baseline risk is only 2%, the absolute risk reduction (ARR) is just 1% (2% to 1%), giving an NNT of 100. The same 50% RRR applied to a 20% baseline risk gives an ARR of 10% and NNT of 10 — a much more meaningful benefit. Always present ARR and NNT alongside RRR for clinical decision-making. Option B is wrong because RRR is mathematically accurate. Option C is wrong because RRR reporting is not unethical, just potentially misleading. Option D is wrong because RRR is easily calculated. Option E is wrong because RRR is clinically relevant when interpreted with baseline risk. Reference: RCGP AKT Content Guide — https://www.rcgp.org.uk/mrcgp-exams/applied-knowledge-test',
  updated_at = now()
WHERE id = 'c371bde0-fbc7-4ae3-b207-0b0281a01c00';

-- Number needed to harm
UPDATE akt_questions SET
  question = 'A GP is reviewing the safety data for a new NSAID. The study reports that 8% of patients on the drug experienced GI bleeding compared to 5% in the placebo group. How is the Number Needed to Harm (NNH) calculated?',
  explanation = 'NNH = 1 / Absolute Risk Increase (ARI). ARI = harm rate in treatment group minus harm rate in control group = 8% - 5% = 3% (0.03). NNH = 1 / 0.03 = 33. This means for every 33 patients treated with this NSAID, one additional patient will experience GI bleeding. Option A is wrong because NNH measures harm, not effectiveness. Option B is wrong because NNH uses absolute risk, not simple frequency. Option C is wrong because NNH specifically measures the absolute increase in harm risk. Option E is wrong because NNH uses absolute, not relative, risk. Reference: BNF — https://bnf.nice.org.uk/',
  updated_at = now()
WHERE id = '03fb51a1-23cc-47b9-9647-e3fb6455551e';

-- Systematic vs narrative review
UPDATE akt_questions SET
  question = 'A GP trainee finds two review articles on antibiotic prescribing for sore throat: one is a narrative review and the other is a Cochrane systematic review. What is the key feature that distinguishes a systematic review from a narrative review?',
  explanation = 'A systematic review uses explicit, reproducible methodology including pre-defined search strategy, inclusion/exclusion criteria, quality assessment, and data synthesis. This minimises bias and allows replication. Narrative reviews are expert opinion-based summaries without systematic methodology, making them susceptible to selection and reporting bias. Systematic reviews may or may not include meta-analysis (statistical pooling of results). Option A is wrong because systematic reviews are typically longer. Option B is wrong because that describes narrative reviews. Option D is wrong because systematic reviews may include meta-analysis. Option E is wrong because systematic reviews take longer due to their rigorous methodology. Reference: RCGP AKT Content Guide — https://www.rcgp.org.uk/mrcgp-exams/applied-knowledge-test',
  updated_at = now()
WHERE id = '7934539f-9c40-4222-a297-d5722476cb74';

-- Highly sensitive test
UPDATE akt_questions SET
  question = 'A GP is considering whether to use D-dimer testing in a 35-year-old woman with a low Wells score for pulmonary embolism. D-dimer is a highly sensitive test for PE. What is the most appropriate use of a highly sensitive test?',
  explanation = 'A highly sensitive test is best used to rule out disease — the SnNout principle (Sensitive test, Negative result rules OUT disease). If a highly sensitive test like D-dimer is negative in a patient with low pre-test probability (low Wells score), PE can be effectively excluded without imaging. Option A is wrong because confirmation requires high specificity, not sensitivity. Option B is wrong because ruling in disease requires specificity (SpPin). Option D is wrong because prevalence is estimated by epidemiological studies, not diagnostic tests. Option E is wrong because tests complement, not replace, clinical judgement. Reference: NICE CKS Pulmonary Embolism — https://cks.nice.org.uk/topics/pulmonary-embolism/',
  updated_at = now()
WHERE id = '4e9118e8-f0f7-4364-b2dd-0389af91335e';

-- Selection bias
UPDATE akt_questions SET
  question = 'A GP trainee is critically appraising a cohort study comparing outcomes in patients who chose surgery versus conservative management for back pain. She notes the surgical group was younger and fitter. Which type of bias is most likely present?',
  explanation = 'Selection bias occurs when participants differ systematically between groups due to how they were selected or allocated. In this observational study, patients who chose surgery were younger and fitter — these baseline differences (confounders) could explain outcome differences independently of the intervention. Randomisation prevents selection bias by ensuring balanced groups. Option A (recall bias) occurs when participants differentially remember exposures. Option C (observer bias) occurs when assessors know group allocation. Option D (publication bias) relates to which studies are published. Option E (attrition bias) occurs when participants drop out differentially. Reference: RCGP AKT Content Guide — https://www.rcgp.org.uk/mrcgp-exams/applied-knowledge-test',
  updated_at = now()
WHERE id = 'fce7f294-a04c-42f3-b5c2-ed227ba34331';

-- Pragmatic vs explanatory trials
UPDATE akt_questions SET
  question = 'A GP is reading about a new diabetes medication. One trial tested it in highly selected patients with strict inclusion criteria, while another tested it in a typical primary care population with comorbidities. How do pragmatic trials differ from explanatory trials?',
  explanation = 'Pragmatic trials test interventions under real-world conditions with typical patients, settings, and clinical practices. They answer: "Does this work in everyday practice?" Explanatory trials test under ideal, controlled conditions with strict inclusion criteria to maximise internal validity. They answer: "Can this work under optimal conditions?" Pragmatic trials have greater external validity (generalisability) but may have more confounders. Option A is wrong because pragmatic trials are real-world, not laboratory-based. Option B is wrong because strict inclusion criteria characterise explanatory trials. Option D is wrong because pragmatic trials can use randomisation. Option E is wrong because pragmatic trials include patients with comorbidities. Reference: RCGP AKT Content Guide — https://www.rcgp.org.uk/mrcgp-exams/applied-knowledge-test',
  updated_at = now()
WHERE id = '5ea3b1cb-d98f-4062-a7bf-dee585a3d9e2';

-- Surrogate endpoint
UPDATE akt_questions SET
  question = 'A GP reads a trial showing a new drug reduces LDL cholesterol by 40%, but there is no data on cardiovascular events or mortality. A colleague suggests prescribing it based on the cholesterol result alone. Why is a surrogate endpoint problematic in this context?',
  explanation = 'Surrogate endpoints (like LDL cholesterol, blood pressure, HbA1c) may not reliably predict patient-centred outcomes (like mortality, cardiovascular events, quality of life). A treatment might improve a surrogate measure without actually improving outcomes that matter to patients — or even cause net harm. The cholesterol-lowering drug cerivastatin reduced LDL but was withdrawn due to fatal rhabdomyolysis. Always prefer trials reporting patient-centred outcomes. Option B is wrong because surrogate endpoints are often easy to measure. Option C is wrong because using surrogates is standard practice, not unethical per se. Option D is wrong because surrogates are often cheaper to measure. Option E is wrong because surrogates like blood tests are objective, not subjective. Reference: RCGP AKT Content Guide — https://www.rcgp.org.uk/mrcgp-exams/applied-knowledge-test',
  updated_at = now()
WHERE id = '1d18c393-fc37-416b-8426-94befffdace1';

-----------------------------------------------------------
-- PART 3: REWRITE SHORT PCOM STEMS
-----------------------------------------------------------

-- Total triage
UPDATE akt_questions SET
  question = 'A GP practice is considering implementing a total triage model where all patient contacts are assessed before appointments are offered. The practice manager asks what the primary aim of total triage is. What is the most accurate description?',
  explanation = 'Total triage aims to match patient demand to capacity safely by ensuring every patient request is assessed and directed to the most appropriate response: GP appointment, nurse appointment, pharmacist, self-care advice, or emergency referral. It is designed to improve access and efficiency, not to reduce access or avoid patient contact. Option A is wrong because total triage aims to improve, not reduce, access. Option B is wrong because it supports GPs, not replaces them. Option D is wrong because it aims to reduce unnecessary contact, not avoid all contact. Option E is wrong because it should streamline, not increase, bureaucracy. Reference: GMC Good Medical Practice — https://www.gmc-uk.org/ethical-guidance/ethical-guidance-for-doctors/good-medical-practice',
  updated_at = now()
WHERE id = '0266d886-e73d-46d3-b9af-d9b95b1988a2';

-- CQC domains
UPDATE akt_questions SET
  question = 'A GP practice is preparing for a CQC inspection. The practice manager asks a new GP registrar to name the five CQC inspection domains. Which of the following is NOT one of the five CQC domains?',
  explanation = 'The five CQC inspection domains are: Safe, Effective, Caring, Responsive, and Well-led. Each is rated Outstanding, Good, Requires Improvement, or Inadequate. "Profitable" is not a CQC domain — the CQC assesses quality of care, not financial performance. Practices are assessed on patient safety, evidence-based care, compassion, meeting patient needs, and leadership quality. Option A (Safe) is a valid CQC domain. Option B (Effective) is a valid CQC domain. Option C (Caring) is a valid CQC domain. Option E (Well-led) is a valid CQC domain. Reference: CQC — https://www.cqc.org.uk/guidance-providers/gps/key-lines-enquiry-gp-practices',
  updated_at = now()
WHERE id = 'c17228d2-aa4f-4ef9-88bf-7bb12d25b749';

-- Exam strategy (rewrite to a proper PCOM question about assessment)
UPDATE akt_questions SET
  question = 'A GP trainee has 20 questions remaining in the AKT exam with 15 minutes left. She is unsure about several questions. What is the most effective strategy for managing uncertainty in a single best answer exam?',
  explanation = 'When unsure in an SBA exam, the most effective strategy is to eliminate clearly wrong options and select the best fit from the remaining choices. This improves the probability of selecting the correct answer compared to random guessing. First instinct is often correct — repeated answer-changing usually decreases scores. Leaving questions blank guarantees zero marks. Time management is important: pace yourself, mark uncertain questions, and return to them if time permits. Option A is wrong because unanswered questions score zero. Option B is wrong because blindly following first instinct without considering all options is not systematic. Option D is wrong because panic impairs cognitive performance. Option E is wrong because excessive deliberation wastes time without improving accuracy. Reference: RCGP AKT exam guidance — https://www.rcgp.org.uk/mrcgp-exams/applied-knowledge-test',
  updated_at = now()
WHERE id = 'd620d5fa-f5ba-40ae-8d5a-ff3f506399bf';

-- Exam stamina
UPDATE akt_questions SET
  question = 'A GP trainee is preparing for the AKT exam in 8 weeks. She can read textbooks and do question banks but struggles with concentration during 3-hour practice sessions. What is the most effective way to build exam stamina?',
  explanation = 'Building exam stamina requires repeated exposure to full-length, timed practice exams that simulate the actual exam conditions (200 questions in 3 hours and 10 minutes). This builds cognitive endurance, time management skills, and familiarity with the exam format and pacing. Reading alone does not build stamina. Option A is wrong because reading builds knowledge but not exam endurance. Option C is wrong because last-minute cramming increases anxiety and does not build stamina. Option D is wrong because avoiding practice exams leaves the trainee unprepared for exam conditions. Option E is wrong because rote memorisation does not improve timed exam performance. Reference: RCGP AKT exam guidance — https://www.rcgp.org.uk/mrcgp-exams/applied-knowledge-test',
  updated_at = now()
WHERE id = 'e9b86339-bbfc-4392-b4b1-fd8f9ff2f6db';

-- Confidentiality override
UPDATE akt_questions SET
  question = 'A GP sees a 35-year-old man who discloses that he has been physically assaulting his partner. He refuses consent for the GP to share this information. Under which circumstance can the GP breach patient confidentiality without consent?',
  explanation = 'GMC guidance permits disclosure without patient consent when there is a risk of serious harm to others — this includes situations where a third party (in this case, the partner) is at risk of significant physical harm. This is a limited exception to the duty of confidentiality. The GP should attempt to gain consent first, but if the patient refuses and the risk is serious, disclosure to appropriate authorities is justified. Option A is wrong because employer requests do not override confidentiality. Option B is wrong because media enquiries never justify breach of confidentiality. Option D is wrong because insurance requests require patient consent. Option E is wrong because family curiosity does not justify disclosure. Reference: GMC Confidentiality Guidance — https://www.gmc-uk.org/ethical-guidance/ethical-guidance-for-doctors/confidentiality',
  updated_at = now()
WHERE id = 'fb8723c0-d0d4-4c66-bf9f-332d0d635dd6';

-- Mental Capacity Act best interests
UPDATE akt_questions SET
  question = 'A 78-year-old woman with advanced dementia is admitted with a hip fracture. She lacks capacity to consent to surgery. The surgical team proposes operative management. Under the Mental Capacity Act 2005, what must a best interests decision primarily consider?',
  explanation = 'Under the Mental Capacity Act 2005, best interests decisions must consider the patient''s past and present wishes, values, beliefs, and preferences — not just the clinical recommendation. Consult those close to the patient (family, carers, LPA holders, IMCA if no one else available) to understand what the patient would have wanted. The clinician''s opinion alone is insufficient. Option A is wrong because the decision must consider the patient''s perspective, not just clinical opinion. Option B is wrong because family wishes inform but do not solely determine best interests. Option D is wrong because cost should not be a primary consideration. Option E is wrong because convenience is not a valid factor in best interests decisions. Reference: Mental Capacity Act 2005 — https://www.legislation.gov.uk/ukpga/2005/9/contents',
  updated_at = now()
WHERE id = '93451e6a-c2b2-4d89-88b7-812bcbba1af2';

-- LPA decisions
UPDATE akt_questions SET
  question = 'A 82-year-old man with severe vascular dementia is admitted with pneumonia. He lacks capacity to make treatment decisions. His son says he has a Lasting Power of Attorney. Who has legal authority to make healthcare decisions on the patient''s behalf?',
  explanation = 'A Lasting Power of Attorney (LPA) for Health and Welfare, if properly registered with the Office of the Public Guardian and activated (patient lacks capacity), gives the named attorney legal authority to make healthcare decisions in the patient''s best interests. If no LPA exists, the healthcare team makes best interests decisions in consultation with those close to the patient. Option A is wrong because next of kin have no automatic legal decision-making authority in England and Wales. Option B is wrong because the GP can contribute but the LPA holder has legal authority. Option D is wrong because the social worker does not have legal authority. Option E is wrong because a hospital consultant does not override an LPA. Reference: Mental Capacity Act 2005 — https://www.legislation.gov.uk/ukpga/2005/9/contents',
  updated_at = now()
WHERE id = 'fe9a2434-c6f8-4fe4-8464-be590c28804b';

-----------------------------------------------------------
-- PART 4: REWRITE SHORT CLINICAL STEMS
-----------------------------------------------------------

-- Varicella exposure in pregnancy
UPDATE akt_questions SET
  question = 'A 28-year-old woman who is 16 weeks pregnant reports that her 3-year-old child has developed chickenpox. She is unsure if she has had chickenpox before. What is the most appropriate initial management?',
  explanation = 'Varicella (chickenpox) exposure in pregnancy can cause congenital varicella syndrome (first 20 weeks) or neonatal varicella. The first step is to check varicella immunity (VZV IgG). If the woman is non-immune and has had significant exposure (same household), give VZIG (varicella zoster immunoglobulin) as soon as possible (ideally within 10 days of exposure). Option A is correct — VZIG should be given if she is confirmed non-immune. Option B is wrong because reassurance without checking immunity is unsafe. Option C is wrong because antivirals (aciclovir) are used for active infection, not prophylaxis after exposure. Option D is wrong because varicella vaccine is a live vaccine and contraindicated in pregnancy. Option E is wrong because no action risks serious maternal and fetal complications. Reference: NICE CKS Chickenpox — https://cks.nice.org.uk/topics/chickenpox/',
  updated_at = now()
WHERE id = '9f0e3a65-ee16-41f6-ba6c-25765228a495';

-- Copper IUD emergency contraception
UPDATE akt_questions SET
  question = 'A 22-year-old woman attends her GP 4 days after unprotected intercourse requesting emergency contraception. She has no contraindications to any method. Up to how many days after intercourse can a copper IUD be inserted for emergency contraception?',
  explanation = 'A copper IUD can be used as emergency contraception up to 5 days (120 hours) after unprotected intercourse, or up to 5 days after the earliest estimated date of ovulation (whichever is later). It is the most effective form of emergency contraception (>99% effective) and has the advantage of providing ongoing long-acting contraception. Option A (3 days) is the window for levonorgestrel (Levonelle). Option B (4 days) is not a standard timeframe. Option D (7 days) and Option E (10 days) exceed the licensed window. Reference: NICE CKS Emergency Contraception — https://cks.nice.org.uk/topics/contraception-emergency/',
  updated_at = now()
WHERE id = '00af93a5-59db-43ac-985b-c1ae37931935';

-- COC contraindication
UPDATE akt_questions SET
  question = 'A 30-year-old woman requests the combined oral contraceptive pill. She has a history of migraine with visual aura occurring twice per year. What is the significance of this history regarding combined hormonal contraception?',
  explanation = 'Migraine with aura is an absolute contraindication (UKMEC category 4) to combined hormonal contraception (pill, patch, ring) due to a significantly increased risk of ischaemic stroke. The oestrogen component increases thrombotic risk, which is compounded by the vascular changes associated with migraine aura. Option A is wrong because age 32 alone is not a contraindication. Option B is wrong because migraine without aura is UKMEC 2 (generally usable). Option C is wrong because BMI 28 is not a contraindication (BMI ≥35 is UKMEC 3). Option E is wrong because smoking under 35 is UKMEC 2 (not a contraindication). Offer progestogen-only methods, copper IUD, or LNG-IUS instead. Reference: NICE CKS Contraception — https://cks.nice.org.uk/topics/contraception-assessment/',
  updated_at = now()
WHERE id = 'b6382a11-eee7-4eaa-a333-6f734c4922f5';

-- Reduced fetal movements
UPDATE akt_questions SET
  question = 'A 32-year-old woman who is 34 weeks pregnant telephones the surgery reporting that she has not felt her baby move since yesterday morning. She has had an otherwise uncomplicated pregnancy. Which of the following requires the most urgent action?',
  explanation = 'Reduced fetal movements after 28 weeks is a red flag that may indicate fetal compromise (hypoxia, placental insufficiency, or stillbirth) and requires urgent assessment — typically within 2 hours at the maternity assessment unit for CTG monitoring and clinical assessment. Do not reassure or delay. Option A (mild nausea) is a common pregnancy symptom, usually benign. Option B (heartburn) is common and managed with antacids. Option D (back pain) is common and usually musculoskeletal. Option E (constipation) is common and managed with dietary advice or lactulose. Reference: RCOG Green-top Guideline 57 — https://www.rcog.org.uk/guidance/browse-all-guidance/green-top-guidelines/reduced-fetal-movements-green-top-guideline-no-57/',
  updated_at = now()
WHERE id = 'f4431492-2492-4b8a-b49f-21147347e822';

-- Seizure and driving
UPDATE akt_questions SET
  question = 'A 40-year-old man presents to his GP the day after experiencing a witnessed tonic-clonic seizure. He has no previous seizure history, takes no regular medication, and drives to work daily. What is the most appropriate advice regarding driving?',
  explanation = 'After a single unprovoked seizure, the patient must inform the DVLA and stop driving immediately (Road Traffic Act 1988). For a Group 1 licence (car/motorcycle), the DVLA typically requires 6 months seizure-free (if investigated and no cause found) or 12 months (if not investigated). Driving against medical advice is a criminal offence. If the patient refuses to stop driving, the GP may need to breach confidentiality and inform the DVLA. Option A is wrong because continuing to drive after a seizure is illegal. Option B is wrong because 1 week is far too short. Option C is wrong because daytime-only driving is not a recognised restriction. Option E is wrong because driving restrictions apply after any seizure. Reference: DVLA Assessing Fitness to Drive — https://www.gov.uk/guidance/assessing-fitness-to-drive-a-guide-for-medical-professionals',
  updated_at = now()
WHERE id = '58ec7798-34b5-448a-a2dc-f92b8eaf1867';

-- Weight loss + IDA = malignancy
UPDATE akt_questions SET
  question = 'A 62-year-old man presents with 6 kg unintentional weight loss over 3 months. Blood tests reveal iron deficiency anaemia (Hb 105 g/L, ferritin 6 µg/L). He has no obvious dietary cause. Which combination of findings most strongly suggests underlying malignancy?',
  explanation = 'Unintentional weight loss combined with iron deficiency anaemia is a red flag combination that strongly suggests GI malignancy (particularly colorectal or gastric cancer) and warrants urgent investigation via the 2-week wait pathway (NICE NG12). Iron deficiency anaemia in men or postmenopausal women should always prompt investigation for occult GI blood loss. Option A (BMI 24) is normal and not concerning. Option B (recent bereavement) can explain weight loss but not IDA. Option D (mild depression) can reduce appetite but does not explain IDA. Option E (smoking history alone) is a risk factor but does not explain the clinical picture. Reference: NICE NG12 Suspected Cancer — https://www.nice.org.uk/guidance/ng12',
  updated_at = now()
WHERE id = 'a765a113-5113-4185-abc1-ebf9aad625ed';

-- Delirium vs dementia
UPDATE akt_questions SET
  question = 'An 80-year-old woman with known mild Alzheimer''s dementia is admitted to hospital with a UTI. Over 24 hours she becomes acutely confused, agitated, and is seeing things that are not there. Her family says "she was fine yesterday." Which feature best distinguishes her current presentation from her underlying dementia?',
  explanation = 'Fluctuating consciousness (and acute onset) is the hallmark feature distinguishing delirium from dementia. Delirium has acute onset (hours to days), fluctuating course, impaired consciousness/attention, and is often caused by an underlying medical condition (infection, medication, metabolic disturbance). Dementia has gradual onset (months to years), stable consciousness, and progressive cognitive decline. Both conditions can cause memory loss and behavioural changes, so these features do not distinguish between them. Option A is wrong because memory loss occurs in both conditions. Option B is wrong because gradual onset characterises dementia, not delirium. Option D is wrong because age is a risk factor for both. Option E is wrong because behavioural change occurs in both. Reference: NICE CKS Delirium — https://cks.nice.org.uk/topics/delirium/',
  updated_at = now()
WHERE id = '114825ba-878d-49ea-8d56-f4f2dbf56e7e';

-- Upper UTI red flag
UPDATE akt_questions SET
  question = 'A 45-year-old woman presents with dysuria and urinary frequency for 2 days. Today she has developed loin pain and a temperature of 38.5°C. Which combination of features suggests an upper urinary tract infection requiring urgent assessment?',
  explanation = 'Flank (loin) pain combined with fever suggests pyelonephritis (upper UTI), which requires urgent assessment and often hospital admission for IV antibiotics. Lower UTI symptoms alone (dysuria, frequency, suprapubic discomfort) can be managed in primary care with oral antibiotics. Pyelonephritis can lead to urosepsis if not treated promptly. Option A (dysuria only) is a lower UTI symptom manageable in primary care. Option B (frequency) is a lower UTI symptom. Option C (suprapubic discomfort) suggests lower UTI. Option E (cloudy urine) is non-specific and common in lower UTI. Reference: NICE CKS Pyelonephritis — https://cks.nice.org.uk/topics/pyelonephritis-acute/',
  updated_at = now()
WHERE id = '50c10df9-1cc6-46a6-9b7a-e64664cd7c66';
