/* ============================================
   OnCallPrep - Supabase Configuration
   ============================================ */

// Initialize Supabase client
// Replace these with your actual Supabase project credentials
const SUPABASE_URL = 'https://yzdnyvkijztevppdecub.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_Fm0gAah8dnW6aAXXgglXGA_U8hl2yiX';

// NOTE: This file is deprecated. Use config.js + auth.js instead.
// This file is kept for backward compatibility but should not be used.
// If this file is loaded, it will check if a client already exists before creating a new one.

// Only initialize if client doesn't already exist
if (!window.supabaseClient) {
    let supabaseClient = null;

    function initSupabase() {
        // Check if client already exists
        if (window.supabaseClient) {
            return true;
        }
        
        if (typeof supabase !== 'undefined') {
            try {
                supabaseClient = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
                window.supabaseClient = supabaseClient;
                console.log('Supabase client initialized successfully (from supabase-config.js - deprecated)');
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
                if (!window.supabaseClient && !initSupabase()) {
                    console.error('Failed to initialize Supabase. Please check your configuration.');
                }
            }, 100);
        });
    }
} else {
    console.log('Supabase client already exists, skipping supabase-config.js initialization');
}

