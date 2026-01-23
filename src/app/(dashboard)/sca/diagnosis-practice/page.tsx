'use client'

import { useState, useEffect, useCallback } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Progress } from '@/components/ui/progress'
import Link from 'next/link'

// All 56 diagnoses from the original practice-tools.js
const diagnoses = [
  // Respiratory
  "Asthma", "COPD", "Pneumonia", "Pulmonary Embolism", "Bronchiectasis", "Common Cold", "Sinusitis",
  // Cardiovascular
  "Hypertension", "Heart Failure", "Atrial Fibrillation", "Angina", "Deep Vein Thrombosis", "High Cholesterol",
  // Gastroenterology
  "GORD (Acid Reflux)", "Irritable Bowel Syndrome", "Coeliac Disease", "Inflammatory Bowel Disease", "Gallstones", "Gastroenteritis",
  // MSK
  "Osteoarthritis", "Rheumatoid Arthritis", "Gout", "Low Back Pain", "Tennis Elbow", "Osteoporosis", "Fibromyalgia",
  // Endocrine
  "Type 2 Diabetes", "Hypothyroidism", "Hyperthyroidism", "Polycystic Ovary Syndrome",
  // Dermatology
  "Eczema", "Psoriasis", "Acne", "Rosacea", "Shingles", "Cellulitis",
  // Mental Health
  "Depression", "Generalised Anxiety Disorder", "Panic Disorder", "Insomnia",
  // Neurology
  "Migraine", "Tension Headache", "Epilepsy", "BPPV (Vertigo)",
  // Urology/Renal
  "Urinary Tract Infection", "Kidney Stones", "Benign Prostatic Hyperplasia", "Chronic Kidney Disease",
  // Women's Health
  "Menopause", "Endometriosis", "Heavy Periods", "Vaginal Thrush",
  // ENT
  "Otitis Media (Ear Infection)", "Allergic Rhinitis (Hay Fever)", "Tonsillitis",
  // Paediatrics
  "Bronchiolitis", "Childhood Eczema", "Constipation in Children", "Febrile Illness in Children",
  // Other
  "Iron Deficiency Anaemia", "B12 Deficiency", "Vitamin D Deficiency", "Sleep Apnoea"
]

// Model explanations for each diagnosis
const diagnosisExplanations: Record<string, string> = {
  // Respiratory
  "Asthma": `Name it: asthma – airways are inflamed and twitchy so they narrow at times, causing wheeze and cough.
Link to patient: variable symptoms, triggers (cold, exercise), night cough, response to reliever.
Plan: reliever vs preventer inhalers, check technique/spacer, trigger avoidance, action plan, reviews.
Safety net: worsening breathlessness, needing reliever more, night waking, difficulty speaking – seek urgent help.`,

  "COPD": `COPD = long-term airway damage (often from smoking) making tubes narrow and less elastic.
Link: chronic breathlessness, cough/sputum, smoking history/age.
Plan: stop smoking, inhalers, pulmonary rehab, vaccines, early treatment of infections, spirometry monitoring.
Safety net: severe breathlessness, chest pain, confusion or blue lips – 999/ED.`,

  "Pneumonia": `Pneumonia is a lung infection where the air sacs fill with fluid.
Link: fever, cough with phlegm, pleuritic chest pain, feeling very unwell.
Plan: antibiotics if bacterial, fluids, rest; consider hospital if breathless, low sats, frail.
Safety net: worsening breathlessness, confusion, vomiting/fluids poor – urgent assessment.`,

  "Pulmonary Embolism": `A clot has travelled to the lung and is blocking blood flow.
Link: sudden breathlessness/pleuritic pain, risk factors (immobility, surgery, pregnancy, cancer, HRT, clots).
Plan: urgent hospital tests (bloods, scan) and blood thinners; duration depends on cause.
Safety net: collapse, worsening breathlessness or chest pain – 999 immediately.`,

  "Bronchiectasis": `Airways are widened and scarred so mucus pools and infections recur.
Link: chronic productive cough, repeated infections, possible past severe lung infection.
Plan: chest physio/airway clearance, inhalers if wheeze, vaccines, prompt antibiotics for flare, consider specialist.
Safety net: high fever, increased breathlessness, blood in sputum – urgent review.`,

  "Common Cold": `Viral upper respiratory infection – self-limiting.
Link: sore throat, runny nose, mild fever, short duration.
Plan: rest, fluids, simple analgesia, decongestant/steam; no antibiotics needed.
Safety net: high fever >3–5 days, breathlessness, chest pain, confusion – seek review.`,

  "Sinusitis": `Sinus lining inflamed/infected causing facial pain/pressure and blocked nose.
Link: facial pressure, reduced smell, thick nasal discharge.
Plan: nasal saline/steam, intranasal steroid, analgesia; consider delayed antibiotic if >10 days and severe.
Safety net: swelling around eye, visual changes, severe headache/fever – urgent review.`,

  // Cardiovascular
  "Hypertension": `Blood pressure is persistently above recommended levels, straining heart/brain/kidneys/eyes over time.
Link: their readings, risk factors (weight, family history, ethnicity, smoking).
Plan: lifestyle (salt, weight, exercise, alcohol, smoking) plus medication if indicated; monitor with home/clinic checks.
Safety net: neuro symptoms, chest pain, breathlessness – urgent assessment.`,

  "Heart Failure": `The heart is pumping less effectively so fluid can build up in lungs/legs.
Link: breathlessness on exertion/lying flat, ankle swelling, rapid weight gain.
Plan: tablets to offload fluid and support heart, daily weights, salt control, vaccines, regular review.
Safety net: sudden breathlessness at rest, chest pain, fast palpitations, rapid weight gain – urgent help.`,

  "Atrial Fibrillation": `The heart rhythm is irregular/fast because the top chambers are misfiring.
Link: palpitations, breathlessness, tiredness, incidental finding on pulse/ECG.
Plan: stroke prevention (blood thinner if indicated), rate/rhythm control, manage triggers (alcohol, thyroid).
Safety net: chest pain, collapse, severe breathlessness – urgent care.`,

  "Angina": `Narrowed heart arteries cause chest tightness on exertion/stress that eases with rest.
Link: predictable exertional discomfort, risk factors (HTN, cholesterol, smoking, diabetes).
Plan: short-acting nitrate for symptoms, optimise risk factors, consider statin/antiplatelet and cardiology review.
Safety net: pain at rest, prolonged/severe pain, associated breathlessness/sweat/nausea – treat as emergency.`,

  "Deep Vein Thrombosis": `A clot in a deep leg vein causing pain/swelling.
Link: unilateral swelling/pain, risk factors (surgery, immobility, cancer, pregnancy, HRT).
Plan: urgent assessment, scan, blood thinners if confirmed; advise mobility and hydration.
Safety net: sudden chest pain/breathlessness/collapse (possible PE) – 999.`,

  "High Cholesterol": `Higher fats in the blood increase long-term artery furring risk.
Link: their lipid results and personal/family risk factors.
Plan: lifestyle (diet, weight, exercise, smoking), and statin if risk indicates; recheck lipids and LFTs.
Safety net: new chest pain, neuro symptoms – seek urgent review.`,

  // Gastroenterology
  "GORD (Acid Reflux)": `Stomach acid is flowing back into the gullet causing heartburn/regurgitation.
Link: burning after meals/lying down, sour taste, triggers (coffee, spicy, alcohol).
Plan: lifestyle (smaller meals, weight, avoid late eating, triggers), acid suppression (PPI), review response.
Safety net: difficulty swallowing, weight loss, vomiting blood, black stools – urgent endoscopy assessment.`,

  "Irritable Bowel Syndrome": `A functional gut sensitivity causing pain with altered bowel habit, often relieved by stooling.
Link: pattern, relation to stress/food, no red flags.
Plan: reassurance, diet (regular meals, fiber balance, low FODMAP trial), stress management, targeted meds for diarrhoea/constipation/spasm.
Safety net: weight loss, bleeding, night symptoms, anaemia, persistent change – re-evaluate.`,

  "Coeliac Disease": `Immune reaction to gluten damaging the small bowel lining.
Link: bloating, diarrhoea, weight loss, anaemia, family history.
Plan: strict lifelong gluten-free diet, dietitian input, screen for deficiencies, follow-up bloods.
Safety net: persistent weight loss, severe symptoms – review; ensure tested before stopping gluten.`,

  "Inflammatory Bowel Disease": `Chronic gut inflammation (Crohn's/UC) causing diarrhoea, pain, sometimes blood.
Link: chronic loose stools, blood/mucus, weight loss, extra-intestinal signs.
Plan: specialist-led; may need steroids/immunosuppressants; ensure bloods/stool tests and safety net.
Safety net: severe pain, bleeding, fever, dehydration – urgent care.`,

  "Gallstones": `Hardened stones in the gallbladder causing biliary colic after fatty meals.
Link: RUQ/epigastric pain after eating, sometimes to back/shoulder, nausea.
Plan: pain relief, low-fat diet, ultrasound; surgery if recurrent/severe; watch for cholecystitis/pancreatitis signs.
Safety net: fever, jaundice, persistent severe pain/vomiting – urgent assessment.`,

  "Gastroenteritis": `Gut infection causing diarrhoea/vomiting.
Link: sudden onset, possible contacts/food trigger, short duration.
Plan: fluids, simple diet, hand hygiene; usually no antibiotics unless specific indication.
Safety net: blood in stool, high fever, dehydration, symptoms >7 days – review.`,

  // MSK
  "Osteoarthritis": `Joint cartilage has worn, causing pain/stiffness especially with use.
Link: age, weight-bearing joints, morning stiffness short-lived, worse on activity.
Plan: exercise/strengthening, weight loss, simple analgesia/topical NSAID, pacing, aids; consider physio.
Safety net: sudden hot swollen joint, giving way, severe deterioration – review.`,

  "Rheumatoid Arthritis": `Immune system is attacking joints causing inflammation, pain, and stiffness.
Link: small joints, morning stiffness >30–60 min, symmetry, swelling.
Plan: urgent rheumatology referral for DMARDs, pain control, bloods.
Safety net: rapid worsening, systemic symptoms – prompt review.`,

  "Gout": `Uric acid crystals inflame the joint, often big toe/ankle/knee.
Link: sudden very painful hot swollen joint, history of flares, diet/diuretics.
Plan: treat flare (NSAID/colchicine/steroid), ice/rest; long-term urate lowering if recurrent; lifestyle advice.
Safety net: fever, spreading redness, not improving – consider infection and review.`,

  "Low Back Pain": `Most back pain is mechanical/strain and improves over weeks.
Link: posture/lift trigger, no red flags.
Plan: keep moving, simple analgesia, short heat/physio core work; avoid long rest.
Safety net: leg weakness/numbness, bladder/bowel change, saddle anaesthesia – emergency (possible cauda equina).`,

  "Tennis Elbow": `Overuse of forearm tendons causes outside elbow pain.
Link: pain on gripping/lifting, tender lateral epicondyle.
Plan: activity modification, ice/NSAID gel, physio exercises, strap; steroid only if persistent.
Safety net: worsening function or severe night pain – review.`,

  "Osteoporosis": `Bone strength is reduced so fracture risk is higher.
Link: age, risk factors (steroids, menopause, low BMI, family history).
Plan: calcium/vit D if low, weight-bearing exercise, falls prevention; consider bisphosphonate if indicated after FRAX/DEXA.
Safety net: new back pain after minimal trauma – check for vertebral fracture.`,

  "Fibromyalgia": `Pain sensitivity condition with widespread aches, poor sleep, fatigue.
Link: chronic pain without inflammatory markers, poor restorative sleep, cognitive fog.
Plan: education, graded exercise, sleep hygiene, pacing, CBT-style strategies; meds may help some (e.g. amitriptyline/SSRIs/SNRIs).
Safety net: new focal neuro signs or significant change – reassess for alternative causes.`,

  // Endocrine
  "Type 2 Diabetes": `Blood sugar is high because of insulin resistance/shortage.
Link: thirst, polyuria, tiredness or incidental finding.
Plan: lifestyle foundations (diet, weight, activity, stop smoking), tablets/insulin as needed, regular checks (eyes, feet, kidneys).
Safety net: very high sugars, vomiting, drowsiness, abdominal pain – urgent review.`,

  "Hypothyroidism": `The thyroid is underactive so metabolism slows.
Link: tiredness, weight gain, cold intolerance, constipation, dry skin.
Plan: replace hormone (levothyroxine) and monitor blood tests; symptoms improve gradually.
Safety net: chest pain/palpitations on higher doses, severe lethargy – review.`,

  "Hyperthyroidism": `The thyroid is overactive so metabolism speeds up.
Link: weight loss, heat intolerance, tremor, palpitations, anxiety, diarrhoea.
Plan: anti-thyroid meds +/- beta blocker, specialist review for longer-term plan (radioiodine/surgery).
Safety net: severe palpitations, chest pain, fever/neck pain – urgent review.`,

  "Polycystic Ovary Syndrome": `Hormonal imbalance causing irregular periods, possible acne/hair changes, insulin resistance.
Link: cycle pattern, symptoms of androgen excess, weight.
Plan: lifestyle/weight, cycle regulation (COCP/progesterone), manage skin/hair, screen metabolic risk; fertility support if needed.
Safety net: heavy prolonged bleeding, severe pain – review.`,

  // Dermatology
  "Eczema": `Skin barrier is inflamed/leaky causing dry, itchy patches.
Link: pattern, triggers (soaps, stress), atopic history.
Plan: regular emollients, topical steroid for flares, trigger avoidance; infection signs need review.
Safety net: spreading redness, oozing, fever – possible infection; seek review.`,

  "Psoriasis": `Immune-mediated skin turnover causing red scaly plaques, sometimes nails/joints.
Link: typical sites (elbows/knees/scalp), family history.
Plan: emollients, topical steroids/vit D, consider phototherapy/derm referral if extensive; screen joints.
Safety net: sudden widespread rash, joint swelling, mood impact – review.`,

  "Acne": `Inflammation of hair follicles/oil glands causing spots/comedones.
Link: distribution on face/back/chest, severity, scarring risk.
Plan: skincare (non-comedogenic), topical retinoid/benzoyl peroxide, antibiotics if moderate, derm referral if severe.
Safety net: severe mood impact or scarring despite treatment – escalate.`,

  "Rosacea": `Facial flushing/inflammation with papules and visible vessels.
Link: triggers (heat, alcohol, spicy), central face distribution.
Plan: trigger avoidance, gentle skincare, topical agents (metronidazole/azelaic), oral antibiotics if needed; sun protection.
Safety net: eye symptoms (gritty/pain) or severe flare – review.`,

  "Shingles": `Reactivated chickenpox virus causing painful blistering rash in a band.
Link: unilateral dermatomal pain then blisters.
Plan: antivirals if early/severe/older, pain relief, keep rash covered/clean; avoid contact with vulnerable until crusted.
Safety net: eye involvement, severe pain, weakness – urgent review.`,

  "Cellulitis": `Bacterial skin infection causing red, hot, painful area.
Link: unilateral spreading redness, warmth, possible fever.
Plan: antibiotics, limb elevation, mark edge; review if no improvement in 48 hours.
Safety net: rapidly spreading redness, fever/chills, confusion – urgent assessment.`,

  // Mental Health
  "Depression": `Common condition affecting mood, sleep, appetite, enjoyment for weeks.
Link: low mood, anhedonia, energy/sleep/appetite changes, function impact.
Plan: biopsychosocial – self‑help/CBT/talking therapy, social support, consider SSRI; lifestyle (sleep, activity).
Safety net: suicidal thoughts, self‑harm, sudden deterioration – how to seek urgent help.`,

  "Generalised Anxiety Disorder": `Excessive worry most days for months with physical tension symptoms.
Link: constant worrying, sleep issues, muscle tension.
Plan: CBT/psychological approaches first-line, relaxation, lifestyle; meds (SSRI) if needed.
Safety net: worsening anxiety with self-harm thoughts, severe impact on functioning – seek help.`,

  "Panic Disorder": `Recurrent unexpected panic attacks plus worry about more attacks.
Link: sudden intense fear, palpitations, breathlessness, fear of dying, avoidance behaviours.
Plan: explain panic cycle, breathing/grounding techniques, CBT; SSRI if needed.
Safety net: chest pain with risk factors, self-harm thoughts – urgent review.`,

  "Insomnia": `Trouble falling or staying asleep impacting daytime function.
Link: sleep pattern, habits, stressors, caffeine/alcohol, screen use.
Plan: sleep hygiene, stimulus control, CBT‑I strategies; avoid routine hypnotics.
Safety net: mood worsening, unsafe daytime sleepiness – review.`,

  // Neurology
  "Migraine": `Episodic headaches often throbbing with nausea/light sensitivity ± aura.
Link: pattern, triggers (hormones/food/stress), impact.
Plan: trigger diary, acute treatment (simple analgesia + triptan + antiemetic), limit analgesic overuse; preventive if frequent.
Safety net: thunderclap, neuro deficits, change in pattern – urgent assessment.`,

  "Tension Headache": `Pressure/band-like headache linked to stress/posture.
Link: mild-moderate, not worsened by routine activity, no neuro signs.
Plan: posture/ergonomics, stress management, regular breaks, simple analgesia limited use.
Safety net: sudden severe headache, neuro symptoms, change in pattern – review.`,

  "Epilepsy": `Brain is having recurrent unprovoked seizures.
Link: witnessed episodes, recovery period, triggers (sleep loss/alcohol), driving implications.
Plan: neurology-led; anti-seizure meds, safety advice, avoid triggers; driving rules.
Safety net: prolonged seizure (>5 min), repeated without recovery, injury – emergency care.`,

  "BPPV (Vertigo)": `Inner ear crystals displaced causing brief spinning on head movement.
Link: seconds of vertigo when rolling over/looking up, no neuro signs, fatigable.
Plan: explain benign nature, perform/teach repositioning (Epley), vestibular rehab if persistent.
Safety net: new neuro signs, hearing loss, persistent severe vertigo – review.`,

  // Urology/Renal
  "Urinary Tract Infection": `Bladder infection causing dysuria/frequency.
Link: burning urine, urgency, suprapubic discomfort; no red flags.
Plan: fluids, short antibiotic if indicated, safety net; urine dip/culture per guidance.
Safety net: fever/flank pain (possible kidney), vomiting, pregnancy risk – urgent review.`,

  "Kidney Stones": `A stone is passing, causing severe colicky flank pain.
Link: loin-to-groin pain, hematuria, restlessness.
Plan: strong analgesia, fluids; imaging; tamsulosin sometimes; urology if large/obstructed/infected.
Safety net: fever with pain (infected obstruction) – emergency; uncontrolled pain/vomiting – urgent care.`,

  "Benign Prostatic Hyperplasia": `Prostate enlargement narrows urine flow.
Link: weak stream, hesitancy, nocturia, incomplete emptying.
Plan: lifestyle (fluids timing, reduce caffeine/alcohol), consider tamsulosin/finasteride, monitor.
Safety net: retention, infection signs, hematuria – review.`,

  "Chronic Kidney Disease": `Kidneys are less efficient over time (stages by eGFR/ACR).
Link: often asymptomatic; may have oedema, hypertension.
Plan: control BP, diabetes, avoid nephrotoxins, statin if indicated, regular blood/urine checks; refer if advanced/progressive.
Safety net: sudden drop in urine, swelling, breathlessness – review promptly.`,

  // Women's Health
  "Menopause": `Ovaries make less oestrogen leading to period changes and symptoms.
Link: hot flushes, cycle change, mood/sleep changes, vaginal dryness.
Plan: lifestyle, HRT if appropriate after discussing benefits/risks/contraindications; non-hormonal options if needed.
Safety net: abnormal bleeding (post-menopausal bleeding), chest pain/leg swelling on HRT – urgent review.`,

  "Endometriosis": `Endometrial-like tissue outside the womb causes pain and sometimes fertility issues.
Link: cyclical pelvic pain, deep dyspareunia, heavy periods, bowel/bladder pain in cycle.
Plan: analgesia, hormonal suppression (COCP/progesterone), consider gynae referral, pelvic physio.
Safety net: severe acute pain, heavy bleeding, impact on fertility – review.`,

  "Heavy Periods": `Period bleeding is heavier/prolonged affecting quality of life.
Link: clots, flooding, anaemia symptoms.
Plan: bloods (FBC/iron), options: tranexamic, mefenamic, hormonal (COCP/LNG-IUS), address underlying causes.
Safety net: very heavy bleeding with dizziness, intermenstrual/post-coital bleeding – review.`,

  "Vaginal Thrush": `Fungal overgrowth causing itch/discharge.
Link: thick white discharge, itch, soreness, no strong odour.
Plan: antifungal pessary/cream/oral, avoid irritants, consider triggers (antibiotics, diabetes).
Safety net: persistent/recurrent symptoms, unusual discharge/odour, bleeding – review for other causes.`,

  // ENT
  "Otitis Media (Ear Infection)": `Middle ear infection causing ear pain ± fever/hearing drop.
Link: recent cold, unilateral pain, child common.
Plan: analgesia, usually self-limits; antibiotic if severe/systemic or high-risk.
Safety net: swelling behind ear, severe fever, discharge with pain – review.`,

  "Allergic Rhinitis (Hay Fever)": `Nose/eyes react to allergens like pollen.
Link: sneezing, itchy/runny/blocked nose, itchy eyes; seasonal/perennial pattern.
Plan: avoidance where possible, regular antihistamine, intranasal steroid, saline rinses.
Safety net: poor control despite treatment, asthma flare risk – review.`,

  "Tonsillitis": `Tonsil infection causing sore throat, fever, difficulty swallowing.
Link: fever, swollen tonsils ± exudate, tender neck nodes.
Plan: analgesia, fluids; consider antibiotics if Centor/FeverPAIN high.
Safety net: difficulty breathing/swallowing, drooling, neck swelling (quinsy) – urgent care.`,

  // Paediatrics
  "Bronchiolitis": `Viral infection in infants causing small airway inflammation.
Link: cough, wheeze, feeding difficulty in baby; peak at 3–6 months.
Plan: mainly supportive, small frequent feeds, monitor work of breathing; hospital if poor feeding, apnoea, low sats.
Safety net: reduced wet nappies, pauses in breathing, blue lips, severe effort – ED.`,

  "Childhood Eczema": `Same principles as eczema: itchy dry skin in flexures/cheeks.
Plan: frequent emollients, appropriate-strength steroid for flares, trigger avoidance, infection checks.
Safety net: spreading redness/ooze/fever – review (possible infection).`,

  "Constipation in Children": `Hard/infrequent stools causing pain withholding.
Link: stool pattern, pain, soiling, diet/fluids.
Plan: disimpaction then maintenance laxatives, diet/fluids, toileting routine, reward charts.
Safety net: vomiting, weight loss, blood, severe pain – review.`,

  "Febrile Illness in Children": `Fever from likely viral infection but need red-flag check.
Plan: hydration, antipyretic for comfort, observe; explain traffic-light/red flags.
Safety net: poor feeding, lethargy, breathing difficulty, non-blanching rash, seizure – urgent care.`,

  // Other
  "Iron Deficiency Anaemia": `Low iron causing fewer red cells so less oxygen carriage.
Link: tiredness, breathlessness, pallor; source often low intake or blood loss.
Plan: iron replacement, find and address cause (diet, menstrual, GI), recheck bloods.
Safety net: black/tarry stools, vomiting blood, worsening fatigue – review.`,

  "B12 Deficiency": `Low B12 affecting red cells and nerves.
Link: tiredness, pins/needles, glossitis; cause diet or absorption (pernicious anaemia).
Plan: replace B12 (oral/injection depending on cause), investigate cause, monitor bloods.
Safety net: worsening numbness/weakness, cognitive change – review promptly.`,

  "Vitamin D Deficiency": `Low vitamin D affecting bones/muscles.
Link: bone pain, muscle aches, risk factors (low sun, darker skin, covered clothing).
Plan: supplementation loading then maintenance, safe sun/ diet advice.
Safety net: persistent bone pain or weakness despite replacement – review.`,

  "Sleep Apnoea": `Breathing pauses in sleep causing poor rest and daytime sleepiness.
Link: loud snoring, witnessed apnoeas, daytime tiredness, morning headaches.
Plan: weight loss, avoid sedatives/alcohol at night; refer for sleep study, possible CPAP.
Safety net: falling asleep while driving, cardiovascular symptoms – urgent advice to stop driving and seek review.`
}

const TIMER_DURATION = 120 // 2 minutes

export default function DiagnosisPracticePage() {
  const [currentDiagnosis, setCurrentDiagnosis] = useState<string | null>(null)
  const [timeLeft, setTimeLeft] = useState(TIMER_DURATION)
  const [isRunning, setIsRunning] = useState(false)
  const [showAnswer, setShowAnswer] = useState(false)

  const formatTime = (seconds: number) => {
    const mins = Math.floor(seconds / 60)
    const secs = seconds % 60
    return `${mins}:${secs.toString().padStart(2, '0')}`
  }

  const getRandomDiagnosis = useCallback(() => {
    const randomIndex = Math.floor(Math.random() * diagnoses.length)
    return diagnoses[randomIndex]
  }, [])

  const handleNewDiagnosis = () => {
    setCurrentDiagnosis(getRandomDiagnosis())
    setTimeLeft(TIMER_DURATION)
    setIsRunning(false)
    setShowAnswer(false)
  }

  const handleStartTimer = () => {
    if (isRunning) {
      setIsRunning(false)
    } else {
      setIsRunning(true)
    }
  }

  const handleReset = () => {
    setTimeLeft(TIMER_DURATION)
    setIsRunning(false)
  }

  useEffect(() => {
    let interval: NodeJS.Timeout | null = null
    
    if (isRunning && timeLeft > 0) {
      interval = setInterval(() => {
        setTimeLeft(prev => {
          if (prev <= 1) {
            setIsRunning(false)
            setShowAnswer(true)
            return 0
          }
          return prev - 1
        })
      }, 1000)
    }
    
    return () => {
      if (interval) clearInterval(interval)
    }
  }, [isRunning, timeLeft])

  const timeProgress = (timeLeft / TIMER_DURATION) * 100

  return (
    <div className="max-w-3xl mx-auto space-y-6">
      <div className="flex items-center justify-between">
        <Link href="/sca">
          <Button variant="ghost">← Back to SCA</Button>
        </Link>
      </div>

      <Card>
        <CardHeader>
          <CardTitle>2-Minute Diagnosis Practice</CardTitle>
          <CardDescription>
            Practice explaining a diagnosis clearly and concisely in 2 minutes – a key SCA skill.
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-6">
          {/* Instructions */}
          <div className="bg-muted p-4 rounded-lg">
            <h4 className="font-medium mb-2">How to use this</h4>
            <ul className="text-sm text-muted-foreground space-y-1">
              <li>• Click <strong>New Diagnosis</strong>, take 5–10 seconds to plan your structure.</li>
              <li>• Start the timer and explain out loud for 2 minutes.</li>
              <li>• Click <strong>View Answer</strong> to compare with a model structure.</li>
            </ul>
          </div>

          {/* Diagnosis Display */}
          <div className="text-center py-8 bg-primary/5 rounded-lg border-2 border-primary/20">
            <p className="text-sm text-muted-foreground mb-2">Your diagnosis</p>
            <p className="text-3xl font-bold text-primary">
              {currentDiagnosis || 'Click "New Diagnosis" to begin'}
            </p>
          </div>

          {/* Timer */}
          <div className="space-y-3">
            <div className="flex justify-between items-center">
              <span className="text-sm font-medium">Time Remaining</span>
              <span className={`text-3xl font-bold font-mono ${
                timeLeft < 30 ? 'text-destructive' : 
                timeLeft < 60 ? 'text-amber-600' : 
                'text-primary'
              }`}>
                {formatTime(timeLeft)}
              </span>
            </div>
            <Progress 
              value={timeProgress} 
              className={`h-3 ${
                timeProgress < 25 ? '[&>div]:bg-destructive' : 
                timeProgress < 50 ? '[&>div]:bg-amber-500' : ''
              }`}
            />
          </div>

          {/* Controls */}
          <div className="flex flex-wrap gap-3 justify-center">
            <Button onClick={handleNewDiagnosis}>
              New Diagnosis
            </Button>
            <Button 
              variant="outline" 
              onClick={() => setShowAnswer(true)}
              disabled={!currentDiagnosis}
            >
              View Answer
            </Button>
            <Button 
              variant="outline" 
              onClick={handleStartTimer}
              disabled={!currentDiagnosis}
            >
              {isRunning ? 'Pause' : 'Start Timer'}
            </Button>
            <Button variant="ghost" onClick={handleReset}>
              Reset
            </Button>
          </div>

          {/* Model Answer */}
          {showAnswer && currentDiagnosis && (
            <div className="bg-muted p-4 rounded-lg border mt-6">
              <h4 className="font-medium mb-3">Example 2-Minute Explanation</h4>
              <p className="text-sm whitespace-pre-line leading-relaxed">
                {diagnosisExplanations[currentDiagnosis] || 
                  `Give the name of the condition, link it to the patient's key symptoms and risk factors,
then cover: what it is, why it matters, your immediate plan, and when to worry and seek help.`}
              </p>
            </div>
          )}

          {/* Quick Tips */}
          <div className="border-t pt-6">
            <h4 className="font-medium mb-3">Structure for Explaining Any Diagnosis</h4>
            <div className="grid md:grid-cols-2 gap-4 text-sm">
              <div className="bg-primary/5 p-3 rounded-lg">
                <strong className="text-primary">1. Name it</strong>
                <p className="text-muted-foreground">State the diagnosis clearly</p>
              </div>
              <div className="bg-primary/5 p-3 rounded-lg">
                <strong className="text-primary">2. Link to patient</strong>
                <p className="text-muted-foreground">Connect to their symptoms/story</p>
              </div>
              <div className="bg-primary/5 p-3 rounded-lg">
                <strong className="text-primary">3. Explain what it is</strong>
                <p className="text-muted-foreground">Simple lay terms, no jargon</p>
              </div>
              <div className="bg-primary/5 p-3 rounded-lg">
                <strong className="text-primary">4. Plan</strong>
                <p className="text-muted-foreground">What happens next, treatment</p>
              </div>
              <div className="bg-amber-50 dark:bg-amber-950/20 p-3 rounded-lg md:col-span-2">
                <strong className="text-amber-700 dark:text-amber-300">5. Safety net</strong>
                <p className="text-muted-foreground">When to worry and seek help – never skip this!</p>
              </div>
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
