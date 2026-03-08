-- Migration 060: Rewrite short PCOM stems into scenario-based questions.
-- Also deletes confirmed duplicate PCOM questions.
-- Run in Supabase SQL Editor. Safe to re-run.

-----------------------------------------------------------
-- PART 1: DELETE CONFIRMED DUPLICATES
-----------------------------------------------------------

-- "CQC domains - which is not a domain:" — duplicate of c17228d2 (fixed in 059)
DELETE FROM akt_questions WHERE id = '0568a6de-2675-4bc5-a5b0-a72ad6ce08d8';

-- "Core GP contract type in England:" — duplicate of 526f7d6c
DELETE FROM akt_questions WHERE id = '89491ee4-65ba-49ae-95a9-ab7acc66793f';

-- "Raising concerns whistleblowing guidance encourages:" — duplicate of 1d2fb411
DELETE FROM akt_questions WHERE id = 'eae35d3a-1c09-4f3f-9106-04993ccc4032';

-- "Information governance - patient data should be:" — duplicate of 21ca2f3e
DELETE FROM akt_questions WHERE id = '53913e6b-5a7a-48e0-99ac-e6ec19297df2';

-- "What does QOF primarily incentivise?" — duplicate of 85105f40
DELETE FROM akt_questions WHERE id = '950abcb8-3cc1-418b-8963-c8a62cb5f2a9';

-- "Effective leadership in primary care requires:" — duplicate of 2b990c67
DELETE FROM akt_questions WHERE id = 'fa536bf5-f995-46f4-925e-032882efc9eb';

-- "Practice risk highest risk area:" — duplicate of 845a4b36
DELETE FROM akt_questions WHERE id = 'dffda3d7-c9d9-43d1-a785-d97b95b02bee';

-- "Indemnity schemes cover:" — duplicate of c6d1ea31
DELETE FROM akt_questions WHERE id = '8ea48045-8097-481a-8b97-74eee2c675e7';

-- "AI governance acceptable use:" — duplicate of 597bf01c
DELETE FROM akt_questions WHERE id = '6e49ed27-3c27-4378-bef1-3d1e08e85244';

-- "AI use in consultations requires:" — duplicate of 597bf01c (different angle)
DELETE FROM akt_questions WHERE id = '18464b42-d56c-4306-be4a-22f576ea8c6a';

-----------------------------------------------------------
-- PART 2: REWRITE SHORT PCOM STEMS (>80 chars, scenario-based)
-----------------------------------------------------------

UPDATE akt_questions SET
  question = 'A palliative care nurse asks a GP registrar about best practice for DNACPR discussions with patients and their families. What is the most important principle regarding DNACPR conversations?',
  updated_at = now()
WHERE id = '0ed16b84-fdf7-4608-b0f0-d83d6a62d1a3';

UPDATE akt_questions SET
  question = 'A GP registrar posts a comment about a difficult consultation on a private social media group. Her educational supervisor asks about GMC guidance on social media. What is the most important principle?',
  updated_at = now()
WHERE id = '103ad7d0-975d-48a3-ab74-8c6bb493d915';

UPDATE akt_questions SET
  question = 'A GP receives a written complaint from a patient who felt rushed during a consultation. As part of the practice complaints process, the GP is asked to write a reflective piece. What should complaints reflection primarily include?',
  updated_at = now()
WHERE id = '1290f664-4668-42e2-8be2-634e3ec063bf';

UPDATE akt_questions SET
  question = 'A GP registrar is asked which vaccines are contraindicated in a 35-year-old woman taking azathioprine for Crohn''s disease. In which of the following patient groups are live vaccines contraindicated?',
  updated_at = now()
WHERE id = '1511570e-5fb9-4fd0-a001-121866fc3edd';

UPDATE akt_questions SET
  question = 'A GP practice has introduced online consultations via an e-consultation platform. A GP registrar asks what must be documented in every remote consultation to ensure medicolegal safety. Which element is most essential?',
  updated_at = now()
WHERE id = '1595b2fb-8a50-4a96-833a-8903c56b2321';

UPDATE akt_questions SET
  question = 'A newly qualified GP is considering career options and asks about the employment status of salaried GPs compared to GP partners. Which statement best describes salaried GPs?',
  updated_at = now()
WHERE id = '1d18692a-b352-4d8e-8288-f3b34f82755d';

UPDATE akt_questions SET
  question = 'A GP registrar witnesses a colleague repeatedly arriving at work smelling of alcohol. She is unsure what to do and asks her supervisor for guidance. What does GMC guidance on raising concerns encourage?',
  updated_at = now()
WHERE id = '1d2fb411-48ab-40b5-a1b1-b628910bc523';

UPDATE akt_questions SET
  question = 'A practice manager is reviewing data security policies following a recent NHS England audit. She asks the GPs what the core principle of information governance regarding patient data is. What does information governance require?',
  updated_at = now()
WHERE id = '21ca2f3e-17ea-4807-a718-b00c0b9fe1a5';

UPDATE akt_questions SET
  question = 'A GP trainee is revising for the AKT exam and asks a senior colleague for advice on tackling the Primary Care Organisation and Management (PCOM) section. What is the most important strategy for answering PCOM questions?',
  updated_at = now()
WHERE id = '225d5568-57b3-448a-8b6a-51f1aee32943';

UPDATE akt_questions SET
  question = 'A GP practice is recruiting a new clinical lead. The interview panel discusses what personal qualities are most important for effective clinical leadership in primary care. Which attribute is most essential for effective leadership?',
  updated_at = now()
WHERE id = '2b990c67-5a90-4a74-b307-0ebe1eac8dd0';

UPDATE akt_questions SET
  question = 'A patient with chronic low back pain asks their GP for a fit note. The GP considers what recommendations can be included in the fit note to support a phased return to work. What can fit notes include beyond the diagnosis?',
  updated_at = now()
WHERE id = '31640e41-af41-468f-9ade-9771da015d13';

UPDATE akt_questions SET
  question = 'A GP practice has introduced a telephone triage system. A GP registrar asks what must be included in the clinical documentation for every triage encounter to ensure safe practice. What should triage documentation include?',
  updated_at = now()
WHERE id = '36194666-2ac4-482c-a140-0ebff08d9b24';

UPDATE akt_questions SET
  question = 'A GP in an inner-city practice notices significant differences in life expectancy between affluent and deprived areas of the borough. She wants to address health inequalities in her practice population. What is the GP''s role in reducing health inequalities?',
  updated_at = now()
WHERE id = '3830142c-bb66-4e1b-9ca6-0dcaea004695';

UPDATE akt_questions SET
  question = 'A GP registrar asks her educational supervisor about professional boundaries after a patient offered her an expensive gift. The supervisor discusses GMC guidance. What is the core principle regarding professional boundaries?',
  updated_at = now()
WHERE id = '4cef7471-1bc2-4041-a54b-0dea119028dc';

UPDATE akt_questions SET
  question = 'A 72-year-old man with early dementia is asked to consent to a minor surgical procedure. The surgical team needs to assess whether he has the capacity to make this decision. Under the Mental Capacity Act 2005, which abilities must a patient demonstrate to have capacity?',
  updated_at = now()
WHERE id = '51446a8f-dd69-4db3-a8e3-1f4a1da360a3';

UPDATE akt_questions SET
  question = 'A GP registrar asks her trainer about the different types of NHS contracts available for GP practices in England and which is the standard national contract. What is the core NHS contract type for GP practices?',
  updated_at = now()
WHERE id = '526f7d6c-5f8f-48dc-98ba-2926a1015f41';

UPDATE akt_questions SET
  question = 'A GP practice is considering using an AI tool to help draft patient letters and consultation summaries. The practice manager asks about acceptable use of AI in clinical settings. Which of the following represents acceptable use of AI in GP practice?',
  updated_at = now()
WHERE id = '597bf01c-62f6-465e-b4b3-4e1bc59f7642';

UPDATE akt_questions SET
  question = 'A GP is called to certify the death of a 45-year-old man found collapsed at home with no significant past medical history. His family say he was well yesterday. The GP is unsure whether to refer to the coroner. Which type of death requires referral to the coroner?',
  updated_at = now()
WHERE id = '5d4f34c6-05c6-4ff3-ae02-77fedf821cd3';

UPDATE akt_questions SET
  question = 'A GP registrar is feeling overwhelmed by her workload and asks her educational supervisor for advice on building resilience. What is the most effective approach to building professional resilience?',
  updated_at = now()
WHERE id = '5fb1c94c-c7ae-49f2-83fc-4c32b9959a9b';

UPDATE akt_questions SET
  question = 'A mother discloses to her GP that her partner has been hitting their 3-year-old child. She asks the GP not to tell anyone. Under what circumstances does safeguarding override patient confidentiality?',
  updated_at = now()
WHERE id = '603de0ee-271d-42ad-b788-e0b623989bd1';

UPDATE akt_questions SET
  question = 'A GP registrar in her ST3 year asks who is responsible for overseeing her training, reviewing her portfolio, and preparing her for the ARCP. Who provides educational supervision of GP trainees?',
  updated_at = now()
WHERE id = '6b0b61f1-906b-4724-ae5c-87c4264a5ba8';

UPDATE akt_questions SET
  question = 'A GP is discussing future care preferences with an 80-year-old patient who has advanced COPD. The patient wants to document his wishes in case he loses capacity in the future. What should advance care planning primarily reflect?',
  updated_at = now()
WHERE id = '6efbec7c-6d7a-4f3d-b506-eb24c0f77eda';

UPDATE akt_questions SET
  question = 'A 55-year-old taxi driver is diagnosed with type 2 diabetes and started on insulin. The GP needs to advise him about his driving licence. Who has the legal responsibility for notifying the DVLA about medical conditions affecting fitness to drive?',
  updated_at = now()
WHERE id = '6f480907-0314-4c3b-9ecf-8aa09d64b0da';

UPDATE akt_questions SET
  question = 'A practice nurse asks a GP how often patients with learning disabilities should be invited for a comprehensive health check. According to NHS England guidance, how frequently should learning disability health checks be offered?',
  updated_at = now()
WHERE id = '7139f671-65a4-467e-8285-2ff3a9d241c5';

UPDATE akt_questions SET
  question = 'A newly qualified GP is considering joining a partnership and asks about how partner income is determined compared to salaried positions. What does GP partner income primarily depend on?',
  updated_at = now()
WHERE id = '734e5697-124d-4267-a1de-96a2813a89b0';

UPDATE akt_questions SET
  question = 'A GP practice is considering using an AI-powered clinical decision support tool. The practice manager asks about data governance requirements when entering patient information into AI systems. What must data entered into AI tools comply with?',
  updated_at = now()
WHERE id = '739d788b-1bb2-4789-b079-166f29d0ef29';

UPDATE akt_questions SET
  question = 'A 32-year-old woman discloses to her GP that she is experiencing domestic abuse from her partner. She is tearful and frightened. The GP documents the consultation carefully. Which approach to documentation is most appropriate in cases of domestic abuse?',
  updated_at = now()
WHERE id = '7a138ada-4596-4c29-afdb-4cca9a4ae694';

UPDATE akt_questions SET
  question = 'A GP practice is reviewing its risk management strategy after receiving several complaints. The practice manager asks what the most common source of medicolegal risk in general practice is. Which area represents the highest medicolegal risk?',
  updated_at = now()
WHERE id = '845a4b36-a5e1-4e58-9864-01d70bfcc79c';

UPDATE akt_questions SET
  question = 'A GP registrar asks her trainer about the Quality and Outcomes Framework (QOF) and its purpose within the NHS GP contract. What does QOF primarily aim to achieve?',
  updated_at = now()
WHERE id = '85105f40-ac86-4ba5-a356-f5fb7577a710';

UPDATE akt_questions SET
  question = 'A GP practice is reviewing its income streams and the practice manager explains the different types of services the practice provides to NHS commissioners. What are enhanced services in the context of GP commissioning?',
  updated_at = now()
WHERE id = '8781aaa7-c098-469d-b216-949e867d18e1';

UPDATE akt_questions SET
  question = 'A GP registrar is reviewing the childhood immunisation schedule and asks which of the following is a live vaccine, as she needs to advise an immunosuppressed patient''s family. Which of the following is a live vaccine?',
  updated_at = now()
WHERE id = '8fe5c2db-5a4a-4134-a42e-55eea0c1a48b';

UPDATE akt_questions SET
  question = 'A GP registrar is learning about medical records standards and asks what a good GP consultation note should demonstrate to meet both clinical and medicolegal standards. What is the most important quality of a good GP clinical note?',
  updated_at = now()
WHERE id = '9a219061-ec6b-434f-83fb-7cb0197ca774';

UPDATE akt_questions SET
  question = 'A 75-year-old woman with delirium secondary to a UTI has fluctuating capacity — she is lucid in the mornings but confused in the afternoons. A decision about her discharge destination needs to be made. What is the best approach when a patient has fluctuating capacity?',
  updated_at = now()
WHERE id = 'af698a4e-3332-47f8-bdba-14e100377b9e';

UPDATE akt_questions SET
  question = 'A GP practice has received a formal complaint from a patient who was dissatisfied with their care. The practice manager leads the complaints process. What is best practice in handling patient complaints?',
  updated_at = now()
WHERE id = 'b14ea3db-0eb3-4a35-b6c4-487b293bd334';

UPDATE akt_questions SET
  question = 'A 68-year-old man with epilepsy asks his GP whether he can continue driving. He had his last seizure 8 months ago. The GP needs to advise him about DVLA regulations. Who is responsible for advising the patient about fitness to drive and medical conditions?',
  updated_at = now()
WHERE id = 'bd259d8e-c8cc-4247-9cb2-b36f81fd55f3';

UPDATE akt_questions SET
  question = 'A GP registrar asks about how GP practice income is structured and what the main components of NHS funding for general practice are. From which source is GP practice income primarily derived?',
  updated_at = now()
WHERE id = 'c16d0c06-4d17-4b6d-95c1-e7c5f9431e26';

UPDATE akt_questions SET
  question = 'A GP practice has started using an AI scribe to generate consultation notes from audio recordings. A GP registrar asks what best practice is for using AI-generated clinical documentation. What is the most important principle?',
  updated_at = now()
WHERE id = 'c45fb117-8414-4ee1-97ad-df4135ea4409';

UPDATE akt_questions SET
  question = 'A GP practice is reviewing its medical indemnity arrangements. A salaried GP asks what types of claims are covered by medical indemnity insurance. What does GP indemnity primarily cover?',
  updated_at = now()
WHERE id = 'c6d1ea31-d573-45ed-bfcb-2d0c5670e613';

UPDATE akt_questions SET
  question = 'A GP advises a 50-year-old patient with newly diagnosed obstructive sleep apnoea about the requirement to inform the DVLA. The patient asks why this needs to be documented. What is the most important principle regarding DVLA advice documentation?',
  updated_at = now()
WHERE id = 'c8cf8e52-906d-4816-9961-e6c24e3f3543';

UPDATE akt_questions SET
  question = 'A patient offers a GP a bottle of wine after the GP provided excellent care during a difficult illness. The GP is unsure whether to accept. What is the GMC guidance on accepting gifts from patients?',
  updated_at = now()
WHERE id = 'c9506f32-501c-414a-88d2-2fa795626c5f';

UPDATE akt_questions SET
  question = 'A GP registrar is revising for the AKT exam and asks her trainer about the core principles outlined in GMC Good Medical Practice. What is the overarching core principle of GMC Good Medical Practice?',
  updated_at = now()
WHERE id = 'd021b1ae-b644-4d84-b43a-53b42092990b';

UPDATE akt_questions SET
  question = 'A GP registrar is struggling with work-life balance during a busy winter rotation. She asks her educational supervisor for evidence-based strategies to prevent burnout. Which strategy is most effective for preventing burnout in healthcare professionals?',
  updated_at = now()
WHERE id = 'd1e30085-d68c-4638-822f-32067d27b155';

UPDATE akt_questions SET
  question = 'A 30-year-old HGV driver is diagnosed with epilepsy after a witnessed tonic-clonic seizure. He asks his GP about the implications for his driving licence and employment. Which condition must be disclosed for safety-critical work such as HGV driving?',
  updated_at = now()
WHERE id = 'd4265074-95c5-4a94-a25c-7a0430ae04e6';

UPDATE akt_questions SET
  question = 'A patient with chronic fatigue syndrome has been off work for 6 months. Her employer requests a fitness-for-work assessment from the GP. The GP is unsure of their role. Who is primarily responsible for assessing fitness for work?',
  updated_at = now()
WHERE id = 'da78e81a-71f2-4b8b-bb68-5d5d193e9ba1';

UPDATE akt_questions SET
  question = 'A 25-year-old woman attends her GP three days after being sexually assaulted. She has not yet reported the incident to the police and is unsure what to do. What is the most appropriate initial action by the GP?',
  updated_at = now()
WHERE id = 'e4eaf09c-c07e-48b3-8d4c-6c896403f16e';

UPDATE akt_questions SET
  question = 'A locum GP is starting work at a new practice and asks the practice manager about indemnity arrangements. The practice manager says the practice has employer liability insurance. What must locum GPs ensure regarding indemnity?',
  updated_at = now()
WHERE id = 'e617dcba-7432-46ab-a22e-f58725c74fdd';

UPDATE akt_questions SET
  question = 'A GP registrar asks her educational supervisor how often GPs must undergo revalidation to maintain their licence to practise with the GMC. How frequently does revalidation occur?',
  updated_at = now()
WHERE id = 'ed815680-303c-4aca-9121-ebcd657ec18e';

UPDATE akt_questions SET
  question = 'A patient writes a letter of complaint to the practice stating that the GP was dismissive during a recent consultation about chest pain. The practice manager asks the GP to respond. What is the most appropriate first step in managing this complaint?',
  updated_at = now()
WHERE id = 'f8a8aedb-9bde-4183-82c3-1c5b624c34da';

UPDATE akt_questions SET
  question = 'A GP trainee has completed her revision for the AKT and is sitting the exam tomorrow. She asks a colleague who recently passed for final advice on exam-day mindset. What is the best advice for exam-day performance?',
  updated_at = now()
WHERE id = 'ffb57e05-8d17-404a-a883-f6cf228e4929';
