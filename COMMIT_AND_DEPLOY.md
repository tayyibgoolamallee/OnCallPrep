# Commit and Deploy Instructions

## Current Changes to Save:
- ✅ Fixed priming cases loading (works with file:// protocol)
- ✅ Added 35 priming cases repository (embedded in JavaScript)
- ✅ Updated SCA practice tools with improved error handling
- ✅ Created embedded cases file for local testing

## Steps to Save and Deploy:

### 1. Open Terminal and navigate to project:
```bash
cd "/Users/ty/oncallprep project"
```

### 2. Stage all changes:
```bash
git add .
```

### 3. Commit with descriptive message:
```bash
git commit -m "Add priming cases repository and fix loading issues

- Added comprehensive 35-case priming repository (data/priming-cases.json)
- Created embedded cases file for file:// protocol support (data/embedded-cases.js)
- Fixed priming cases loading to work both locally and on Vercel
- Improved error handling and user feedback in practice tools
- All cases use numerical IDs for easy organization"
```

### 4. Push to GitHub (this will trigger Vercel deployment):
```bash
git push origin main
```

**Note:** When prompted for password, use your GitHub Personal Access Token (not your GitHub password).

## What Happens Next:
1. ✅ Changes are saved to GitHub
2. ✅ Vercel automatically detects the push
3. ✅ Vercel rebuilds and redeploys your site (takes 1-3 minutes)
4. ✅ Your live site will have all the new priming cases!

## Verify Deployment:
After pushing, check:
- Your Vercel dashboard: https://vercel.com/dashboard
- Your live site: https://oncallprep.com (or your Vercel URL)
- The 3-Minute Priming tool should now work with 35 cases!

