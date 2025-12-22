# Deploy to Vercel - Step by Step

## 🎉 Great! Your code is on GitHub. Now let's make it live!

---

## 🌐 Step 1: Sign Up for Vercel (2 minutes)

1. **Go to Vercel:**
   - Visit: [vercel.com](https://vercel.com)
   - Click "Sign Up" (top right)

2. **Sign Up with GitHub:**
   - Click "Continue with GitHub"
   - This is the easiest option since your code is already on GitHub
   - Authorize Vercel to access your GitHub account

3. **Complete Setup:**
   - Follow any on-screen prompts
   - You'll be taken to your Vercel dashboard

---

## 📦 Step 2: Import Your Project (3 minutes)

1. **In Vercel Dashboard:**
   - Click "Add New Project" (or "Import Project" button)

2. **Find Your Repository:**
   - You should see a list of your GitHub repositories
   - Look for **"OnCallPrep"** (or "tayyibgoolamallee/OnCallPrep")
   - Click "Import" next to it

3. **Configure Project:**
   - **Framework Preset:** Select **"Other"** from the dropdown
     - (It might auto-detect, but "Other" is safest for static sites)
   - **Root Directory:** Leave as `./` (default)
   - **Build Command:** Leave **empty** (no build needed)
   - **Output Directory:** Leave **empty** (default)
   - **Install Command:** Leave as default (npm install - but you don't have package.json, so it's fine)

4. **Click "Deploy"**
   - Vercel will start deploying your site
   - This takes 1-2 minutes

---

## ⏳ Step 3: Wait for Deployment (1-2 minutes)

You'll see a progress screen:
- "Building..." 
- "Deploying..."
- "Ready!"

**Don't close the page!** Wait until you see "Ready" or "Deployment successful"

---

## ✅ Step 4: Your Site is Live! (30 seconds)

1. **You'll see a success message:**
   - Your site URL will be shown (like: `oncallprep.vercel.app`)
   - Click "Visit" or copy the URL

2. **Test Your Site:**
   - Open the URL in a new tab
   - Your OnCallPrep site should be live! 🎉

---

## 🔧 Step 5: Configure Supabase for Production (5 minutes)

Your site is live, but you need to tell Supabase to allow requests from your Vercel domain.

1. **Get Your Vercel URL:**
   - It will be something like: `oncallprep-xxxxx.vercel.app`
   - Or if you set a custom name: `oncallprep.vercel.app`
   - Copy this URL

2. **Go to Supabase:**
   - Visit: [app.supabase.com](https://app.supabase.com)
   - Select your project

3. **Add Allowed URL:**
   - Go to **Settings** → **API**
   - Scroll down to **"Allowed URLs"** or **"Site URL"**
   - Add your Vercel URL: `https://your-site.vercel.app`
   - Click "Save"

4. **Test Login:**
   - Go back to your live site
   - Try logging in
   - It should work now!

---

## 🎯 Step 6: Test Everything (5 minutes)

Test these on your live site:

- [ ] Homepage loads correctly
- [ ] All pages are accessible
- [ ] Navigation works
- [ ] Login page works
- [ ] Signup page works
- [ ] Can create an account
- [ ] Can log in
- [ ] Pro features are gated (if not logged in as pro)
- [ ] Mobile responsive (check on phone)

---

## 🎨 Step 7: Custom Domain (Optional - Later)

You can add a custom domain later:
- Vercel Dashboard → Your Project → Settings → Domains
- Add your domain (e.g., `oncallprep.com`)
- Follow DNS setup instructions

**For now, the `.vercel.app` domain is fine!**

---

## 🆘 Troubleshooting

### "Build failed" error:
- Check Vercel logs (click on the deployment)
- Make sure all files are committed to GitHub
- Verify file paths are correct

### "404 on pages" error:
- This is normal for static sites
- Vercel should handle routing automatically
- If not, you may need a `vercel.json` file (we can add this if needed)

### "CORS error" or "Supabase not working":
- Make sure you added your Vercel URL to Supabase allowed URLs
- Clear browser cache
- Check Supabase logs

### Login not working:
- Check Supabase allowed URLs
- Verify your Supabase credentials in `scripts/config.js`
- Check browser console (F12) for errors

---

## 📝 Quick Checklist

- [ ] Signed up for Vercel
- [ ] Imported OnCallPrep repository
- [ ] Deployed successfully
- [ ] Got live URL
- [ ] Added Vercel URL to Supabase
- [ ] Tested login/signup
- [ ] Tested all pages
- [ ] Site is working! 🎉

---

## 🎉 Next Steps After Deployment

1. **Share your site!** - You now have a live website
2. **Add Stripe payments** - Follow `STRIPE_QUICK_SETUP.md`
3. **Get your first user!** - Share with friends/colleagues
4. **Monitor and improve** - Check Vercel analytics

---

## 💡 Pro Tips

- **Vercel auto-deploys:** Every time you push to GitHub, Vercel will automatically redeploy
- **Preview deployments:** Vercel creates preview URLs for every commit (great for testing)
- **Analytics:** Check Vercel dashboard for visitor stats
- **Logs:** Check deployment logs if something breaks

---

**Ready? Go to [vercel.com](https://vercel.com) and sign up!** 🚀


