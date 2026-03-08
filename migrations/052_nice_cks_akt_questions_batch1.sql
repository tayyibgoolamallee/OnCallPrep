-- Migration: NICE CKS A–Z — Letter A (one question per topic)
-- Generated using PROMPT A (docs/akt/PROMPT_A_generation.md). Difficulty: hard.
-- Do not run until further batches (B, C, …) are added if desired. Total A topics: 35.

INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro, published)
VALUES

-- 1. Abdominal aortic aneurysm screening
(
  'A 68-year-old man attends his first AAA screening. Ultrasound shows aorta 4.2 cm. He has hypertension and previous MI. What is the most appropriate next step?',
  '[{"label":"A","text":"Discharge from the screening programme"},{"label":"B","text":"Refer urgently to vascular surgery"},{"label":"C","text":"Repeat ultrasound in 12 months"},{"label":"D","text":"Start a statin and repeat ultrasound in 3 months"},{"label":"E","text":"CT aorta and refer to vascular surgery"}]'::jsonb,
  'C',
  'NHS AAA screening: 3.0–4.4 cm = small aneurysm → surveillance ultrasound every 12 months. 4.5–5.4 cm = every 3 months. ≥5.5 cm or rapid growth = refer vascular surgery. 4.2 cm does not require referral or CT. Discharging is incorrect; he needs surveillance. Statin may be indicated for CVD but is not the screening-programme next step.',
  'Abdominal aortic aneurysm screening',
  'hard',
  ARRAY['NICE CKS: Abdominal aortic aneurysm screening', '3.0–4.4 cm = 12-monthly surveillance', '≥5.5 cm = refer vascular surgery', 'NHS AAA Screening Programme'],
  false,
  true
),

-- 2. Abdominal pain - acute
(
  'A 42-year-old woman has had 36 hours of central abdominal pain that has moved to the right iliac fossa. She has nausea, one vomit, no diarrhoea. Abdomen is tender in the RIF with guarding. HR 98, afebrile. What is the most appropriate next step?',
  '[{"label":"A","text":"Prescribe oral co-amoxiclav and review in 24 hours"},{"label":"B","text":"Arrange same-day surgical assessment"},{"label":"C","text":"Request FBC, CRP, U&E and review when results available"},{"label":"D","text":"Arrange ultrasound abdomen within 72 hours"},{"label":"E","text":"Prescribe analgesia and advise to return if worse"}]'::jsonb,
  'B',
  'History and signs suggest appendicitis: migrating pain to RIF, nausea, vomiting, tenderness and guarding. Same-day surgical assessment is required. Do not treat with antibiotics alone or delay for imaging. Bloods may be requested by the surgical team; arranging them should not delay referral.',
  'Abdominal pain - acute',
  'hard',
  ARRAY['NICE CKS: Abdominal pain - acute', 'NICE CKS: Appendicitis', 'RIF pain + guarding = urgent surgical assessment'],
  false,
  true
),

-- 3. Abortion
(
  'A 24-year-old woman at 8 weeks gestation requests termination of pregnancy. She has no medical or psychiatric contraindications. What is the most appropriate next step?',
  '[{"label":"A","text":"Prescribe mifepristone and misoprostol for home use and advise to attend ED if heavy bleeding"},{"label":"B","text":"Arrange assessment at an approved abortion service with counselling and choice of method"},{"label":"C","text":"Refer to gynaecology for surgical termination only"},{"label":"D","text":"Arrange ultrasound to confirm gestation before any referral"},{"label":"E","text":"Prescribe oral misoprostol only and review in 1 week"}]'::jsonb,
  'B',
  'Abortion in England/Wales/Scotland is provided by approved services. The woman should be referred to an abortion service for assessment, counselling, and choice of method (medical or surgical). Medical abortion (mifepristone + misoprostol) is usually provided by the service, not prescribed from primary care for this purpose. Ultrasound may be arranged by the service. Surgical-only referral is not appropriate; choice of method is for the woman after counselling.',
  'Abortion',
  'hard',
  ARRAY['NICE CKS: Abortion', 'Refer to approved abortion service', 'Counselling and choice of method', 'Medical vs surgical by service'],
  false,
  true
),

-- 4. Achilles tendinopathy
(
  'A 45-year-old runner presents with 6 weeks of pain and stiffness in the mid-portion of the Achilles tendon, worse on first steps. There is no swelling or redness. What is the most appropriate first-line management?',
  '[{"label":"A","text":"Refer to physiotherapy for eccentric loading programme"},{"label":"B","text":"Offer a corticosteroid injection into the tendon"},{"label":"C","text":"Prescribe NSAIDs for 2 weeks and advise rest from running"},{"label":"D","text":"Arrange MRI to confirm diagnosis"},{"label":"E","text":"Immobilise in a walking boot for 6 weeks"}]'::jsonb,
  'A',
  'NICE CKS: Achilles tendinopathy is managed with load-bearing exercise (e.g. eccentric loading) as first-line; physiotherapy can deliver this. Corticosteroid injection is not recommended (risk of tendon rupture). NSAIDs may help pain short-term but are not first-line for tendinopathy; rest alone is less effective than graded loading. MRI is not required for typical presentation. Immobilisation is not first-line.',
  'Achilles tendinopathy',
  'hard',
  ARRAY['NICE CKS: Achilles tendinopathy', 'First-line: load-bearing/eccentric exercise', 'Avoid corticosteroid injection (rupture risk)', 'Physiotherapy for exercise programme'],
  false,
  true
),

-- 5. Acne vulgaris
(
  'A 17-year-old has moderate facial acne (inflammatory papules and pustules) with no response to 8 weeks of topical benzoyl peroxide. What is the most appropriate next step?',
  '[{"label":"A","text":"Add oral tetracycline for 3 months"},{"label":"B","text":"Add topical retinoid and continue benzoyl peroxide"},{"label":"C","text":"Refer to dermatology"},{"label":"D","text":"Switch to topical erythromycin alone"},{"label":"E","text":"Add combined oral contraceptive (in females) or topical antibiotic only"}]'::jsonb,
  'B',
  'NICE CKS: For moderate acne not responding to topical monotherapy, add a topical retinoid (e.g. adapalene) in combination with benzoyl peroxide. Topical antibiotic alone is not first-line (resistance). Oral tetracycline is an option for moderate–severe or when topical insufficient, but combination topical therapy is the next step. COC can be considered in females. Referral is for severe, scarring, or treatment failure.',
  'Acne vulgaris',
  'hard',
  ARRAY['NICE CKS: Acne vulgaris', 'Moderate acne: add topical retinoid to benzoyl peroxide', 'Avoid topical antibiotic monotherapy', 'Oral antibiotic for moderate–severe or failure'],
  false,
  true
),

-- 6. Acute childhood limp
(
  'A 4-year-old boy has a limp for 24 hours with no history of trauma. He is afebrile, well, with reduced movement at the hip and no knee or ankle swelling. What is the most appropriate next step?',
  '[{"label":"A","text":"Prescribe ibuprofen and review in 48 hours"},{"label":"B","text":"Arrange urgent paediatric orthopaedic or A&E assessment"},{"label":"C","text":"Request FBC, CRP, and blood cultures"},{"label":"D","text":"Arrange ultrasound hip within 72 hours"},{"label":"E","text":"Reassure and advise to return if not better in 1 week"}]'::jsonb,
  'B',
  'Acute limp in a child with hip involvement and no trauma raises concern for septic arthritis, transient synovitis, or other serious cause. NICE CKS: urgent assessment (paediatric orthopaedics or A&E) is required; do not delay for bloods or imaging in primary care. Ibuprofen or reassurance without assessment is unsafe. Bloods/imaging may be done in secondary care.',
  'Acute childhood limp',
  'hard',
  ARRAY['NICE CKS: Acute childhood limp', 'Hip involvement + no trauma = urgent assessment', 'Exclude septic arthritis', 'Do not delay for primary care investigations'],
  false,
  true
),

-- 7. Acute kidney injury
(
  'A 72-year-old woman with type 2 diabetes and CKD stage 3b has had 3 days of diarrhoea and vomiting. She is on metformin, ramipril, and bendroflumethiazide. U&E: Na 148, K 5.8, creatinine 156 (baseline 98 µmol/L). She is dehydrated. What is the single most appropriate immediate action?',
  '[{"label":"A","text":"Restart oral fluids and repeat U&E in 1 week"},{"label":"B","text":"Stop ramipril and bendroflumethiazide; arrange same-day U&E and consider admission"},{"label":"C","text":"Stop metformin only and give oral rehydration advice"},{"label":"D","text":"Refer same day to nephrology"},{"label":"E","text":"Start oral potassium chloride and repeat U&E in 48 hours"}]'::jsonb,
  'B',
  'AKI is present: creatinine rise >50% from baseline within 7 days. She has pre-renal AKI with hyperkalaemia. Immediate actions: stop ACE-i and diuretic (ramipril, bendroflumethiazide), correct dehydration, recheck U&E. Metformin should also be stopped in AKI but the single most appropriate immediate action is stopping ACE-i and diuretic and reassessing (same-day U&E or admission if unwell). Do not give potassium. Nephrology referral is for specific indications (e.g. stage 4–5 CKD, transplant); here the priority is drug handling and fluid/electrolyte safety.',
  'Acute kidney injury',
  'hard',
  ARRAY['NICE CKS: Acute kidney injury', 'AKI: stop ACE-i and diuretics; reassess', 'Hyperkalaemia: do not give potassium', 'Metformin stop in AKI'],
  false,
  true
),

-- 8. Addison's disease
(
  'A 45-year-old woman with known Addison''s disease on hydrocortisone 20 mg mane and 10 mg at 4 pm is unwell with gastroenteritis: vomiting ×4 in 12 hours, unable to keep fluids down. What is the most appropriate advice?',
  '[{"label":"A","text":"Double her usual hydrocortisone and attend GP if no better in 24 hours"},{"label":"B","text":"Take an extra 10 mg hydrocortisone and sip fluids; call 111 or ED if vomiting continues"},{"label":"C","text":"Stop hydrocortisone until vomiting settles"},{"label":"D","text":"Use her emergency hydrocortisone injection only if she becomes drowsy"},{"label":"E","text":"Attend ED immediately for IV hydrocortisone"}]'::jsonb,
  'E',
  'Sick day rules in adrenal insufficiency: vomiting or inability to take oral hydrocortisone = risk of adrenal crisis. She should attend ED for IV hydrocortisone (100 mg IV then infusion or 50 mg IM 6-hourly). Doubling oral steroids is for mild illness when able to take orally; with vomiting she cannot absorb. Delaying until drowsy is dangerous. Do not stop steroids.',
  'Addison''s disease',
  'hard',
  ARRAY['NICE CKS: Addison''s disease', 'Sick day: vomiting = need for parenteral hydrocortisone', 'Adrenal crisis: IV hydrocortisone 100 mg', 'Do not stop steroids in illness'],
  false,
  true
),

-- 9. Adult malnutrition
(
  'A 78-year-old man has lost 6% of his body weight over 3 months. He has COPD and has had two chest infections in the year. He eats little at mealtimes. What is the most appropriate first-line dietary intervention?',
  '[{"label":"A","text":"Refer to dietitian for assessment only"},{"label":"B","text":"Offer oral nutritional supplements (ONS) in addition to usual diet"},{"label":"C","text":"Advise high-calorie meals and snacks; reassess in 4 weeks"},{"label":"D","text":"Prescribe vitamin D and multivitamins"},{"label":"E","text":"Arrange swallowing assessment before any dietary change"}]'::jsonb,
  'C',
  'NICE CG32 (nutrition support): first-line is dietary advice (fortified food, high-calorie meals and snacks) and reassessment. ONS are considered when dietary advice is insufficient. Dietitian referral is appropriate for complex cases but dietary advice can be given in primary care first. Swallowing assessment if dysphagia suspected. Vitamins may be needed but are not the first-line intervention for weight loss.',
  'Adult malnutrition',
  'hard',
  ARRAY['NICE CG32 Nutrition support in adults', 'NICE CKS: Adult malnutrition', 'First-line: dietary advice and reassessment', 'ONS when dietary advice insufficient'],
  false,
  true
),

-- 10. Adverse drug reactions
(
  'A 60-year-old man developed a generalised maculopapular rash 5 days after starting co-amoxiclav for a chest infection. He has stopped the antibiotic. The rash is improving. What is the most appropriate next step?',
  '[{"label":"A","text":"Prescribe oral prednisolone to speed resolution"},{"label":"B","text":"Document the reaction and advise avoidance of co-amoxiclav and amoxicillin; consider alternative if penicillin needed"},{"label":"C","text":"Refer to dermatology for patch testing"},{"label":"D","text":"Prescribe antihistamine and advise he can use amoxicillin in future"},{"label":"E","text":"Send a Yellow Card report only; no need to document"}]'::jsonb,
  'B',
  'Likely amoxicillin/co-amoxiclav hypersensitivity. Document the reaction (drug, reaction, date), advise avoidance of the implicated drug and related penicillin (unless history suggests non-allergic rash). For future infections, use an alternative (e.g. doxycycline, clarithromycin) or specialist assessment if penicillin essential. Do not prescribe steroids routinely for mild rash. Patch testing is for contact allergy. Yellow Card is important but documentation and patient advice are also required.',
  'Adverse drug reactions',
  'hard',
  ARRAY['NICE CKS: Adverse drug reactions', 'Document reaction and avoid re-exposure', 'Penicillin allergy: document and use alternative', 'Yellow Card + patient advice'],
  false,
  true
),

-- 11. Age-related macular degeneration
(
  'A 72-year-old woman reports distortion of central vision in one eye for 3 days. She has no pain or redness. On direct ophthalmoscopy you suspect wet AMD. What is the most appropriate next step?',
  '[{"label":"A","text":"Prescribe dexamethasone eye drops and review in 2 weeks"},{"label":"B","text":"Refer urgently to ophthalmology (within 1 week for wet AMD)"},{"label":"C","text":"Arrange optical coherence tomography in the community"},{"label":"D","text":"Start high-dose antioxidant vitamins and review in 1 month"},{"label":"E","text":"Reassure and advise to return if worsening"}]'::jsonb,
  'B',
  'New distortion of central vision suggests wet (neovascular) AMD. NICE: refer urgently to ophthalmology (within 1 week) for assessment and possible anti-VEGF treatment. Delay reduces chance of preserving vision. Steroids and vitamins are not first-line for wet AMD. OCT is typically done in ophthalmology. Reassurance without referral is inappropriate.',
  'Age-related macular degeneration',
  'hard',
  ARRAY['NICE CKS: Age-related macular degeneration', 'Wet AMD: urgent referral within 1 week', 'Anti-VEGF treatment time-critical', 'NICE NG82'],
  false,
  true
),

-- 12. AIDS and HIV infection
(
  'A 28-year-old man has had unprotected sex with a new partner 48 hours ago. The partner has just told him she is HIV-positive and not on treatment. What is the most appropriate next step?',
  '[{"label":"A","text":"Arrange HIV test in 4 weeks and advise condom use"},{"label":"B","text":"Arrange same-day or next-day assessment for post-exposure prophylaxis (PEP)"},{"label":"C","text":"Prescribe co-trimoxazole and advise HIV test at 3 months"},{"label":"D","text":"Refer to genitourinary medicine for HIV test only"},{"label":"E","text":"Advise HIV test at 6 weeks and 3 months; no PEP needed after 24 hours"}]'::jsonb,
  'B',
  'PEP (post-exposure prophylaxis) for HIV should be started as soon as possible after exposure, ideally within 24 hours and up to 72 hours. He should have same-day or next-day assessment (sexual health or HIV service) for PEP. HIV testing is also needed but does not replace urgent PEP assessment. Co-trimoxazole is for PCP prophylaxis in established HIV, not PEP. PEP can be considered up to 72 hours.',
  'AIDS and HIV infection',
  'hard',
  ARRAY['NICE CKS: AIDS and HIV infection', 'PEP within 72 hours of exposure', 'Same-day/next-day assessment', 'BHIVA guidelines'],
  false,
  true
),

-- 13. Alcohol - problem drinking (CKS content used: AUDIT, thiamine, referral, brief intervention)
(
  'A 55-year-old man scores 18 on the full AUDIT questionnaire. He has no features of dependence and has not had previous brief intervention. What is the most appropriate next step?',
  '[{"label":"A","text":"Refer to specialist alcohol service"},{"label":"B","text":"Offer prophylactic oral thiamine and arrange follow-up"},{"label":"C","text":"Offer a session of structured brief advice and arrange follow-up"},{"label":"D","text":"Prescribe acamprosate"},{"label":"E","text":"Offer extended brief intervention only"}]'::jsonb,
  'C',
  'CKS Alcohol - problem drinking: Use AUDIT to assess. For hazardous/harmful drinking without dependence, offer structured brief advice (evidence-based, FRAMES principles) and arrange follow-up. Extended brief intervention is for those who have not responded to brief advice. Prophylactic thiamine is for harmful or dependent drinkers. Acamprosate is for maintaining abstinence in dependence. Referral to specialist is for dependence (particularly moderate/severe), severe impairment, or failure of brief intervention.',
  'Alcohol - problem drinking',
  'hard',
  ARRAY['NICE CKS: Alcohol - problem drinking', 'AUDIT for assessment', 'Structured brief advice first-line', 'Thiamine for harmful/dependent drinkers'],
  false,
  true
),

-- 14. Allergic rhinitis (CKS content used: step-up, intranasal corticosteroid, referral)
(
  'A 22-year-old has moderate-to-severe persistent allergic rhinitis. Regular intranasal corticosteroid for 4 weeks has given only partial relief. What is the most appropriate next step?',
  '[{"label":"A","text":"Add oral prednisolone for 1 week"},{"label":"B","text":"Add combination intranasal antihistamine and corticosteroid spray"},{"label":"C","text":"Refer to ENT for allergy testing"},{"label":"D","text":"Switch to oral antihistamine only"},{"label":"E","text":"Add intranasal decongestant long-term"}]'::jsonb,
  'B',
  'CKS Allergic rhinitis: For moderate–severe persistent symptoms, regular intranasal corticosteroid is first-line. If suboptimal response, offer combination intranasal antihistamine and corticosteroid spray. Short-course oral corticosteroid is for severe uncontrolled symptoms significantly affecting quality of life, not routine next step. Referral for allergy testing/ENT is when considering immunotherapy, allergen avoidance, or diagnosis uncertain. Long-term decongestant is not recommended.',
  'Allergic rhinitis',
  'hard',
  ARRAY['NICE CKS: Allergic rhinitis', 'Refractory: add combination intranasal antihistamine + corticosteroid', 'Oral corticosteroid short course for severe only', 'Refer for immunotherapy or uncertain diagnosis'],
  false,
  true
),

-- 15. Alopecia areata
(
  'A 30-year-old has a single patch of alopecia areata (3 cm) on the scalp with no nail or other involvement. What is the most appropriate first-line management?',
  '[{"label":"A","text":"Refer to dermatology for topical immunotherapy"},{"label":"B","text":"Prescribe potent topical corticosteroid and review in 6–8 weeks"},{"label":"C","text":"Prescribe oral prednisolone for 6 weeks"},{"label":"D","text":"Advise watchful waiting and reassurance only"},{"label":"E","text":"Prescribe minoxidil lotion"}]'::jsonb,
  'B',
  'NICE CKS: For limited patch alopecia areata, first-line is potent topical corticosteroid (e.g. betamethasone or mometasone) with review in 6–8 weeks. Watchful waiting is an option but active treatment is often offered. Oral steroids are not first-line (side effects). Minoxidil is used in androgenetic alopecia. Referral for topical immunotherapy (e.g. diphencyprone) is for extensive or refractory disease.',
  'Alopecia areata',
  'hard',
  ARRAY['NICE CKS: Alopecia areata', 'Limited patch: potent topical corticosteroid', 'Review 6–8 weeks', 'Refer for extensive/refractory'],
  false,
  true
),

-- 16. Amenorrhoea
(
  'A 26-year-old woman has had no periods for 8 months. She is not pregnant, not on hormonal contraception, and has no symptoms of menopause. BMI 19. What is the most appropriate first-line investigation?',
  '[{"label":"A","text":"Serum FSH and LH"},{"label":"B","text":"Prolactin and TSH"},{"label":"C","text":"Pelvic ultrasound"},{"label":"D","text":"Serum oestradiol"},{"label":"E","text":"Karyotype"}]'::jsonb,
  'B',
  'Secondary amenorrhoea: exclude pregnancy, then consider prolactin and TSH as first-line (prolactinoma and thyroid disease are common causes). FSH/LH and oestradiol help classify hypo-/hypergonadotropic cause. Pelvic ultrasound is for structural causes. Karyotype is for suspected Turner syndrome (primary amenorrhoea or short stature). Low BMI suggests possible hypothalamic cause (weight-related); prolactin and TSH are still appropriate first-line.',
  'Amenorrhoea',
  'hard',
  ARRAY['NICE CKS: Amenorrhoea', 'Prolactin and TSH first-line', 'Exclude pregnancy', 'FSH/LH for ovarian function'],
  false,
  true
),

-- 17. Anaemia - B12 and folate deficiency
(
  'A 68-year-old woman with macrocytic anaemia has serum B12 85 ng/L (reference 200–900) and normal folate. She has no neurological symptoms. What is the most appropriate next step?',
  '[{"label":"A","text":"Oral cyanocobalamin 1 mg OD for 4 weeks"},{"label":"B","text":"Intramuscular hydroxocobalamin 1 mg on alternate days for 2 weeks then 1 mg every 3 months"},{"label":"C","text":"Check intrinsic factor and anti-parietal cell antibodies then treat"},{"label":"D","text":"Refer to haematology before starting treatment"},{"label":"E","text":"Oral folic acid 5 mg OD"}]'::jsonb,
  'B',
  'B12 <200 ng/L with macrocytic anaemia indicates B12 deficiency. NICE CKS: treat with IM hydroxocobalamin (1 mg on alternate days until no further improvement, then 1 mg every 2–3 months). Oral B12 can be used in mild dietary deficiency but IM is first-line for deficiency with anaemia. Do not delay treatment for antibody testing. Folate is normal so folic acid is wrong.',
  'Anaemia - B12 and folate deficiency',
  'hard',
  ARRAY['NICE CKS: Anaemia - B12 and folate deficiency', 'B12 deficiency: IM hydroxocobalamin', 'Do not delay for antibody testing'],
  false,
  true
),

-- 18. Anaemia - iron deficiency
(
  'A 34-year-old woman has iron deficiency anaemia (Hb 98 g/L, ferritin 8 µg/L). She has heavy menstrual bleeding and no GI symptoms. What is the most appropriate first-line management?',
  '[{"label":"A","text":"Refer to gynaecology for management of heavy menstrual bleeding"},{"label":"B","text":"Offer oral iron and reassess Hb after 2–4 weeks"},{"label":"C","text":"Refer for urgent suspected cancer pathway (lower GI)"},{"label":"D","text":"Offer oral iron and arrange endoscopy and caecal imaging"},{"label":"E","text":"Offer iron infusion"}]'::jsonb,
  'B',
  'NICE NG88/CKS: In women with heavy menstrual bleeding and no red-flag GI symptoms, treat with oral iron and address menstrual loss (e.g. history, treatment for HMB). Recheck Hb after 2–4 weeks. Referral for GI investigation is for men, postmenopausal women, or when GI symptoms/refractory anaemia. Referral to gynaecology may be needed for HMB but oral iron is first-line. Iron infusion is for when oral iron not tolerated or not effective.',
  'Anaemia - iron deficiency',
  'hard',
  ARRAY['NICE NG88 Anaemia - iron deficiency', 'NICE CKS: Anaemia - iron deficiency', 'Oral iron first-line; reassess Hb 2–4 weeks', 'GI referral for men, postmenopausal, red flags'],
  false,
  true
),

-- 19. Anal fissure
(
  'A 32-year-old man has a painful anal fissure present for 4 weeks. He has tried fibre and topical lubricants. What is the most appropriate next step?',
  '[{"label":"A","text":"Refer to colorectal surgery"},{"label":"B","text":"Prescribe topical glyceryl trinitrate (GTN) 0.4%"},{"label":"C","text":"Prescribe topical corticosteroid"},{"label":"D","text":"Prescribe oral opioid analgesia"},{"label":"E","text":"Prescribe topical local anaesthetic only"}]'::jsonb,
  'B',
  'NICE CKS: First-line for anal fissure is dietary fibre and topical lubricants. If symptoms persist, offer topical GTN (glyceryl trinitrate) or topical calcium channel blocker (e.g. diltiazem). Topical GTN reduces sphincter spasm and promotes healing. Topical corticosteroid can help symptoms but GTN/diltiazem are first-line for healing. Referral is for chronic fissure, treatment failure, or red flags. Opioid can worsen constipation.',
  'Anal fissure',
  'hard',
  ARRAY['NICE CKS: Anal fissure', 'First-line: fibre + lubricants', 'Then topical GTN or diltiazem', 'Refer chronic/failure'],
  false,
  true
),

-- 20. Analgesia - mild-to-moderate pain
(
  'A 58-year-old with osteoarthritis needs regular analgesia. He has a history of previous peptic ulcer and is on a PPI. What is the most appropriate first-line regular analgesic?',
  '[{"label":"A","text":"Ibuprofen 400 mg TDS"},{"label":"B","text":"Paracetamol 1 g QDS"},{"label":"C","text":"Diclofenac 50 mg TDS"},{"label":"D","text":"Codeine 30 mg QDS"},{"label":"E","text":"Aspirin 300 mg OD"}]'::jsonb,
  'B',
  'NICE CKS / NICE CG177: Paracetamol is first-line for osteoarthritis (and mild–moderate pain generally). NSAIDs (ibuprofen, diclofenac) increase GI risk; in previous peptic ulcer they should be used with caution and PPI; paracetamol is still preferred first-line. Opioids (codeine) are second-line. Aspirin is not first-line for musculoskeletal pain.',
  'Analgesia - mild-to-moderate pain',
  'hard',
  ARRAY['NICE CKS: Analgesia - mild-to-moderate pain', 'NICE CG177 Osteoarthritis', 'Paracetamol first-line', 'NSAID + PPI if needed; caution if previous ulcer'],
  false,
  true
),

-- 21. Angina
(
  'A 58-year-old man with type 2 diabetes has a 6-week history of central chest tightness on exertion, relieved by rest. No pain at rest. What is the most appropriate first-line investigation?',
  '[{"label":"A","text":"ECG"},{"label":"B","text":"Exercise tolerance test"},{"label":"C","text":"CT coronary angiography"},{"label":"D","text":"Coronary angiography"},{"label":"E","text":"Echocardiogram"}]'::jsonb,
  'A',
  'NICE CG126 (stable angina): first-line investigation is 12-lead ECG. If typical angina and ECG normal, offer functional testing (e.g. ETT) or CT coronary angiography per local pathway. ECG is always first. Echocardiogram is for structural disease or heart failure. Coronary angiography is not first-line.',
  'Angina',
  'hard',
  ARRAY['NICE CG126 Stable angina', 'NICE CKS: Angina', 'First-line investigation = ECG'],
  false,
  true
),

-- 22. Angio-oedema and anaphylaxis
(
  'A 40-year-old man develops facial swelling and lip swelling 30 minutes after starting lisinopril for hypertension. He has no stridor, no hypotension. What is the most appropriate immediate action?',
  '[{"label":"A","text":"Give oral antihistamine and advise to stop lisinopril"},{"label":"B","text":"Give IM adrenaline and arrange emergency admission"},{"label":"C","text":"Give oral prednisolone and stop lisinopril"},{"label":"D","text":"Give IM adrenaline only if stridor develops"},{"label":"E","text":"Stop lisinopril and observe in practice for 1 hour"}]'::jsonb,
  'B',
  'ACE inhibitor can cause angio-oedema; it can progress to airway compromise. Facial/lip swelling after ACE-i is an emergency. Give IM adrenaline (0.5 mg = 500 µg) and arrange emergency admission. Do not wait for stridor. Stop lisinopril permanently. Antihistamines and steroids are adjuncts but adrenaline and emergency care are key.',
  'Angio-oedema and anaphylaxis',
  'hard',
  ARRAY['NICE CKS: Angio-oedema and anaphylaxis', 'ACE-i angio-oedema: IM adrenaline + emergency care', 'Stop ACE-i permanently', 'Resuscitation Council UK'],
  false,
  true
),

-- 23. Animal and human bites
(
  'A 6-year-old was bitten by a dog on the hand 2 hours ago. There is a small puncture wound with no obvious tendon or joint involvement. What is the most appropriate next step?',
  '[{"label":"A","text":"Prescribe co-amoxiclav for 3 days and advise wound care"},{"label":"B","text":"Prescribe flucloxacillin for 5 days"},{"label":"C","text":"Arrange tetanus booster only; no antibiotic"},{"label":"D","text":"Refer to A&E for wound irrigation and possible closure"},{"label":"E","text":"Prescribe co-amoxiclav for 5–7 days, advise wound care, and check tetanus status"}]'::jsonb,
  'E',
  'NICE CKS: Bites (especially cat/dog, hand/puncture) are high risk for infection. Offer prophylactic antibiotic: co-amoxiclav for 5–7 days (or doxycycline + metronidazole if penicillin allergy). Advise wound care (cleaning, elevation). Check tetanus (and rabies if indicated). Refer if deep, tendon/joint, facial, or infected. Flucloxacillin alone does not cover Pasteurella. Short courses (3 days) are less appropriate for bite prophylaxis.',
  'Animal and human bites',
  'hard',
  ARRAY['NICE CKS: Animal and human bites', 'Prophylactic co-amoxiclav 5–7 days', 'Hand/puncture high risk', 'Tetanus and wound care'],
  false,
  true
),

-- 24. Antenatal and postnatal depression
(
  'A 28-year-old woman at 22 weeks gestation scores 14 on the Whooley questions and has mild depressive symptoms. She prefers psychological treatment. What is the most appropriate next step?',
  '[{"label":"A","text":"Prescribe sertraline and advise psychological therapy when available"},{"label":"B","text":"Offer referral for evidence-based psychological therapy (e.g. CBT)"},{"label":"C","text":"Prescribe amitriptyline"},{"label":"D","text":"Reassure and review in 4 weeks"},{"label":"E","text":"Refer to perinatal mental health team only"}]'::jsonb,
  'B',
  'NICE CG192 (antenatal and postnatal mental health): For mild–moderate depression in pregnancy, consider psychological therapy (e.g. CBT, IPT) before medication. She has indicated preference for psychological treatment, so offer referral for evidence-based psychological therapy. Sertraline is first-line if medication chosen but she has not chosen medication. Amitriptyline is not first-line. Perinatal team referral is for moderate–severe or complex cases.',
  'Antenatal and postnatal depression',
  'hard',
  ARRAY['NICE CG192 Antenatal and postnatal mental health', 'NICE CKS: Antenatal and postnatal depression', 'Psychological therapy before medication for mild–moderate', 'Whooley positive = further assessment'],
  false,
  true
),

-- 25. Antenatal care - uncomplicated pregnancy
(
  'A healthy 28-year-old at 28 weeks gestation (uncomplicated pregnancy) has a haemoglobin of 102 g/L at her routine check. What is the most appropriate next step?',
  '[{"label":"A","text":"Refer to obstetrics for anaemia management"},{"label":"B","text":"Offer oral iron and recheck Hb in 2–4 weeks"},{"label":"C","text":"Arrange ferritin and B12/folate before treatment"},{"label":"D","text":"Offer iron infusion"},{"label":"E","text":"Reassure; no action needed in pregnancy"}]'::jsonb,
  'B',
  'NICE CKS / NG88: In pregnancy, Hb <110 g/L at 28 weeks suggests iron deficiency. Offer oral iron and recheck Hb in 2–4 weeks. Ferritin can be checked but treatment need not be delayed if anaemia is present. Iron infusion is for when oral iron not tolerated or ineffective. Referral to obstetrics is for severe anaemia or complex cases. Anaemia in pregnancy should be treated.',
  'Antenatal care - uncomplicated pregnancy',
  'hard',
  ARRAY['NICE CKS: Antenatal care - uncomplicated pregnancy', 'NICE NG88 Anaemia', 'Pregnancy Hb <110: offer oral iron', 'Recheck Hb 2–4 weeks'],
  false,
  true
),

-- 26. Anticoagulation - oral
(
  'A 78-year-old woman with atrial fibrillation and a history of GI bleeding 2 years ago (now resolved) has CHA₂DS₂-VASc 5 and HAS-BLED 3. She now wishes to reduce stroke risk. What is the most appropriate next step?',
  '[{"label":"A","text":"Aspirin 75 mg OD"},{"label":"B","text":"Apixaban 5 mg BD (or 2.5 mg BD if criteria met)"},{"label":"C","text":"Warfarin target INR 2–3"},{"label":"D","text":"No anticoagulation; discuss again in 1 year"},{"label":"E","text":"Left atrial appendage closure referral"}]'::jsonb,
  'B',
  'CHA₂DS₂-VASc ≥2 in women indicates anticoagulation. NICE NG196: DOAC (e.g. apixaban) preferred over warfarin. HAS-BLED is for modifiable risk and monitoring, not for withholding anticoagulation. Aspirin is not recommended for stroke prevention in AF. Apixaban 2.5 mg BD if ≥2 of: age ≥80, weight ≤60 kg, creatinine ≥133 µmol/L.',
  'Anticoagulation - oral',
  'hard',
  ARRAY['NICE NG196 Atrial fibrillation', 'NICE CKS: Anticoagulation - oral', 'DOAC preferred', 'HAS-BLED does not contraindicate'],
  false,
  true
),

-- 27. Antiplatelet treatment
(
  'A 65-year-old man had an NSTEMI 12 months ago. He is on aspirin 75 mg OD and clopidogrel 75 mg OD. He is due to have an elective knee replacement in 4 weeks. What is the most appropriate advice regarding antiplatelet therapy?',
  '[{"label":"A","text":"Stop both aspirin and clopidogrel 7 days before surgery"},{"label":"B","text":"Continue aspirin; discuss stopping clopidogrel with cardiology/surgeon"},{"label":"C","text":"Stop clopidogrel only 5 days before surgery"},{"label":"D","text":"Continue both; accept increased bleeding risk"},{"label":"E","text":"Switch to ticagrelor and stop 5 days before surgery"}]'::jsonb,
  'B',
  'NICE CKS / NICE CG180: After ACS, dual antiplatelet therapy (aspirin + clopidogrel) is typically 12 months then aspirin alone. For elective surgery, balance ischaemic vs bleeding risk. Usually continue aspirin and discuss stopping clopidogrel (typically 5–7 days before) with cardiology/surgeon. Do not stop both without discussion. Stopping both increases cardiac risk. Decision should involve surgeon and cardiology.',
  'Antiplatelet treatment',
  'hard',
  ARRAY['NICE CKS: Antiplatelet treatment', 'Elective surgery: continue aspirin, discuss clopidogrel', 'Balance ischaemic vs bleeding risk', 'Multidisciplinary decision'],
  false,
  true
),

-- 28. Aphthous ulcer
(
  'A 25-year-old has recurrent minor aphthous ulcers (2–4 at a time, healing in 1–2 weeks). No systemic features. What is the most appropriate first-line management?',
  '[{"label":"A","text":"Prescribe oral prednisolone"},{"label":"B","text":"Prescribe topical corticosteroid (e.g. hydrocortisone oromucosal)"},{"label":"C","text":"Refer to oral medicine"},{"label":"D","text":"Prescribe chlorhexidine mouthwash only"},{"label":"E","text":"Check FBC, B12, folate, and ferritin before any treatment"}]'::jsonb,
  'B',
  'NICE CKS: Minor aphthous ulcers: first-line is topical corticosteroid (e.g. hydrocortisone oromucosal or betamethasone mouthwash). Chlorhexidine may help hygiene but topical steroid is first-line. Oral steroids are for severe/major aphthous. Bloods (B12, folate, ferritin, FBC) are recommended for recurrent aphthous to exclude deficiency but first-line management can include topical steroid; bloods can be done in parallel.',
  'Aphthous ulcer',
  'hard',
  ARRAY['NICE CKS: Aphthous ulcer', 'First-line: topical corticosteroid', 'Consider B12/folate/ferritin for recurrent', 'Chlorhexidine adjunct'],
  false,
  true
),

-- 29. Appendicitis
(
  'A 16-year-old has 24 hours of central then RIF pain, nausea, one vomit. Abdomen tender in RIF with guarding. CRP 45, WCC 13. What is the most appropriate next step?',
  '[{"label":"A","text":"Prescribe co-amoxiclav and review in 24 hours"},{"label":"B","text":"Arrange same-day surgical assessment"},{"label":"C","text":"Arrange ultrasound abdomen"},{"label":"D","text":"Request surgical opinion when CRP and WCC results available"},{"label":"E","text":"Advise analgesia and clear fluids; review next day"}]'::jsonb,
  'B',
  'Clinical picture suggests appendicitis (migrating pain, RIF tenderness and guarding, raised inflammatory markers). Same-day surgical assessment is required. Do not treat with antibiotics alone or delay for imaging in primary care. Ultrasound may be used in equivocal cases in hospital.',
  'Appendicitis',
  'hard',
  ARRAY['NICE CKS: Appendicitis', 'NICE CKS: Abdominal pain - acute', 'RIF pain + guarding = same-day surgical assessment'],
  false,
  true
),

-- 30. Asthma
(
  'A 35-year-old woman with asthma takes beclomethasone 200 mcg BD and uses salbutamol 3–4 times per week. She has had two courses of oral steroids in the last 12 months. What is the most appropriate next step?',
  '[{"label":"A","text":"Add a long-acting beta-agonist (LABA)"},{"label":"B","text":"Increase beclomethasone to 500 mcg BD"},{"label":"C","text":"Add montelukast"},{"label":"D","text":"Switch to MART regimen"},{"label":"E","text":"Refer to respiratory specialist"}]'::jsonb,
  'A',
  'Poor control: SABA >3 times/week and two exacerbations. BTS/SIGN Step 3: add LABA to current ICS. If good response, continue. If not, increase ICS. MART is an alternative at step 3. Increasing ICS alone is less preferred when control is poor. Montelukast is an alternative add-on. Referral for step 4–5 or diagnostic uncertainty.',
  'Asthma',
  'hard',
  ARRAY['NICE CKS: Asthma', 'BTS/SIGN Step 3: add LABA to ICS', 'SABA >3/week = poor control'],
  false,
  true
),

-- 31. Atrial fibrillation
(
  'A 72-year-old man with permanent AF is on apixaban and bisoprolol 5 mg OD. He reports palpitations and fatigue. Resting HR 78 bpm. What is the most appropriate next step?',
  '[{"label":"A","text":"Add digoxin"},{"label":"B","text":"Increase bisoprolol to achieve strict rate control (<80 bpm)"},{"label":"C","text":"Refer for cardioversion"},{"label":"D","text":"Reassess symptom control and consider increasing beta-blocker if HR elevated on exertion"},{"label":"E","text":"Add diltiazem"}]'::jsonb,
  'D',
  'NICE NG196: In permanent AF, rate control is the usual strategy. Resting HR 78 is acceptable; lenient rate control (<110) is not inferior to strict (<80). Reassess whether symptoms are rate-related (e.g. on exertion); consider increasing beta-blocker. Digoxin or diltiazem may be added if needed. Cardioversion is for rhythm control in suitable patients.',
  'Atrial fibrillation',
  'hard',
  ARRAY['NICE NG196 Atrial fibrillation', 'NICE CKS: Atrial fibrillation', 'Permanent AF = rate control', 'Lenient rate control acceptable'],
  false,
  true
),

-- 32. Attention deficit hyperactivity disorder
(
  'A 8-year-old has been diagnosed with ADHD. Parent and teacher reports support significant impairment. Behavioural interventions have been tried for 3 months with limited benefit. What is the most appropriate next step?',
  '[{"label":"A","text":"Refer to paediatrician for medication assessment"},{"label":"B","text":"Continue behavioural interventions for a further 3 months"},{"label":"C","text":"Prescribe methylphenidate and titrate"},{"label":"D","text":"Refer to child mental health for CBT only"},{"label":"E","text":"Arrange educational psychology assessment only"}]'::jsonb,
  'A',
  'NICE CG72: For school-age children with ADHD and significant impairment despite behavioural interventions, consider medication. Medication should be initiated by a specialist (paediatrician or psychiatrist). Do not start stimulants from primary care without specialist involvement. Continuing behavioural interventions alone may be appropriate in some cases but with significant impairment and limited benefit, referral for medication assessment is appropriate.',
  'Attention deficit hyperactivity disorder',
  'hard',
  ARRAY['NICE CG72 ADHD', 'NICE CKS: Attention deficit hyperactivity disorder', 'Medication initiated by specialist', 'After behavioural interventions insufficient'],
  false,
  true
),

-- 33. Autism in adults
(
  'A 32-year-old man is referred for possible autism assessment. He has longstanding difficulties with social communication and rigid routines. What is the most appropriate next step?',
  '[{"label":"A","text":"Prescribe an SSRI for anxiety"},{"label":"B","text":"Refer to a team with expertise in autism diagnosis in adults"},{"label":"C","text":"Arrange autism screening questionnaire only"},{"label":"D","text":"Refer to adult mental health for assessment"},{"label":"E","text":"Reassure and discharge"}]'::jsonb,
  'B',
  'NICE CG142: Adults with suspected autism should be referred to a team with expertise in autism diagnosis in adults (e.g. autism team, learning disability team, or mental health service with autism expertise). Screening tools can support referral but referral should not depend on them. SSRI is not first-line for autism. Generic adult mental health may not have autism-specific expertise.',
  'Autism in adults',
  'hard',
  ARRAY['NICE CG142 Autism in adults', 'NICE CKS: Autism in adults', 'Refer to team with autism expertise', 'Diagnosis in adults'],
  false,
  true
),

-- 34. Autism in children
(
  'A 4-year-old is suspected of having autism. He has delayed speech, limited eye contact, and repetitive play. What is the most appropriate next step?',
  '[{"label":"A","text":"Arrange speech and language therapy only"},{"label":"B","text":"Refer for multi-agency assessment for autism"},{"label":"C","text":"Prescribe melatonin for sleep"},{"label":"D","text":"Reassure and review in 6 months"},{"label":"E","text":"Refer to paediatrics for developmental delay only"}]'::jsonb,
  'B',
  'NICE CG170: Children with suspected autism should be referred for multi-agency assessment (autism team or referral pathway). Do not delay referral while waiting for other assessments. Speech and language input may be part of support but referral for autism assessment is the next step. Melatonin and developmental paediatrics may be involved but autism-specific assessment is key.',
  'Autism in children',
  'hard',
  ARRAY['NICE CG170 Autism in children', 'NICE CKS: Autism in children', 'Refer for multi-agency autism assessment', 'Do not delay referral'],
  false,
  true
),

-- 35. Axial spondyloarthritis (including ankylosing spondylitis)
(
  'A 28-year-old man has had 3 months of inflammatory back pain (worse at night, morning stiffness >30 min, improves with exercise). CRP 22. What is the most appropriate next step?',
  '[{"label":"A","text":"Prescribe NSAIDs and physiotherapy only"},{"label":"B","text":"Request HLA-B27 and refer to rheumatology if positive"},{"label":"C","text":"Refer to rheumatology for assessment for axial spondyloarthritis"},{"label":"D","text":"Request X-ray spine and refer only if sacroiliitis"},{"label":"E","text":"Prescribe prednisolone"}]'::jsonb,
  'C',
  'NICE NG65 / CKS: Inflammatory back pain in a young adult (onset <45 years) lasting >3 months should prompt referral to rheumatology for assessment for axial spondyloarthritis. HLA-B27 can support but referral should not depend on it. X-ray may be normal early; MRI may be used in secondary care. First-line treatment is NSAIDs and physiotherapy but diagnosis should be confirmed. Do not rely on X-ray alone to exclude.',
  'Axial spondyloarthritis (including ankylosing spondylitis)',
  'hard',
  ARRAY['NICE NG65 Spondyloarthritis', 'NICE CKS: Axial spondyloarthritis', 'Inflammatory back pain <45 years: refer rheumatology', 'HLA-B27 supportive not mandatory for referral'],
  false,
  true
);
