-- Migration 040: Fix duplicate SCA case category codes
-- Run this if you already ran 037 and have duplicate category_code values.
-- Updates the later (telephone/third-party) cases to use unique codes.

UPDATE sca_cases SET category_code = 'GI-004' WHERE title = 'Acute Abdominal Pain' AND category_code = 'GI-003';
UPDATE sca_cases SET category_code = 'MH-003' WHERE title = 'Urgent Mental Health Concern' AND category_code = 'MH-002';
UPDATE sca_cases SET category_code = 'PAED-005' WHERE title = 'Sick Child - Parent Call' AND category_code = 'PAED-002';
UPDATE sca_cases SET category_code = 'PAED-006' WHERE title = 'Health Visitor - Infant Feeding' AND category_code = 'PAED-003';
UPDATE sca_cases SET category_code = 'RESP-005' WHERE title = 'Breathlessness' AND category_code = 'RESP-002';
UPDATE sca_cases SET category_code = 'PAED-007' WHERE title = 'School Nurse - Asthma Concern' AND category_code = 'PAED-004';
UPDATE sca_cases SET category_code = 'URO-003' WHERE title = 'Urinary Symptoms' AND category_code = 'URO-001';
UPDATE sca_cases SET category_code = 'DERM-003' WHERE title = 'Skin Rash - Child' AND category_code = 'DERM-002';
