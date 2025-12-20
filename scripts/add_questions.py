#!/usr/bin/env python3
"""
Script to add remaining AKT questions (21-200) to the JSON file.
This script will parse the user-provided questions and add them to the JSON.
"""

import json
import re

# Read existing file
with open('data/akt-questions.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Questions 21-50 from user's content
questions_21_50 = [
    {
        "id": "akt-021",
        "type": "sba",
        "category": "clinical",
        "subcategory": "musculoskeletal",
        "difficulty": "medium",
        "stem": "Which symptom suggests cauda equina syndrome?",
        "options": [
            "Localised lumbar pain",
            "Sciatica",
            "Saddle anaesthesia",
            "Morning stiffness",
            "Reduced mobility"
        ],
        "correctAnswer": 2,
        "explanation": "Saddle anaesthesia (numbness in perineum/saddle area) is a red flag for cauda equina syndrome requiring urgent neurosurgical referral. Other red flags include bilateral sciatica, bladder/bowel dysfunction, and lower limb weakness.",
        "keyPoints": [
            "Saddle anaesthesia = cauda equina red flag",
            "Requires urgent neurosurgical referral",
            "Other red flags: bilateral sciatica, bladder/bowel dysfunction",
            "Emergency condition"
        ],
        "links": {
            "nice": "https://www.nice.org.uk/guidance/cg88",
            "internal": "clinical-topics.html"
        },
        "tags": ["back-pain", "cauda-equina", "red-flags", "urgent"]
    },
    {
        "id": "akt-022",
        "type": "sba",
        "category": "clinical",
        "subcategory": "neurology",
        "difficulty": "medium",
        "stem": "Which feature requires urgent referral?",
        "options": [
            "Tension-type headache",
            "Migraine with aura",
            "Headache with papilloedema",
            "Stress-related headache",
            "Cluster headache"
        ],
        "correctAnswer": 2,
        "explanation": "Headache with papilloedema suggests raised intracranial pressure and requires urgent referral. This could indicate brain tumour, idiopathic intracranial hypertension, or other serious pathology. Tension-type, migraine, and cluster headaches are usually managed in primary care.",
        "keyPoints": [
            "Papilloedema = raised ICP",
            "Requires urgent referral",
            "Possible brain tumour or IIH",
            "Other red flags: thunderclap, focal neurology, confusion"
        ],
        "links": {
            "nice": "https://www.nice.org.uk/guidance/cg150",
            "internal": "clinical-topics.html"
        },
        "tags": ["headache", "papilloedema", "red-flags", "urgent"]
    },
    {
        "id": "akt-023",
        "type": "sba",
        "category": "clinical",
        "subcategory": "neurology",
        "difficulty": "medium",
        "stem": "After a single unprovoked seizure, what advice is correct?",
        "options": [
            "Continue driving",
            "Inform DVLA and stop driving",
            "Drive after 1 week",
            "Drive only daytime",
            "No restrictions"
        ],
        "correctAnswer": 1,
        "explanation": "After a single unprovoked seizure, patients must inform DVLA and stop driving. DVLA will typically require 6-12 months seizure-free before license return. Driving with epilepsy/seizures is illegal and dangerous.",
        "keyPoints": [
            "Single unprovoked seizure = inform DVLA",
            "Must stop driving",
            "6-12 months seizure-free typically required",
            "Illegal to drive with active seizures"
        ],
        "links": {
            "internal": "akt.html#img-tips"
        },
        "tags": ["epilepsy", "seizure", "driving", "dvla"]
    },
    {
        "id": "akt-024",
        "type": "sba",
        "category": "clinical",
        "subcategory": "ebp",
        "difficulty": "hard",
        "stem": "If baseline risk is 10% and relative risk reduction is 25%, what is the NNT?",
        "options": [
            "4",
            "10",
            "20",
            "40",
            "100"
        ],
        "correctAnswer": 3,
        "explanation": "NNT = 1 / ARR. Baseline risk 10%, RRR 25% means absolute risk reduction = 10% × 0.25 = 2.5%. NNT = 1 / 0.025 = 40. This means 40 people need treatment for 1 to benefit.",
        "keyPoints": [
            "NNT = 1 / ARR",
            "ARR = baseline risk × RRR",
            "ARR = 10% × 25% = 2.5%",
            "NNT = 1 / 0.025 = 40"
        ],
        "links": {
            "internal": "akt.html#ebp-pcom"
        },
        "tags": ["nnt", "arr", "statistics", "ebp"]
    },
    {
        "id": "akt-025",
        "type": "sba",
        "category": "clinical",
        "subcategory": "ebp",
        "difficulty": "medium",
        "stem": "A wide confidence interval suggests:",
        "options": [
            "High precision",
            "Low uncertainty",
            "Greater uncertainty",
            "Larger sample size",
            "No bias"
        ],
        "correctAnswer": 2,
        "explanation": "A wide confidence interval indicates greater uncertainty about the true effect. Narrow intervals indicate high precision. Larger sample sizes typically produce narrower (more precise) intervals. Bias is separate from precision.",
        "keyPoints": [
            "Wide CI = greater uncertainty",
            "Narrow CI = high precision",
            "Larger samples = narrower CIs",
            "CI width reflects precision, not bias"
        ],
        "links": {
            "internal": "akt.html#ebp-pcom"
        },
        "tags": ["confidence-interval", "statistics", "ebp", "uncertainty"]
    }
]

# Add questions 21-25 to the data
for q in questions_21_50[:5]:
    data['questions'].append(q)

# Update meta
data['meta']['totalQuestions'] = len(data['questions'])
data['meta']['lastUpdated'] = "2025-01-01"

# Write back
with open('data/akt-questions.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, indent=2, ensure_ascii=False)

print(f"Added questions 21-25. Total questions: {len(data['questions'])}")




