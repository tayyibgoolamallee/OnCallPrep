# How to Push Your Code to GitHub

## 📝 Step-by-Step Instructions

### Step 1: Open Terminal on Your Mac

1. Press `Cmd + Space` (Command + Spacebar)
2. Type "Terminal"
3. Press Enter
4. Terminal will open

---

### Step 2: Navigate to Your Project

In Terminal, type this command and press Enter:

```bash
cd "/Users/ty/oncallprep project"
```

**Note:** The quotes are important because your folder name has a space in it!

You should see your prompt change to show you're in the project directory.

---

### Step 3: Add GitHub as Remote

Type this command and press Enter:

```bash
git remote add origin https://github.com/tayyibgoolamallee/OnCallPrep.git
```

If you see an error saying "remote origin already exists", that's okay - it means it's already set up. You can skip to Step 4.

---

### Step 4: Push Your Code to GitHub

Type this command and press Enter:

```bash
git push -u origin main
```

**What will happen:**
- Git will ask for your GitHub username (enter: `tayyibgoolamallee`)
- Git will ask for your password
  - **Important:** You can't use your regular GitHub password
  - You need a **Personal Access Token** (see below)

---

### Step 5: Create Personal Access Token (If Needed)

If Git asks for a password and your regular password doesn't work:

1. **Go to GitHub:**
   - Visit: https://github.com/settings/tokens
   - Or: GitHub → Your Profile → Settings → Developer settings → Personal access tokens → Tokens (classic)

2. **Generate New Token:**
   - Click "Generate new token" → "Generate new token (classic)"
   - Name it: "OnCallPrep Deployment"
   - Expiration: Choose 90 days (or longer)
   - **Check these permissions:**
     - ✅ `repo` (full control of private repositories)
   - Click "Generate token"

3. **Copy the Token:**
   - **IMPORTANT:** Copy it immediately - you won't see it again!
   - It looks like: `ghp_xxxxxxxxxxxxxxxxxxxx`

4. **Use Token as Password:**
   - When Git asks for password, paste the token instead
   - It won't show as you type (that's normal for security)

---

## ✅ Success!

If everything worked, you'll see:
```
Enumerating objects: XX, done.
Counting objects: 100% (XX/XX), done.
Writing objects: 100% (XX/XX), done.
To https://github.com/tayyibgoolamallee/OnCallPrep.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

**Your code is now on GitHub!** 🎉

---

## 🆘 Troubleshooting

### "Permission denied" error:
- Make sure you're using a Personal Access Token, not your password
- Check the token has `repo` permissions

### "Repository not found" error:
- Make sure the repository exists at: https://github.com/tayyibgoolamallee/OnCallPrep
- Check you're logged into the correct GitHub account

### "Authentication failed" error:
- Your token might have expired
- Generate a new token and try again

### "Remote origin already exists" error:
- That's fine! Just run: `git push -u origin main`

---

## 🎯 Next Step: Deploy to Vercel

Once your code is on GitHub, go to:
1. [vercel.com](https://vercel.com)
2. Sign up with GitHub
3. Import your `OnCallPrep` repository
4. Deploy!

See `DEPLOYMENT_STEPS.md` for full Vercel instructions.

---

## 💡 Quick Copy-Paste Commands

Copy and paste these one at a time into Terminal:

```bash
cd "/Users/ty/oncallprep project"
```

```bash
git remote add origin https://github.com/tayyibgoolamallee/OnCallPrep.git
```

```bash
git push -u origin main
```

**That's it!** Your code will be pushed to GitHub.


