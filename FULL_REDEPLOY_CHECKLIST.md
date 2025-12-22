# Full Redeployment Checklist

## Changes to Deploy:

✅ **AI Reflection Tool**
- `ai-reflections.html` - Main page
- `api/reflect/index.js` - Serverless function
- `package.json` - Dependencies

✅ **Priming Cases Repository**
- `data/priming-cases.json` - 35 cases repository
- `data/embedded-cases.js` - Embedded cases for file:// support
- Updated `scripts/practice-tools.js` - Fixed loading logic
- Updated `sca-practice.html` - Added embedded cases script

✅ **Logo Phone Emoji Removal**
- `trainers.html` - Phone emoji removed from logo
- `pricing.html` - Phone emoji removed from logo
- `contact.html` - Phone emoji removed from logo
- `about.html` - Phone emoji removed from logo

## Step 1: Verify All Changes Are Committed

Run in Terminal:
```bash
cd "/Users/ty/oncallprep project"
git status
```

Should show: "nothing to commit, working tree clean"

If you see uncommitted files, add them:
```bash
git add .
git commit -m "Add remaining changes for deployment"
```

## Step 2: Push Everything to GitHub

```bash
git push origin main
```

**When prompted:**
- Username: Your GitHub username
- Password: Your GitHub Personal Access Token

## Step 3: Set Up OpenAI API Key (For AI Tool)

1. **Get OpenAI API Key:**
   - Go to https://platform.openai.com
   - Sign up/login → API Keys → Create new secret key
   - Copy the key (starts with `sk-...`)
   - Add $5-10 credits

2. **Add to Vercel:**
   - Go to https://vercel.com/dashboard
   - Select OnCallPrep project
   - Settings → Environment Variables
   - Add:
     - **Key:** `OPENAI_API_KEY`
     - **Value:** Your API key
     - **Environment:** All (Production, Preview, Development)
   - Save

3. **Redeploy:**
   - Deployments tab → Latest deployment → ⋯ → Redeploy
   - Or wait for auto-deploy after push

## Step 4: Verify Deployment

### Check Vercel Dashboard:
- Latest deployment shows "Ready" (green)
- Build logs show no errors
- Dependencies installed successfully

### Test Each Feature:

1. **AI Reflection Tool:**
   - Visit: `https://oncallprep.com/ai-reflections.html`
   - Page loads correctly
   - AI tool at bottom works (after API key is set)

2. **Priming Cases:**
   - Visit: `https://oncallprep.com/sca-practice.html`
   - Click "3-Min Priming" tab
   - Click "New Priming Case"
   - Should load a random case from 35 available

3. **Logo Fixes:**
   - Visit: `https://oncallprep.com/trainers.html`
   - Check logo in nav and footer - no phone emoji
   - Visit: `https://oncallprep.com/pricing.html`
   - Check logo - no phone emoji
   - Visit: `https://oncallprep.com/contact.html`
   - Check logo - no phone emoji
   - Visit: `https://oncallprep.com/about.html`
   - Check logo - no phone emoji

## Files Being Deployed:

### New Files:
- `ai-reflections.html`
- `api/reflect/index.js`
- `package.json`
- `data/priming-cases.json`
- `data/embedded-cases.js`
- `scripts/add_priming_cases.py` (helper script)

### Modified Files:
- `scripts/practice-tools.js` (priming cases loading)
- `sca-practice.html` (embedded cases script)
- `trainers.html` (logo fix)
- `pricing.html` (logo fix)
- `contact.html` (logo fix)
- `about.html` (logo fix)

## Quick Deploy Command:

```bash
cd "/Users/ty/oncallprep project"
git add .
git commit -m "Deploy AI reflection tool, priming cases repository, and logo fixes

- Add AI reflection tool with serverless function
- Add 35-case priming repository with embedded support
- Fix logo phone emoji on trainers, pricing, contact, about pages
- Improve priming cases loading for file:// protocol"
git push origin main
```

## After Pushing:

1. ✅ Wait 1-3 minutes for Vercel to deploy
2. ✅ Check Vercel dashboard for deployment status
3. ✅ Test all features on live site
4. ✅ Set up OpenAI API key if not done yet

## Troubleshooting:

**If AI tool doesn't work:**
- Check OpenAI API key is set in Vercel
- Check you have credits in OpenAI account
- Check browser console (F12) for errors
- Check Vercel function logs

**If priming cases don't load:**
- Check browser console for errors
- Verify `data/embedded-cases.js` exists
- Check Vercel deployment logs

**If logo still shows phone:**
- Hard refresh browser (Cmd+Shift+R)
- Clear browser cache
- Verify files were pushed to GitHub

