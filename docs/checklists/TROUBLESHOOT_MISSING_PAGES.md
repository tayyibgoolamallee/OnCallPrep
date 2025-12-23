# Troubleshoot: Pages Not Showing on Live Site

## Current Status
✅ Files exist locally: `ai-reflections.html`, `trainee-support.html`
✅ Files are tracked by git
✅ Links exist in `portfolio.html`
✅ `vercel.json` configured correctly

## Step 1: Verify Files Are Actually on GitHub

**This is critical - let's verify the files are actually pushed:**

1. Go to: https://github.com/tayyibgoolamallee/OnCallPrep
2. Click on the repository
3. Check if these files exist in the **root directory**:
   - `ai-reflections.html` (click on it - should show file contents)
   - `trainee-support.html` (click on it - should show file contents)
   - `vercel.json` (should exist)
   - `portfolio.html` (should have links to both pages)

**If files are NOT on GitHub:**
- They weren't actually pushed
- Run: `git push origin main` again
- Check for any errors

**If files ARE on GitHub:**
- Continue to Step 2

## Step 2: Check Vercel Project Settings

Go to Vercel Dashboard → Your Project → Settings → General:

**Critical Settings:**
- **Root Directory:** Should be **EMPTY** (not "/" or anything else)
- **Framework Preset:** **Other** (or leave blank)
- **Build Command:** Should be **EMPTY**
- **Output Directory:** Should be **EMPTY** (vercel.json handles this)
- **Install Command:** Leave default (`npm install` or `yarn install`)

**If Root Directory is set to something:**
- Clear it (make it empty)
- Save
- Redeploy

## Step 3: Force a Fresh Deployment

1. **In Vercel Dashboard:**
   - Go to Deployments tab
   - Click "..." on latest deployment
   - Click "Redeploy"
   - **OR** click "Redeploy" button at top

2. **Watch the Build Logs:**
   - Should see: "Cloning repository..."
   - Should see: "Installing dependencies..."
   - Should see: "Deploying..."
   - Should complete with "Ready" (green)

3. **Check for Errors:**
   - Look for any red error messages
   - Check if files are being found
   - Check if deployment completes

## Step 4: Test Direct URLs

After deployment, try accessing these URLs directly:

1. **AI Reflections:**
   ```
   https://oncallprep.com/ai-reflections.html
   ```
   OR
   ```
   https://on-call-prep.vercel.app/ai-reflections.html
   ```

2. **Trainee Support:**
   ```
   https://oncallprep.com/trainee-support.html
   ```
   OR
   ```
   https://on-call-prep.vercel.app/trainee-support.html
   ```

**If URLs return 404:**
- Files aren't being deployed
- Check Vercel build logs
- Verify files are on GitHub

**If URLs work but portfolio links don't:**
- Check portfolio.html links are correct
- Hard refresh browser (Cmd+Shift+R)

## Step 5: Verify File Structure on GitHub

The structure on GitHub should be:
```
OnCallPrep/
├── ai-reflections.html          ← Should be here
├── trainee-support.html         ← Should be here
├── portfolio.html               ← Should link to both
├── vercel.json                  ← Should exist
├── package.json                 ← Should exist
├── index.html
├── sca.html
└── ... (other files)
```

**NOT in a subdirectory!**

## Step 6: Create a Test Commit to Force Redeploy

If everything looks correct but still not working, create a small change to force redeploy:

```bash
cd "/Users/ty/oncallprep project"
# Make a tiny change to force redeploy
echo "# Deployment test" >> README.md
git add README.md
git commit -m "Force redeploy: test missing pages"
git push origin main
```

This will trigger a fresh deployment and might fix caching issues.

## Step 7: Check Vercel Build Logs in Detail

In Vercel Dashboard → Latest Deployment → Build Logs:

**Look for:**
- "Cloning repository..." ✅
- "Installing dependencies..." ✅
- "Deploying..." ✅
- Any errors about missing files ❌
- Any errors about output directory ❌

**Common Issues:**
- "File not found" → Files not on GitHub
- "Output directory" error → vercel.json issue
- Build timeout → Too many files or large files

## Step 8: Manual Verification Checklist

- [ ] Files exist on GitHub (check directly)
- [ ] Files are in root directory (not subdirectory)
- [ ] vercel.json exists and is correct
- [ ] Vercel project settings: Root Directory is EMPTY
- [ ] Latest deployment shows "Ready" (green)
- [ ] Direct URLs work (test both pages)
- [ ] Portfolio page links work
- [ ] Browser cache cleared (hard refresh)

## Step 9: If Still Not Working

**Option A: Check Vercel File System**
1. In Vercel Dashboard → Latest Deployment
2. Click "View Function Logs" or "View Source"
3. See what files Vercel actually deployed

**Option B: Contact Vercel Support**
- They can check deployment logs
- They can verify file structure
- They can check for deployment issues

**Option C: Try Alternative Approach**
- Move files to a `public/` folder
- Update vercel.json to use `public` as output
- Update all links accordingly

## Quick Test Commands

Run these to verify locally:
```bash
cd "/Users/ty/oncallprep project"
# Check files exist
ls -la ai-reflections.html trainee-support.html

# Check they're tracked by git
git ls-files | grep -E "(ai-reflections|trainee-support)"

# Check latest commit includes them
git log -1 --name-only | grep -E "(ai-reflections|trainee-support)"
```

## Most Likely Issues

1. **Files not actually on GitHub** (despite git saying up to date)
   - Solution: Force push or check GitHub directly

2. **Vercel Root Directory setting** is wrong
   - Solution: Set to empty in Vercel settings

3. **Vercel caching** old deployment
   - Solution: Force redeploy or wait for cache to clear

4. **Files in wrong location** on GitHub
   - Solution: Check GitHub file structure matches local

