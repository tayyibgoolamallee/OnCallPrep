# Step-by-Step Deployment Guide

## 🚀 Step 1: Create GitHub Repository (5 minutes)

1. **Go to GitHub:**
   - Visit [github.com](https://github.com) and sign in (or create account)
   
2. **Create New Repository:**
   - Click the "+" icon in top right → "New repository"
   - Repository name: `oncallprep` (or whatever you prefer)
   - Description: "GP training platform for UK trainees"
   - Choose: **Public** (free) or **Private** (if you want it private)
   - **DO NOT** initialize with README, .gitignore, or license (we already have files)
   - Click "Create repository"

3. **Copy the repository URL:**
   - You'll see a page with setup instructions
   - Copy the URL (looks like: `https://github.com/YOUR_USERNAME/oncallprep.git`)
   - **Save this URL** - you'll need it in the next step

---

## 📤 Step 2: Push to GitHub (2 minutes)

Run these commands in your terminal (in the project directory):

```bash
# Add GitHub as remote
git remote add origin https://github.com/YOUR_USERNAME/oncallprep.git

# Push your code
git push -u origin main
```

**Replace `YOUR_USERNAME` with your actual GitHub username!**

If you get an authentication error, you may need to:
- Use a Personal Access Token instead of password
- Or set up SSH keys

---

## 🌐 Step 3: Deploy to Vercel (10 minutes)

1. **Sign up for Vercel:**
   - Go to [vercel.com](https://vercel.com)
   - Click "Sign Up"
   - Choose "Continue with GitHub" (easiest option)
   - Authorize Vercel to access your GitHub

2. **Import Your Project:**
   - Click "Add New Project"
   - You should see your `oncallprep` repository
   - Click "Import" next to it

3. **Configure Project:**
   - **Framework Preset:** Select "Other" (it's a static site)
   - **Root Directory:** Leave as `./` (default)
   - **Build Command:** Leave empty (no build needed for static site)
   - **Output Directory:** Leave empty
   - Click "Deploy"

4. **Wait for Deployment:**
   - Vercel will deploy your site (takes 1-2 minutes)
   - You'll see a success message with your live URL
   - Your site is now live! 🎉

---

## 🔧 Step 4: Configure Supabase for Production (5 minutes)

1. **Add Your Domain to Supabase:**
   - Go to [Supabase Dashboard](https://app.supabase.com)
   - Select your project
   - Go to **Settings** → **API**
   - Scroll to "Allowed URLs"
   - Add your Vercel URL: `https://your-project.vercel.app`
   - Click "Save"

2. **Test Your Live Site:**
   - Visit your Vercel URL
   - Try logging in
   - Test signup
   - Check if pages load correctly

---

## ✅ Step 5: Verify Everything Works

Test these on your live site:
- [ ] Homepage loads
- [ ] Navigation works
- [ ] Login page works
- [ ] Signup page works
- [ ] Can log in successfully
- [ ] Pro features are gated correctly
- [ ] Mobile responsive (test on phone)

---

## 🎯 Next: Add Stripe Payments

Once your site is live, follow `STRIPE_QUICK_SETUP.md` to add payment processing.

---

## 🆘 Troubleshooting

### "Repository not found" error:
- Check the repository URL is correct
- Make sure the repository exists on GitHub
- Verify you have access to it

### "Authentication failed" error:
- You may need a Personal Access Token
- Go to GitHub → Settings → Developer settings → Personal access tokens
- Generate a token with `repo` permissions
- Use token as password when pushing

### Vercel deployment fails:
- Check Vercel logs for errors
- Make sure all files are committed
- Verify file paths are correct

### Supabase CORS errors:
- Make sure you added your Vercel domain to allowed URLs
- Clear browser cache
- Check Supabase logs

---

## 📝 Quick Command Reference

```bash
# Check if remote exists
git remote -v

# Add GitHub remote (replace with your URL)
git remote add origin https://github.com/YOUR_USERNAME/oncallprep.git

# Push to GitHub
git push -u origin main

# If you need to update the remote URL
git remote set-url origin https://github.com/YOUR_USERNAME/oncallprep.git
```

---

**Ready? Start with Step 1 - Create your GitHub repository!** 🚀


