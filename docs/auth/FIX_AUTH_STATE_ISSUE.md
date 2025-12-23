# Fix: Auth State Not Persisting Across Pages

## 🔍 The Problem

You can see "pro" status on the Hidden Curriculum page, but when you navigate to SCA and AKT pages, it reverts to non-logged-in state.

## ✅ What I Fixed

### Issue 1: Wrong Config File
- **SCA and AKT pages** were loading `scripts/supabase-config.js` (wrong format)
- **Hidden Curriculum page** was loading `scripts/config.js` (correct format)
- The `auth.js` file expects `SUPABASE_CONFIG` object from `config.js`

**Fix:** Changed SCA and AKT to use `config.js` instead of `supabase-config.js`

### Issue 2: Missing Auth Initialization
- SCA and AKT pages weren't properly initializing auth state on page load
- Navigation wasn't updating to show logged-in state

**Fix:** Added initialization script to both pages that:
- Waits for scripts to load
- Initializes access control
- Updates navigation to show logged-in state
- Locks/unlocks pro content based on subscription

---

## 🧪 How to Test

1. **Log out** of your website (if currently logged in)
2. **Log back in** with your account
3. **Navigate between pages:**
   - Hidden Curriculum → Should show "Pro" badge
   - SCA page → Should also show "Pro" badge and logged-in state
   - AKT page → Should also show "Pro" badge and logged-in state
4. **Check pro features:**
   - All pro content should be unlocked on all pages
   - Navigation should show "Log out" button (not "Log in")

---

## 🐛 If It Still Doesn't Work

### Check Browser Console

1. Open your website
2. Press **F12** (or right-click → Inspect)
3. Go to **Console** tab
4. Look for errors

**Common errors:**
- `SUPABASE_CONFIG is not defined` → Config file not loading
- `getUserSubscription is not a function` → Subscription script not loading
- `Cannot read property 'plan' of undefined` → User profile issue

### Verify Your Profile in Supabase

Make sure your user profile has `plan = 'pro'`:

1. Go to Supabase SQL Editor
2. Run:
```sql
SELECT email, plan, subscription_status 
FROM user_profiles 
WHERE email = 'YOUR_EMAIL';
```

Should show:
- `plan`: `pro`
- `subscription_status`: `active`

### Clear Browser Cache

1. Press **Ctrl+Shift+Delete** (or **Cmd+Shift+Delete** on Mac)
2. Select "Cached images and files"
3. Click "Clear data"
4. Refresh the page

---

## 📝 What Changed

### Files Modified:
- `sca.html` - Changed config file and added auth initialization
- `akt.html` - Changed config file and added auth initialization

### What the Fix Does:

1. **Loads correct config:** Uses `config.js` which has the `SUPABASE_CONFIG` object
2. **Initializes on page load:** Checks auth state when page loads
3. **Updates navigation:** Shows "Pro" badge and "Log out" button when logged in
4. **Unlocks pro content:** Makes pro features available if user has pro plan

---

## ✅ Expected Behavior After Fix

**When logged in as Pro user:**
- ✅ Navigation shows "Pro" badge
- ✅ Navigation shows "Log out" button (not "Log in")
- ✅ Pro content is unlocked on all pages
- ✅ Auth state persists when navigating between pages

**When not logged in:**
- ✅ Navigation shows "Log in" and "Start Free Trial" buttons
- ✅ Pro content is locked with upgrade prompts

---

## 🚀 Next Steps

After this fix works:
1. Test all pages to ensure auth state persists
2. Verify pro features work on SCA and AKT pages
3. Test logging out and back in
4. Check that navigation updates correctly

If you still have issues, check the browser console for errors and let me know what you see!

