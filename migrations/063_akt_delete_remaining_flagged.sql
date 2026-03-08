-- Migration 063: Delete remaining 23 flagged questions that don't meet quality standards.
-- These have stems lacking clinical context or are duplicates.
-- Going forward, all new questions will be created to full AKT standards.

DELETE FROM akt_questions WHERE id IN (
  -- Stem lacks clinical context
  '8a354da8-8762-44a5-9837-60e106dbab86',  -- Cardiovascular
  'a5da07cc-796f-40bc-b87e-69ec05fd22b8',  -- Endocrinology
  '8169d737-228d-4a73-b71e-781fdbfbeb26',  -- EBP
  '92e38f57-8cd1-4c9f-9f1a-43639178cb28',  -- EBP
  'b64e80fa-8cc3-4076-818b-cbdc27e68faa',  -- EBP
  'df295a0d-2016-44f8-bfec-67b6b1eed5eb',  -- EBP
  'f8817ba3-03ac-4afa-bad7-1c43487835b9',  -- EBP
  '688973b9-4b83-4546-9e48-2ab5ee5bf174',  -- Paediatrics
  '7009ecbe-35f4-4231-8532-53a7fde76c4d',  -- Paediatrics
  '1d18692a-b352-4d8e-8288-f3b34f82755d',  -- PCOM
  '734e5697-124d-4267-a1de-96a2813a89b0',  -- PCOM
  'e617dcba-7432-46ab-a22e-f58725c74fdd',  -- PCOM
  '32129bfb-65a5-4a4f-a4c7-dcb13c33efc4',  -- Respiratory
  '66217f06-086b-4f99-9946-a24a14390bcd',  -- Sexual Health
  'e6f3e7b4-aec2-4b2a-8986-e046ab700352',  -- Sexual Health
  -- Possible duplicate stems
  '0bcd9621-7f6c-447f-9c3f-87ae9579b473',  -- Infectious Diseases
  'bf45db25-c4b6-4cb5-b0c4-7e487d97902a',  -- Infectious Diseases
  '1370725c-6e1e-4b4b-becc-9a82c42c7d26',  -- Paediatrics
  '793ad5ac-0d12-4f76-966d-918e719f3582',  -- Paediatrics
  '66fb0d09-1c4d-44b0-a960-e020051464a4',  -- Surgery
  '6e3bddee-b400-4586-8e65-004642b44807',  -- Surgery
  '79160c03-1a93-4b88-836a-9e3722e77c84',  -- Surgery
  'd35cb854-fb81-45e3-88e0-b71dd17d41cb'   -- Surgery
);
