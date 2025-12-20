/* ============================================
   OnCallPrep - Admin Pro Access Helper
   ============================================
   Quick script to grant yourself pro access for testing
   Run this in browser console after logging in
*/

// Grant current user pro access
async function grantProAccess() {
    try {
        const supabase = window.supabaseClient;
        if (!supabase) {
            console.error('Supabase not initialized');
            return;
        }
        
        const { data: { user }, error: authError } = await supabase.auth.getUser();
        if (authError || !user) {
            console.error('Not logged in');
            return;
        }
        
        // Update user profile to pro
        const { data, error } = await supabase
            .from('user_profiles')
            .update({
                plan: 'pro',
                subscription_status: 'active',
                subscription_expires_at: new Date(Date.now() + 365 * 24 * 60 * 60 * 1000).toISOString() // 1 year from now
            })
            .eq('id', user.id)
            .select()
            .single();
        
        if (error) {
            console.error('Error granting pro access:', error);
            return;
        }
        
        console.log('✅ Pro access granted!', data);
        console.log('Refresh the page to see pro features.');
        
        // Refresh page after 2 seconds
        setTimeout(() => {
            window.location.reload();
        }, 2000);
        
    } catch (error) {
        console.error('Error:', error);
    }
}

// Check current subscription status
async function checkMySubscription() {
    try {
        const supabase = window.supabaseClient;
        if (!supabase) {
            console.error('Supabase not initialized');
            return;
        }
        
        const { data: { user }, error: authError } = await supabase.auth.getUser();
        if (authError || !user) {
            console.error('Not logged in');
            return;
        }
        
        const { data: profile, error } = await supabase
            .from('user_profiles')
            .select('*')
            .eq('id', user.id)
            .single();
        
        if (error) {
            console.error('Error:', error);
            return;
        }
        
        console.log('Current subscription:', profile);
        return profile;
    } catch (error) {
        console.error('Error:', error);
    }
}

// Make functions available globally
window.grantProAccess = grantProAccess;
window.checkMySubscription = checkMySubscription;

console.log('Admin pro access helper loaded!');
console.log('Run grantProAccess() to grant yourself pro access');
console.log('Run checkMySubscription() to check your current status');

