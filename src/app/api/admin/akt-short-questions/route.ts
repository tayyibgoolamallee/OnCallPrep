import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'

function escapeCsv(value: string): string {
  if (value.includes(',') || value.includes('"') || value.includes('\n')) {
    return '"' + value.replace(/"/g, '""') + '"'
  }
  return value
}

export async function GET() {
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

    const { data: rows } = await supabase
      .from('akt_questions')
      .select('id, topic, difficulty, question, options, correct_option, explanation')
      .eq('published', true)
      .order('topic')

    if (!rows?.length) {
      return new NextResponse('No questions found', { status: 404 })
    }

    type Row = typeof rows[number]
    const short = rows.filter((r: Row) => {
      const q = r.question ?? ''
      const e = r.explanation ?? ''
      return q.length < 50 || e.length < 200
    })

    if (!short.length) {
      return new NextResponse('No short-stem or short-explanation questions found.', {
        headers: { 'Content-Type': 'text/plain' },
      })
    }

    const header = 'id,topic,difficulty,stem_length,explanation_length,question,explanation\n'
    const csvRows = short.map((r: Row) => {
      const q = r.question ?? ''
      const e = r.explanation ?? ''
      return [
        r.id,
        escapeCsv(r.topic ?? ''),
        r.difficulty ?? 'medium',
        String(q.length),
        String(e.length),
        escapeCsv(q),
        escapeCsv(e),
      ].join(',')
    })

    return new NextResponse(header + csvRows.join('\n'), {
      headers: {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': `attachment; filename="akt-short-questions-${new Date().toISOString().slice(0, 10)}.csv"`,
      },
    })
  } catch (e) {
    console.error('akt-short-questions', e)
    return NextResponse.json({ error: 'Internal error' }, { status: 500 })
  }
}
