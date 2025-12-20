/* ============================================
   OnCallPrep - Supabase Configuration
   ============================================ */

// Initialize Supabase client
// Replace these with your actual Supabase project credentials
const SUPABASE_URL = 'https://yzdnyvkijztevppdecub.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_Fm0gAah8dnW6aAXXgglXGA_U8hl2yiX';

// Wait for Supabase library to load, then initialize
let supabaseClient = null;

function initSupabase() {
    if (typeof supabase !== 'undefined') {
        try {
            supabaseClient = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
            window.supabaseClient = supabaseClient;
            console.log('Supabase client initialized successfully');
            return true;
        } catch (error) {
            console.error('Error initializing Supabase:', error);
            return false;
        }
    } else {
        console.error('Supabase library not loaded yet');
        return false;
    }
}

// Try to initialize immediately if library is already loaded
if (typeof supabase !== 'undefined') {
    initSupabase();
} else {
    // Wait for library to load
    window.addEventListener('load', () => {
        setTimeout(() => {
            if (!initSupabase()) {
                console.error('Failed to initialize Supabase. Please check your configuration.');
            }
        }, 100);
    });
}

