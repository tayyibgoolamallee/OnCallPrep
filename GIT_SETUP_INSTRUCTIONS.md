# Git Setup Instructions

## Quick Setup (Copy & Paste These Commands)

Open Terminal (or your command line) and run these commands one by one:

### Step 1: Navigate to Your Project
```bash
cd "/Users/ty/oncallprep project"
```

### Step 2: Initialize Git Repository
```bash
git init
```

### Step 3: Create .gitignore File (Optional but Recommended)
```bash
cat > .gitignore << 'EOF'
.DS_Store
*.log
.env
node_modules/
*.swp
*.swo
*~
EOF
```

### Step 4: Add All Files
```bash
git add .
```

### Step 5: Make Your First Commit
```bash
git commit -m "Restored all pages - December 2024

- Recreated all HTML pages with proper CSS classes
- Portfolio section (portfolio, st1, st2, st3)
- SCA section (sca, sca-practice)
- AKT section (akt, akt-questions)
- Additional pages (clinical-topics, consultation-models, reflection-guide, hidden-curriculum)
- All pages match original design quality"
```

### Step 6: Verify Everything Worked
```bash
git status
```

You should see "nothing to commit, working tree clean" - this means all files are tracked!

## What This Does

✅ Initializes git repository in your project folder  
✅ Tracks all your files (removes red indicators in IDE)  
✅ Creates your first commit (snapshot of current state)  
✅ Sets up .gitignore to exclude unnecessary files  

## After Setup

### Regular Commits (Do This Often!)
```bash
git add .
git commit -m "Description of what you changed"
```

### Check Status
```bash
git status
```

### View History
```bash
git log --oneline
```

## Optional: Connect to GitHub (Cloud Backup)

If you want to back up to GitHub:

1. Create a new repository on GitHub (don't initialize with README)
2. Then run:
```bash
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git branch -M main
git push -u origin main
```

## Troubleshooting

**If you get "fatal: not a git repository":**
- Make sure you're in the project directory: `cd "/Users/ty/oncallprep project"`
- Run `git init` again

**If files still show red:**
- Make sure you ran `git add .` and `git commit`
- Try refreshing your IDE/editor

---

**That's it!** Once you run these commands, all the red indicators should disappear and your files will be safely tracked in git.

