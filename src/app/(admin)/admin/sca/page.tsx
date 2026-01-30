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

interface PatientInfo {
  age: number
  gender: string
  presenting_complaint: string
}

interface SCACase {
  id: string
  title: string
  scenario: string
  patient_info: PatientInfo
  case_type: string
  time_limit: number
  difficulty: string | null
  key_points: string[]
  model_answer: string
  is_pro: boolean | null
  published: boolean | null
}

const VALID_DIFFICULTIES = ['easy', 'medium', 'hard', 'advanced'] as const
function normalizeDifficulty(diff: string | null | undefined): string {
  const d = (diff == null || typeof diff !== 'string') ? '' : String(diff).trim().toLowerCase()
  if (!d || d === 'intermediate') return 'medium'
  return VALID_DIFFICULTIES.includes(d as typeof VALID_DIFFICULTIES[number]) ? d : 'medium'
}

export default function AdminSCAPage() {
  const [cases, setCases] = useState<SCACase[]>([])
  const [loading, setLoading] = useState(true)
  const [dialogOpen, setDialogOpen] = useState(false)
  const [editing, setEditing] = useState<SCACase | null>(null)
  const [form, setForm] = useState({
    title: '',
    scenario: '',
    patient_age: 45,
    patient_gender: 'Female',
    patient_complaint: '',
    case_type: 'diagnosis',
    time_limit: 120,
    difficulty: 'medium',
    key_points: '',
    model_answer: '',
    is_pro: false,
    published: true,
  })

  useEffect(() => {
    loadCases()
  }, [])

  async function loadCases() {
    const supabase = createClient()
    const { data } = await supabase
      .from('sca_cases')
      .select('*')
      .order('created_at', { ascending: false })

    if (data) {
      const mapped = data.map(c => ({
        ...c,
        patient_info: c.patient_info as unknown as PatientInfo
      }))
      setCases(mapped)
    }
    setLoading(false)
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    const supabase = createClient()

    const caseData = {
      title: form.title,
      scenario: form.scenario,
      patient_info: {
        age: form.patient_age,
        gender: form.patient_gender,
        presenting_complaint: form.patient_complaint,
      },
      case_type: form.case_type,
      time_limit: form.time_limit,
      difficulty: form.difficulty,
      key_points: form.key_points.split('\n').filter(p => p.trim()),
      model_answer: form.model_answer,
      is_pro: form.is_pro,
      published: form.published,
    }

    if (editing) {
      await supabase.from('sca_cases').update(caseData).eq('id', editing.id)
    } else {
      await supabase.from('sca_cases').insert(caseData)
    }

    setDialogOpen(false)
    setEditing(null)
    resetForm()
    loadCases()
  }

  function resetForm() {
    setForm({
      title: '',
      scenario: '',
      patient_age: 45,
      patient_gender: 'Female',
      patient_complaint: '',
      case_type: 'diagnosis',
      time_limit: 120,
      difficulty: 'medium',
      key_points: '',
      model_answer: '',
      is_pro: false,
      published: true,
    })
  }

  async function handleDelete(id: string) {
    if (!confirm('Delete this case?')) return
    const supabase = createClient()
    await supabase.from('sca_cases').delete().eq('id', id)
    loadCases()
  }

  function openEdit(c: SCACase) {
    setEditing(c)
    setForm({
      title: c.title,
      scenario: c.scenario,
      patient_age: c.patient_info.age,
      patient_gender: c.patient_info.gender,
      patient_complaint: c.patient_info.presenting_complaint,
      case_type: c.case_type,
      time_limit: c.time_limit,
      difficulty: c.difficulty ?? 'medium',
      key_points: c.key_points.join('\n'),
      model_answer: c.model_answer,
      is_pro: c.is_pro ?? false,
      published: c.published ?? true,
    })
    setDialogOpen(true)
  }

  if (loading) return <p className="text-muted-foreground">Loading...</p>

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold">SCA Cases</h1>
          <p className="text-muted-foreground">Manage mock consultation cases</p>
        </div>
        <Dialog open={dialogOpen} onOpenChange={setDialogOpen}>
          <DialogTrigger asChild>
            <Button onClick={() => { setEditing(null); resetForm(); }}>Add Case</Button>
          </DialogTrigger>
          <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
            <DialogHeader>
              <DialogTitle>{editing ? 'Edit Case' : 'Add Case'}</DialogTitle>
            </DialogHeader>
            <form onSubmit={handleSubmit} className="space-y-4">
              <div>
                <Label>Title</Label>
                <Input
                  value={form.title}
                  onChange={(e) => setForm({ ...form, title: e.target.value })}
                  required
                />
              </div>
              <div className="grid grid-cols-3 gap-4">
                <div>
                  <Label>Case Type</Label>
                  <select
                    className="w-full p-2 border rounded"
                    value={form.case_type}
                    onChange={(e) => setForm({ ...form, case_type: e.target.value })}
                  >
                    <option value="diagnosis">Diagnosis (2 min)</option>
                    <option value="priming">Priming (3 min)</option>
                    <option value="full">Full Case</option>
                  </select>
                </div>
                <div>
                  <Label>Time Limit (seconds)</Label>
                  <Input
                    type="number"
                    value={form.time_limit}
                    onChange={(e) => setForm({ ...form, time_limit: parseInt(e.target.value) })}
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
              <div className="grid grid-cols-3 gap-4">
                <div>
                  <Label>Patient Age</Label>
                  <Input
                    type="number"
                    value={form.patient_age}
                    onChange={(e) => setForm({ ...form, patient_age: parseInt(e.target.value) })}
                  />
                </div>
                <div>
                  <Label>Patient Gender</Label>
                  <Input
                    value={form.patient_gender}
                    onChange={(e) => setForm({ ...form, patient_gender: e.target.value })}
                  />
                </div>
                <div>
                  <Label>Presenting Complaint</Label>
                  <Input
                    value={form.patient_complaint}
                    onChange={(e) => setForm({ ...form, patient_complaint: e.target.value })}
                    required
                  />
                </div>
              </div>
              <div>
                <Label>Scenario (Markdown)</Label>
                <Textarea
                  value={form.scenario}
                  onChange={(e) => setForm({ ...form, scenario: e.target.value })}
                  rows={4}
                  required
                />
              </div>
              <div>
                <Label>Key Points (one per line)</Label>
                <Textarea
                  value={form.key_points}
                  onChange={(e) => setForm({ ...form, key_points: e.target.value })}
                  rows={4}
                  placeholder="Take history of chest pain&#10;Assess cardiovascular risk&#10;..."
                  required
                />
              </div>
              <div>
                <Label>Model Answer (Markdown)</Label>
                <Textarea
                  value={form.model_answer}
                  onChange={(e) => setForm({ ...form, model_answer: e.target.value })}
                  rows={6}
                  required
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
                <TableHead>Title</TableHead>
                <TableHead>Type</TableHead>
                <TableHead>Difficulty</TableHead>
                <TableHead>Status</TableHead>
                <TableHead className="text-right">Actions</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {cases.map((c) => (
                <TableRow key={c.id}>
                  <TableCell className="font-medium">{c.title}</TableCell>
                  <TableCell className="capitalize">{c.case_type}</TableCell>
                  <TableCell>
                    <Badge variant={
                      normalizeDifficulty(c.difficulty) === 'easy' ? 'secondary' :
                      normalizeDifficulty(c.difficulty) === 'hard' || normalizeDifficulty(c.difficulty) === 'advanced' ? 'destructive' : 'default'
                    }>
                      {normalizeDifficulty(c.difficulty)}
                    </Badge>
                  </TableCell>
                  <TableCell>
                    <div className="flex gap-1">
                      {c.is_pro && <Badge>Pro</Badge>}
                      <Badge variant={c.published ? 'secondary' : 'outline'}>
                        {c.published ? 'Published' : 'Draft'}
                      </Badge>
                    </div>
                  </TableCell>
                  <TableCell className="text-right">
                    <Button size="sm" variant="ghost" onClick={() => openEdit(c)}>
                      Edit
                    </Button>
                    <Button size="sm" variant="ghost" onClick={() => handleDelete(c.id)}>
                      Delete
                    </Button>
                  </TableCell>
                </TableRow>
              ))}
              {cases.length === 0 && (
                <TableRow>
                  <TableCell colSpan={5} className="text-center text-muted-foreground py-8">
                    No cases yet. Add your first one!
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
