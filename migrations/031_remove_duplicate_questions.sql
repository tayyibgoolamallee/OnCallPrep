-- Migration: Remove Duplicate Questions
-- Based on analysis, removing exact or near-duplicate questions
-- Keeping the most recent or most complete version of each duplicate set

-- Duplicate Group 1: Stable angina questions (multiple duplicates)
-- Keeping: 0e887c6f-b534-44d4-a26b-50028f0bd154 (most complete)
-- Removing: 8b936b08-4f3e-45ce-90c1-fe0e3109f6f9, f9018306-eb70-4854-9ce8-f19db8eb52e9, 76b2acc5-46fb-49b3-a041-c8351dc82a0e
DELETE FROM akt_questions
WHERE id IN (
  '8b936b08-4f3e-45ce-90c1-fe0e3109f6f9',
  'f9018306-eb70-4854-9ce8-f19db8eb52e9',
  '76b2acc5-46fb-49b3-a041-c8351dc82a0e'
);

-- Duplicate Group 2: Chest pain with ECG changes (2 duplicates)
-- Keeping: 48e582ca-7bc3-4282-9ce2-d3c53b0fe54d (has ECG details)
-- Removing: 6ae360c8-8412-46b4-b33b-b4f7f20a42be
DELETE FROM akt_questions
WHERE id = '6ae360c8-8412-46b4-b33b-b4f7f20a42be';

-- Duplicate Group 3: T-wave inversion chest pain (3 duplicates)
-- Keeping: ac8e603f-7a83-4f0e-9e76-dde79f229abc
-- Removing: 2d6abee2-908a-4064-b97f-c4bb0149f9e6, 1f683893-e414-46f8-8a11-ce0ffda84222
DELETE FROM akt_questions
WHERE id IN (
  '2d6abee2-908a-4064-b97f-c4bb0149f9e6',
  '1f683893-e414-46f8-8a11-ce0ffda84222'
);

-- Duplicate Group 4: Heart failure medication (4 duplicates)
-- Keeping: b0c77f21-95ba-472e-bc80-fc4b232f979a (mentions NYHA class II)
-- Removing: c36f8a6f-695f-4ace-9f11-2cd0059b8716, 8e07c1c8-7abb-41f9-b83c-f357c28393f3
DELETE FROM akt_questions
WHERE id IN (
  'c36f8a6f-695f-4ace-9f11-2cd0059b8716',
  '8e07c1c8-7abb-41f9-b83c-f357c28393f3'
);

-- Duplicate Group 5: Stable angina aspirin 75mg variant (2 duplicates)
-- Keeping: 08daf59e-8b3c-4741-aafe-55eb69a83726
-- Removing: 9324096f-d41d-424f-b38e-f7373da82dab
DELETE FROM akt_questions
WHERE id = '9324096f-d41d-424f-b38e-f7373da82dab';

-- Duplicate Group 6: Atrial fibrillation/DOAC questions (5 duplicates)
-- Keeping: d55857f6-2255-4f1b-9cf4-507f0caaad68 (initial anticoagulation question)
-- Removing: ea5f9411-f546-44c6-8b7a-a9b9b24a7e0a, 5e2663c2-694a-4048-b380-6b2b027f62a4, 7df3b82d-f8eb-4cab-a699-05f5407bb981, a831f39f-21ce-47c2-a6c1-504d16eb9d57
DELETE FROM akt_questions
WHERE id IN (
  'ea5f9411-f546-44c6-8b7a-a9b9b24a7e0a',
  '5e2663c2-694a-4048-b380-6b2b027f62a4',
  '7df3b82d-f8eb-4cab-a699-05f5407bb981',
  'a831f39f-21ce-47c2-a6c1-504d16eb9d57'
);

-- Duplicate Group 7: Acne questions (2 duplicates)
-- Keeping: 5450bb07-3e44-4dd2-b2bc-2c5c2ce4b930 (face only, more specific)
-- Removing: 4ef80583-13ce-4e04-ae7f-37c53e0feceb
DELETE FROM akt_questions
WHERE id = '4ef80583-13ce-4e04-ae7f-37c53e0feceb';

-- Total duplicates removed: 18 questions
-- This will help reduce the total question count and eliminate confusion
