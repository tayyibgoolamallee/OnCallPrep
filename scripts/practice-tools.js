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
// PRIMING CASES DATA
// ============================================

const primingCases = [
    {
        name: "Sarah Mitchell",
        age: 45,
        gender: "Female",
        presenting: "Tiredness for 3 months",
        pmh: "None significant",
        medications: "None",
        notes: "Receptionist noted patient looked tearful when booking",
        approach: [
            "Consider: depression screen, anaemia, thyroid, diabetes, sleep issues",
            "Explore: work/home stress, sleep pattern, mood, appetite",
            "ICE: What does she think is causing it? What's her biggest concern?",
            "Be alert: tearful → may have psychosocial agenda"
        ]
    },
    {
        name: "James Cooper",
        age: 67,
        gender: "Male",
        presenting: "Chest pain - wants to discuss",
        pmh: "Hypertension, Type 2 DM, Ex-smoker",
        medications: "Amlodipine 5mg, Metformin 500mg BD",
        notes: "Last BP 148/92, HbA1c 58 three months ago",
        approach: [
            "Red flags: Clarify nature of chest pain urgently - cardiac vs MSK vs GI",
            "Risk factors: Known CV risk (HTN, DM, ex-smoker, age, male)",
            "Key questions: Exertional? Radiation? Associated symptoms? Duration?",
            "Be ready: May need same-day referral if concerning features"
        ]
    },
    {
        name: "Emma Watson",
        age: 28,
        gender: "Female",
        presenting: "Headaches - getting worse",
        pmh: "Migraines since teens",
        medications: "Combined oral contraceptive",
        notes: "3 appointments in last 2 months for headaches",
        approach: [
            "Red flags: Thunderclap, neurological symptoms, worse lying down, early morning",
            "Key issue: Change in pattern - why worse? New features?",
            "Important: Migraines + COC = check for aura (stroke risk)",
            "Consider: Medication overuse headache, stress, vision changes"
        ]
    },
    {
        name: "David Patel",
        age: 52,
        gender: "Male",
        presenting: "Wants to discuss blood test results",
        pmh: "Obesity (BMI 34), Fatty liver",
        medications: "None",
        notes: "Recent bloods: HbA1c 48, LFTs mildly elevated, lipids raised",
        approach: [
            "Breaking news: Pre-diabetes diagnosis (HbA1c 42-47 = prediabetes, but 48 = diabetes)",
            "Check: Actually this IS diabetes (HbA1c ≥48)",
            "Agenda: Lifestyle discussion, CV risk assessment, need for treatment",
            "Explore: Understanding, readiness to change, concerns about diagnosis"
        ]
    },
    {
        name: "Linda Chen",
        age: 35,
        gender: "Female",
        presenting: "Skin rash on hands",
        pmh: "Hay fever, childhood eczema",
        medications: "Cetirizine PRN",
        notes: "Works as a hairdresser",
        approach: [
            "Occupational: Hairdresser = contact dermatitis highly likely",
            "Pattern: Distribution, triggers, relationship to work",
            "History: Atopic background increases risk",
            "Management: Emollients, avoidance, gloves, may need referral if occupational"
        ]
    },
    {
        name: "Michael Brown",
        age: 72,
        gender: "Male",
        presenting: "Falls - daughter concerned",
        pmh: "Hypertension, BPH, Cataracts",
        medications: "Doxazosin 4mg, Tamsulosin 400mcg, Ramipril 5mg",
        notes: "Daughter called to request appointment",
        approach: [
            "Multifactorial: Vision, medications (doxazosin!), environment, cognition",
            "Key: Doxazosin causes postural hypotension - common falls cause",
            "Assess: Lying/standing BP, gait, vision, cognition screen",
            "Involve: Patient AND daughter - collateral history important"
        ]
    },
    {
        name: "Sophie Taylor",
        age: 16,
        gender: "Female",
        presenting: "Abdominal pain",
        pmh: "None",
        medications: "None",
        notes: "Mum in waiting room, patient asked to be seen alone",
        approach: [
            "Confidentiality: Under 18 but Gillick competent - respect request",
            "Consider: Sexual health, pregnancy, safeguarding",
            "Approach: Non-judgmental, explain confidentiality limits",
            "Safety: Ask about home situation, relationships sensitively"
        ]
    },
    {
        name: "Robert Williams",
        age: 58,
        gender: "Male",
        presenting: "Difficulty sleeping",
        pmh: "Depression (10 years ago), Alcohol excess (historical)",
        medications: "None current",
        notes: "Recently made redundant per previous notes",
        approach: [
            "Mental health: Depression relapse risk - job loss is major trigger",
            "Alcohol: Historical excess - check current use, coping mechanism",
            "Sleep: Pattern, early morning waking (depression), alcohol use",
            "Risk: Assess mood, suicidal ideation given circumstances"
        ]
    }
];

// ============================================
// 2-MINUTE DIAGNOSIS GENERATOR
// ============================================

let diagnosisTimer = null;
let diagnosisTimeLeft = 120; // 2 minutes in seconds
const DIAGNOSIS_TIME = 120;

const diagnosisDisplay = document.getElementById('diagnosis-name');
const timerDisplay = document.getElementById('timer-display');
const timerProgress = document.getElementById('timer-progress');
const newDiagnosisBtn = document.getElementById('new-diagnosis-btn');
const startTimerBtn = document.getElementById('start-timer-btn');
const resetTimerBtn = document.getElementById('reset-timer-btn');

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
    
    startTimerBtn.textContent = 'Pause';
    startTimerBtn.onclick = pauseDiagnosisTimer;
    
    diagnosisTimer = setInterval(() => {
        diagnosisTimeLeft--;
        updateTimerDisplay();
        
        if (diagnosisTimeLeft <= 0) {
            clearInterval(diagnosisTimer);
            diagnosisTimer = null;
            timerDisplay.textContent = "Time's up!";
            startTimerBtn.textContent = 'Start Timer';
            startTimerBtn.disabled = true;
            
            // Play sound or visual feedback
            if (timerProgress) {
                timerProgress.style.width = '0%';
            }
        }
    }, 1000);
}

function pauseDiagnosisTimer() {
    if (diagnosisTimer) {
        clearInterval(diagnosisTimer);
        diagnosisTimer = null;
        startTimerBtn.textContent = 'Resume';
        startTimerBtn.onclick = startDiagnosisTimer;
    }
}

function resetDiagnosisTimer() {
    clearInterval(diagnosisTimer);
    diagnosisTimer = null;
    diagnosisTimeLeft = DIAGNOSIS_TIME;
    updateTimerDisplay();
    startTimerBtn.textContent = 'Start Timer';
    startTimerBtn.onclick = startDiagnosisTimer;
    startTimerBtn.disabled = true;
    if (timerProgress) {
        timerProgress.classList.remove('warning', 'danger');
    }
}

// Initialize timer display on load
document.addEventListener('DOMContentLoaded', () => {
    if (timerDisplay) {
        updateTimerDisplay();
    }
    
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
        startTimerBtn.addEventListener('click', startDiagnosisTimer);
    }

    if (resetTimerBtn) {
        resetTimerBtn.addEventListener('click', resetDiagnosisTimer);
    }
});

// ============================================
// 3-MINUTE PRIMING EXERCISE
// ============================================

let primingTimer = null;
let primingTimeLeft = 180; // 3 minutes
const PRIMING_TIME = 180;
let currentCase = null;

const primingInfo = document.getElementById('priming-info');
const primingTimerDisplay = document.getElementById('priming-timer-display');
const primingTimerProgress = document.getElementById('priming-timer-progress');
const generateCaseBtn = document.getElementById('generate-case-btn');
const startPrimingBtn = document.getElementById('start-priming-btn');
const showApproachBtn = document.getElementById('show-approach-btn');
const primingApproach = document.getElementById('priming-approach');
const approachContent = document.getElementById('approach-content');

function getRandomCase() {
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
    
    let approachHTML = '<ul>';
    caseData.approach.forEach(point => {
        approachHTML += `<li>${point}</li>`;
    });
    approachHTML += '</ul>';
    
    approachContent.innerHTML = approachHTML;
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
    
    startPrimingBtn.textContent = 'Pause';
    startPrimingBtn.onclick = pausePrimingTimer;
    
    primingTimer = setInterval(() => {
        primingTimeLeft--;
        updatePrimingTimer();
        
        if (primingTimeLeft <= 0) {
            clearInterval(primingTimer);
            primingTimer = null;
            primingTimerDisplay.textContent = "Time's up!";
            startPrimingBtn.textContent = 'Start';
            startPrimingBtn.disabled = true;
            showApproachBtn.disabled = false;
            
            if (primingTimerProgress) {
                primingTimerProgress.style.width = '0%';
            }
        }
    }, 1000);
}

function pausePrimingTimer() {
    if (primingTimer) {
        clearInterval(primingTimer);
        primingTimer = null;
        startPrimingBtn.textContent = 'Resume';
        startPrimingBtn.onclick = startPrimingTimer;
    }
}

function resetPrimingTimer() {
    clearInterval(primingTimer);
    primingTimer = null;
    primingTimeLeft = PRIMING_TIME;
    updatePrimingTimer();
    startPrimingBtn.textContent = 'Start Priming';
    startPrimingBtn.onclick = startPrimingTimer;
    if (primingTimerProgress) {
        primingTimerProgress.classList.remove('warning', 'danger');
    }
}

if (generateCaseBtn) {
    generateCaseBtn.addEventListener('click', () => {
        currentCase = getRandomCase();
        displayCase(currentCase);
        displayApproach(currentCase);
        resetPrimingTimer();
        startPrimingBtn.disabled = false;
        showApproachBtn.disabled = true;
        if (primingApproach) {
            primingApproach.style.display = 'none';
        }
    });
}

if (startPrimingBtn) {
    startPrimingBtn.addEventListener('click', startPrimingTimer);
}

if (showApproachBtn) {
    showApproachBtn.addEventListener('click', () => {
        if (primingApproach && currentCase) {
            primingApproach.style.display = 'block';
            primingApproach.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        }
    });
}

// ============================================
// INITIALIZE
// ============================================

document.addEventListener('DOMContentLoaded', () => {
    // Initialize timer displays
    updateTimerDisplay();
    updatePrimingTimer();
});

