/* ============================================
   OnCallPrep - Authentication Utilities
   ============================================ */

let supabaseClient = null;

// Initialize Supabase client
function initSupabase() {
    if (typeof supabase === 'undefined') {
        console.error('Supabase library not loaded');
        return false;
    }
    
    if (!SUPABASE_CONFIG || !SUPABASE_CONFIG.url || !SUPABASE_CONFIG.anonKey) {
        console.error('Supabase configuration not found. Please check scripts/config.js');
        return false;
    }
    
    try {
        supabaseClient = supabase.createClient(SUPABASE_CONFIG.url, SUPABASE_CONFIG.anonKey);
        window.supabaseClient = supabaseClient;
        console.log('Supabase client initialized');
        return true;
    } catch (error) {
        console.error('Error initializing Supabase:', error);
        return false;
    }
}

// Sign up new user
async function signUp(email, password, fullName) {
    try {
        if (!supabaseClient) {
            if (!initSupabase()) {
                return { success: false, error: 'Supabase not initialized' };
            }
        }
        
        const { data, error } = await supabaseClient.auth.signUp({
            email: email,
            password: password,
            options: {
                data: {
                    full_name: fullName
                }
            }
        });
        
        if (error) throw error;
        return { success: true, data };
    } catch (error) {
        console.error('Sign up error:', error);
        return { success: false, error: error.message };
    }
}

// Log in existing user
async function logIn(email, password) {
    try {
        if (!supabaseClient) {
            if (!initSupabase()) {
                return { success: false, error: 'Supabase not initialized' };
            }
        }
        
        const { data, error } = await supabaseClient.auth.signInWithPassword({
            email: email,
            password: password
        });
        
        if (error) throw error;
        return { success: true, data };
    } catch (error) {
        console.error('Login error:', error);
        return { success: false, error: error.message };
    }
}

// Log out user
async function logOut() {
    try {
        if (!supabaseClient) {
            if (!initSupabase()) {
                return { success: false, error: 'Supabase not initialized' };
            }
        }
        
        const { error } = await supabaseClient.auth.signOut();
        if (error) throw error;
        
        // Clear localStorage
        if (window.localStorage) {
            localStorage.removeItem('oncallprep_plan');
        }
        
        return { success: true };
    } catch (error) {
        console.error('Logout error:', error);
        return { success: false, error: error.message };
    }
}

// Get current user profile (including plan)
async function getCurrentUserProfile() {
    try {
        if (!supabaseClient) {
            if (!initSupabase()) {
                return { success: false, error: 'Supabase not initialized' };
            }
        }
        
        const { data: { user }, error: authError } = await supabaseClient.auth.getUser();
        if (authError || !user) {
            return { success: false, error: 'Not authenticated' };
        }
        
        const { data: profile, error: profileError } = await supabaseClient
            .from('user_profiles')
            .select('*')
            .eq('id', user.id)
            .single();
        
        if (profileError) {
            // Profile might not exist yet, return default
            return { success: true, profile: { plan: 'free', role: 'user' } };
        }
        
        return { success: true, profile };
    } catch (error) {
        console.error('Error getting user profile:', error);
        return { success: false, error: error.message };
    }
}

// Check if current user is admin
async function isAdmin() {
    try {
        const profileResult = await getCurrentUserProfile();
        if (!profileResult.success || !profileResult.profile) {
            return false;
        }
        return profileResult.profile.role === 'admin';
    } catch (error) {
        console.error('Error checking admin status:', error);
        return false;
    }
}

// Get all users (admin only)
async function getAllUsers() {
    try {
        if (!supabaseClient) {
            if (!initSupabase()) {
                return { success: false, error: 'Supabase not initialized' };
            }
        }
        
        const { data, error } = await supabaseClient
            .from('user_profiles')
            .select('*')
            .order('created_at', { ascending: false });
        
        if (error) throw error;
        return { success: true, users: data };
    } catch (error) {
        console.error('Error getting users:', error);
        return { success: false, error: error.message };
    }
}

// Update user plan (admin only)
async function updateUserPlan(userId, newPlan) {
    try {
        if (!supabaseClient) {
            if (!initSupabase()) {
                return { success: false, error: 'Supabase not initialized' };
            }
        }
        
        const { data, error } = await supabaseClient
            .from('user_profiles')
            .update({ plan: newPlan })
            .eq('id', userId)
            .select()
            .single();
        
        if (error) throw error;
        return { success: true, profile: data };
    } catch (error) {
        console.error('Error updating user plan:', error);
        return { success: false, error: error.message };
    }
}

// Listen for auth state changes
function onAuthStateChange(callback) {
    if (!supabaseClient) {
        if (!initSupabase()) {
            return;
        }
    }
    
    supabaseClient.auth.onAuthStateChange((event, session) => {
        if (callback) callback(event, session);
    });
}

// Initialize on load if Supabase is available
if (typeof window !== 'undefined') {
    // Wait for both supabase library and config to be loaded
    function tryInit() {
        if (typeof supabase !== 'undefined' && typeof SUPABASE_CONFIG !== 'undefined') {
            const result = initSupabase();
            if (result) {
                console.log('Supabase initialized successfully');
            }
        } else {
            // Retry after a short delay if not ready
            setTimeout(tryInit, 50);
        }
    }
    
    // Try immediately, then on DOM ready, then on window load
    tryInit();
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', tryInit);
    }
    window.addEventListener('load', tryInit);
}
