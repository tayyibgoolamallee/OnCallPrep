# How to Redeploy Your Website

When you make changes to your website files, you need to push them to GitHub. Vercel will automatically detect the changes and redeploy your site.

## Quick Steps

1. **Open Terminal** (on your Mac)

2. **Navigate to your project folder:**
   ```bash
   cd "/Users/ty/oncallprep project"
   ```

3. **Check what files have changed:**
   ```bash
   git status
   ```
   This shows you which files have been modified.

4. **Add all changed files:**
   ```bash
   git add .
   ```
   This stages all your changes.

5. **Commit the changes:**
   ```bash
   git commit -m "Update SCA practice tools: replace self-assessment with clinical topics tab"
   ```
   (You can change the message to describe what you changed)

6. **Push to GitHub:**
   ```bash
   git push origin main
   ```
   When prompted for your password, paste your GitHub Personal Access Token (the same one you used before).

7. **Wait for Vercel to deploy:**
   - Vercel will automatically detect the push to GitHub
   - It usually takes 1-3 minutes to build and deploy
   - You can check the deployment status in your Vercel dashboard
   - Once it says "Ready", your changes are live!

## Viewing Your Deployment

- **Vercel Dashboard:** Go to [vercel.com](https://vercel.com) and log in
- **Deployment URL:** Your site will be at your Vercel URL (something like `your-project.vercel.app`)
- **Custom Domain:** If you've linked `oncallprep.com`, it will also update there automatically

## Troubleshooting

**If git push asks for credentials:**
- Use your GitHub username
- Use your Personal Access Token (not your password)

**If deployment fails:**
- Check the Vercel dashboard for error messages
- Make sure all file paths are correct
- Check that you haven't introduced any syntax errors

**To see deployment logs:**
- Go to your Vercel dashboard
- Click on the latest deployment
- View the build logs to see what happened

## That's It!

Once Vercel finishes deploying, your changes will be live on your website. No need to do anything else - it's automatic!

