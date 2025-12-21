/* ============================================
   OnCallPrep - Subscription & Feature Access Utilities
   ============================================ */

// Get Supabase client
const supabase = window.supabaseClient;

// Get user's subscription status
async function getUserSubscription() {
    try {
        // Get Supabase client from window (set by auth.js)
        const supabase = window.supabaseClient;
        if (!supabase) {
            console.warn('Supabase client not found');
            return { isPro: false, plan: 'free' };
        }
        const { data: { user }, error: authError } = await supabase.auth.getUser();
        
        if (authError || !user) {
            return { isPro: false, plan: 'free' };
        }
        
        // Get user profile with subscription info
        const { data: profile, error: profileError } = await supabase
            .from('user_profiles')
            .select('plan, subscription_status, subscription_expires_at')
            .eq('id', user.id)
            .single();
        
        if (profileError) {
            // Profile doesn't exist yet, return free
            return { isPro: false, plan: 'free' };
        }
        
        // Check if plan is 'pro' and subscription is active
        const isPro = profile.plan === 'pro' && 
                      (profile.subscription_status === 'active' || 
                       !profile.subscription_expires_at || 
                       new Date(profile.subscription_expires_at) > new Date());
        
        return {
            isPro: isPro,
            plan: profile.plan || 'free',
            subscriptionStatus: profile.subscription_status,
            expiresAt: profile.subscription_expires_at
        };
    } catch (error) {
        console.error('Error getting subscription:', error);
        return { isPro: false, plan: 'free' };
    }
}

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

// Check if user has access to a specific feature
async function hasFeatureAccess(featureName) {
    const subscription = await getUserSubscription();
    
    // Pro users have access to all features
    if (subscription.isPro) {
        return true;
    }
    
    // Free users have limited access
    // You can customize this based on feature names
    const freeFeatures = ['portfolio_overview', 'sca_overview', 'akt_overview'];
    return freeFeatures.includes(featureName);
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

