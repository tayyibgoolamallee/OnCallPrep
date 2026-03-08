'use client'

import { useState, useEffect } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'

type StudyProfile = {
  user_id: string
  display_name: string | null
  exam_date: string | null
  looking_for_study_buddy: boolean | null
  vts_or_area: string | null
  contact_email: string | null
  share_email_with_study_buddies: boolean | null
  show_exam_date: boolean | null
  show_looking_for_study_buddy: boolean | null
  show_vts_or_area: boolean | null
  available_days: string[] | null
  available_times: string[] | null
  study_frequency: string | null
  study_duration: string | null
  created_at: string | null
  updated_at: string | null
}

export default function AdminStudyBuddyPage() {
  const [profiles, setProfiles] = useState<StudyProfile[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [deleting, setDeleting] = useState<string | null>(null)

  async function loadProfiles() {
    setError(null)
    try {
      const res = await fetch('/api/admin/study-profiles')
      if (!res.ok) {
        setError('Failed to load profiles')
        return
      }
      const data = await res.json()
      setProfiles(data.profiles || [])
    } catch {
      setError('Network error')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => { loadProfiles() }, [])

  async function handleDelete(userId: string, name: string) {
    if (!confirm(`Delete study profile for "${name || userId}"? This cannot be undone.`)) return
    setDeleting(userId)
    try {
      const res = await fetch('/api/admin/study-profiles', {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ user_id: userId }),
      })
      if (!res.ok) {
        const data = await res.json()
        alert(data.error || 'Delete failed')
        return
      }
      setProfiles((prev) => prev.filter((p) => p.user_id !== userId))
    } catch {
      alert('Network error')
    } finally {
      setDeleting(null)
    }
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl font-bold">Study Buddy Profiles</h1>
        <p className="text-muted-foreground mt-1">
          View and moderate all study buddy profiles. Delete any that are inappropriate.
        </p>
      </div>

      {loading && <p className="text-muted-foreground">Loading...</p>}
      {error && <p className="text-destructive">{error}</p>}

      {!loading && profiles.length === 0 && (
        <p className="text-muted-foreground">No study buddy profiles yet.</p>
      )}

      {profiles.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle>All profiles ({profiles.length})</CardTitle>
            <CardDescription>Sorted by most recent. Delete removes the profile but not the user account.</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="divide-y">
              {profiles.map((p) => (
                <div key={p.user_id} className="flex flex-wrap items-start justify-between gap-4 py-4 first:pt-0 last:pb-0">
                  <div className="space-y-1 min-w-0 flex-1">
                    <div className="flex flex-wrap items-center gap-2">
                      <span className="font-medium">{p.display_name?.trim() || 'No name'}</span>
                      {p.looking_for_study_buddy && <Badge variant="secondary">Looking for buddy</Badge>}
                      {p.share_email_with_study_buddies && <Badge variant="outline" className="border-teal-500 text-teal-700">Sharing email</Badge>}
                    </div>
                    <div className="text-sm text-muted-foreground space-y-0.5">
                      {p.contact_email && <p>Email: {p.contact_email}</p>}
                      {p.vts_or_area && <p>Area: {p.vts_or_area}</p>}
                      {p.exam_date && <p>Exam: {new Date(p.exam_date).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' })}</p>}
                      {p.available_days?.length ? <p>Days: {p.available_days.map((d) => d.slice(0, 3)).join(', ')}</p> : null}
                      {p.available_times?.length ? <p>Times: {p.available_times.join(' / ')}</p> : null}
                      {p.study_frequency && <p>Frequency: {p.study_frequency}</p>}
                      {p.study_duration && <p>Duration: {p.study_duration}</p>}
                      <p className="text-xs">
                        ID: {p.user_id.slice(0, 8)}...
                        {p.created_at && <> &middot; Joined: {new Date(p.created_at).toLocaleDateString('en-GB')}</>}
                      </p>
                    </div>
                    <div className="flex flex-wrap gap-1 mt-1">
                      {p.show_exam_date && <Badge variant="outline" className="text-xs">Shows exam</Badge>}
                      {p.show_looking_for_study_buddy && <Badge variant="outline" className="text-xs">Shows buddy status</Badge>}
                      {p.show_vts_or_area && <Badge variant="outline" className="text-xs">Shows area</Badge>}
                    </div>
                  </div>
                  <Button
                    variant="destructive"
                    size="sm"
                    disabled={deleting === p.user_id}
                    onClick={() => handleDelete(p.user_id, p.display_name || '')}
                  >
                    {deleting === p.user_id ? 'Deleting...' : 'Delete'}
                  </Button>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  )
}
