# AKT Question Bank: Generation & Audit

This folder contains prompts and tools for **creating** and **auditing** AKT-style Single Best Answer (SBA) questions, aligned with RCGP Applied Knowledge Test standards.

---

## Contents

| File | Purpose |
|------|--------|
| **PROMPT_A_generation.md** | Primary prompt for generating new AKT SBA questions. Use in Cursor (or any LLM) to create questions; then convert output into a SQL migration. |
| **PROMPT_B_audit.md** | QA prompt for reviewing existing questions. Paste one question (or use exported batch) below the prompt and request the mandatory audit output. |
| **compliance-checklist.md** | AKT SBA quality checklist — use as pre-release QA, validation rubric, or reviewer scorecard. |
| **rcgp-akt-domains.md** | Mapping to RCGP / AKT feedback domains (clinical + cross-cutting). Use for tagging, balanced coverage, and defensible content. |

---

## 1. Creating more questions (Generation)

**Recommended workflow (avoids CKS geo-blocking):** Work one **NICE CKS topic** at a time. You paste the full CKS page content (or Summary + key sections) for that topic into the chat. Ask for **3–5 hard SBA questions** for that topic using Prompt A. The model will use your pasted text to align questions and explanations with CKS. Then convert the output into a migration (see below). This is more accurate than relying on automated fetching, which cannot access CKS from non-UK servers.

**Alternative (if not pasting CKS):**
1. Open **PROMPT_A_generation.md** and copy the full prompt into Cursor.
2. Optionally specify: topic (e.g. Cardiovascular, Mental Health), difficulty (easy/medium/hard), or domain from `rcgp-akt-domains.md` to target gaps.
3. Generate one or more questions. The model will output: Question stem, Options A–E, Correct answer, Explanation, References.
4. Turn output into a migration:
   - Create a new file in `migrations/` (e.g. `052_akt_new_questions.sql`).
   - Use the schema below so each question becomes one `INSERT` into `akt_questions`.

### DB schema for `akt_questions`

| Column | Type | Notes |
|--------|------|--------|
| `id` | UUID | Auto-generated; omit in INSERT |
| `question` | TEXT | Full stem |
| `options` | JSONB | Array of `{"label":"A","text":"…"}, …` through E |
| `correct_option` | TEXT | `"A"` \| `"B"` \| `"C"` \| `"D"` \| `"E"` |
| `explanation` | TEXT | Rationale + why distractors are not best |
| `topic` | TEXT | e.g. Cardiovascular, Respiratory, Evidence-Based Practice (see `rcgp-akt-domains.md`) |
| `difficulty` | TEXT | `easy` \| `medium` \| `hard` |
| `guideline_refs` | TEXT[] | Array of short strings (key points + NICE/guideline refs); **include at least one URL** (e.g. NICE CKS or guideline link) per question |
| `is_pro` | BOOLEAN | Default `false` |
| `published` | BOOLEAN | Default `true` |
| `created_at` / `updated_at` | TIMESTAMPTZ | Default NOW() |

### Example INSERT (single question)

```sql
INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro, published)
VALUES (
  'A 58-year-old man with type 2 diabetes and hypertension presents with central chest tightness on exertion. What is the most appropriate first-line investigation?',
  '[{"label":"A","text":"ECG"},{"label":"B","text":"Exercise tolerance test"},{"label":"C","text":"Coronary angiography"},{"label":"D","text":"Echocardiogram"},{"label":"E","text":"CT coronary calcium score"}]'::jsonb,
  'A',
  'ECG is the first-line investigation for suspected stable angina (NICE CG126). ETT, angiography, and other options come after initial assessment. …',
  'Cardiovascular',
  'medium',
  ARRAY['NICE CG126 Stable angina', 'https://www.nice.org.uk/guidance/cg126'],
  false,
  true
);
```

Run new migrations in the Supabase SQL Editor (or your migration runner).

---

## 2. Auditing existing questions

1. **Export all questions**  
   Go to **Admin → AKT** and click **"Export all for audit"**. This downloads a **.md file** with **every** question in PROMPT B format (one block per question, with id, topic, stem, options, correct answer, explanation, references).

2. **Optional: find questions that may need review**  
   Run **`docs/akt/audit_questions.sql`** in the Supabase SQL Editor. It does not change any data; it returns one table (id, topic, difficulty, issues) for every question with at least one issue. Flagged issues include: short or very long explanation/stem, no guideline_refs or no URL in refs, correct_option invalid or not in options, wrong option count, empty/duplicate option text, invalid difficulty, empty topic, duplicate stem. Use the results to fix data quality in one go and to prioritise Prompt B audits.

3. **Audit with Prompt B**  
   Open **PROMPT_B_audit.md** and follow the step-by-step there: copy the prompt into Cursor, paste **1–3 question blocks** from your exported file, ask for the audit. If the output says **Needs Revision** or **Unsafe**, apply the **Revised Version** via **Admin → AKT** (Edit on the row) or by writing an **UPDATE** migration using the question `id` from the export.

---

## 3. Quality and alignment

- **Checklist**: Before adding or re-publishing a question, run through `compliance-checklist.md`.  
- **Domains**: Use `rcgp-akt-domains.md` to tag topics and to plan generation so coverage across clinical and cross-cutting domains stays balanced and exam-aligned.

---

## Quick reference

- **Generation** → PROMPT A → convert to SQL → new migration.  
- **Audit** → Export for audit (Admin AKT) → PROMPT B (+ optional checklist) → apply revisions.  
- **Schema** → `migrations/000_create_tables.sql` and example above.
