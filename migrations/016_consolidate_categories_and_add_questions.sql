-- Migration: Consolidate Niche Categories and Add Questions to Broader Categories
-- This migration:
-- 1. Consolidates niche categories into broader ones (GCA, PMR, Shoulder, Elbow, Back Pain)
-- 2. Adds more questions to broader categories that need at least 20 questions

-- Step 1: Consolidate niche categories
UPDATE akt_questions 
SET topic = 'Rheumatology' 
WHERE topic IN ('Gca', 'GCA', 'Pmr', 'PMR', 'Pmr');

UPDATE akt_questions 
SET topic = 'Ophthalmology' 
WHERE topic = 'Gca' AND (question ILIKE '%vision%' OR question ILIKE '%eye%' OR question ILIKE '%visual%');

UPDATE akt_questions 
SET topic = 'Musculoskeletal' 
WHERE topic IN ('Shoulder', 'Elbow', 'Back Pain', 'Sciatica');

-- Step 2: Add more questions to broader categories

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro) VALUES

-- Sexual Health (need 18 more to reach 20)
(
  'A 25-year-old man presents with dysuria and penile discharge. Gram stain shows intracellular Gram-negative diplococci. What is the most appropriate treatment?',
  '[
    {"label": "A", "text": "Azithromycin 1g single dose"},
    {"label": "B", "text": "Ceftriaxone 500mg IM single dose + azithromycin 1g"},
    {"label": "C", "text": "Doxycycline 100mg BD for 7 days"},
    {"label": "D", "text": "Metronidazole 400mg BD for 7 days"},
    {"label": "E", "text": "Amoxicillin 500mg TDS for 7 days"}
  ]'::jsonb,
  'B',
  'This is gonorrhoea (intracellular Gram-negative diplococci). Treatment is ceftriaxone 500mg IM single dose + azithromycin 1g (to cover possible chlamydia co-infection). Contact tracing and partner notification essential. Test for other STIs (HIV, syphilis, chlamydia).',
  'Sexual Health',
  'medium',
  ARRAY['NICE CKS: Gonorrhoea', 'Ceftriaxone + azithromycin', 'Contact tracing essential', 'Test for other STIs'],
  false
),

(
  'A 30-year-old woman presents with vaginal discharge and dysuria. Microscopy shows clue cells. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Candidiasis"},
    {"label": "B", "text": "Bacterial vaginosis"},
    {"label": "C", "text": "Trichomoniasis"},
    {"label": "D", "text": "Chlamydia"},
    {"label": "E", "text": "Gonorrhoea"}
  ]'::jsonb,
  'B',
  'Clue cells (epithelial cells covered with bacteria) are diagnostic of bacterial vaginosis. Other features: thin, grey-white discharge, fishy odour (especially after sex), pH >4.5. Treatment is metronidazole 400mg BD for 5-7 days or clindamycin cream.',
  'Sexual Health',
  'medium',
  ARRAY['NICE CKS: Bacterial vaginosis', 'Clue cells = diagnostic', 'Metronidazole or clindamycin', 'pH >4.5'],
  false
),

(
  'A 20-year-old woman presents requesting STI screening. She is asymptomatic but had unprotected sex 2 weeks ago. What tests should be offered?',
  '[
    {"label": "A", "text": "Chlamydia and gonorrhoea only"},
    {"label": "B", "text": "Chlamydia, gonorrhoea, HIV, and syphilis"},
    {"label": "C", "text": "Full STI screen including hepatitis B and C"},
    {"label": "D", "text": "No tests needed if asymptomatic"},
    {"label": "E", "text": "Chlamydia only"}
  ]'::jsonb,
  'B',
  'For asymptomatic STI screening after unprotected sex, offer: chlamydia (NAAT), gonorrhoea (NAAT), HIV (blood test), and syphilis (serology). Hepatitis B/C screening if risk factors present. Offer contraception and safer sex advice.',
  'Sexual Health',
  'medium',
  ARRAY['NICE CKS: STI screening', 'Chlamydia, gonorrhoea, HIV, syphilis', 'NAAT for chlamydia/gonorrhoea', 'Offer contraception advice'],
  false
),

(
  'A 35-year-old man presents with a painless ulcer on his penis. Syphilis serology is positive. What is the first-line treatment?',
  '[
    {"label": "A", "text": "Azithromycin 1g single dose"},
    {"label": "B", "text": "Benzathine penicillin 2.4MU IM single dose"},
    {"label": "C", "text": "Doxycycline 100mg BD for 14 days"},
    {"label": "D", "text": "Ceftriaxone 500mg IM single dose"},
    {"label": "E", "text": "Metronidazole 400mg BD for 7 days"}
  ]'::jsonb,
  'B',
  'Primary syphilis (painless chancre) is treated with benzathine penicillin 2.4MU IM single dose. For penicillin allergy, doxycycline 100mg BD for 14 days. Contact tracing essential. Test for other STIs. Follow-up serology to ensure treatment success.',
  'Sexual Health',
  'medium',
  ARRAY['NICE CKS: Syphilis', 'Benzathine penicillin 2.4MU IM', 'Doxycycline if penicillin allergic', 'Contact tracing essential'],
  false
),

-- Women''s Health (need 4 more to reach 20)
(
  'A 28-year-old woman presents with heavy menstrual bleeding affecting her quality of life. She has completed her family. What is the first-line treatment?',
  '[
    {"label": "A", "text": "Tranexamic acid during menses"},
    {"label": "B", "text": "Mirena IUS (levonorgestrel-releasing)"},
    {"label": "C", "text": "Combined oral contraceptive pill"},
    {"label": "D", "text": "Endometrial ablation"},
    {"label": "E", "text": "Hysterectomy"}
  ]'::jsonb,
  'B',
  'Mirena IUS is first-line for heavy menstrual bleeding in women who have completed their family. It reduces bleeding by up to 90% and provides contraception. Tranexamic acid and COCP are second-line options. Endometrial ablation or hysterectomy are considered if medical management fails.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Menorrhagia (heavy menstrual bleeding)', 'Mirena IUS first-line', 'Reduces bleeding by 90%', 'Provides contraception'],
  false
),

(
  'A 45-year-old woman presents with hot flushes, night sweats, and mood changes for 6 months. Her last period was 9 months ago. She has no contraindications to HRT. What is the most appropriate treatment?',
  '[
    {"label": "A", "text": "SSRI (fluoxetine)"},
    {"label": "B", "text": "Hormone replacement therapy (HRT)"},
    {"label": "C", "text": "Clonidine"},
    {"label": "D", "text": "Black cohosh"},
    {"label": "E", "text": "Lifestyle measures only"}
  ]'::jsonb,
  'B',
  'This is perimenopause/menopause with vasomotor symptoms. HRT is first-line treatment for menopausal symptoms if no contraindications. Consider risks vs benefits (breast cancer, VTE, stroke). SSRI is second-line if HRT contraindicated. Lifestyle measures can help but are not first-line for moderate-severe symptoms.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Menopause', 'HRT first-line for vasomotor symptoms', 'Consider risks vs benefits', 'SSRI second-line if HRT contraindicated'],
  false
),

(
  'A 32-year-old woman presents requesting contraception. She has no medical contraindications and has never used hormonal contraception. She would prefer not to have to remember daily pills. What is the most appropriate option?',
  '[
    {"label": "A", "text": "Combined oral contraceptive pill"},
    {"label": "B", "text": "Progestogen-only pill"},
    {"label": "C", "text": "Mirena IUS"},
    {"label": "D", "text": "Contraceptive implant"},
    {"label": "E", "text": "Depot injection"}
  ]'::jsonb,
  'C',
  'For a woman who does not want to remember daily pills, long-acting reversible contraception (LARC) is ideal. Mirena IUS (or contraceptive implant) are highly effective, long-acting options. Mirena IUS also reduces heavy menstrual bleeding. Depot injection requires 12-weekly administration. LARC methods are more effective than pills.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Contraception - assessment', 'LARC (IUS/implant) highly effective', 'Mirena IUS also reduces heavy bleeding', 'More effective than pills'],
  false
),

(
  'A 30-year-old woman presents requesting emergency contraception. She had unprotected intercourse 50 hours ago. She has no contraindications. What is the most appropriate option?',
  '[
    {"label": "A", "text": "Levonorgestrel 1.5mg single dose"},
    {"label": "B", "text": "Ulipristal 30mg single dose"},
    {"label": "C", "text": "Copper IUD insertion"},
    {"label": "D", "text": "Combined oral contraceptive (Yuzpe method)"},
    {"label": "E", "text": "No effective option available after 48 hours"}
  ]'::jsonb,
  'B',
  'Ulipristal (ellaOne) is effective up to 120 hours (5 days) after unprotected intercourse and is more effective than levonorgestrel. Levonorgestrel is only effective up to 72 hours. Copper IUD is also effective up to 5 days and is the most effective option, but requires insertion. Ulipristal is the best oral option at 50 hours.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Contraception - emergency', 'Ulipristal up to 120 hours', 'More effective than levonorgestrel', 'Copper IUD most effective but requires insertion'],
  false
),

-- Geriatrics (need 19 more to reach 20)
(
  'An 85-year-old woman presents with recurrent falls over the past 3 months. On assessment, she has postural hypotension and is on multiple medications. What is the most important intervention?',
  '[
    {"label": "A", "text": "Prescribe vitamin D supplements"},
    {"label": "B", "text": "Review medications and reduce if possible"},
    {"label": "C", "text": "Refer to physiotherapy"},
    {"label": "D", "text": "Prescribe bisphosphonates"},
    {"label": "E", "text": "Arrange bone density scan"}
  ]'::jsonb,
  'B',
  'Medication review is crucial in falls prevention, especially in elderly patients on multiple medications. Polypharmacy increases fall risk. Consider reducing or stopping medications that cause postural hypotension, sedation, or dizziness. Other interventions (vitamin D, exercise, home modifications) are also important but medication review is often the most impactful.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Falls', 'Medication review crucial', 'Polypharmacy increases fall risk', 'Reduce medications causing postural hypotension'],
  false
),

(
  'An 80-year-old man presents with acute confusion over 2 days. He has no fever. On examination, he is disorientated and has a tremor. What is the most likely cause?',
  '[
    {"label": "A", "text": "Dementia"},
    {"label": "B", "text": "Delirium"},
    {"label": "C", "text": "Depression"},
    {"label": "D", "text": "Stroke"},
    {"label": "E", "text": "Normal ageing"}
  ]'::jsonb,
  'B',
  'Acute confusion with rapid onset (hours to days) suggests delirium, not dementia. Delirium is often caused by infection, medications, dehydration, or other acute illness. Dementia is gradual onset. Key features: acute onset, fluctuating course, inattention, disorganised thinking. Investigate for underlying cause.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Delirium', 'Acute onset = delirium', 'Fluctuating course characteristic', 'Investigate for underlying cause'],
  false
),

(
  'A 90-year-old woman with advanced dementia is admitted to hospital with pneumonia. Her family asks about resuscitation status. What is the most appropriate approach?',
  '[
    {"label": "A", "text": "Always attempt resuscitation"},
    {"label": "B", "text": "Discuss DNACPR with patient and family"},
    {"label": "C", "text": "Family decides without medical input"},
    {"label": "D", "text": "No discussion needed, assume full resuscitation"},
    {"label": "E", "text": "Only discuss if patient asks"}
  ]'::jsonb,
  'B',
  'DNACPR (Do Not Attempt Cardiopulmonary Resuscitation) decisions should be discussed with patients (if they have capacity) and families. In advanced dementia, CPR is unlikely to be successful and may cause harm. Discussion should be sensitive, involve family, and document clearly. This is a clinical decision, not just a family preference.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: DNACPR', 'Sensitive discussion with patient/family', 'CPR unlikely successful in advanced dementia', 'Document clearly'],
  false
),

(
  'An 82-year-old woman presents with unintentional weight loss (5kg over 3 months) and reduced appetite. She lives alone. What is the most important initial assessment?',
  '[
    {"label": "A", "text": "Prescribe nutritional supplements"},
    {"label": "B", "text": "Assess for underlying medical causes and social factors"},
    {"label": "C", "text": "Refer to dietitian"},
    {"label": "D", "text": "Arrange swallowing assessment"},
    {"label": "E", "text": "Reassure, normal for age"}
  ]'::jsonb,
  'B',
  'Unintentional weight loss in elderly requires comprehensive assessment: medical causes (malignancy, depression, dementia, medications, chronic disease), social factors (isolation, poverty, difficulty shopping/cooking), and functional decline. Nutritional supplements are supportive but addressing underlying cause is key.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Frailty', 'Assess medical and social causes', 'Consider isolation, poverty, functional decline', 'Address underlying cause'],
  false
),

-- Palliative Care (need 18 more to reach 20)
(
  'A 75-year-old man with advanced lung cancer presents with severe breathlessness. He is on regular morphine for pain. What is the most appropriate management for breathlessness?',
  '[
    {"label": "A", "text": "Increase morphine dose"},
    {"label": "B", "text": "Add benzodiazepines"},
    {"label": "C", "text": "Consider low-dose morphine or benzodiazepine for breathlessness"},
    {"label": "D", "text": "Prescribe oxygen only"},
    {"label": "E", "text": "No treatment, normal in advanced disease"}
  ]'::jsonb,
  'C',
  'For breathlessness in advanced disease, consider low-dose morphine (if not already on) or benzodiazepines (e.g., lorazepam). Non-pharmacological measures: fan, positioning, relaxation. Oxygen only if hypoxic. Morphine can help breathlessness even without pain. Address anxiety and fear.',
  'Palliative Care',
  'medium',
  ARRAY['NICE CKS: End of life care', 'Low-dose morphine for breathlessness', 'Benzodiazepines for anxiety', 'Non-pharmacological measures important'],
  false
),

(
  'A 70-year-old woman with advanced cancer is experiencing nausea and vomiting. She is on regular opioids. What is the most appropriate anti-emetic?',
  '[
    {"label": "A", "text": "Metoclopramide"},
    {"label": "B", "text": "Cyclizine"},
    {"label": "C", "text": "Haloperidol"},
    {"label": "D", "text": "Ondansetron"},
    {"label": "E", "text": "Prochlorperazine"}
  ]'::jsonb,
  'B',
  'For opioid-induced nausea and vomiting, cyclizine (antihistamine/anticholinergic) is often effective. Metoclopramide can be used but avoid in bowel obstruction. Haloperidol is useful for chemical causes. Ondansetron is for chemotherapy-induced nausea. Consider route (oral, buccal, SC) if swallowing difficult.',
  'Palliative Care',
  'medium',
  ARRAY['NICE CKS: End of life care', 'Cyclizine for opioid-induced nausea', 'Consider route of administration', 'Review if ineffective'],
  false
),

-- More Sexual Health questions (need 14 more)
(
  'A 22-year-old woman presents with vaginal itching and thick white discharge. Microscopy shows pseudohyphae. What is the diagnosis and treatment?',
  '[
    {"label": "A", "text": "Bacterial vaginosis - metronidazole"},
    {"label": "B", "text": "Candidiasis - fluconazole 150mg single dose"},
    {"label": "C", "text": "Trichomoniasis - metronidazole"},
    {"label": "D", "text": "Chlamydia - azithromycin"},
    {"label": "E", "text": "Normal discharge - no treatment"}
  ]'::jsonb,
  'B',
  'Pseudohyphae on microscopy indicate candidiasis (thrush). Treatment is fluconazole 150mg single dose (or topical clotrimazole). Recurrent candidiasis (>4 episodes/year) may need longer course or maintenance therapy. Consider diabetes, immunosuppression, or recent antibiotics.',
  'Sexual Health',
  'medium',
  ARRAY['NICE CKS: Candidiasis', 'Pseudohyphae = candidiasis', 'Fluconazole 150mg single dose', 'Consider underlying causes if recurrent'],
  false
),

(
  'A 28-year-old man presents with a painless ulcer on his penis and inguinal lymphadenopathy. What is the most likely diagnosis?',
  '[
    {"label": "A", "text": "Genital herpes"},
    {"label": "B", "text": "Primary syphilis"},
    {"label": "C", "text": "Chancroid"},
    {"label": "D", "text": "Lymphogranuloma venereum"},
    {"label": "E", "text": "Trauma"}
  ]'::jsonb,
  'B',
  'Painless ulcer (chancre) + inguinal lymphadenopathy is classic for primary syphilis. Genital herpes is painful vesicles. Chancroid is painful ulcer. Test with syphilis serology (VDRL/RPR and TPHA/TPPA). Treat with benzathine penicillin. Contact tracing essential.',
  'Sexual Health',
  'medium',
  ARRAY['NICE CKS: Syphilis', 'Painless chancre = primary syphilis', 'Syphilis serology for diagnosis', 'Benzathine penicillin treatment'],
  false
),

-- More Women''s Health questions (already have enough, but adding a few more for variety)
(
  'A 40-year-old woman presents with irregular heavy periods and intermenstrual bleeding. She has a BMI of 35. What is the most important investigation?',
  '[
    {"label": "A", "text": "Full blood count"},
    {"label": "B", "text": "Transvaginal ultrasound"},
    {"label": "C", "text": "Endometrial biopsy'},
    {"label": "D", "text": "Thyroid function tests"},
    {"label": "E", "text": "Coagulation screen"}
  ]'::jsonb,
  'B',
  'Irregular heavy bleeding + intermenstrual bleeding + high BMI (risk factor for endometrial cancer) requires transvaginal ultrasound to assess endometrial thickness. If >4mm in postmenopausal or concerning features, consider endometrial biopsy. FBC for anaemia, but imaging is priority.',
  'Women''s Health',
  'medium',
  ARRAY['NICE CKS: Menorrhagia (heavy menstrual bleeding)', 'Irregular + intermenstrual bleeding = investigate', 'TVUS for endometrial thickness', 'Endometrial biopsy if concerning'],
  false
),

-- More Geriatrics questions (need 15 more)
(
  'An 88-year-old woman with dementia is brought in by her family who report she has become increasingly confused and agitated over the past week. What is the most important initial assessment?',
  '[
    {"label": "A", "text": "Increase dementia medication"},
    {"label": "B", "text": "Assess for delirium and underlying cause"},
    {"label": "C", "text": "Prescribe antipsychotics"},
    {"label": "D", "text": "Refer to memory clinic"},
    {"label": "E", "text": "Reassure, normal progression"}
  ]'::jsonb,
  'B',
  'Acute worsening of confusion in dementia suggests delirium (acute confusional state). Common causes: infection (UTI, chest), medications, dehydration, constipation, pain. Assess for underlying cause before treating symptoms. Antipsychotics only if severe agitation/aggression and non-pharmacological measures fail.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Delirium', 'Acute worsening = delirium', 'Common causes: infection, medications, dehydration', 'Assess before treating'],
  false
),

(
  'An 85-year-old man presents with a fall. He reports feeling dizzy before falling. On examination, he has postural hypotension. He takes amlodipine, ramipril, and bendroflumethiazide. What is the most appropriate action?',
  '[
    {"label": "A", "text": "Add more antihypertensives"},
    {"label": "B", "text": "Review and reduce antihypertensive medications"},
    {"label": "C", "text": "Prescribe fludrocortisone"},
    {"label": "D", "text": "Refer to cardiology"},
    {"label": "E", "text": "No changes needed"}
  ]'::jsonb,
  'B',
  'Postural hypotension in elderly on multiple antihypertensives is a common cause of falls. Review medications - consider reducing or stopping one, especially if BP well controlled. In elderly, slightly higher BP targets may be acceptable to reduce fall risk. Medication review is key.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Falls', 'Postural hypotension common cause', 'Review antihypertensives', 'Higher BP targets may be acceptable in elderly'],
  false
),

-- More Palliative Care questions (need 16 more)
(
  'A 68-year-old woman with advanced cancer is experiencing severe pain. She is currently on paracetamol and codeine. What is the next step in pain management?',
  '[
    {"label": "A", "text": "Increase codeine dose"},
    {"label": "B", "text": "Switch to morphine (strong opioid)"},
    {"label": "C", "text": "Add NSAID"},
    {"label": "D", "text": "Refer to pain clinic"},
    {"label": "E", "text": "Add gabapentin"}
  ]'::jsonb,
  'B',
  'For moderate-severe cancer pain, step up to strong opioid (morphine). Start with immediate-release morphine (e.g., 5-10mg 4-hourly), then convert to modified-release once stable. Always prescribe breakthrough dose (10-20% of 24-hour total). Regular review and titration needed.',
  'Palliative Care',
  'medium',
  ARRAY['NICE CKS: End of life care', 'Strong opioids for moderate-severe pain', 'Start with immediate-release morphine', 'Always prescribe breakthrough dose'],
  false
),

(
  'A 72-year-old man with advanced cancer is experiencing constipation. He is on regular morphine. What is the most appropriate laxative?',
  '[
    {"label": "A", "text": "Lactulose only"},
    {"label": "B", "text": "Combination of softener (docusate) and stimulant (senna)"},
    {"label": "C", "text": "Bisacodyl only"},
    {"label": "D", "text": "No laxative needed"},
    {"label": "E", "text": "Prucalopride"}
  ]'::jsonb,
  'B',
  'Opioid-induced constipation requires combination therapy: softener (docusate) + stimulant (senna). Start both together when starting opioids. Lactulose alone often insufficient. Regular review and may need to increase doses. Consider other causes (dehydration, immobility, medications).',
  'Palliative Care',
  'medium',
  ARRAY['NICE CKS: End of life care', 'Opioid constipation = softener + stimulant', 'Start when starting opioids', 'Regular review needed'],
  false
),

-- Continue adding more questions to reach 20 for each category
-- Sexual Health (need 14 more)
(
  'A 19-year-old woman presents with lower abdominal pain and vaginal discharge. She has a new sexual partner. What is the most appropriate initial investigation?',
  '[
    {"label": "A", "text": "Urine dipstick"},
    {"label": "B", "text": "NAAT for chlamydia and gonorrhoea"},
    {"label": "C", "text": "Pelvic examination only"},
    {"label": "D", "text": "Blood tests"},
    {"label": "E", "text": "No investigation needed"}
  ]'::jsonb,
  'B',
  'Lower abdominal pain + discharge + new sexual partner suggests pelvic inflammatory disease (PID) or STI. NAAT (nucleic acid amplification test) for chlamydia and gonorrhoea is first-line. Also consider full STI screen (HIV, syphilis). Pelvic examination may show cervical motion tenderness (PID).',
  'Sexual Health',
  'medium',
  ARRAY['NICE CKS: Pelvic inflammatory disease', 'NAAT for chlamydia/gonorrhoea', 'Consider full STI screen', 'Cervical motion tenderness suggests PID'],
  false
),

(
  'A 24-year-old man presents with dysuria and clear urethral discharge. Chlamydia NAAT is positive. What is the treatment?',
  '[
    {"label": "A", "text": "Azithromycin 1g single dose"},
    {"label": "B", "text": "Doxycycline 100mg BD for 7 days"},
    {"label": "C", "text": "Ceftriaxone 500mg IM"},
    {"label": "D", "text": "Metronidazole 400mg BD for 7 days"},
    {"label": "E", "text": "Amoxicillin 500mg TDS for 7 days"}
  ]'::jsonb,
  'A',
  'Chlamydia is treated with azithromycin 1g single dose (or doxycycline 100mg BD for 7 days). Azithromycin is preferred for single-dose convenience and better adherence. Contact tracing and partner notification essential. Test for other STIs. Advise no sex until treatment complete and partner treated.',
  'Sexual Health',
  'medium',
  ARRAY['NICE CKS: Chlamydia', 'Azithromycin 1g single dose', 'Contact tracing essential', 'Test for other STIs'],
  false
),

-- More Geriatrics questions (need 15 more)
(
  'An 87-year-old woman with dementia is brought in by her family. They report she has become increasingly agitated and is wandering at night. What is the most appropriate initial approach?',
  '[
    {"label": "A", "text": "Prescribe antipsychotics immediately"},
    {"label": "B", "text": "Assess for underlying causes (pain, infection, constipation)"},
    {"label": "C", "text": "Increase dementia medication"},
    {"label": "D", "text": "Refer to psychiatry"},
    {"label": "E", "text": "Reassure, normal progression"}
  ]'::jsonb,
  'B',
  'Agitation and wandering in dementia often have underlying causes: pain, infection (UTI), constipation, medication side effects, environmental factors. Assess and address these before considering antipsychotics. Antipsychotics only if severe and non-pharmacological measures fail, with clear discussion of risks.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Dementia', 'Agitation often has underlying cause', 'Assess for pain, infection, constipation', 'Antipsychotics last resort'],
  false
),

(
  'An 83-year-old man presents with a fall. He reports tripping over a rug. On assessment, he has poor vision and is on multiple medications. What is the most important intervention?',
  '[
    {"label": "A", "text": "Prescribe vitamin D"},
    {"label": "B", "text": "Home safety assessment and medication review"},
    {"label": "C", "text": "Refer to ophthalmology"},
    {"label": "D", "text": "Prescribe bisphosphonates"},
    {"label": "E", "text": "Advise to use walking frame"}
  ]'::jsonb,
  'B',
  'Falls prevention requires multifactorial approach: home safety (remove hazards like rugs, improve lighting), medication review (reduce fall-risk medications), vision assessment, exercise/balance training. Medication review is often most impactful. Vitamin D and bisphosphonates are for fracture prevention, not primary falls prevention.',
  'Geriatrics',
  'medium',
  ARRAY['NICE CKS: Falls', 'Multifactorial approach', 'Home safety + medication review', 'Exercise and balance training'],
  false
),

-- More Palliative Care questions (need 16 more)
(
  'A 65-year-old woman with advanced cancer is experiencing anxiety and fear about dying. What is the most appropriate approach?',
  '[
    {"label": "A", "text": "Prescribe antidepressants"},
    {"label": "B", "text": "Provide psychological support and consider benzodiazepines if severe"},
    {"label": "C", "text": "Ignore, normal in this situation"},
    {"label": "D", "text": "Refer to psychiatry only"},
    {"label": "E", "text": "Prescribe antipsychotics"}
  ]'::jsonb,
  'B',
  'Anxiety and fear in advanced disease require psychological support (listening, reassurance, addressing concerns) and may benefit from benzodiazepines (e.g., lorazepam) if severe. Antidepressants take weeks to work. Antipsychotics not first-line. Specialist palliative care input valuable.',
  'Palliative Care',
  'medium',
  ARRAY['NICE CKS: End of life care', 'Psychological support first-line', 'Benzodiazepines if severe', 'Specialist palliative care input'],
  false
);
