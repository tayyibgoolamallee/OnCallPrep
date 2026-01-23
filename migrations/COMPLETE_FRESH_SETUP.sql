-- =============================================
-- OnCallPrep - Complete Fresh Setup
-- =============================================
-- This single file:
-- 1. Drops ALL existing tables (clean slate)
-- 2. Creates the new schema
-- 3. Imports all content (35 SCA cases, 275 AKT questions, 12 portfolio guides)
--
-- Run this ONE file in Supabase SQL Editor
-- =============================================

-- =============================================
-- STEP 1: CLEAN SLATE - Drop everything
-- =============================================
DROP TABLE IF EXISTS user_progress CASCADE;
DROP TABLE IF EXISTS user_profiles CASCADE;
DROP TABLE IF EXISTS sca_cases CASCADE;
DROP TABLE IF EXISTS akt_questions CASCADE;
DROP TABLE IF EXISTS portfolio_guides CASCADE;
DROP FUNCTION IF EXISTS handle_new_user CASCADE;

-- =============================================
-- STEP 2: Enable extensions
-- =============================================
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =============================================
-- STEP 3: Create Tables
-- =============================================

-- SCA Cases
CREATE TABLE sca_cases (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  case_type TEXT NOT NULL,
  title TEXT NOT NULL,
  scenario TEXT NOT NULL,
  patient_info JSONB NOT NULL,
  key_points TEXT[] NOT NULL,
  model_answer TEXT NOT NULL,
  time_limit INTEGER NOT NULL,
  difficulty TEXT DEFAULT 'medium',
  is_pro BOOLEAN DEFAULT false,
  published BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- AKT Questions
CREATE TABLE akt_questions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  question TEXT NOT NULL,
  options JSONB NOT NULL,
  correct_option TEXT NOT NULL,
  explanation TEXT NOT NULL,
  topic TEXT NOT NULL,
  difficulty TEXT DEFAULT 'medium',
  guideline_refs TEXT[],
  is_pro BOOLEAN DEFAULT false,
  published BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Portfolio Guides
CREATE TABLE portfolio_guides (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  stage TEXT NOT NULL,
  category TEXT NOT NULL,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  is_pro BOOLEAN DEFAULT false,
  published BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- User Profiles
CREATE TABLE user_profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  full_name TEXT,
  subscription_tier TEXT DEFAULT 'free',
  stripe_customer_id TEXT,
  stripe_subscription_id TEXT,
  is_admin BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- User Progress
CREATE TABLE user_progress (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  content_type TEXT NOT NULL,
  content_id UUID NOT NULL,
  score INTEGER,
  time_taken INTEGER,
  user_response TEXT,
  completed BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, content_type, content_id)
);

-- =============================================
-- STEP 4: Row Level Security
-- =============================================
ALTER TABLE sca_cases ENABLE ROW LEVEL SECURITY;
ALTER TABLE akt_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE portfolio_guides ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_progress ENABLE ROW LEVEL SECURITY;

-- Content tables: anyone can read published content
CREATE POLICY "read_published_sca" ON sca_cases FOR SELECT USING (published = true);
CREATE POLICY "read_published_akt" ON akt_questions FOR SELECT USING (published = true);
CREATE POLICY "read_published_portfolio" ON portfolio_guides FOR SELECT USING (published = true);

-- User profiles: users manage their own
CREATE POLICY "read_own_profile" ON user_profiles FOR SELECT USING (auth.uid() = id);
CREATE POLICY "update_own_profile" ON user_profiles FOR UPDATE USING (auth.uid() = id);

-- User progress: users manage their own
CREATE POLICY "read_own_progress" ON user_progress FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "insert_own_progress" ON user_progress FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "update_own_progress" ON user_progress FOR UPDATE USING (auth.uid() = user_id);

-- =============================================
-- STEP 5: Auto-create profile on signup
-- =============================================
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.user_profiles (id, email, full_name)
  VALUES (NEW.id, NEW.email, COALESCE(NEW.raw_user_meta_data->>'full_name', ''));
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- =============================================
-- STEP 6: Performance indexes
-- =============================================
CREATE INDEX idx_sca_type ON sca_cases(case_type);
CREATE INDEX idx_sca_pro ON sca_cases(is_pro);
CREATE INDEX idx_akt_topic ON akt_questions(topic);
CREATE INDEX idx_akt_pro ON akt_questions(is_pro);
CREATE INDEX idx_portfolio_stage ON portfolio_guides(stage);
CREATE INDEX idx_progress_user ON user_progress(user_id);

-- =============================================
-- STEP 7: Import SCA Priming Cases (35 cases)
-- =============================================
INSERT INTO sca_cases (case_type, title, scenario, patient_info, key_points, model_answer, time_limit, difficulty, is_pro, published) VALUES
('priming', 'Miss A - Lower Abdominal Pain', '25-year-old female presenting with lower abdominal pain for two days. Last period was two weeks ago. Reports mild nausea but no vomiting or bowel change.', '{"name": "Miss A", "age": 25, "gender": "Female", "pmh": "None significant", "medications": "Combined oral contraceptive pill"}'::jsonb, ARRAY['Differentials: UTI, PID, ovarian pathology, ectopic pregnancy, appendicitis, IBS', 'Red flags: Fever, severe pain, vomiting, fainting, haemodynamic instability', 'Key history: Sexual activity, discharge, dysuria, pregnancy risk, contraception reliability', 'Investigations: Pregnancy test, STI swabs, urine dip, consider same-day review if PID suspected', 'Management: Antibiotics if PID (doxycycline + metronidazole ± ceftriaxone), partner notification, safety-netting'], '**Priming Focus:** Key differentials: UTI, PID, ovarian cyst/torsion, ectopic (still possible despite pill), appendicitis, IBS. Ask about pregnancy risk, discharge, dysuria, fever, sexual history. Be alert to safeguarding / STI context.

**Examiner Lens:** The examiner wants to see recognition of red flags, safe sexual history taking, and appropriate urgency.', 180, 'medium', false, true),
('priming', 'Mr B - Dry Cough and Breathlessness', '58-year-old male with dry cough and mild breathlessness for three weeks. Ramipril dose increased last month. No phlegm, fever or chest pain. Sleeps fine, can lie flat.', '{"name": "Mr B", "age": 58, "gender": "Male", "pmh": "Hypertension, Type 2 diabetes", "medications": "Ramipril, Metformin"}'::jsonb, ARRAY['Differential: ACE inhibitor cough (most likely), infection, heart failure, asthma/COPD', 'Red flags: Haemoptysis, chest pain, orthopnoea, weight loss', 'Key: Link to recent ramipril dose increase', 'Management: Trial switch to ARB (e.g. losartan), safety-net for persistent symptoms'], '**Priming Focus:** Cough on ACEi vs infection vs heart failure vs asthma/COPD. Check for red flags. Review medication timing and side effects.

**Examiner Lens:** The examiner wants to see medication awareness and safe side-effect management.', 180, 'easy', false, true),
('priming', 'Mrs C - Contraceptive Pill Request', '38-year-old female requesting repeat combined oral contraceptive pill. Has been on COCP for 15 years with no problems. Smokes 10 cigarettes/day.', '{"name": "Mrs C", "age": 38, "gender": "Female", "pmh": "None significant", "medications": "Combined oral contraceptive pill (15 years)"}'::jsonb, ARRAY['Contraindication: COCP + smoker >35 = increased VTE/stroke risk', 'Explore: Smoking habits, motivation to quit, contraception preferences', 'Alternatives: POP, IUS, implant, barrier methods', 'Management: Stop COCP, offer safer alternatives, smoking cessation support'], '**Priming Focus:** Combined pill contraindicated if smoker >35 (thrombotic risk). Explore smoking habits and preferences for contraception.

**Examiner Lens:** The examiner wants to see guideline adherence and safe prescribing with shared decision-making.', 180, 'medium', false, true),
('priming', 'Mr D - Sertraline Not Working', '42-year-old male with no improvement on sertraline after 4 weeks. Thinking of stopping tablets. Missed a few doses when felt sick. No suicidal thoughts.', '{"name": "Mr D", "age": 42, "gender": "Male", "pmh": "Depression", "medications": "Sertraline 50mg daily (started 4 weeks ago)"}'::jsonb, ARRAY['Adherence: Check missed doses, side effects, timing', 'Expectations: Antidepressants take 6-8 weeks to work', 'Risk: Assess suicidal ideation, self-harm risk', 'Support: CBT, self-help, follow-up in 2-4 weeks'], '**Priming Focus:** Explore adherence, side effects, psychosocial context. Manage expectations (6–8 weeks for effect).

**Examiner Lens:** The examiner wants to see correct expectation-setting and appropriate risk assessment.', 180, 'easy', false, true),
('priming', 'Mr E - Raised Liver Function Tests', '52-year-old male with raised liver function tests on routine bloods. ALT 95, GGT 120. Drinks ''a few beers most nights''. Feels well otherwise.', '{"name": "Mr E", "age": 52, "gender": "Male", "pmh": "None significant", "medications": "None"}'::jsonb, ARRAY['Alcohol history: Quantify intake (3-4 beers/night ≈ 20+ units/week)', 'Dependency: CAGE questionnaire, withdrawal symptoms', 'Causes: Alcohol, NAFLD, viral hepatitis, medications', 'Management: Reduce alcohol (<14 units/week), repeat LFTs in 3 months'], '**Priming Focus:** Assess alcohol intake (units/week), dependency risk. Possible fatty liver or alcohol-related injury.

**Examiner Lens:** The examiner wants to see accurate alcohol history taking and motivational interviewing skills.', 180, 'medium', false, true),
('priming', 'Mrs F - Tiredness and Brain Fog', '48-year-old female with tiredness and ''foggy-headed'' feeling for a few months. Known hypothyroidism. Last thyroid test was 9 months ago. Sometimes takes levothyroxine after breakfast.', '{"name": "Mrs F", "age": 48, "gender": "Female", "pmh": "Hypothyroidism", "medications": "Levothyroxine 100mcg daily"}'::jsonb, ARRAY['Adherence: Check timing (should be on empty stomach before breakfast)', 'Interactions: Iron, calcium, food can reduce absorption', 'Investigations: Repeat TFTs, check FBC, ferritin, glucose', 'Other causes: Anaemia, depression, sleep, lifestyle'], '**Priming Focus:** Consider undertreated thyroid disease, anaemia, depression, or lifestyle causes. Explore adherence and timing.

**Examiner Lens:** The examiner wants to see medication adherence checking and holistic assessment of fatigue.', 180, 'easy', false, true),
('priming', 'Mr G - Heartburn and Epigastric Discomfort', '61-year-old male with heartburn and epigastric discomfort for 2 weeks. Takes ibuprofen 400mg TDS for months for knee pain.', '{"name": "Mr G", "age": 61, "gender": "Male", "pmh": "Hypertension, Chronic knee pain", "medications": "Ibuprofen 400mg TDS, Lisinopril"}'::jsonb, ARRAY['Red flags: Weight loss, vomiting, black stools, dysphagia, anaemia', 'Cause: Likely NSAID-related irritation', 'Management: Add PPI (omeprazole) or stop/reduce NSAID', 'Alternatives: Topical NSAID, paracetamol, physiotherapy'], '**Priming Focus:** NSAID-induced dyspepsia or ulcer risk. Explore red flags. Assess cardiovascular/renal risks.

**Examiner Lens:** The examiner wants to see safe NSAID management and holistic pain approach.', 180, 'medium', false, true),
('priming', 'Mrs H - Headaches in Pregnancy', '33-year-old female at 30 weeks pregnant with headaches and mild ankle swelling. Home BP readings around 145/95 mmHg.', '{"name": "Mrs H", "age": 33, "gender": "Female", "pmh": "None significant", "medications": "Pregnancy vitamins only"}'::jsonb, ARRAY['Red flags: Visual disturbance, RUQ pain, severe headache, reduced fetal movements', 'Urgent: Same-day face-to-face review for BP, urine dip (protein), bloods', 'Safe meds: Labetalol, nifedipine, methyldopa (never ACEi/ARB)', 'Referral: Antenatal unit for monitoring'], '**Priming Focus:** Possible pregnancy-induced hypertension vs pre-eclampsia. Ask about visual disturbance, RUQ pain.

**Examiner Lens:** The examiner wants to see safe triage and urgent referral to antenatal unit.', 180, 'hard', true, true),
('priming', 'Mrs I - Sleep Problems After Bereavement', '67-year-old female with sleep problems since husband''s death 6 months ago. Asking for ''something to help me sleep''.', '{"name": "Mrs I", "age": 67, "gender": "Female", "pmh": "None significant", "medications": "None"}'::jsonb, ARRAY['Normalise: Sleep disturbance common during grief', 'Sleep hygiene: Routine, limit caffeine, avoid screens, relaxation', 'Support: CBT-I, talking therapy, bereavement counselling', 'Medication: Very limited zopiclone only if severe (lowest dose, <2 weeks)'], '**Priming Focus:** Consider adjustment disorder / grief vs depression. Explore sleep hygiene, coping mechanisms.

**Examiner Lens:** The examiner wants to see psychological first-line approach and minimal hypnotic use.', 180, 'medium', false, true),
('priming', 'Mr J - Joint Pain with Psoriasis', '45-year-old male with pain and stiffness in fingers and knees over past month. Known chronic plaque psoriasis.', '{"name": "Mr J", "age": 45, "gender": "Male", "pmh": "Chronic plaque psoriasis", "medications": "Topical treatments for psoriasis"}'::jsonb, ARRAY['Pattern: Morning stiffness >30 min, joint swelling, functional impact', 'Link: Psoriatic arthritis - inflammation linked to skin condition', 'Urgent: Rheumatology referral (NICE NG220)', 'Symptom relief: Paracetamol ± topical NSAID'], '**Priming Focus:** Consider psoriatic arthritis. Ask about pattern (morning stiffness > 30 min, swelling, function).

**Examiner Lens:** The examiner wants to see correct urgent referral and safe symptom relief.', 180, 'medium', true, true),
('priming', 'Mrs K - Knee Pain in RA Patient', '45-year-old female with increasing right knee pain and mild swelling over past month. Known rheumatoid arthritis for 5 years.', '{"name": "Mrs K", "age": 45, "gender": "Female", "pmh": "Rheumatoid arthritis (5 years)", "medications": "Methotrexate weekly, Folic acid"}'::jsonb, ARRAY['Distinguish: RA flare vs mechanical injury vs infection', 'Red flags: Fever, redness, unable to bear weight (septic arthritis risk)', 'Flare plan: Short course prednisolone or discuss with rheumatology nurse', 'Monitoring: Arrange bloods (FBC, CRP, LFTs) for methotrexate monitoring'], '**Priming Focus:** Possible flare of RA vs mechanical strain vs infection. Check methotrexate adherence, monitoring.

**Examiner Lens:** The examiner wants to see safe RA flare approach and continuity with specialist team.', 180, 'medium', true, true),
('priming', 'Mrs L - Leg Swelling on Tamoxifen', '53-year-old female with left leg swelling and mild ache for 3 days. History of breast cancer (4 years ago, now in remission). On tamoxifen.', '{"name": "Mrs L", "age": 53, "gender": "Female", "pmh": "Breast cancer (4 years ago, now in remission)", "medications": "Tamoxifen"}'::jsonb, ARRAY['Risk factors: Tamoxifen (increases VTE risk), immobility, cancer history', 'Red flags: SOB, chest pain (possible PE)', 'Urgent: Same-day DVT assessment (DVT clinic or ambulatory care)', 'Safety-net: If breathless or chest pain → 999'], '**Priming Focus:** Possible DVT (tamoxifen ↑ VTE risk). Urgent same-day assessment needed.

**Examiner Lens:** The examiner wants to see urgent referral and safe triage.', 180, 'hard', true, true),
('priming', 'Mr M - Memory Problems and Driving', '76-year-old male with memory problems and getting lost while driving. Mild Alzheimer''s disease recently diagnosed apply.', '{"name": "Mr M", "age": 76, "gender": "Male", "pmh": "Mild Alzheimer''s disease (recently diagnosed), Hypertension", "medications": "Amlodipine"}'::jsonb, ARRAY['Functional impact: ADLs, driving safety, work, finances', 'Legal: Advise stop driving until assessment (DVLA guidance)', 'Referral: Memory clinic, baseline tests', 'Safeguarding: Consider capacity, safety at home'], '**Priming Focus:** Explore functional impact, mood, driving safety. Legal duties (DVLA, capacity, confidentiality).

**Examiner Lens:** The examiner wants to see safe advice regarding driving and appropriate referral.', 180, 'hard', true, true),
('priming', 'Miss N - Requesting More Diazepam', '34-year-old female with increasing anxiety since losing job, requesting more diazepam. Single parent of two.', '{"name": "Miss N", "age": 34, "gender": "Female", "pmh": "None significant", "medications": "Diazepam 5mg PRN (prescribed 2 months ago by OOH GP)"}'::jsonb, ARRAY['Dependence: Check frequency of use, withdrawal symptoms, tolerance', 'Risks: Long-term diazepam worsens anxiety, causes dependence', 'Taper: Gradual reduction (10-25% every 1-2 weeks)', 'Support: CBT, talking therapy, non-drug strategies'], '**Priming Focus:** Likely benzodiazepine dependence. Discuss gradual tapering, psychological support.

**Examiner Lens:** The examiner wants to see gradual withdrawal plan and psychological input.', 180, 'hard', true, true),
('priming', 'Mrs O - Osteoporosis Treatment Alternatives', '70-year-old female asking about alternatives to alendronate for osteoporosis. Stopped alendronate due to severe heartburn.', '{"name": "Mrs O", "age": 70, "gender": "Female", "pmh": "Osteoporosis (T-score -2.9), Vertebral fracture last year", "medications": "Calcium, Vitamin D supplements"}'::jsonb, ARRAY['Alternatives: Denosumab (SC injection every 6 months), Zoledronic acid (IV infusion yearly)', 'Pre-checks: Renal function, calcium levels before starting', 'Lifestyle: Exercise, calcium/vitamin D, falls prevention', 'Referral: Osteoporosis clinic for alternative therapy'], '**Priming Focus:** Need alternative anti-resorptive therapy. Consider denosumab, zoledronic acid.

**Examiner Lens:** The examiner wants to see evidence-based alternative options.', 180, 'medium', true, true),
('priming', 'Mr P - Dizziness and Falls', '84-year-old male with dizziness when standing and minor fall last week. Takes 10 regular medications.', '{"name": "Mr P", "age": 84, "gender": "Male", "pmh": "Hypertension, BPH, Cataracts", "medications": "Amlodipine, Furosemide, Tamsulosin, Sertraline, Zopiclone (10 regular medications)"}'::jsonb, ARRAY['Multifactorial: Vision, medications (postural hypotension risk), environment, cognition', 'Medication review: Doxazosin, furosemide, zopiclone all increase falls risk', 'Investigations: Lying/standing BP, bloods (U&Es, glucose)', 'Referrals: Falls clinic, community pharmacist'], '**Priming Focus:** Structure a multifactorial falls assessment. Think drugs, vision, environment, cognition.

**Examiner Lens:** The examiner wants to see recognition of postural hypotension risk and polypharmacy.', 180, 'hard', true, true),
('priming', 'Mr Q - Wants to Quit Smoking', '59-year-old male wanting help quitting smoking. COPD (GOLD stage 2), mild depression. Tried patches before - didn''t work.', '{"name": "Mr Q", "age": 59, "gender": "Male", "pmh": "COPD (GOLD stage 2), Mild depression", "medications": "Sertraline, Salbutamol, Tiotropium"}'::jsonb, ARRAY['Motivation: Assess readiness, triggers, previous attempts', 'Pharmacotherapy: Varenicline or NRT combination (avoid bupropion with sertraline)', 'Support: Stop smoking services, behavioural support', 'Link: Mental health and respiratory benefits of quitting'], '**Priming Focus:** Assess motivation, triggers, prior attempts. Discuss combined pharmacotherapy.

**Examiner Lens:** They test your motivational interviewing and safety with drug choices.', 180, 'medium', true, true),
('priming', 'Mrs R - Recurrent UTIs', '71-year-old female with 3 UTIs in past 6 months, asking about long-term antibiotics. CKD (eGFR 42).', '{"name": "Mrs R", "age": 71, "gender": "Female", "pmh": "CKD (eGFR 42)", "medications": "Enalapril, Metformin"}'::jsonb, ARRAY['Pattern: Confirm culture-proven infections, triggers, timing', 'Non-antibiotic: Vaginal oestrogen, hydration, hygiene, D-mannose', 'Prophylaxis: Only if other measures fail, adjust dose for renal function', 'Red flags: Fever, flank pain, haematuria → urgent review'], '**Priming Focus:** Confirm infection pattern. Discuss non-antibiotic strategies first.

**Examiner Lens:** Marks for safe antibiotic use + awareness of renal dosing.', 180, 'medium', true, true),
('priming', 'Mr S - Stopped Statin Due to Muscle Aches', '62-year-old male who stopped atorvastatin due to muscle aches. Type 2 diabetes, hypertension. QRISK3 is 23%.', '{"name": "Mr S", "age": 62, "gender": "Male", "pmh": "Type 2 diabetes, Hypertension", "medications": "Metformin, Antihypertensive"}'::jsonb, ARRAY['Side effects: Explore details, timing, severity, previous trials', 'Alternatives: Lower dose, alternate-day dosing, switch to rosuvastatin', 'Risk: Explain QRISK3 and why statin is important', 'Lifestyle: Diet, weight, exercise, optimise diabetes/BP'], '**Priming Focus:** Explore side effect details. Reassure that statin intolerance is often drug-specific.

**Examiner Lens:** They assess explanation of risk in understandable terms.', 180, 'medium', true, true),
('priming', 'Miss T - Persistent Acne', '18-year-old female with persistent moderate acne despite 6 months treatment. Wants to ''try something stronger''.', '{"name": "Miss T", "age": 18, "gender": "Female", "pmh": "None significant", "medications": "Topical benzoyl peroxide, Oral lymecycline, Microgynon (COCP)"}'::jsonb, ARRAY['Assessment: Severity, scarring risk, adherence, impact on mood', 'Next steps: Add topical retinoid (Treclin/Epiduo) or refer for isotretinoin if severe', 'Pregnancy: Counsel on teratogenicity if using retinoids', 'Expectations: Realistic timeline, skincare advice'], '**Priming Focus:** Explore acne impact, adherence, and triggers. Consider referral for isotretinoin if severe.

**Examiner Lens:** Scores for structured dermatology reasoning and safe prescribing.', 180, 'medium', true, true),
('priming', 'Mr U - Urinary Frequency', '68-year-old male with increased urinary frequency day and night over 3 months. Type 2 diabetes (well-controlled), BPH.', '{"name": "Mr U", "age": 68, "gender": "Male", "pmh": "Type 2 diabetes (well-controlled), BPH", "medications": "Tamsulosin, Metformin"}'::jsonb, ARRAY['Differential: Worsening BPH, UTI, diabetes-related, medication timing', 'History: LUTS pattern, fluid intake, medication timing, infection symptoms', 'Investigations: Urine dip, US KUB with flow studies, U&Es, HbA1c', 'Management: Consider finasteride, tolterodine, bladder diary'], '**Priming Focus:** Could be BPH progression, diuretic timing, or UTI. Check timing of medications.

**Examiner Lens:** Tests structured LUTS reasoning and multimorbidity thinking.', 180, 'medium', true, true),
('priming', 'Mrs V - Vaginal Dryness', '61-year-old female with vaginal dryness, soreness, and pain during intercourse. Postmenopausal for 8 years.', '{"name": "Mrs V", "age": 61, "gender": "Female", "pmh": "Postmenopausal (8 years)", "medications": "None"}'::jsonb, ARRAY['Red flags: Post-menopausal bleeding, discharge, pelvic pain', 'First-line: Topical vaginal oestrogen (pessaries or cream) - safe for most', 'Lifestyle: Lubricants, foreplay, psychosexual counselling', 'Reassurance: Common issue, treatable'], '**Priming Focus:** Explore symptoms, relationships. Rule out red flags (bleeding, discharge).

**Examiner Lens:** Marks for empathy and normalising discussion.', 180, 'medium', true, true),
('priming', 'Mr W - Weight Gain on Olanzapine', '38-year-old male with weight gain and feeling ''fed up and unmotivated''. Schizoaffective disorder. On olanzapine for 1 year.', '{"name": "Mr W", "age": 38, "gender": "Male", "pmh": "Schizoaffective disorder", "medications": "Olanzapine (1 year)"}'::jsonb, ARRAY['Weight: Trajectory, diet, exercise, sleep patterns', 'Metabolic: Check HbA1c, lipids, TFTs (olanzapine increases diabetes risk)', 'Medication: Liaise with psychiatry to consider alternative (aripiprazole)', 'Lifestyle: Weight loss programmes, smoking cessation'], '**Priming Focus:** Explore weight trajectory, diet, exercise. Discuss medication review through psychiatry.

**Examiner Lens:** They test holistic care for mental-physical interface.', 180, 'hard', true, true),
('priming', 'Mr X - Raised LFTs and Alcohol', '47-year-old male with raised liver function tests on health check. Drinks a bottle of wine most nights. Wife is worried.', '{"name": "Mr X", "age": 47, "gender": "Male", "pmh": "None significant", "medications": "None"}'::jsonb, ARRAY['Quantify: Bottle of wine/night ≈ 10 units/day = 70 units/week', 'Assessment: AUDIT-C, CAGE questionnaire, withdrawal risk', 'Harm reduction: Explain liver inflammation, risk of cirrhosis', 'Support: Alcohol services, CBT, vitamin supplements'], '**Priming Focus:** Quantify intake (units), dependence symptoms. Discuss physical + psychological harms.

**Examiner Lens:** Marks for motivational interviewing & harm reduction.', 180, 'hard', true, true),
('priming', 'Miss Y - Tiredness and Missed Periods', '26-year-old female with tiredness for 3 months and missed two periods. Under stress at work. Follows vegan diet.', '{"name": "Miss Y", "age": 26, "gender": "Female", "pmh": "None significant", "medications": "None"}'::jsonb, ARRAY['Differential: Iron/B12 deficiency (vegan), hypothyroidism, PCOS, functional amenorrhoea', 'Investigations: FBC, ferritin, B12, folate, TSH, pregnancy test', 'Lifestyle: Dietitian referral for vegan diet advice, stress management', 'Follow-up: Review results, address underlying cause'], '**Priming Focus:** Think differential: iron/B12 deficiency, hypothyroidism, PCOS, functional amenorrhoea.

**Examiner Lens:** Tests your ability to prioritise differentials and communicate uncertainty.', 180, 'medium', true, true),
('priming', 'Mrs Z - Requesting Repeat Zopiclone', '67-year-old female requesting repeat zopiclone, angry that colleagues refused. Prescribed after husband''s death 2 years ago.', '{"name": "Mrs Z", "age": 67, "gender": "Female", "pmh": "None significant", "medications": "Zopiclone 7.5mg nightly (2 years)"}'::jsonb, ARRAY['Empathise: Acknowledge abrupt stopping was wrong, apologise', 'Risks: Long-term zopiclone causes dependence, falls, cognitive issues', 'Taper: Gradual reduction (alternate evenings or every 3 days initially)', 'Support: CBT-I, IAPT, social prescriber for isolation'], '**Priming Focus:** Long-term zopiclone → dependence, falls risk. Balance compassion with safe prescribing.

**Examiner Lens:** Scores for compassionate limit-setting and deprescribing.', 180, 'hard', true, true),
('priming', 'Mr Ahmed - Chronic Cough', '58-year-old male with chronic cough for three months. Hypertension. On Ramipril 10mg daily. Non-smoker.', '{"name": "Mr Ahmed", "age": 58, "gender": "Male", "pmh": "Hypertension", "medications": "Ramipril 10mg daily"}'::jsonb, ARRAY['Differential: ACE inhibitor cough, GORD, post-nasal drip, asthma, malignancy', 'Timing: Confirm when cough started relative to ramipril', 'Management: Switch to ARB (e.g. losartan)', 'Red flags: Haemoptysis, weight loss, dyspnoea → urgent review'], '**Priming Focus:** Recognise ACE inhibitor–induced cough as likely. Plan to switch to an ARB.

**Examiner Lens:** Examiner looks for methodical differential reasoning and medication awareness.', 180, 'easy', false, true),
('priming', 'Mrs Li - Postnatal Fatigue', '32-year-old female with fatigue and low mood 4 months postpartum. Breastfeeding, no history of depression.', '{"name": "Mrs Li", "age": 32, "gender": "Female", "pmh": "None significant", "medications": "None"}'::jsonb, ARRAY['Differential: Postnatal depression, anaemia, sleep deprivation', 'Screening: EPDS, assess bonding, intrusive thoughts', 'Safeguarding: Self-harm risk, baby safety', 'Support: Perinatal mental health referral, social support'], '**Priming Focus:** Identify possible postnatal depression vs anaemia or sleep deprivation. Ask about bonding, intrusive thoughts.

**Examiner Lens:** Examiner expects holistic biopsychosocial framing.', 180, 'hard', true, true),
('priming', 'Jake - Recurrent Hypos', '16-year-old male with recurrent hypoglycaemia episodes during school. Type 1 diabetes on insulin pump.', '{"name": "Jake", "age": 16, "gender": "Male", "pmh": "Type 1 diabetes", "medications": "Insulin pump"}'::jsonb, ARRAY['Causes: Dosing errors, meal timing, excessive basal rate', 'Assessment: Self-management, school support, risk-taking', 'Safeguarding: Teenage autonomy, adherence, supervision', 'Management: Hypo prevention, glucose monitoring, diabetes nurse liaison'], '**Priming Focus:** Recognise recurrent hypoglycaemia; consider dosing errors, meal timing. Important safeguarding angle.

**Examiner Lens:** Examiner expects structured risk and safeguarding awareness.', 180, 'hard', true, true),
('priming', 'Mr Daniels - Forgetfulness', '70-year-old male with increasing forgetfulness over six months. Wife manages his finances now. He drives.', '{"name": "Mr Daniels", "age": 70, "gender": "Male", "pmh": "None significant", "medications": "None"}'::jsonb, ARRAY['Differential: Early dementia, depression, functional causes', 'Assessment: Daily functioning, driving safety, carer impact', 'Screening: GPCOG, MMSE, 6CIT', 'Referral: Memory clinic for assessment'], '**Priming Focus:** Recognise possible early dementia. Prepare questions on daily functioning, driving, safety.

**Examiner Lens:** Examiner expects methodical, patient-centred reasoning.', 180, 'medium', true, true),
('priming', 'Ms Patel - Palpitations', '42-year-old female with palpitations and trembling, especially mid-morning. Drinks six coffees daily.', '{"name": "Ms Patel", "age": 42, "gender": "Female", "pmh": "None significant", "medications": "None"}'::jsonb, ARRAY['Differential: Anxiety, excessive caffeine, SVT, hyperthyroidism', 'History: Triggers, stress, sleep, anxiety symptoms', 'Management: Reduce caffeine, relaxation techniques, GAD-7 screening', 'Investigations: Consider repeat ECG if persistent'], '**Priming Focus:** Differential: anxiety, excessive caffeine, SVT, hyperthyroidism. Explore triggers.

**Examiner Lens:** Examiner expects structured exclusion of organic causes.', 180, 'easy', false, true),
('priming', 'Clare - Bloating and Pelvic Discomfort', '28-year-old female with new bloating and pelvic discomfort for three weeks. Periods regular, no missed pills.', '{"name": "Clare", "age": 28, "gender": "Female", "pmh": "None significant", "medications": "Combined OCP (Rigevidon)"}'::jsonb, ARRAY['Differential: Functional bloating/IBS, ovarian pathology, GI causes', 'Red flags: Weight loss, change in bowel habit, family history', 'History: GI symptoms, menstrual pattern, triggers', 'Management: Symptom diary, lifestyle advice, safety-netting'], '**Priming Focus:** Think functional bloating/IBS but remain alert for early ovarian cancer signs.

**Examiner Lens:** Examiner expects balanced, structured differential.', 180, 'medium', false, true),
('priming', 'Mr Jones - Erectile Dysfunction on Sertraline', '40-year-old male with difficulty maintaining erections since starting sertraline. Anxiety disorder.', '{"name": "Mr Jones", "age": 40, "gender": "Male", "pmh": "Anxiety", "medications": "Sertraline 100mg daily (3 months)"}'::jsonb, ARRAY['Cause: SSRI-induced sexual dysfunction', 'Explore: Anxiety contribution, relationship dynamics', 'Options: Dose review, switch to alternative (mirtazapine), PDE5 inhibitors', 'Communication: Sensitive, patient-centred approach'], '**Priming Focus:** Recognise SSRI-induced sexual dysfunction. Management options: dose review, switch, or PDE5 inhibitors.

**Examiner Lens:** Examiner expects sensitive communication, shared decision-making.', 180, 'medium', true, true),
('priming', 'Sarah - Thirst and Urinary Frequency', '15-year-old female with increased thirst and frequent urination for a week. Mother notes she looks thinner. Capillary glucose: 24 mmol/L, ketones present.', '{"name": "Sarah", "age": 15, "gender": "Female", "pmh": "None", "medications": "None"}'::jsonb, ARRAY['Emergency: New type 1 diabetes with ketosis', 'Urgent: Hospital referral immediately', 'Communication: Parental communication, explain urgency', 'Safeguarding: Consent, supervision, family support'], '**Priming Focus:** Identify new type 1 diabetes with ketosis risk. Prepare for urgent hospital referral.

**Examiner Lens:** Examiner expects immediate recognition of emergency.', 180, 'hard', true, true),
('priming', 'Mr K - Ongoing Reflux', '55-year-old male with ongoing acid reflux despite omeprazole for six weeks. BMI 30, drinks two pints nightly.', '{"name": "Mr K", "age": 55, "gender": "Male", "pmh": "None significant", "medications": "Omeprazole 20mg"}'::jsonb, ARRAY['Differential: GORD, non-acid reflux, compliance, H. pylori', 'Check: Medication timing (before meals), lifestyle triggers', 'Red flags: Weight loss, dysphagia, vomiting, anaemia', 'Management: Optimise PPI, H. pylori testing, lifestyle advice'], '**Priming Focus:** Differential: GORD, non-acid reflux, compliance issue, H. pylori. Check medication timing.

**Examiner Lens:** Examiner expects safe symptom evaluation, red flag exclusion.', 180, 'easy', false, true);

-- =============================================
-- STEP 8: Import Portfolio Guides (12 guides)
-- =============================================
INSERT INTO portfolio_guides (stage, category, title, content, sort_order, is_pro, published) VALUES
('st1', 'getting-started', 'Welcome to ST1 - Your First Year', '# Welcome to ST1

Congratulations on starting your GP specialty training! ST1 is your foundation year.

## What to Expect
- Hospital posts (usually 6-month rotations)
- Regular educational supervision meetings
- Initial workplace-based assessments (WPBAs)
- Begin building your ePortfolio

## Key Priorities
1. Get organised early - Set up your ePortfolio
2. Build relationships with supervisors
3. Start reflections from day one
4. Complete WPBAs regularly', 1, false, true),
('st1', 'requirements', 'ST1 Portfolio Requirements', '# ST1 Portfolio Requirements

## Mandatory Components

### Workplace-Based Assessments
- Mini-CEX - minimum 6 per year
- CbD - minimum 6 per year
- DOPs - as appropriate
- PSQ - typically 1 per year

### Educational Meetings
- Monthly Educational Supervisor meetings
- Documentation of learning discussions

### Reflective Entries
- Significant Event Analysis - minimum 2 per year
- Learning log entries
- Reflections on feedback

## Tips for Success
- Little and often - regular portfolio entries
- Quality over quantity
- Get feedback from supervisors', 2, false, true),
('st1', 'skills', 'How to Write Good Reflections', '# Writing Effective Reflections

## The Reflection Cycle
1. Description - What happened?
2. Feelings - How did you feel?
3. Evaluation - What was good and bad?
4. Analysis - What sense can you make of it?
5. Conclusion - What else could you have done?
6. Action plan - What will you do differently?

## Common Pitfalls
- Too descriptive without analysis
- Too brief
- Missing the "so what"
- Forgetting patient perspective

## Good Structure
- Set the scene briefly
- Describe key events
- Be honest about emotions
- Analyse deeply
- State specific learning points', 3, false, true),
('st1', 'assessments', 'Guide to WPBAs', '# Workplace-Based Assessments

## Types of WPBAs

### Mini-CEX
- Observation of a patient encounter
- 15-20 minutes + feedback
- Focus: History, examination, communication

### Case-based Discussion
- Discussion of your clinical reasoning
- 20-30 minutes
- Focus: Decision-making, evidence base

### DOPs
- Observation of practical skills
- Examples: Venepuncture, ECG, joint injection

## Getting Good Feedback
- Brief your assessor on what you need
- Choose appropriate cases
- Listen actively without being defensive
- Document feedback promptly', 4, false, true),
('st1', 'skills', 'Consultation Models Explained', '# Consultation Models

## Calgary-Cambridge Model
1. Initiating the session
2. Gathering information
3. Physical examination
4. Explanation and planning
5. Closing the session

## Neighbour''s Model
1. Connecting - Establish rapport
2. Summarising - Demonstrate understanding
3. Handing over - Agree the plan
4. Safety netting - Manage uncertainty
5. Housekeeping - Look after yourself

## Pendleton''s Rules (for feedback)
1. What the learner did well
2. What the observer thinks went well
3. What could be done differently
4. Summary of learning points', 5, true, true),
('st2', 'getting-started', 'Welcome to ST2', '# Welcome to ST2

ST2 marks the transition from foundation to consolidation.

## What Changes
- More time in GP placements
- Increasing clinical independence
- Greater depth of reflection expected
- Preparing for SCA examination

## Key Priorities
1. Maximise GP placement learning
2. Prepare for SCA
3. Broaden your experience
4. Develop clinical independence', 1, false, true),
('st2', 'exams', 'SCA Preparation Guide', '# SCA Preparation

## Exam Format
- 12 cases in a single session
- 10 minutes per case
- Mix of face-to-face and telephone consultations

## Marking Domains
1. Data Gathering
2. Clinical Management
3. Interpersonal Skills

## Preparation Strategy
- 6 months before: Understand format
- 3 months before: Regular practice
- 1 month before: Mock exams
- Final weeks: Maintain confidence

## Practice Techniques
- Form a study group
- Video record and review
- 3-minute priming before each case
- 2-minute diagnosis practice', 2, true, true),
('st2', 'skills', 'Managing Complex Consultations', '# Complex Consultations

## Types of Complexity
- Clinical: Multiple co-morbidities
- Psychosocial: Mental health + physical
- Communication: Breaking bad news

## Frameworks

### The Golden Minute
Let the patient speak uninterrupted for 60-90 seconds

### Prioritisation
1. Safety first
2. Patient priorities
3. Quick wins
4. Plan for later

### ICE Framework
- Ideas
- Concerns
- Expectations

## Time Management
- Acknowledge complexity
- Negotiate focus
- Book follow-up when needed', 3, true, true),
('st3', 'getting-started', 'Welcome to ST3', '# Welcome to ST3

ST3 is your final year of training.

## Objectives
- Managing full breadth of GP
- Working with minimal supervision
- Making complex decisions independently
- Complete examinations (AKT, SCA)

## Key Priorities
1. Complete examinations
2. Fill portfolio gaps
3. Develop independence
4. Plan your career

## ARCP Process
- Mid-year review: Check progress
- Final ARCP: Determines CCT', 1, false, true),
('st3', 'exams', 'AKT Preparation Guide', '# AKT Preparation

## Exam Structure
- 200 questions in 3 hours 10 minutes
- Computer-based, multiple choice
- No negative marking

## Content Split
- Clinical Medicine: ~80%
- Evidence-Based Practice: ~10%
- Organisational: ~10%

## Preparation Strategy
- Use NICE guidelines
- Practice questions daily
- Focus on explanations
- Track performance by topic

## Key Topics
- Cardiovascular
- Respiratory
- Mental health
- MSK
- Dermatology
- Women''s health
- Statistics', 2, true, true),
('st3', 'professional', 'Career Planning', '# Career Planning

## Employment Options

### Salaried GP
- Regular salary with benefits
- Less financial risk
- Good work-life balance

### GP Partner
- Share in practice profits
- Greater autonomy
- More responsibility

### Locum GP
- Flexibility
- Higher day rate
- Less stability

### Portfolio Career
- Combine clinical with other roles
- Teaching, management, research

## Job Hunting Tips
- Start looking 3-4 months before CCT
- Consider practice culture
- Ask about development opportunities', 3, false, true),
('st3', 'skills', 'Preparing for Independent Practice', '# Independent Practice

## Key Mindset Shifts
- Full responsibility for decisions
- Learning to manage uncertainty
- Building your own support networks

## Managing Uncertainty
- Structured safety netting
- Using colleagues wisely
- Knowing your limits

## Building Support
- Find a mentor
- Join local GP groups
- Maintain peer connections
- Prioritise personal wellbeing

## Common Challenges
- Imposter syndrome (very common!)
- Time management
- Practice politics
- Handling complaints', 4, true, true);

-- =============================================
-- VERIFICATION
-- =============================================
SELECT 'Tables created:' as status;
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_name IN ('sca_cases', 'akt_questions', 'portfolio_guides', 'user_profiles', 'user_progress');

SELECT 'Content imported:' as status;
SELECT 'SCA Cases' as type, COUNT(*) as count FROM sca_cases
UNION ALL
SELECT 'Portfolio Guides', COUNT(*) FROM portfolio_guides;
