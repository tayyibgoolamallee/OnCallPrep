/* ============================================
   OnCallPrep - Main JavaScript
   ============================================ */

// Plan storage key
const PLAN_STORAGE_KEY = 'oncallprep_plan';
const VALID_PLANS = ['free', 'pro', 'trainer'];

// Get current user's plan
async function getCurrentPlan() {
    console.log('getCurrentPlan: Starting...');
    
    // Ensure Supabase is initialized
    if (typeof window.supabaseClient === 'undefined' && typeof initSupabase === 'function') {
        console.log('getCurrentPlan: Initializing Supabase...');
        initSupabase();
        // Wait a bit for initialization
        await new Promise(resolve => setTimeout(resolve, 200));
    }
    
    // Try to get from subscription check first (most reliable)
    if (typeof getUserSubscription === 'function') {
        try {
            console.log('getCurrentPlan: Trying getUserSubscription...');
            const subscription = await getUserSubscription();
            console.log('getCurrentPlan: Subscription result:', subscription);
            if (subscription && subscription.plan) {
                const plan = subscription.plan;
                if (VALID_PLANS.includes(plan)) {
                    // Cache in localStorage for faster access
                    if (window.localStorage) {
                        localStorage.setItem(PLAN_STORAGE_KEY, plan);
                    }
                    console.log('getCurrentPlan: Plan retrieved from subscription:', plan);
                    return plan;
                }
            }
        } catch (error) {
            console.error('getCurrentPlan: Error getting subscription, trying profile:', error);
        }
    } else {
        console.warn('getCurrentPlan: getUserSubscription function not available');
    }
    
    // Try to get from Supabase profile (if user is logged in)
    if (typeof getCurrentUserProfile === 'function') {
        try {
            console.log('getCurrentPlan: Trying getCurrentUserProfile...');
            const profileResult = await getCurrentUserProfile();
            console.log('getCurrentPlan: Profile result:', profileResult);
            if (profileResult.success && profileResult.profile?.plan) {
                const plan = profileResult.profile.plan;
                if (VALID_PLANS.includes(plan)) {
                    // Cache in localStorage for faster access
                    if (window.localStorage) {
                        localStorage.setItem(PLAN_STORAGE_KEY, plan);
                    }
                    console.log('getCurrentPlan: Plan retrieved from Supabase:', plan);
                    return plan;
                }
            }
        } catch (error) {
            console.error('getCurrentPlan: Error getting profile from Supabase, falling back to localStorage:', error);
        }
    } else {
        console.warn('getCurrentPlan: getCurrentUserProfile function not available');
    }
    
    // Fallback to localStorage (for development or when not logged in)
    const stored = window.localStorage ? localStorage.getItem(PLAN_STORAGE_KEY) : null;
    if (stored && VALID_PLANS.includes(stored)) {
        console.log('getCurrentPlan: Plan retrieved from localStorage:', stored);
        return stored;
    }
    
    console.log('getCurrentPlan: Defaulting plan to free.');
    return 'free';
}

// Apply plan-based CSS classes to elements
function applyPlanClasses(plan) {
    // Remove existing plan classes
    document.body.classList.remove('plan-free', 'plan-pro', 'plan-trainer');
    // Add current plan class
    document.body.classList.add(`plan-${plan}`);
}

// Initialize access control system
async function initAccessControl() {
    const plan = await getCurrentPlan();
    applyPlanClasses(plan);
    togglePlanContent(plan);
}

// Toggle pro content visibility
function togglePlanContent(plan) {
    // Hide/show pro-only content
    const proOnlyElements = document.querySelectorAll('.pro-only');
    proOnlyElements.forEach(el => {
        if (plan === 'pro' || plan === 'trainer') {
            el.style.display = '';
        } else {
            el.style.display = 'none';
        }
    });
    
    // Hide/show pro teasers
    const proTeasers = document.querySelectorAll('.pro-teaser');
    proTeasers.forEach(el => {
        if (plan === 'pro' || plan === 'trainer') {
            el.style.display = 'none';
        } else {
            el.style.display = '';
        }
    });
}

// Update navigation auth state
async function updateNavAuth() {
    const navAuth = document.querySelector('.nav-auth');
    if (!navAuth) return;
    
    try {
        if (typeof getCurrentUserProfile === 'function') {
            const profileResult = await getCurrentUserProfile();
            if (profileResult.success && profileResult.profile) {
                const plan = profileResult.profile.plan || 'free';
                const planBadge = plan === 'free' ? '' : `<span class="badge badge-${plan}">${plan.charAt(0).toUpperCase() + plan.slice(1)}</span>`;
                
                navAuth.innerHTML = `
                    ${planBadge}
                    <button class="btn btn-ghost" onclick="handleLogout()">Log out</button>
                `;
                return;
            }
        }
    } catch (error) {
        console.error('Error updating nav auth:', error);
    }
    
    // Default: show login/signup
    navAuth.innerHTML = `
        <a href="login.html" class="btn btn-ghost">Log in</a>
        <a href="signup.html" class="btn btn-primary">Start Free Trial</a>
    `;
}

// Handle logout
async function handleLogout() {
    if (typeof logOut === 'function') {
        const result = await logOut();
        if (result.success) {
            window.location.href = 'index.html';
        }
    } else {
        // Fallback: clear localStorage and redirect
        if (window.localStorage) {
            localStorage.removeItem(PLAN_STORAGE_KEY);
        }
        window.location.href = 'index.html';
    }
}

// Make handleLogout available globally
window.handleLogout = handleLogout;

// Mobile menu toggle
function initMobileMenu() {
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
}

// Smooth scrolling for anchor links
function initSmoothScroll() {
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
}

// Navbar scroll effect
function initNavbarScroll() {
    const navbar = document.querySelector('.navbar');
    if (!navbar) return;
    
    let lastScroll = 0;
    window.addEventListener('scroll', function() {
        const currentScroll = window.pageYOffset;
        
        if (currentScroll > 100) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
        
        lastScroll = currentScroll;
    });
}

// Initialize animations
function initAnimations() {
    // Intersection Observer for fade-in animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in');
            }
        });
    }, observerOptions);
    
    // Observe elements with animation classes
    document.querySelectorAll('.fade-in, .slide-up').forEach(el => {
        observer.observe(el);
    });
}

// Initialize everything on DOM load
document.addEventListener('DOMContentLoaded', async function() {
    // Ensure Supabase and auth scripts are loaded before proceeding
    if (typeof initSupabase === 'function') { // Check if auth.js is loaded
        initSupabase(); // Initialize Supabase client
    } else {
        console.warn('Supabase or auth.js not loaded. Access control may not function correctly.');
    }
    
    await initAccessControl();
    initMobileMenu();
    initSmoothScroll();
    initNavbarScroll();
    initAnimations();
    await updateNavAuth();
});
