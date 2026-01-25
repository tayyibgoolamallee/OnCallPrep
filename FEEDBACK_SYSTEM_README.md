# Question Feedback System

## Overview
A comprehensive feedback system for AKT questions that captures structured and free-text feedback from users, following best practices for low-friction, high-quality feedback collection.

## Features

### ✅ Implemented
1. **One-click sentiment** (👍 Helpful / 👎 Needs improvement)
2. **Structured checkboxes** for positive and negative feedback
3. **Optional free text** for detailed comments
4. **Auto-captured metadata** (question ID, topic, difficulty, timestamp)
5. **Database storage** with RLS policies
6. **UI component** integrated into practice flow

### 🔄 To Configure
1. **Email notifications** - Set up webhook/API integration
2. **Admin dashboard** - View and manage feedback
3. **Analytics** - Track feedback trends

## Database Schema

### Table: `akt_question_feedback`
- `id` - UUID primary key
- `question_id` - References akt_questions
- `user_id` - References auth.users
- `sentiment` - 'helpful' or 'needs_improvement'
- `positive_feedback` - JSONB (for helpful feedback)
- `negative_feedback` - JSONB (for needs improvement)
- `free_text` - Optional detailed comments
- `topic`, `difficulty` - Auto-captured metadata
- `reviewed`, `action_taken` - Admin tracking fields

## UI Flow

1. **After explanation is shown**: Feedback component appears
2. **Step 1**: User clicks 👍 or 👎 (mandatory)
3. **Step 2**: Structured checkboxes appear (optional)
4. **Step 3**: Optional free text (optional)
5. **Submit**: Feedback saved, confirmation shown

## Email Notifications

### Subject Line Format
```
AKT Question Feedback | QID [short-id] | [emoji] [sentiment]
```

Examples:
- `AKT Question Feedback | QID 1842 | 👎 Needs Review`
- `AKT Question Feedback | QID 0973 | 👍 High-yield`

### Email Body Includes
- Question ID and preview
- Topic and difficulty
- User sentiment
- Selected feedback categories
- Free text (if provided)
- Timestamp

### Inbox Organization
Set up filters:
- **👎 emails** → "AKT – Needs Review" folder
- **👍 emails** → "AKT – Validated / High Quality" folder
- **"Disagree with answer"** → High priority flag

## Setup Instructions

### 1. Run Database Migration
```sql
-- Run migration 034
\i migrations/034_create_question_feedback_table.sql
```

### 2. Configure Email Notifications

**Option A: Supabase Database Webhooks** (Recommended)
1. Go to Supabase Dashboard → Database → Webhooks
2. Create new webhook:
   - Table: `akt_question_feedback`
   - Events: INSERT
   - URL: `https://your-domain.com/api/feedback/email`
   - HTTP Method: POST

**Option B: Edge Function** (Alternative)
1. Create Supabase Edge Function
2. Trigger on `akt_question_feedback` INSERT
3. Send email via Resend/SendGrid

**Option C: Manual API Route** (Current)
- API route exists at `/api/feedback/email`
- Configure email service (SendGrid, Resend, etc.)
- Update `route.ts` with your email service

### 3. Test the System
1. Practice a question
2. Submit feedback (both 👍 and 👎)
3. Check database: `SELECT * FROM akt_question_feedback`
4. Verify email notifications (if configured)

## Feedback Categories

### Positive Feedback (👍)
- Clear clinical reasoning
- High-yield for AKT
- Explanation was clear
- Felt realistic / exam-like
- Good learning point

### Negative Feedback (👎)
- Spelling / grammar error
- I disagree with the answer
- Explanation unclear or incomplete
- Question stem ambiguous
- Options too similar / misleading
- Not aligned with NICE / UK practice
- Too easy / too hard
- Out of AKT scope

## Admin Dashboard (Future)

### Queries for Analysis

**Feedback Summary by Question**
```sql
SELECT 
  q.id,
  q.question,
  q.topic,
  COUNT(f.id) as total_feedback,
  COUNT(CASE WHEN f.sentiment = 'helpful' THEN 1 END) as helpful_count,
  COUNT(CASE WHEN f.sentiment = 'needs_improvement' THEN 1 END) as needs_improvement_count,
  ROUND(100.0 * COUNT(CASE WHEN f.sentiment = 'helpful' THEN 1 END) / COUNT(f.id), 2) as helpful_percentage
FROM akt_questions q
LEFT JOIN akt_question_feedback f ON q.id = f.question_id
WHERE q.published = true
GROUP BY q.id, q.question, q.topic
HAVING COUNT(f.id) > 0
ORDER BY needs_improvement_count DESC;
```

**Most Common Issues**
```sql
SELECT 
  topic,
  COUNT(*) as count,
  jsonb_array_elements_text(negative_feedback->'selected') as issue
FROM akt_question_feedback
WHERE sentiment = 'needs_improvement'
  AND negative_feedback->'selected' IS NOT NULL
GROUP BY topic, issue
ORDER BY count DESC;
```

**Unreviewed Feedback**
```sql
SELECT 
  f.*,
  q.question,
  q.topic
FROM akt_question_feedback f
JOIN akt_questions q ON f.question_id = q.id
WHERE f.reviewed = false
ORDER BY f.created_at DESC;
```

## Best Practices

1. **Close the loop**: Update questions based on feedback and notify users
2. **Normalize disagreement**: Explicitly welcome different perspectives
3. **Batch reviews**: Review feedback weekly/fortnightly, not in real-time
4. **Prioritize**: Focus on "disagree with answer" and "safety issues" first
5. **Track trends**: Use analytics to identify patterns (e.g., "Derm questions get more 👎")

## Future Enhancements

- [ ] Admin dashboard UI
- [ ] Question versioning (track edits)
- [ ] Upvote explanations separately
- [ ] "Report critical safety issue" fast-track
- [ ] Feedback analytics dashboard
- [ ] Auto-update questions based on consensus feedback
- [ ] User notification when their feedback leads to updates
