/* ============================================
   OnCallPrep - Admin Pro Access Helper
   ============================================
   Quick script to grant yourself pro access for testing
   Run this in browser console after logging in
*/

// Grant current user pro access (creates profile if it doesn't exist)
async function grantProAccess() {
    try {
        const supabase = window.supabaseClient;
        if (!supabase) {
            console.error('Supabase not initialized');
            alert('Supabase not initialized. Please refresh the page.');
            return;
        }
        
        const { data: { user }, error: authError } = await supabase.auth.getUser();
        if (authError || !user) {
            console.error('Not logged in');
            alert('You must be logged in. Please log in first.');
            return;
        }
        
        // Check if profile exists
        const { data: existingProfile, error: checkError } = await supabase
            .from('user_profiles')
            .select('*')
            .eq('id', user.id)
            .single();
        
        const expiresAt = new Date();
        expiresAt.setFullYear(expiresAt.getFullYear() + 1); // 1 year from now
        
        if (checkError && checkError.code === 'PGRST116') {
            // Profile doesn't exist, create it
            const { data: newProfile, error: createError } = await supabase
                .from('user_profiles')
                .insert({
                    id: user.id,
                    email: user.email,
                    full_name: user.user_metadata?.full_name || '',
                    plan: 'pro',
                    subscription_status: 'active',
                    subscription_expires_at: expiresAt.toISOString()
                })
                .select()
                .single();
            
            if (createError) {
                if (createError.code === '42P01' || createError.message.includes('does not exist')) {
                    alert('Database table not set up. Please run the SQL setup from SUPABASE_SETUP_GUIDE.md in your Supabase SQL Editor first.');
                } else {
                    console.error('Error creating profile:', createError);
                    alert('Error: ' + createError.message);
                }
                return;
            }
            
            console.log('✅ Pro access granted! Profile created.', newProfile);
            alert('✅ Pro access granted! Refreshing page...');
            
        } else if (existingProfile) {
            // Profile exists, update it
            const { data: updatedProfile, error: updateError } = await supabase
                .from('user_profiles')
                .update({
                    plan: 'pro',
                    subscription_status: 'active',
                    subscription_expires_at: expiresAt.toISOString()
                })
                .eq('id', user.id)
                .select()
                .single();
            
            if (updateError) {
                console.error('Error updating profile:', updateError);
                alert('Error: ' + updateError.message);
                return;
            }
            
            console.log('✅ Pro access granted! Profile updated.', updatedProfile);
            alert('✅ Pro access granted! Refreshing page...');
        } else {
            console.error('Unexpected error');
            alert('Unexpected error. Please check the console.');
            return;
        }
        
        // Refresh page after 2 seconds
        setTimeout(() => {
            window.location.reload();
        }, 2000);
        
    } catch (error) {
        console.error('Error:', error);
        alert('Error: ' + error.message);
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

