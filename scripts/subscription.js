/* ============================================
   OnCallPrep - Subscription & Feature Access Utilities
   ============================================ */

// Get Supabase client
const supabase = window.supabaseClient;

// Check if user has access to pro/premium features
async function checkProAccess() {
    try {
        const subscription = await getUserSubscription();
        return subscription.isPro;
    } catch (error) {
        console.error('Error checking pro access:', error);
        return false;
    }
}

// Gate a feature - show upgrade message if user doesn't have access
async function gateFeature(featureName, upgradeMessage) {
    const hasAccess = await hasFeatureAccess(featureName);
    
    if (!hasAccess) {
        // Show upgrade modal or redirect
        if (confirm(upgradeMessage || 'This feature requires a Pro subscription. Would you like to upgrade?')) {
            window.location.href = 'pricing.html';
        }
        return false;
    }
    
    return true;
}

// Show pro badge on locked content
function showProBadge(element) {
    if (!element) return;
    
    const badge = document.createElement('span');
    badge.className = 'badge badge-pro';
    badge.textContent = 'Pro';
    badge.style.marginLeft = '0.5rem';
    element.appendChild(badge);
}

// Lock content for non-pro users
async function lockProContent() {
    const isPro = await checkProAccess();
    
    if (!isPro) {
        // Find all elements with data-pro="true" attribute
        const proElements = document.querySelectorAll('[data-pro="true"]');
        
        proElements.forEach(element => {
            element.style.opacity = '0.6';
            element.style.pointerEvents = 'none';
            element.style.position = 'relative';
            
            // Add overlay
            const overlay = document.createElement('div');
            overlay.className = 'pro-lock-overlay';
            overlay.innerHTML = `
                <div style="
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    background: white;
                    padding: 1rem;
                    border-radius: 8px;
                    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                    text-align: center;
                    z-index: 10;
                ">
                    <p style="margin: 0 0 0.5rem 0; font-weight: 600;">Pro Feature</p>
                    <a href="pricing.html" class="btn btn-primary" style="font-size: 0.9rem;">Upgrade to Pro</a>
                </div>
            `;
            overlay.style.cssText = `
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(255, 255, 255, 0.9);
                z-index: 5;
            `;
            element.appendChild(overlay);
        });
    }
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', () => {
    lockProContent();
});

