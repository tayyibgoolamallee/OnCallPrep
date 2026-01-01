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
  options: { id: string; text: string }[]
  correct_option: string
  explanation: string
  guideline_refs: string[] | null
  difficulty: string | null
  is_pro: boolean | null
  published: boolean | null
}

export default function AdminAKTPage() {
  const [questions, setQuestions] = useState<Question[]>([])
  const [loading, setLoading] = useState(true)
  const [dialogOpen, setDialogOpen] = useState(false)
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
    setForm({
      topic: q.topic,
      question: q.question,
      option_a: q.options.find(o => o.id === 'a')?.text || '',
      option_b: q.options.find(o => o.id === 'b')?.text || '',
      option_c: q.options.find(o => o.id === 'c')?.text || '',
      option_d: q.options.find(o => o.id === 'd')?.text || '',
      correct_option: q.correct_option,
      explanation: q.explanation,
      guideline_refs: q.guideline_refs?.join('\n') || '',
      difficulty: q.difficulty ?? 'medium',
      is_pro: q.is_pro ?? false,
      published: q.published ?? true,
    })
    setDialogOpen(true)
  }

  if (loading) return <p className="text-muted-foreground">Loading...</p>

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold">AKT Questions</h1>
          <p className="text-muted-foreground">Manage question bank</p>
        </div>
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
