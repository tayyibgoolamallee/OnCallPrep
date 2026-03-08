'use client'

import { useState, useEffect } from 'react'
import { createClient } from '@/lib/supabase/client'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { Badge } from '@/components/ui/badge'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog'

interface Question {
  id: string
  topic: string
  question: string
  options: { id?: string; label?: string; text: string }[]
  correct_option: string
  explanation: string
  guideline_refs: string[] | null
  difficulty: string | null
  is_pro: boolean | null
  published: boolean | null
}

/** Build markdown for one question in PROMPT B audit format (docs/akt/PROMPT_B_audit.md) */
function questionToAuditBlock(q: Question, index: number): string {
  const opts = (q.options || []).map((o, i) => {
    const letter = (o.label || o.id || String.fromCharCode(65 + i)).toString().toUpperCase()
    return `${letter}. ${o.text}`
  })
  const refs = (q.guideline_refs && q.guideline_refs.length) ? q.guideline_refs.join('\n• ') : 'None'
  return `---\n## Question ${index + 1} (id: ${q.id}) | ${q.topic} | ${q.difficulty ?? 'medium'}\n\n**Question:**\n${q.question}\n\n**Options:**\n${opts.join('\n')}\n\n**Correct answer:** ${q.correct_option.toUpperCase()}\n\n**Explanation:**\n${q.explanation}\n\n**References:**\n• ${refs}\n`
}

export default function AdminAKTPage() {
  const [questions, setQuestions] = useState<Question[]>([])
  const [loading, setLoading] = useState(true)
  const [dialogOpen, setDialogOpen] = useState(false)
  const [auditOffset, setAuditOffset] = useState(0)
  const [auditCopyStatus, setAuditCopyStatus] = useState<string | null>(null)
  const [auditFallbackText, setAuditFallbackText] = useState<string | null>(null)
  const [auditFallbackOpen, setAuditFallbackOpen] = useState(false)
  const AUDIT_BATCH_SIZE = 10
  const [editing, setEditing] = useState<Question | null>(null)
  const [form, setForm] = useState({
    topic: '',
    question: '',
    option_a: '',
    option_b: '',
    option_c: '',
    option_d: '',
    correct_option: 'a',
    explanation: '',
    guideline_refs: '',
    difficulty: 'medium',
    is_pro: false,
    published: true,
  })

  useEffect(() => {
    loadQuestions()
  }, [])

  async function loadQuestions() {
    const supabase = createClient()
    const { data } = await supabase
      .from('akt_questions')
      .select('*')
      .order('created_at', { ascending: false })

    if (data) {
      const mapped = data.map(q => ({
        ...q,
        options: q.options as { id: string; text: string }[]
      }))
      setQuestions(mapped)
    }
    setLoading(false)
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    const supabase = createClient()

    const questionData = {
      topic: form.topic,
      question: form.question,
      options: [
        { id: 'a', text: form.option_a },
        { id: 'b', text: form.option_b },
        { id: 'c', text: form.option_c },
        { id: 'd', text: form.option_d },
      ],
      correct_option: form.correct_option,
      explanation: form.explanation,
      guideline_refs: form.guideline_refs.split('\n').filter(r => r.trim()),
      difficulty: form.difficulty,
      is_pro: form.is_pro,
      published: form.published,
    }

    if (editing) {
      await supabase.from('akt_questions').update(questionData).eq('id', editing.id)
    } else {
      await supabase.from('akt_questions').insert(questionData)
    }

    setDialogOpen(false)
    setEditing(null)
    resetForm()
    loadQuestions()
  }

  function resetForm() {
    setForm({
      topic: '',
      question: '',
      option_a: '',
      option_b: '',
      option_c: '',
      option_d: '',
      correct_option: 'a',
      explanation: '',
      guideline_refs: '',
      difficulty: 'medium',
      is_pro: false,
      published: true,
    })
  }

  async function handleDelete(id: string) {
    if (!confirm('Delete this question?')) return
    const supabase = createClient()
    await supabase.from('akt_questions').delete().eq('id', id)
    loadQuestions()
  }

  function openEdit(q: Question) {
    setEditing(q)
    const opt = (key: string) => q.options?.find(o => (o.id || o.label || '').toString().toLowerCase() === key)?.text || ''
    setForm({
      topic: q.topic,
      question: q.question,
      option_a: opt('a'),
      option_b: opt('b'),
      option_c: opt('c'),
      option_d: opt('d'),
      correct_option: q.correct_option.toLowerCase().slice(0, 1),
      explanation: q.explanation,
      guideline_refs: q.guideline_refs?.join('\n') || '',
      difficulty: q.difficulty ?? 'medium',
      is_pro: q.is_pro ?? false,
      published: q.published ?? true,
    })
    setDialogOpen(true)
  }

  function exportForAudit() {
    const header = `# AKT questions export for audit\nUsed with docs/akt/PROMPT_B_audit.md — paste one or more question blocks below the prompt.\nExported: ${new Date().toISOString().slice(0, 19)}Z\n`
    const body = questions.map((q, i) => questionToAuditBlock(q, i)).join('\n')
    const blob = new Blob([header + body], { type: 'text/markdown' })
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = `akt-questions-for-audit-${new Date().toISOString().slice(0, 10)}.md`
    a.click()
    URL.revokeObjectURL(url)
  }

  async function fetchAuditBatch(): Promise<string> {
    const res = await fetch(`/api/admin/akt-audit-batch?limit=${AUDIT_BATCH_SIZE}&offset=${auditOffset}`)
    if (!res.ok) throw new Error(res.status === 403 ? 'Not authorised' : 'Fetch failed')
    return res.text()
  }

  async function copyNextBatchForAudit() {
    setAuditCopyStatus('Loading…')
    try {
      const text = await fetchAuditBatch()
      try {
        await navigator.clipboard.writeText(text)
        const start = auditOffset + 1
        setAuditCopyStatus(`Copied batch starting at question ${start}. Paste in Cursor with Prompt B.`)
        setAuditOffset(prev => prev + AUDIT_BATCH_SIZE)
      } catch {
        setAuditFallbackText(text)
        setAuditFallbackOpen(true)
        setAuditCopyStatus('Clipboard denied — use the box below to copy or download.')
      }
    } catch (e) {
      setAuditCopyStatus(e instanceof Error ? e.message : 'Fetch failed')
    }
    setTimeout(() => setAuditCopyStatus(null), 6000)
  }

  async function downloadFullExport(format: 'md' | 'csv' = 'md') {
    setAuditCopyStatus(`Exporting all questions as ${format.toUpperCase()}…`)
    try {
      const res = await fetch(`/api/admin/akt-full-export?format=${format}`)
      if (!res.ok) throw new Error('Fetch failed')
      const blob = await res.blob()
      const url = URL.createObjectURL(blob)
      const a = document.createElement('a')
      a.href = url
      a.download = `akt-full-export-${new Date().toISOString().slice(0, 10)}.${format}`
      a.click()
      URL.revokeObjectURL(url)
      setAuditCopyStatus(
        format === 'csv'
          ? `Exported all questions as CSV.`
          : `Exported all questions as Markdown. Paste 5-10 blocks at a time into Cursor with Prompt B.`
      )
    } catch (e) {
      setAuditCopyStatus(e instanceof Error ? e.message : 'Export failed')
    }
    setTimeout(() => setAuditCopyStatus(null), 8000)
  }

  async function downloadShortQuestionsCsv() {
    setAuditCopyStatus('Downloading short questions CSV…')
    try {
      const res = await fetch('/api/admin/akt-short-questions')
      if (!res.ok) throw new Error('Fetch failed')
      const blob = await res.blob()
      const url = URL.createObjectURL(blob)
      const a = document.createElement('a')
      a.href = url
      a.download = `akt-short-questions-${new Date().toISOString().slice(0, 10)}.csv`
      a.click()
      URL.revokeObjectURL(url)
      setAuditCopyStatus('Downloaded. Save the CSV and share the path in Cursor for migration 056.')
    } catch (e) {
      setAuditCopyStatus(e instanceof Error ? e.message : 'Download failed')
    }
    setTimeout(() => setAuditCopyStatus(null), 8000)
  }

  async function downloadNextBatchForAudit() {
    setAuditCopyStatus('Loading…')
    try {
      const text = await fetchAuditBatch()
      const start = auditOffset + 1
      const blob = new Blob([text], { type: 'text/markdown' })
      const url = URL.createObjectURL(blob)
      const a = document.createElement('a')
      a.href = url
      a.download = `akt-audit-batch-${start}.md`
      a.click()
      URL.revokeObjectURL(url)
      setAuditCopyStatus(`Downloaded batch starting at question ${start}. Open the file and paste in Cursor with Prompt B.`)
      setAuditOffset(prev => prev + AUDIT_BATCH_SIZE)
    } catch (e) {
      setAuditCopyStatus(e instanceof Error ? e.message : 'Download failed')
    }
    setTimeout(() => setAuditCopyStatus(null), 6000)
  }

  if (loading) return <p className="text-muted-foreground">Loading...</p>

  return (
    <div className="space-y-6">
      <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <h1 className="text-3xl font-bold">AKT Questions</h1>
          <p className="text-muted-foreground">Manage question bank</p>
        </div>
        <div className="flex flex-wrap items-center gap-2">
          <Button variant="outline" onClick={downloadNextBatchForAudit} title="Download the next 10 questions as .md (no clipboard needed)">
            Download next 10 for audit
          </Button>
          <Button variant="outline" onClick={copyNextBatchForAudit} title="Copy the next 10 questions to clipboard (may be blocked by browser)">
            Copy next 10 for audit
          </Button>
          <Button variant="outline" onClick={downloadShortQuestionsCsv} title="Download CSV of questions with short stems or short explanations for migration 056">
            Download short Qs (CSV)
          </Button>
          <Button variant="outline" onClick={() => downloadFullExport('md')} title="Download a .md file with every question for AI audit via Prompt B">
            Export all (.md)
          </Button>
          <Button variant="outline" onClick={() => downloadFullExport('csv')} title="Download a CSV with every question for spreadsheet review">
            Export all (.csv)
          </Button>
          {auditCopyStatus && (
            <span className="text-sm text-muted-foreground max-w-[320px]">{auditCopyStatus}</span>
          )}
          <span className="text-xs text-muted-foreground max-w-[200px]">Batch starts at question {auditOffset + 1}. Use &quot;Download next 10&quot; if clipboard is blocked.</span>
        <Dialog open={auditFallbackOpen} onOpenChange={(open) => { setAuditFallbackOpen(open); if (!open) setAuditFallbackText(null); }}>
          <DialogContent className="max-w-3xl max-h-[90vh] overflow-hidden flex flex-col">
            <DialogHeader>
              <DialogTitle>Copy batch for audit (clipboard was denied)</DialogTitle>
            </DialogHeader>
            <p className="text-sm text-muted-foreground">Select all (Ctrl+A / Cmd+A) and copy (Ctrl+C / Cmd+C), or download as .md below.</p>
            <Textarea readOnly value={auditFallbackText ?? ''} className="flex-1 min-h-[300px] font-mono text-sm" onFocus={(e) => e.target.select()} />
            <div className="flex gap-2">
              <Button variant="outline" onClick={() => { if (auditFallbackText) { const blob = new Blob([auditFallbackText], { type: 'text/markdown' }); const a = document.createElement('a'); a.href = URL.createObjectURL(blob); a.download = `akt-audit-batch-${auditOffset + 1}.md`; a.click(); URL.revokeObjectURL(a.href); setAuditOffset(prev => prev + AUDIT_BATCH_SIZE); setAuditFallbackOpen(false); setAuditFallbackText(null); } }}>
                Download as .md and close
              </Button>
              <Button variant="outline" onClick={() => setAuditFallbackOpen(false)}>Close</Button>
            </div>
          </DialogContent>
        </Dialog>
        <Dialog open={dialogOpen} onOpenChange={setDialogOpen}>
          <DialogTrigger asChild>
            <Button onClick={() => { setEditing(null); resetForm(); }}>Add Question</Button>
          </DialogTrigger>
          <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
            <DialogHeader>
              <DialogTitle>{editing ? 'Edit Question' : 'Add Question'}</DialogTitle>
            </DialogHeader>
            <form onSubmit={handleSubmit} className="space-y-4">
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <Label>Topic</Label>
                  <Input
                    value={form.topic}
                    onChange={(e) => setForm({ ...form, topic: e.target.value })}
                    placeholder="Cardiovascular"
                    required
                  />
                </div>
                <div>
                  <Label>Difficulty</Label>
                  <select
                    className="w-full p-2 border rounded"
                    value={form.difficulty}
                    onChange={(e) => setForm({ ...form, difficulty: e.target.value })}
                  >
                    <option value="easy">Easy</option>
                    <option value="medium">Medium</option>
                    <option value="hard">Hard</option>
                  </select>
                </div>
              </div>
              <div>
                <Label>Question (Markdown)</Label>
                <Textarea
                  value={form.question}
                  onChange={(e) => setForm({ ...form, question: e.target.value })}
                  rows={3}
                  required
                />
              </div>
              <div className="space-y-2">
                <Label>Options</Label>
                <div className="grid gap-2">
                  {['a', 'b', 'c', 'd'].map((opt) => (
                    <div key={opt} className="flex items-center gap-2">
                      <input
                        type="radio"
                        name="correct"
                        checked={form.correct_option === opt}
                        onChange={() => setForm({ ...form, correct_option: opt })}
                      />
                      <span className="font-medium w-6">{opt.toUpperCase()}.</span>
                      <Input
                        value={form[`option_${opt}` as keyof typeof form] as string}
                        onChange={(e) => setForm({ ...form, [`option_${opt}`]: e.target.value })}
                        placeholder={`Option ${opt.toUpperCase()}`}
                        required
                      />
                    </div>
                  ))}
                </div>
                <p className="text-xs text-muted-foreground">Select the correct answer</p>
              </div>
              <div>
                <Label>Explanation (Markdown)</Label>
                <Textarea
                  value={form.explanation}
                  onChange={(e) => setForm({ ...form, explanation: e.target.value })}
                  rows={4}
                  required
                />
              </div>
              <div>
                <Label>Guideline References (one per line)</Label>
                <Textarea
                  value={form.guideline_refs}
                  onChange={(e) => setForm({ ...form, guideline_refs: e.target.value })}
                  rows={2}
                  placeholder="NICE CG127&#10;BNF Chapter 2"
                />
              </div>
              <div className="flex gap-4">
                <div className="flex items-center gap-2">
                  <input
                    type="checkbox"
                    id="is_pro"
                    checked={form.is_pro}
                    onChange={(e) => setForm({ ...form, is_pro: e.target.checked })}
                  />
                  <Label htmlFor="is_pro">Pro only</Label>
                </div>
                <div className="flex items-center gap-2">
                  <input
                    type="checkbox"
                    id="published"
                    checked={form.published}
                    onChange={(e) => setForm({ ...form, published: e.target.checked })}
                  />
                  <Label htmlFor="published">Published</Label>
                </div>
              </div>
              <div className="flex justify-end gap-2">
                <Button type="button" variant="outline" onClick={() => setDialogOpen(false)}>
                  Cancel
                </Button>
                <Button type="submit">Save</Button>
              </div>
            </form>
          </DialogContent>
        </Dialog>
        </div>
      </div>

      <Card>
        <CardContent className="p-0">
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>Question</TableHead>
                <TableHead>Topic</TableHead>
                <TableHead>Difficulty</TableHead>
                <TableHead>Status</TableHead>
                <TableHead className="text-right">Actions</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {questions.map((q) => (
                <TableRow key={q.id}>
                  <TableCell className="font-medium max-w-xs truncate">
                    {q.question.substring(0, 50)}...
                  </TableCell>
                  <TableCell>{q.topic}</TableCell>
                  <TableCell>
                    <Badge variant={
                      q.difficulty === 'easy' ? 'secondary' :
                      q.difficulty === 'hard' ? 'destructive' : 'default'
                    }>
                      {q.difficulty}
                    </Badge>
                  </TableCell>
                  <TableCell>
                    <div className="flex gap-1">
                      {q.is_pro && <Badge>Pro</Badge>}
                      <Badge variant={q.published ? 'secondary' : 'outline'}>
                        {q.published ? 'Published' : 'Draft'}
                      </Badge>
                    </div>
                  </TableCell>
                  <TableCell className="text-right">
                    <Button size="sm" variant="ghost" onClick={() => openEdit(q)}>
                      Edit
                    </Button>
                    <Button size="sm" variant="ghost" onClick={() => handleDelete(q.id)}>
                      Delete
                    </Button>
                  </TableCell>
                </TableRow>
              ))}
              {questions.length === 0 && (
                <TableRow>
                  <TableCell colSpan={5} className="text-center text-muted-foreground py-8">
                    No questions yet. Add your first one!
                  </TableCell>
                </TableRow>
              )}
            </TableBody>
          </Table>
        </CardContent>
      </Card>
    </div>
  )
}
