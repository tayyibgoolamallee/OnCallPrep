-- Migration: Fix Severe Answer Distribution Bias
-- Current distribution: A=9.65%, B=50.54%, C=32.06%, D=6.20%, E=1.55%
-- Target: Approximately 20% for each option (A, B, C, D, E)
-- 
-- IMPORTANT: This migration requires careful review. Randomly changing answers could make questions incorrect.
-- Better approach: Update the OPTIONS themselves to redistribute, or manually review each question.
--
-- This migration provides a framework but should be used cautiously.
-- Consider: Instead of changing answers, update new questions to have balanced distribution going forward.

-- Strategy 1: For questions where option A is also correct/plausible, change B to A
-- This requires manual review - only change if A is clinically equivalent or correct

-- Strategy 2: Better approach - Update options to redistribute
-- For questions with B as correct answer, consider reordering options so correct answer becomes A, D, or E
-- This maintains clinical accuracy while balancing distribution

-- Strategy 3: For new questions (migrations 022-029), ensure balanced distribution
-- The 70 new improved questions already have better balance

-- CAUTION: Do not run random updates without reviewing each question
-- The following is a TEMPLATE that should be customized based on manual review:

-- Example of safe redistribution (only run after manual verification):
-- UPDATE akt_questions
-- SET correct_option = 'A'
-- WHERE id = 'specific-question-id-here'
--   AND correct_option = 'B'
--   AND published = true;
--   -- Only if option A is also clinically correct for this question

-- Recommended approach:
-- 1. Run migration 031 (remove duplicates) - this will help
-- 2. Run migration 032 (improve explanations) - this improves quality
-- 3. For answer distribution: Manually review questions with B answers and either:
--    a) Reorder options to make correct answer A, D, or E
--    b) Update options so a different option becomes correct
--    c) Accept current distribution but ensure new questions are balanced

-- The 70 new questions in migrations 022-029 already have better balance
-- Focus on improving new questions going forward rather than randomly changing existing ones
