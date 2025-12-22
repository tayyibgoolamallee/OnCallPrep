# Deploy AI Reflection Tool to Live Website

## Current Status
✅ AI reflection files are committed locally:
- `ai-reflections.html` - The main page
- `api/reflect/index.js` - Serverless function
- `package.json` - Dependencies

## Step 1: Push to GitHub (if not already done)

Run these commands in Terminal:

```bash
cd "/Users/ty/oncallprep project"
git status
```

If you see "nothing to commit, working tree clean", the files are already committed. Then:

```bash
git push origin main
```

**If prompted for credentials:**
- Username: Your GitHub username
- Password: Your GitHub Personal Access Token

## Step 2: Verify Files Are on GitHub

1. Go to https://github.com/tayyibgoolamallee/OnCallPrep
2. Check that these files exist:
   - `ai-reflections.html`
   - `api/reflect/index.js`
   - `package.json`

## Step 3: Set Up OpenAI API Key in Vercel

**This is REQUIRED for the AI tool to work!**

1. **Get OpenAI API Key:**
   - Go to https://platform.openai.com
   - Sign up/login
   - Go to API Keys section
   - Click "Create new secret key"
   - Copy the key (starts with `sk-...`)
   - Add $5-10 credits to your account

2. **Add to Vercel:**
   - Go to https://vercel.com/dashboard
   - Select your OnCallPrep project
   - Click **Settings** → **Environment Variables**
   - Click **Add New**
   - Enter:
     - **Key:** `OPENAI_API_KEY`
     - **Value:** Your OpenAI API key (paste it)
     - **Environment:** Select all (Production, Preview, Development)
   - Click **Save**

3. **Redeploy:**
   - Go to **Deployments** tab
   - Click the **⋯** (three dots) on the latest deployment
   - Click **Redeploy**
   - Or push a new commit to trigger auto-deploy

## Step 4: Verify Deployment

1. **Check Vercel Dashboard:**
   - Go to your project in Vercel
   - Check the latest deployment status
   - Should show "Ready" (green)

2. **Check Build Logs:**
   - Click on the deployment
   - Check "Build Logs" for any errors
   - Should see: "Installing dependencies..." and "Build completed"

3. **Test the Page:**
   - Go to: `https://your-site.vercel.app/ai-reflections.html`
   - Or: `https://oncallprep.com/ai-reflections.html` (if domain is linked)
   - The page should load

4. **Test the AI Tool:**
   - Scroll to the bottom of the page
   - Enter some reflection text
   - Click "Get AI Suggestions"
   - If it works: You'll see AI-generated suggestions
   - If it doesn't: Check browser console (F12) for errors

## Step 5: Troubleshooting

**If the page doesn't exist:**
- Check that `ai-reflections.html` is in the root directory
- Verify it's pushed to GitHub
- Check Vercel deployment logs

**If the AI tool doesn't work:**
- Check browser console (F12) for errors
- Verify `OPENAI_API_KEY` is set in Vercel
- Check Vercel function logs (Settings → Functions)
- Make sure you have credits in your OpenAI account

**If dependencies fail to install:**
- Check that `package.json` is in the root
- Check Vercel build logs for npm errors
- May need to add `vercel.json` configuration (see below)

## Optional: Add vercel.json for Better Configuration

Create `vercel.json` in your project root:

```json
{
  "functions": {
    "api/reflect/index.js": {
      "runtime": "nodejs18.x"
    }
  }
}
```

Then commit and push:
```bash
git add vercel.json
git commit -m "Add Vercel configuration for serverless functions"
git push origin main
```

## Quick Checklist

- [ ] Files pushed to GitHub
- [ ] OpenAI API key obtained
- [ ] API key added to Vercel environment variables
- [ ] Site redeployed on Vercel
- [ ] Page accessible at `/ai-reflections.html`
- [ ] AI tool functional (test with sample text)

## Need Help?

If the tool still doesn't work after these steps:
1. Check Vercel function logs for errors
2. Verify OpenAI API key is valid
3. Check browser console for client-side errors
4. Make sure you have OpenAI account credits

