# Troubleshooting

## Vercel deployment fails: "No Output Directory named public"
- Ensure `vercel.json` has `"outputDirectory": "."`.
- In Vercel project settings, leave Root Directory and Output Directory empty.

## Serverless function errors
- Check Vercel → Functions logs for `api/reflect/index.js`.
- Verify `OPENAI_API_KEY` is set in environment variables.

## Pages not visible
- Confirm the files exist in the repository root on GitHub.
- Hard refresh browser (Cmd/Ctrl + Shift + R).
- Redeploy from Vercel dashboard.

## Auth / Pro content not showing
- Confirm Supabase keys/config are loaded.
- Ensure `initAccessControl` and `lockProContent` run on DOMContentLoaded.

