# Deploy AI Reflection Tool & Trainee Support Pages

## Issue
The AI Reflection Tool and Trainee Support pages exist locally but aren't visible on the live website.

## Solution: Push All Commits to GitHub

The files are committed locally but need to be pushed to GitHub so Vercel can deploy them.

## Step 1: Check What Needs to Be Pushed

Run in Terminal:
```bash
cd "/Users/ty/oncallprep project"
git status
```

Should show: "nothing to commit, working tree clean"

## Step 2: Push Everything to GitHub

```bash
git push origin main
```

**When prompted:**
- Username: Your GitHub username
- Password: Your GitHub Personal Access Token (not your password)

## Step 3: Verify Files Are on GitHub

After pushing, check:
1. Go to: https://github.com/tayyibgoolamallee/OnCallPrep
2. Verify these files exist:
   - `ai-reflections.html`
   - `trainee-support.html`
   - `api/reflect/index.js`
   - `package.json`
   - `portfolio.html` (with links to both pages)

## Step 4: Wait for Vercel Deployment

1. Go to Vercel dashboard: https://vercel.com/dashboard
2. Check your OnCallPrep project
3. Wait for deployment to complete (1-3 minutes)
4. Status should show "Ready" (green)

## Step 5: Test on Live Site

After deployment:

1. **Trainee Support Page:**
   - Visit: `https://oncallprep.com/trainee-support.html`
   - Or: `https://oncallprep.com/portfolio.html` → Click "Support for Trainees" card

2. **AI Reflection Tool:**
   - Visit: `https://oncallprep.com/ai-reflections.html`
   - Or: `https://oncallprep.com/portfolio.html` → Click "AI Reflection Assistant" card

## Step 6: Set Up OpenAI API Key (For AI Tool to Work)

The AI tool page will load, but the AI functionality needs an API key:

1. Get OpenAI API key from https://platform.openai.com
2. Add to Vercel:
   - Settings → Environment Variables
   - Key: `OPENAI_API_KEY`
   - Value: Your API key
   - Environment: All
3. Redeploy

## Files That Should Be Deployed:

✅ `ai-reflections.html` - AI Reflection Assistant page
✅ `trainee-support.html` - Support for Trainees page
✅ `api/reflect/index.js` - Serverless function for AI tool
✅ `package.json` - Dependencies (OpenAI)
✅ `portfolio.html` - Updated with links to both pages

## If Pages Still Don't Appear:

1. **Hard refresh browser:** Cmd+Shift+R (Mac) or Ctrl+Shift+R (Windows)
2. **Clear browser cache**
3. **Check Vercel deployment logs** for errors
4. **Verify files on GitHub** - make sure they're actually there
5. **Check Vercel build logs** - look for any file not found errors

## Quick Command:

```bash
cd "/Users/ty/oncallprep project"
git push origin main
```

Then wait 1-3 minutes and check your live site!

