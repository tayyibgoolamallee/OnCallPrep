# OnCallPrep - Deployment Guide

## 🚀 Getting Your Website Live

### Option 1: Vercel (Recommended - Easiest)

**Why Vercel:**
- Free for static sites
- Automatic deployments from Git
- Fast global CDN
- Easy to set up

**Steps:**

1. **Push your code to GitHub:**
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/oncallprep.git
   git push -u origin main
   ```

2. **Sign up for Vercel:**
   - Go to [vercel.com](https://vercel.com)
   - Sign up with GitHub

3. **Deploy:**
   - Click "New Project"
   - Import your GitHub repository
   - Vercel will auto-detect it's a static site
   - Click "Deploy"
   - Done! Your site will be live at `your-project.vercel.app`

4. **Add Environment Variables (for Supabase):**
   - Go to Project Settings → Environment Variables
   - Add your Supabase URL and anon key (from `scripts/config.js`)
   - Redeploy

### Option 2: Netlify (Also Great)

**Steps:**

1. **Push to GitHub** (same as above)

2. **Sign up for Netlify:**
   - Go to [netlify.com](https://netlify.com)
   - Sign up with GitHub

3. **Deploy:**
   - Click "Add new site" → "Import an existing project"
   - Connect GitHub repository
   - Build settings: Leave default (it's a static site)
   - Click "Deploy site"

4. **Add Environment Variables:**
   - Site settings → Environment variables
   - Add Supabase config
   - Redeploy

### Option 3: GitHub Pages (Free but Limited)

**Steps:**

1. **Push to GitHub**

2. **Enable GitHub Pages:**
   - Repository → Settings → Pages
   - Source: Deploy from branch `main`
   - Save

3. **Your site will be at:** `https://YOUR_USERNAME.github.io/oncallprep`

**Note:** GitHub Pages doesn't support server-side features, but your static site will work fine.

---

## 🔧 Fixing Pro Features Before Deployment

### Step 1: Test Pro Access Locally

1. **Open `DEBUG_PRO_ACCESS.html` in your browser**
2. **Log in to your site**
3. **Click each debug button** to see what's wrong
4. **Check the console** (F12 → Console tab) for errors

### Step 2: Common Issues & Fixes

#### Issue: "Supabase client not found"
**Fix:** Make sure `scripts/config.js` has your Supabase credentials:
```javascript
const SUPABASE_CONFIG = {
    url: 'https://your-project.supabase.co',
    anonKey: 'your-anon-key-here'
};
```

#### Issue: "Not authenticated"
**Fix:** Make sure you're logged in. Check:
- Can you log in successfully?
- Does the login redirect work?
- Check browser console for auth errors

#### Issue: "Profile not found"
**Fix:** Run the migration script again:
```sql
-- In Supabase SQL Editor
UPDATE user_profiles 
SET plan = 'pro', subscription_status = 'active'
WHERE email = 'your-email@example.com';
```

#### Issue: "Plan is 'pro' but isPro returns false"
**Fix:** Check `subscription_status`:
```sql
SELECT email, plan, subscription_status, subscription_expires_at
FROM user_profiles
WHERE email = 'your-email@example.com';
```

Make sure:
- `plan` = `'pro'`
- `subscription_status` = `'active'`
- `subscription_expires_at` is NULL or in the future

### Step 3: Update Config for Production

**Before deploying, update `scripts/config.js`:**

```javascript
const SUPABASE_CONFIG = {
    url: process.env.SUPABASE_URL || 'https://your-project.supabase.co',
    anonKey: process.env.SUPABASE_ANON_KEY || 'your-anon-key-here'
};
```

Then add these as environment variables in Vercel/Netlify.

---

## 📝 Pre-Deployment Checklist

- [ ] All files committed to Git
- [ ] Supabase database migrated (user_profiles table correct)
- [ ] Pro access tested locally (using DEBUG_PRO_ACCESS.html)
- [ ] Supabase RLS policies enabled
- [ ] Config file has correct Supabase credentials
- [ ] Test login/signup flow
- [ ] Test pro feature access
- [ ] Check all pages load correctly
- [ ] Test on mobile device/browser

---

## 🔐 Supabase Setup for Production

### 1. Enable Row Level Security (RLS)

Make sure RLS is enabled on `user_profiles`:
```sql
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;
```

### 2. Check Policies

Verify these policies exist:
- Users can view own profile
- Users can update own profile
- Users can insert own profile
- Admins can view all profiles
- Admins can update all profiles

### 3. Update Supabase URL Settings

In Supabase Dashboard:
- Settings → API
- Add your production domain to "Allowed URLs"
- Example: `https://your-site.vercel.app`

---

## 🐛 Troubleshooting After Deployment

### Pro features still not working?

1. **Check browser console** for errors
2. **Check Supabase logs** (Dashboard → Logs)
3. **Verify environment variables** are set correctly
4. **Clear browser cache** and try again
5. **Test with DEBUG_PRO_ACCESS.html** (upload it to your site)

### Common deployment issues:

**Issue:** "CORS error"
**Fix:** Add your domain to Supabase allowed URLs

**Issue:** "404 on pages"
**Fix:** Make sure your hosting supports client-side routing (Vercel/Netlify do)

**Issue:** "Scripts not loading"
**Fix:** Check file paths are relative (not absolute)

---

## 📞 Need Help?

1. Check `DEBUG_PRO_ACCESS.html` output
2. Check browser console (F12)
3. Check Supabase logs
4. Verify database structure matches expected schema

---

## 🎉 After Deployment

1. Test the full user flow:
   - Sign up
   - Log in
   - Check pro features
   - Log out

2. Share your site URL!

3. Monitor:
   - Supabase dashboard for errors
   - Vercel/Netlify logs
   - User feedback

Good luck! 🚀


