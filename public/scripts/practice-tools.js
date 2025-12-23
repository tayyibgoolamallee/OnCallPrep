/**
 * SCA Practice Tools - Interactive Exercises
 * Includes: 2-Min Diagnosis Generator, 3-Min Priming Exercise
 */

// ============================================
// DIAGNOSIS DATA
// ============================================

const diagnoses = [
    // Respiratory
    "Asthma",
    "COPD",
    "Pneumonia",
    "Pulmonary Embolism",
    "Bronchiectasis",
    "Common Cold",
    "Sinusitis",
    
    // Cardiovascular
    "Hypertension",
    "Heart Failure",
    "Atrial Fibrillation",
    "Angina",
    "Deep Vein Thrombosis",
    "High Cholesterol",
    
    // Gastroenterology
    "GORD (Acid Reflux)",
    "Irritable Bowel Syndrome",
    "Coeliac Disease",
    "Inflammatory Bowel Disease",
    "Gallstones",
    "Gastroenteritis",
    
    // MSK
    "Osteoarthritis",
    "Rheumatoid Arthritis",
    "Gout",
    "Low Back Pain",
    "Tennis Elbow",
    "Osteoporosis",
    "Fibromyalgia",
    
    // Endocrine
    "Type 2 Diabetes",
    "Hypothyroidism",
    "Hyperthyroidism",
    "Polycystic Ovary Syndrome",
    
    // Dermatology
    "Eczema",
    "Psoriasis",
    "Acne",
    "Rosacea",
    "Shingles",
    "Cellulitis",
    
    // Mental Health
    "Depression",
    "Generalised Anxiety Disorder",
    "Panic Disorder",
    "Insomnia",
    
    // Neurology
    "Migraine",
    "Tension Headache",
    "Epilepsy",
    "BPPV (Vertigo)",
    
    // Urology/Renal
    "Urinary Tract Infection",
    "Kidney Stones",
    "Benign Prostatic Hyperplasia",
    "Chronic Kidney Disease",
    
    // Women's Health
    "Menopause",
    "Endometriosis",
    "Heavy Periods",
    "Vaginal Thrush",
    
    // ENT
    "Otitis Media (Ear Infection)",
    "Allergic Rhinitis (Hay Fever)",
    "Tonsillitis",
    
    // Paediatrics
    "Bronchiolitis",
    "Childhood Eczema",
    "Constipation in Children",
    "Febrile Illness in Children",
    
    // Other
    "Iron Deficiency Anaemia",
    "B12 Deficiency",
    "Vitamin D Deficiency",
    "Sleep Apnoea"
];

// ============================================
// PRIMING CASES DATA (EMBEDDED)
// ============================================

// Embedded priming cases - works with both file:// and http:// protocols
// This allows the tool to work locally without a web server
let primingCases = [];
let primingCasesLoaded = false;

// Load embedded cases from JSON file (will be injected here)
async function loadPrimingCases() {
    // First try to load from JSON file (works on web servers like Vercel)
    if (window.location.protocol !== 'file:') {
        try {
            const paths = [
                'data/priming-cases.json',
                './data/priming-cases.json',
                '/data/priming-cases.json'
            ];
            
            for (const path of paths) {
                try {
                    const response = await fetch(path);
                    if (response.ok) {
                        const data = await response.json();
                        if (data && data.cases && Array.isArray(data.cases)) {
                            primingCases = data.cases;
                            primingCasesLoaded = true;
                            console.log(`✓ Loaded ${primingCases.length} cases from JSON file: ${path}`);
                            return true;
                        }
                    }
                } catch (e) {
                    continue;
                }
            }
        } catch (error) {
            console.log('Could not load from JSON, using embedded cases');
        }
    }
    
    // Fallback to embedded cases (works everywhere, including file://)
    // Embedded cases will be loaded from external file
    try {
        // Try to load embedded cases script
        if (typeof EMBEDDED_PRIMING_CASES !== 'undefined') {
            primingCases = EMBEDDED_PRIMING_CASES;
            primingCasesLoaded = true;
            console.log(`✓ Loaded ${primingCases.length} embedded priming cases`);
            return true;
        }
    } catch (e) {
        console.warn('Embedded cases not available');
    }
    
    // If we get here, something went wrong
    console.error('❌ Could not load priming cases');
    primingCases = [];
    primingCasesLoaded = false;
    return false;
}

// Load cases when script loads
loadPrimingCases();

// ============================================
// 2-MINUTE DIAGNOSIS GENERATOR
// ============================================

let diagnosisTimer = null;
let diagnosisTimeLeft = 120; // 2 minutes in seconds
const DIAGNOSIS_TIME = 120;

// Elements (wired to sca-practice.html) - set after DOM ready
let diagnosisDisplay = null;
let timerDisplay = null;
let timerProgress = null;
let newDiagnosisBtn = null;
let startTimerBtn = null;
let resetTimerBtn = null;
let diagnosisAnswer = null;
let viewAnswerBtn = null;
let diagnosisTimerRunning = false;

// High-level model explanations for 2‑minute practice
// (Good enough for SCA-style structure; can be refined over time)
const diagnosisExplanations = {
    // Respiratory
    "Asthma": `
        Name it: asthma – airways are inflamed and twitchy so they narrow at times, causing wheeze and cough.
        Link to patient: variable symptoms, triggers (cold, exercise), night cough, response to reliever.
        Plan: reliever vs preventer inhalers, check technique/spacer, trigger avoidance, action plan, reviews.
        Safety net: worsening breathlessness, needing reliever more, night waking, difficulty speaking – seek urgent help.`,
    "COPD": `
        COPD = long-term airway damage (often from smoking) making tubes narrow and less elastic.
        Link: chronic breathlessness, cough/sputum, smoking history/age.
        Plan: stop smoking, inhalers, pulmonary rehab, vaccines, early treatment of infections, spirometry monitoring.
        Safety net: severe breathlessness, chest pain, confusion or blue lips – 999/ED.`,
    "Pneumonia": `
        Pneumonia is a lung infection where the air sacs fill with fluid.
        Link: fever, cough with phlegm, pleuritic chest pain, feeling very unwell.
        Plan: antibiotics if bacterial, fluids, rest; consider hospital if breathless, low sats, frail.
        Safety net: worsening breathlessness, confusion, vomiting/fluids poor – urgent assessment.`,
    "Pulmonary Embolism": `
        A clot has travelled to the lung and is blocking blood flow.
        Link: sudden breathlessness/pleuritic pain, risk factors (immobility, surgery, pregnancy, cancer, HRT, clots).
        Plan: urgent hospital tests (bloods, scan) and blood thinners; duration depends on cause.
        Safety net: collapse, worsening breathlessness or chest pain – 999 immediately.`,
    "Bronchiectasis": `
        Airways are widened and scarred so mucus pools and infections recur.
        Link: chronic productive cough, repeated infections, possible past severe lung infection.
        Plan: chest physio/airway clearance, inhalers if wheeze, vaccines, prompt antibiotics for flare, consider specialist.
        Safety net: high fever, increased breathlessness, blood in sputum – urgent review.`,
    "Common Cold": `
        Viral upper respiratory infection – self-limiting.
        Link: sore throat, runny nose, mild fever, short duration.
        Plan: rest, fluids, simple analgesia, decongestant/steam; no antibiotics needed.
        Safety net: high fever >3–5 days, breathlessness, chest pain, confusion – seek review.`,
    "Sinusitis": `
        Sinus lining inflamed/infected causing facial pain/pressure and blocked nose.
        Link: facial pressure, reduced smell, thick nasal discharge.
        Plan: nasal saline/steam, intranasal steroid, analgesia; consider delayed antibiotic if >10 days and severe.
        Safety net: swelling around eye, visual changes, severe headache/fever – urgent review.`,

    // Cardiovascular
    "Hypertension": `
        Blood pressure is persistently above recommended levels, straining heart/brain/kidneys/eyes over time.
        Link: their readings, risk factors (weight, family history, ethnicity, smoking).
        Plan: lifestyle (salt, weight, exercise, alcohol, smoking) plus medication if indicated; monitor with home/clinic checks.
        Safety net: neuro symptoms, chest pain, breathlessness – urgent assessment.`,
    "Heart Failure": `
        The heart is pumping less effectively so fluid can build up in lungs/legs.
        Link: breathlessness on exertion/lying flat, ankle swelling, rapid weight gain.
        Plan: tablets to offload fluid and support heart, daily weights, salt control, vaccines, regular review.
        Safety net: sudden breathlessness at rest, chest pain, fast palpitations, rapid weight gain – urgent help.`,
    "Atrial Fibrillation": `
        The heart rhythm is irregular/fast because the top chambers are misfiring.
        Link: palpitations, breathlessness, tiredness, incidental finding on pulse/ECG.
        Plan: stroke prevention (blood thinner if indicated), rate/rhythm control, manage triggers (alcohol, thyroid).
        Safety net: chest pain, collapse, severe breathlessness – urgent care.`,
    "Angina": `
        Narrowed heart arteries cause chest tightness on exertion/stress that eases with rest.
        Link: predictable exertional discomfort, risk factors (HTN, cholesterol, smoking, diabetes).
        Plan: short-acting nitrate for symptoms, optimise risk factors, consider statin/antiplatelet and cardiology review.
        Safety net: pain at rest, prolonged/severe pain, associated breathlessness/sweat/nausea – treat as emergency.`,
    "Deep Vein Thrombosis": `
        A clot in a deep leg vein causing pain/swelling.
        Link: unilateral swelling/pain, risk factors (surgery, immobility, cancer, pregnancy, HRT).
        Plan: urgent assessment, scan, blood thinners if confirmed; advise mobility and hydration.
        Safety net: sudden chest pain/breathlessness/collapse (possible PE) – 999.`,
    "High Cholesterol": `
        Higher fats in the blood increase long-term artery furring risk.
        Link: their lipid results and personal/family risk factors.
        Plan: lifestyle (diet, weight, exercise, smoking), and statin if risk indicates; recheck lipids and LFTs.
        Safety net: new chest pain, neuro symptoms – seek urgent review.`,

    // Gastroenterology
    "GORD (Acid Reflux)": `
        Stomach acid is flowing back into the gullet causing heartburn/regurgitation.
        Link: burning after meals/lying down, sour taste, triggers (coffee, spicy, alcohol).
        Plan: lifestyle (smaller meals, weight, avoid late eating, triggers), acid suppression (PPI), review response.
        Safety net: difficulty swallowing, weight loss, vomiting blood, black stools – urgent endoscopy assessment.`,
    "Irritable Bowel Syndrome": `
        A functional gut sensitivity causing pain with altered bowel habit, often relieved by stooling.
        Link: pattern, relation to stress/food, no red flags.
        Plan: reassurance, diet (regular meals, fiber balance, low FODMAP trial), stress management, targeted meds for diarrhoea/constipation/spasm.
        Safety net: weight loss, bleeding, night symptoms, anaemia, persistent change – re-evaluate.`,
    "Coeliac Disease": `
        Immune reaction to gluten damaging the small bowel lining.
        Link: bloating, diarrhoea, weight loss, anaemia, family history.
        Plan: strict lifelong gluten-free diet, dietitian input, screen for deficiencies, follow-up bloods.
        Safety net: persistent weight loss, severe symptoms – review; ensure tested before stopping gluten.`,
    "Inflammatory Bowel Disease": `
        Chronic gut inflammation (Crohn’s/UC) causing diarrhoea, pain, sometimes blood.
        Link: chronic loose stools, blood/mucus, weight loss, extra-intestinal signs.
        Plan: specialist-led; may need steroids/immunosuppressants; ensure bloods/stool tests and safety net.
        Safety net: severe pain, bleeding, fever, dehydration – urgent care.`,
    "Gallstones": `
        Hardened stones in the gallbladder causing biliary colic after fatty meals.
        Link: RUQ/epigastric pain after eating, sometimes to back/shoulder, nausea.
        Plan: pain relief, low-fat diet, ultrasound; surgery if recurrent/severe; watch for cholecystitis/pancreatitis signs.
        Safety net: fever, jaundice, persistent severe pain/vomiting – urgent assessment.`,
    "Gastroenteritis": `
        Gut infection causing diarrhoea/vomiting.
        Link: sudden onset, possible contacts/food trigger, short duration.
        Plan: fluids, simple diet, hand hygiene; usually no antibiotics unless specific indication.
        Safety net: blood in stool, high fever, dehydration, symptoms >7 days – review.`,

    // MSK
    "Osteoarthritis": `
        Joint cartilage has worn, causing pain/stiffness especially with use.
        Link: age, weight-bearing joints, morning stiffness short-lived, worse on activity.
        Plan: exercise/strengthening, weight loss, simple analgesia/topical NSAID, pacing, aids; consider physio.
        Safety net: sudden hot swollen joint, giving way, severe deterioration – review.`,
    "Rheumatoid Arthritis": `
        Immune system is attacking joints causing inflammation, pain, and stiffness.
        Link: small joints, morning stiffness >30–60 min, symmetry, swelling.
        Plan: urgent rheumatology referral for DMARDs, pain control, bloods.
        Safety net: rapid worsening, systemic symptoms – prompt review.`,
    "Gout": `
        Uric acid crystals inflame the joint, often big toe/ankle/knee.
        Link: sudden very painful hot swollen joint, history of flares, diet/diuretics.
        Plan: treat flare (NSAID/colchicine/steroid), ice/rest; long-term urate lowering if recurrent; lifestyle advice.
        Safety net: fever, spreading redness, not improving – consider infection and review.`,
    "Low Back Pain": `
        Most back pain is mechanical/strain and improves over weeks.
        Link: posture/lift trigger, no red flags.
        Plan: keep moving, simple analgesia, short heat/physio core work; avoid long rest.
        Safety net: leg weakness/numbness, bladder/bowel change, saddle anaesthesia – emergency (possible cauda equina).`,
    "Tennis Elbow": `
        Overuse of forearm tendons causes outside elbow pain.
        Link: pain on gripping/lifting, tender lateral epicondyle.
        Plan: activity modification, ice/NSAID gel, physio exercises, strap; steroid only if persistent.
        Safety net: worsening function or severe night pain – review.`,
    "Osteoporosis": `
        Bone strength is reduced so fracture risk is higher.
        Link: age, risk factors (steroids, menopause, low BMI, family history).
        Plan: calcium/vit D if low, weight-bearing exercise, falls prevention; consider bisphosphonate if indicated after FRAX/DEXA.
        Safety net: new back pain after minimal trauma – check for vertebral fracture.`,
    "Fibromyalgia": `
        Pain sensitivity condition with widespread aches, poor sleep, fatigue.
        Link: chronic pain without inflammatory markers, poor restorative sleep, cognitive fog.
        Plan: education, graded exercise, sleep hygiene, pacing, CBT-style strategies; meds may help some (e.g. amitriptyline/SSRIs/SNRIs).
        Safety net: new focal neuro signs or significant change – reassess for alternative causes.`,

    // Endocrine
    "Type 2 Diabetes": `
        Blood sugar is high because of insulin resistance/shortage.
        Link: thirst, polyuria, tiredness or incidental finding.
        Plan: lifestyle foundations (diet, weight, activity, stop smoking), tablets/insulin as needed, regular checks (eyes, feet, kidneys).
        Safety net: very high sugars, vomiting, drowsiness, abdominal pain – urgent review.`,
    "Hypothyroidism": `
        The thyroid is underactive so metabolism slows.
        Link: tiredness, weight gain, cold intolerance, constipation, dry skin.
        Plan: replace hormone (levothyroxine) and monitor blood tests; symptoms improve gradually.
        Safety net: chest pain/palpitations on higher doses, severe lethargy – review.`,
    "Hyperthyroidism": `
        The thyroid is overactive so metabolism speeds up.
        Link: weight loss, heat intolerance, tremor, palpitations, anxiety, diarrhoea.
        Plan: anti-thyroid meds +/- beta blocker, specialist review for longer-term plan (radioiodine/surgery).
        Safety net: severe palpitations, chest pain, fever/neck pain – urgent review.`,
    "Polycystic Ovary Syndrome": `
        Hormonal imbalance causing irregular periods, possible acne/hair changes, insulin resistance.
        Link: cycle pattern, symptoms of androgen excess, weight.
        Plan: lifestyle/weight, cycle regulation (COCP/progesterone), manage skin/hair, screen metabolic risk; fertility support if needed.
        Safety net: heavy prolonged bleeding, severe pain – review.`,

    // Dermatology
    "Eczema": `
        Skin barrier is inflamed/leaky causing dry, itchy patches.
        Link: pattern, triggers (soaps, stress), atopic history.
        Plan: regular emollients, topical steroid for flares, trigger avoidance; infection signs need review.
        Safety net: spreading redness, oozing, fever – possible infection; seek review.`,
    "Psoriasis": `
        Immune-mediated skin turnover causing red scaly plaques, sometimes nails/joints.
        Link: typical sites (elbows/knees/scalp), family history.
        Plan: emollients, topical steroids/vit D, consider phototherapy/derm referral if extensive; screen joints.
        Safety net: sudden widespread rash, joint swelling, mood impact – review.`,
    "Acne": `
        Inflammation of hair follicles/oil glands causing spots/comedones.
        Link: distribution on face/back/chest, severity, scarring risk.
        Plan: skincare (non-comedogenic), topical retinoid/benzoyl peroxide, antibiotics if moderate, derm referral if severe.
        Safety net: severe mood impact or scarring despite treatment – escalate.`,
    "Rosacea": `
        Facial flushing/inflammation with papules and visible vessels.
        Link: triggers (heat, alcohol, spicy), central face distribution.
        Plan: trigger avoidance, gentle skincare, topical agents (metronidazole/azelaic), oral antibiotics if needed; sun protection.
        Safety net: eye symptoms (gritty/pain) or severe flare – review.`,
    "Shingles": `
        Reactivated chickenpox virus causing painful blistering rash in a band.
        Link: unilateral dermatomal pain then blisters.
        Plan: antivirals if early/severe/older, pain relief, keep rash covered/clean; avoid contact with vulnerable until crusted.
        Safety net: eye involvement, severe pain, weakness – urgent review.`,
    "Cellulitis": `
        Bacterial skin infection causing red, hot, painful area.
        Link: unilateral spreading redness, warmth, possible fever.
        Plan: antibiotics, limb elevation, mark edge; review if no improvement in 48 hours.
        Safety net: rapidly spreading redness, fever/chills, confusion – urgent assessment.`,

    // Mental Health
    "Depression": `
        Common condition affecting mood, sleep, appetite, enjoyment for weeks.
        Link: low mood, anhedonia, energy/sleep/appetite changes, function impact.
        Plan: biopsychosocial – self‑help/CBT/talking therapy, social support, consider SSRI; lifestyle (sleep, activity).
        Safety net: suicidal thoughts, self‑harm, sudden deterioration – how to seek urgent help.`,
    "Generalised Anxiety Disorder": `
        Excessive worry most days for months with physical tension symptoms.
        Link: constant worrying, sleep issues, muscle tension.
        Plan: CBT/psychological approaches first-line, relaxation, lifestyle; meds (SSRI) if needed.
        Safety net: worsening anxiety with self-harm thoughts, severe impact on functioning – seek help.`,
    "Panic Disorder": `
        Recurrent unexpected panic attacks plus worry about more attacks.
        Link: sudden intense fear, palpitations, breathlessness, fear of dying, avoidance behaviours.
        Plan: explain panic cycle, breathing/grounding techniques, CBT; SSRI if needed.
        Safety net: chest pain with risk factors, self-harm thoughts – urgent review.`,
    "Insomnia": `
        Trouble falling or staying asleep impacting daytime function.
        Link: sleep pattern, habits, stressors, caffeine/alcohol, screen use.
        Plan: sleep hygiene, stimulus control, CBT‑I strategies; avoid routine hypnotics.
        Safety net: mood worsening, unsafe daytime sleepiness – review.`,

    // Neurology
    "Migraine": `
        Episodic headaches often throbbing with nausea/light sensitivity ± aura.
        Link: pattern, triggers (hormones/food/stress), impact.
        Plan: trigger diary, acute treatment (simple analgesia + triptan + antiemetic), limit analgesic overuse; preventive if frequent.
        Safety net: thunderclap, neuro deficits, change in pattern – urgent assessment.`,
    "Tension Headache": `
        Pressure/band-like headache linked to stress/posture.
        Link: mild-moderate, not worsened by routine activity, no neuro signs.
        Plan: posture/ergonomics, stress management, regular breaks, simple analgesia limited use.
        Safety net: sudden severe headache, neuro symptoms, change in pattern – review.`,
    "Epilepsy": `
        Brain is having recurrent unprovoked seizures.
        Link: witnessed episodes, recovery period, triggers (sleep loss/alcohol), driving implications.
        Plan: neurology-led; anti-seizure meds, safety advice, avoid triggers; driving rules.
        Safety net: prolonged seizure (>5 min), repeated without recovery, injury – emergency care.`,
    "BPPV (Vertigo)": `
        Inner ear crystals displaced causing brief spinning on head movement.
        Link: seconds of vertigo when rolling over/looking up, no neuro signs, fatigable.
        Plan: explain benign nature, perform/teach repositioning (Epley), vestibular rehab if persistent.
        Safety net: new neuro signs, hearing loss, persistent severe vertigo – review.`,

    // Urology/Renal
    "Urinary Tract Infection": `
        Bladder infection causing dysuria/frequency.
        Link: burning urine, urgency, suprapubic discomfort; no red flags.
        Plan: fluids, short antibiotic if indicated, safety net; urine dip/culture per guidance.
        Safety net: fever/flank pain (possible kidney), vomiting, pregnancy risk – urgent review.`,
    "Kidney Stones": `
        A stone is passing, causing severe colicky flank pain.
        Link: loin-to-groin pain, hematuria, restlessness.
        Plan: strong analgesia, fluids; imaging; tamsulosin sometimes; urology if large/obstructed/infected.
        Safety net: fever with pain (infected obstruction) – emergency; uncontrolled pain/vomiting – urgent care.`,
    "Benign Prostatic Hyperplasia": `
        Prostate enlargement narrows urine flow.
        Link: weak stream, hesitancy, nocturia, incomplete emptying.
        Plan: lifestyle (fluids timing, reduce caffeine/alcohol), consider tamsulosin/finasteride, monitor.
        Safety net: retention, infection signs, hematuria – review.`,
    "Chronic Kidney Disease": `
        Kidneys are less efficient over time (stages by eGFR/ACR).
        Link: often asymptomatic; may have oedema, hypertension.
        Plan: control BP, diabetes, avoid nephrotoxins, statin if indicated, regular blood/urine checks; refer if advanced/progressive.
        Safety net: sudden drop in urine, swelling, breathlessness – review promptly.`,

    // Women's Health
    "Menopause": `
        Ovaries make less oestrogen leading to period changes and symptoms.
        Link: hot flushes, cycle change, mood/sleep changes, vaginal dryness.
        Plan: lifestyle, HRT if appropriate after discussing benefits/risks/contraindications; non-hormonal options if needed.
        Safety net: abnormal bleeding (post-menopausal bleeding), chest pain/leg swelling on HRT – urgent review.`,
    "Endometriosis": `
        Endometrial-like tissue outside the womb causes pain and sometimes fertility issues.
        Link: cyclical pelvic pain, deep dyspareunia, heavy periods, bowel/bladder pain in cycle.
        Plan: analgesia, hormonal suppression (COCP/progesterone), consider gynae referral, pelvic physio.
        Safety net: severe acute pain, heavy bleeding, impact on fertility – review.`,
    "Heavy Periods": `
        Period bleeding is heavier/prolonged affecting quality of life.
        Link: clots, flooding, anaemia symptoms.
        Plan: bloods (FBC/iron), options: tranexamic, mefenamic, hormonal (COCP/LNG-IUS), address underlying causes.
        Safety net: very heavy bleeding with dizziness, intermenstrual/post-coital bleeding – review.`,
    "Vaginal Thrush": `
        Fungal overgrowth causing itch/discharge.
        Link: thick white discharge, itch, soreness, no strong odour.
        Plan: antifungal pessary/cream/oral, avoid irritants, consider triggers (antibiotics, diabetes).
        Safety net: persistent/recurrent symptoms, unusual discharge/odour, bleeding – review for other causes.`,

    // ENT
    "Otitis Media (Ear Infection)": `
        Middle ear infection causing ear pain ± fever/hearing drop.
        Link: recent cold, unilateral pain, child common.
        Plan: analgesia, usually self-limits; antibiotic if severe/systemic or high-risk.
        Safety net: swelling behind ear, severe fever, discharge with pain – review.`,
    "Allergic Rhinitis (Hay Fever)": `
        Nose/eyes react to allergens like pollen.
        Link: sneezing, itchy/runny/blocked nose, itchy eyes; seasonal/perennial pattern.
        Plan: avoidance where possible, regular antihistamine, intranasal steroid, saline rinses.
        Safety net: poor control despite treatment, asthma flare risk – review.`,
    "Tonsillitis": `
        Tonsil infection causing sore throat, fever, difficulty swallowing.
        Link: fever, swollen tonsils ± exudate, tender neck nodes.
        Plan: analgesia, fluids; consider antibiotics if Centor/FeverPAIN high.
        Safety net: difficulty breathing/swallowing, drooling, neck swelling (quinsy) – urgent care.`,

    // Paediatrics
    "Bronchiolitis": `
        Viral infection in infants causing small airway inflammation.
        Link: cough, wheeze, feeding difficulty in baby; peak at 3–6 months.
        Plan: mainly supportive, small frequent feeds, monitor work of breathing; hospital if poor feeding, apnoea, low sats.
        Safety net: reduced wet nappies, pauses in breathing, blue lips, severe effort – ED.`,
    "Childhood Eczema": `
        Same principles as eczema: itchy dry skin in flexures/cheeks.
        Plan: frequent emollients, appropriate-strength steroid for flares, trigger avoidance, infection checks.
        Safety net: spreading redness/ooze/fever – review (possible infection).`,
    "Constipation in Children": `
        Hard/infrequent stools causing pain withholding.
        Link: stool pattern, pain, soiling, diet/fluids.
        Plan: disimpaction then maintenance laxatives, diet/fluids, toileting routine, reward charts.
        Safety net: vomiting, weight loss, blood, severe pain – review.`,
    "Febrile Illness in Children": `
        Fever from likely viral infection but need red-flag check.
        Plan: hydration, antipyretic for comfort, observe; explain traffic-light/red flags.
        Safety net: poor feeding, lethargy, breathing difficulty, non-blanching rash, seizure – urgent care.`,

    // Other
    "Iron Deficiency Anaemia": `
        Low iron causing fewer red cells so less oxygen carriage.
        Link: tiredness, breathlessness, pallor; source often low intake or blood loss.
        Plan: iron replacement, find and address cause (diet, menstrual, GI), recheck bloods.
        Safety net: black/tarry stools, vomiting blood, worsening fatigue – review.`,
    "B12 Deficiency": `
        Low B12 affecting red cells and nerves.
        Link: tiredness, pins/needles, glossitis; cause diet or absorption (pernicious anaemia).
        Plan: replace B12 (oral/injection depending on cause), investigate cause, monitor bloods.
        Safety net: worsening numbness/weakness, cognitive change – review promptly.`,
    "Vitamin D Deficiency": `
        Low vitamin D affecting bones/muscles.
        Link: bone pain, muscle aches, risk factors (low sun, darker skin, covered clothing).
        Plan: supplementation loading then maintenance, safe sun/ diet advice.
        Safety net: persistent bone pain or weakness despite replacement – review.`,
    "Sleep Apnoea": `
        Breathing pauses in sleep causing poor rest and daytime sleepiness.
        Link: loud snoring, witnessed apnoeas, daytime tiredness, morning headaches.
        Plan: weight loss, avoid sedatives/alcohol at night; refer for sleep study, possible CPAP.
        Safety net: falling asleep while driving, cardiovascular symptoms – urgent advice to stop driving and seek review.`
};

function getRandomDiagnosis() {
    const randomIndex = Math.floor(Math.random() * diagnoses.length);
    return diagnoses[randomIndex];
}

function formatTime(seconds) {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins}:${secs.toString().padStart(2, '0')}`;
}

function updateTimerDisplay() {
    if (timerDisplay) {
        timerDisplay.textContent = formatTime(diagnosisTimeLeft);
    }
    if (timerProgress) {
        const percentage = (diagnosisTimeLeft / DIAGNOSIS_TIME) * 100;
        timerProgress.style.width = `${percentage}%`;
        
        // Change color based on time remaining
        timerProgress.classList.remove('warning', 'danger');
        if (percentage <= 25) {
            timerProgress.classList.add('danger');
        } else if (percentage <= 50) {
            timerProgress.classList.add('warning');
        }
    }
}

function startDiagnosisTimer() {
    if (diagnosisTimer) return; // Already running
    diagnosisTimerRunning = true;
    if (startTimerBtn) startTimerBtn.textContent = 'Pause';
    
    diagnosisTimer = setInterval(() => {
        diagnosisTimeLeft--;
        updateTimerDisplay();
        
        if (diagnosisTimeLeft <= 0) {
            clearInterval(diagnosisTimer);
            diagnosisTimer = null;
            diagnosisTimerRunning = false;
            if (timerDisplay) timerDisplay.textContent = "Time's up!";
            if (startTimerBtn) {
                startTimerBtn.textContent = 'Start 2‑Minute Timer';
                startTimerBtn.disabled = true;
            }
            if (timerProgress) {
                timerProgress.style.width = '0%';
            }
            // Automatically show the answer when time is up
            showDiagnosisAnswer();
            if (diagnosisAnswer) {
                diagnosisAnswer.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
            }
        }
    }, 1000);
}

function pauseDiagnosisTimer() {
    if (diagnosisTimer) {
        clearInterval(diagnosisTimer);
        diagnosisTimer = null;
        diagnosisTimerRunning = false;
        if (startTimerBtn) startTimerBtn.textContent = 'Resume';
    }
}

function resetDiagnosisTimer() {
    clearInterval(diagnosisTimer);
    diagnosisTimer = null;
    diagnosisTimerRunning = false;
    diagnosisTimeLeft = DIAGNOSIS_TIME;
    updateTimerDisplay();
    if (startTimerBtn) {
        startTimerBtn.textContent = 'Start 2‑Minute Timer';
        startTimerBtn.disabled = true;
    }
    if (timerProgress) {
        timerProgress.classList.remove('warning', 'danger');
    }

    // Clear any previous answer
    if (diagnosisAnswer) {
        diagnosisAnswer.innerHTML = '';
    }
}

// Show model explanation for current diagnosis
function showDiagnosisAnswer() {
    if (!diagnosisAnswer || !diagnosisDisplay) return;

    const key = diagnosisDisplay.textContent?.trim();
    if (!key) {
        diagnosisAnswer.innerHTML = '<p style="margin:0;">Generate a diagnosis first, then try the explanation.</p>';
        return;
    }

    const explanation = diagnosisExplanations[key] || `
        Give the name of the condition, link it to the patient\'s key symptoms and risk factors,
        then cover: what it is, why it matters, your immediate plan, and when to worry and seek help.
    `;

    diagnosisAnswer.innerHTML = `
        <div style="margin-top:1.5rem;padding:1.5rem;background:#f9fafb;border-radius:12px;border:1px solid #e5e7eb;text-align:left;">
            <h4 style="margin-top:0;margin-bottom:0.75rem;color:#111827;font-size:1rem;">Example 2‑Minute Explanation</h4>
            <p style="white-space:pre-line;color:#4b5563;font-size:0.95rem;line-height:1.7;">${explanation.trim()}</p>
        </div>
    `;
}

// Initialize timer display on load
document.addEventListener('DOMContentLoaded', () => {
    // Cache elements after DOM is ready
    diagnosisDisplay = document.getElementById('diagnosis-name');
    timerDisplay = document.getElementById('timer-display');
    timerProgress = document.getElementById('timer-progress');
    newDiagnosisBtn = document.getElementById('new-diagnosis-btn');
    startTimerBtn = document.getElementById('start-timer-btn');
    resetTimerBtn = document.getElementById('reset-timer-btn');
    diagnosisAnswer = document.getElementById('diagnosis-answer');
    viewAnswerBtn = document.getElementById('view-answer-btn');

    updateTimerDisplay();
    
    if (newDiagnosisBtn) {
        newDiagnosisBtn.addEventListener('click', () => {
            const diagnosis = getRandomDiagnosis();
            if (diagnosisDisplay) {
                diagnosisDisplay.textContent = diagnosis;
            }
            resetDiagnosisTimer();
            if (startTimerBtn) {
                startTimerBtn.disabled = false;
            }
        });
    }

    if (startTimerBtn) {
        startTimerBtn.addEventListener('click', () => {
            if (diagnosisTimerRunning) {
                pauseDiagnosisTimer();
            } else {
                startDiagnosisTimer();
            }
        });
    }

    if (resetTimerBtn) {
        resetTimerBtn.addEventListener('click', resetDiagnosisTimer);
    }

    if (viewAnswerBtn) {
        viewAnswerBtn.addEventListener('click', showDiagnosisAnswer);
    }
});

// ============================================
// 3-MINUTE PRIMING EXERCISE
// ============================================

let primingTimer = null;
let primingTimeLeft = 180; // 3 minutes
const PRIMING_TIME = 180;
let currentCase = null;

let primingInfo = null;
let primingTimerDisplay = null;
let primingTimerProgress = null;
let generateCaseBtn = null;
let startPrimingBtn = null;
let showApproachBtn = null;
let primingApproach = null;
let approachContent = null;
let primingTimerRunning = false;

async function getRandomCase() {
    // Wait for cases to load if not loaded yet
    if (!primingCasesLoaded && !primingCasesLoading) {
        await loadPrimingCases();
    }
    
    // If still not loaded, wait a bit and try again
    let attempts = 0;
    while (!primingCasesLoaded && attempts < 10) {
        await new Promise(resolve => setTimeout(resolve, 100));
        attempts++;
    }
    
    if (!primingCases || primingCases.length === 0) {
        console.warn('Priming cases not loaded. Attempting to reload...');
        await loadPrimingCases();
        
        if (!primingCases || primingCases.length === 0) {
            // Return a placeholder case if data still hasn't loaded
            return {
                name: "Error Loading Cases",
                age: 0,
                gender: "",
                presenting: "Unable to load cases from repository",
                pmh: "",
                medications: "",
                notes: "Please refresh the page. If the problem persists, check the browser console for errors.",
                primingFocus: "The priming cases repository could not be loaded. Please check that data/priming-cases.json exists and refresh the page.",
                examinerLens: "",
                approach: []
            };
        }
    }
    
    const randomIndex = Math.floor(Math.random() * primingCases.length);
    return primingCases[randomIndex];
}

function displayCase(caseData) {
    if (!primingInfo) return;
    
    primingInfo.innerHTML = `
        <div class="case-info-display">
            <h4>📋 Patient Information</h4>
            <p><strong>Name:</strong> ${caseData.name}</p>
            <p><strong>Age:</strong> ${caseData.age} years old</p>
            <p><strong>Gender:</strong> ${caseData.gender}</p>
            <p><strong>Presenting complaint:</strong> ${caseData.presenting}</p>
            <p><strong>Past medical history:</strong> ${caseData.pmh}</p>
            <p><strong>Current medications:</strong> ${caseData.medications}</p>
            <p><strong>Receptionist notes:</strong> <em>${caseData.notes}</em></p>
        </div>
    `;
}

function displayApproach(caseData) {
    if (!approachContent) return;

    const primingFocus = caseData.primingFocus || '';
    const examinerLens = caseData.examinerLens || '';

    let html = '';

    if (primingFocus.trim()) {
        html += `
            <section style="margin-bottom:1.5rem;">
                <h4 style="margin-top:0;margin-bottom:0.5rem;color:#0f766e;">Priming Focus – how to use your 3 minutes</h4>
                <p style="white-space:pre-line;color:#4b5563;font-size:0.95rem;line-height:1.7;">${primingFocus.trim()}</p>
            </section>
        `;
    }

    if (examinerLens.trim()) {
        html += `
            <section style="margin-bottom:1.5rem;">
                <h4 style="margin-top:0;margin-bottom:0.5rem;color:#1d4ed8;">Examiner's lens – what they are really marking</h4>
                <p style="white-space:pre-line;color:#4b5563;font-size:0.95rem;line-height:1.7;">${examinerLens.trim()}</p>
            </section>
        `;
    }

    if (caseData.approach && caseData.approach.length) {
        html += '<ul>';
        caseData.approach.forEach(point => {
            html += `<li>${point}</li>`;
        });
        html += '</ul>';
    }

    approachContent.innerHTML = html;
}

function updatePrimingTimer() {
    if (primingTimerDisplay) {
        primingTimerDisplay.textContent = formatTime(primingTimeLeft);
    }
    if (primingTimerProgress) {
        const percentage = (primingTimeLeft / PRIMING_TIME) * 100;
        primingTimerProgress.style.width = `${percentage}%`;
        
        primingTimerProgress.classList.remove('warning', 'danger');
        if (percentage <= 25) {
            primingTimerProgress.classList.add('danger');
        } else if (percentage <= 50) {
            primingTimerProgress.classList.add('warning');
        }
    }
}

function startPrimingTimer() {
    if (primingTimer) return;
    primingTimerRunning = true;
    if (startPrimingBtn) startPrimingBtn.textContent = 'Pause';
    
    primingTimer = setInterval(() => {
        primingTimeLeft--;
        updatePrimingTimer();
        
        if (primingTimeLeft <= 0) {
            clearInterval(primingTimer);
            primingTimer = null;
            primingTimerRunning = false;
            if (primingTimerDisplay) primingTimerDisplay.textContent = "Time's up!";
            if (startPrimingBtn) {
                startPrimingBtn.textContent = 'Start 3‑Minute Timer';
                startPrimingBtn.disabled = true;
            }
            if (showApproachBtn) showApproachBtn.disabled = false;
            if (primingTimerProgress) {
                primingTimerProgress.style.width = '0%';
            }
            // Automatically show the answer when time is up
            if (primingApproach && currentCase) {
                primingApproach.style.display = 'block';
                primingApproach.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
            }
        }
    }, 1000);
}

function pausePrimingTimer() {
    if (primingTimer) {
        clearInterval(primingTimer);
        primingTimer = null;
        primingTimerRunning = false;
        if (startPrimingBtn) startPrimingBtn.textContent = 'Resume';
    }
}

function resetPrimingTimer() {
    clearInterval(primingTimer);
    primingTimer = null;
    primingTimerRunning = false;
    primingTimeLeft = PRIMING_TIME;
    updatePrimingTimer();
    if (startPrimingBtn) {
        startPrimingBtn.textContent = 'Start 3‑Minute Timer';
        startPrimingBtn.disabled = true;
    }
    if (primingTimerProgress) {
        primingTimerProgress.classList.remove('warning', 'danger');
    }
}

document.addEventListener('DOMContentLoaded', async () => {
    primingInfo = document.getElementById('priming-info');
    primingTimerDisplay = document.getElementById('priming-timer-display');
    primingTimerProgress = document.getElementById('priming-timer-progress');
    generateCaseBtn = document.getElementById('generate-case-btn');
    startPrimingBtn = document.getElementById('start-priming-btn');
    showApproachBtn = document.getElementById('show-approach-btn');
    primingApproach = document.getElementById('priming-approach');
    approachContent = document.getElementById('approach-content');
    
    // Wait for cases to load before enabling button
    if (generateCaseBtn) {
        generateCaseBtn.disabled = true;
        generateCaseBtn.textContent = 'Loading cases...';
    }
    
    // Load cases and enable button when ready
    const loaded = await loadPrimingCases();
    
    if (generateCaseBtn) {
        if (loaded && primingCasesLoaded && primingCases.length > 0) {
            generateCaseBtn.disabled = false;
            generateCaseBtn.textContent = `New Priming Case (${primingCases.length} available)`;
            console.log(`✓ Priming tool ready with ${primingCases.length} cases`);
        } else {
            generateCaseBtn.disabled = false; // Allow clicking to see error
            generateCaseBtn.textContent = 'Error Loading - Click to Retry';
            console.error('Failed to load priming cases. Button will attempt reload on click.');
            
            // Show error message in priming info area
            if (primingInfo) {
                primingInfo.innerHTML = `
                    <div class="case-info-display" style="color: #dc2626; padding: 1rem;">
                        <h4>⚠️ Error Loading Cases</h4>
                        <p>Could not load priming cases from repository. Please:</p>
                        <ul style="text-align: left; margin: 1rem 0;">
                            <li>Check your browser console (F12) for details</li>
                            <li>Ensure you're running from a web server (not file://)</li>
                            <li>Verify data/priming-cases.json exists</li>
                            <li>Try refreshing the page</li>
                        </ul>
                        <p><strong>Click "New Priming Case" to retry loading.</strong></p>
                    </div>
                `;
            }
        }
    }

    if (generateCaseBtn) {
        generateCaseBtn.addEventListener('click', async () => {
            // If cases aren't loaded, try loading first
            if (!primingCasesLoaded || primingCases.length === 0) {
                console.log('Cases not loaded, attempting to load...');
                generateCaseBtn.disabled = true;
                generateCaseBtn.textContent = 'Loading cases...';
                
                const loaded = await loadPrimingCases();
                if (!loaded || primingCases.length === 0) {
                    generateCaseBtn.disabled = false;
                    generateCaseBtn.textContent = 'Error - Click to Retry';
                    if (primingInfo) {
                        primingInfo.innerHTML = `
                            <div class="case-info-display" style="color: #dc2626; padding: 1rem;">
                                <h4>⚠️ Failed to Load Cases</h4>
                                <p>Please check the browser console (F12) for error details.</p>
                                <p>Make sure you're running from a web server, not opening the file directly.</p>
                            </div>
                        `;
                    }
                    return;
                }
            }
            
            // Show loading state
            const originalText = generateCaseBtn.textContent;
            generateCaseBtn.disabled = true;
            generateCaseBtn.textContent = 'Loading case...';
            
            try {
                currentCase = await getRandomCase();
                
                if (!currentCase || currentCase.name === "Error Loading Cases") {
                    throw new Error('Failed to get valid case');
                }
                
                displayCase(currentCase);
                displayApproach(currentCase);
                resetPrimingTimer();
                if (startPrimingBtn) {
                    startPrimingBtn.disabled = false;
                    startPrimingBtn.textContent = 'Start 3‑Minute Timer';
                }
                if (showApproachBtn) {
                    showApproachBtn.disabled = false; // allow immediate viewing
                }
                if (primingApproach) {
                    primingApproach.style.display = 'none';
                }
                
                console.log(`✓ Generated case: ${currentCase.name} (${currentCase.presenting})`);
            } catch (error) {
                console.error('Error generating case:', error);
                if (primingInfo) {
                    primingInfo.innerHTML = `
                        <div class="case-info-display" style="color: #dc2626; padding: 1rem;">
                            <h4>Error Loading Case</h4>
                            <p>${error.message}</p>
                            <p>Please try again or refresh the page.</p>
                        </div>
                    `;
                }
            } finally {
                generateCaseBtn.disabled = false;
                generateCaseBtn.textContent = originalText || `New Priming Case (${primingCases.length} available)`;
            }
        });
    }

    if (startPrimingBtn) {
        startPrimingBtn.addEventListener('click', () => {
            if (primingTimerRunning) {
                pausePrimingTimer();
            } else {
                startPrimingTimer();
            }
        });
    }

    if (showApproachBtn) {
        showApproachBtn.addEventListener('click', () => {
            if (primingApproach && currentCase) {
                primingApproach.style.display = 'block';
                primingApproach.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
            }
        });
    }
});

// ============================================
// INITIALIZE
// ============================================

document.addEventListener('DOMContentLoaded', () => {
    // Initialize timer displays after elements are cached
    updateTimerDisplay();
    updatePrimingTimer();
});

