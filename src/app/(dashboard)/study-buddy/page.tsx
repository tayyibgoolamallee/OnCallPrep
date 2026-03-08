'use client'

import { useState, useEffect, useCallback } from 'react'
import { createClient } from '@/lib/supabase/client'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Badge } from '@/components/ui/badge'
import { Checkbox } from '@/components/ui/checkbox'

const DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'] as const
const TIMES = ['AM', 'PM'] as const
const FREQUENCY_OPTIONS = ['1-2 times a week', '3-4 times a week', '5+ times a week'] as const
const DURATION_OPTIONS = ['1-2 weeks', '1-2 months', '3-6 months', '6+ months', 'Ongoing'] as const

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
  available_days: string[] | null
  available_times: string[] | null
  study_frequency: string | null
  study_duration: string | null
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
  available_days: [],
  available_times: [],
  study_frequency: null,
  study_duration: null,
}

function toggleArrayItem(arr: string[], item: string): string[] {
  return arr.includes(item) ? arr.filter((v) => v !== item) : [...arr, item]
}

function ProfileCard({ profile, isOwn, onDelete }: { profile: StudyProfile; isOwn?: boolean; onDelete?: () => void }) {
  const days = profile.available_days?.length ? profile.available_days.map((d) => d.slice(0, 3)).join(', ') : null
  const times = profile.available_times?.length ? profile.available_times.join(' / ') : null

  return (
    <div className={`rounded-lg border p-4 transition-shadow hover:shadow-sm ${isOwn ? 'border-teal-400 bg-teal-50/40 dark:bg-teal-950/20' : ''}`}>
      <div className="flex flex-wrap items-start justify-between gap-3">
        <div className="space-y-1.5 min-w-0 flex-1">
          <div className="flex flex-wrap items-center gap-2">
            <span className="font-medium">{profile.display_name?.trim() || 'Study buddy'}</span>
            {isOwn && <Badge className="bg-teal-600 text-white">You</Badge>}
            {profile.show_looking_for_study_buddy && <Badge variant="secondary">Looking for buddy</Badge>}
          </div>
          <div className="flex flex-wrap gap-x-4 gap-y-1 text-sm text-muted-foreground">
            {profile.show_exam_date && profile.exam_date && (
              <span>Exam: {new Date(profile.exam_date).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' })}</span>
            )}
            {profile.show_vts_or_area && profile.vts_or_area && (
              <span>{profile.vts_or_area}</span>
            )}
          </div>
          {(days || times || profile.study_frequency || profile.study_duration) && (
            <div className="flex flex-wrap gap-x-4 gap-y-1 text-sm text-muted-foreground pt-0.5">
              {days && <span>Days: {days}</span>}
              {times && <span>Times: {times}</span>}
              {profile.study_frequency && <span>{profile.study_frequency}</span>}
              {profile.study_duration && <span>for {profile.study_duration}</span>}
            </div>
          )}
        </div>
        <div className="flex flex-col items-end gap-2">
          {profile.share_email_with_study_buddies && profile.contact_email && !isOwn && (
            <a href={`mailto:${profile.contact_email}`}>
              <Button size="sm" variant="outline" className="border-teal-500 text-teal-700 hover:bg-teal-50">
                Email {profile.contact_email}
              </Button>
            </a>
          )}
          {!profile.share_email_with_study_buddies && !isOwn && (
            <span className="text-sm text-muted-foreground">Contact not shared</span>
          )}
          {isOwn && onDelete && (
            <Button size="sm" variant="outline" className="text-red-600 border-red-300 hover:bg-red-50" onClick={onDelete}>
              No longer looking
            </Button>
          )}
        </div>
      </div>
    </div>
  )
}

export default function StudyBuddyPage() {
  const [directory, setDirectory] = useState<StudyProfile[]>([])
  const [myProfile, setMyProfile] = useState<StudyProfile | null>(null)
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [saveError, setSaveError] = useState<string | null>(null)
  const [saveSuccess, setSaveSuccess] = useState(false)
  const [userId, setUserId] = useState<string | null>(null)
  const [form, setForm] = useState(defaultProfile)
  const [deleting, setDeleting] = useState(false)

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

      const { data: profile } = await supabase
        .from('study_profiles')
        .select('*')
        .eq('user_id', user.id)
        .maybeSingle()

      if (profile) {
        const parsed: StudyProfile = {
          user_id: profile.user_id,
          display_name: profile.display_name ?? null,
          exam_date: profile.exam_date ?? null,
          looking_for_study_buddy: profile.looking_for_study_buddy ?? false,
          vts_or_area: profile.vts_or_area ?? null,
          show_exam_date: profile.show_exam_date ?? false,
          show_looking_for_study_buddy: profile.show_looking_for_study_buddy ?? false,
          show_vts_or_area: profile.show_vts_or_area ?? false,
          share_email_with_study_buddies: profile.share_email_with_study_buddies ?? false,
          contact_email: profile.contact_email ?? null,
          available_days: profile.available_days ?? [],
          available_times: profile.available_times ?? [],
          study_frequency: profile.study_frequency ?? null,
          study_duration: profile.study_duration ?? null,
        }
        setMyProfile(parsed)
        setForm(parsed)
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
        available_days: form.available_days?.length ? form.available_days : [],
        available_times: form.available_times?.length ? form.available_times : [],
        study_frequency: form.study_frequency || null,
        study_duration: form.study_duration || null,
      }

      const { error } = await supabase
        .from('study_profiles')
        .upsert(payload, { onConflict: 'user_id' })

      if (error) {
        console.error('[Study buddy] save error', error)
        setSaveError(error.message || 'Save failed. Please try again.')
        return
      }

      const saved: StudyProfile = { ...form, user_id: userId }
      setMyProfile(saved)
      setSaveSuccess(true)
      await loadDirectory(supabase, userId)
      setTimeout(() => setSaveSuccess(false), 4000)
    } catch (err) {
      setSaveError(err instanceof Error ? err.message : 'Save failed')
    } finally {
      setSaving(false)
    }
  }

  async function handleDeleteOwn() {
    if (!userId) return
    if (!confirm('Remove your study buddy profile? You can always create a new one later.')) return
    setDeleting(true)
    try {
      const supabase = createClient()
      const { error } = await supabase
        .from('study_profiles')
        .delete()
        .eq('user_id', userId)
      if (error) {
        alert(error.message || 'Could not delete profile')
        return
      }
      setMyProfile(null)
      setForm({ ...defaultProfile, user_id: userId })
    } catch {
      alert('Network error')
    } finally {
      setDeleting(false)
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
          Optionally share your availability and whether you&apos;re looking for a study buddy.
          You control what others see. Contact is direct (email) &ndash; we don&apos;t store messages.
        </p>
      </div>

      {/* My profile form */}
      <Card>
        <CardHeader>
          <CardTitle>My study profile</CardTitle>
          <CardDescription>All fields are optional. Only other registered users can see what you choose to show.</CardDescription>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSave} className="space-y-5">
            {/* Basic info */}
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

            {/* Availability */}
            <div className="border-t pt-4 space-y-4">
              <p className="text-sm font-medium">Availability</p>

              <div className="space-y-2">
                <Label className="text-sm text-muted-foreground">Days available</Label>
                <div className="flex flex-wrap gap-2">
                  {DAYS.map((day) => {
                    const checked = form.available_days?.includes(day.toLowerCase()) ?? false
                    return (
                      <label
                        key={day}
                        className={`flex cursor-pointer items-center rounded-md border px-3 py-1.5 text-sm transition-colors ${checked ? 'border-teal-500 bg-teal-50 text-teal-800 dark:bg-teal-950 dark:text-teal-200' : 'hover:bg-muted'}`}
                      >
                        <input
                          type="checkbox"
                          className="sr-only"
                          checked={checked}
                          onChange={() => setForm((f) => ({ ...f, available_days: toggleArrayItem(f.available_days ?? [], day.toLowerCase()) }))}
                        />
                        {day.slice(0, 3)}
                      </label>
                    )
                  })}
                </div>
              </div>

              <div className="space-y-2">
                <Label className="text-sm text-muted-foreground">Time preference</Label>
                <div className="flex gap-2">
                  {TIMES.map((time) => {
                    const checked = form.available_times?.includes(time) ?? false
                    return (
                      <label
                        key={time}
                        className={`flex cursor-pointer items-center rounded-md border px-4 py-1.5 text-sm transition-colors ${checked ? 'border-teal-500 bg-teal-50 text-teal-800 dark:bg-teal-950 dark:text-teal-200' : 'hover:bg-muted'}`}
                      >
                        <input
                          type="checkbox"
                          className="sr-only"
                          checked={checked}
                          onChange={() => setForm((f) => ({ ...f, available_times: toggleArrayItem(f.available_times ?? [], time) }))}
                        />
                        {time}
                      </label>
                    )
                  })}
                </div>
              </div>

              <div className="grid gap-4 sm:grid-cols-2">
                <div className="space-y-1.5">
                  <Label className="text-sm text-muted-foreground">How often</Label>
                  <select
                    className="w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                    value={form.study_frequency ?? ''}
                    onChange={(e) => setForm((f) => ({ ...f, study_frequency: e.target.value || null }))}
                  >
                    <option value="">Not specified</option>
                    {FREQUENCY_OPTIONS.map((opt) => (
                      <option key={opt} value={opt}>{opt}</option>
                    ))}
                  </select>
                </div>
                <div className="space-y-1.5">
                  <Label className="text-sm text-muted-foreground">For how long</Label>
                  <select
                    className="w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                    value={form.study_duration ?? ''}
                    onChange={(e) => setForm((f) => ({ ...f, study_duration: e.target.value || null }))}
                  >
                    <option value="">Not specified</option>
                    {DURATION_OPTIONS.map((opt) => (
                      <option key={opt} value={opt}>{opt}</option>
                    ))}
                  </select>
                </div>
              </div>
            </div>

            {/* Looking for buddy + visibility */}
            <div className="border-t pt-4 space-y-3">
              <div className="flex items-center space-x-2">
                <Checkbox
                  id="looking_for_study_buddy"
                  checked={form.looking_for_study_buddy ?? false}
                  onCheckedChange={(c) => setForm((f) => ({ ...f, looking_for_study_buddy: !!c }))}
                />
                <Label htmlFor="looking_for_study_buddy" className="font-medium">I&apos;m looking for a study buddy</Label>
              </div>

              <p className="text-sm text-muted-foreground">Visibility &ndash; tick to let others see</p>
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
                Profile saved successfully. Your listing is now visible below and to other users.
              </div>
            )}

            <Button type="submit" disabled={saving}>
              {saving ? 'Saving...' : 'Save profile'}
            </Button>
          </form>
        </CardContent>
      </Card>

      {/* Directory: own post + others */}
      <Card>
        <CardHeader>
          <CardTitle>Study buddy directory</CardTitle>
          <CardDescription>
            Everyone looking for a study buddy. Contact is direct via email &ndash; we don&apos;t store messages.
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-3">
          {/* Own post */}
          {myProfile?.looking_for_study_buddy && (
            <ProfileCard profile={myProfile} isOwn onDelete={deleting ? undefined : handleDeleteOwn} />
          )}

          {/* Other people */}
          {directory.map((p) => (
            <ProfileCard key={p.user_id} profile={p} />
          ))}

          {!myProfile?.looking_for_study_buddy && directory.length === 0 && (
            <p className="text-muted-foreground text-sm">
              No one has opted in yet. Save your profile with &quot;I&apos;m looking for a study buddy&quot; to appear here.
            </p>
          )}
        </CardContent>
      </Card>
    </div>
  )
}
