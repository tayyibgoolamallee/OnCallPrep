import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'

function questionToAuditBlock(
  q: {
    id: string
    topic: string
    difficulty: string | null
    question: string
    options: { id?: string; label?: string; text: string }[]
    correct_option: string
    explanation: string
    guideline_refs: string[] | null
  },
  index: number
): string {
  const opts = (q.options || []).map((o, i) => {
    const letter = (o.label || o.id || String.fromCharCode(65 + i)).toString().toUpperCase()
    return `${letter}. ${o.text}`
  })
  const refs =
    q.guideline_refs && q.guideline_refs.length
      ? q.guideline_refs.join('\n• ')
      : 'None'

  return [
    '---',
    `## Question ${index + 1} (id: ${q.id}) | ${q.topic} | ${q.difficulty ?? 'medium'}`,
    '',
    `**Question:**`,
    q.question,
    '',
    `**Options:**`,
    ...opts,
    '',
    `**Correct answer:** ${q.correct_option.toUpperCase()}`,
    '',
    `**Explanation:**`,
    q.explanation,
    '',
    `**References:**`,
    `• ${refs}`,
    '',
  ].join('\n')
}

export async function GET(request: NextRequest) {
  try {
    const supabase = await createClient()
    const {
      data: { user },
    } = await supabase.auth.getUser()
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
    const topicFilter = searchParams.get('topic')

    let query = supabase
      .from('akt_questions')
      .select(
        'id, topic, question, options, correct_option, explanation, guideline_refs, difficulty'
      )
      .eq('published', true)
      .order('topic')
      .order('created_at', { ascending: true })

    if (topicFilter) {
      query = query.eq('topic', topicFilter)
    }

    const { data: rows, error } = await query

    if (error) {
      console.error('akt-full-export query error', error)
      return NextResponse.json({ error: 'Query failed' }, { status: 500 })
    }

    if (!rows?.length) {
      return new NextResponse('No questions found.', { status: 404 })
    }

    type Q = {
      id: string
      topic: string
      difficulty: string | null
      question: string
      options: { id?: string; label?: string; text: string }[]
      correct_option: string
      explanation: string
      guideline_refs: string[] | null
    }
    const questions = rows as Q[]

    const header = [
      `# AKT Full Export for Audit`,
      `Exported: ${new Date().toISOString().slice(0, 19)}Z`,
      `Total questions: ${questions.length}`,
      topicFilter ? `Filtered by topic: ${topicFilter}` : 'All topics',
      '',
      'Use with **docs/akt/PROMPT_B_audit.md** — paste 5–10 blocks at a time into Cursor.',
      '',
    ].join('\n')

    const body = questions.map((q, i) => questionToAuditBlock(q, i)).join('\n')

    const format = searchParams.get('format') || 'md'
    const dateStr = new Date().toISOString().slice(0, 10)
    const topicSlug = topicFilter
      ? topicFilter.toLowerCase().replace(/\s+/g, '-') + '-'
      : ''

    if (format === 'csv') {
      const escapeCsv = (s: string) =>
        '"' + (s || '').replace(/"/g, '""').replace(/\n/g, ' ') + '"'
      const csvHeader =
        'id,topic,difficulty,question,option_a,option_b,option_c,option_d,option_e,correct_option,explanation,guideline_refs'
      const csvRows = questions.map((q) => {
        const opts = q.options || []
        const optTexts = Array.from({ length: 5 }, (_, i) =>
          escapeCsv(opts[i]?.text ?? '')
        )
        return [
          q.id,
          escapeCsv(q.topic),
          q.difficulty ?? 'medium',
          escapeCsv(q.question),
          ...optTexts,
          q.correct_option,
          escapeCsv(q.explanation),
          escapeCsv((q.guideline_refs || []).join(' | ')),
        ].join(',')
      })
      const csvContent = [csvHeader, ...csvRows].join('\n')
      return new NextResponse(csvContent, {
        headers: {
          'Content-Type': 'text/csv; charset=utf-8',
          'Content-Disposition': `attachment; filename="akt-full-export-${topicSlug}${dateStr}.csv"`,
        },
      })
    }

    const filename = `akt-full-export-${topicSlug}${dateStr}.md`

    return new NextResponse(header + body, {
      headers: {
        'Content-Type': 'text/markdown; charset=utf-8',
        'Content-Disposition': `attachment; filename="${filename}"`,
      },
    })
  } catch (e) {
    console.error('akt-full-export', e)
    return NextResponse.json({ error: 'Internal error' }, { status: 500 })
  }
}
