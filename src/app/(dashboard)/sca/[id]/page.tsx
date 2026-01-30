'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Progress } from '@/components/ui/progress'
import ReactMarkdown from 'react-markdown'

interface PatientInfo {
  age: number
  gender: string
  name?: string
  presenting_complaint?: string
  [key: string]: unknown
}

interface CaseNotes {
  patient?: string
  age?: number
  gender?: string
  pmh?: string
  medications?: string
  allergies?: string
  social_summary?: string
  family_summary?: string
  [key: string]: unknown
}

interface ActorInfo {
  opening_statement?: string
  freely_given_history?: {
    presenting_complaint?: string
    psychosocial_impact?: string
    ice?: {
      ideas?: string
      concerns?: string
      expectations?: string
    }
    [key: string]: unknown
  }
  history_on_direct_questioning?: {
    [key: string]: unknown
  }
}

interface MarkingCriteria {
  domain1?: { title: string; items: string[] }
  domain2?: { title: string; items: string[] }
  domain3?: { title: string; items: string[] }
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
  marking_criteria?: MarkingCriteria
  category?: string
  category_code?: string
  case_notes?: CaseNotes
  actor_info?: ActorInfo
  actor_behaviour?: string
}

// Default marking criteria if not provided in case data
const defaultMarkingCriteria: MarkingCriteria = {
  domain1: {
    title: 'Domain 1: Data Gathering & Interpretation',
    items: [
      'Established presenting complaint clearly',
      'Explored site, radiation, character, severity',
      'Asked about onset, duration, triggers',
      'Explored associated symptoms',
      'Obtained relevant past medical history',
      'Obtained drug history including allergies',
      'Obtained relevant social history',
      'Explored ideas, concerns, expectations (ICE)',
      'Performed/offered relevant examination',
      'Interpreted findings appropriately',
    ],
  },
  domain2: {
    title: 'Domain 2: Clinical Management (Weighted 1.5x)',
    items: [
      'Formulated appropriate differential diagnosis',
      'Considered red flags appropriately',
      'Made appropriate working diagnosis',
      'Discussed management plan clearly',
      'Prescribed appropriately (if needed)',
      'Arranged appropriate investigations',
      'Provided clear safety netting advice',
      'Arranged appropriate follow-up',
      'Considered referral if appropriate',
      'Documented/planned documentation',
    ],
  },
  domain3: {
    title: 'Domain 3: Interpersonal Skills',
    items: [
      'Demonstrated empathy and rapport',
      'Used appropriate language (no jargon)',
      'Listened actively to patient',
      'Addressed patient concerns sensitively',
      'Explained clearly and checked understanding',
      'Involved patient in decision-making',
      'Maintained professional boundaries',
      'Demonstrated cultural sensitivity',
    ],
  },
}

export default function SCACasePage({
  params,
}: {
  params: Promise<{ id: string }>
}) {
  const router = useRouter()
  const [caseData, setCaseData] = useState<SCACase | null>(null)
  const [loading, setLoading] = useState(true)
  const [phase, setPhase] = useState<'info' | 'practice' | 'review'>('info')
  const [showActorScript, setShowActorScript] = useState(false)
  const [timeLeft, setTimeLeft] = useState(0)
  const [isTimerPaused, setIsTimerPaused] = useState(false)
  const [notes, setNotes] = useState('')
  const [showAnswer, setShowAnswer] = useState(false)
  const [showAssessment, setShowAssessment] = useState(false)
  const [domain1Checks, setDomain1Checks] = useState<boolean[]>([])
  const [domain2Checks, setDomain2Checks] = useState<boolean[]>([])
  const [domain3Checks, setDomain3Checks] = useState<boolean[]>([])
  const [scoreCalculated, setScoreCalculated] = useState(false)

  useEffect(() => {
    async function loadCase() {
      const { id } = await params
      const supabase = createClient()
      const { data } = await supabase
        .from('sca_cases')
        .select('*')
        .eq('id', id)
        .single()

      if (data) {
        // Cast data to allow access to all optional fields
        const rawData = data as typeof data & { 
          marking_criteria?: unknown
          category?: string
          category_code?: string
          case_notes?: unknown
          actor_info?: unknown
          actor_behaviour?: string
        }
        const caseWithAllData: SCACase = {
          ...data,
          patient_info: data.patient_info as unknown as PatientInfo,
          marking_criteria: (rawData.marking_criteria as MarkingCriteria) || defaultMarkingCriteria,
          category: rawData.category,
          category_code: rawData.category_code,
          case_notes: rawData.case_notes as CaseNotes | undefined,
          actor_info: rawData.actor_info as ActorInfo | undefined,
          actor_behaviour: rawData.actor_behaviour
        }
        setCaseData(caseWithAllData)
        setTimeLeft(data.time_limit)
        
        // Initialize checkbox arrays
        const criteria = caseWithAllData.marking_criteria || defaultMarkingCriteria
        setDomain1Checks(new Array(criteria.domain1?.items.length || 0).fill(false))
        setDomain2Checks(new Array(criteria.domain2?.items.length || 0).fill(false))
        setDomain3Checks(new Array(criteria.domain3?.items.length || 0).fill(false))
      }
      setLoading(false)
    }
    loadCase()
  }, [params])

  useEffect(() => {
    if (phase !== 'practice' || timeLeft <= 0 || isTimerPaused) return

    const timer = setInterval(() => {
      setTimeLeft((t) => {
        if (t <= 1) {
          clearInterval(timer)
          setPhase('review')
          return 0
        }
        return t - 1
      })
    }, 1000)

    return () => clearInterval(timer)
  }, [phase, timeLeft, isTimerPaused])

  async function handleComplete() {
    if (!caseData) return

    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()

    if (user) {
      await supabase.from('user_progress').upsert({
        user_id: user.id,
        content_type: 'sca',
        content_id: caseData.id,
        completed: true,
        time_taken: caseData.time_limit - timeLeft,
      }, {
        onConflict: 'user_id,content_type,content_id'
      })
    }

    setPhase('review')
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <p className="text-muted-foreground">Loading case...</p>
      </div>
    )
  }

  if (!caseData) {
    return (
      <div className="text-center py-12">
        <p className="text-muted-foreground mb-4">Case not found</p>
        <Button onClick={() => router.push('/sca')}>Back to SCA</Button>
      </div>
    )
  }

  const formatTime = (seconds: number) => {
    const mins = Math.floor(seconds / 60)
    const secs = seconds % 60
    return `${mins}:${secs.toString().padStart(2, '0')}`
  }

  const timeProgress = (timeLeft / caseData.time_limit) * 100

  // Calculate domain scores
  const getDomainPoints = (checked: number, total: number) => {
    if (total === 0) return 0
    const percentage = (checked / total) * 100
    if (percentage >= 90) return 4 // Clear Pass
    if (percentage >= 70) return 3 // Pass
    if (percentage >= 50) return 2 // Fail
    if (percentage >= 30) return 1 // Clear Fail
    return 0
  }

  const getGradeInfo = (points: number) => {
    if (points === 4) return { grade: 'Clear Pass', class: 'bg-green-100 text-green-800 border-green-200' }
    if (points === 3) return { grade: 'Pass', class: 'bg-blue-100 text-blue-800 border-blue-200' }
    if (points === 2) return { grade: 'Borderline', class: 'bg-yellow-100 text-yellow-800 border-yellow-200' }
    if (points === 1) return { grade: 'Needs Work', class: 'bg-orange-100 text-orange-800 border-orange-200' }
    return { grade: 'Clear Fail', class: 'bg-red-100 text-red-800 border-red-200' }
  }

  const criteria = caseData?.marking_criteria || defaultMarkingCriteria
  const d1Checked = domain1Checks.filter(Boolean).length
  const d2Checked = domain2Checks.filter(Boolean).length
  const d3Checked = domain3Checks.filter(Boolean).length
  const d1Total = criteria.domain1?.items.length || 0
  const d2Total = criteria.domain2?.items.length || 0
  const d3Total = criteria.domain3?.items.length || 0

  const d1Points = getDomainPoints(d1Checked, d1Total)
  const d2Points = getDomainPoints(d2Checked, d2Total)
  const d3Points = getDomainPoints(d3Checked, d3Total)

  // Domain 2 is weighted 1.5x
  const weightedTotal = (d1Points * 1.0) + (d2Points * 1.5) + (d3Points * 1.0)
  const maxWeighted = 10.5

  const getOverallGrade = () => {
    if (weightedTotal > 9.0) return { grade: 'Clear Pass', class: 'bg-green-500 text-white', feedback: 'Excellent performance across all domains.' }
    if (weightedTotal >= 6.0) return { grade: 'Pass', class: 'bg-blue-500 text-white', feedback: 'Good performance. Review any unchecked items.' }
    if (weightedTotal >= 3.0) return { grade: 'Borderline', class: 'bg-yellow-500 text-white', feedback: 'Some areas need improvement before exam.' }
    return { grade: 'Needs Development', class: 'bg-red-500 text-white', feedback: 'Focus on the missed areas with additional practice.' }
  }

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <Button variant="ghost" onClick={() => router.push('/sca')}>
            ← Back to SCA
          </Button>
        </div>
        <div className="flex items-center gap-2">
          {caseData.category_code && (
            <Badge variant="outline" className="font-mono">{caseData.category_code}</Badge>
          )}
          {caseData.category && (
            <Badge className="bg-primary">{caseData.category}</Badge>
          )}
          <Badge variant={
            caseData.difficulty === 'easy' ? 'secondary' :
            caseData.difficulty === 'advanced' || caseData.difficulty === 'hard' ? 'destructive' : 'default'
          }>
            {caseData.difficulty}
          </Badge>
        </div>
      </div>

      <Card>
        <CardHeader>
          <CardTitle>{caseData.title}</CardTitle>
          <CardDescription>Time limit: {formatTime(caseData.time_limit)}</CardDescription>
        </CardHeader>
        <CardContent>
          {phase === 'info' && (
            <div className="space-y-6">
              {/* Doctor's Brief / Scenario */}
              <div className="bg-primary/5 border border-primary/20 p-4 rounded-lg">
                <h3 className="font-semibold text-primary mb-2">Doctor&apos;s Brief</h3>
                <div className="prose prose-sm dark:prose-invert">
                  <ReactMarkdown>{caseData.scenario}</ReactMarkdown>
                </div>
              </div>

              {/* Patient Information Card */}
              <div className="bg-muted p-4 rounded-lg">
                <h3 className="font-semibold mb-3">Patient Information</h3>
                <div className="grid grid-cols-2 md:grid-cols-3 gap-3 text-sm">
                  {caseData.patient_info.name && (
                    <div className="col-span-2 md:col-span-1">
                      <span className="text-muted-foreground">Name:</span>{' '}
                      <span className="font-medium">{caseData.patient_info.name}</span>
                    </div>
                  )}
                  <div>
                    <span className="text-muted-foreground">Age:</span>{' '}
                    <span className="font-medium">{caseData.patient_info.age}</span>
                  </div>
                  <div>
                    <span className="text-muted-foreground">Gender:</span>{' '}
                    <span className="font-medium">{caseData.patient_info.gender}</span>
                  </div>
                  {caseData.patient_info.presenting_complaint && (
                    <div className="col-span-2 md:col-span-3">
                      <span className="text-muted-foreground">Presenting:</span>{' '}
                      <span className="font-medium">{caseData.patient_info.presenting_complaint}</span>
                    </div>
                  )}
                </div>
              </div>

              {/* Case Notes - Expanded Medical Details */}
              {caseData.case_notes && (
                <div className="border rounded-lg p-4">
                  <h3 className="font-semibold mb-3">Case Notes</h3>
                  <div className="grid md:grid-cols-2 gap-3 text-sm">
                    {caseData.case_notes.pmh && (
                      <div>
                        <span className="text-muted-foreground font-medium">PMH:</span>{' '}
                        {caseData.case_notes.pmh}
                      </div>
                    )}
                    {caseData.case_notes.medications && (
                      <div>
                        <span className="text-muted-foreground font-medium">Medications:</span>{' '}
                        {caseData.case_notes.medications}
                      </div>
                    )}
                    {caseData.case_notes.allergies && (
                      <div>
                        <span className="text-muted-foreground font-medium">Allergies:</span>{' '}
                        {caseData.case_notes.allergies}
                      </div>
                    )}
                    {caseData.case_notes.social_summary && (
                      <div>
                        <span className="text-muted-foreground font-medium">Social:</span>{' '}
                        {caseData.case_notes.social_summary}
                      </div>
                    )}
                    {caseData.case_notes.family_summary && (
                      <div>
                        <span className="text-muted-foreground font-medium">Family:</span>{' '}
                        {caseData.case_notes.family_summary}
                      </div>
                    )}
                  </div>
                </div>
              )}

              {/* Actor Script - Collapsible so candidate doesn't see revealing info by default */}
              {caseData.actor_info && (
                <details className="border-2 border-amber-200 bg-amber-50 dark:bg-amber-950/20 dark:border-amber-800 rounded-lg overflow-hidden group">
                  <summary className="cursor-pointer p-4 font-semibold text-amber-800 dark:text-amber-200 list-none flex items-center justify-between gap-2 [&::-webkit-details-marker]:hidden">
                    <span className="flex items-center gap-2">
                      <span className="text-lg" aria-hidden>🎭</span>
                      Actor script (for roleplay partner only – may reveal case details)
                    </span>
                    <span className="text-sm font-normal text-amber-600 dark:text-amber-300 group-open:rotate-180 transition-transform inline-block">▼</span>
                  </summary>
                  <div className="px-4 pb-4 pt-0 border-t border-amber-200 dark:border-amber-800">
                    {/* Opening Statement */}
                    {caseData.actor_info.opening_statement && (
                      <div className="mb-4 mt-4">
                        <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-1">Opening Statement:</h4>
                        <p className="bg-white dark:bg-gray-900 p-3 rounded border italic">
                          &quot;{caseData.actor_info.opening_statement}&quot;
                        </p>
                      </div>
                    )}

                    {/* Freely Given History */}
                    {caseData.actor_info.freely_given_history && (
                      <div className="mb-4">
                        <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-2">Freely Given History:</h4>
                        <div className="bg-white dark:bg-gray-900 p-3 rounded border text-sm space-y-2">
                          {caseData.actor_info.freely_given_history.presenting_complaint && (
                            <p><strong>Presenting Complaint:</strong> {caseData.actor_info.freely_given_history.presenting_complaint}</p>
                          )}
                          {caseData.actor_info.freely_given_history.psychosocial_impact && (
                            <p><strong>Psychosocial Impact:</strong> {caseData.actor_info.freely_given_history.psychosocial_impact}</p>
                          )}
                          {caseData.actor_info.freely_given_history.ice && (
                            <div className="pt-2 border-t">
                              <strong>ICE:</strong>
                              <ul className="list-disc list-inside ml-2 mt-1">
                                {caseData.actor_info.freely_given_history.ice.ideas && (
                                  <li><span className="text-muted-foreground">Ideas:</span> {caseData.actor_info.freely_given_history.ice.ideas}</li>
                                )}
                                {caseData.actor_info.freely_given_history.ice.concerns && (
                                  <li><span className="text-muted-foreground">Concerns:</span> {caseData.actor_info.freely_given_history.ice.concerns}</li>
                                )}
                                {caseData.actor_info.freely_given_history.ice.expectations && (
                                  <li><span className="text-muted-foreground">Expectations:</span> {caseData.actor_info.freely_given_history.ice.expectations}</li>
                                )}
                              </ul>
                            </div>
                          )}
                        </div>
                      </div>
                    )}

                    {/* History on Direct Questioning */}
                    {caseData.actor_info.history_on_direct_questioning && (
                      <div className="mb-4">
                        <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-2">History on Direct Questioning:</h4>
                        <div className="bg-white dark:bg-gray-900 p-3 rounded border text-sm max-h-64 overflow-y-auto">
                          {Object.entries(caseData.actor_info.history_on_direct_questioning).map(([key, value]) => (
                            <div key={key} className="mb-3">
                              <h5 className="font-medium text-primary capitalize">{key.replace(/_/g, ' ')}</h5>
                              {typeof value === 'object' && value !== null ? (
                                <ul className="list-disc list-inside ml-2 text-muted-foreground">
                                  {Object.entries(value as Record<string, unknown>).map(([subKey, subValue]) => (
                                    <li key={subKey}>
                                      <span className="font-medium capitalize">{subKey.replace(/_/g, ' ')}:</span>{' '}
                                      {typeof subValue === 'string' ? subValue : JSON.stringify(subValue)}
                                    </li>
                                  ))}
                                </ul>
                              ) : (
                                <p className="text-muted-foreground ml-2">{String(value)}</p>
                              )}
                            </div>
                          ))}
                        </div>
                      </div>
                    )}

                    {/* Actor Behaviour Prompts */}
                    {caseData.actor_behaviour && (
                      <div>
                        <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-1">Actor Behaviour:</h4>
                        <p className="bg-amber-100 dark:bg-amber-900/30 p-3 rounded text-sm font-medium">
                          {caseData.actor_behaviour}
                        </p>
                      </div>
                    )}
                  </div>
                </details>
              )}

              {/* Start Practice Button */}
              <div className="flex justify-center pt-4">
                <Button size="lg" onClick={() => { setIsTimerPaused(false); setPhase('practice') }}>
                  Start Timed Practice
                </Button>
              </div>
            </div>
          )}

          {/* Minimal Patient Info for Practice/Review phases */}
          {phase !== 'info' && (
            <div className="bg-muted p-4 rounded-lg mb-6">
              <h3 className="font-semibold mb-2">Patient Information</h3>
              <div className="grid grid-cols-2 gap-2 text-sm">
                {caseData.patient_info.name && (
                  <div className="col-span-2"><span className="text-muted-foreground">Name:</span> {caseData.patient_info.name}</div>
                )}
                <div><span className="text-muted-foreground">Age:</span> {caseData.patient_info.age}</div>
                <div><span className="text-muted-foreground">Gender:</span> {caseData.patient_info.gender}</div>
                {caseData.patient_info.presenting_complaint && (
                  <div className="col-span-2">
                    <span className="text-muted-foreground">Presenting complaint:</span>{' '}
                    {caseData.patient_info.presenting_complaint}
                  </div>
                )}
              </div>
            </div>
          )}

          {phase === 'practice' && (
            <div className="space-y-6">
              {/* Timer - Fixed at top */}
              <div className="sticky top-0 z-10 bg-background/95 backdrop-blur py-3 border-b space-y-2">
                <div className="flex justify-between items-center">
                  <span className="font-medium">Time Remaining</span>
                  <span className={`text-2xl font-bold font-mono ${timeLeft < 60 ? 'text-destructive' : timeLeft < 120 ? 'text-amber-600' : 'text-primary'}`}>
                    {formatTime(timeLeft)}
                  </span>
                </div>
                <Progress
                  value={timeProgress}
                  className={`h-3 ${timeProgress < 25 ? '[&>div]:bg-destructive' : timeProgress < 50 ? '[&>div]:bg-amber-500' : ''}`}
                />
              </div>

              {/* Timer controls + Actor Script (full cases) */}
              <div className="flex flex-wrap gap-2 justify-between items-center">
                <div className="flex flex-wrap gap-2">
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={() => setIsTimerPaused(!isTimerPaused)}
                  >
                    {isTimerPaused ? 'Resume' : 'Pause'} timer
                  </Button>
                  <Button variant="outline" size="sm" onClick={() => setPhase('review')}>
                    End timer early
                  </Button>
                </div>
                {caseData.actor_info && (
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={() => setShowActorScript(!showActorScript)}
                  >
                    {showActorScript ? 'Hide' : 'Show'} Actor Script
                  </Button>
                )}
              </div>

              {/* Actor Script visible during practice */}
              {showActorScript && caseData.actor_info && (
                <div className="border-2 border-amber-200 bg-amber-50 dark:bg-amber-950/20 dark:border-amber-800 rounded-lg p-4">
                  <h3 className="font-semibold text-amber-800 dark:text-amber-200 mb-3">
                    🎭 Actor Script
                  </h3>
                  
                  {/* Opening Statement */}
                  {caseData.actor_info.opening_statement && (
                    <div className="mb-4">
                      <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-1">Opening Statement:</h4>
                      <p className="bg-white dark:bg-gray-900 p-3 rounded border italic">
                        &quot;{caseData.actor_info.opening_statement}&quot;
                      </p>
                    </div>
                  )}

                  {/* Freely Given History */}
                  {caseData.actor_info.freely_given_history && (
                    <details className="mb-4">
                      <summary className="cursor-pointer font-medium text-sm text-amber-700 dark:text-amber-300 mb-1">
                        Freely Given History (click to expand)
                      </summary>
                      <div className="bg-white dark:bg-gray-900 p-3 rounded border text-sm space-y-2 mt-2">
                        {caseData.actor_info.freely_given_history.presenting_complaint && (
                          <p><strong>Presenting Complaint:</strong> {caseData.actor_info.freely_given_history.presenting_complaint}</p>
                        )}
                        {caseData.actor_info.freely_given_history.psychosocial_impact && (
                          <p><strong>Psychosocial Impact:</strong> {caseData.actor_info.freely_given_history.psychosocial_impact}</p>
                        )}
                        {caseData.actor_info.freely_given_history.ice && (
                          <div className="pt-2 border-t">
                            <strong>ICE:</strong>
                            <ul className="list-disc list-inside ml-2 mt-1">
                              {caseData.actor_info.freely_given_history.ice.ideas && (
                                <li><span className="text-muted-foreground">Ideas:</span> {caseData.actor_info.freely_given_history.ice.ideas}</li>
                              )}
                              {caseData.actor_info.freely_given_history.ice.concerns && (
                                <li><span className="text-muted-foreground">Concerns:</span> {caseData.actor_info.freely_given_history.ice.concerns}</li>
                              )}
                              {caseData.actor_info.freely_given_history.ice.expectations && (
                                <li><span className="text-muted-foreground">Expectations:</span> {caseData.actor_info.freely_given_history.ice.expectations}</li>
                              )}
                            </ul>
                          </div>
                        )}
                      </div>
                    </details>
                  )}

                  {/* History on Direct Questioning */}
                  {caseData.actor_info.history_on_direct_questioning && (
                    <details className="mb-4">
                      <summary className="cursor-pointer font-medium text-sm text-amber-700 dark:text-amber-300 mb-1">
                        History on Direct Questioning (click to expand)
                      </summary>
                      <div className="bg-white dark:bg-gray-900 p-3 rounded border text-sm max-h-64 overflow-y-auto mt-2">
                        {Object.entries(caseData.actor_info.history_on_direct_questioning).map(([key, value]) => (
                          <div key={key} className="mb-3">
                            <h5 className="font-medium text-primary capitalize">{key.replace(/_/g, ' ')}</h5>
                            {typeof value === 'object' && value !== null ? (
                              <ul className="list-disc list-inside ml-2 text-muted-foreground">
                                {Object.entries(value as Record<string, unknown>).map(([subKey, subValue]) => (
                                  <li key={subKey}>
                                    <span className="font-medium capitalize">{subKey.replace(/_/g, ' ')}:</span>{' '}
                                    {typeof subValue === 'string' ? subValue : JSON.stringify(subValue)}
                                  </li>
                                ))}
                              </ul>
                            ) : (
                              <p className="text-muted-foreground ml-2">{String(value)}</p>
                            )}
                          </div>
                        ))}
                      </div>
                    </details>
                  )}

                  {/* Actor Behaviour */}
                  {caseData.actor_behaviour && (
                    <div>
                      <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-1">Actor Behaviour:</h4>
                      <p className="bg-amber-100 dark:bg-amber-900/30 p-3 rounded text-sm font-medium">
                        {caseData.actor_behaviour}
                      </p>
                    </div>
                  )}
                </div>
              )}

              {/* Basic case info if no actor script */}
              {showActorScript && !caseData.actor_info && (
                <div className="bg-muted p-4 rounded-lg">
                  <h3 className="font-semibold mb-2">Scenario</h3>
                  <div className="prose prose-sm dark:prose-invert">
                    <ReactMarkdown>{caseData.scenario}</ReactMarkdown>
                  </div>
                </div>
              )}

              {/* Patient Info Summary */}
              <div className="bg-muted/50 p-3 rounded-lg text-sm">
                <div className="flex flex-wrap gap-4">
                  {caseData.patient_info.name && <span><strong>Patient:</strong> {caseData.patient_info.name}</span>}
                  <span><strong>Age:</strong> {caseData.patient_info.age}</span>
                  <span><strong>Gender:</strong> {caseData.patient_info.gender}</span>
                </div>
              </div>

              {/* Notes section for priming cases */}
              {caseData.case_type === 'priming' && (
                <div className="space-y-2">
                  <label className="block text-sm font-medium">
                    Your Notes
                  </label>
                  <textarea
                    value={notes}
                    onChange={(e) => setNotes(e.target.value)}
                    className="w-full h-48 p-3 border rounded-md bg-background resize-none focus:outline-none focus:ring-2 focus:ring-ring"
                    placeholder="Use this space to plan your approach...&#10;&#10;• Key differentials&#10;• Questions to ask&#10;• Red flags to consider&#10;• Management plan ideas"
                  />
                </div>
              )}
            </div>
          )}

          {phase === 'review' && (
            <div className="space-y-6">
              {/* Time Summary */}
              <div className="bg-muted p-4 rounded-lg text-center">
                <p className="text-sm text-muted-foreground">Time Used</p>
                <p className="text-2xl font-bold">{formatTime(caseData.time_limit - timeLeft)}</p>
                <p className="text-xs text-muted-foreground">of {formatTime(caseData.time_limit)} allowed</p>
              </div>

              {/* PRIMING CASE REVIEW - Streamlined */}
              {caseData.case_type === 'priming' && (
                <>
                  {/* Show notes from priming exercise */}
                  {notes && (
                    <div>
                      <h3 className="font-semibold mb-2">Your Notes</h3>
                      <div className="bg-muted p-4 rounded-lg text-sm whitespace-pre-wrap">
                        {notes}
                      </div>
                    </div>
                  )}

                  {/* Integrated Priming Focus & Examiner's Lens */}
                  <div className="space-y-4">
                    <div className="bg-primary/5 border border-primary/20 rounded-lg p-5">
                      <h3 className="font-semibold text-primary mb-3">Priming Focus</h3>
                      <p className="text-sm text-muted-foreground mb-3">What you should have been thinking about during your 3 minutes:</p>
                      <ul className="space-y-2">
                        {caseData.key_points.map((point, i) => (
                          <li key={i} className="flex items-start gap-2 text-sm">
                            <span className="text-primary font-bold">•</span>
                            <span>{point}</span>
                          </li>
                        ))}
                      </ul>
                    </div>

                    <div className="bg-amber-50 dark:bg-amber-950/20 border border-amber-200 dark:border-amber-800 rounded-lg p-5">
                      <h3 className="font-semibold text-amber-800 dark:text-amber-200 mb-3">Examiner&apos;s Lens</h3>
                      <p className="text-sm text-muted-foreground mb-3">What the examiner is looking for in this case:</p>
                      <div className="prose prose-sm dark:prose-invert">
                        <ReactMarkdown>{caseData.model_answer}</ReactMarkdown>
                      </div>
                    </div>
                  </div>
                </>
              )}

              {/* FULL CASE REVIEW - With self-assessment */}
              {caseData.case_type === 'full' && (
                <>
                  <div>
                    <h3 className="font-semibold mb-2">Key Points to Cover</h3>
                    <ul className="list-disc list-inside space-y-1 text-sm">
                      {caseData.key_points.map((point, i) => (
                        <li key={i}>{point}</li>
                      ))}
                    </ul>
                  </div>

                  <div>
                    <Button
                      variant="outline"
                      onClick={() => setShowAnswer(!showAnswer)}
                      className="mb-2"
                    >
                      {showAnswer ? 'Hide' : 'Show'} Model Answer
                    </Button>
                    {showAnswer && (
                      <div className="prose prose-sm dark:prose-invert bg-muted p-4 rounded-lg">
                        <ReactMarkdown>{caseData.model_answer}</ReactMarkdown>
                      </div>
                    )}
                  </div>

                  {/* Self-Assessment Section - Only for full cases */}
                  <div className="border-t pt-6">
                    <Button
                      variant={showAssessment ? 'default' : 'outline'}
                      onClick={() => setShowAssessment(!showAssessment)}
                      className="mb-4"
                    >
                      {showAssessment ? 'Hide' : 'Show'} Self-Assessment Marking
                    </Button>

                    {showAssessment && (
                      <div className="space-y-6">
                        <p className="text-sm text-muted-foreground">
                          Tick the items you covered during your consultation. This uses the official SCA marking domains.
                        </p>

                        {/* Domain 1 */}
                        {criteria.domain1 && (
                          <div className="border rounded-lg p-4">
                            <h4 className="font-semibold text-primary mb-3">{criteria.domain1.title}</h4>
                            <div className="space-y-2">
                              {criteria.domain1.items.map((item, i) => (
                                <label key={i} className="flex items-start gap-3 cursor-pointer">
                                  <input
                                    type="checkbox"
                                    checked={domain1Checks[i] || false}
                                    onChange={(e) => {
                                      const newChecks = [...domain1Checks]
                                      newChecks[i] = e.target.checked
                                      setDomain1Checks(newChecks)
                                      setScoreCalculated(false)
                                    }}
                                    className="mt-1 h-4 w-4 rounded border-gray-300 text-primary focus:ring-primary"
                                  />
                                  <span className="text-sm">{item}</span>
                                </label>
                              ))}
                            </div>
                            <div className="mt-3 text-sm text-muted-foreground">
                              {d1Checked}/{d1Total} items checked
                            </div>
                          </div>
                        )}

                        {/* Domain 2 */}
                        {criteria.domain2 && (
                          <div className="border rounded-lg p-4">
                            <h4 className="font-semibold text-primary mb-3">{criteria.domain2.title}</h4>
                            <div className="space-y-2">
                              {criteria.domain2.items.map((item, i) => (
                                <label key={i} className="flex items-start gap-3 cursor-pointer">
                                  <input
                                    type="checkbox"
                                    checked={domain2Checks[i] || false}
                                    onChange={(e) => {
                                      const newChecks = [...domain2Checks]
                                      newChecks[i] = e.target.checked
                                      setDomain2Checks(newChecks)
                                      setScoreCalculated(false)
                                    }}
                                    className="mt-1 h-4 w-4 rounded border-gray-300 text-primary focus:ring-primary"
                                  />
                                  <span className="text-sm">{item}</span>
                                </label>
                              ))}
                            </div>
                            <div className="mt-3 text-sm text-muted-foreground">
                              {d2Checked}/{d2Total} items checked (weighted 1.5x)
                            </div>
                          </div>
                        )}

                        {/* Domain 3 */}
                        {criteria.domain3 && (
                          <div className="border rounded-lg p-4">
                            <h4 className="font-semibold text-primary mb-3">{criteria.domain3.title}</h4>
                            <div className="space-y-2">
                              {criteria.domain3.items.map((item, i) => (
                                <label key={i} className="flex items-start gap-3 cursor-pointer">
                                  <input
                                    type="checkbox"
                                    checked={domain3Checks[i] || false}
                                    onChange={(e) => {
                                      const newChecks = [...domain3Checks]
                                      newChecks[i] = e.target.checked
                                      setDomain3Checks(newChecks)
                                      setScoreCalculated(false)
                                    }}
                                    className="mt-1 h-4 w-4 rounded border-gray-300 text-primary focus:ring-primary"
                                  />
                                  <span className="text-sm">{item}</span>
                                </label>
                              ))}
                            </div>
                            <div className="mt-3 text-sm text-muted-foreground">
                              {d3Checked}/{d3Total} items checked
                            </div>
                          </div>
                        )}

                        {/* Calculate Score Button */}
                        <Button onClick={() => setScoreCalculated(true)} className="w-full">
                          Calculate My Score
                        </Button>

                        {/* Score Results */}
                        {scoreCalculated && (
                          <div className="space-y-4 border-t pt-4">
                            <h4 className="font-semibold text-lg">Your Results</h4>
                            
                            {/* Domain Scores */}
                            <div className="grid md:grid-cols-3 gap-3">
                              <div className={`p-3 rounded-lg border ${getGradeInfo(d1Points).class}`}>
                                <div className="text-xs font-medium opacity-80">Domain 1</div>
                                <div className="font-bold">{getGradeInfo(d1Points).grade}</div>
                                <div className="text-xs mt-1">{d1Points}/4 points</div>
                              </div>
                              <div className={`p-3 rounded-lg border ${getGradeInfo(d2Points).class}`}>
                                <div className="text-xs font-medium opacity-80">Domain 2 (1.5x)</div>
                                <div className="font-bold">{getGradeInfo(d2Points).grade}</div>
                                <div className="text-xs mt-1">{d2Points}/4 → {(d2Points * 1.5).toFixed(1)} pts</div>
                              </div>
                              <div className={`p-3 rounded-lg border ${getGradeInfo(d3Points).class}`}>
                                <div className="text-xs font-medium opacity-80">Domain 3</div>
                                <div className="font-bold">{getGradeInfo(d3Points).grade}</div>
                                <div className="text-xs mt-1">{d3Points}/4 points</div>
                              </div>
                            </div>

                            {/* Overall Score */}
                            <div className={`p-4 rounded-lg ${getOverallGrade().class}`}>
                              <div className="flex justify-between items-center">
                                <div>
                                  <div className="text-sm opacity-80">Overall Case Score</div>
                                  <div className="text-xl font-bold">{getOverallGrade().grade}</div>
                                </div>
                                <div className="text-right">
                                  <div className="text-2xl font-bold">{weightedTotal.toFixed(1)}/{maxWeighted}</div>
                                  <div className="text-xs opacity-80">weighted points</div>
                                </div>
                              </div>
                              <p className="text-sm mt-3 opacity-90">{getOverallGrade().feedback}</p>
                            </div>
                          </div>
                        )}
                      </div>
                    )}
                  </div>
                </>
              )}

              <div className="flex flex-wrap gap-3 justify-center pt-4">
                <Button onClick={() => router.push('/sca')} variant="outline">
                  Back to Cases
                </Button>
                {caseData.case_type === 'priming' && (
                  <Button onClick={() => router.push('/sca')}>
                    Try another priming case
                  </Button>
                )}
              </div>
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  )
}
