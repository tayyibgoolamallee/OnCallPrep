/* ============================================
   OnCallPrep - AKT Questions Interface
   ============================================ */

let allQuestions = [];
let filteredQuestions = [];
let currentQuestionIndex = 0;
let currentQuestion = null;
let userAnswers = {}; // Store user's answers
let studyMode = 'untimed'; // 'untimed', 'timed', 'exam'
let timerInterval = null;
let timeRemaining = 0;
let isPro = false;

// Load questions from JSON
async function loadQuestions() {
    try {
        const response = await fetch('/data/akt-questions.json');
        if (!response.ok) {
            throw new Error('Failed to load questions');
        }
        const data = await response.json();
        allQuestions = data.questions || [];
        filteredQuestions = [...allQuestions];
        
        // Check if user is pro
        if (typeof getUserSubscription === 'function') {
            const subscription = await getUserSubscription();
            isPro = subscription.isPro || false;
        }
        
        // Update pro notice visibility
        const proNotice = document.getElementById('pro-notice');
        const proUserNotice = document.getElementById('pro-user-notice');
        if (proNotice && proUserNotice) {
            if (isPro) {
                proNotice.style.display = 'none';
                proUserNotice.style.display = 'block';
            } else {
                proNotice.style.display = 'block';
                proUserNotice.style.display = 'none';
            }
        }
        
        // Filter questions based on pro status
        filterQuestionsByAccess();
        
        console.log(`Loaded ${allQuestions.length} questions. Pro access: ${isPro}`);
        displayQuestionList();
        
        // Load first question if available
        if (filteredQuestions.length > 0) {
            loadQuestionByIndex(0);
        }
    } catch (error) {
        console.error('Error loading questions:', error);
        document.getElementById('question-container').innerHTML = `
            <div style="padding: 2rem; text-align: center;">
                <h3>Error Loading Questions</h3>
                <p>${error.message}</p>
                <p style="margin-top: 1rem; color: #6b7280;">Please refresh the page or contact support if the problem persists.</p>
            </div>
        `;
    }
}

// Filter questions based on user access
function filterQuestionsByAccess() {
    if (isPro) {
        // Pro users get all questions
        filteredQuestions = [...allQuestions];
    } else {
        // Free users get first 20 questions (sample)
        filteredQuestions = allQuestions.slice(0, 20);
    }
}

// Display question list/navigation
function displayQuestionList() {
    const container = document.getElementById('question-container');
    if (!container) return;
    
    // Show question count
    const questionCount = document.getElementById('question-count');
    if (questionCount) {
        questionCount.textContent = `Showing ${filteredQuestions.length} of ${allQuestions.length} questions`;
    }
    
    // If no questions, show message
    if (filteredQuestions.length === 0) {
        container.innerHTML = `
            <div style="padding: 2rem; text-align: center;">
                <h3>No Questions Available</h3>
                <p>${isPro ? 'No questions match your filters.' : 'Upgrade to Pro to access all 275 questions!'}</p>
                ${!isPro ? '<a href="pricing.html" class="btn btn-primary" style="margin-top: 1rem;">Upgrade to Pro</a>' : ''}
            </div>
        `;
        return;
    }
}

// Load question by index
function loadQuestionByIndex(index) {
    if (index < 0 || index >= filteredQuestions.length) {
        return;
    }
    
    currentQuestionIndex = index;
    currentQuestion = filteredQuestions[index];
    
    displayQuestion(currentQuestion);
    updateNavigation();
}

// Display a question
function displayQuestion(question) {
    const container = document.getElementById('question-container');
    if (!container || !question) return;
    
    const userAnswer = userAnswers[question.id];
    const showAnswer = userAnswer !== undefined;
    
    const optionsHtml = question.options.map((option, idx) => {
        const isSelected = userAnswer === idx;
        const isCorrect = idx === question.correctAnswer;
        let buttonClass = 'btn btn-outline';
        let buttonStyle = 'display: block; width: 100%; margin: 0.5rem 0; text-align: left; padding: 1rem;';
        
        if (showAnswer) {
            if (isCorrect) {
                buttonClass = 'btn';
                buttonStyle += ' background: #d1fae5; border-color: #10b981; color: #065f46;';
            } else if (isSelected && !isCorrect) {
                buttonClass = 'btn';
                buttonStyle += ' background: #fee2e2; border-color: #ef4444; color: #991b1b;';
            }
        }
        
        return `
            <button class="${buttonClass}" 
                    onclick="selectAnswer(${idx})" 
                    style="${buttonStyle}"
                    ${showAnswer ? 'disabled' : ''}>
                <strong>${String.fromCharCode(65 + idx)}.</strong> ${option}
                ${showAnswer && isCorrect ? ' ✓' : ''}
                ${showAnswer && isSelected && !isCorrect ? ' ✗' : ''}
            </button>
        `;
    }).join('');
    
    const explanationHtml = showAnswer ? `
        <div style="margin-top: 2rem; padding: 1.5rem; background: #f0f9ff; border-radius: 8px; border-left: 4px solid #3b82f6;">
            <h4 style="margin-top: 0; color: #1e40af;">Explanation</h4>
            <p style="color: #1e3a8a; line-height: 1.7;">${question.explanation}</p>
            ${question.keyPoints && question.keyPoints.length > 0 ? `
                <div style="margin-top: 1rem;">
                    <strong style="color: #1e40af;">Key Points:</strong>
                    <ul style="color: #1e3a8a; margin-top: 0.5rem;">
                        ${question.keyPoints.map(kp => `<li>${kp}</li>`).join('')}
                    </ul>
                </div>
            ` : ''}
            ${question.links && question.links.nice ? `
                <div style="margin-top: 1rem;">
                    <a href="${question.links.nice}" target="_blank" style="color: #3b82f6;">View NICE Guidelines →</a>
                </div>
            ` : ''}
        </div>
    ` : '';
    
    container.innerHTML = `
        <div style="padding: 2rem;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem;">
                <div>
                    <span style="background: #e0e7ff; color: #4338ca; padding: 0.25rem 0.75rem; border-radius: 4px; font-size: 0.875rem; font-weight: 600;">
                        ${question.category.toUpperCase()} • ${question.difficulty}
                    </span>
                    ${question.subcategory ? `<span style="margin-left: 0.5rem; color: #6b7280; font-size: 0.875rem;">${question.subcategory}</span>` : ''}
                </div>
                <div style="color: #6b7280; font-size: 0.875rem;">
                    Question ${currentQuestionIndex + 1} of ${filteredQuestions.length}
                </div>
            </div>
            
            <h3 style="margin-bottom: 1.5rem; color: #111827; line-height: 1.6;">${question.stem}</h3>
            
            <div style="margin: 1.5rem 0;">
                ${optionsHtml}
            </div>
            
            ${explanationHtml}
            
            <div style="display: flex; gap: 1rem; margin-top: 2rem; justify-content: space-between;">
                <button class="btn btn-outline" 
                        onclick="loadQuestionByIndex(${currentQuestionIndex - 1})"
                        ${currentQuestionIndex === 0 ? 'disabled' : ''}>
                    ← Previous
                </button>
                <button class="btn btn-primary" 
                        onclick="${showAnswer ? `loadQuestionByIndex(${currentQuestionIndex + 1})` : 'showAnswer()'}"
                        ${currentQuestionIndex === filteredQuestions.length - 1 && showAnswer ? 'disabled' : ''}>
                    ${showAnswer ? 'Next →' : 'Show Answer'}
                </button>
            </div>
        </div>
    `;
}

// Select an answer
function selectAnswer(answerIndex) {
    if (!currentQuestion) return;
    
    userAnswers[currentQuestion.id] = answerIndex;
    displayQuestion(currentQuestion);
}

// Show answer
function showAnswer() {
    if (!currentQuestion) return;
    
    // If no answer selected, select the correct one for display
    if (userAnswers[currentQuestion.id] === undefined) {
        userAnswers[currentQuestion.id] = currentQuestion.correctAnswer;
    }
    
    displayQuestion(currentQuestion);
}

// Update navigation buttons
function updateNavigation() {
    // Navigation is handled in displayQuestion
}

// Apply filters
function applyFilters() {
    const categoryFilter = document.getElementById('category-filter')?.value || 'all';
    const difficultyFilter = document.getElementById('difficulty-filter')?.value || 'all';
    
    filteredQuestions = allQuestions.filter(q => {
        const categoryMatch = categoryFilter === 'all' || q.category === categoryFilter;
        const difficultyMatch = difficultyFilter === 'all' || q.difficulty === difficultyFilter;
        return categoryMatch && difficultyMatch;
    });
    
    // Apply pro access filter
    if (!isPro) {
        filteredQuestions = filteredQuestions.slice(0, 20);
    }
    
    // Reset to first question
    if (filteredQuestions.length > 0) {
        currentQuestionIndex = 0;
        loadQuestionByIndex(0);
    } else {
        displayQuestionList();
    }
}

// Set study mode
function setStudyMode(mode) {
    studyMode = mode;
    
    // Update UI to show mode
    document.querySelectorAll('[onclick*="setStudyMode"]').forEach(btn => {
        btn.classList.remove('btn-primary');
        btn.classList.add('btn-outline');
    });
    
    const activeBtn = document.querySelector(`[onclick="setStudyMode('${mode}')"]`);
    if (activeBtn) {
        activeBtn.classList.remove('btn-outline');
        activeBtn.classList.add('btn-primary');
    }
    
    // For exam mode, could start timer, etc.
    if (mode === 'exam') {
        alert('Exam mode: Full 160 questions, 3 hours, no explanations until end.');
    }
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', async function() {
    await loadQuestions();
});

// Make functions available globally
window.loadQuestionByIndex = loadQuestionByIndex;
window.selectAnswer = selectAnswer;
window.showAnswer = showAnswer;
window.applyFilters = applyFilters;
window.setStudyMode = setStudyMode;

