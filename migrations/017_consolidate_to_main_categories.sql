-- Migration: Consolidate All Subcategories into Main Categories
-- Based on user's comprehensive AKT structure
-- This consolidates niche categories and moves administrative topics to "Primary Care Organisation & Management"

-- Step 1: Consolidate Cardiovascular subcategories
UPDATE akt_questions 
SET topic = 'Cardiovascular' 
WHERE topic IN ('Hypertension', 'Ischaemic Heart Disease', 'Heart Failure', 'Atrial Fibrillation', 'Valvular Disease', 'Peripheral Arterial Disease', 'Lipid Management');

-- Step 2: Consolidate Respiratory subcategories
UPDATE akt_questions 
SET topic = 'Respiratory' 
WHERE topic IN ('Asthma', 'COPD', 'Respiratory Infections', 'Pulmonary Embolism', 'Lung Cancer', 'Obstructive Sleep Apnoea', 'Interstitial Lung Disease');

-- Step 3: Consolidate Endocrinology subcategories
UPDATE akt_questions 
SET topic = 'Endocrinology' 
WHERE topic IN ('Diabetes', 'Thyroid', 'Adrenal Disorders', 'Calcium Disorders', 'Obesity', 'Dyslipidaemia', 'PCOS', 'Thyroid Disease');

-- Step 4: Consolidate Gastrointestinal subcategories
UPDATE akt_questions 
SET topic = 'Gastroenterology' 
WHERE topic IN ('Dyspepsia', 'GERD', 'IBS', 'IBD', 'Coeliac Disease', 'Liver Disease', 'NAFLD', 'Gallstones', 'Pancreatitis', 'Colorectal Cancer');

-- Step 5: Consolidate Neurology subcategories
UPDATE akt_questions 
SET topic = 'Neurology' 
WHERE topic IN ('Headache', 'Migraine', 'Stroke', 'TIA', 'Epilepsy', 'Parkinson''s Disease', 'Multiple Sclerosis', 'Peripheral Neuropathy', 'Dementia');

-- Step 6: Consolidate Musculoskeletal subcategories
UPDATE akt_questions 
SET topic = 'Musculoskeletal' 
WHERE topic IN ('Osteoarthritis', 'Rheumatoid Arthritis', 'Polymyalgia Rheumatica', 'GCA', 'Back Pain', 'Osteoporosis', 'Gout', 'Pseudogout', 'Fibromyalgia', 'Soft Tissue Injuries', 'Shoulder', 'Elbow', 'Sciatica', 'Rheumatology', 'Pmr', 'PMR', 'Gca', 'GCA');

-- Step 7: Consolidate Renal & Urology subcategories
UPDATE akt_questions 
SET topic = 'Renal' 
WHERE topic IN ('Chronic Kidney Disease', 'CKD', 'AKI', 'UTI', 'Prostate Disease', 'LUTS', 'Renal Colic', 'Haematuria', 'Urology');

-- Step 8: Consolidate Women's Health subcategories
UPDATE akt_questions 
SET topic = 'Women''s Health' 
WHERE topic IN ('Contraception', 'Menstrual Disorders', 'Menorrhagia', 'Amenorrhoea', 'Menopause', 'Pregnancy', 'Gynaecological Cancers', 'Endometriosis', 'Gynaecology', 'Obstetrics');

-- Step 9: Consolidate Men's Health subcategories
UPDATE akt_questions 
SET topic = 'Men''s Health' 
WHERE topic IN ('Erectile Dysfunction', 'Testosterone Deficiency', 'Prostate Cancer', 'Testicular Cancer');

-- Step 10: Consolidate Mental Health subcategories
UPDATE akt_questions 
SET topic = 'Mental Health' 
WHERE topic IN ('Depression', 'Anxiety', 'Bipolar Disorder', 'Psychosis', 'Schizophrenia', 'ADHD', 'Eating Disorders', 'Suicide Risk Assessment', 'Generalized Anxiety Disorder');

-- Step 11: Consolidate Infectious Disease subcategories
UPDATE akt_questions 
SET topic = 'Infectious Diseases' 
WHERE topic IN ('URTI', 'LRTI', 'Sepsis', 'TB', 'Tuberculosis', 'HIV', 'STIs', 'Chlamydia', 'Gonorrhoea', 'Syphilis', 'Vaccination', 'Post-viral Syndromes', 'Infectious Disease');

-- Step 12: Consolidate Dermatology subcategories
UPDATE akt_questions 
SET topic = 'Dermatology' 
WHERE topic IN ('Eczema', 'Psoriasis', 'Acne', 'Rosacea', 'Skin Infections', 'Cellulitis', 'Fungal', 'Skin Cancer', 'Melanoma', 'SCC', 'BCC', 'Drug Rashes', 'Urticaria');

-- Step 13: Consolidate Haematology subcategories
UPDATE akt_questions 
SET topic = 'Haematology' 
WHERE topic IN ('Anaemia', 'Iron Deficiency', 'B12 Deficiency', 'Folate Deficiency', 'Coagulation Disorders', 'Anticoagulation', 'Haematological Malignancy');

-- Step 14: Consolidate ENT & Ophthalmology subcategories
UPDATE akt_questions 
SET topic = 'ENT' 
WHERE topic IN ('Otitis Media', 'Otitis Externa', 'Hearing Loss', 'Vertigo', 'BPPV', 'Ménière''s', 'Ent');

UPDATE akt_questions 
SET topic = 'Ophthalmology' 
WHERE topic IN ('Red Eye', 'Glaucoma', 'Visual Loss', 'Ophthalmology');

-- Step 15: Consolidate Palliative & Frailty subcategories
UPDATE akt_questions 
SET topic = 'Palliative Care' 
WHERE topic IN ('End Of Life', 'End-of-life', 'DNACPR', 'Dnacpr', 'Frailty', 'Falls', 'Delirium');

-- Step 16: Move all administrative/organizational topics to "Primary Care Organisation & Management"
UPDATE akt_questions 
SET topic = 'Primary Care Organisation & Management' 
WHERE topic IN ('Qof', 'QOF', 'AI Governance', 'Ai Governance', 'Complaints', 'Medical Reports', 'Public Health', 'Occupational Health', 'Exam Technique', 'Partnership', 'Training', 'Wellbeing', 'Triage', 'Documentation', 'Safeguarding', 'Learning Disability', 'Immunisation');

-- Step 17: Consolidate any remaining niche categories
UPDATE akt_questions 
SET topic = 'Prescribing' 
WHERE topic IN ('Prescribing', 'Drug Interactions', 'Medication Safety');

UPDATE akt_questions 
SET topic = 'Evidence-Based Practice' 
WHERE topic IN ('Ebp', 'EBP', 'Evidence-Based Practice', 'Statistics', 'Research Methods');

-- Step 18: Ensure Sexual Health is separate (not Women's Health)
-- Sexual Health should remain as its own category

-- Step 19: Ensure Paediatrics is separate
-- Paediatrics should remain as its own category

-- Step 20: Ensure Oncology is separate (if exists)
-- Oncology should remain as its own category

-- Step 21: Ensure Allergy is separate (if exists)
-- Allergy should remain as its own category
