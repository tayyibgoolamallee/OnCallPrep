import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'

const DEFAULT_LIMIT = 10
const MAX_LIMIT = 25

function questionToAuditBlock(
  q: { id: string; topic: string; difficulty: string | null; question: string; options: { id?: string; label?: string; text: string }[]; correct_option: string; explanation: string; guideline_refs: string[] | null },
  index: number,
  globalStart: number
): string {
  const opts = (q.options || []).map((o, i) => {
    const letter = (o.label || o.id || String.fromCharCode(65 + i)).toString().toUpperCase()
    return `${letter}. ${o.text}`
  })
  const refs = (q.guideline_refs && q.guideline_refs.length) ? q.guideline_refs.join('\n• ') : 'None'
  return `---\n## Question ${globalStart + index + 1} (id: ${q.id}) | ${q.topic} | ${q.difficulty ?? 'medium'}\n\n**Question:**\n${q.question}\n\n**Options:**\n${opts.join('\n')}\n\n**Correct answer:** ${q.correct_option.toUpperCase()}\n\n**Explanation:**\n${q.explanation}\n\n**References:**\n• ${refs}\n`
}

export async function GET(request: NextRequest) {
  try {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }
    const { data: profile } = await supabase
      .from('user_profiles')
      .select('is_admin')
      .eq('id', user.id)
      .single()
    if (!profile?.is_admin) {
      return NextResponse.json({ error: 'Forbidden' }, { status: 403 })
    }

    const { searchParams } = new URL(request.url)
    const limit = Math.min(MAX_LIMIT, Math.max(1, parseInt(searchParams.get('limit') || String(DEFAULT_LIMIT), 10) || DEFAULT_LIMIT))
    const offset = Math.max(0, parseInt(searchParams.get('offset') || '0', 10) || 0)

    const { data: rows } = await supabase
      .from('akt_questions')
      .select('id, topic, question, options, correct_option, explanation, guideline_refs, difficulty')
      .order('created_at', { ascending: false })
      .range(offset, offset + limit - 1)

    if (!rows?.length) {
      return new NextResponse(
        `# No more questions in this batch\nOffset ${offset}; no questions returned. Try a lower offset.`,
        { headers: { 'Content-Type': 'text/markdown; charset=utf-8' } }
      )
    }

    type Q = { id: string; topic: string; difficulty: string | null; question: string; options: { id?: string; label?: string; text: string }[]; correct_option: string; explanation: string; guideline_refs: string[] | null }
    const questions = rows as Q[]
    const body = questions.map((q, i) => questionToAuditBlock(q, i, offset)).join('\n')
    const header = `# AKT audit batch (questions ${offset + 1}–${offset + questions.length})\nPaste below Prompt B in Cursor. Ask: "Audit these and output a single SQL migration (UPDATE by id) for any that need revision."\n\n`
    return new NextResponse(header + body, {
      headers: { 'Content-Type': 'text/markdown; charset=utf-8' },
    })
  } catch (e) {
    console.error('akt-audit-batch', e)
    return NextResponse.json({ error: 'Internal error' }, { status: 500 })
  }
}
