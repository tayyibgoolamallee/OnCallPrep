/* ============================================
   OnCallPrep - Authentication Utilities
   ============================================ */

// Get Supabase client - use a function to ensure it's available
function getSupabaseClient() {
    if (!window.supabaseClient) {
        console.error('Supabase client not initialized. Make sure supabase-config.js is loaded first.');
        return null;
    }
    return window.supabaseClient;
}

// Check if user is authenticated
async function checkAuth() {
    try {
        const supabase = getSupabaseClient();
        if (!supabase) {
            return null;
        }
        const { data: { session }, error } = await supabase.auth.getSession();
        if (error) throw error;
        return session;
    } catch (error) {
        console.error('Error checking auth:', error);
        return null;
    }
}

// Get current user
async function getCurrentUser() {
    try {
        const supabase = getSupabaseClient();
        if (!supabase) {
            return null;
        }
        const { data: { user }, error } = await supabase.auth.getUser();
        if (error) throw error;
        return user;
    } catch (error) {
        console.error('Error getting user:', error);
        return null;
    }
}

// Sign up new user
async function signUp(email, password, fullName) {
    try {
        const supabase = getSupabaseClient();
        if (!supabase) {
            return { data: null, error: new Error('Supabase client not initialized') };
        }
        const { data, error } = await supabase.auth.signUp({
            email: email,
            password: password,
            options: {
                data: {
                    full_name: fullName
                }
            }
        });
        
        if (error) throw error;
        
        // Create user profile in database
        if (data.user) {
            const { error: profileError } = await supabase
                .from('profiles')
                .insert([
                    {
                        id: data.user.id,
                        email: email,
                        full_name: fullName,
                        subscription_tier: 'free', // Default to free tier
                        created_at: new Date().toISOString()
                    }
                ]);
            
            if (profileError && profileError.code !== '23505') { // Ignore duplicate key errors
                console.error('Error creating profile:', profileError);
            }
        }
        
        return { data, error: null };
    } catch (error) {
        console.error('Sign up error:', error);
        return { data: null, error };
    }
}

// Sign in existing user
async function signIn(email, password) {
    try {
        const supabase = getSupabaseClient();
        if (!supabase) {
            return { data: null, error: new Error('Supabase client not initialized') };
        }
        const { data, error } = await supabase.auth.signInWithPassword({
            email: email,
            password: password
        });
        
        if (error) throw error;
        
        // Redirect to dashboard/home after successful login
        if (data.user) {
            window.location.href = 'index.html';
        }
        
        return { data, error: null };
    } catch (error) {
        console.error('Sign in error:', error);
        return { data: null, error };
    }
}

// Sign out user
async function signOut() {
    try {
        const supabase = getSupabaseClient();
        if (!supabase) {
            console.error('Supabase client not initialized');
            return;
        }
        const { error } = await supabase.auth.signOut();
        if (error) throw error;
        
        // Redirect to home page
        window.location.href = 'index.html';
    } catch (error) {
        console.error('Sign out error:', error);
    }
}

// Check user subscription tier
async function getUserSubscription() {
    try {
        const supabase = getSupabaseClient();
        if (!supabase) {
            return { tier: 'free', isPro: false, isPremium: false };
        }
        const user = await getCurrentUser();
        if (!user) return { tier: 'free', isPro: false, isPremium: false };
        
        const { data, error } = await supabase
            .from('profiles')
            .select('subscription_tier, subscription_status, subscription_expires_at')
            .eq('id', user.id)
            .single();
        
        if (error) throw error;
        
        const tier = data?.subscription_tier || 'free';
        const isActive = data?.subscription_status === 'active' || 
                        (data?.subscription_expires_at && new Date(data.subscription_expires_at) > new Date());
        
        return {
            tier: tier,
            isPro: (tier === 'pro' || tier === 'premium') && isActive,
            isPremium: tier === 'premium' && isActive,
            status: data?.subscription_status || 'inactive',
            expiresAt: data?.subscription_expires_at
        };
    } catch (error) {
        console.error('Error getting subscription:', error);
        return { tier: 'free', isPro: false, isPremium: false };
    }
}

// Check if user has access to a feature
async function hasFeatureAccess(featureName) {
    const subscription = await getUserSubscription();
    
    // Define feature access rules
    const featureAccess = {
        'free': ['portfolio_basic', 'sca_overview', 'akt_demo'],
        'pro': ['portfolio_basic', 'sca_overview', 'akt_demo', 'portfolio_ai', 'sca_practice', 'akt_full', 'clinical_topics'],
        'premium': ['portfolio_basic', 'sca_overview', 'akt_demo', 'portfolio_ai', 'sca_practice', 'akt_full', 'clinical_topics', 'ai_consultation', 'progress_tracking']
    };
    
    const allowedFeatures = featureAccess[subscription.tier] || featureAccess['free'];
    return allowedFeatures.includes(featureName) && subscription.isPro;
}

// Update navigation based on auth state
async function updateNavigation() {
    const session = await checkAuth();
    const navAuth = document.querySelector('.nav-auth');
    
    if (!navAuth) return;
    
    if (session) {
        const user = await getCurrentUser();
        const subscription = await getUserSubscription();
        
        navAuth.innerHTML = `
            <div class="user-menu">
                <span class="user-name">${user?.user_metadata?.full_name || user?.email || 'User'}</span>
                ${subscription.isPro ? '<span class="badge badge-pro">Pro</span>' : ''}
                <button class="btn btn-ghost" onclick="signOut()">Log out</button>
            </div>
        `;
    } else {
        navAuth.innerHTML = `
            <a href="login.html" class="btn btn-ghost">Log in</a>
            <a href="signup.html" class="btn btn-primary">Start Free Trial</a>
        `;
    }
}

// Listen for auth state changes
function setupAuthListener() {
    const supabase = getSupabaseClient();
    if (supabase) {
        supabase.auth.onAuthStateChange((event, session) => {
            if (event === 'SIGNED_IN' || event === 'SIGNED_OUT' || event === 'TOKEN_REFRESHED') {
                updateNavigation();
            }
        });
    }
}

// Setup listener when Supabase is ready
if (window.supabaseClient) {
    setupAuthListener();
} else {
    // Wait for Supabase to initialize
    const checkSupabase = setInterval(() => {
        if (window.supabaseClient) {
            setupAuthListener();
            clearInterval(checkSupabase);
        }
    }, 100);
    
    // Stop checking after 5 seconds
    setTimeout(() => clearInterval(checkSupabase), 5000);
}

// Initialize navigation on page load
document.addEventListener('DOMContentLoaded', () => {
    updateNavigation();
});

