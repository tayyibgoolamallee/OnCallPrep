-- Migration 044: Update marking criteria for Health Visitor - Infant Feeding (Case 46)
-- Ensures Domain 1 has at least 5 items for concordance and internal reliability.
-- Run after 039. Safe to run multiple times.

UPDATE sca_cases
SET marking_criteria = '{"domain1": {"title": "Domain 1: Data Gathering & Interpretation", "items": ["Took feeding and weight history from HV", "Assessed maternal mood and support", "Explored baby health and examination findings", "Explored HV concerns and ICE", "Assessed weight centiles and growth trajectory", "Explored bonding and parental support needs"]}, "domain2": {"title": "Domain 2: Clinical Management (Weighted 1.5x)", "items": ["Planned face-to-face assessment", "Considered feeding support and formula", "Considered maternal mental health assessment", "Coordinated with health visitor", "Arranged follow-up"]}, "domain3": {"title": "Domain 3: Interpersonal Skills", "items": ["Respected HV role", "Clear communication", "Collaborative approach", "Listened to HV concerns", "Maintained professional manner"]}}'::jsonb
WHERE title = 'Health Visitor - Infant Feeding'
  AND category_code = 'PAED-006';
