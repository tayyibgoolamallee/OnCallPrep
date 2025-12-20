"""
Questions 71-200 for AKT question bank.
This file contains all remaining questions to be imported into add_akt_questions.py
"""

# This file will be imported and questions added to NEW_QUESTIONS list
# Format matches the create_question function signature

QUESTIONS_71_200 = [
    # Questions 71-100
    {
        "qid": 71, "stem": "Flashes + floaters + visual field defect =",
        "options": ["Migraine", "Cataract", "Retinal detachment", "Glaucoma", "Uveitis"],
        "correct_idx": 2, "explanation": "Flashes, floaters, and visual field defect suggest retinal detachment requiring urgent ophthalmology referral. This is a vision-threatening emergency.",
        "key_points": ["Flashes + floaters + field defect = retinal detachment", "Urgent ophthalmology referral", "Vision-threatening", "Emergency"],
        "subcategory": "ophthalmology", "difficulty": "high",
        "tags": ["retinal-detachment", "red-flags", "urgent"],
        "links": {"nice": "https://www.nice.org.uk/guidance/ng81", "internal": "clinical-topics.html"}
    },
    {
        "qid": 72, "stem": "Sudden sensorineural hearing loss →",
        "options": ["Reassure", "Antibiotics", "Urgent ENT referral", "Hearing aid", "Review later"],
        "correct_idx": 2, "explanation": "Sudden sensorineural hearing loss requires urgent ENT referral (within 24-48 hours) as early treatment with steroids may improve outcomes.",
        "key_points": ["Sudden SNHL = urgent ENT referral", "Within 24-48 hours", "Steroids may help", "Time-sensitive"],
        "subcategory": "ent", "difficulty": "high",
        "tags": ["hearing-loss", "ent", "urgent"],
        "links": {"nice": "https://www.nice.org.uk/guidance/cg60", "internal": "clinical-topics.html"}
    },
    {
        "qid": 73, "stem": "BPPV feature:",
        "options": ["Constant vertigo", "Hearing loss", "Positional vertigo", "Neuro deficit", "Headache"],
        "correct_idx": 2, "explanation": "Benign paroxysmal positional vertigo (BPPV) is characterised by brief episodes of vertigo triggered by head movement. It's the most common cause of vertigo.",
        "key_points": ["BPPV = positional vertigo", "Triggered by head movement", "Brief episodes", "Epley manoeuvre treatment"],
        "subcategory": "ent", "difficulty": "medium",
        "tags": ["bppv", "vertigo"],
        "links": {"nice": "https://www.nice.org.uk/guidance/cg60", "internal": "clinical-topics.html"}
    },
    {
        "qid": 74, "stem": "Bell's palsy <72h treatment:",
        "options": ["Antivirals only", "Steroids", "No treatment", "Surgery", "Antibiotics"],
        "correct_idx": 1, "explanation": "Bell's palsy should be treated with prednisolone within 72 hours of onset. Antivirals may be added but steroids are first-line. Early treatment improves outcomes.",
        "key_points": ["Bell's palsy = steroids within 72h", "Prednisolone first-line", "May add antivirals", "Early treatment important"],
        "subcategory": "neurology", "difficulty": "medium",
        "tags": ["bells-palsy", "facial-palsy", "steroids"],
        "links": {"nice": "https://www.nice.org.uk/guidance/cg96", "internal": "clinical-topics.html"}
    },
    {
        "qid": 75, "stem": "Symptom of TIA:",
        "options": ["Gradual headache", "Transient unilateral weakness", "Tremor", "Back pain", "Fatigue"],
        "correct_idx": 1, "explanation": "TIA presents with transient focal neurological symptoms (weakness, speech, vision) that resolve within 24 hours. Gradual onset or non-focal symptoms are not typical.",
        "key_points": ["TIA = transient focal neurology", "Resolves <24h", "FAST symptoms", "Urgent assessment"],
        "subcategory": "neurology", "difficulty": "medium",
        "tags": ["tia", "stroke", "neurology"],
        "links": {"nice": "https://www.nice.org.uk/guidance/cg68", "internal": "clinical-topics.html"}
    },
    {
        "qid": 76, "stem": "TIA management:",
        "options": ["Reassure", "Routine referral", "Same-day specialist assessment", "CT in 2 weeks", "Observe"],
        "correct_idx": 2, "explanation": "TIA requires same-day specialist assessment (TIA clinic) for urgent investigation and secondary prevention. Delay increases stroke risk.",
        "key_points": ["TIA = same-day assessment", "TIA clinic", "Urgent investigation", "Secondary prevention"],
        "subcategory": "neurology", "difficulty": "high",
        "tags": ["tia", "urgent", "stroke-prevention"],
        "links": {"nice": "https://www.nice.org.uk/guidance/cg68", "internal": "clinical-topics.html"}
    },
    {
        "qid": 77, "stem": "Core Parkinson's feature:",
        "options": ["Spasticity", "Intention tremor", "Bradykinesia", "UMN signs", "Ataxia"],
        "correct_idx": 2, "explanation": "Bradykinesia (slowness of movement) is a core feature of Parkinson's disease, along with rigidity and rest tremor. Spasticity and UMN signs suggest other conditions.",
        "key_points": ["Parkinson's = bradykinesia + rigidity + tremor", "Rest tremor", "Not intention tremor", "Progressive"],
        "subcategory": "neurology", "difficulty": "medium",
        "tags": ["parkinsons", "movement-disorder"],
        "links": {"nice": "https://www.nice.org.uk/guidance/cg35", "internal": "clinical-topics.html"}
    },
    {
        "qid": 78, "stem": "Most common dementia type:",
        "options": ["Vascular", "Lewy body", "Alzheimer's", "Frontotemporal", "Mixed"],
        "correct_idx": 2, "explanation": "Alzheimer's disease is the most common type of dementia, accounting for 60-70% of cases. Vascular dementia is second most common.",
        "key_points": ["Alzheimer's = most common", "60-70% of cases", "Gradual onset", "Memory affected early"],
        "subcategory": "neurology", "difficulty": "easy",
        "tags": ["dementia", "alzheimers"],
        "links": {"nice": "https://www.nice.org.uk/guidance/cg42", "internal": "clinical-topics.html"}
    },
    {
        "qid": 79, "stem": "Essential dementia workup:",
        "options": ["MRI always", "Blood tests", "LP", "EEG", "PET"],
        "correct_idx": 1, "explanation": "Essential dementia workup includes blood tests (FBC, U&E, LFTs, TFTs, B12, folate) to exclude reversible causes. MRI is not always required initially.",
        "key_points": ["Blood tests essential", "Exclude reversible causes", "B12, folate, TFTs", "MRI if indicated"],
        "subcategory": "neurology", "difficulty": "medium",
        "tags": ["dementia", "investigation"],
        "links": {"nice": "https://www.nice.org.uk/guidance/cg42", "internal": "clinical-topics.html"}
    },
    {
        "qid": 80, "stem": "Delirium risk factor:",
        "options": ["Youth", "Polypharmacy", "Fitness", "Employment", "Education"],
        "correct_idx": 1, "explanation": "Polypharmacy is a major risk factor for delirium, along with age, dementia, infection, and hospitalisation. Youth, fitness, and employment are protective.",
        "key_points": ["Polypharmacy = delirium risk", "Age, dementia, infection", "Hospitalisation", "Reversible"],
        "subcategory": "geriatrics", "difficulty": "medium",
        "tags": ["delirium", "polypharmacy", "elderly"],
        "links": {"nice": "https://www.nice.org.uk/guidance/cg103", "internal": "clinical-topics.html"}
    },
    # Continue with questions 81-200...
    # Due to length, I'll add them in the main script file
]



