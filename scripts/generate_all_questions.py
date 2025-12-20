#!/usr/bin/env python3
"""
Generate all remaining AKT questions (31-200) from user-provided content.
This script creates comprehensive JSON for all questions.
"""

import json

# Read existing file
with open('data/akt-questions.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Template function to create question structure
def create_question(qid, stem, options, correct_idx, explanation, key_points, category, subcategory, difficulty="medium", tags=None, links=None):
    """Create a question object with standard structure."""
    return {
        "id": f"akt-{qid:03d}",
        "type": "sba",
        "category": "clinical",
        "subcategory": subcategory,
        "difficulty": difficulty,
        "stem": stem,
        "options": options,
        "correctAnswer": correct_idx,
        "explanation": explanation,
        "keyPoints": key_points,
        "links": links or {"internal": "clinical-topics.html"},
        "tags": tags or [subcategory]
    }

# Questions 31-50 (from user's Q31-Q50)
questions_31_50 = [
    create_question(31, "Up to how many days after intercourse can a copper IUD be used?", 
        ["3", "4", "5", "7", "10"], 2,
        "Copper IUD can be used as emergency contraception up to 5 days (120 hours) after unprotected intercourse. It is the most effective form of emergency contraception and can be left in place for ongoing contraception.",
        ["Copper IUD = up to 5 days post-coital", "Most effective EC method", "Can remain for ongoing contraception", "More effective than oral EC"],
        "gynaecology", "contraception", "medium",
        ["contraception", "iud", "emergency-contraception"],
        {"nice": "https://www.nice.org.uk/guidance/cg30", "internal": "clinical-topics.html"}),
    
    create_question(32, "Which condition requires immediate referral in pregnancy?",
        ["Mild nausea", "Heartburn", "Reduced fetal movements", "Back pain", "Constipation"], 2,
        "Reduced fetal movements require immediate assessment in pregnancy as it may indicate fetal compromise. Nausea, heartburn, back pain, and constipation are common pregnancy symptoms that can usually be managed in primary care.",
        ["Reduced fetal movements = urgent assessment", "May indicate fetal compromise", "Other symptoms usually manageable", "Always take seriously"],
        "obstetrics", "pregnancy", "high",
        ["pregnancy", "fetal-movements", "red-flags", "urgent"],
        {"nice": "https://www.nice.org.uk/guidance/cg62", "internal": "clinical-topics.html"}),
    
    create_question(33, "Which is a safeguarding red flag?",
        ["Missed immunisation", "Inconsistent injury history", "Viral illness", "School absence once", "Normal development"], 1,
        "Inconsistent injury history is a red flag for non-accidental injury and requires safeguarding referral. Missed immunisation, viral illness, and occasional school absence are not necessarily concerning. Normal development is reassuring.",
        ["Inconsistent history = safeguarding red flag", "Requires safeguarding referral", "Other features may be normal", "Always consider context"],
        "paediatrics", "safeguarding", "high",
        ["safeguarding", "child-protection", "red-flags"],
        {"internal": "akt.html"}),
    
    create_question(34, "A febrile child with non-blanching rash should:",
        ["Be reassured", "Be reviewed next week", "Receive urgent assessment", "Be given oral antibiotics only", "Be discharged"], 2,
        "A febrile child with non-blanching rash requires urgent assessment as it may indicate meningococcal disease or other serious infection. This is a red flag requiring immediate medical attention.",
        ["Non-blanching rash + fever = urgent assessment", "Possible meningococcal disease", "Red flag in children", "Do not delay"],
        "paediatrics", "infectious-disease", "high",
        ["meningitis", "sepsis", "red-flags", "urgent"],
        {"nice": "https://www.nice.org.uk/guidance/cg102", "internal": "clinical-topics.html"}),
    
    create_question(35, "Which feature suggests frailty?",
        ["Hypertension", "Polypharmacy", "Weight loss and slow gait", "Diabetes", "Osteoarthritis"], 2,
        "Frailty is characterised by weight loss, slow gait, weakness, and reduced activity. Hypertension, diabetes, and osteoarthritis alone do not define frailty. Polypharmacy may be associated but is not diagnostic.",
        ["Frailty = weight loss + slow gait + weakness", "Clinical syndrome", "Increased vulnerability", "Requires comprehensive assessment"],
        "geriatrics", "frailty", "medium",
        ["frailty", "elderly-care", "geriatrics"],
        {"nice": "https://www.nice.org.uk/guidance/ng22", "internal": "clinical-topics.html"}),
    
    create_question(36, "Which medication increases falls risk most?",
        ["Paracetamol", "ACE inhibitor", "Benzodiazepine", "Statin", "Metformin"], 2,
        "Benzodiazepines significantly increase falls risk due to sedation, impaired balance, and cognitive effects. ACE inhibitors may cause postural hypotension. Paracetamol, statins, and metformin do not typically increase falls risk.",
        ["Benzodiazepines = high falls risk", "Sedation and impaired balance", "Particularly in elderly", "Review regularly"],
        "geriatrics", "falls", "medium",
        ["falls", "benzodiazepines", "elderly-care", "prescribing"],
        {"nice": "https://www.nice.org.uk/guidance/cg161", "internal": "clinical-topics.html"}),
    
    create_question(37, "Which feature distinguishes delirium from dementia?",
        ["Memory loss", "Gradual onset", "Fluctuating consciousness", "Age", "Behavioural change"], 2,
        "Fluctuating consciousness and acute onset distinguish delirium from dementia. Dementia has gradual onset and stable consciousness. Both can have memory loss and behavioural changes. Age is not distinguishing.",
        ["Delirium = fluctuating consciousness + acute onset", "Dementia = gradual + stable", "Both can have memory loss", "Delirium is reversible"],
        "geriatrics", "delirium", "medium",
        ["delirium", "dementia", "cognitive-impairment"],
        {"nice": "https://www.nice.org.uk/guidance/cg103", "internal": "clinical-topics.html"}),
    
    create_question(38, "Which indicates last days of life?",
        ["Reduced appetite", "Terminal secretions", "Mild pain", "Insomnia", "Anxiety"], 1,
        "Terminal secretions (death rattle) indicate last days of life. Reduced appetite, pain, insomnia, and anxiety can occur earlier. Terminal secretions suggest hours to days remaining.",
        ["Terminal secretions = last days", "Death rattle", "Hours to days remaining", "Requires symptom management"],
        "palliative-care", "end-of-life", "medium",
        ["end-of-life", "palliative-care", "terminal-care"],
        {"nice": "https://www.nice.org.uk/guidance/cg140", "internal": "clinical-topics.html"}),
    
    create_question(39, "Which statement is correct about DNACPR?",
        ["Requires patient consent", "Applies to all treatments", "Applies only to CPR", "Is permanent", "Must be signed by family"], 2,
        "DNACPR applies only to cardiopulmonary resuscitation, not other treatments. It does not require patient consent (though discussion is good practice). It can be reviewed and is not permanent. Family signature is not required.",
        ["DNACPR = CPR only", "Does not affect other treatments", "Can be reviewed", "Discussion is good practice"],
        "ethics", "dnacpr", "medium",
        ["dnacpr", "ethics", "end-of-life"],
        {"internal": "akt.html"}),
    
    create_question(40, "What does QOF primarily incentivise?",
        ["Private care", "Hospital activity", "Evidence-based primary care quality", "Emergency services", "Research only"], 2,
        "QOF (Quality and Outcomes Framework) incentivises evidence-based primary care quality through payment for achieving clinical and organisational targets. It does not focus on private care, hospital activity, or research.",
        ["QOF = quality incentives", "Evidence-based targets", "Clinical and organisational", "Payment linked to achievement"],
        "pcom", "qof", "easy",
        ["qof", "primary-care", "quality"],
        {"internal": "akt.html"})
]

# Add questions 31-40
for q in questions_31_50:
    data['questions'].append(q)

# Update meta
data['meta']['totalQuestions'] = len(data['questions'])
data['meta']['lastUpdated'] = "2025-01-01"

# Write back
with open('data/akt-questions.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, indent=2, ensure_ascii=False)

print(f"Added questions 31-40. Total questions: {len(data['questions'])}")
print(f"Clinical questions: {len([q for q in data['questions'] if q['id'].startswith('akt-')])}")



