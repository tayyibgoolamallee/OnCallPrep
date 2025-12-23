/* ============================================
   OnCallPrep - Pricing Page JavaScript
   ============================================ */

document.addEventListener('DOMContentLoaded', function() {
    initSubscriptionSelection();
    handlePlanSelection();
});

function initSubscriptionSelection() {
    // Handle URL parameters for plan selection
    const urlParams = new URLSearchParams(window.location.search);
    const plan = urlParams.get('plan');
    
    if (plan) {
        // Highlight the selected plan
        const planMap = {
            '3month': '3 Months',
            '6month': '6 Months',
            '12month': '12 Months'
        };
        
        if (planMap[plan]) {
            // Scroll to subscription options section
            setTimeout(() => {
                const optionsSection = document.querySelector('.subscription-options');
                if (optionsSection) {
                    optionsSection.scrollIntoView({ behavior: 'smooth', block: 'start' });
                    
                    // Highlight the selected option
                    const optionCards = document.querySelectorAll('.option-card');
                    optionCards.forEach(card => {
                        card.classList.remove('selected');
                        const duration = card.querySelector('.duration');
                        if (duration && duration.textContent === planMap[plan]) {
                            card.classList.add('selected');
                            card.style.borderColor = 'var(--color-primary-500)';
                            card.style.boxShadow = '0 4px 12px rgba(20, 184, 166, 0.2)';
                        }
                    });
                }
            }, 100);
        }
    }
}

function handlePlanSelection() {
    // Add click handlers to subscription option cards
    const optionCards = document.querySelectorAll('.option-card');
    
    optionCards.forEach(card => {
        const link = card.querySelector('a');
        if (link) {
            // Store the plan duration in the link for signup page
            const duration = card.querySelector('.duration');
            if (duration) {
                const durationText = duration.textContent.trim();
                const planMap = {
                    '3 Months': '3month',
                    '6 Months': '6month',
                    '12 Months': '12month'
                };
                
                if (planMap[durationText]) {
                    const href = new URL(link.href);
                    href.searchParams.set('plan', planMap[durationText]);
                    link.href = href.toString();
                }
            }
            
            // Add visual feedback on click
            card.addEventListener('click', function(e) {
                if (e.target !== link && !link.contains(e.target)) {
                    e.preventDefault();
                    link.click();
                }
            });
            
            // Add hover effect
            card.addEventListener('mouseenter', function() {
                if (!card.classList.contains('popular')) {
                    card.style.transform = 'translateY(-4px)';
                    card.style.transition = 'all 0.2s ease';
                }
            });
            
            card.addEventListener('mouseleave', function() {
                if (!card.classList.contains('popular')) {
                    card.style.transform = 'translateY(0)';
                }
            });
        }
    });
}

// Function to calculate savings for display
function calculateSavings(months, monthlyPrice) {
    const totalWithoutDiscount = months * monthlyPrice;
    let discount = 0;
    
    if (months === 3) discount = 0.15;
    else if (months === 6) discount = 0.30;
    else if (months === 12) discount = 0.40;
    
    const totalWithDiscount = totalWithoutDiscount * (1 - discount);
    const savings = totalWithoutDiscount - totalWithDiscount;
    
    return {
        total: totalWithDiscount,
        savings: savings,
        discount: discount * 100,
        perMonth: totalWithDiscount / months
    };
}

// Export for use in other scripts if needed
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { calculateSavings };
}
