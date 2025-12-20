/* ============================================
   OnCallPrep - Main JavaScript
   ============================================ */

// Mobile menu toggle
document.addEventListener('DOMContentLoaded', function() {
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const navLinks = document.querySelector('.nav-links');
    const navContainer = document.querySelector('.nav-container');

    if (mobileMenuBtn) {
        mobileMenuBtn.addEventListener('click', function() {
            navContainer.classList.toggle('mobile-menu-open');
            mobileMenuBtn.classList.toggle('active');
        });
    }

    // Close mobile menu when clicking outside
    document.addEventListener('click', function(e) {
        if (navContainer && !navContainer.contains(e.target) && navContainer.classList.contains('mobile-menu-open')) {
            navContainer.classList.remove('mobile-menu-open');
            if (mobileMenuBtn) mobileMenuBtn.classList.remove('active');
        }
    });

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const href = this.getAttribute('href');
            if (href !== '#' && href.length > 1) {
                const target = document.querySelector(href);
                if (target) {
                    e.preventDefault();
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            }
        });
    });
});
