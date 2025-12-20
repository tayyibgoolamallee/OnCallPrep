/**
 * Case Self-Assessment Scoring System
 * Calculates score based on checklist and provides feedback
 */

function calculateScore(button) {
    const details = button.closest('details');
    const assessmentContent = details.querySelector('.assessment-content');
    
    // Get all checkboxes for each domain
    const domain1Checks = assessmentContent.querySelectorAll('.domain1-check:checked');
    const domain2Checks = assessmentContent.querySelectorAll('.domain2-check:checked');
    const domain3Checks = assessmentContent.querySelectorAll('.domain3-check:checked');
    
    // Count total items per domain
    const domain1Total = assessmentContent.querySelectorAll('.domain1-check').length;
    const domain2Total = assessmentContent.querySelectorAll('.domain2-check').length;
    const domain3Total = assessmentContent.querySelectorAll('.domain3-check').length;
    
    // Calculate scores (Domain 2 is weighted 1.5x)
    const domain1Score = (domain1Checks.length / domain1Total) * 3; // Max 3 points
    const domain2Score = (domain2Checks.length / domain2Total) * 3 * 1.5; // Max 4.5 points (weighted)
    const domain3Score = (domain3Checks.length / domain3Total) * 3; // Max 3 points
    
    const totalScore = domain1Score + domain2Score + domain3Score;
    const maxScore = 10.5; // 3 + 4.5 + 3
    const percentage = (totalScore / maxScore) * 100;
    
    // Determine grade (updated boundaries)
    // Clear Pass: >9/10.5, Pass: >6/10.5, Clear Fail: <3/10.5, Minor Fail: 3-6/10.5
    let grade, gradeClass, feedback;
    if (totalScore > 9.0) {
        grade = "Clear Pass";
        gradeClass = "score-clear-pass";
        feedback = "Excellent performance. You demonstrated strong skills across all domains. Well done!";
    } else if (totalScore > 6.0) {
        grade = "Pass";
        gradeClass = "score-pass";
        feedback = "Good performance. You met the requirements for safe independent practice. Consider reviewing any unchecked items.";
    } else if (totalScore >= 3.0) {
        grade = "Minor Fail";
        gradeClass = "score-minor-fail";
        feedback = "Some areas need improvement. Review the unchecked items and practice those skills before your exam.";
    } else {
        grade = "Clear Fail";
        gradeClass = "score-clear-fail";
        feedback = "Significant improvement needed. Focus on the areas you missed. Consider additional practice and review of the marking criteria.";
    }
    
    // Calculate individual domain grades (lenient boundaries)
    function getDomainGrade(score, max) {
        const percentage = (score / max) * 100;
        // Clear Pass: >76%, Minor Pass: 52-76%, Minor Fail: 29-52%, Clear Fail: <29%
        if (percentage > 76) return { grade: "Clear Pass (3)", class: "score-clear-pass", points: 3 };
        if (percentage >= 52) return { grade: "Minor Pass (2)", class: "score-pass", points: 2 };
        if (percentage >= 29) return { grade: "Minor Fail (1)", class: "score-minor-fail", points: 1 };
        return { grade: "Clear Fail (0)", class: "score-clear-fail", points: 0 };
    }
    
    const domain1Grade = getDomainGrade(domain1Score, 3);
    const domain2Grade = getDomainGrade(domain2Score, 4.5);
    const domain3Grade = getDomainGrade(domain3Score, 3);
    
    // Calculate weighted total
    const weightedTotal = (domain1Grade.points * 1.0) + (domain2Grade.points * 1.5) + (domain3Grade.points * 1.0);
    const maxWeighted = 10.5; // (3 * 1.0) + (3 * 1.5) + (3 * 1.0)
    const overallPercentage = (weightedTotal / maxWeighted) * 100;
    
    // Overall grade (updated boundaries)
    let overallGrade, overallClass;
    if (weightedTotal > 9.0) {
        overallGrade = "Clear Pass";
        overallClass = "score-clear-pass";
    } else if (weightedTotal > 6.0) {
        overallGrade = "Pass";
        overallClass = "score-pass";
    } else if (weightedTotal >= 3.0) {
        overallGrade = "Minor Fail";
        overallClass = "score-minor-fail";
    } else {
        overallGrade = "Clear Fail";
        overallClass = "score-clear-fail";
    }
    
    // Display result
    const resultDiv = assessmentContent.querySelector('.score-result');
    const scoreBreakdown = resultDiv.querySelector('.score-breakdown');
    
    scoreBreakdown.innerHTML = `
        <div class="domain-scores">
            <div class="domain-score-card ${domain1Grade.class}">
                <div class="domain-score-header">
                    <span class="domain-name">Domain 1: Data Gathering & Diagnosis</span>
                    <span class="domain-grade">${domain1Grade.grade}</span>
                </div>
                <div class="domain-score-details">
                    <span>${domain1Checks.length}/${domain1Total} items checked</span>
                    <span>Weight: 1.0x</span>
                </div>
            </div>
            
            <div class="domain-score-card ${domain2Grade.class}">
                <div class="domain-score-header">
                    <span class="domain-name">Domain 2: Clinical Management</span>
                    <span class="domain-grade">${domain2Grade.grade}</span>
                </div>
                <div class="domain-score-details">
                    <span>${domain2Checks.length}/${domain2Total} items checked</span>
                    <span>Weight: 1.5x</span>
                </div>
            </div>
            
            <div class="domain-score-card ${domain3Grade.class}">
                <div class="domain-score-header">
                    <span class="domain-name">Domain 3: Relating to Others</span>
                    <span class="domain-grade">${domain3Grade.grade}</span>
                </div>
                <div class="domain-score-details">
                    <span>${domain3Checks.length}/${domain3Total} items checked</span>
                    <span>Weight: 1.0x</span>
                </div>
            </div>
        </div>
        
        <div class="overall-score ${overallClass}">
            <div class="overall-score-header">
                <span class="overall-label">Overall Case Score</span>
                <span class="overall-value">${overallGrade} (${Math.round(overallPercentage)}%)</span>
            </div>
            <div class="overall-breakdown">
                <span>Weighted Total: ${Math.round(weightedTotal * 10) / 10}/10.5 points</span>
            </div>
        </div>
        
        <div class="score-feedback ${overallClass}">
            <p><strong>Feedback:</strong> ${feedback}</p>
        </div>
    `;
    
    resultDiv.style.display = 'block';
    resultDiv.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
}

