/* ============================================
   OnCallPrep - Pricing Page JavaScript
   ============================================ */

document.addEventListener('DOMContentLoaded', function() {
    initBillingToggle();
});

function initBillingToggle() {
    const toggle = document.getElementById('billingToggle');
    const monthlyLabel = document.querySelector('[data-period="monthly"]');
    const annualLabel = document.querySelector('[data-period="annual"]');

    if (toggle) {
        // Set initial state
        updateToggleState(toggle.checked);

        toggle.addEventListener('change', function() {
            updateToggleState(this.checked);
        });
    }

    function updateToggleState(isAnnual) {
        if (isAnnual) {
            monthlyLabel.classList.remove('active');
            annualLabel.classList.add('active');
        } else {
            monthlyLabel.classList.add('active');
            annualLabel.classList.remove('active');
        }
    }

    // Set monthly as default active
    if (monthlyLabel) {
        monthlyLabel.classList.add('active');
    }
}




