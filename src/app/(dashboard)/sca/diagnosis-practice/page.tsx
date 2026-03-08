'use client'

import { useState, useEffect, useCallback } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Progress } from '@/components/ui/progress'
import { Input } from '@/components/ui/input'
import Link from 'next/link'

// All 103 diagnoses
const diagnoses = [
  // Respiratory
  "Asthma", "COPD", "Pneumonia", "Pulmonary Embolism", "Bronchiectasis", "Common Cold", "Sinusitis", "Pleurisy", "Pneumothorax",
  // Cardiovascular
  "Hypertension", "Heart Failure", "Atrial Fibrillation", "Angina", "Deep Vein Thrombosis", "High Cholesterol", "Palpitations (Benign)", "Varicose Veins", "Stroke",
  // Gastroenterology
  "GORD (Acid Reflux)", "Irritable Bowel Syndrome", "Coeliac Disease", "Inflammatory Bowel Disease", "Gallstones", "Gastroenteritis", "Diverticular Disease", "Haemorrhoids", "Hiatus Hernia", "Fatty Liver (NAFLD)",
  // MSK
  "Osteoarthritis", "Rheumatoid Arthritis", "Gout", "Low Back Pain", "Tennis Elbow", "Osteoporosis", "Fibromyalgia", "Frozen Shoulder", "Carpal Tunnel Syndrome", "Plantar Fasciitis", "Rotator Cuff Tendinopathy", "Ankle Sprain", "Polymyalgia Rheumatica", "Giant Cell Arteritis",
  // Endocrine
  "Type 2 Diabetes", "Hypothyroidism", "Hyperthyroidism", "Polycystic Ovary Syndrome",
  // Dermatology
  "Eczema", "Psoriasis", "Acne", "Rosacea", "Shingles", "Cellulitis", "Urticaria (Hives)", "Fungal Skin Infection", "Contact Dermatitis", "Scabies", "Impetigo",
  // Mental Health
  "Depression", "Generalised Anxiety Disorder", "Panic Disorder", "Insomnia", "PTSD (Post-Traumatic Stress Disorder)", "OCD", "Eating Disorder", "Bipolar Disorder", "Substance Misuse",
  // Neurology
  "Migraine", "Tension Headache", "Epilepsy", "BPPV (Vertigo)", "Bell's Palsy", "TIA (Transient Ischaemic Attack)", "Parkinson's Disease", "Dementia", "Multiple Sclerosis",
  // Urology/Renal
  "Urinary Tract Infection", "Kidney Stones", "Benign Prostatic Hyperplasia", "Chronic Kidney Disease",
  // Women's Health
  "Menopause", "Endometriosis", "Heavy Periods", "Vaginal Thrush", "Contraception", "Cervical Smear Abnormality", "Pelvic Organ Prolapse", "Mastitis",
  // Men's Health
  "Erectile Dysfunction", "Epididymitis",
  // ENT & Eyes
  "Otitis Media (Ear Infection)", "Allergic Rhinitis (Hay Fever)", "Tonsillitis", "Conjunctivitis", "Otitis Externa (Swimmer's Ear)", "Glue Ear", "Nasal Polyps",
  // Paediatrics
  "Bronchiolitis", "Childhood Eczema", "Constipation in Children", "Febrile Illness in Children", "Croup", "Hand Foot and Mouth Disease", "Viral Wheeze", "Colic", "Teething",
  // Other
  "Iron Deficiency Anaemia", "B12 Deficiency", "Vitamin D Deficiency", "Sleep Apnoea", "CFS/ME", "Obesity", "Anaphylaxis", "Lyme Disease"
]

// Categorized for browsing/selection
const diagnosisCategories: { category: string; diagnoses: string[] }[] = [
  { category: "Respiratory", diagnoses: ["Asthma", "COPD", "Pneumonia", "Pulmonary Embolism", "Bronchiectasis", "Common Cold", "Sinusitis", "Pleurisy", "Pneumothorax"] },
  { category: "Cardiovascular", diagnoses: ["Hypertension", "Heart Failure", "Atrial Fibrillation", "Angina", "Deep Vein Thrombosis", "High Cholesterol", "Palpitations (Benign)", "Varicose Veins", "Stroke"] },
  { category: "Gastroenterology", diagnoses: ["GORD (Acid Reflux)", "Irritable Bowel Syndrome", "Coeliac Disease", "Inflammatory Bowel Disease", "Gallstones", "Gastroenteritis", "Diverticular Disease", "Haemorrhoids", "Hiatus Hernia", "Fatty Liver (NAFLD)"] },
  { category: "MSK", diagnoses: ["Osteoarthritis", "Rheumatoid Arthritis", "Gout", "Low Back Pain", "Tennis Elbow", "Osteoporosis", "Fibromyalgia", "Frozen Shoulder", "Carpal Tunnel Syndrome", "Plantar Fasciitis", "Rotator Cuff Tendinopathy", "Ankle Sprain", "Polymyalgia Rheumatica", "Giant Cell Arteritis"] },
  { category: "Endocrine", diagnoses: ["Type 2 Diabetes", "Hypothyroidism", "Hyperthyroidism", "Polycystic Ovary Syndrome"] },
  { category: "Dermatology", diagnoses: ["Eczema", "Psoriasis", "Acne", "Rosacea", "Shingles", "Cellulitis", "Urticaria (Hives)", "Fungal Skin Infection", "Contact Dermatitis", "Scabies", "Impetigo"] },
  { category: "Mental Health", diagnoses: ["Depression", "Generalised Anxiety Disorder", "Panic Disorder", "Insomnia", "PTSD (Post-Traumatic Stress Disorder)", "OCD", "Eating Disorder", "Bipolar Disorder", "Substance Misuse"] },
  { category: "Neurology", diagnoses: ["Migraine", "Tension Headache", "Epilepsy", "BPPV (Vertigo)", "Bell's Palsy", "TIA (Transient Ischaemic Attack)", "Parkinson's Disease", "Dementia", "Multiple Sclerosis"] },
  { category: "Urology/Renal", diagnoses: ["Urinary Tract Infection", "Kidney Stones", "Benign Prostatic Hyperplasia", "Chronic Kidney Disease"] },
  { category: "Women's Health", diagnoses: ["Menopause", "Endometriosis", "Heavy Periods", "Vaginal Thrush", "Contraception", "Cervical Smear Abnormality", "Pelvic Organ Prolapse", "Mastitis"] },
  { category: "Men's Health", diagnoses: ["Erectile Dysfunction", "Epididymitis"] },
  { category: "ENT & Eyes", diagnoses: ["Otitis Media (Ear Infection)", "Allergic Rhinitis (Hay Fever)", "Tonsillitis", "Conjunctivitis", "Otitis Externa (Swimmer's Ear)", "Glue Ear", "Nasal Polyps"] },
  { category: "Paediatrics", diagnoses: ["Bronchiolitis", "Childhood Eczema", "Constipation in Children", "Febrile Illness in Children", "Croup", "Hand Foot and Mouth Disease", "Viral Wheeze", "Colic", "Teething"] },
  { category: "Other", diagnoses: ["Iron Deficiency Anaemia", "B12 Deficiency", "Vitamin D Deficiency", "Sleep Apnoea", "CFS/ME", "Obesity", "Anaphylaxis", "Lyme Disease"] },
]

// Model explanations for each diagnosis (written for reading age 11, fully formed sentences)
const diagnosisExplanations: Record<string, string> = {
  // Respiratory
  "Asthma": `Name it: You have asthma. This means the tubes that carry air in and out of your lungs get swollen and tight sometimes, which makes you wheeze and cough.

Link it: The symptoms you described – your cough at night, getting breathless when you exercise or when it’s cold, and feeling better when you use your blue inhaler – all fit with asthma.

Plan it: We’ll make sure you have the right inhalers: a reliever for when you’re breathless and a preventer to use every day. I’ll check your inhaler technique and we’ll talk about avoiding your triggers. We’ll also make you an action plan so you know what to do if things get worse.

Safety net it: If your breathlessness gets worse, you need your reliever more than usual, you’re waking at night with it, or you can’t speak in full sentences, you need to seek urgent help.`,

  "COPD": `Name it: You have COPD. This means the airways in your lungs have been damaged over time, often from smoking, so they’re narrower and less stretchy. That makes it harder to breathe.

Link it: Your long-standing breathlessness, cough with phlegm, and your smoking history all point to this condition.

Plan it: Stopping smoking is the most important step. We’ll give you inhalers to help open your airways, and you may benefit from pulmonary rehab – a programme of exercises and education. You should have your flu and pneumonia vaccines. We’ll treat chest infections early and keep an eye on your lung function with tests.

Safety net it: If you become severely breathless, get chest pain, feel confused, or your lips turn blue, call 999 or go to A&E.`,

  "Pneumonia": `Name it: You have pneumonia. This is an infection in your lungs where the tiny air sacs fill with fluid, which makes it hard to breathe and can make you feel very unwell.

Link it: Your fever, cough with phlegm, and the sharp pain in your chest when you breathe in all fit with pneumonia.

Plan it: If it’s caused by bacteria, we’ll give you antibiotics. You need plenty of fluids and rest. Some people need to go to hospital if they’re very breathless, have low oxygen levels, or are frail.

Safety net it: If your breathlessness gets worse, you become confused, or you can’t keep fluids down, you need urgent assessment.`,

  "Pulmonary Embolism": `Name it: You have a pulmonary embolism. This means a blood clot has travelled to your lung and is blocking some of the blood flow there.

Link it: Your sudden breathlessness and chest pain, along with things like recent surgery, being immobile, pregnancy, cancer, or hormone treatment, can increase the risk of clots.

Plan it: You need urgent hospital tests – blood tests and a scan – to confirm it. If it’s confirmed, you’ll be started on blood thinners. How long you need them depends on what caused the clot.

Safety net it: If you collapse, or your breathlessness or chest pain gets worse, call 999 immediately.`,

  "Bronchiectasis": `Name it: You have bronchiectasis. This means the airways in your lungs are wider and scarred than normal, so mucus collects there and you’re more likely to get repeated chest infections.

Link it: Your long-standing cough with lots of phlegm and your history of repeated infections fit with this. Sometimes it follows a bad lung infection in the past.

Plan it: We’ll teach you chest physiotherapy and airway clearance techniques to help clear the mucus. You may need inhalers if you wheeze. It’s important to have your vaccines and to start antibiotics quickly when you have a flare. We may refer you to a lung specialist.

Safety net it: If you get a high fever, become more breathless, or cough up blood, you need urgent review.`,

  "Common Cold": `Name it: You have a common cold. This is a viral infection of your nose and throat that usually clears up on its own.

Link it: Your sore throat, runny nose, mild fever, and the fact it’s only been a few days all fit with a cold.

Plan it: Rest, drink plenty of fluids, and take simple painkillers like paracetamol if you need them. Steam or decongestants can help. You don’t need antibiotics – they don’t work for viruses.

Safety net it: If your fever is high for more than three to five days, or you get breathless, chest pain, or confused, come back for a review.`,

  "Sinusitis": `Name it: You have sinusitis. This means the lining of your sinuses – the spaces behind your cheeks and forehead – is inflamed or infected, which causes pain, pressure, and a blocked nose.

Link it: The pressure in your face, your blocked nose, reduced sense of smell, and thick discharge all fit with sinusitis.

Plan it: Try nasal saline rinses and steam. A steroid nasal spray can help. Take painkillers if you need them. We might consider antibiotics if it’s been going on for more than ten days and is severe.

Safety net it: If you get swelling around your eye, changes in your vision, or a severe headache with fever, you need urgent review.`,

  "Pleurisy": `Name it: You have pleurisy. This means the thin lining around your lungs has become inflamed, which causes sharp pain when you breathe in.

Link it: The sharp, stabbing pain in your chest that gets worse when you take a deep breath, and the fact that it may have started after a chest infection or cold, all fit with pleurisy.

Plan it: We need to find the cause – often it’s a viral infection that will get better on its own. We’ll give you pain relief. If we suspect a bacterial infection or a clot, we’ll do further tests. Rest and painkillers usually help.

Safety net it: If you become breathless, get a high fever, cough up blood, or the pain spreads, you need urgent assessment.`,

  "Pneumothorax": `Name it: You have a pneumothorax. This means air has leaked into the space between your lung and your chest wall, so part of your lung has collapsed. That makes it harder to breathe.

Link it: Your sudden breathlessness and chest pain, and the fact that you may be tall and thin, have had a chest injury, or have an underlying lung condition, all fit with a pneumothorax.

Plan it: Small pneumothoraces can sometimes be managed at home with observation. Larger ones need hospital treatment – we may need to remove the air with a needle or a drain. You must not fly until it’s fully resolved.

Safety net it: If your breathlessness gets worse, you have severe pain, or you feel dizzy or collapse, go to A&E immediately.`,

  // Cardiovascular
  "Hypertension": `Name it: You have high blood pressure, also called hypertension. This means the pressure in your blood vessels is consistently higher than it should be, which over time can strain your heart, brain, kidneys, and eyes.

Link it: Your blood pressure readings, along with things like your weight, family history, ethnicity, and whether you smoke, all affect your risk.

Plan it: We’ll focus on lifestyle changes first – cutting down salt, losing weight if needed, exercising, and cutting back on alcohol and smoking. If needed, we’ll add medication. We’ll monitor your blood pressure with home or clinic checks.

Safety net it: If you get symptoms like headache with blurred vision, chest pain, or sudden breathlessness, you need urgent assessment.`,

  "Heart Failure": `Name it: You have heart failure. This means your heart isn’t pumping as well as it used to, so fluid can build up in your lungs and legs.

Link it: Your breathlessness when you exert yourself or lie flat, the swelling in your ankles, and any rapid weight gain all fit with heart failure.

Plan it: We’ll give you tablets to help your body get rid of extra fluid and to support your heart. You’ll need to weigh yourself daily and watch your salt intake. It’s important to have your flu and pneumonia vaccines. We’ll see you regularly to check how you’re doing.

Safety net it: If you suddenly become breathless at rest, get chest pain, have fast palpitations, or gain weight quickly, you need urgent help.`,

  "Atrial Fibrillation": `Name it: You have atrial fibrillation. This means the top chambers of your heart are beating in a fast, irregular way instead of a steady rhythm.

Link it: The palpitations, breathlessness, and tiredness you’ve noticed fit with this. Sometimes it’s picked up by chance when we check your pulse or do a heart tracing.

Plan it: We need to reduce your risk of stroke, so we may start you on a blood thinner. We’ll also look at controlling your heart rate or rhythm. Things like alcohol and an overactive thyroid can trigger it, so we’ll check those.

Safety net it: If you get chest pain, collapse, or severe breathlessness, you need urgent care.`,

  "Angina": `Name it: You have angina. This means the arteries that supply blood to your heart have narrowed, so when you exert yourself or get stressed, your heart doesn’t get enough blood. That causes tightness or discomfort in your chest, which usually eases when you rest.

Link it: The chest tightness you get when you’re active, and things like high blood pressure, high cholesterol, smoking, or diabetes, all fit with angina.

Plan it: We can give you a spray to use when you get symptoms. We’ll work on your risk factors and may start you on a statin and aspirin. We may refer you to a heart specialist for further tests.

Safety net it: If the pain comes on at rest, lasts a long time, or you get breathless, sweaty, or sick with it, treat it as an emergency and call 999.`,

  "Deep Vein Thrombosis": `Name it: You have a deep vein thrombosis, or DVT. This means there’s a blood clot in one of the deep veins in your leg, which causes pain and swelling.

Link it: The swelling and pain in one leg, along with things like recent surgery, being immobile, cancer, pregnancy, or hormone treatment, increase the risk of clots.

Plan it: You need urgent assessment and a scan to confirm it. If it’s confirmed, we’ll start you on blood thinners. It helps to keep moving and to drink plenty of fluids.

Safety net it: If you suddenly get chest pain, breathlessness, or collapse, it could mean the clot has travelled to your lung. Call 999.`,

  "High Cholesterol": `Name it: You have high cholesterol. This means there are higher levels of fats in your blood than we’d like. Over time, this can lead to furring of the arteries and increase your risk of heart disease and stroke.

Link it: Your blood test results, along with your age, family history, and other risk factors, tell us how much we need to reduce it.

Plan it: We’ll start with lifestyle changes – a healthy diet, weight loss if needed, exercise, and stopping smoking. If your risk is high enough, we’ll add a statin tablet. We’ll recheck your cholesterol and liver function.

Safety net it: If you get new chest pain or symptoms like weakness or slurred speech, seek urgent review.`,

  "Palpitations (Benign)": `Name it: You have palpitations that appear to be benign – meaning they’re not caused by a serious heart problem. This means you’re aware of your heart beating, often described as fluttering, pounding, or missing a beat.

Link it: The way you’ve described the sensation, whether it comes and goes, and the fact that your heart tracing and examination look normal, suggest these are harmless. Things like caffeine, stress, or anxiety can trigger them.

Plan it: We’ll reassure you. Cutting down on caffeine, managing stress, and staying hydrated can help. We may suggest a 24-hour heart monitor if we need to capture an episode. Avoid triggers you’ve noticed.

Safety net it: If you get chest pain, collapse, severe breathlessness, or the palpitations last a long time without stopping, seek urgent care.`,

  "Varicose Veins": `Name it: You have varicose veins. This means the veins in your legs have become swollen and twisted because the valves that normally keep blood flowing upwards aren’t working properly.

Link it: The visible swollen veins, the aching or heaviness in your legs, especially after standing, and any family history, fit with varicose veins. They’re more common in pregnancy and with age.

Plan it: Regular exercise, elevating your legs when resting, and compression stockings can help with symptoms. Weight loss if needed can reduce pressure. If they’re causing significant problems, we can refer you for treatment – that might be injections or surgery.

Safety net it: If a vein becomes hard, red, and painful, or you develop a sore or ulcer on your leg, come back for a review.`,

  "Stroke": `Name it: You’ve had a stroke. This means the blood supply to part of your brain was cut off, so that area of brain was damaged. The symptoms depend on which part was affected.

Link it: The sudden onset of your symptoms – whether that was weakness, slurred speech, facial drooping, or vision problems – and the fact that they’ve persisted, fit with a stroke. Things like high blood pressure, diabetes, smoking, or an irregular heartbeat increase the risk.

Plan it: You need specialist care in hospital. We’ll work on preventing another stroke – that might mean blood thinners, blood pressure tablets, or a statin. You’ll need rehabilitation to help with recovery. You must not drive until we’ve assessed you.

Safety net it: If your symptoms get worse, or you have another sudden episode, call 999 immediately.`,

  // Gastroenterology
  "GORD (Acid Reflux)": `Name it: You have acid reflux, also called GORD. This means stomach acid is flowing back up into your gullet, which causes the burning feeling and sour taste you’ve been getting.

Link it: The burning you get after meals or when you lie down, and the things that make it worse – like coffee, spicy food, or alcohol – all fit with acid reflux.

Plan it: We’ll start with lifestyle changes: smaller meals, losing weight if needed, and avoiding eating late at night or your known triggers. We’ll give you a tablet to reduce stomach acid. We’ll review how you’re getting on.

Safety net it: If you have difficulty swallowing, lose weight without trying, vomit blood, or pass black stools, you need urgent assessment and may need a camera test.`,

  "Irritable Bowel Syndrome": `Name it: You have irritable bowel syndrome, or IBS. This is a condition where your gut is more sensitive than usual, so you get pain and changes in your bowel habit – sometimes looser, sometimes harder – and the pain often improves when you open your bowels.

Link it: The pattern of your symptoms, how they relate to stress or certain foods, and the fact that we’ve ruled out serious causes, all fit with IBS.

Plan it: We’ll reassure you that it’s not dangerous. We’ll look at your diet – regular meals, the right amount of fibre, and we might try a low FODMAP diet. Stress management can help. We can give you targeted medicines for diarrhoea, constipation, or cramping.

Safety net it: If you lose weight, pass blood, get symptoms at night, become anaemic, or your symptoms change significantly, we need to re-evaluate.`,

  "Coeliac Disease": `Name it: You have coeliac disease. This means your body reacts to gluten – a protein in wheat, barley, and rye – and that reaction damages the lining of your small bowel.

Link it: Your bloating, diarrhoea, weight loss, low iron, and family history all fit with coeliac disease.

Plan it: You’ll need to follow a strict gluten-free diet for life. We’ll refer you to a dietitian and check for any vitamin or mineral deficiencies. We’ll do follow-up blood tests to make sure the diet is working.

Safety net it: If you keep losing weight or have severe symptoms, come back. Important: don’t stop eating gluten before we’ve done the tests, or the results won’t be accurate.`,

  "Inflammatory Bowel Disease": `Name it: You have inflammatory bowel disease, or IBD. This means there’s ongoing inflammation in your gut – either Crohn’s disease or ulcerative colitis – which causes diarrhoea, pain, and sometimes blood in your stools.

Link it: Your long-standing loose stools, blood or mucus, weight loss, and any joint or skin problems fit with IBD.

Plan it: This is managed by a specialist. You may need steroids or other medicines to calm the inflammation. We’ll do blood and stool tests and make sure you know when to seek help.

Safety net it: If you get severe pain, heavy bleeding, a high fever, or become dehydrated, you need urgent care.`,

  "Gallstones": `Name it: You have gallstones. These are small, hard stones that form in your gallbladder. When they cause problems, they can block the flow of bile and cause pain, especially after fatty meals.

Link it: The pain you get in the upper right part of your tummy after eating, sometimes spreading to your back or shoulder, and the nausea, all fit with gallstones.

Plan it: We’ll give you pain relief and advise a low-fat diet. We’ll arrange an ultrasound scan. If the attacks keep happening or are severe, we may refer you for surgery to remove the gallbladder. We’ll also watch for signs of infection or inflammation.

Safety net it: If you get a fever, your skin or eyes turn yellow, or you have persistent severe pain or vomiting, you need urgent assessment.`,

  "Gastroenteritis": `Name it: You have gastroenteritis. This is an infection of your gut that causes diarrhoea and sometimes vomiting.

Link it: The sudden onset, the fact that others around you may have been unwell or you ate something that might have triggered it, and that it’s only been a short time, all fit with gastroenteritis.

Plan it: The main thing is to drink plenty of fluids to avoid dehydration. Stick to simple foods. Wash your hands often to avoid spreading it. You usually don’t need antibiotics unless there’s a specific reason.

Safety net it: If you see blood in your stool, have a high fever, show signs of dehydration, or it lasts more than a week, come back for a review.`,

  "Diverticular Disease": `Name it: You have diverticular disease. This means small pouches have formed in the lining of your bowel. They’re common as we get older and often don’t cause any problems. When they do cause symptoms, it’s usually pain and changes in your bowel habit.

Link it: The tummy pain, especially on the left side, the bloating, and the change in your bowel habit you’ve described, fit with diverticular disease. It’s more common in people over 50 and in those who don’t eat much fibre.

Plan it: We’ll advise a high-fibre diet and plenty of fluids. Simple pain relief can help. We’ll make sure we’ve ruled out anything more serious. If you have repeated flare-ups, we may refer you for further tests.

Safety net it: If you get a high fever, severe pain, or pass a lot of blood, you need urgent assessment – that could be diverticulitis or a complication.`,

  "Haemorrhoids": `Name it: You have haemorrhoids, also called piles. These are swollen blood vessels inside or around your back passage. They can cause bleeding, itch, and discomfort, especially when you open your bowels.

Link it: The bright red blood when you pass a stool, the itch or discomfort, and any straining or constipation you’ve had, fit with haemorrhoids. They’re common in pregnancy and with age.

Plan it: Increase fibre and fluids to avoid constipation. Avoid straining. Creams or suppositories can help with symptoms. Sitting in a warm bath can ease discomfort. If they’re persistent or severe, we may refer you for treatment.

Safety net it: If you get a lot of bleeding, pain that doesn’t ease, or you have weight loss or a change in bowel habit, come back so we can rule out other causes.`,

  "Hiatus Hernia": `Name it: You have a hiatus hernia. This means part of your stomach has pushed up through the opening in your diaphragm into your chest. That can let acid flow back into your gullet.

Link it: The heartburn, especially when you lie down or bend over, the regurgitation, and any symptoms after eating or drinking, fit with a hiatus hernia. They’re more common as we get older and often run in families.

Plan it: Small meals, avoiding eating late, and propping up the head of your bed can help. We’ll give you medication to reduce stomach acid. Losing weight if needed and avoiding tight clothing can reduce pressure.

Safety net it: If you have difficulty swallowing, lose weight without trying, vomit blood, or pass black stools, you need urgent assessment.`,

  "Fatty Liver (NAFLD)": `Name it: You have fatty liver disease, also called NAFLD. This means fat has built up in your liver. It’s often linked to being overweight and usually doesn’t cause symptoms in the early stages.

Link it: Your blood test results and scan, along with things like your weight, diet, and whether you drink alcohol, fit with fatty liver. It’s often picked up by chance when we do tests for other reasons.

Plan it: The main treatment is lifestyle changes – losing weight if needed, exercising, and cutting down or stopping alcohol. This can actually reverse the condition. We’ll monitor your liver function and may check for other complications.

Safety net it: If you develop yellow skin or eyes, abdominal swelling, or confusion, come back urgently.`,

  // MSK
  "Osteoarthritis": `Name it: You have osteoarthritis. This means the cushioning cartilage in your joints has worn down over time, so the bones rub together. That causes pain and stiffness, especially when you use the joint.

Link it: Your age, the fact that it affects your weight-bearing joints like knees or hips, the short-lived stiffness in the morning, and that it gets worse with activity, all fit with osteoarthritis.

Plan it: Exercise and strengthening the muscles around the joint really help. Losing weight if you’re carrying extra reduces the strain. We can give you simple painkillers or a gel to rub on. Pacing yourself and using aids if needed can help. We may refer you to physiotherapy.

Safety net it: If a joint suddenly becomes hot and swollen, you get a joint giving way, or things get much worse, come back for a review.`,

  "Rheumatoid Arthritis": `Name it: You have rheumatoid arthritis. This is a condition where your immune system attacks your joints, causing inflammation, pain, and stiffness.

Link it: The fact that it affects your smaller joints, your morning stiffness that lasts more than half an hour, the symmetry – both sides affected – and the swelling, all fit with rheumatoid arthritis.

Plan it: You need to see a rheumatologist urgently. They’ll start you on medicines that slow down the disease. We’ll help with pain control and do blood tests. Early treatment makes a big difference.

Safety net it: If things get worse quickly or you develop systemic symptoms like fever or weight loss, come back promptly.`,

  "Gout": `Name it: You have gout. This is when tiny crystals of uric acid form in a joint and cause sudden, severe inflammation. It often affects the big toe, ankle, or knee.

Link it: The sudden, very painful, hot, swollen joint you’ve described, any past flares, and things like your diet or certain tablets such as water tablets, all fit with gout.

Plan it: We’ll treat this flare with anti-inflammatory tablets or other medicines. Ice and rest help. If you get repeated attacks, we can start a tablet to lower your uric acid long term. We’ll also give you lifestyle advice.

Safety net it: If you get a fever, the redness spreads, or it doesn’t improve, we need to consider infection. Come back for a review.`,

  "Low Back Pain": `Name it: You have low back pain. In most cases this is mechanical – meaning it’s from strain, posture, or lifting – and it usually improves over a few weeks.

Link it: The way it came on – perhaps after lifting or poor posture – and the fact that you don’t have any red flag symptoms, fit with simple back pain.

Plan it: Keep moving as much as you can. Take simple painkillers. A heat pack and some gentle core exercises can help. Avoid staying in bed for long periods – that can make it worse.

Safety net it: If you get weakness or numbness in your legs, lose control of your bladder or bowels, or get numbness around your bottom, this could be an emergency. Go to A&E.`,

  "Tennis Elbow": `Name it: You have tennis elbow. This is when the tendons on the outside of your elbow become irritated from overuse, often from gripping or lifting.

Link it: The pain you get when you grip or lift, and the tenderness on the outside of your elbow, fit with tennis elbow.

Plan it: We’ll advise you to modify activities that make it worse. Ice and anti-inflammatory gel can help. Physiotherapy exercises and a strap can support recovery. We’d only consider a steroid injection if it’s persistent.

Safety net it: If your function gets worse or you have severe pain at night, come back for a review.`,

  "Osteoporosis": `Name it: You have osteoporosis. This means your bones have become weaker and more likely to break than they should be.

Link it: Your age, and things like having taken steroid tablets, going through the menopause, being underweight, or having a family history of fractures, all increase the risk.

Plan it: We’ll make sure you have enough calcium and vitamin D. Weight-bearing exercise helps strengthen bones. We’ll talk about preventing falls. Depending on your risk, we may suggest a bone scan and a tablet to strengthen your bones.

Safety net it: If you get new back pain after a minor bump or fall, we need to check for a spinal fracture.`,

  "Fibromyalgia": `Name it: You have fibromyalgia. This is a condition where your nervous system becomes more sensitive to pain, so you feel widespread aches, often with poor sleep and tiredness.

Link it: Your long-standing pain in many areas, the fact that your blood tests don’t show inflammation, your poor sleep, and the brain fog you describe, all fit with fibromyalgia.

Plan it: Understanding the condition helps. Graded exercise, good sleep habits, and pacing yourself are important. Some people benefit from psychological approaches. Medicines like amitriptyline or certain antidepressants can help some people.

Safety net it: If you develop new focal symptoms like weakness or numbness, or things change significantly, we’ll reassess to make sure nothing else is going on.`,

  "Frozen Shoulder": `Name it: You have a frozen shoulder. This means the capsule around your shoulder joint has become stiff and tight, so your shoulder is painful and you can’t move it as freely as you used to.

Link it: The pain and stiffness you’ve described, especially when you try to reach up or behind your back, and the fact that it came on gradually, fit with a frozen shoulder. It often happens after an injury or period of not using the shoulder much.

Plan it: Pain relief and gentle stretching exercises are the main treatments. Physiotherapy can help. It often takes many months to improve, but most people do get better. We might consider a steroid injection if the pain is severe.

Safety net it: If you develop weakness, numbness, or the pain spreads down your arm, come back for a review.`,

  "Carpal Tunnel Syndrome": `Name it: You have carpal tunnel syndrome. This means the nerve that runs through your wrist to your hand is being squeezed. That causes tingling, numbness, and sometimes pain in your thumb and fingers.

Link it: The tingling or numbness in your thumb, index, and middle fingers, especially at night or when holding things, and the fact that shaking your hand can help, fit with carpal tunnel syndrome. It’s more common in pregnancy, with diabetes, or with repetitive wrist use.

Plan it: A wrist splint at night can help. Avoiding activities that make it worse and taking breaks can help. We may refer you for a nerve test. If it’s severe or doesn’t improve, a small operation can release the nerve.

Safety net it: If you develop weakness in your hand, or the numbness spreads up your arm, come back for a review.`,

  "Plantar Fasciitis": `Name it: You have plantar fasciitis. This means the band of tissue that runs along the bottom of your foot from your heel to your toes has become inflamed. It causes pain in your heel, especially when you first get up in the morning.

Link it: The heel pain when you take your first steps, the improvement as you move around, and any recent increase in walking or standing, fit with plantar fasciitis.

Plan it: Rest, ice, and stretching exercises for the calf and foot can help. Supportive footwear and avoiding going barefoot can reduce strain. We may refer you to physiotherapy. A heel pad or orthotics can help some people. It often takes several months to improve.

Safety net it: If the pain is severe, you have swelling or redness, or you have numbness in your foot, come back for a review.`,

  "Rotator Cuff Tendinopathy": `Name it: You have rotator cuff tendinopathy. This means the tendons that help you move your shoulder have become irritated or damaged, often from overuse or age. It causes pain when you lift your arm or reach behind your back.

Link it: The pain when you lift your arm, especially to the side or behind you, and the tenderness over your shoulder, fit with rotator cuff problems. It’s common with repetitive overhead activities or as we get older.

Plan it: Rest from activities that make it worse, but keep the shoulder moving to avoid stiffness. Pain relief and ice can help. Physiotherapy with specific exercises is often the main treatment. We may consider a steroid injection if it’s persistent.

Safety net it: If you develop sudden weakness, a complete inability to move your arm, or the pain follows an injury, come back for a review.`,

  "Ankle Sprain": `Name it: You have an ankle sprain. This means you’ve stretched or torn the ligaments that support your ankle, usually by twisting it. The ligaments are the bands that hold your bones together.

Link it: The way you injured it – twisting your ankle – the swelling, bruising, and pain you’ve described, fit with a sprain. It’s one of the most common injuries.

Plan it: Follow the RICE approach: Rest, Ice, Compression, and Elevation. Take painkillers if needed. Start gentle movement as soon as you can. Most sprains improve over a few weeks. Physiotherapy can help with strengthening and balance.

Safety net it: If you can’t weight-bear at all, the pain is severe, you heard a pop, or the ankle looks deformed, you need an X-ray to rule out a fracture.`,

  "Polymyalgia Rheumatica": `Name it: You have polymyalgia rheumatica, or PMR. This is a condition that causes stiffness and pain in your shoulders and hips. It usually comes on quickly over a few weeks and is more common in people over 70.

Link it: The morning stiffness that lasts more than 45 minutes, the pain in both shoulders and hips, and the fact that you may feel generally unwell or have lost weight, fit with PMR. Your blood tests show inflammation.

Plan it: We’ll start you on a low dose of steroid tablets, which usually work very quickly. We’ll need to rule out giant cell arteritis, which can affect the blood vessels to your head. We’ll reduce the steroids slowly over many months.

Safety net it: If you get a new severe headache, jaw pain when chewing, or visual changes, come back urgently – that could be giant cell arteritis.`,

  "Giant Cell Arteritis": `Name it: You have giant cell arteritis, or GCA. This is when the blood vessels in your head, especially around your temples, become inflamed. It causes headache and can affect your vision if not treated quickly.

Link it: The new headache, often over your temples, the tenderness when you touch your scalp, and any jaw pain when chewing or visual changes, fit with GCA. It’s more common in people over 50 and often links with polymyalgia.

Plan it: You need to start high-dose steroids urgently to protect your vision. We’ll refer you to a specialist for confirmation. The steroids are usually needed for at least 18 months and we’ll reduce them slowly. We’ll monitor you closely.

Safety net it: If you get sudden vision loss, double vision, or your headache gets much worse, go to A&E immediately. This is an emergency.`,

  // Endocrine
  "Type 2 Diabetes": `Name it: You have type 2 diabetes. This means your blood sugar is too high because your body isn’t using insulin as well as it should, or isn’t making enough of it.

Link it: The thirst, passing urine more often, and tiredness you’ve noticed fit with diabetes. Sometimes it’s picked up by chance on a blood test.

Plan it: We’ll focus on lifestyle – a healthy diet, losing weight if needed, being more active, and stopping smoking. We may add tablets or insulin. You’ll need regular checks of your eyes, feet, and kidneys.

Safety net it: If your blood sugars are very high, you’re vomiting, feeling drowsy, or have abdominal pain, you need urgent review.`,

  "Hypothyroidism": `Name it: You have an underactive thyroid, also called hypothyroidism. This means your thyroid gland isn’t making enough hormone, so your metabolism slows down.

Link it: The tiredness, weight gain, feeling cold, constipation, and dry skin you’ve described all fit with an underactive thyroid.

Plan it: We’ll give you a hormone replacement tablet called levothyroxine. We’ll monitor your blood tests and adjust the dose. Your symptoms should improve gradually over a few weeks.

Safety net it: If you get chest pain or palpitations when we increase the dose, or you become severely lethargic, come back for a review.`,

  "Hyperthyroidism": `Name it: You have an overactive thyroid, also called hyperthyroidism. This means your thyroid gland is making too much hormone, so your metabolism speeds up.

Link it: The weight loss, feeling hot, tremor, palpitations, anxiety, and diarrhoea you’ve described all fit with an overactive thyroid.

Plan it: We’ll start you on tablets to slow down your thyroid and may add a beta blocker for symptoms. You’ll need to see a specialist for a longer-term plan, which might include radioiodine treatment or surgery.

Safety net it: If you get severe palpitations, chest pain, or fever with neck pain, you need urgent review.`,

  "Polycystic Ovary Syndrome": `Name it: You have polycystic ovary syndrome, or PCOS. This is a hormonal imbalance that can cause irregular periods, acne, excess hair, and sometimes difficulty with weight. It’s also linked to insulin resistance.

Link it: Your irregular cycle, any acne or hair changes, and your weight all fit with PCOS.

Plan it: Lifestyle changes and weight loss if needed can help a lot. We can regulate your cycle with the pill or progesterone. We’ll help with skin and hair if needed, and screen for metabolic risks. If you’re trying for a baby, we can refer you for fertility support.

Safety net it: If you have heavy or prolonged bleeding, or severe pain, come back for a review.`,

  // Dermatology
  "Eczema": `Name it: You have eczema. This means the skin barrier is inflamed and doesn’t work as well as it should, so you get dry, itchy patches.

Link it: The pattern of your rash, the things that make it worse – like certain soaps or stress – and any history of allergy or asthma in the family, all fit with eczema.

Plan it: Use moisturiser regularly to protect your skin. When it flares, we’ll give you a steroid cream to calm it down. Try to avoid your known triggers. If you see signs of infection, we need to review you.

Safety net it: If the redness spreads, the skin starts oozing, or you get a fever, you may have an infection. Come back for a review.`,

  "Psoriasis": `Name it: You have psoriasis. This is a condition where your immune system speeds up skin turnover, so you get red, scaly patches. It can sometimes affect your nails or joints too.

Link it: The typical sites – elbows, knees, scalp – and any family history of psoriasis fit with this diagnosis.

Plan it: Moisturisers and steroid or vitamin D creams can help. If it’s widespread, we may refer you for light therapy or to a dermatologist. We’ll also check if your joints are affected.

Safety net it: If you get a sudden widespread rash, joint swelling, or it’s affecting your mood badly, come back for a review.`,

  "Acne": `Name it: You have acne. This is when the hair follicles and oil glands in your skin become inflamed, causing spots and blackheads.

Link it: Where it appears – face, back, or chest – how severe it is, and whether you’re at risk of scarring, all help us decide how to treat it.

Plan it: Use gentle, non-comedogenic skincare. We can give you creams like retinoid or benzoyl peroxide. If it’s moderate, we might add antibiotics. If it’s severe, we’ll refer you to a dermatologist.

Safety net it: If it’s really affecting your mood or you’re getting scarring despite treatment, we need to escalate.`,

  "Rosacea": `Name it: You have rosacea. This means the skin on your face flushes easily and can become inflamed, with red bumps and visible blood vessels.

Link it: The things that trigger it – heat, alcohol, spicy food – and the fact that it’s mainly in the centre of your face, fit with rosacea.

Plan it: Try to avoid your triggers. Use gentle skincare. We can give you creams or gels to help. If needed, we might add antibiotic tablets. Sun protection is important.

Safety net it: If you get gritty or painful eyes, or a severe flare, come back for a review.`,

  "Shingles": `Name it: You have shingles. This is when the chickenpox virus, which has been sleeping in your nerves, wakes up again. It causes a painful, blistering rash in a band on one side of your body.

Link it: The pain that came first, followed by blisters in a band, all on one side, fit with shingles.

Plan it: If we catch it early, or if you’re older or it’s severe, we’ll give you antiviral tablets. Pain relief is important. Keep the rash covered and clean. Avoid contact with anyone who hasn’t had chickenpox or is vulnerable until the blisters have crusted over.

Safety net it: If it affects your eye area, the pain is severe, or you get weakness, you need urgent review.`,

  "Cellulitis": `Name it: You have cellulitis. This is a bacterial infection of the skin that makes an area red, hot, and painful.

Link it: The spreading redness, warmth, and possibly fever you’ve described fit with cellulitis.

Plan it: We’ll give you antibiotics. If it’s on your leg, keep it elevated. We might mark the edge of the redness so we can see if it’s spreading. If it’s not improving in 48 hours, come back.

Safety net it: If the redness spreads rapidly, you get fever or chills, or you feel confused, you need urgent assessment.`,

  "Urticaria (Hives)": `Name it: You have urticaria, also called hives. This is when your skin comes up in raised, itchy welts that can appear anywhere and often move around. They usually fade within 24 hours but new ones can appear.

Link it: The itchy raised patches you’ve described, which come and go and move to different places, fit with urticaria. It can be triggered by infections, allergies, medicines, or sometimes we don’t find a cause.

Plan it: We’ll give you antihistamines to reduce the itch and swelling. Avoiding any known triggers helps. Most cases settle within a few weeks. If it keeps coming back, we may need to look for an underlying cause.

Safety net it: If your lips or throat swell, you have difficulty breathing, or you feel dizzy, that could be a serious allergic reaction. Use your EpiPen if you have one and call 999.`,

  "Fungal Skin Infection": `Name it: You have a fungal skin infection. This is when a type of fungus grows on your skin, causing a rash. Common types include ringworm – which can appear as a ring-shaped patch – and athlete’s foot, which affects the feet.

Link it: The itchy, scaly rash you’ve described, often in warm, moist areas like between the toes or in the groin, fits with a fungal infection. It can spread from person to person or from pets.

Plan it: We’ll give you an antifungal cream or sometimes a tablet. Keep the area clean and dry. Change socks and underwear regularly. Don’t share towels. Treatment usually takes a few weeks. Make sure you complete the course.

Safety net it: If the rash spreads widely, doesn’t improve with treatment, or you have a weakened immune system, come back for a review.`,

  "Contact Dermatitis": `Name it: You have contact dermatitis. This means your skin has reacted to something it’s touched. The reaction causes redness, itch, and sometimes blisters in the area that was in contact.

Link it: The rash in the area that touched the substance, the timing – often a few hours or days after contact – and any new products, jewellery, or chemicals you’ve used, fit with contact dermatitis. Common triggers include nickel, perfumes, and cleaning products.

Plan it: Avoid the thing that’s causing it. We’ll give you a steroid cream to calm the inflammation. Emollients can help protect the skin. If we can’t identify the cause, we may refer you for patch testing.

Safety net it: If the rash is widespread, blisters heavily, or you have signs of infection, come back for a review.`,

  "Scabies": `Name it: You have scabies. This is when tiny mites burrow into your skin and lay eggs. It causes intense itching, especially at night, and a rash that can look like small bumps or lines.

Link it: The intense itch, especially at night, the rash often between fingers, on wrists, or in skin folds, and the fact that others in your household may have similar symptoms, fit with scabies. It spreads through close contact.

Plan it: We’ll give you a cream to apply to your whole body from the neck down. Everyone in the household needs to be treated at the same time. Wash bedding and clothes on a hot wash. The itch can continue for a few weeks after treatment.

Safety net it: If you develop a crusted form with thick scaling, or you have a weakened immune system, come back – you may need different treatment.`,

  "Impetigo": `Name it: You have impetigo. This is a bacterial skin infection that causes sores that burst and form a golden-brown crust. It’s very contagious and often affects the face, especially around the nose and mouth.

Link it: The crusted sores you’ve described, often starting as blisters, and the fact that it may have spread from a scratch or insect bite, fit with impetigo. It’s common in children.

Plan it: We’ll give you an antibiotic cream or sometimes tablets. Keep the sores clean and covered. Don’t share towels or flannels. Stay off work or school until 48 hours after starting treatment or until the sores have crusted over.

Safety net it: If it spreads widely, you feel unwell with a fever, or the skin around it becomes red and hot, come back for a review.`,

  // Mental Health
  "Depression": `Name it: You have depression. This is a common condition that affects your mood, sleep, appetite, and enjoyment of things. It usually lasts for at least a few weeks and affects how you function day to day.

Link it: The low mood, loss of interest in things you used to enjoy, changes in your energy, sleep, or appetite, and the impact on your daily life, all fit with depression.

Plan it: We’ll take a holistic approach. Self-help resources, talking therapy like CBT, and social support can all help. We may consider an antidepressant if appropriate. Looking after your sleep and activity levels matters too.

Safety net it: If you have thoughts of harming yourself or ending your life, or if things suddenly get much worse, you need to know how to seek urgent help. I can give you the numbers to call.`,

  "Generalised Anxiety Disorder": `Name it: You have generalised anxiety disorder. This means you feel worried most days, often about lots of different things, and it’s been going on for months. It often comes with physical symptoms like muscle tension and trouble sleeping.

Link it: The constant worrying, your sleep problems, and the physical tension you’ve described all fit with generalised anxiety.

Plan it: Psychological approaches like CBT are usually the first step. Relaxation techniques and lifestyle changes can help. If needed, we can consider medication.

Safety net it: If your anxiety gets worse and you have thoughts of self-harm, or it’s severely affecting your ability to function, please seek help.`,

  "Panic Disorder": `Name it: You have panic disorder. This means you get sudden, intense episodes of fear – panic attacks – with physical symptoms like a racing heart and breathlessness. You may also worry about having more attacks and avoid certain situations.

Link it: The sudden intense fear, palpitations, breathlessness, fear that something terrible is happening, and the avoidance you’ve described, all fit with panic disorder.

Plan it: I’ll explain how the panic cycle works. Breathing and grounding techniques can help in the moment. CBT is very effective. We may consider medication if needed.

Safety net it: If you get chest pain and have risk factors for heart disease, or you have thoughts of self-harm, you need urgent review.`,

  "Insomnia": `Name it: You have insomnia. This means you have trouble falling asleep or staying asleep, and it’s affecting how you feel during the day.

Link it: Your sleep pattern, your habits around bedtime, any stress, and things like caffeine, alcohol, or screen use, can all affect your sleep.

Plan it: We’ll focus on sleep hygiene – things like a regular routine, a cool dark room, and avoiding screens before bed. There are specific CBT techniques for insomnia that work well. We’ll avoid relying on sleeping tablets long term.

Safety net it: If your mood is getting worse or you’re so tired during the day that it’s unsafe – for example when driving – come back for a review.`,

  "PTSD (Post-Traumatic Stress Disorder)": `Name it: You have post-traumatic stress disorder, or PTSD. This can develop after you’ve been through something very frightening or distressing. Your brain keeps reliving the event through flashbacks or nightmares, and you may feel on edge or avoid reminders of it.

Link it: The traumatic event you went through, the flashbacks or nightmares, the feeling of being constantly on guard, and the way you avoid things that remind you of it, all fit with PTSD.

Plan it: Talking therapies, especially trauma-focused CBT or EMDR, are the main treatments. They help your brain process what happened. We may consider medication if needed. Support from people you trust is important.

Safety net it: If you have thoughts of harming yourself or ending your life, please reach out for help. I can give you the numbers to call.`,

  "OCD": `Name it: You have obsessive-compulsive disorder, or OCD. This means you have unwanted thoughts or images that keep coming into your mind, and you feel driven to do certain actions or rituals to reduce the anxiety they cause.

Link it: The intrusive thoughts you’ve described, the rituals or compulsions you feel you must do, and the way they’re affecting your daily life, fit with OCD. The thoughts often focus on things like contamination, harm, or order.

Plan it: Cognitive behavioural therapy, especially a type called exposure and response prevention, is the main treatment. It helps you face your fears and resist the compulsions. We may consider medication if the therapy alone isn’t enough. This is a treatable condition.

Safety net it: If you have thoughts of harming yourself or others, or the condition is severely affecting your ability to function, please seek help.`,

  "Eating Disorder": `Name it: You have an eating disorder. This means your relationship with food, eating, or your body has become unhealthy and is affecting your physical and mental health. There are different types, including anorexia, bulimia, and binge eating disorder.

Link it: The patterns you’ve described – whether that’s restricting food, binge eating, purging, or a preoccupation with weight and shape – along with the impact on your health and daily life, fit with an eating disorder.

Plan it: You need specialist support. We’ll refer you to an eating disorder service. Treatment usually involves psychological therapy and support with nutrition. Your physical health needs to be monitored. Recovery is possible with the right help.

Safety net it: If your weight is very low, you’re fainting, you have chest pain or palpitations, or you have thoughts of self-harm, you need urgent assessment.`,

  "Bipolar Disorder": `Name it: You have bipolar disorder. This means you experience periods of low mood – like depression – and periods of high mood or mania, when you may have lots of energy, need less sleep, and make impulsive decisions. These episodes can last weeks or months.

Link it: The pattern of mood swings you’ve described, the periods of high energy and reduced need for sleep, and any history of depression, fit with bipolar disorder. Sometimes it’s first recognised after a manic episode.

Plan it: This is managed by a psychiatrist. Medication to stabilise your mood is usually needed long term. It’s important to take it regularly. We’ll help you recognise early signs of an episode. Avoiding alcohol and drugs and keeping a regular sleep pattern helps.

Safety net it: If you’re in a manic episode and not sleeping, taking risks, or have thoughts of self-harm, you need urgent support.`,

  "Substance Misuse": `Name it: You have a problem with substance misuse. This means your use of alcohol or drugs is causing harm to your health, relationships, or daily life. It’s a medical condition, not a moral failing, and help is available.

Link it: The way you’ve described your use, the impact it’s having, and any withdrawal symptoms when you try to cut down, fit with substance misuse. Many people find it hard to admit, so it takes courage to talk about it.

Plan it: We’ll support you without judgement. We can refer you to specialist services for counselling and support. Some people benefit from medication to help with withdrawal or cravings. Reducing harm while you work on cutting down is important. Recovery is possible.

Safety net it: If you’re planning to stop alcohol or drugs suddenly, or you have severe withdrawal symptoms like seizures or confusion, you need medical support. Don’t stop alone.`,

  // Neurology
  "Migraine": `Name it: You have migraines. These are headaches that come in episodes – often throbbing, with nausea and sensitivity to light. Some people get warning signs beforehand, like flashing lights.

Link it: The pattern of your headaches, things that trigger them – like hormones, certain foods, or stress – and how they affect you, all fit with migraine.

Plan it: Keep a diary to spot your triggers. When a migraine starts, take simple painkillers early. We can add a triptan and anti-sickness medicine if needed. Try not to overuse painkillers, as that can cause more headaches. If they’re frequent, we can consider preventive treatment.

Safety net it: If you get a sudden, severe headache like a thunderclap, any weakness or speech problems, or your headache pattern changes, you need urgent assessment.`,

  "Tension Headache": `Name it: You have tension-type headaches. These feel like pressure or a band around your head and are often linked to stress or posture.

Link it: The mild to moderate pain, the fact that routine activity doesn’t make it worse, and that you don’t have any worrying neurological symptoms, fit with tension headache.

Plan it: Improving your posture and workspace, managing stress, and taking regular breaks can help. Simple painkillers can be used, but try not to use them too often.

Safety net it: If you get a sudden severe headache, any neurological symptoms, or your headache pattern changes, come back for a review.`,

  "Epilepsy": `Name it: You have epilepsy. This means your brain sometimes has sudden bursts of electrical activity that cause seizures. These can happen without an obvious trigger.

Link it: The episodes that have been witnessed, the recovery period afterwards, and things like lack of sleep or alcohol that can trigger seizures, all fit with epilepsy. There are important rules about driving that we need to discuss.

Plan it: This is managed by a neurologist. You’ll need anti-seizure medication and advice on staying safe. Avoiding your triggers helps. You must follow the driving rules – I can explain these.

Safety net it: If a seizure lasts more than five minutes, seizures happen one after another without recovery, or someone is injured, that’s an emergency. Call 999.`,

  "BPPV (Vertigo)": `Name it: You have BPPV – benign paroxysmal positional vertigo. This means tiny crystals in your inner ear have moved out of place. When you move your head in certain ways, they trigger brief spells of spinning.

Link it: The short bursts of vertigo when you roll over or look up, the fact that there are no other neurological signs, and that it gets better with repeated movement, all fit with BPPV.

Plan it: I’ll explain that it’s harmless. I can do a manoeuvre called the Epley to move the crystals back. I can also teach you how to do it at home. If it persists, vestibular rehabilitation can help.

Safety net it: If you develop new neurological symptoms, hearing loss, or the vertigo is severe and doesn’t improve, come back for a review.`,

  "Bell's Palsy": `Name it: You have Bell’s palsy. This is when the nerve that controls the muscles on one side of your face becomes inflamed and stops working properly. It usually comes on suddenly and causes one side of your face to droop.

Link it: The sudden weakness on one side of your face, the difficulty closing your eye or smiling on that side, and sometimes changes in taste or sound sensitivity, all fit with Bell’s palsy. It often follows a viral infection.

Plan it: We’ll give you steroid tablets to reduce the inflammation. It’s important to protect your eye – use lubricating drops and tape it shut at night if it doesn’t close properly. Most people make a good recovery over several weeks or months.

Safety net it: If you have weakness in your arm or leg as well, or double vision, that could be something else. Come back urgently.`,

  "TIA (Transient Ischaemic Attack)": `Name it: You’ve had a TIA, or transient ischaemic attack. This is sometimes called a mini-stroke. It happens when the blood supply to part of your brain is briefly blocked. The symptoms usually go away within 24 hours, but it’s a warning that you’re at risk of a full stroke.

Link it: The sudden symptoms you had – whether that was weakness, slurred speech, blurred vision, or numbness – and the fact that they’ve now improved, fit with a TIA. Things like high blood pressure, high cholesterol, smoking, or an irregular heartbeat increase the risk.

Plan it: You need urgent assessment in hospital to confirm the diagnosis and find the cause. We’ll start treatment to reduce your stroke risk – that might include blood thinners, blood pressure tablets, or a statin. You must not drive until we’ve assessed you.

Safety net it: If the symptoms come back, get worse, or don’t improve, call 999. Treat it as a stroke.`,

  "Parkinson's Disease": `Name it: You have Parkinson’s disease. This is a condition that affects the brain and gets worse slowly over time. It causes problems with movement – like stiffness, slowness, and tremor – and can affect other things like sleep and mood.

Link it: The tremor, often when your hand is at rest, the stiffness and slowness of movement, and the way your walking may have changed, fit with Parkinson’s. It’s more common as we get older.

Plan it: You’ll be under a neurologist. Medication can help with the symptoms. Physiotherapy and occupational therapy can help you stay active and independent. We’ll monitor how you’re doing and adjust treatment. There’s a lot of support available.

Safety net it: If you have sudden changes, difficulty swallowing, or falls, come back for a review. If you have swallowing problems with medication, that needs urgent attention.`,

  "Dementia": `Name it: You have dementia. This means there are changes in your brain that affect your memory, thinking, and ability to do everyday things. It usually develops slowly. Alzheimer’s is the most common type, but there are others.

Link it: The memory problems, confusion, or changes in behaviour you or your family have noticed, and the way it’s affecting daily life, fit with dementia. It’s more common as we get older.

Plan it: You’ll need a specialist assessment. We’ll support you and your family. There are medications that can help some people. Planning ahead – things like lasting power of attorney – is important. Support groups and carers’ services can help.

Safety net it: If there’s a sudden worsening, or you develop infection, pain, or constipation, these can make confusion much worse. Come back so we can check for treatable causes.`,

  "Multiple Sclerosis": `Name it: You have multiple sclerosis, or MS. This is a condition where the immune system attacks the protective coating around the nerves in your brain and spinal cord. That causes a range of symptoms that can come and go or get worse over time.

Link it: The symptoms you’ve had – whether that’s vision problems, numbness, weakness, or balance issues – and the pattern of how they’ve come on, fit with MS. It often affects young adults and is more common in women.

Plan it: You’ll be under a neurologist. There are treatments that can reduce relapses and slow progression. Physiotherapy and occupational therapy can help with symptoms. We’ll support you with any other health needs. Many people with MS live full and active lives.

Safety net it: If you have a sudden new symptom or a relapse, contact your MS team. If you have severe weakness or difficulty breathing, seek urgent care.`,

  // Urology/Renal
  "Urinary Tract Infection": `Name it: You have a urinary tract infection, or UTI. This is an infection in your bladder that causes pain when you pass urine and makes you need to go more often.

Link it: The burning when you pass urine, the urgency, and the discomfort in your lower tummy all fit with a bladder infection. We’ve ruled out any red flags.

Plan it: Drink plenty of fluids. We’ll give you a short course of antibiotics if needed. We’ll do a urine test and may send a sample to the lab. I’ll tell you when to come back if things don’t improve.

Safety net it: If you get a fever, pain in your back (which could mean the infection has reached your kidney), vomiting, or you might be pregnant, you need urgent review.`,

  "Kidney Stones": `Name it: You have a kidney stone. This is a small, hard lump that has formed in your kidney and is now passing down the tube to your bladder. That causes severe, colicky pain.

Link it: The pain from your loin to your groin, any blood in your urine, and the restlessness you feel, all fit with a passing kidney stone.

Plan it: We’ll give you strong pain relief. Drink plenty of fluids. We may arrange a scan. Sometimes a tablet can help the stone pass. If the stone is large, blocking the flow, or you have an infection, we’ll refer you to urology.

Safety net it: If you get a fever with the pain, that could mean an infected blockage – that’s an emergency. If the pain or vomiting can’t be controlled, you need urgent care.`,

  "Benign Prostatic Hyperplasia": `Name it: You have benign prostatic hyperplasia, or BPH. This means your prostate gland has grown larger than usual. It’s not cancer. It narrows the tube that carries urine, so the flow becomes weaker.

Link it: The weak stream, hesitancy when you start, needing to get up at night, and feeling you haven’t fully emptied, all fit with BPH.

Plan it: We’ll advise on when you drink fluids and cutting down caffeine and alcohol. We may start you on a tablet to relax the prostate or shrink it. We’ll monitor how you’re doing.

Safety net it: If you can’t pass urine at all, you get signs of infection, or you see blood in your urine, come back for a review.`,

  "Chronic Kidney Disease": `Name it: You have chronic kidney disease. This means your kidneys have become less efficient at filtering your blood over time. We measure this with blood and urine tests and describe it in stages.

Link it: Often there are no symptoms early on. Some people get swelling or high blood pressure. Your test results tell us how well your kidneys are working.

Plan it: We’ll control your blood pressure and diabetes if you have them. We’ll avoid medicines that can harm the kidneys. We may start a statin. You’ll need regular blood and urine tests. If it’s advanced or getting worse, we’ll refer you to a kidney specialist.

Safety net it: If you suddenly pass much less urine, get new swelling, or become breathless, come back promptly.`,

  // Women's Health
  "Menopause": `Name it: You’re going through the menopause. This means your ovaries are making less oestrogen, so your periods change and you may get symptoms like hot flushes, mood changes, and vaginal dryness.

Link it: The hot flushes, changes to your cycle, mood or sleep changes, and vaginal dryness you’ve described all fit with the menopause.

Plan it: Lifestyle changes can help. We can discuss hormone replacement therapy – the benefits, risks, and who it’s not suitable for. There are also non-hormonal options if you prefer.

Safety net it: If you have any bleeding after your periods have stopped, or chest pain or leg swelling if you’re on HRT, you need urgent review.`,

  "Endometriosis": `Name it: You have endometriosis. This means tissue similar to the lining of your womb is growing outside it. It can cause pain and sometimes affect fertility.

Link it: The pelvic pain that comes with your cycle, pain during sex, heavy periods, and any bowel or bladder pain that varies with your cycle, all fit with endometriosis.

Plan it: We can give you pain relief. Hormonal treatments like the pill or progesterone can suppress the tissue. We may refer you to a gynaecologist. Pelvic physiotherapy can help some women.

Safety net it: If you get severe acute pain, very heavy bleeding, or you’re concerned about fertility, come back for a review.`,

  "Heavy Periods": `Name it: You have heavy periods. This means your menstrual bleeding is heavier or lasts longer than usual, and it’s affecting your quality of life.

Link it: The clots, flooding, and any symptoms of low iron like tiredness, all fit with heavy periods.

Plan it: We’ll do a blood test to check for anaemia. There are several options: tablets like tranexamic acid or mefenamic acid, or hormonal options like the pill or a coil. We’ll also check for any underlying causes.

Safety net it: If the bleeding is very heavy and you feel dizzy, or you have bleeding between periods or after sex, come back for a review.`,

  "Vaginal Thrush": `Name it: You have vaginal thrush. This is when a fungus that normally lives in the vagina grows too much, causing itch and discharge.

Link it: The thick white discharge, itch, soreness, and the fact that there’s no strong odour, fit with thrush.

Plan it: We’ll give you an antifungal treatment – either a pessary, cream, or tablet. Avoid irritants like perfumed products. We’ll consider triggers like recent antibiotics or diabetes.

Safety net it: If it keeps coming back, the discharge or odour is unusual, or you have bleeding, come back so we can check for other causes.`,

  "Contraception": `Name it: You’re asking about contraception. There are several options, and the right one depends on what matters most to you – how effective it needs to be, whether you want something you use daily or that lasts longer, and any health considerations.

Link it: Your age, whether you smoke, any medical history, and your preferences – for example whether you want something reversible or long-acting – will help us choose. We’ll also discuss when you might want to have children.

Plan it: Options include the pill, the patch, the ring, the coil, the implant, or the injection. Barrier methods like condoms also protect against infections. I’ll explain how each works, the pros and cons, and we can decide together. You can change your mind at any time.

Safety net it: If you have chest pain, leg swelling, or severe headache on hormonal contraception, seek urgent review. If you think your contraception has failed, we can discuss emergency contraception.`,

  "Cervical Smear Abnormality": `Name it: Your cervical smear has shown an abnormality. This doesn’t mean you have cancer. It means we’ve found some cell changes that we need to look at more closely. The smear is a screening test that picks up changes early, when they’re usually easy to treat.

Link it: The result you’ve received – whether it’s low-grade or high-grade changes – tells us what the next step is. Most abnormalities are caused by a virus called HPV and clear on their own. Your age and the type of change affect what we do next.

Plan it: We may need to refer you for a colposcopy – a closer look at your cervix. Sometimes we just repeat the smear in a year. I’ll explain exactly what your result means and what happens next. Try not to worry – the vast majority of women with abnormal smears do not have cancer.

Safety net it: If you have bleeding between periods, after sex, or after the menopause, come back regardless of your smear result.`,

  "Pelvic Organ Prolapse": `Name it: You have a pelvic organ prolapse. This means one of the organs in your pelvis – usually the womb, bladder, or bowel – has slipped down from its normal position. It’s caused by weakening of the muscles and tissues that support them.

Link it: The bulge or heaviness you feel, especially when you stand or strain, the discomfort, and any bladder or bowel symptoms, fit with a prolapse. It’s common after childbirth, with age, or with long-term straining.

Plan it: Pelvic floor exercises can help. Avoiding constipation and heavy lifting reduces pressure. A pessary – a device that fits inside to support the organs – can help some women. If it’s affecting your quality of life, we can refer you for surgery.

Safety net it: If you have pain, bleeding, or difficulty passing urine or stools, come back for a review.`,

  "Mastitis": `Name it: You have mastitis. This is inflammation of the breast tissue, often with an infection. It usually affects breastfeeding women and causes a painful, red, hot area in the breast, sometimes with flu-like symptoms.

Link it: The painful, red, swollen area in your breast, any fever or chills, and the fact that you’re breastfeeding, fit with mastitis. It often happens when milk isn’t draining properly, perhaps from a blocked duct or a poor latch.

Plan it: Keep feeding from the affected breast – it helps clear the blockage. Try different feeding positions. Pain relief and rest can help. We may give you antibiotics if we think there’s an infection. A breast abscess can develop if it doesn’t improve.

Safety net it: If you have a lump that doesn’t improve, a high fever, or you feel very unwell, come back. If you’re not breastfeeding and have these symptoms, we need to see you to rule out other causes.`,

  // Men's Health
  "Erectile Dysfunction": `Name it: You have erectile dysfunction. This means you’re having difficulty getting or keeping an erection that’s firm enough for sex. It’s very common and often treatable. It can be a sign of other health issues, so it’s good you’ve come to talk about it.

Link it: The difficulty you’ve described, how long it’s been going on, and things like diabetes, high blood pressure, stress, or relationship issues, can all contribute. Medication, alcohol, and smoking can affect it too.

Plan it: We’ll check for underlying causes like diabetes or heart disease. There are tablets that can help – they increase blood flow to the penis. Lifestyle changes like losing weight, exercise, and cutting down alcohol can help. We can refer you to a specialist if needed.

Safety net it: If you have sudden erectile dysfunction with other symptoms, or you have pain or curvature when erect, come back for a review.`,

  "Epididymitis": `Name it: You have epididymitis. This is inflammation of the epididymis – the tube at the back of your testicle that stores sperm. It causes pain and swelling, usually in one testicle. It can be caused by an infection or sometimes by other factors.

Link it: The pain and swelling in your testicle, which may have come on over a few days, and any pain when you pass urine or discharge, fit with epididymitis. It can be linked to urine infections or sexually transmitted infections.

Plan it: We’ll give you antibiotics if we think it’s an infection. Rest, support for your scrotum, and pain relief can help. We may test your urine and do swabs. If it’s linked to an STI, your partner may need treatment too.

Safety net it: If the pain is sudden and severe, or you have vomiting and a swollen, red testicle, you need urgent assessment – that could be a twisted testicle, which is an emergency.`,

  // ENT & Eyes
  "Otitis Media (Ear Infection)": `Name it: You have an ear infection, also called otitis media. This is an infection in the middle ear – the space behind your eardrum – which causes ear pain and sometimes fever or muffled hearing.

Link it: A recent cold, pain in one ear, and the fact that it’s common in children, all fit with an ear infection.

Plan it: Pain relief is the main treatment. Most ear infections get better on their own. We may give antibiotics if it’s severe, you’re systemically unwell, or you’re at higher risk.

Safety net it: If you get swelling behind the ear, a severe fever, or discharge from the ear with pain, come back for a review.`,

  "Allergic Rhinitis (Hay Fever)": `Name it: You have hay fever, also called allergic rhinitis. This means your nose and eyes react to things you’re allergic to, like pollen, which causes sneezing, itch, and a runny or blocked nose.

Link it: The sneezing, itchy or runny nose, itchy eyes, and whether it’s seasonal or all year round, all fit with hay fever.

Plan it: Avoid your triggers where possible. Take an antihistamine regularly. A steroid nasal spray can help. Saline rinses can wash pollen out of your nose.

Safety net it: If it’s not controlled despite treatment, or you’re at risk of asthma flares, come back for a review.`,

  "Tonsillitis": `Name it: You have tonsillitis. This is an infection of your tonsils – the lumps at the back of your throat – which causes a sore throat, fever, and difficulty swallowing.

Link it: The fever, swollen tonsils, sometimes with white spots, and tender glands in your neck, all fit with tonsillitis.

Plan it: Pain relief and plenty of fluids are the main treatments. We may give antibiotics if the scoring suggests it’s likely bacterial.

Safety net it: If you have difficulty breathing or swallowing, are drooling, or get swelling in your neck, you need urgent care – that could be a quinsy.`,

  "Conjunctivitis": `Name it: You have conjunctivitis. This is inflammation of the thin layer that covers the white of your eye and the inside of your eyelids. It causes red, itchy, or sticky eyes.

Link it: The red, gritty, or sticky eyes you’ve described fit with conjunctivitis. It can be caused by an infection – viral or bacterial – or by an allergy. Viral conjunctivitis often starts in one eye and spreads to the other.

Plan it: Keep the eye clean with cooled boiled water. Don’t share towels. Most cases get better on their own. We may give you antibiotic drops if it looks bacterial. If it’s allergic, antihistamine drops can help.

Safety net it: If you have pain in the eye itself (not just the surface), blurred vision, or sensitivity to light, come back for urgent review.`,

  "Otitis Externa (Swimmer's Ear)": `Name it: You have otitis externa, also called swimmer’s ear. This is inflammation or infection of the ear canal – the tube that leads from the outside to your eardrum. It causes ear pain, itch, and sometimes discharge.

Link it: The pain when you touch or pull your ear, the itch, and any discharge or hearing muffling fit with otitis externa. It’s common after swimming, from poking the ear, or from moisture getting trapped. People with eczema or narrow ear canals are more prone.

Plan it: Keep the ear dry. We’ll give you ear drops – usually antibiotic with steroid. Don’t put cotton buds in your ear. The pain can be quite bad, so painkillers help. It usually clears within a week.

Safety net it: If you have a fever, the pain spreads, your face feels weak on one side, or it doesn’t improve after a week, come back for a review.`,

  "Glue Ear": `Name it: Your child has glue ear. This means fluid has built up in the middle ear – the space behind the eardrum – and it’s become thick and sticky. That affects hearing because the eardrum can’t move properly.

Link it: The hearing difficulty, the fact that your child may seem to ignore you or have delayed speech, and any history of ear infections or colds, fit with glue ear. It’s very common in young children.

Plan it: Most cases get better on their own within a few months. We’ll check the hearing. If it persists and affects speech or learning, we may refer to ENT. Sometimes grommets – small tubes in the eardrum – are needed to drain the fluid.

Safety net it: If your child develops ear pain, fever, or discharge, they may have an infection on top of the glue ear. Come back for a review.`,

  "Nasal Polyps": `Name it: You have nasal polyps. These are soft, non-cancerous growths that form inside your nose or sinuses. They can block your nose and affect your sense of smell. They’re linked to inflammation and often occur with asthma or allergies.

Link it: The blocked nose, reduced sense of smell, and the fact that it may have developed over time, fit with nasal polyps. They’re more common in people with asthma, hay fever, or certain conditions.

Plan it: A steroid nasal spray can shrink them. Sometimes a short course of steroid tablets helps. If they’re large or don’t respond, we may refer you to ENT. Surgery to remove them is an option if needed. Treating any underlying asthma or allergies helps.

Safety net it: If you have one-sided symptoms, bleeding, or facial pain that doesn’t improve, come back so we can rule out other causes.`,

  // Paediatrics
  "Bronchiolitis": `Name it: Your baby has bronchiolitis. This is a viral infection that affects the smallest airways in the lungs. It’s most common in babies aged three to six months and causes cough, wheeze, and sometimes difficulty feeding.

Link it: The cough, wheeze, and feeding difficulty in your baby fit with bronchiolitis.

Plan it: Most babies can be looked after at home. Give small, frequent feeds. Watch how hard they’re working to breathe. Some babies need to go to hospital if they’re not feeding well, have pauses in their breathing, or have low oxygen levels.

Safety net it: If your baby has fewer wet nappies, has pauses in breathing, has blue lips, or is working very hard to breathe, take them to the emergency department.`,

  "Croup": `Name it: Your child has croup. This is a viral infection that causes swelling in the voice box and windpipe, which makes their breathing noisy and gives them a barking cough.

Link it: The barking cough, the noisy breathing when they inhale, and the fact that it’s often worse at night, fit with croup. It’s most common in children under five.

Plan it: Most children can be looked after at home. Sitting them upright and comforting them helps. Cool moist air – for example from a steamy bathroom – can ease the breathing. Paracetamol can help if they have a fever. Steroids can reduce the swelling if they need them.

Safety net it: If they’re struggling to breathe, their breathing is getting worse, they’re very restless or drowsy, or their lips turn blue, take them to the emergency department.`,

  "Hand Foot and Mouth Disease": `Name it: Your child has hand, foot and mouth disease. This is a viral infection that causes blisters or spots in the mouth, on the hands, and on the feet. It’s common in young children and usually mild.

Link it: The spots and blisters in the typical places, the fever, and the fact that other children at nursery or school may have had it, fit with hand, foot and mouth disease. It spreads easily through coughs, sneezes, and contact with fluid from the blisters.

Plan it: There’s no specific treatment – it gets better on its own within about a week. Give paracetamol for fever and pain. Offer cool, soft foods and fluids. Keep them off nursery or school until the blisters have dried. Wash hands frequently.

Safety net it: If they’re not drinking, seem dehydrated, have a stiff neck, or are very drowsy, come back for a review.`,

  "Viral Wheeze": `Name it: Your child has viral wheeze. This means they wheeze when they get a cold or viral infection. The airways temporarily narrow, causing the whistling sound when they breathe. It’s different from asthma and many children grow out of it.

Link it: The wheeze that comes with each cold, the fact that they’re fine between illnesses, and their age, fit with viral wheeze. It’s common in preschool children.

Plan it: We may give you an inhaler to use when they’re unwell – it helps open the airways. Use it as directed when they have a cold. Most children don’t need treatment between episodes. We’ll review if the pattern changes.

Safety net it: If they’re working hard to breathe, not feeding, or their lips turn blue, take them to the emergency department.`,

  "Colic": `Name it: Your baby has colic. This is when a healthy baby cries a lot, often in the evening, for no obvious reason. It usually starts in the first few weeks and improves by around three to four months. We don’t fully understand what causes it.

Link it: The pattern of crying – often in the evening, drawing up legs, and difficult to soothe – in an otherwise well baby, fits with colic. It’s very common and doesn’t mean anything is wrong with your baby.

Plan it: Try holding them, gentle movement, white noise, or a warm bath. Some parents find that cutting out dairy if breastfeeding, or changing formula, helps. It’s exhausting – make sure you get support. It does get better.

Safety net it: If your baby has a fever, isn’t feeding, has vomiting or diarrhoea, or you’re worried something else is wrong, bring them in for a check.`,

  "Teething": `Name it: Your baby is teething. This is when their first teeth are coming through the gums. It can cause discomfort, drooling, and chewing on things. It usually starts around six months but can vary.

Link it: The drooling, chewing, and irritability, along with their age and perhaps swollen gums where a tooth is coming through, fit with teething. Teething doesn’t cause high fever or diarrhoea – if they have those, it’s something else.

Plan it: A teething ring to chew on, or a clean finger to rub the gums, can help. Paracetamol or ibuprofen can ease discomfort. Avoid teething gels that contain certain ingredients. The discomfort usually passes once the tooth breaks through.

Safety net it: If they have a high fever, are not feeding, have diarrhoea or vomiting, or seem unwell, don’t assume it’s teething – bring them in for a check.`,

  "Childhood Eczema": `Name it: Your child has eczema. This means their skin is dry and inflamed, so it gets itchy. In children it often affects the creases of the elbows and knees, and the cheeks.

Link it: The itchy, dry patches in typical areas fit with childhood eczema.

Plan it: Use moisturiser frequently to protect the skin. When it flares, use a steroid cream of the right strength for their age. Avoid known triggers. Watch for signs of infection.

Safety net it: If the redness spreads, the skin starts oozing, or they get a fever, they may have an infection. Come back for a review.`,

  "Constipation in Children": `Name it: Your child has constipation. This means their poo is hard or they don’t go often enough, which can cause pain. Sometimes they hold it in because it hurts, which makes things worse.

Link it: Their poo pattern, any pain, soiling, and their diet and fluid intake, all help us understand the problem.

Plan it: If they’re badly blocked, we may need to clear that first. Then we’ll use maintenance laxatives to keep things moving. Diet, fluids, a regular toileting routine, and reward charts can all help.

Safety net it: If they’re vomiting, losing weight, passing blood, or in severe pain, come back for a review.`,

  "Febrile Illness in Children": `Name it: Your child has a fever, most likely from a viral infection. We need to check for any red flags that might mean something more serious.

Link it: Their temperature and how they’re behaving help us decide if they’re okay to look after at home.

Plan it: Keep them hydrated. You can give paracetamol or ibuprofen for comfort. Watch them closely. I’ll explain the traffic light system – the green, amber, and red signs to look for.

Safety net it: If they’re not feeding, are lethargic, have difficulty breathing, have a rash that doesn’t fade when you press it, or have a seizure, they need urgent care.`,

  // Other
  "Iron Deficiency Anaemia": `Name it: You have iron deficiency anaemia. This means you don’t have enough iron, so your body makes fewer red blood cells. Red blood cells carry oxygen around your body, so when there aren’t enough, you feel tired and breathless.

Link it: The tiredness, breathlessness, and paleness you’ve described fit with anaemia. The cause is often not enough iron in your diet or blood loss – for example from heavy periods or from the gut.

Plan it: We’ll give you iron to replace what you’re missing. We need to find and treat the cause – whether that’s your diet, periods, or something in your gut. We’ll recheck your bloods to make sure the iron is working.

Safety net it: If you pass black or tarry stools, vomit blood, or your fatigue gets worse, come back for a review.`,

  "B12 Deficiency": `Name it: You have a B12 deficiency. This means you don’t have enough vitamin B12, which affects your red blood cells and your nerves.

Link it: The tiredness, pins and needles, and any sore tongue you’ve noticed fit with B12 deficiency. The cause can be your diet or a problem absorbing it – for example pernicious anaemia.

Plan it: We’ll replace your B12 – either with tablets or injections, depending on the cause. We’ll investigate why you’re deficient and monitor your bloods.

Safety net it: If the numbness or weakness gets worse, or you notice changes in your thinking or memory, come back promptly.`,

  "Vitamin D Deficiency": `Name it: You have a vitamin D deficiency. This means you don’t have enough vitamin D, which your body needs for healthy bones and muscles.

Link it: Any bone pain or muscle aches, and things like getting little sun, having darker skin, or wearing covering clothing, can increase the risk of low vitamin D.

Plan it: We’ll give you a loading dose of vitamin D, then a maintenance dose. We’ll advise on safe sun exposure and diet.

Safety net it: If you still have bone pain or weakness after replacement, come back for a review.`,

  "Sleep Apnoea": `Name it: You have sleep apnoea. This means your breathing pauses during sleep, which disrupts your rest and makes you feel tired during the day.

Link it: The loud snoring, the fact that someone has noticed you stop breathing in your sleep, your daytime tiredness, and morning headaches, all fit with sleep apnoea.

Plan it: Losing weight if needed and avoiding sedatives or alcohol at night can help. We’ll refer you for a sleep study. You may need a CPAP machine – a mask that keeps your airway open at night.

Safety net it: If you’re falling asleep while driving, you must stop driving and seek urgent review. If you have symptoms like chest pain or palpitations, come back.`,

  "CFS/ME": `Name it: You have chronic fatigue syndrome, also called ME. This means you have severe, persistent tiredness that isn’t improved by rest and affects your ability to do everyday things. It often follows an infection and can last for months or years.

Link it: The overwhelming fatigue you’ve described, the fact that rest doesn’t help, and any other symptoms like muscle pain, poor concentration, or feeling worse after activity, fit with CFS/ME. It’s a real condition, not laziness.

Plan it: We’ll rule out other causes first. Treatment focuses on managing symptoms – pacing yourself, gradually increasing activity within your limits, and sleep hygiene. Cognitive behavioural therapy and graded exercise therapy can help some people. There’s no cure, but many people improve over time.

Safety net it: If you have new symptoms, sudden worsening, or thoughts of self-harm, come back. If you’re unable to care for yourself, we need to know.`,

  "Obesity": `Name it: Your weight is in the range we call obesity. This means your body weight is higher than what’s healthy for your height, and it’s putting extra strain on your body. It increases the risk of conditions like diabetes, heart disease, and joint problems. It’s a medical condition, not a character flaw.

Link it: Your weight and height measurements, and any family history, diet, or activity patterns, help us understand the picture. Many factors affect weight – genetics, medication, stress, and sleep, as well as diet and exercise.

Plan it: We’ll work with you without judgement. Small, sustainable changes work best – improving diet, increasing activity, and addressing things like sleep or stress. We may refer you to a weight management programme. Medication or surgery can be options for some people.

Safety net it: If you have symptoms like breathlessness, chest pain, or joint problems that are getting worse, come back. We’ll also screen for conditions that can be linked to weight.`,

  "Anaphylaxis": `Name it: You’ve had anaphylaxis. This is a severe, life-threatening allergic reaction that affects the whole body. It can cause swelling of the throat, difficulty breathing, a drop in blood pressure, and collapse. It needs immediate treatment with adrenaline.

Link it: The sudden onset after exposure to a trigger – often a food, insect sting, or medicine – and the combination of symptoms like swelling, breathing difficulty, or collapse, fit with anaphylaxis. You may have had milder allergic reactions before.

Plan it: You need an adrenaline auto-injector – an EpiPen – to carry at all times. You and those around you need to know how to use it. We’ll refer you to an allergy clinic to identify the trigger and for advice. Avoid your trigger strictly. You may need to wear a medic alert bracelet.

Safety net it: If you have another reaction, use your EpiPen immediately and call 999. Even if you feel better, you need to go to hospital – symptoms can return.`,

  "Lyme Disease": `Name it: You have Lyme disease. This is an infection spread by tick bites. The bacteria can cause a characteristic rash – often a bull’s-eye pattern – and flu-like symptoms. If left untreated, it can affect joints, nerves, or the heart.

Link it: The rash you’ve had, any tick bite or time spent in grassy or wooded areas, and symptoms like fever, headache, or joint pain, fit with Lyme disease. The rash doesn’t always appear, so we consider it even without one.

Plan it: We’ll give you antibiotics – usually for two to four weeks. Starting treatment early gives the best outcome. We may do blood tests, though they can be negative early on. If you have neurological or other symptoms, you may need longer treatment or specialist input.

Safety net it: If you develop facial weakness, severe headache, neck stiffness, chest pain, or swelling of joints, come back. If symptoms persist after treatment, we may need to refer you.`
}

const TIMER_DURATION = 120 // 2 minutes

export default function DiagnosisPracticePage() {
  const [currentDiagnosis, setCurrentDiagnosis] = useState<string | null>(null)
  const [timeLeft, setTimeLeft] = useState(TIMER_DURATION)
  const [isRunning, setIsRunning] = useState(false)
  const [showAnswer, setShowAnswer] = useState(false)
  const [showDiagnosisPicker, setShowDiagnosisPicker] = useState(false)
  const [searchQuery, setSearchQuery] = useState('')

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

  const handleSelectDiagnosis = (diagnosis: string) => {
    setCurrentDiagnosis(diagnosis)
    setTimeLeft(TIMER_DURATION)
    setIsRunning(false)
    setShowAnswer(false)
    setShowDiagnosisPicker(false)
  }

  const searchLower = searchQuery.trim().toLowerCase()
  const filteredCategories = searchQuery.trim()
    ? diagnosisCategories
        .map(({ category, diagnoses }) => ({
          category,
          diagnoses: diagnoses.filter((d) => d.toLowerCase().includes(searchLower)),
        }))
        .filter((c) => c.diagnoses.length > 0)
    : diagnosisCategories

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
              <li>• Click <strong>New Diagnosis</strong> for a random one, or <strong>choose a specific diagnosis</strong> below.</li>
              <li>• Take 5–10 seconds to plan your structure, then start the timer and explain out loud for 2 minutes.</li>
              <li>• Click <strong>View Answer</strong> to compare with a model structure.</li>
            </ul>
          </div>

          {/* Browse & choose specific diagnosis */}
          <div className="border rounded-lg overflow-hidden">
            <button
              type="button"
              onClick={() => setShowDiagnosisPicker(!showDiagnosisPicker)}
              className="w-full px-4 py-3 text-left font-medium hover:bg-muted/50 transition-colors flex items-center justify-between"
            >
              {showDiagnosisPicker ? 'Hide' : 'Browse'} all 103 diagnoses by category
              <span className="text-muted-foreground text-sm font-normal">
                {showDiagnosisPicker ? '▲' : '▼'}
              </span>
            </button>
            {showDiagnosisPicker && (
              <div className="border-t p-4 bg-muted/30 max-h-80 overflow-y-auto">
                <Input
                  placeholder="Search diagnoses..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="mb-4"
                />
                <div className="space-y-4">
                  {filteredCategories.map(({ category, diagnoses }) => (
                    <div key={category}>
                      <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-2">
                        {category}
                      </p>
                      <div className="flex flex-wrap gap-2">
                        {diagnoses.map((d) => (
                          <Button
                            key={d}
                            variant={currentDiagnosis === d ? 'default' : 'outline'}
                            size="sm"
                            className="text-xs"
                            onClick={() => handleSelectDiagnosis(d)}
                          >
                            {d}
                          </Button>
                        ))}
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            )}
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
            <Button variant="ghost" onClick={handleReset} disabled={!currentDiagnosis}>
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
                <strong className="text-primary">2. Explain it</strong>
                <p className="text-muted-foreground">Simple lay terms, no jargon</p>
              </div>
              <div className="bg-primary/5 p-3 rounded-lg">
                <strong className="text-primary">3. Link it</strong>
                <p className="text-muted-foreground">Connect to their symptoms, personal story, and risk factors – so they see how this diagnosis fits their situation</p>
              </div>
              <div className="bg-primary/5 p-3 rounded-lg">
                <strong className="text-primary">4. Plan it</strong>
                <p className="text-muted-foreground">What happens next, treatment</p>
              </div>
              <div className="bg-amber-50 dark:bg-amber-950/20 p-3 rounded-lg md:col-span-2">
                <strong className="text-amber-700 dark:text-amber-300">5. Safety net it</strong>
                <p className="text-muted-foreground">When to worry and seek help – never skip this!</p>
              </div>
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
