# Question Quality Guidelines

## Answer Distribution
**CRITICAL**: Ensure balanced distribution across A, B, C, D, E (~20% each)

### Current Status
- After migration 033: Distribution should be approximately balanced
- Target: 18-22% for each option (A, B, C, D, E)

### When Creating New Questions
1. **Track answer distribution** as you create questions
2. **Rotate correct answers** - if last 5 questions were A, B, C, D, E, start with A again
3. **Aim for variety** - don't cluster answers in one option
4. **Use this pattern**: A, B, C, D, E, A, B, C, D, E... (or randomize but track)

### Example Pattern
```
Question 1: correct_option = 'A'
Question 2: correct_option = 'B'
Question 3: correct_option = 'C'
Question 4: correct_option = 'D'
Question 5: correct_option = 'E'
Question 6: correct_option = 'A'  (cycle repeats)
```

## Question Complexity

### Minimum Requirements
- **Explanation length**: ≥200 characters
- **Applied decision-making**: "Next best step", "What is safest", "What should not be done"
- **Sophisticated distractors**: 
  - Correct medication but wrong dosing
  - First vs second vs third line treatments
  - Risk stratification (urgent vs routine vs A&G)
  - Half-true answers

### RCGP Feedback Alignment
- Data interpretation (risk ratios, confidence intervals, screening stats)
- Prescribing safety (monitoring, interactions, contraindications)
- Professional practice (confidentiality, capacity, complaints)
- Applied scenarios (not just recall)

## Avoiding Duplicates

### Before Adding Questions
1. Check for similar question text (use analysis_queries.sql Query 2)
2. Ensure unique clinical scenarios
3. If similar, make it clearly different (different patient age, different context, different question focus)

## Quality Checklist

Before finalizing a question:
- [ ] Explanation ≥200 characters
- [ ] Balanced answer distribution (check running total)
- [ ] Not a duplicate of existing question
- [ ] Tests applied decision-making (not just recall)
- [ ] Has sophisticated distractors
- [ ] Aligned with RCGP feedback themes
- [ ] Based on NICE CKS or evidence-based guidelines
- [ ] Options are all plausible (not obviously wrong)

## Running Analysis

Use `analysis_queries.sql` to check:
1. Answer distribution (Query 1)
2. Duplicates (Query 2)
3. Answer bias (Query 3)
4. Under-explained questions (Query 4)

Run these periodically to maintain quality.
