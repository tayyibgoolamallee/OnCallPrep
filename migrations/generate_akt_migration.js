/**
 * AKT Questions Migration Generator
 * 
 * This script reads the old akt-questions.json and generates SQL
 * for inserting into the new Supabase akt_questions table.
 * 
 * Usage: node generate_akt_migration.js > 002_akt_questions.sql
 */

const fs = require('fs');
const path = require('path');

// Read the old questions file
const oldQuestionsPath = path.join(__dirname, '../../oncallprep project/public/data/akt-questions.json');
const data = JSON.parse(fs.readFileSync(oldQuestionsPath, 'utf8'));

// Map difficulty
const mapDifficulty = (diff) => {
  if (diff === 'easy') return 'easy';
  if (diff === 'hard') return 'hard';
  return 'medium';
};

// Map correct answer index to letter
const indexToLetter = ['A', 'B', 'C', 'D', 'E'];

// Escape single quotes for SQL
const escapeSql = (str) => {
  if (!str) return '';
  return str.replace(/'/g, "''");
};

// Determine topic from category and subcategory
const getTopic = (q) => {
  if (q.category === 'ebp') {
    return 'Evidence-Based Practice';
  } else if (q.category === 'pcom') {
    return 'Primary Care Organisation & Management';
  } else if (q.subcategory) {
    // Capitalize first letter of subcategory
    return q.subcategory.split('-').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
  }
  return q.category || 'Clinical Medicine';
};

// Determine if question should be Pro
// First 20 questions free, rest are Pro
const isPro = (index) => index >= 20;

// Generate SQL
console.log('-- Migration: Import AKT Questions from old OnCallPrep project');
console.log('-- Run this in Supabase SQL Editor');
console.log(`-- Total: ${data.questions.length} questions`);
console.log('');
console.log('-- First, clear existing questions if re-running');
console.log('DELETE FROM akt_questions;');
console.log('');
console.log('-- Insert all questions');
console.log('INSERT INTO akt_questions (question, options, correct_option, explanation, topic, difficulty, guideline_refs, is_pro, published)');
console.log('VALUES');

const values = data.questions.map((q, index) => {
  const question = escapeSql(q.stem);
  const options = JSON.stringify(q.options.map((opt, i) => ({
    label: indexToLetter[i],
    text: opt
  })));
  const correctOption = indexToLetter[q.correctAnswer];
  const explanation = escapeSql(q.explanation);
  const topic = getTopic(q);
  const difficulty = mapDifficulty(q.difficulty);
  const guidelineRefs = q.keyPoints || [];
  const guidelineRefsStr = guidelineRefs.length > 0 
    ? `ARRAY[${guidelineRefs.map(kp => `'${escapeSql(kp)}'`).join(', ')}]`
    : 'NULL';
  const isProVal = isPro(index);
  
  return `(
  '${question}',
  '${escapeSql(options)}'::jsonb,
  '${correctOption}',
  '${explanation}',
  '${topic}',
  '${difficulty}',
  ${guidelineRefsStr},
  ${isProVal},
  true
)`;
});

console.log(values.join(',\n'));
console.log(';');
console.log('');
console.log('-- Verify the import');
console.log('SELECT topic, difficulty, is_pro, COUNT(*) as count');
console.log('FROM akt_questions');
console.log('GROUP BY topic, difficulty, is_pro');
console.log('ORDER BY topic, difficulty;');
