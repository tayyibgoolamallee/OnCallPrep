# Simple Debug Steps

Since the debug page isn't working, let's do manual debugging:

## Step 1: Open Browser Console

1. Go to your website (any page)
2. Press **F12** (or right-click → Inspect)
3. Click the **Console** tab

## Step 2: Run These Commands

Copy and paste these commands one at a time into the console:

### Check if Supabase is loaded:
```javascript
typeof SUPABASE_CONFIG
```
**Should show:** `"object"` (not `"undefined"`)

### Check if you're logged in:
```javascript
window.supabaseClient?.auth.getUser().then(r => console.log('User:', r.data.user, 'Error:', r.error))
```
**Should show:** Your user object if logged in

### Check your profile:
```javascript
getCurrentUserProfile().then(r => console.log('Profile:', r))
```
**Should show:** Your profile with `plan: "pro"`

### Check subscription:
```javascript
getUserSubscription().then(r => console.log('Subscription:', r))
```
**Should show:** `{isPro: true, plan: "pro", ...}`

### Check current plan:
```javascript
getCurrentPlan().then(r => console.log('Plan:', r))
```
**Should show:** `"pro"`

## Step 3: What to Look For

**If `getCurrentUserProfile()` shows `plan: "free"`:**
- Your Supabase profile needs to be updated (see FIX_PRO_ACCESS.md)

**If `getUserSubscription()` shows `isPro: false`:**
- Check that `subscription_status` is `"active"` in Supabase

**If `getCurrentPlan()` shows `"free"`:**
- The function is falling back to localStorage or default
- Check what the previous commands returned

## Step 4: Share Results

Please share:
1. What each command returns
2. Any error messages (in red)
3. What plan is detected

This will help identify the exact issue!

