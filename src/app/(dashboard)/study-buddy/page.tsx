'use client'

import { useState, useEffect } from 'react'
import { createClient } from '@/lib/supabase/client'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Badge } from '@/components/ui/badge'
import { Checkbox } from '@/components/ui/checkbox'

type StudyProfile = {
  user_id: string
  display_name: string | null
  exam_date: string | null
  looking_for_study_buddy: boolean | null
  vts_or_area: string | null
  show_exam_date: boolean | null
  show_looking_for_study_buddy: boolean | null
  show_vts_or_area: boolean | null
  share_email_with_study_buddies: boolean | null
}

const defaultProfile: StudyProfile = {
  user_id: '',
  display_name: null,
  exam_date: null,
  looking_for_study_buddy: false,
  vts_or_area: null,
  show_exam_date: false,
  show_looking_for_study_buddy: false,
  show_vts_or_area: false,
  share_email_with_study_buddies: false,
}

function ContactButton({ userId }: { userId: string }) {
  const [loading, setLoading] = useState(false)
  const [email, setEmail] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)

  async function handleContact() {
    setLoading(true)
    setError(null)
    setEmail(null)
    try {
      const res = await fetch(`/api/study-buddy/contact/${userId}`)
      const data = await res.json()
      if (!res.ok) {
        setError(data.error || 'Could not get contact')
        return
      }
      setEmail(data.email)
    } finally {
      setLoading(false)
    }
  }

  if (email) {
    return (
      <a href={`mailto:${email}`}>
        <Button size="sm" variant="outline" className="border-teal-500 text-teal-700 hover:bg-teal-50">
          Email {email}
        </Button>
      </a>
    )
  }
  return (
    <div className="flex flex-col gap-1">
      <Button size="sm" variant="outline" onClick={handleContact} disabled={loading}>
        {loading ? 'Loading…' : 'Contact'}
      </Button>
      {error && <span className="text-xs text-destructive">{error}</span>}
    </div>
  )
}

export default function StudyBuddyPage() {
  const [profile, setProfile] = useState<StudyProfile | null>(null)
  const [directory, setDirectory] = useState<StudyProfile[]>([])
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [userId, setUserId] = useState<string | null>(null)
  const [form, setForm] = useState(defaultProfile)

  useEffect(() => {
    async function load() {
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) return
      setUserId(user.id)
      const { data: myProfile } = await supabase
        .from('study_profiles')
        .select('*')
        .eq('user_id', user.id)
        .maybeSingle()
      if (myProfile) {
        setProfile(myProfile as StudyProfile)
        setForm({
          user_id: myProfile.user_id,
          display_name: myProfile.display_name ?? null,
          exam_date: myProfile.exam_date ?? null,
          looking_for_study_buddy: myProfile.looking_for_study_buddy ?? false,
          vts_or_area: myProfile.vts_or_area ?? null,
          show_exam_date: myProfile.show_exam_date ?? false,
          show_looking_for_study_buddy: myProfile.show_looking_for_study_buddy ?? false,
          show_vts_or_area: myProfile.show_vts_or_area ?? false,
          share_email_with_study_buddies: myProfile.share_email_with_study_buddies ?? false,
        })
      } else {
        setForm({ ...defaultProfile, user_id: user.id })
      }
      const { data: list } = await supabase
        .from('study_profiles')
        .select('*')
        .eq('looking_for_study_buddy', true)
        .neq('user_id', user.id)
      setDirectory((list || []) as StudyProfile[])
      setLoading(false)
    }
    load()
  }, [])

  async function handleSave(e: React.FormEvent) {
    e.preventDefault()
    if (!userId) return
    setSaving(true)
    try {
      const supabase = createClient()
      await supabase.from('study_profiles').upsert({
        user_id: userId,
        display_name: form.display_name?.trim() || null,
        exam_date: form.exam_date || null,
        looking_for_study_buddy: form.looking_for_study_buddy ?? false,
        vts_or_area: form.vts_or_area?.trim() || null,
        show_exam_date: form.show_exam_date ?? false,
        show_looking_for_study_buddy: form.show_looking_for_study_buddy ?? false,
        show_vts_or_area: form.show_vts_or_area ?? false,
        share_email_with_study_buddies: form.share_email_with_study_buddies ?? false,
      }, { onConflict: 'user_id' })
      setProfile({ ...form, user_id: userId })
    } finally {
      setSaving(false)
    }
  }

  if (loading) {
    return (
      <div className="space-y-6">
        <h1 className="text-3xl font-bold">Study buddy</h1>
        <p className="text-muted-foreground">Loading…</p>
      </div>
    )
  }

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold">Study buddy</h1>
        <p className="text-muted-foreground mt-1">
          Optionally share your exam date, area, and whether you&apos;re looking for a study buddy. You control what others see. Contact is direct (email) – we don&apos;t store messages.
        </p>
      </div>

      {/* My profile */}
      <Card className="border-2 border-slate-200 dark:border-slate-700">
        <CardHeader>
          <CardTitle>My study profile</CardTitle>
          <CardDescription>All fields and visibilities are optional. Only other registered users can see what you choose to show.</CardDescription>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSave} className="space-y-6">
            <div className="grid gap-4 sm:grid-cols-2">
              <div className="space-y-2">
                <Label htmlFor="display_name">Name to show (optional)</Label>
                <Input
                  id="display_name"
                  placeholder="e.g. First name or leave blank"
                  value={form.display_name ?? ''}
                  onChange={(e) => setForm((f) => ({ ...f, display_name: e.target.value || null }))}
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="exam_date">Exam date (optional)</Label>
                <Input
                  id="exam_date"
                  type="date"
                  value={form.exam_date ?? ''}
                  onChange={(e) => setForm((f) => ({ ...f, exam_date: e.target.value || null }))}
                />
              </div>
            </div>
            <div className="space-y-2">
              <Label htmlFor="vts_or_area">VTS / area of UK (optional)</Label>
              <Input
                id="vts_or_area"
                placeholder="e.g. London VTS, North West"
                value={form.vts_or_area ?? ''}
                onChange={(e) => setForm((f) => ({ ...f, vts_or_area: e.target.value || null }))}
              />
            </div>
            <div className="flex items-center space-x-2">
              <Checkbox
                id="looking_for_study_buddy"
                checked={form.looking_for_study_buddy ?? false}
                onCheckedChange={(c) => setForm((f) => ({ ...f, looking_for_study_buddy: !!c }))}
              />
              <Label htmlFor="looking_for_study_buddy" className="font-normal">I&apos;m looking for a study buddy</Label>
            </div>
            <div className="border-t pt-4 space-y-3">
              <p className="text-sm font-medium text-muted-foreground">What others can see (tick to show)</p>
              <div className="flex flex-wrap gap-4">
                <div className="flex items-center space-x-2">
                  <Checkbox
                    id="show_exam_date"
                    checked={form.show_exam_date ?? false}
                    onCheckedChange={(c) => setForm((f) => ({ ...f, show_exam_date: !!c }))}
                  />
                  <Label htmlFor="show_exam_date" className="font-normal">Exam date</Label>
                </div>
                <div className="flex items-center space-x-2">
                  <Checkbox
                    id="show_looking_for_study_buddy"
                    checked={form.show_looking_for_study_buddy ?? false}
                    onCheckedChange={(c) => setForm((f) => ({ ...f, show_looking_for_study_buddy: !!c }))}
                  />
                  <Label htmlFor="show_looking_for_study_buddy" className="font-normal">Looking for study buddy</Label>
                </div>
                <div className="flex items-center space-x-2">
                  <Checkbox
                    id="show_vts_or_area"
                    checked={form.show_vts_or_area ?? false}
                    onCheckedChange={(c) => setForm((f) => ({ ...f, show_vts_or_area: !!c }))}
                  />
                  <Label htmlFor="show_vts_or_area" className="font-normal">VTS / area</Label>
                </div>
                <div className="flex items-center space-x-2">
                  <Checkbox
                    id="share_email"
                    checked={form.share_email_with_study_buddies ?? false}
                    onCheckedChange={(c) => setForm((f) => ({ ...f, share_email_with_study_buddies: !!c }))}
                  />
                  <Label htmlFor="share_email" className="font-normal">Let others contact me by email</Label>
                </div>
              </div>
              <p className="text-xs text-muted-foreground">If you enable contact, other logged-in users can see your email when they click Contact. We don&apos;t store any messages – they email you directly.</p>
            </div>
            <Button type="submit" disabled={saving}>{saving ? 'Saving…' : 'Save profile'}</Button>
          </form>
        </CardContent>
      </Card>

      {/* Find study buddies */}
      <Card className="border-2 border-slate-200 dark:border-slate-700">
        <CardHeader>
          <CardTitle>Find study buddies</CardTitle>
          <CardDescription>Others who have opted in to &quot;looking for study buddy&quot;. Contact opens email – we don&apos;t store messages.</CardDescription>
        </CardHeader>
        <CardContent>
          {directory.length === 0 ? (
            <p className="text-muted-foreground">No one has added themselves yet. Save your profile with &quot;I&apos;m looking for a study buddy&quot; to appear here.</p>
          ) : (
            <ul className="space-y-4">
              {directory.map((p) => (
                <li key={p.user_id} className="flex flex-wrap items-center justify-between gap-4 rounded-lg border p-4">
                  <div className="flex flex-wrap items-center gap-2">
                    <span className="font-medium">{p.display_name?.trim() || 'Study buddy'}</span>
                    {p.show_looking_for_study_buddy && <Badge variant="secondary">Looking for buddy</Badge>}
                    {p.show_exam_date && p.exam_date && (
                      <span className="text-sm text-muted-foreground">Exam: {new Date(p.exam_date).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' })}</span>
                    )}
                    {p.show_vts_or_area && p.vts_or_area && (
                      <span className="text-sm text-muted-foreground">{p.vts_or_area}</span>
                    )}
                  </div>
                  {p.share_email_with_study_buddies && <ContactButton userId={p.user_id} />}
                  {!p.share_email_with_study_buddies && (
                    <span className="text-sm text-muted-foreground">Contact not shared</span>
                  )}
                </li>
              ))}
            </ul>
          )}
        </CardContent>
      </Card>
    </div>
  )
}
