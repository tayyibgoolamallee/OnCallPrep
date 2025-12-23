# Deployment (Vercel)

## Prereqs
- GitHub repo connected to Vercel
- No build step (static site)
- `vercel.json` already configured (`outputDirectory: "."`)

## Steps
1) Push to `main`
2) Vercel auto‑builds and deploys
3) Verify status in Vercel dashboard (should be “Ready”)

## Environment variables
Set in Vercel → Settings → Environment Variables:
- `OPENAI_API_KEY`

## Common issues
- **Missing output directory**: ensure `vercel.json` has `outputDirectory: "."` and no root directory is set in Vercel project settings.
- **Serverless errors**: check `api/reflect/index.js` logs in Vercel Functions tab.

## Local preview (static)
```bash
python3 -m http.server 8000
# open http://localhost:8000
```

