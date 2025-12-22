#!/usr/bin/env python3
"""
Script to add additional priming cases to the repository.
Converts all cases to numerical IDs and adds new cases from user content.
"""

import json

# Read current file
with open('data/priming-cases.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Convert existing cases to numerical IDs (if not already done)
for i, case in enumerate(data['cases'], 1):
    if not case['id'].startswith('case-') or case['id'] == f'case-{chr(96+i)}':
        case['id'] = f'case-{i}'
    # Keep original letter reference if exists
    if 'letter' in case and 'originalLetter' not in case:
        case['originalLetter'] = case.pop('letter')

# Additional cases from user content (starting from case 27)
additional_cases = [
    {
        "id": "case-27",
        "name": "Mr Ahmed",
        "age": 58,
        "gender": "Male",
        "presenting": "Chronic cough for three months",
        "pmh": "Hypertension",
        "medications": "Ramipril 10mg daily",
        "notes": "Non-smoker, normal CXR 6 months ago, BP readings remain good. Denies reflux but mentions mild nasal drip at night. Dry cough, no sputum, haemoptysis, or fever.",
        "primingFocus": "Recognise ACE inhibitor–induced cough as likely, but consider other causes (GORD, post-nasal drip, asthma, malignancy). Plan to confirm symptom timing in relation to starting ramipril. Be ready to discuss switching to an ARB (e.g. losartan). Prepare safety-netting for red flags (haemoptysis, weight loss, dyspnoea).",
        "examinerLens": "Examiner looks for: methodical differential reasoning, medication awareness, safe and guideline-based plan.",
        "approach": [
            "Differential: ACE inhibitor cough, GORD, post-nasal drip, asthma, malignancy",
            "Timing: Confirm when cough started relative to ramipril",
            "Management: Switch to ARB (e.g. losartan)",
            "Red flags: Haemoptysis, weight loss, dyspnoea → urgent review",
            "Safety-net: If persistent or red flags develop"
        ],
        "complexity": "basic"
    },
    {
        "id": "case-28",
        "name": "Mrs Li",
        "age": 32,
        "gender": "Female",
        "presenting": "Fatigue and low mood 4 months postpartum",
        "pmh": "None significant",
        "medications": "None",
        "notes": "Breastfeeding, no history of depression, no bleeding or thyroid disease. Recent FBC shows Hb 110 g/L, TSH normal. Not on contraception yet. Limited family support as partner works away.",
        "primingFocus": "Identify possible postnatal depression vs anaemia or sleep deprivation. Prepare to ask about bonding, intrusive thoughts, and safeguarding (self-harm risk, baby safety). Consider social context and support network. Management likely includes screening (EPDS), emotional support, perinatal mental health referral, and reassurance on breastfeeding-compatible treatments.",
        "examinerLens": "Examiner expects: holistic biopsychosocial framing, awareness of confidentiality, safety-netting for PND.",
        "approach": [
            "Differential: Postnatal depression, anaemia, sleep deprivation",
            "Screening: EPDS, assess bonding, intrusive thoughts",
            "Safeguarding: Self-harm risk, baby safety",
            "Support: Perinatal mental health referral, social support",
            "Management: Breastfeeding-compatible treatments if needed"
        ],
        "complexity": "advanced"
    },
    {
        "id": "case-29",
        "name": "Jake",
        "age": 16,
        "gender": "Male",
        "presenting": "Recurrent hypoglycaemia episodes during school",
        "pmh": "Type 1 diabetes",
        "medications": "Insulin pump",
        "notes": "Frequent episodes of dizziness and sweating during school hours. HbA1c 47 mmol/mol (improved). Admits sometimes skipping lunch if busy. Teachers expressed concern after he nearly fainted last week.",
        "primingFocus": "Recognise recurrent hypoglycaemia; consider dosing errors, meal timing, or excessive basal rate. Prepare to assess self-management, school support, and possible risk-taking. Important safeguarding angle: teenage autonomy, adherence, supervision. Plan: discuss hypo prevention, glucose monitoring, liaison with diabetes nurse.",
        "examinerLens": "Examiner expects: structured risk and safeguarding awareness, collaborative plan with adolescent tone.",
        "approach": [
            "Causes: Dosing errors, meal timing, excessive basal rate",
            "Assessment: Self-management, school support, risk-taking",
            "Safeguarding: Teenage autonomy, adherence, supervision",
            "Management: Hypo prevention, glucose monitoring, diabetes nurse liaison",
            "Support: School support plan, family involvement"
        ],
        "complexity": "advanced"
    },
    {
        "id": "case-30",
        "name": "Mr Daniels",
        "age": 70,
        "gender": "Male",
        "presenting": "Increasing forgetfulness over six months",
        "pmh": "None significant",
        "medications": "None",
        "notes": "Wife manages his finances now. No hallucinations or mood change. Recent bloods (FBC, U&Es, TFT, B12) are normal. No alcohol excess. He drives and manages his own medication.",
        "primingFocus": "Recognise possible early dementia, but must rule out depression and functional causes. Prepare questions on daily functioning, driving, safety, and carer impact. Consider screening tools (GPCOG, MMSE, 6CIT) and referral for memory assessment.",
        "examinerLens": "Examiner expects: methodical, patient-centred reasoning, acknowledges need for collateral history and safeguarding.",
        "approach": [
            "Differential: Early dementia, depression, functional causes",
            "Assessment: Daily functioning, driving safety, carer impact",
            "Screening: GPCOG, MMSE, 6CIT",
            "Referral: Memory clinic for assessment",
            "Safeguarding: Driving safety, capacity, home safety"
        ],
        "complexity": "intermediate"
    }
]

# Add additional cases
data['cases'].extend(additional_cases)
data['meta']['totalCases'] = len(data['cases'])
data['meta']['lastUpdated'] = "2025-01-21"
data['meta']['description'] = "Comprehensive repository of SCA priming cases for 3-minute priming practice. Cases are SCA-appropriate (no examination findings, virtual consultation format). Organized numerically for easy management."

# Write back
with open('data/priming-cases.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, indent=2, ensure_ascii=False)

print(f"✓ Added {len(additional_cases)} additional cases")
print(f"✓ Total cases in repository: {len(data['cases'])}")
print(f"✓ All cases now use numerical IDs (case-1, case-2, etc.)")

