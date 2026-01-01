'use client'

import { useState, useEffect } from 'react'
import { createClient } from '@/lib/supabase/client'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
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

interface Guide {
  id: string
  stage: string
  category: string
  title: string
  content: string
  is_pro: boolean | null
  published: boolean | null
  sort_order: number | null
}

export default function AdminPortfolioPage() {
  const [guides, setGuides] = useState<Guide[]>([])
  const [loading, setLoading] = useState(true)
  const [dialogOpen, setDialogOpen] = useState(false)
  const [editing, setEditing] = useState<Guide | null>(null)
  const [form, setForm] = useState({
    stage: 'st1',
    category: 'checklist',
    title: '',
    content: '',
    is_pro: false,
    published: true,
    sort_order: 0,
  })

  useEffect(() => {
    loadGuides()
  }, [])

  async function loadGuides() {
    const supabase = createClient()
    const { data } = await supabase
      .from('portfolio_guides')
      .select('*')
      .order('stage')
      .order('sort_order')

    if (data) setGuides(data)
    setLoading(false)
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    const supabase = createClient()

    if (editing) {
      await supabase
        .from('portfolio_guides')
        .update(form)
        .eq('id', editing.id)
    } else {
      await supabase.from('portfolio_guides').insert(form)
    }

    setDialogOpen(false)
    setEditing(null)
    setForm({
      stage: 'st1',
      category: 'checklist',
      title: '',
      content: '',
      is_pro: false,
      published: true,
      sort_order: 0,
    })
    loadGuides()
  }

  async function handleDelete(id: string) {
    if (!confirm('Are you sure you want to delete this guide?')) return
    const supabase = createClient()
    await supabase.from('portfolio_guides').delete().eq('id', id)
    loadGuides()
  }

  function openEdit(guide: Guide) {
    setEditing(guide)
    setForm({
      stage: guide.stage,
      category: guide.category,
      title: guide.title,
      content: guide.content,
      is_pro: guide.is_pro ?? false,
      published: guide.published ?? true,
      sort_order: guide.sort_order ?? 0,
    })
    setDialogOpen(true)
  }

  function openNew() {
    setEditing(null)
    setForm({
      stage: 'st1',
      category: 'checklist',
      title: '',
      content: '',
      is_pro: false,
      published: true,
      sort_order: 0,
    })
    setDialogOpen(true)
  }

  if (loading) {
    return <p className="text-muted-foreground">Loading...</p>
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold">Portfolio Guides</h1>
          <p className="text-muted-foreground">Manage portfolio content</p>
        </div>
        <Dialog open={dialogOpen} onOpenChange={setDialogOpen}>
          <DialogTrigger asChild>
            <Button onClick={openNew}>Add Guide</Button>
          </DialogTrigger>
          <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
            <DialogHeader>
              <DialogTitle>{editing ? 'Edit Guide' : 'Add Guide'}</DialogTitle>
            </DialogHeader>
            <form onSubmit={handleSubmit} className="space-y-4">
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <Label>Stage</Label>
                  <select
                    className="w-full p-2 border rounded"
                    value={form.stage}
                    onChange={(e) => setForm({ ...form, stage: e.target.value })}
                  >
                    <option value="st1">ST1</option>
                    <option value="st2">ST2</option>
                    <option value="st3">ST3</option>
                  </select>
                </div>
                <div>
                  <Label>Category</Label>
                  <select
                    className="w-full p-2 border rounded"
                    value={form.category}
                    onChange={(e) => setForm({ ...form, category: e.target.value })}
                  >
                    <option value="checklist">Checklist</option>
                    <option value="reflection">Reflection</option>
                    <option value="consultation">Consultation</option>
                    <option value="competency">Competency</option>
                  </select>
                </div>
              </div>
              <div>
                <Label>Title</Label>
                <Input
                  value={form.title}
                  onChange={(e) => setForm({ ...form, title: e.target.value })}
                  required
                />
              </div>
              <div>
                <Label>Content (Markdown)</Label>
                <Textarea
                  value={form.content}
                  onChange={(e) => setForm({ ...form, content: e.target.value })}
                  rows={10}
                  required
                />
              </div>
              <div className="grid grid-cols-3 gap-4">
                <div>
                  <Label>Sort Order</Label>
                  <Input
                    type="number"
                    value={form.sort_order}
                    onChange={(e) => setForm({ ...form, sort_order: parseInt(e.target.value) })}
                  />
                </div>
                <div className="flex items-center gap-2 pt-6">
                  <input
                    type="checkbox"
                    id="is_pro"
                    checked={form.is_pro}
                    onChange={(e) => setForm({ ...form, is_pro: e.target.checked })}
                  />
                  <Label htmlFor="is_pro">Pro only</Label>
                </div>
                <div className="flex items-center gap-2 pt-6">
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
                <TableHead>Stage</TableHead>
                <TableHead>Category</TableHead>
                <TableHead>Status</TableHead>
                <TableHead className="text-right">Actions</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {guides.map((guide) => (
                <TableRow key={guide.id}>
                  <TableCell className="font-medium">{guide.title}</TableCell>
                  <TableCell>{guide.stage.toUpperCase()}</TableCell>
                  <TableCell className="capitalize">{guide.category}</TableCell>
                  <TableCell>
                    <div className="flex gap-1">
                      {guide.is_pro && <Badge>Pro</Badge>}
                      <Badge variant={guide.published ? 'secondary' : 'outline'}>
                        {guide.published ? 'Published' : 'Draft'}
                      </Badge>
                    </div>
                  </TableCell>
                  <TableCell className="text-right">
                    <Button size="sm" variant="ghost" onClick={() => openEdit(guide)}>
                      Edit
                    </Button>
                    <Button size="sm" variant="ghost" onClick={() => handleDelete(guide.id)}>
                      Delete
                    </Button>
                  </TableCell>
                </TableRow>
              ))}
              {guides.length === 0 && (
                <TableRow>
                  <TableCell colSpan={5} className="text-center text-muted-foreground py-8">
                    No guides yet. Add your first one!
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
