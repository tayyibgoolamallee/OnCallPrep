# AKT Audit Fix Summary (from CSV export)

From your audit export (**825 questions** with at least one issue):

## Fixed in migration 053

- **Invalid difficulty**: 109 questions had `difficulty = 'high'`. Valid values are `easy`, `medium`, `hard`.  
  → **Migration 053** sets all `high` to `hard`. Run it in Supabase.

## Still need manual fixes (Admin or future migrations)

These can’t be fixed automatically without per-question content:

| Issue | Count (approx) | What to do |
|-------|-----------------|------------|
| **No link in guideline_refs** | 825 (all rows) | In Admin → AKT, edit each question and add at least one URL to guideline refs (e.g. NICE CKS or NICE guideline link for that topic). Or add links in batches when you edit for other reasons. |
| **Short explanation (<200 chars)** | Many | Expand the explanation (rationale + why each distractor is not best). Use Prompt B if helpful. |
| **Short stem (<50 chars)** | Some | Lengthen or clarify the question stem. |
| **Possible duplicate stem** | Some | Review duplicate pairs in Admin; merge or remove one, or differentiate the question. |

## Optional: add a default link by topic

If you want to add *a* link quickly without picking the perfect URL per question, you could run an UPDATE that appends a generic NICE CKS search link per topic (e.g. `https://cks.nice.org.uk/topics/` + topic slug). That would clear the “No link” audit flag but isn’t as good as a direct CKS/guideline link. If you want that, we can add a follow-up migration with a topic → URL mapping for your main topics.
