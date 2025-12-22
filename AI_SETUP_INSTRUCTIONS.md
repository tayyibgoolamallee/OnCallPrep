# Setting Up the AI Reflection Assistant

## Overview
The AI Reflection Assistant is now embedded in your website. To make it work, you need to:

1. Get an OpenAI API key
2. Add it to Vercel environment variables
3. Install dependencies (if needed)

## Step 1: Get OpenAI API Key

1. Go to https://platform.openai.com
2. Sign up or log in
3. Navigate to API Keys section
4. Click "Create new secret key"
5. Copy the key (you won't see it again!)
6. Add credits to your account ($5-10 is enough to start)

## Step 2: Add API Key to Vercel

1. Go to your Vercel dashboard
2. Select your OnCallPrep project
3. Go to Settings → Environment Variables
4. Add a new variable:
   - **Name:** `OPENAI_API_KEY`
   - **Value:** Your OpenAI API key
   - **Environment:** Production, Preview, Development (select all)
5. Click "Save"
6. **Redeploy** your site (Vercel will automatically redeploy, or you can trigger it manually)

## Step 3: Install Dependencies (if needed)

If Vercel doesn't automatically install dependencies, you may need to:

1. In your local project, run:
   ```bash
   npm install
   ```

2. Commit and push:
   ```bash
   git add package.json package-lock.json
   git commit -m "Add OpenAI dependency for AI reflection tool"
   git push origin main
   ```

Vercel should automatically detect the `package.json` and install dependencies during deployment.

## Step 4: Test the Tool

1. Go to your deployed website
2. Navigate to the "AI Reflection Assistant" page
3. Enter a sample reflection
4. Click "Get AI Suggestions"
5. You should see AI-generated feedback

## Cost Estimates

**OpenAI Pricing (GPT-4o-mini):**
- Input: $0.15 per 1M tokens
- Output: $0.60 per 1M tokens
- Average reflection: ~500 input + ~1000 output tokens
- **Cost per reflection: ~$0.00075 (less than 1 cent)**

**Monthly estimates:**
- 100 users, 5 reflections each = 500 reflections
- Cost: 500 × $0.00075 = **$0.38/month**
- Very affordable!

## Making it a Pro Feature (Optional)

You can limit usage by:

1. Adding user authentication check in the API route
2. Tracking usage in Supabase
3. Limiting free users to 3 reflections/month
4. Unlimited for Pro users

This would require:
- Checking user authentication in `/api/reflect/index.js`
- Querying Supabase for usage count
- Returning error if limit exceeded

## Troubleshooting

**Error: "AI service not configured"**
- Check that `OPENAI_API_KEY` is set in Vercel
- Make sure you redeployed after adding the variable

**Error: "Failed to process reflection"**
- Check OpenAI API key is valid
- Check you have credits in your OpenAI account
- Check Vercel function logs for detailed errors

**Function not found (404)**
- Make sure `/api/reflect/index.js` exists
- Check Vercel detected it as a serverless function
- Redeploy if needed

## Security Notes

✅ **API key is secure:**
- Stored in Vercel environment variables (not in code)
- Only accessible server-side
- Never exposed to frontend

✅ **Input validation:**
- Length limits (5000 chars)
- Method validation (POST only)
- Error handling

## Next Steps

Once working, you could:
1. Add rate limiting per user
2. Track usage statistics
3. Add more sophisticated prompts
4. Support multiple reflection frameworks
5. Export formatted reflections

The tool is ready to use once you add the OpenAI API key!

