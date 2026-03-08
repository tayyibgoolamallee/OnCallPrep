-- Migration: Fix invalid difficulty from audit (053)
-- Audit found 109 questions with difficulty = 'high' (invalid). Valid values: easy, medium, hard.
-- This updates all 'high' to 'hard'. Run in Supabase SQL Editor.

UPDATE akt_questions
SET difficulty = 'hard', updated_at = now()
WHERE difficulty = 'high';
