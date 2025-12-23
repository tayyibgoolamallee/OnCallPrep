# OnCallPrep Website

Static front‑end site with Vercel serverless support for the AI Reflection Assistant.

## Structure (current)
- `public/` — deploy output (per `vercel.json`)
  - `index.html` — homepage
  - `pages/` — all other site pages (SCA, AKT, portfolio, pricing, etc.)
  - `styles/` — CSS
  - `scripts/` — browser JS
  - `data/` — JSON / embedded data
- `api/` — serverless functions (e.g., `api/reflect/index.js`)
- `scripts-tools/` — helper Python scripts
- `sql/` — Supabase SQL helpers
- `docs/` — deployment, auth/Supabase, Stripe, checklists, git help
- `meta/` — planning notes

## Local run
This is a static site. Any simple server works:
```bash
python3 -m http.server 8000
# then open http://localhost:8000
```

## Deployment
- Vercel auto‑deploys on push to `main`.
- `vercel.json` points to `public/` as the output directory; serverless lives in `api/`.

## AI Reflection Assistant
- Serverless function: `api/reflect/index.js`
- Requires environment variable `OPENAI_API_KEY`
- Set this in Vercel → Project Settings → Environment Variables.

## Formatting / tooling
- `.editorconfig` and `.prettierrc.json` added for consistent spacing/indentation.
- No build step required (static HTML/CSS/JS).

## Notes
- Keep paths relative to root for static hosting.
- If you add environment variables locally, create a `.env` (not committed) with `OPENAI_API_KEY=...`.
# OnCallPrep 📞

**GP Training Made Simple** — Your complete companion for GP training success.

## 🎯 What is OnCallPrep?

OnCallPrep is a web application designed to help GP (General Practice) trainees in the UK with:

1. **Portfolio Helper** — Clear guidance for ST1, ST2, and ST3 requirements
2. **SCA Preparation** — Tools and practice for the Simulated Consultation Assessment
3. **AKT Question Bank** — MCQ practice aligned with current guidelines

## 📁 Project Structure

```
oncallprep-project/
├── public/
│   ├── index.html              # Homepage
│   ├── pages/                  # All site pages (SCA, AKT, portfolio, etc.)
│   ├── scripts/                # Browser JS
│   ├── styles/                 # CSS
│   └── data/                   # JSON / embedded data
├── api/                        # Vercel serverless functions
├── scripts-tools/              # Helper Python scripts
├── sql/                        # Supabase SQL helpers
├── docs/                       # Deployment/auth/Stripe/checklists/git docs
├── meta/                       # Planning notes
├── vercel.json                 # Output directory config
├── package.json                # Dependencies (OpenAI client)
└── README.md
```

## 🚀 How to View Your Website

### Option 1: Simply Open in Browser
1. Find the `index.html` file in your project folder
2. Double-click it to open in your default browser
3. Navigate between pages using the links

### Option 2: Use a Local Server (Recommended)
Using a local server prevents some browser issues with file paths.

**If you have Python installed:**
```bash
# Navigate to your project folder in Terminal
cd "/Users/ty/oncallprep project"

# Start a simple server (Python 3)
python3 -m http.server 8000

# Then open http://localhost:8000 in your browser
```

**If you have Node.js installed:**
```bash
# Install a simple server globally
npm install -g serve

# Run it
serve "/Users/ty/oncallprep project"
```

### Option 3: VS Code Live Server
If you use Visual Studio Code:
1. Install the "Live Server" extension
2. Right-click on `index.html`
3. Select "Open with Live Server"

## 🎨 Brand Colors

| Color | Variable | Usage |
|-------|----------|-------|
| Teal | `--color-primary-*` | Primary brand color |
| Blue | `--color-secondary-*` | Secondary accents |
| Green | `--color-success-*` | Correct answers, success states |
| Red | `--color-error-*` | Incorrect answers, errors |

## 📋 Current Status

### ✅ Phase 1: Foundation (Complete)
- [x] Landing page with hero section
- [x] Features overview
- [x] How it works section
- [x] Testimonials section
- [x] Pricing page with tiers
- [x] About page
- [x] Contact page
- [x] Login & Signup pages (visual only)
- [x] Responsive design

### 🔜 Phase 2: Portfolio Helper (Next)
- [ ] Portfolio overview page
- [ ] ST1 requirements & checklists
- [ ] ST2 requirements & checklists
- [ ] ST3 requirements & checklists
- [ ] Reflection guides
- [ ] Consultation models

### 🔜 Phase 3: Payments
- [ ] Stripe integration
- [ ] Subscription management
- [ ] User authentication (Supabase)

### 🔜 Phase 4: SCA Prep
- [ ] SCA overview page
- [ ] Timed practice tools
- [ ] Mock case library
- [ ] Condition randomizer

### 🔜 Phase 5: AKT Question Bank
- [ ] Question database
- [ ] Quiz interface
- [ ] Progress tracking

### 🔜 Phase 6: AI Features
- [ ] AI reflection assistant
- [ ] AI consultation practice

## 🛠️ Technologies Used

- **HTML5** — Structure
- **CSS3** — Styling (with CSS Variables for theming)
- **JavaScript** — Interactivity
- **Google Fonts** — Typography (Plus Jakarta Sans, Fraunces)

## 📝 Notes for Development

### Adding New Pages
1. Copy an existing page as a template
2. Update the `<title>` and meta description
3. Change the content
4. Add `class="active"` to the current nav link

### Modifying Colors
All colors are defined as CSS variables in `styles/main.css`. To change the brand color, update the `--color-primary-*` variables.

### Adding Content
Most content is currently placeholder. Replace:
- Testimonials with real user feedback
- Team info on about page
- Update stats on homepage as you grow

## 🙋 Need Help?

This is a learning project! Feel free to:
- Explore the code
- Make changes and see what happens
- Ask questions about anything you don't understand

---

Made with ❤️ for GP Trainees





