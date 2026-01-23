# OnCallPrep Database Migrations

This folder contains SQL migration scripts to populate your Supabase database with content from the original OnCallPrep project.

## Prerequisites

Before running these migrations, ensure:

1. **Supabase project is set up** with the correct tables (these should already exist from the schema your friend created)
2. **You have access** to the Supabase SQL Editor
3. **Tables exist**: `sca_cases`, `akt_questions`, `portfolio_guides`, `user_profiles`, `user_progress`

## Migration Files

| File | Description | Records |
|------|-------------|---------|
| `001_sca_priming_cases.sql` | 35 SCA priming cases for 3-minute priming practice | 35 |
| `002_akt_questions.sql` | Full AKT question bank with explanations | 275 |
| `003_portfolio_guides.sql` | Portfolio guidance content for ST1, ST2, ST3 | 12 |

## Running Migrations

### Step 1: Open Supabase SQL Editor

1. Go to your Supabase project dashboard
2. Click on **SQL Editor** in the left sidebar
3. Click **New query**

### Step 2: Run Migrations in Order

Run each migration file in numerical order:

#### Migration 1: SCA Priming Cases
1. Copy the entire contents of `001_sca_priming_cases.sql`
2. Paste into the SQL Editor
3. Click **Run** (or press Cmd/Ctrl + Enter)
4. Verify: You should see a result showing counts by difficulty and is_pro

#### Migration 2: AKT Questions
1. Copy the entire contents of `002_akt_questions.sql`
2. Paste into the SQL Editor
3. Click **Run**
4. Note: This is a large file (275 questions), may take a few seconds
5. Verify: You should see topic/difficulty/is_pro counts

#### Migration 3: Portfolio Guides
1. Copy the entire contents of `003_portfolio_guides.sql`
2. Paste into the SQL Editor
3. Click **Run**
4. Verify: You should see a list of all guides with their stages

### Step 3: Verify Data

After running all migrations, you can verify the data:

```sql
-- Check SCA cases
SELECT case_type, difficulty, is_pro, COUNT(*) 
FROM sca_cases 
GROUP BY case_type, difficulty, is_pro;

-- Check AKT questions
SELECT topic, COUNT(*) 
FROM akt_questions 
GROUP BY topic 
ORDER BY COUNT(*) DESC;

-- Check Portfolio guides
SELECT stage, COUNT(*) 
FROM portfolio_guides 
GROUP BY stage;
```

## Content Summary

### SCA Cases (35 total)
- **Free cases**: 8 (easy/medium difficulty)
- **Pro cases**: 27 (includes all advanced cases)
- **Case types**: All priming cases (3-minute exercises)
- **Content**: Patient info, presenting complaint, priming focus, examiner lens, key approach points

### AKT Questions (275 total)
- **Free questions**: 20 (demo set)
- **Pro questions**: 255 (full question bank)
- **Topics**: Evidence-Based Practice, Clinical Medicine, Exam Technique
- **Content**: Question stem, 5 options, correct answer, detailed explanation, key points

### Portfolio Guides (12 total)
- **ST1**: 5 guides (3 free, 2 pro)
- **ST2**: 3 guides (1 free, 2 pro)
- **ST3**: 4 guides (2 free, 2 pro)
- **Content**: Comprehensive guidance in Markdown format

## Troubleshooting

### "Relation does not exist" error
The tables haven't been created yet. Your friend's project should include the schema. Check:
- Is the Supabase project connected correctly?
- Have the database tables been created?

### "Duplicate key" error
The migration has already been run. The scripts include `DELETE` statements to handle re-runs, but if you've modified data, you may need to manually clear first.

### Large file timeout
For `002_akt_questions.sql`, if it times out:
1. Try splitting the file into smaller chunks
2. Or run during off-peak hours

## Adding More Content

To add more content later:

### SCA Cases
```sql
INSERT INTO sca_cases (case_type, title, scenario, patient_info, key_points, model_answer, time_limit, difficulty, is_pro, published)
VALUES (
  'priming',  -- or 'diagnosis', 'full'
  'Case Title',
  'Scenario description',
  '{"name": "...", "age": 0, "gender": "...", "pmh": "...", "medications": "..."}'::jsonb,
  ARRAY['Point 1', 'Point 2'],
  'Model answer / priming focus text',
  180,  -- time in seconds
  'medium',  -- easy, medium, hard
  false,  -- true for Pro content
  true   -- published
);
```

### AKT Questions
```sql
INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro, published)
VALUES (
  'Question text?',
  '[{"label":"A","text":"Option A"},{"label":"B","text":"Option B"},...]'::jsonb,
  'A',  -- correct answer letter
  'Explanation text',
  'Topic Name',
  'medium',
  ARRAY['Key point 1', 'Key point 2'],
  false,
  true
);
```

### Portfolio Guides
```sql
INSERT INTO portfolio_guides (stage, category, title, content, sort_order, is_pro, published)
VALUES (
  'st1',  -- st1, st2, st3
  'category-name',
  'Guide Title',
  'Markdown content...',
  1,  -- sort order
  false,
  true
);
```

## Scripts

### generate_akt_migration.js
This Node.js script was used to convert the old `akt-questions.json` to SQL format. You can modify and re-run it if you have additional questions to migrate:

```bash
node generate_akt_migration.js > 002_akt_questions.sql
```

---

## Next Steps After Migration

1. **Test the application** - Run `npm run dev` and verify content appears
2. **Set up environment variables** - Ensure Supabase keys are configured
3. **Configure Stripe** - For payment processing (if not already done)
4. **Deploy to Vercel** - Push changes and deploy

Need help? Check the main README.md in the project root.
