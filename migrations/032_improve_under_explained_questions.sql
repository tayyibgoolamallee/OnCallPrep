-- Migration: Improve ALL Under-Explained Questions
-- Updates all 50 questions with explanations <200 characters to have detailed explanations
-- Based on analysis showing 50 questions need improvement

-- Question 1: Live vaccine (114 chars -> improved)
UPDATE akt_questions
SET explanation = 'Live vaccines (MMR, varicella, yellow fever, BCG, oral polio, rotavirus, nasal flu) contain weakened live organisms. They are contraindicated in: pregnancy, immunosuppression (including high-dose steroids >20mg prednisolone for >2 weeks), HIV with low CD4, recent immunoglobulin, and some cancers. Inactivated vaccines are safe in these groups. Always check contraindications before administering live vaccines.'
WHERE id = '8fe5c2db-5a4a-4134-a42e-55eea0c1a48b';

-- Question 2: Low MCV (117 chars -> improved)
UPDATE akt_questions
SET explanation = 'Low MCV (<80 fL) indicates microcytic anaemia. Causes include: iron deficiency (most common - check ferritin), thalassaemia (usually not anaemic or mild), anaemia of chronic disease (usually normocytic but can be microcytic), sideroblastic anaemia (rare). Iron deficiency requires investigation of cause (GI blood loss, menorrhagia, malabsorption). Thalassaemia shows high RBC count despite low MCV.'
WHERE id = '196bc88a-6e19-4ec4-9c50-5bbddaa19c46';

-- Question 3: Suspected melanoma (118 chars -> improved)
UPDATE akt_questions
SET explanation = 'Suspected melanoma requires urgent 2-week wait referral to dermatology. Use ABCDE criteria: Asymmetry, Border irregularity, Colour variation, Diameter >6mm, Evolution (changing). Any suspicious lesion should be referred urgently. Do not delay with primary care management. Early detection and excision is crucial for prognosis. Dermoscopy may be used in specialist setting.'
WHERE id = '4c40088b-8043-4afa-bd20-5376751f9897';

-- Question 4: UK pancreatitis cause (120 chars -> improved)
UPDATE akt_questions
SET explanation = 'In the UK, gallstones are the most common cause of acute pancreatitis (40-50%), followed by alcohol (25-30%). Other causes: hypertriglyceridaemia, drugs (azathioprine, steroids), ERCP, trauma, autoimmune, genetic (CFTR, PRSS1 mutations). Always check LFTs, amylase/lipase, and arrange imaging (US/CT) to identify cause. Gallstone pancreatitis may require ERCP and cholecystectomy.'
WHERE id = '6ba2f759-5692-475b-8659-4fc1bcff9bf9';

-- Question 5: Most common female incontinence (125 chars -> improved)
UPDATE akt_questions
SET explanation = 'Stress incontinence (leakage on coughing, sneezing, exertion) is the most common type in women, especially after childbirth and menopause. Caused by weak pelvic floor muscles and urethral sphincter. First-line treatment: pelvic floor exercises (Kegel exercises). If ineffective, consider continence referral for urodynamics and potential surgery (tension-free vaginal tape).'
WHERE id = 'e65528af-f5f5-47d4-a1dd-180bdc0b3314';

-- Question 6: COPD oxygen target (125 chars -> improved)
UPDATE akt_questions
SET explanation = 'For COPD patients requiring long-term oxygen therapy (LTOT), target oxygen saturation is 88-92% (not >92%). Higher saturations (>92%) can cause hypercapnia and respiratory acidosis in patients with chronic CO2 retention. LTOT is indicated if PaO2 <7.3kPa or PaO2 7.3-8.0kPa with complications (pulmonary hypertension, peripheral oedema, polycythaemia). Prescribe for at least 15 hours/day.'
WHERE id = '0671d9e2-d9fe-46c0-9447-64adbdfffba8';

-- Question 7: PR bleeding + anaemia (127 chars -> improved)
UPDATE akt_questions
SET explanation = 'PR bleeding + anaemia suggests colorectal cancer until proven otherwise. This combination meets 2-week wait referral criteria for suspected colorectal cancer. Arrange urgent colonoscopy. Do not delay with FOBT or routine referral. Other causes include haemorrhoids, diverticular disease, IBD, but cancer must be excluded first. Full blood count will show iron deficiency anaemia.'
WHERE id = '83863019-e176-4f84-8c29-1301805151f3';

-- Question 8: Hyperkalaemia ECG (127 chars -> improved)
UPDATE akt_questions
SET explanation = 'Hyperkalaemia ECG changes: peaked T waves (tented, tall), prolonged PR interval, widened QRS, flattened P waves, sine wave pattern (severe). These changes indicate cardiac toxicity and risk of arrhythmias (ventricular fibrillation, asystole). Severe hyperkalaemia (>6.5mmol/L) with ECG changes requires urgent treatment: calcium gluconate (cardioprotective), insulin+dextrose, salbutamol nebuliser, consider dialysis.'
WHERE id = '67954b69-e9e3-4327-a0d9-db53c1058d1f';

-- Question 9: Painless jaundice (129 chars -> improved)
UPDATE akt_questions
SET explanation = 'Painless jaundice in older patients suggests pancreatic head cancer (most common cause) until proven otherwise. Other causes: cholangiocarcinoma, ampullary carcinoma, chronic pancreatitis. Requires urgent 2-week wait referral for imaging (CT/MRI) and ERCP. Painful jaundice suggests gallstones. Always investigate jaundice - do not delay. Ultrasound is first-line imaging to assess biliary obstruction.'
WHERE id = '06010a3f-ab73-4827-96c6-693a20f73fbd';

-- Question 10: Cholestatic LFTs (129 chars -> improved)
UPDATE akt_questions
SET explanation = 'Cholestatic LFTs pattern: raised bilirubin, raised ALP (disproportionately high), normal or mildly raised ALT/AST. Suggests biliary obstruction or cholestasis. Causes: gallstones, pancreatic cancer, cholangiocarcinoma, primary biliary cholangitis, drugs. First investigation: ultrasound liver to look for dilated bile ducts, gallstones, mass. If obstruction found, ERCP may be needed. ALP >3x normal with normal ALT suggests biliary obstruction.'
WHERE id = 'c169ba50-0612-44d9-8094-175a7a978e63';

-- Question 11: PSA raised by (129 chars -> improved)
UPDATE akt_questions
SET explanation = 'PSA can be raised by: prostate cancer (most important), benign prostatic hyperplasia (BPH), prostatitis, urinary retention, recent ejaculation, recent catheterisation, recent DRE (minimal effect). Age-specific ranges: <50 years <2.5, 50-59 <3.5, 60-69 <4.5, >70 <6.5. If raised, repeat after treating infection/retention. If persistently raised, refer for prostate assessment and consider biopsy.'
WHERE id = '85fb4818-56a9-47a6-b530-a943912c8a0c';

-- Question 12: Most common dementia type (129 chars -> improved)
UPDATE akt_questions
SET explanation = 'Alzheimer''s disease is the most common type of dementia (60-70% of cases), followed by vascular dementia (20%), mixed (Alzheimer''s + vascular), Lewy body dementia, and frontotemporal dementia. Alzheimer''s is characterised by progressive memory loss, cognitive decline, and neurofibrillary tangles/amyloid plaques. Diagnosis is clinical with cognitive testing, imaging, and exclusion of other causes.'
WHERE id = '6e8b90b8-9ef4-42b6-83d5-18337c1d5c30';

-- Question 13: Cervical screening age 25–49 (131 chars -> improved)
UPDATE akt_questions
SET explanation = 'Cervical screening (smear test) in England: ages 25-49 every 3 years, ages 50-64 every 5 years. Tests for high-risk HPV first (primary screening), then cytology if HPV positive. If HPV negative, no further action. If HPV positive and cytology abnormal, refer for colposcopy. Screening starts at 25 (not 20) due to low cancer risk in younger women and high false positive rates.'
WHERE id = 'df27ae02-eeef-401c-93a5-9a2ba100aaa8';

-- Question 14: Low-risk alcohol (133 chars -> improved)
UPDATE akt_questions
SET explanation = 'Low-risk alcohol consumption: ≤14 units per week, spread over 3+ days, with alcohol-free days. One unit = 10ml pure alcohol (half pint beer, small glass wine, single measure spirits). Binge drinking (>6 units in one session) is harmful even if weekly total is low. High-risk: >14 units/week. Very high-risk: >50 units/week. Pregnant women should avoid alcohol completely.'
WHERE id = '2b172d0d-a08f-4bc5-b728-33c7b5ef7a72';

-- Question 15: Child sit unsupported (134 chars -> improved)
UPDATE akt_questions
SET explanation = 'Developmental milestones: sitting unsupported typically achieved by 6-8 months (average 7 months). Before this: head control at 3-4 months, sitting with support at 4-6 months. If not sitting by 9 months, consider developmental assessment. Other milestones: rolling 4-6 months, crawling 7-10 months, walking 12-15 months. Always consider corrected age for premature babies.'
WHERE id = '15ff4681-d7e9-4df5-909a-deddc1d9143a';

-- Question 16: DVT duration (134 chars -> improved)
UPDATE akt_questions
SET explanation = 'DVT treatment duration depends on cause: provoked DVT (surgery, immobility, pregnancy) = 3 months anticoagulation. Unprovoked DVT = consider 3-6 months, then assess for extended treatment based on bleeding risk. Recurrent DVT or thrombophilia = consider extended/lifelong anticoagulation. Cancer-associated DVT = treat for duration of cancer or until resolved. DOACs (rivaroxaban, apixaban) are now preferred over warfarin.'
WHERE id = '0a1894c1-583e-4396-8497-4e117c6a357a';

-- Question 17: Peritonitis (135 chars -> improved)
UPDATE akt_questions
SET explanation = 'Peritonitis (inflammation of peritoneum) requires urgent hospital admission. Signs: severe abdominal pain, guarding, rigidity, rebound tenderness, fever, tachycardia, hypotension. Causes: perforated viscus (peptic ulcer, appendicitis, diverticulitis), ischaemic bowel, pancreatitis. This is a surgical emergency. Do not delay - arrange immediate hospital transfer. May require emergency laparotomy.'
WHERE id = 'dbc54755-1a3e-4ccf-85d3-61e897dd39c5';

-- Question 18: DVT treatment (135 chars -> improved)
UPDATE akt_questions
SET explanation = 'DVT treatment: DOACs (rivaroxaban, apixaban) are now first-line - effective, no monitoring, lower bleeding risk than warfarin. Rivaroxaban 15mg BD for 21 days then 20mg OD, or apixaban 10mg BD for 7 days then 5mg BD. Warfarin is alternative. Duration: provoked = 3 months, unprovoked = 3-6 months or extended. Compression stockings help with symptoms but don''t prevent recurrence.'
WHERE id = 'a415881a-5ad7-4e7d-8eeb-eebdc53725b1';

-- Question 19: Cremation forms (135 chars -> improved)
UPDATE akt_questions
SET explanation = 'Cremation forms: Currently, two forms are required - Form 4 (confirmatory medical certificate) and Form 5 (cremation certificate). The GP who attended the patient in their last illness completes Form 4. A second independent doctor (not related, not in same practice) completes Form 5 after reviewing notes and Form 4. Both forms must be completed before cremation can proceed.'
WHERE id = '1fae0a43-ffa5-4cf0-b131-aa1f7e6a1b72';

-- Question 20: TIA management (136 chars -> improved)
UPDATE akt_questions
SET explanation = 'TIA management: Urgent assessment within 24 hours (ideally same day) at TIA clinic or stroke unit. Start aspirin 300mg immediately (unless contraindicated), then 75mg daily. If high-risk (ABCD2 score ≥4 or AF), consider dual antiplatelet (aspirin + clopidogrel) for 21 days. Address modifiable risk factors (BP, cholesterol, smoking, diabetes). If AF present, anticoagulate. Carotid imaging if anterior circulation TIA.'
WHERE id = '6f24df5b-cba3-44fd-80b8-c4db34b39f14';

-- Question 21: OAB first-line (137 chars -> improved)
UPDATE akt_questions
SET explanation = 'Overactive bladder (OAB) first-line treatment: lifestyle advice (fluid management, bladder training, pelvic floor exercises) and anticholinergics (oxybutynin, tolterodine, solifenacin) or beta-3 agonists (mirabegron). Start with lowest dose and titrate. Anticholinergics can cause dry mouth, constipation, blurred vision. Mirabegron has fewer anticholinergic side effects. If ineffective, consider specialist referral for botulinum toxin or sacral nerve stimulation.'
WHERE id = '2a9129b2-6da6-4596-8156-9b7460135d39';

-- Question 22: Recurrent UTI prevention (137 chars -> improved)
UPDATE akt_questions
SET explanation = 'Recurrent UTI prevention: lifestyle advice (increase fluids, void after intercourse, avoid spermicides, wipe front to back). If ≥3 UTIs/year, consider: continuous low-dose antibiotic prophylaxis (trimethoprim or nitrofurantoin at night), post-coital antibiotic, or vaginal oestrogen if postmenopausal. Cranberry products may help but evidence limited. Consider investigation for structural abnormalities if very frequent.'
WHERE id = '2b754078-d7aa-4587-a350-596344789eed';

-- Question 23: D-dimer (138 chars -> improved)
UPDATE akt_questions
SET explanation = 'D-dimer is a fibrin degradation product, elevated in thrombosis (DVT, PE), DIC, pregnancy, recent surgery, malignancy, infection, inflammation. Used to exclude DVT/PE in low pre-test probability (Wells score). If D-dimer negative and low Wells score, DVT/PE unlikely. If positive or high Wells score, need imaging (Doppler US for DVT, CT pulmonary angiogram for PE). D-dimer not useful in high pre-test probability.'
WHERE id = 'b963e147-8db3-4ecf-bb16-47e834fae7a6';

-- Question 24: GP indemnity covers (138 chars -> improved)
UPDATE akt_questions
SET explanation = 'GP indemnity (medical defence insurance) covers: clinical negligence claims, GMC fitness to practise proceedings, coroner''s inquests, complaints handling, legal costs. Does not cover: criminal acts, fraud, non-clinical issues. GPs must have adequate indemnity (either through MDO like MDU/MPS or employer''s insurance). Indemnity is a GMC requirement for registration. Costs vary by specialty and claims history.'
WHERE id = 'c6d1ea31-d573-45ed-bfcb-2d0c5670e613';

-- Question 25: Learning disability health check (138 chars -> improved)
UPDATE akt_questions
SET explanation = 'Learning disability annual health check: All patients aged 14+ with learning disability should be offered annual health check. Includes: physical examination, medication review, mental health assessment, health promotion, screening (cervical, breast, bowel if age-appropriate). Helps identify health inequalities and unmet needs. Use accessible information and reasonable adjustments. Health checks are incentivised in QOF. Document in health action plan.'
WHERE id = '7139f671-65a4-467e-8285-2ff3a9d241c5';

-- Question 26: Sudden sensorineural hearing loss (138 chars -> improved)
UPDATE akt_questions
SET explanation = 'Sudden sensorineural hearing loss (SSNHL) is an ENT emergency requiring urgent referral (same day or within 24 hours). Defined as ≥30dB hearing loss in ≥3 contiguous frequencies over <72 hours. Causes: viral, vascular, autoimmune, acoustic neuroma, Meniere''s. Urgent assessment needed - early treatment with steroids may improve outcomes. Delayed treatment reduces chance of recovery. Always exclude acoustic neuroma with MRI if no improvement.'
WHERE id = '03f77e5f-5364-44e6-8958-2d160460c583';

-- Question 27: Routine STI screening target (138 chars -> improved)
UPDATE akt_questions
SET explanation = 'Routine STI screening targets: chlamydia (most common bacterial STI), gonorrhoea, syphilis, HIV. Chlamydia screening is offered to sexually active under-25s annually. HIV testing should be offered to all patients, especially high-risk groups (MSM, multiple partners, IV drug users, from high-prevalence areas). Screen for all STIs if symptomatic or high-risk. Use nucleic acid amplification tests (NAATs) for chlamydia/gonorrhoea.'
WHERE id = 'd6d505df-7f8e-4e09-a5bb-fc007651e3ea';

-- Question 28: GERD first-line (139 chars -> improved)
UPDATE akt_questions
SET explanation = 'GERD (gastro-oesophageal reflux disease) first-line treatment: lifestyle advice (weight loss, avoid trigger foods, smaller meals, elevate head of bed, stop smoking) and PPI (omeprazole, lansoprazole) for 4-8 weeks. If symptoms resolve, try stepping down to H2-receptor antagonist or antacids. If symptoms persist, increase PPI dose or switch to different PPI. Consider endoscopy if alarm symptoms (dysphagia, weight loss, bleeding) or age >55 with new symptoms.'
WHERE id = '28960844-6763-4829-adbc-4d20c59a458e';

-- Question 29: Postmenopausal bleeding (140 chars -> improved)
UPDATE akt_questions
SET explanation = 'Postmenopausal bleeding (any bleeding >12 months after last period) requires urgent 2-week wait referral to gynaecology for suspected endometrial cancer. Do not delay - this is a red flag symptom. Investigations: transvaginal ultrasound (measure endometrial thickness), hysteroscopy, endometrial biopsy. Endometrial thickness >4mm is abnormal and requires biopsy. Most cases are benign (atrophy, polyps) but cancer must be excluded.'
WHERE id = '2fbf150b-7e7e-40e7-b62a-c2988434e250';

-- Question 30: Cellulitis (140 chars -> improved)
UPDATE akt_questions
SET explanation = 'Cellulitis (bacterial skin infection) treatment: oral flucloxacillin 500mg QDS for 7 days (first-line). If penicillin allergic, use clarithromycin or doxycycline. If severe (systemic symptoms, extensive, facial), use IV flucloxacillin or refer to hospital. Elevate affected limb. Monitor for spread or systemic symptoms. If no improvement in 48 hours, review and consider alternative diagnosis (venous eczema, DVT) or change antibiotic.'
WHERE id = '64b5e312-9e75-4a62-9ee6-27f68e1b10ec';

-- Question 31: Dyspepsia + weight loss + anaemia (141 chars -> improved)
UPDATE akt_questions
SET explanation = 'Dyspepsia + weight loss + anaemia = red flag symptoms requiring urgent 2-week wait referral for suspected upper GI cancer. This combination suggests possible gastric or oesophageal cancer. Arrange urgent upper GI endoscopy. Do not delay with PPI trial or routine referral. Other red flags: dysphagia, persistent vomiting, haematemesis, melaena, epigastric mass. Early diagnosis improves prognosis.'
WHERE id = '70da1672-e8fe-4409-b3c4-252a1aefd247';

-- Question 32: Sepsis sign (142 chars -> improved)
UPDATE akt_questions
SET explanation = 'Sepsis signs (SIRS criteria): temperature >38°C or <36°C, heart rate >90, respiratory rate >20, WCC >12 or <4. Sepsis-6: give oxygen, take blood cultures, give IV antibiotics, give IV fluids, measure lactate, measure urine output. Red flags: altered mental state, systolic BP <90, lactate >2, mottled skin, reduced urine output. Sepsis is medical emergency - treat immediately, do not delay. Use NEWS2 score for assessment.'
WHERE id = 'ad3070c0-234f-43e8-96b5-1fefb25ecc4f';

-- Question 33: Live vaccines contraindicated in (143 chars -> improved)
UPDATE akt_questions
SET explanation = 'Live vaccines contraindicated in: pregnancy (risk to fetus), immunosuppression (HIV with low CD4, chemotherapy, high-dose steroids >20mg prednisolone for >2 weeks, biologics, transplant), recent immunoglobulin (wait 3 months), some cancers, primary immunodeficiency. Inactivated vaccines are safe. If live vaccine given to immunosuppressed person, monitor closely. MMR can be given to HIV patients if CD4 >200. Always check contraindications before vaccination.'
WHERE id = '1511570e-5fb9-4fd0-a001-121866fc3edd';

-- Question 34: Postnatal depression screening tool (143 chars -> improved)
UPDATE akt_questions
SET explanation = 'Postnatal depression screening: use Edinburgh Postnatal Depression Scale (EPDS) at 6-8 weeks postnatal. Score 0-30, threshold ≥13 indicates likely depression, ≥10 indicates possible depression. Also ask about thoughts of self-harm (question 10). If positive, assess risk and refer to perinatal mental health services if needed. Postnatal depression affects 10-15% of women. Early identification and treatment improves outcomes for mother and baby.'
WHERE id = '7a34785e-3e79-455a-924e-42f0507e77bb';

-- Question 35: Renal colic (143 chars -> improved)
UPDATE akt_questions
SET explanation = 'Renal colic (ureteric colic from kidney stones) management: analgesia (diclofenac IM/PR or oral, or morphine if severe), antiemetic if nauseated, encourage fluids. Most stones <5mm pass spontaneously. Arrange non-contrast CT KUB (gold standard) or X-ray KUB. Refer to urology if: stone >5mm, persistent pain, infection, solitary kidney, bilateral obstruction, or if stone doesn''t pass. Extracorporeal shock wave lithotripsy (ESWL) or ureteroscopy may be needed.'
WHERE id = '45e72053-8014-4939-954e-c79b915c365a';

-- Question 36: Step-up asthma (143 chars -> improved)
UPDATE akt_questions
SET explanation = 'Asthma step-up management: Step 1 = SABA PRN, Step 2 = add low-dose ICS, Step 3 = increase ICS or add LABA, Step 4 = increase ICS to medium dose + LABA, Step 5 = add tiotropium or other add-on, Step 6 = consider biologics. Step up if: symptoms >3 times/week, nocturnal symptoms, SABA use >3 times/week, exacerbations. Review every 3 months. If controlled for 3 months, consider stepping down. Always check inhaler technique and adherence first.'
WHERE id = 'b6f848e7-fd58-4981-b563-a3a315f115a0';

-- Question 37: Eating disorder red flag (144 chars -> improved)
UPDATE akt_questions
SET explanation = 'Eating disorder red flags: rapid weight loss, BMI <18.5 or <15 (severe), bradycardia, hypotension, hypothermia, electrolyte abnormalities, amenorrhoea, lanugo hair, Russell''s sign (calluses on knuckles from self-induced vomiting), dental erosion, purging behaviours. Urgent referral needed if: medical instability, severe malnutrition, suicidal ideation, or if outpatient treatment failing. Eating disorders have high mortality - early intervention crucial.'
WHERE id = 'de827346-da44-4050-af01-1a33afb1449c';

-- Question 38: Obesity first-line (144 chars -> improved)
UPDATE akt_questions
SET explanation = 'Obesity first-line treatment: lifestyle intervention - diet (calorie deficit, Mediterranean diet), exercise (150 minutes moderate activity/week), behavioural support. If BMI ≥30 or ≥27 with comorbidities and lifestyle changes ineffective, consider orlistat (reduces fat absorption) or liraglutide (GLP-1 agonist, if BMI ≥35 or ≥30 with comorbidities). Bariatric surgery if BMI ≥40 or ≥35 with comorbidities and other treatments failed. Set realistic weight loss targets (5-10% initial loss).'
WHERE id = '131878f3-be27-4e91-a3d5-df2b136b949a';

-- Question 39: TB is (144 chars -> improved)
UPDATE akt_questions
SET explanation = 'Tuberculosis (TB) is caused by Mycobacterium tuberculosis, spread via airborne droplets. Can affect lungs (pulmonary TB - most common) or other organs (extrapulmonary TB). Symptoms: persistent cough >3 weeks, haemoptysis, weight loss, night sweats, fever. Diagnosis: sputum culture (gold standard), chest X-ray, Mantoux test, interferon-gamma release assay. Treatment: 6-month course of rifampicin, isoniazid, pyrazinamide, ethambutol. Notify public health - TB is notifiable disease.'
WHERE id = '2634e54a-6c31-4807-876d-194177589816';

-- Question 40: Complaints reflection should include (144 chars -> improved)
UPDATE akt_questions
SET explanation = 'Complaints reflection should include: what happened, what went well, what could be improved, what you learned, action plan for future. Use structured reflection model (e.g., Gibbs, Rolfe). Document reflection in portfolio. Consider: communication, clinical decision-making, systems issues, team working. Reflection demonstrates learning and professionalism. May be required for revalidation or if complaint escalates. Honest, constructive reflection shows insight and commitment to improvement.'
WHERE id = '1290f664-4668-42e2-8be2-634e3ec063bf';

-- Question 41: Weight loss first test (145 chars -> improved)
UPDATE akt_questions
SET explanation = 'Unexplained weight loss first investigations: full blood count (anaemia, malignancy), U&Es (renal function), LFTs (liver disease, malignancy), TFTs (hyperthyroidism), glucose/HbA1c (diabetes), calcium (hypercalcaemia from malignancy), CXR (lung cancer, TB). If abnormal or persistent, consider: CT chest/abdomen, endoscopy, tumour markers. Weight loss >5% in 6-12 months without explanation requires investigation. Red flags: age >50, smoking history, dysphagia, change in bowel habit.'
WHERE id = '0336c759-40db-4c2a-92d3-54ac7397d1b3';

-- Question 42: PE risk tool (146 chars -> improved)
UPDATE akt_questions
SET explanation = 'PE (pulmonary embolism) risk assessment: use Wells score (clinical signs, heart rate, surgery/immobility, previous DVT/PE, haemoptysis, malignancy, alternative diagnosis). Low pre-test probability (Wells <2) + negative D-dimer = PE unlikely, no imaging needed. High pre-test probability (Wells ≥2) or positive D-dimer = arrange CT pulmonary angiogram. PERC rule can also be used to exclude PE in low-risk patients. Clinical assessment guides investigation strategy.'
WHERE id = 'a4ca9fbb-502f-4bb1-9d77-4cd27f8f9851';

-- Question 43: Temperature ≥38°C in child under 3 months (146 chars -> improved)
UPDATE akt_questions
SET explanation = 'Fever ≥38°C in child <3 months requires urgent assessment - this is a red flag. Risk of serious bacterial infection (meningitis, sepsis, UTI) is higher in young infants. Arrange same-day paediatric assessment or refer to hospital. Do not manage in primary care. Investigations: full septic screen (blood cultures, urine, CSF if indicated), CRP, FBC. May need IV antibiotics. Use NICE traffic light system for assessment. Parental concern is also important indicator.'
WHERE id = '6067c0a8-d6b6-4a50-b2f4-50a768c83074';

-- Question 44: ACE-i angioedema (146 chars -> improved)
UPDATE akt_questions
SET explanation = 'ACE inhibitor angioedema: rare but serious side effect (0.1-0.7% of patients). Presents with swelling of face, lips, tongue, throat - can cause airway obstruction. More common in first week but can occur at any time. Risk factors: African/Caribbean ethnicity, history of angioedema. If occurs, stop ACE inhibitor immediately and do not restart. Use alternative (ARB, calcium channel blocker, beta-blocker). ARBs have lower risk of angioedema. This is a medical emergency if airway compromised.'
WHERE id = 'ee290ed5-0eb3-4976-97f8-e1df6a55c31f';

-- Question 45: Partnership finance - partner income (147 chars -> improved)
UPDATE akt_questions
SET explanation = 'Partnership finance: partner income depends on profit share, not fixed salary. Partners share practice profits (or losses) according to partnership agreement. Income varies with practice performance, QOF achievement, private work, out-of-hours work. Partners are self-employed, responsible for own tax and pension contributions. Junior partners may have lower profit share initially. Partnership agreements should specify profit-sharing arrangements and responsibilities.'
WHERE id = '734e5697-124d-4267-a1de-96a2813a89b0';

-- Question 46: Which is given at 12 weeks (147 chars -> improved)
UPDATE akt_questions
SET explanation = 'Immunisation schedule: at 12 weeks (8 weeks after first dose), baby receives: 6-in-1 vaccine (diphtheria, tetanus, pertussis, polio, Hib, hepatitis B) and rotavirus vaccine (oral). First dose given at 8 weeks, second at 12 weeks, third at 16 weeks. Meningitis B vaccine also given at 8, 16 weeks and 12 months. Always check immunisation status and contraindications. Use Green Book for guidance.'
WHERE id = '312eda33-a148-488f-9c99-5dd6452d1197';

-- Question 47: Moderate acne (148 chars -> improved)
UPDATE akt_questions
SET explanation = 'Moderate acne treatment: if topical treatment (benzoyl peroxide, adapalene) ineffective, next step is oral antibiotic (lymecycline 408mg OD or doxycycline 100mg BD) for 3-6 months. Combine with topical treatment. If still ineffective or severe, refer to dermatology for consideration of isotretinoin. For women, combined oral contraceptive pill can help. Avoid picking/squeezing. Topical retinoids can cause initial irritation - use every other day initially.'
WHERE id = '3644c159-0bdb-4acf-a3a1-50b4b1c2a862';

-- Question 48: Fit notes can include (148 chars -> improved)
UPDATE akt_questions
SET explanation = 'Fit notes (Med3) can include: statement that patient is not fit for work, may be fit for work (with adjustments), or fit for work. Can suggest workplace adjustments (phased return, amended duties, workplace adaptations). Duration: can be issued for up to 3 months initially, then extended if needed. Cannot be backdated >1 week. Patient can self-certify for first 7 days. Fit notes are required for Statutory Sick Pay (SSP) eligibility.'
WHERE id = '31640e41-af41-468f-9ade-9771da015d13';

-- Question 49: Antidepressant review timing (148 chars -> improved)
UPDATE akt_questions
SET explanation = 'Antidepressant review timing: review at 2-4 weeks after starting (assess response, side effects, adherence), then at 4-6 weeks (assess effectiveness), then every 3-6 months if stable. If no response by 6 weeks, consider dose increase or alternative. Continue for 6-12 months after remission (longer if recurrent depression). When stopping, taper gradually over 4 weeks to avoid withdrawal. Monitor for relapse. Document reviews and decisions.'
WHERE id = '5d106a66-b6fb-4325-a50f-07a40fe4e631';

-- Question 50: COPD antibiotics (148 chars -> improved)
UPDATE akt_questions
SET explanation = 'COPD antibiotics: indicated for infective exacerbations (increased sputum purulence, increased sputum volume, increased breathlessness). First-line: amoxicillin 500mg TDS for 5 days or doxycycline 100mg BD for 5 days. If penicillin allergic: clarithromycin 500mg BD for 5 days. Reserve co-amoxiclav for severe cases or if first-line fails. Not all exacerbations need antibiotics - viral causes are common. Consider steroids (prednisolone 30mg for 5 days) for exacerbations.'
WHERE id = '7501c5fa-cdf7-47f3-b65f-fe3d5e5126c4';

-- All 50 under-explained questions have now been improved with detailed explanations (200+ characters)
-- Each explanation now includes: clinical context, reasoning, next steps, and relevant details
