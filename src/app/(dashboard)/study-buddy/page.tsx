'use client'

import { useState, useEffect, useCallback } from 'react'
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
  contact_email: string | null
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
  contact_email: null,
}

export default function StudyBuddyPage() {
  const [directory, setDirectory] = useState<StudyProfile[]>([])
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [saveError, setSaveError] = useState<string | null>(null)
  const [saveSuccess, setSaveSuccess] = useState(false)
  const [userId, setUserId] = useState<string | null>(null)
  const [form, setForm] = useState(defaultProfile)

  const loadDirectory = useCallback(async (supabase: ReturnType<typeof createClient>, currentUserId: string) => {
    const { data: list } = await supabase
      .from('study_profiles')
      .select('*')
      .eq('looking_for_study_buddy', true)
      .neq('user_id', currentUserId)
    setDirectory((list || []) as StudyProfile[])
  }, [])

  useEffect(() => {
    async function load() {
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) {
        setLoading(false)
        return
      }
      setUserId(user.id)

      const { data: myProfile } = await supabase
        .from('study_profiles')
        .select('*')
        .eq('user_id', user.id)
        .maybeSingle()

      if (myProfile) {
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
          contact_email: myProfile.contact_email ?? null,
        })
      } else {
        setForm({ ...defaultProfile, user_id: user.id })
      }

      await loadDirectory(supabase, user.id)
      setLoading(false)
    }
    load()
  }, [loadDirectory])

  async function handleSave(e: React.FormEvent) {
    e.preventDefault()
    if (!userId) {
      setSaveError('Not signed in. Please refresh and try again.')
      return
    }
    setSaving(true)
    setSaveError(null)
    setSaveSuccess(false)

    try {
      const supabase = createClient()
      const payload = {
        user_id: userId,
        display_name: form.display_name?.trim() || null,
        exam_date: form.exam_date || null,
        looking_for_study_buddy: form.looking_for_study_buddy ?? false,
        vts_or_area: form.vts_or_area?.trim() || null,
        show_exam_date: form.show_exam_date ?? false,
        show_looking_for_study_buddy: form.show_looking_for_study_buddy ?? false,
        show_vts_or_area: form.show_vts_or_area ?? false,
        share_email_with_study_buddies: form.share_email_with_study_buddies ?? false,
        contact_email: form.contact_email?.trim() || null,
      }

      const { error } = await supabase
        .from('study_profiles')
        .upsert(payload, { onConflict: 'user_id' })

      if (error) {
        console.error('[Study buddy] save error', error)
        setSaveError(error.message || 'Save failed. Please try again.')
        return
      }

      setSaveSuccess(true)
      await loadDirectory(supabase, userId)
      setTimeout(() => setSaveSuccess(false), 4000)
    } catch (err) {
      setSaveError(err instanceof Error ? err.message : 'Save failed')
    } finally {
      setSaving(false)
    }
  }

  if (loading) {
    return (
      <div className="space-y-6">
        <h1 className="text-3xl font-bold">Study Buddy</h1>
        <p className="text-muted-foreground">Loading...</p>
      </div>
    )
  }

  if (!userId) {
    return (
      <div className="space-y-6">
        <h1 className="text-3xl font-bold">Study Buddy</h1>
        <p className="text-muted-foreground">Please sign in to use the study buddy feature.</p>
      </div>
    )
  }

  return (
    <div className="space-y-8 max-w-3xl">
      <div>
        <h1 className="text-3xl font-bold">Study Buddy</h1>
        <p className="text-muted-foreground mt-1">
          Optionally share your exam date, area, and whether you&apos;re looking for a study buddy.
          You control what others see. Contact is direct (email) &ndash; we don&apos;t store messages.
        </p>
      </div>

      {/* My profile */}
      <Card>
        <CardHeader>
          <CardTitle>My study profile</CardTitle>
          <CardDescription>All fields are optional. Only other registered users can see what you choose to show.</CardDescription>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSave} className="space-y-5">
            <div className="grid gap-4 sm:grid-cols-2">
              <div className="space-y-1.5">
                <Label htmlFor="display_name">Display name</Label>
                <Input
                  id="display_name"
                  placeholder="e.g. first name"
                  value={form.display_name ?? ''}
                  onChange={(e) => setForm((f) => ({ ...f, display_name: e.target.value || null }))}
                />
              </div>
              <div className="space-y-1.5">
                <Label htmlFor="exam_date">Exam date</Label>
                <Input
                  id="exam_date"
                  type="date"
                  value={form.exam_date ?? ''}
                  onChange={(e) => setForm((f) => ({ ...f, exam_date: e.target.value || null }))}
                />
              </div>
            </div>

            <div className="grid gap-4 sm:grid-cols-2">
              <div className="space-y-1.5">
                <Label htmlFor="vts_or_area">VTS / area of UK</Label>
                <Input
                  id="vts_or_area"
                  placeholder="e.g. London VTS, North West"
                  value={form.vts_or_area ?? ''}
                  onChange={(e) => setForm((f) => ({ ...f, vts_or_area: e.target.value || null }))}
                />
              </div>
              <div className="space-y-1.5">
                <Label htmlFor="contact_email">Contact email</Label>
                <Input
                  id="contact_email"
                  type="email"
                  placeholder="e.g. you@email.com"
                  value={form.contact_email ?? ''}
                  onChange={(e) => setForm((f) => ({ ...f, contact_email: e.target.value || null }))}
                />
                <p className="text-xs text-muted-foreground">Only shown if you tick &quot;Let others contact me&quot; below.</p>
              </div>
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
              <p className="text-sm font-medium text-muted-foreground">Visibility &ndash; tick to let others see</p>
              <div className="grid gap-3 sm:grid-cols-2">
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
              <p className="text-xs text-muted-foreground">
                Your contact email will only be visible to other logged-in users if you tick the box above.
                We don&apos;t store any messages &ndash; they email you directly.
              </p>
            </div>

            {saveError && (
              <div className="rounded-md border border-destructive/50 bg-destructive/10 p-3 text-sm text-destructive">
                {saveError}
              </div>
            )}

            {saveSuccess && (
              <div className="rounded-md border border-green-500/50 bg-green-500/10 p-3 text-sm text-green-700 dark:text-green-400">
                Profile saved successfully.
              </div>
            )}

            <Button type="submit" disabled={saving}>
              {saving ? 'Saving...' : 'Save profile'}
            </Button>
          </form>
        </CardContent>
      </Card>

      {/* Find study buddies */}
      <Card>
        <CardHeader>
          <CardTitle>Find study buddies</CardTitle>
          <CardDescription>
            Others who are looking for a study buddy. Contact is direct via email &ndash; we don&apos;t store messages.
          </CardDescription>
        </CardHeader>
        <CardContent>
          {directory.length === 0 ? (
            <p className="text-muted-foreground text-sm">
              No one has opted in yet. Save your profile with &quot;I&apos;m looking for a study buddy&quot; to appear here for others.
            </p>
          ) : (
            <ul className="space-y-3">
              {directory.map((p) => (
                <li key={p.user_id} className="flex flex-wrap items-center justify-between gap-3 rounded-lg border p-4 hover:shadow-sm transition-shadow">
                  <div className="flex flex-wrap items-center gap-2">
                    <span className="font-medium">{p.display_name?.trim() || 'Study buddy'}</span>
                    {p.show_looking_for_study_buddy && <Badge variant="secondary">Looking for buddy</Badge>}
                    {p.show_exam_date && p.exam_date && (
                      <span className="text-sm text-muted-foreground">
                        Exam: {new Date(p.exam_date).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' })}
                      </span>
                    )}
                    {p.show_vts_or_area && p.vts_or_area && (
                      <span className="text-sm text-muted-foreground">{p.vts_or_area}</span>
                    )}
                  </div>
                  {p.share_email_with_study_buddies && p.contact_email ? (
                    <a href={`mailto:${p.contact_email}`}>
                      <Button size="sm" variant="outline" className="border-teal-500 text-teal-700 hover:bg-teal-50">
                        Email {p.contact_email}
                      </Button>
                    </a>
                  ) : (
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
