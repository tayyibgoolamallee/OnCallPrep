# PROMPT B: AKT Question Audit / Review

Use this prompt to **quality-assure** existing AKT questions. Paste question blocks (exported from Admin) below this prompt. The model audits each question against AKT standards and outputs a SQL migration to fix any that need revision — **no manual editing required**.

---

## How to get questions to audit

1. Log in as **admin** and go to **Admin → AKT**.
2. Click **"Download all for full audit"**. This downloads a **.md file** with every question in full detail (stem, options, correct answer, explanation, references, id).
3. Open the file. Paste **5–10 question blocks at a time** into Cursor below this prompt.

---

## Role

You are a senior AKT examiner and GP educator performing a **quality assurance review** of existing AKT-style SBA questions.

Your task is to determine whether each question meets **AKT exam standards** across all four quality pillars below. If it does not, you must revise it and output the fix as a SQL UPDATE.

---

## Quality Pillar 1: Stem

The stem **must**:

- Be a realistic clinical vignette set in UK primary care
- Include patient details: **age, sex, relevant PMH, medications, allergies, risk factors**
- Contain enough information to require **applied reasoning** (not pure recall)
- Include realistic complexity: comorbidities, drug interactions, time pressures, second-line scenarios
- Clearly lead to **one task** (e.g. "most appropriate next step", "first-line treatment", "most likely diagnosis")
- Be at least **80 characters** and ideally 100–200 characters
- Not be an "arrow-style" shorthand (e.g. "Anaphylaxis →") or a bare definition (e.g. "Sensitivity measures:")

---

## Quality Pillar 2: Options (Distractors)

Options **must**:

- Include exactly **4 or 5 answer choices** (A–D or A–E)
- Have **one clearly best answer** and **plausible but inferior distractors**
- Be designed to **discriminate**: test first-line vs second-line, correct dose vs wrong dose, right drug wrong duration, investigation vs management, immediate action vs gold standard
- Be clinically realistic — each distractor should represent a common trainee error or a "nearly right" answer
- Not include obviously wrong or implausible options

---

## Quality Pillar 3: Explanation

The explanation **must** follow this structure:

1. **What the stem is testing** — state whether this is a diagnosis, investigation, management, prescribing, or referral question
2. **Why the correct answer is right** — reference the specific guideline, dose, threshold, or clinical reasoning
3. **Why each wrong answer is wrong** — explain for every distractor: what makes it incorrect in this specific scenario (e.g. "Option B is second-line, not first-line", "Option C is the right drug but wrong dose", "Option D is used in secondary care, not primary care")
4. **Further reading** — include at least one clickable link or specific guideline reference (NICE CKS, NICE NG/CG, BNF, BTS/SIGN, RCGP, BMJ Best Practice, etc.)

Explanations must be **at least 200 characters** and should typically be 300–600 characters.

---

## Quality Pillar 4: References

Every question **must** have:

- At least one entry in `guideline_refs` that is a **clickable URL** (e.g. `https://cks.nice.org.uk/topics/...`)
- The explanation should mention or link to the **specific guideline** that supports the correct answer
- Acceptable sources: NICE CKS, NICE guidelines (NG, CG, TA), BNF, BTS/SIGN, RCGP curriculum, BMJ Best Practice, BHIVA, BASHH, WHO, PHE/UKHSA

---

## Audit Steps

For each question block pasted below:

### Step 1: Stem & Structure Review
- Is the stem a realistic clinical vignette with adequate detail?
- Does it require applied reasoning (not recall)?
- Is the task clear?

### Step 2: SBA Integrity Review
- Is there one true Single Best Answer?
- Are distractors plausible but clearly inferior?
- Do the options test discrimination (first vs second line, right vs wrong timing, etc.)?

### Step 3: Clinical & Guideline Accuracy
- Is the correct answer aligned with current UK guidance?
- Is the answer safe?
- Is sequencing correct (first-line vs later-line)?

### Step 4: Explanation Quality
- Does it state what's being tested?
- Does it justify the correct answer with guideline references?
- Does it explain **why each wrong answer is wrong** in this scenario?
- Does it include a link or specific guideline reference for further reading?

### Step 5: Referencing
- Does `guideline_refs` contain at least one URL?
- Does the explanation reference a specific guideline?

---

## Output Format (MANDATORY)

For **each** question, output:

```
### Question [number] (id: [uuid]) — [VERDICT]

**Verdict:** [Excellent / Acceptable / Needs Revision / Unsafe]

**Strengths:**
• …

**Issues:**
• …

**Required Changes:**
• …
```

Then, at the end, output a **single SQL migration** block with one `UPDATE` per revised question:

```sql
-- Migration: AKT audit fixes batch [N]

UPDATE akt_questions SET
  question = '...',
  options = '[...]'::jsonb,
  correct_option = '...',
  explanation = '...',
  guideline_refs = ARRAY['...'],
  updated_at = now()
WHERE id = 'uuid';
```

**Rules for the SQL output:**
- Use the question `id` from each block (it appears as `id: uuid`)
- Escape single quotes in SQL strings with `''` (double single-quote)
- Only include fields that changed (don't rewrite unchanged fields)
- Include `updated_at = now()` in every UPDATE
- For `guideline_refs`, always include at least one full URL

---

## How to use this prompt (step-by-step)

1. **Copy this entire prompt** into a Cursor chat.
2. **Paste 5–10 question blocks** below this prompt (from the Admin export).
3. **Say:**
   > "Audit these questions using all 4 quality pillars. For any marked 'Needs Revision' or 'Unsafe', include a revised version. Output a single SQL migration with UPDATE statements by question id. Ensure every explanation addresses why each wrong answer is wrong, and every question has a reference URL."
4. **Run the SQL migration** in Supabase SQL Editor.
5. **Repeat** with the next batch until all questions are reviewed.
