'use client'

import { useState, useEffect } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { wpbaRequirements, otherEvidence, type Requirement } from '@/lib/portfolio-requirements'
import { ExternalLink, Info } from 'lucide-react'

interface WPBATrackerProps {
  stage: 'st1' | 'st2' | 'st3'
  userName?: string
  trainingYear?: string
}

export default function WPBATracker({ stage, userName, trainingYear }: WPBATrackerProps) {
  const storageKey = `wpba-tracker-${stage}`
  const [tracking, setTracking] = useState<Record<string, { date?: string; number?: string }>>({})
  const [localUserName, setLocalUserName] = useState(userName || '')
  const [localTrainingYear, setLocalTrainingYear] = useState(trainingYear || '')

  // Load from localStorage on mount
  useEffect(() => {
    const saved = localStorage.getItem(storageKey)
    if (saved) {
      try {
        const parsed = JSON.parse(saved)
        setTracking(parsed.tracking || {})
        setLocalUserName(parsed.userName || '')
        setLocalTrainingYear(parsed.trainingYear || '')
      } catch (e) {
        console.error('Error loading saved data:', e)
      }
    }
  }, [storageKey])

  // Save to localStorage whenever tracking changes
  useEffect(() => {
    localStorage.setItem(storageKey, JSON.stringify({
      tracking,
      userName: localUserName,
      trainingYear: localTrainingYear
    }))
  }, [tracking, localUserName, localTrainingYear, storageKey])

  const updateTracking = (id: string, field: 'date' | 'number', value: string) => {
    setTracking(prev => ({
      ...prev,
      [id]: {
        ...prev[id],
        [field]: value
      }
    }))
  }

  const renderRequirementRow = (req: Requirement, category: 'wpba' | 'other') => {
    const detail = stage === 'st1' ? req.st1 : stage === 'st2' ? req.st2 : req.st3
    if (!detail) return null

    const trackingId = `${category}-${req.id}`
    const tracked = tracking[trackingId]

    return (
      <tr key={req.id} className="border-b hover:bg-muted/50">
        <td className="p-3">
          <div className="flex items-center gap-2">
            <span className="font-medium">{req.name}</span>
            {req.rcgpLink && (
              <a
                href={req.rcgpLink}
                target="_blank"
                rel="noopener noreferrer"
                className="text-primary hover:underline"
                onClick={(e) => {
                  // Warn user to save first
                  if (!confirm('Make sure you save your work first! Opening the RCGP website may close this page.')) {
                    e.preventDefault()
                  }
                }}
              >
                <ExternalLink className="h-3 w-3" />
              </a>
            )}
          </div>
          {detail.notes && (
            <div className="mt-1">
              <div className="flex items-start gap-1 text-xs text-muted-foreground">
                <Info className="h-3 w-3 mt-0.5 flex-shrink-0" />
                <span>{detail.notes}</span>
              </div>
            </div>
          )}
        </td>
        <td className="p-3">
          <div className="text-sm">{detail.requirement}</div>
        </td>
        <td className="p-3">
          <Input
            type="text"
            placeholder="Date/Number"
            value={tracked?.date || ''}
            onChange={(e) => updateTracking(trackingId, 'date', e.target.value)}
            className="w-full max-w-[150px]"
          />
        </td>
      </tr>
    )
  }

  return (
    <div className="space-y-6">
      {/* Header Info */}
      <Card>
        <CardHeader>
          <CardTitle>WPBA and Evidence Requirements Tracker</CardTitle>
          <CardDescription>
            Track your progress by adding numbers and dates next to each assessment. 
            Click the link icon next to each requirement to visit the relevant RCGP website section.
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="grid md:grid-cols-3 gap-4">
            <div>
              <label className="text-sm font-medium">Your name:</label>
              <Input
                type="text"
                placeholder="Enter your name"
                value={localUserName}
                onChange={(e) => setLocalUserName(e.target.value)}
                className="mt-1"
              />
            </div>
            <div>
              <label className="text-sm font-medium">Date:</label>
              <Input
                type="date"
                value={localTrainingYear}
                onChange={(e) => setLocalTrainingYear(e.target.value)}
                className="mt-1"
              />
            </div>
            <div>
              <label className="text-sm font-medium">Training Year:</label>
              <Input
                type="text"
                placeholder={stage.toUpperCase()}
                value={stage.toUpperCase()}
                disabled
                className="mt-1"
              />
            </div>
          </div>
        </CardContent>
      </Card>

      {/* WPBA Assessments */}
      <Card>
        <CardHeader>
          <CardTitle>WPBA Assessments</CardTitle>
          <CardDescription>
            Workplace-based assessments required for {stage.toUpperCase()}
          </CardDescription>
        </CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b bg-muted/50">
                  <th className="p-3 text-left font-semibold">Requirement</th>
                  <th className="p-3 text-left font-semibold">Requirement</th>
                  <th className="p-3 text-left font-semibold">Date/Number</th>
                </tr>
              </thead>
              <tbody>
                {wpbaRequirements.map(req => renderRequirementRow(req, 'wpba'))}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>

      {/* Quality Improvement */}
      <Card>
        <CardHeader>
          <CardTitle>Quality Improvement</CardTitle>
          <CardDescription>
            Involvement in Quality Improvement must be demonstrated each training year
          </CardDescription>
        </CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b bg-muted/50">
                  <th className="p-3 text-left font-semibold">Requirement</th>
                  <th className="p-3 text-left font-semibold">Requirement</th>
                  <th className="p-3 text-left font-semibold">Date/Number</th>
                </tr>
              </thead>
              <tbody>
                {otherEvidence
                  .filter(req => ['qip', 'lea', 'prescribing', 'leadership', 'significant-event'].includes(req.id))
                  .map(req => renderRequirementRow(req, 'other'))}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>

      {/* Other Evidence */}
      <Card>
        <CardHeader>
          <CardTitle>Other Evidence</CardTitle>
          <CardDescription>
            Additional evidence requirements for {stage.toUpperCase()}
          </CardDescription>
        </CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b bg-muted/50">
                  <th className="p-3 text-left font-semibold">Requirement</th>
                  <th className="p-3 text-left font-semibold">Requirement</th>
                  <th className="p-3 text-left font-semibold">Date/Number</th>
                </tr>
              </thead>
              <tbody>
                {otherEvidence
                  .filter(req => !['qip', 'lea', 'prescribing', 'leadership', 'significant-event'].includes(req.id))
                  .map(req => renderRequirementRow(req, 'other'))}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>

      {/* Important Notes */}
      <Card className="bg-blue-50 dark:bg-blue-950/20 border-blue-200">
        <CardHeader>
          <CardTitle className="text-blue-900 dark:text-blue-100">Important Notes</CardTitle>
        </CardHeader>
        <CardContent className="text-sm text-blue-800 dark:text-blue-200 space-y-2">
          <p>
            <strong>Assessments should be spread throughout the training year</strong> with roughly half being done in each review period.
          </p>
          <p>
            <strong>Less Than Full Time (LTFT) trainees:</strong> Expected to do the same total number in the full training year but pro-rata in each review period dependent on their percentage of time training. CPR&AED and Safeguarding knowledge update requirements are not pro rata, and evidence must be provided every 12 months. The ESR requirements are also not pro-rata and an ESR is also required every 6 months.
          </p>
          <p>
            <strong>Save your work:</strong> Make sure to save this document and your work first before clicking RCGP links, as opening a web page may close this document!
          </p>
        </CardContent>
      </Card>
    </div>
  )
}
