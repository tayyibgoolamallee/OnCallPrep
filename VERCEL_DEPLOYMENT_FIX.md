# Fix: Pages Not Showing on Live Website

## Problem
Files are committed and pushed to GitHub, but pages aren't appearing on the live Vercel site.

## Solution Steps

### Step 1: Verify Files Are on GitHub

1. Go to: https://github.com/tayyibgoolamallee/OnCallPrep
2. Check these files exist:
   - `ai-reflections.html` (in root)
   - `trainee-support.html` (in root)
   - `api/reflect/index.js` (in api/reflect folder)
   - `package.json` (in root)
   - `vercel.json` (in root - just created)

### Step 2: Commit New Changes

I've just:
- Fixed phone emoji in `ai-reflections.html` logo
- Created `vercel.json` for proper serverless function configuration

Run these commands:

```bash
cd "/Users/ty/oncallprep project"
git add .
git commit -m "Fix AI reflections logo and add Vercel configuration

- Remove phone emoji from ai-reflections.html logo
- Add vercel.json for proper serverless function deployment
- Ensure API routes are correctly configured"
git push origin main
```

### Step 3: Force Vercel Redeploy

After pushing:

1. **Go to Vercel Dashboard:**
   - https://vercel.com/dashboard
   - Select your OnCallPrep project

2. **Check Latest Deployment:**
   - Look at the "Deployments" tab
   - Check if the latest deployment succeeded or failed
   - Look for any error messages in build logs

3. **Manual Redeploy:**
   - Click on the latest deployment
   - Click "..." (three dots) → "Redeploy"
   - Or go to Settings → Git → "Redeploy"

4. **Check Build Logs:**
   - During deployment, check "Build Logs"
   - Look for:
     - "Installing dependencies..." (should see npm install)
     - "Building..." (should complete successfully)
     - Any errors about missing files

### Step 4: Verify Deployment

After redeploy completes:

1. **Check Deployment Status:**
   - Should show "Ready" (green)
   - Should show deployment URL

2. **Test Pages Directly:**
   - `https://your-site.vercel.app/ai-reflections.html`
   - `https://your-site.vercel.app/trainee-support.html`
   - `https://your-site.vercel.app/portfolio.html` (check links work)

3. **Check Browser Console:**
   - Open page (F12)
   - Check for 404 errors
   - Check for any JavaScript errors

### Step 5: Common Issues & Fixes

**If pages return 404:**
- Files might not be in root directory on GitHub
- Check GitHub file structure matches local
- Vercel might need a redeploy after file structure changes

**If API doesn't work:**
- Check `vercel.json` is committed
- Verify `api/reflect/index.js` exists
- Check Vercel function logs (Settings → Functions)
- Make sure `OPENAI_API_KEY` is set in environment variables

**If build fails:**
- Check `package.json` is in root
- Check build logs for npm install errors
- Verify Node.js version (should be 18.x)

**If pages load but links don't work:**
- Check `portfolio.html` has correct href paths
- Verify file names match exactly (case-sensitive)
- Hard refresh browser (Cmd+Shift+R)

### Step 6: Verify File Structure on GitHub

The structure should be:
```
OnCallPrep/
├── ai-reflections.html
├── trainee-support.html
├── portfolio.html
├── package.json
├── vercel.json
└── api/
    └── reflect/
        └── index.js
```

### Step 7: Check Vercel Project Settings

1. **Settings → General:**
   - Root Directory: Should be empty (or "/")
   - Framework Preset: Other (or leave blank)
   - Build Command: Leave empty (static site)
   - Output Directory: Leave empty

2. **Settings → Environment Variables:**
   - `OPENAI_API_KEY` should be set
   - Available for: Production, Preview, Development

3. **Settings → Functions:**
   - Should auto-detect `api/` folder
   - Runtime: Node.js 18.x

## Quick Checklist

- [ ] Files exist on GitHub
- [ ] `vercel.json` is committed and pushed
- [ ] Latest commit pushed to GitHub
- [ ] Vercel deployment triggered (auto or manual)
- [ ] Build logs show success
- [ ] Pages accessible via direct URL
- [ ] Links work from portfolio page
- [ ] OpenAI API key set in Vercel (for AI tool)

## Still Not Working?

1. **Check Vercel Build Logs:**
   - Look for specific error messages
   - Check if files are being found

2. **Verify GitHub Repository:**
   - Make sure you're pushing to the correct repo
   - Check the branch (should be `main`)

3. **Contact Vercel Support:**
   - If build succeeds but pages don't appear
   - They can check deployment logs

4. **Try Manual File Upload:**
   - As a last resort, you can upload files directly in Vercel
   - But Git-based deployment is preferred

