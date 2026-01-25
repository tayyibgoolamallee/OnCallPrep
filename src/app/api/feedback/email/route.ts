// API Route: Send feedback email notification
// This can be called via Supabase webhook or directly

import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { feedback_id, question_id, sentiment, topic, difficulty } = body

    // Get question details
    const supabase = createClient()
    const { data: question } = await supabase
      .from('akt_questions')
      .select('question, topic')
      .eq('id', question_id)
      .single()

    if (!question) {
      return NextResponse.json({ error: 'Question not found' }, { status: 404 })
    }

    // Get feedback details
    const { data: feedback } = await supabase
      .from('akt_question_feedback')
      .select('*')
      .eq('id', feedback_id)
      .single()

    if (!feedback) {
      return NextResponse.json({ error: 'Feedback not found' }, { status: 404 })
    }

    // Generate email subject
    const sentimentEmoji = sentiment === 'helpful' ? '👍' : '👎'
    const subject = `AKT Question Feedback | QID ${question_id.slice(0, 8)} | ${sentimentEmoji} ${sentiment === 'helpful' ? 'High-yield' : 'Needs Review'}`

    // Generate email body
    const emailBody = `
Question ID: ${question_id}
Topic: ${topic}${difficulty ? ` - ${difficulty}` : ''}
User sentiment: ${sentimentEmoji} ${sentiment === 'helpful' ? 'Helpful' : 'Needs improvement'}

Question preview: ${question.question.substring(0, 100)}${question.question.length > 100 ? '...' : ''}

${sentiment === 'helpful' && feedback.positive_feedback ? `
What worked well:
${JSON.stringify(feedback.positive_feedback, null, 2)}
` : ''}

${sentiment === 'needs_improvement' && feedback.negative_feedback ? `
Selected issues:
${JSON.stringify(feedback.negative_feedback, null, 2)}
` : ''}

${feedback.free_text ? `
Free text:
${feedback.free_text}
` : ''}

Timestamp: ${new Date(feedback.created_at).toLocaleString()}

---
View in Supabase: https://supabase.com/dashboard/project/YOUR_PROJECT_ID/editor/akt_question_feedback
    `.trim()

    // TODO: Integrate with your email service (SendGrid, Resend, etc.)
    // For now, just log it
    console.log('Email would be sent:', {
      to: process.env.ADMIN_EMAIL || 'admin@oncallprep.com',
      subject,
      body: emailBody
    })

    // In production, you would:
    // 1. Use SendGrid, Resend, or similar
    // 2. Send email to admin
    // 3. Set up inbox filters based on subject line

    return NextResponse.json({ 
      success: true, 
      message: 'Feedback logged (email would be sent in production)',
      subject 
    })
  } catch (error) {
    console.error('Error processing feedback email:', error)
    return NextResponse.json(
      { error: 'Failed to process feedback' },
      { status: 500 }
    )
  }
}
