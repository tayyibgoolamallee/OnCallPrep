/**
 * Case Self-Assessment Scoring System
 * Calculates score based on checklist and provides feedback
 */

function calculateScore(button) {
    // Find the parent container that holds all assessment domains
    // The button is inside the self-assessment section, find the parent div that contains all domains
    let assessmentContainer = null;
    
    // First, try to find a parent that contains assessment-details elements
    let parent = button.parentElement;
    while (parent && parent !== document.body) {
        if (parent.querySelector('.assessment-details')) {
            assessmentContainer = parent;
            break;
        }
        parent = parent.parentElement;
    }
    
    // Fallback: look for div with padding that contains assessment content
    if (!assessmentContainer) {
        assessmentContainer = button.closest('div[style*="padding"]');
    }
    
    if (!assessmentContainer) {
        console.error('Could not find assessment container');
        return;
    }
    
    // Get all checkboxes for each domain across ALL assessment-content divs in the container
    const domain1Checks = assessmentContainer.querySelectorAll('.domain1-check:checked');
    const domain2Checks = assessmentContainer.querySelectorAll('.domain2-check:checked');
    const domain3Checks = assessmentContainer.querySelectorAll('.domain3-check:checked');
    
    // Count total items per domain across all domains
    const domain1Total = assessmentContainer.querySelectorAll('.domain1-check').length;
    const domain2Total = assessmentContainer.querySelectorAll('.domain2-check').length;
    const domain3Total = assessmentContainer.querySelectorAll('.domain3-check').length;
    
    // Calculate domain scores based on percentage of items checked
    // Each domain can score 0-4 points: 4=Clear Pass, 3=Pass, 2=Fail, 1=Clear Fail, 0=No items
    function getDomainPoints(checked, total) {
        const percentage = (checked / total) * 100;
        if (percentage >= 90) return 4; // Clear Pass
        if (percentage >= 70) return 3; // Pass
        if (percentage >= 50) return 2; // Fail
        if (percentage >= 30) return 1; // Clear Fail
        return 0;
    }
    
    const domain1Points = getDomainPoints(domain1Checks.length, domain1Total);
    const domain2Points = getDomainPoints(domain2Checks.length, domain2Total);
    const domain3Points = getDomainPoints(domain3Checks.length, domain3Total);
    
    // Calculate weighted total (Domain 2 weighted 1.5x)
    const weightedTotal = (domain1Points * 1.0) + (domain2Points * 1.5) + (domain3Points * 1.0);
    const maxWeighted = 10.5; // (4 * 1.0) + (4 * 1.5) + (4 * 1.0) = 4 + 6 + 4 = 14, but we cap at 10.5 for grading
    const overallPercentage = (weightedTotal / 10.5) * 100;
    
    // Determine overall grade: 4,3,2,1 system mapped to total 10.5
    // Clear Pass: >9/10.5, Pass: 6-9/10.5, Fail: 3-6/10.5, Clear Fail: <3/10.5
    let overallGrade, overallClass, feedback;
    if (weightedTotal > 9.0) {
        overallGrade = "Clear Pass (4)";
        overallClass = "score-clear-pass";
        feedback = "Excellent performance. You demonstrated strong skills across all domains. Well done!";
    } else if (weightedTotal >= 6.0) {
        overallGrade = "Pass (3)";
        overallClass = "score-pass";
        feedback = "Good performance. You met the requirements for safe independent practice. Consider reviewing any unchecked items.";
    } else if (weightedTotal >= 3.0) {
        overallGrade = "Fail (2)";
        overallClass = "score-minor-fail";
        feedback = "Some areas need improvement. Review the unchecked items and practice those skills before your exam.";
    } else {
        overallGrade = "Clear Fail (1)";
        overallClass = "score-clear-fail";
        feedback = "Significant improvement needed. Focus on the areas you missed. Consider additional practice and review of the marking criteria.";
    }
    
    // Get domain grade labels
    function getDomainGradeLabel(points) {
        if (points === 4) return { grade: "Clear Pass (4)", class: "score-clear-pass" };
        if (points === 3) return { grade: "Pass (3)", class: "score-pass" };
        if (points === 2) return { grade: "Fail (2)", class: "score-minor-fail" };
        if (points === 1) return { grade: "Clear Fail (1)", class: "score-clear-fail" };
        return { grade: "Clear Fail (0)", class: "score-clear-fail" };
    }
    
    const domain1Grade = getDomainGradeLabel(domain1Points);
    const domain2Grade = getDomainGradeLabel(domain2Points);
    const domain3Grade = getDomainGradeLabel(domain3Points);
    
    // Display result - find result div in parent container
    let resultDiv = assessmentContainer.querySelector('.score-result');
    
    if (!resultDiv) {
        // Create result div if it doesn't exist - place it after the last details element or before the button
        resultDiv = document.createElement('div');
        resultDiv.className = 'score-result';
        resultDiv.style.display = 'none';
        // Insert before the button's parent (which contains the button)
        button.parentElement.insertBefore(resultDiv, button.nextSibling);
    }
    
    let scoreBreakdown = resultDiv.querySelector('.score-breakdown');
    if (!scoreBreakdown) {
        scoreBreakdown = document.createElement('div');
        scoreBreakdown.className = 'score-breakdown';
        resultDiv.appendChild(scoreBreakdown);
    }
    
    scoreBreakdown.innerHTML = `
        <div class="domain-scores">
            <div class="domain-score-card ${domain1Grade.class}">
                <div class="domain-score-header">
                    <span class="domain-name">Domain 1: Data Gathering & Diagnosis</span>
                    <span class="domain-grade">${domain1Grade.grade}</span>
                </div>
                <div class="domain-score-details">
                    <span>${domain1Checks.length}/${domain1Total} items checked</span>
                    <span>Points: ${domain1Points}/4</span>
                    <span>Weight: 1.0x</span>
                </div>
            </div>
            
            <div class="domain-score-card ${domain2Grade.class}">
                <div class="domain-score-header">
                    <span class="domain-name">Domain 2: Clinical Management (Weighted 1.5x)</span>
                    <span class="domain-grade">${domain2Grade.grade}</span>
                </div>
                <div class="domain-score-details">
                    <span>${domain2Checks.length}/${domain2Total} items checked</span>
                    <span>Points: ${domain2Points}/4 (weighted: ${(domain2Points * 1.5).toFixed(1)})</span>
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
                    <span>Points: ${domain3Points}/4</span>
                    <span>Weight: 1.0x</span>
                </div>
            </div>
        </div>
        
        <div class="overall-score ${overallClass}">
            <div class="overall-score-header">
                <span class="overall-label">Overall Case Score</span>
                <span class="overall-value">${overallGrade}</span>
            </div>
            <div class="overall-breakdown">
                <span>Weighted Total: ${Math.round(weightedTotal * 10) / 10}/10.5 points</span>
                <span>Calculation: (${domain1Points} × 1.0) + (${domain2Points} × 1.5) + (${domain3Points} × 1.0) = ${Math.round(weightedTotal * 10) / 10}</span>
            </div>
        </div>
        
        <div class="score-feedback ${overallClass}">
            <p><strong>Feedback:</strong> ${feedback}</p>
        </div>
    `;
    
    resultDiv.style.display = 'block';
    resultDiv.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
}

