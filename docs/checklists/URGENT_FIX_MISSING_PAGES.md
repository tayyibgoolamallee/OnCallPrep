# URGENT: Fix Missing Pages on Live Site

## The Problem
Files are committed and pushed, but `ai-reflections.html` and `trainee-support.html` aren't showing on the live Vercel site.

## Root Cause Analysis

Based on Vercel error: "No Output Directory named 'public' found"

**The Issue:** Vercel is looking for files in a `public/` directory, but your files are in the root directory.

## Solution: Fix Vercel Configuration

### Step 1: Commit Latest Fixes

I've just fixed:
- ✅ Phone emoji in `trainee-support.html` logo
- ✅ `vercel.json` configured correctly

Run these commands:

```bash
cd "/Users/ty/oncallprep project"
git add trainee-support.html vercel.json
git commit -m "Fix trainee support logo and ensure Vercel config is correct"
git push origin main
```

### Step 2: CRITICAL - Check Vercel Project Settings

**This is the most important step!**

1. Go to: https://vercel.com/dashboard
2. Select your **on-call-prep** project
3. Go to **Settings** → **General**
4. Check these settings:

   **Root Directory:** 
   - Should be **COMPLETELY EMPTY** (not "/" or "." or anything)
   - If it has anything in it, **DELETE IT** and leave blank
   - Click **Save**

   **Framework Preset:**
   - Should be **Other** (or blank)
   
   **Build Command:**
   - Should be **EMPTY** (leave blank)
   
   **Output Directory:**
   - Should be **EMPTY** (vercel.json handles this)
   - If it says "public", **DELETE IT** and leave blank
   - Click **Save**

5. **After saving, go to Deployments tab**
6. Click **"Redeploy"** button (or "..." → "Redeploy" on latest)

### Step 3: Verify Files Are on GitHub

**DO THIS - It's critical to verify:**

1. Go to: https://github.com/tayyibgoolamallee/OnCallPrep
2. Click on the repository
3. **Look in the root directory** (not in any subfolder)
4. You should see:
   - `ai-reflections.html` ← Click it, should show file
   - `trainee-support.html` ← Click it, should show file
   - `vercel.json` ← Should exist
   - `portfolio.html` ← Should have links

**If you DON'T see these files:**
- They weren't actually pushed
- Run: `git push origin main --force` (be careful with force!)
- Or check if you're looking at the right branch

### Step 4: Force a Fresh Deployment

After fixing Vercel settings:

1. **In Vercel Dashboard:**
   - Go to **Deployments** tab
   - Click the **"Redeploy"** button at the top
   - OR click "..." on latest deployment → "Redeploy"

2. **Watch the build:**
   - Should complete successfully
   - Should show "Ready" (green)
   - Should NOT show "public directory" error

### Step 5: Test After Deployment

Wait 2-3 minutes, then test:

1. **Direct URLs:**
   - `https://oncallprep.com/ai-reflections.html`
   - `https://oncallprep.com/trainee-support.html`
   
2. **From Portfolio:**
   - `https://oncallprep.com/portfolio.html`
   - Click "Support for Trainees" card
   - Click "AI Reflection Assistant" card

3. **Hard Refresh:**
   - Cmd+Shift+R (Mac) or Ctrl+Shift+R (Windows)
   - Clears browser cache

## Most Likely Issue: Vercel Root Directory Setting

**If Vercel has "Root Directory" set to anything other than empty:**
- It will look for files in that subdirectory
- Your files are in root, so they won't be found
- **Solution: Make Root Directory EMPTY**

## Alternative: If Root Directory Must Be Set

If for some reason you need a root directory setting:

1. Create a `public/` folder
2. Move all HTML files to `public/`
3. Update vercel.json:
   ```json
   {
     "outputDirectory": "public",
     "functions": {
       "api/reflect/index.js": {
         "runtime": "nodejs18.x"
       }
     }
   }
   ```
4. Update all internal links (not recommended, but works)

## Quick Checklist

- [ ] Files exist on GitHub (verify directly)
- [ ] Vercel Root Directory is **EMPTY** (most important!)
- [ ] vercel.json exists and is correct
- [ ] Latest changes committed and pushed
- [ ] Vercel redeployed after settings change
- [ ] Build succeeds (no errors)
- [ ] Pages accessible via direct URL
- [ ] Browser cache cleared (hard refresh)

## If Still Not Working

**Check Vercel Build Logs:**
1. Go to latest deployment
2. Click "Build Logs"
3. Look for:
   - "Deploying..." (should see this)
   - List of files being deployed
   - Any "file not found" errors

**Contact Vercel Support:**
- They can check your deployment
- They can verify file structure
- They can check for configuration issues

## Expected File Structure on Vercel

After deployment, Vercel should have:
```
/
├── ai-reflections.html
├── trainee-support.html
├── portfolio.html
├── index.html
├── vercel.json
├── package.json
└── ... (all other files)
```

**NOT:**
```
/public/
  └── (files here)
```

