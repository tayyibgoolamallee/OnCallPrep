'use client'

import { useState, useEffect, useCallback } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Progress } from '@/components/ui/progress'
import ReactMarkdown from 'react-markdown'

/* ------------------------------------------------------------------ */
/*  Types                                                              */
/* ------------------------------------------------------------------ */

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
  secondary_history?: {
    [key: string]: unknown
  }
  ice?: {
    ideas?: string
    concerns?: string
    expectations?: string
  }
  specific_prompts?: string
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

const VALID_DIFFICULTIES = ['easy', 'medium', 'hard', 'advanced'] as const
function normalizeDifficulty(diff: string | null | undefined): string {
  const d = (diff == null || typeof diff !== 'string') ? '' : String(diff).trim().toLowerCase()
  if (!d || d === 'intermediate') return 'medium'
  return VALID_DIFFICULTIES.includes(d as typeof VALID_DIFFICULTIES[number]) ? d : 'medium'
}

const PRIMING_SECONDS = 120

const defaultMarkingCriteria: MarkingCriteria = {
  domain1: {
    title: 'Domain 1: Data Gathering & Interpretation',
    items: [
      'Explored the presenting complaint in appropriate detail',
      'Gathered relevant secondary history (PMH, medications, allergies)',
      'Screened for relevant red flags',
      'Explored ideas, concerns, and expectations (ICE)',
      'Completed data gathering within approximately 6 minutes',
      'Summarised the clinical history clearly',
      'Maintained a comfortable pace throughout',
      'Consultation had clear direction and structure',
    ],
  },
  domain2: {
    title: 'Domain 2: Clinical Management (Weighted 1.5x)',
    items: [
      'Provided a provisional or suspected diagnosis',
      'Incorporated ICE into the management plan',
      'Offered specific and appropriate clinical management',
      'Provided opportunistic or promotional health advice where relevant',
      'Was mindful of holistic, social, or non-medical issues',
      'Demonstrated up-to-date clinical knowledge',
      'Used investigations appropriately and explained their relevance',
      'Made appropriate use of services (referral, A&G, community)',
      'Engaged the patient in shared decision-making',
      'Provided specific and clear safety-netting advice',
    ],
  },
  domain3: {
    title: 'Domain 3: Relating to Others',
    items: [
      'Was polite and respectful throughout',
      'Avoided inappropriate gestures, facial expressions, or remarks',
      'Signposted before asking sensitive questions',
      'Contextualised symptoms to the patient and diagnosis',
      'Allowed the patient to make their own decisions',
      'Asked the patient to confirm the plan and next steps',
    ],
  },
}

/* ------------------------------------------------------------------ */
/*  Helper: strip "You are a GP" variants from scenario text           */
/* ------------------------------------------------------------------ */
function cleanScenario(text: string): string {
  return text
    .replace(/You are a GP\.?\s*/gi, '')
    .replace(/You are a GP trainee[^.]*\.?\s*/gi, '')
    .replace(/You are a general practitioner[^.]*\.?\s*/gi, '')
    .trim()
}

/* ------------------------------------------------------------------ */
/*  Helper: render nested object as readable list                      */
/* ------------------------------------------------------------------ */
function RenderObject({ data }: { data: Record<string, unknown> }) {
  return (
    <div className="space-y-2">
      {Object.entries(data).map(([key, value]) => {
        if (value == null || value === '') return null
        const label = key.replace(/_/g, ' ').replace(/\b\w/g, (c) => c.toUpperCase())
        if (typeof value === 'object' && !Array.isArray(value)) {
          return (
            <div key={key}>
              <p className="font-medium text-sm">{label}</p>
              <div className="ml-3 border-l-2 border-amber-200 pl-3">
                <RenderObject data={value as Record<string, unknown>} />
              </div>
            </div>
          )
        }
        return (
          <p key={key} className="text-sm">
            <span className="font-medium">{label}:</span>{' '}
            {typeof value === 'string' ? value : JSON.stringify(value)}
          </p>
        )
      })}
    </div>
  )
}

/* ------------------------------------------------------------------ */
/*  Component                                                          */
/* ------------------------------------------------------------------ */

export default function SCACasePage({
  params,
}: {
  params: Promise<{ id: string }>
}) {
  const router = useRouter()
  const [caseData, setCaseData] = useState<SCACase | null>(null)
  const [loading, setLoading] = useState(true)
  const [phase, setPhase] = useState<'info' | 'priming' | 'practice' | 'review'>('info')
  const [showActorScript, setShowActorScript] = useState(false)

  // Timers
  const [primingTimeLeft, setPrimingTimeLeft] = useState(PRIMING_SECONDS)
  const [consultTimeLeft, setConsultTimeLeft] = useState(0)
  const [isTimerPaused, setIsTimerPaused] = useState(false)

  // Review
  const [reflectionNotes, setReflectionNotes] = useState('')
  const [showExplanation, setShowExplanation] = useState(false)
  const [showAssessment, setShowAssessment] = useState(false)
  const [domain1Checks, setDomain1Checks] = useState<boolean[]>([])
  const [domain2Checks, setDomain2Checks] = useState<boolean[]>([])
  const [domain3Checks, setDomain3Checks] = useState<boolean[]>([])
  const [scoreCalculated, setScoreCalculated] = useState(false)

  // Priming case extras
  const [loadingAnotherPriming, setLoadingAnotherPriming] = useState(false)
  const [primingNotes, setPrimingNotes] = useState('')

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
        const raw = data as typeof data & {
          marking_criteria?: unknown
          category?: string
          category_code?: string
          case_notes?: unknown
          actor_info?: unknown
          actor_behaviour?: string
        }
        const c: SCACase = {
          ...data,
          patient_info: data.patient_info as unknown as PatientInfo,
          marking_criteria: (raw.marking_criteria as MarkingCriteria) || defaultMarkingCriteria,
          category: raw.category,
          category_code: raw.category_code,
          case_notes: raw.case_notes as CaseNotes | undefined,
          actor_info: raw.actor_info as ActorInfo | undefined,
          actor_behaviour: raw.actor_behaviour,
        }
        setCaseData(c)
        setConsultTimeLeft(data.time_limit)

        const criteria = c.marking_criteria || defaultMarkingCriteria
        setDomain1Checks(new Array(criteria.domain1?.items.length || 0).fill(false))
        setDomain2Checks(new Array(criteria.domain2?.items.length || 0).fill(false))
        setDomain3Checks(new Array(criteria.domain3?.items.length || 0).fill(false))
      }
      setLoading(false)
    }
    loadCase()
  }, [params])

  // Priming timer
  useEffect(() => {
    if (phase !== 'priming' || primingTimeLeft <= 0 || isTimerPaused) return
    const t = setInterval(() => {
      setPrimingTimeLeft((v) => {
        if (v <= 1) {
          clearInterval(t)
          setPhase('practice')
          setIsTimerPaused(false)
          return 0
        }
        return v - 1
      })
    }, 1000)
    return () => clearInterval(t)
  }, [phase, primingTimeLeft, isTimerPaused])

  // Consultation timer
  useEffect(() => {
    if (phase !== 'practice' || consultTimeLeft <= 0 || isTimerPaused) return
    const t = setInterval(() => {
      setConsultTimeLeft((v) => {
        if (v <= 1) {
          clearInterval(t)
          handleComplete()
          return 0
        }
        return v - 1
      })
    }, 1000)
    return () => clearInterval(t)
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [phase, consultTimeLeft, isTimerPaused])

  const handleComplete = useCallback(async () => {
    if (!caseData) return
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (user) {
      await supabase.from('user_progress').upsert({
        user_id: user.id,
        content_type: 'sca',
        content_id: caseData.id,
        completed: true,
        time_taken: caseData.time_limit - consultTimeLeft,
      }, { onConflict: 'user_id,content_type,content_id' })
    }
    setPhase('review')
  }, [caseData, consultTimeLeft])

  async function handleTryAnotherPriming() {
    if (!caseData || caseData.case_type !== 'priming') return
    setLoadingAnotherPriming(true)
    try {
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      const { data: profile } = user
        ? await supabase.from('user_profiles').select('subscription_tier, pro_until').eq('id', user.id).single()
        : { data: null }
      const isPro = profile?.subscription_tier === 'pro' || (profile?.pro_until != null && new Date(profile.pro_until) > new Date())
      const { data: primingCases } = await supabase
        .from('sca_cases')
        .select('id, is_pro')
        .eq('case_type', 'priming')
        .eq('published', true)
      const accessible = (primingCases || []).filter(
        (c: { id: string; is_pro?: boolean | null }) => !c.is_pro || isPro
      ) as { id: string }[]
      const otherIds = accessible.map((c) => c.id).filter((id) => id !== caseData.id)
      if (otherIds.length > 0) {
        router.push(`/sca/${otherIds[Math.floor(Math.random() * otherIds.length)]}`)
        return
      }
      router.push('/sca')
    } finally {
      setLoadingAnotherPriming(false)
    }
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

  const criteria = caseData.marking_criteria || defaultMarkingCriteria
  const d1Checked = domain1Checks.filter(Boolean).length
  const d2Checked = domain2Checks.filter(Boolean).length
  const d3Checked = domain3Checks.filter(Boolean).length
  const d1Total = criteria.domain1?.items.length || 0
  const d2Total = criteria.domain2?.items.length || 0
  const d3Total = criteria.domain3?.items.length || 0

  const getDomainPoints = (checked: number, total: number) => {
    if (total === 0) return 0
    const pct = (checked / total) * 100
    if (pct >= 90) return 4
    if (pct >= 70) return 3
    if (pct >= 50) return 2
    if (pct >= 30) return 1
    return 0
  }

  const getGradeInfo = (points: number) => {
    if (points === 4) return { grade: 'Clear Pass', cls: 'bg-green-100 text-green-800 border-green-200' }
    if (points === 3) return { grade: 'Pass', cls: 'bg-blue-100 text-blue-800 border-blue-200' }
    if (points === 2) return { grade: 'Borderline', cls: 'bg-yellow-100 text-yellow-800 border-yellow-200' }
    if (points === 1) return { grade: 'Needs Work', cls: 'bg-orange-100 text-orange-800 border-orange-200' }
    return { grade: 'Clear Fail', cls: 'bg-red-100 text-red-800 border-red-200' }
  }

  const d1Points = getDomainPoints(d1Checked, d1Total)
  const d2Points = getDomainPoints(d2Checked, d2Total)
  const d3Points = getDomainPoints(d3Checked, d3Total)
  const weightedTotal = (d1Points * 1.0) + (d2Points * 1.5) + (d3Points * 1.0)
  const maxWeighted = 10.5

  const getOverallGrade = () => {
    if (weightedTotal > 9.0) return { grade: 'Clear Pass', cls: 'bg-green-500 text-white', feedback: 'Excellent performance across all domains.' }
    if (weightedTotal >= 6.0) return { grade: 'Pass', cls: 'bg-blue-500 text-white', feedback: 'Good performance. Review any unchecked items for improvement.' }
    if (weightedTotal >= 3.0) return { grade: 'Borderline', cls: 'bg-yellow-500 text-white', feedback: 'Some areas need improvement before the exam. Focus on missed items.' }
    return { grade: 'Needs Development', cls: 'bg-red-500 text-white', feedback: 'Focus on the missed areas with additional practice and reading.' }
  }

  // Extract ICE — may be top-level or nested inside freely_given_history
  const iceData = caseData.actor_info?.ice || caseData.actor_info?.freely_given_history?.ice

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <Button variant="ghost" onClick={() => router.push('/sca')}>← Back to SCA</Button>
        <div className="flex items-center gap-2">
          {caseData.category_code && <Badge variant="outline" className="font-mono">{caseData.category_code}</Badge>}
          {caseData.category && <Badge className="bg-primary">{caseData.category}</Badge>}
          <Badge
            variant={normalizeDifficulty(caseData.difficulty) === 'easy' ? 'secondary' : normalizeDifficulty(caseData.difficulty) === 'advanced' || normalizeDifficulty(caseData.difficulty) === 'hard' ? 'destructive' : 'default'}
            className={(normalizeDifficulty(caseData.difficulty) === 'hard' || normalizeDifficulty(caseData.difficulty) === 'advanced') ? 'bg-red-600 text-white border-red-600' : undefined}
          >
            {normalizeDifficulty(caseData.difficulty)}
          </Badge>
        </div>
      </div>

      <Card>
        <CardHeader>
          <CardTitle>{caseData.title}</CardTitle>
          <CardDescription>Time limit: {formatTime(caseData.time_limit)}</CardDescription>
        </CardHeader>
        <CardContent>

          {/* ============================================================ */}
          {/*  INFO PHASE                                                   */}
          {/* ============================================================ */}
          {phase === 'info' && (
            <div className="space-y-6">
              {/* Doctor's Brief */}
              <div className="bg-primary/5 border border-primary/20 p-4 rounded-lg">
                <h3 className="font-semibold text-primary mb-2">Doctor&apos;s Brief</h3>
                <div className="prose prose-sm dark:prose-invert">
                  <ReactMarkdown>{cleanScenario(caseData.scenario)}</ReactMarkdown>
                </div>
              </div>

              {/* Patient Information — name, age, gender only */}
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
                </div>
              </div>

              {/* Case Notes — PMH, medications, allergies only */}
              {caseData.case_notes && (
                <div className="border rounded-lg p-4">
                  <h3 className="font-semibold mb-3">Case Notes</h3>
                  <div className="grid md:grid-cols-2 gap-3 text-sm">
                    <div>
                      <span className="text-muted-foreground font-medium">PMH:</span>{' '}
                      {caseData.case_notes.pmh || 'None'}
                    </div>
                    <div>
                      <span className="text-muted-foreground font-medium">Medications:</span>{' '}
                      {caseData.case_notes.medications || 'None'}
                    </div>
                    <div>
                      <span className="text-muted-foreground font-medium">Allergies:</span>{' '}
                      {caseData.case_notes.allergies || 'None'}
                    </div>
                  </div>
                </div>
              )}

              {/* Actor Script — collapsible */}
              {caseData.actor_info && (
                <details className="border-2 border-amber-200 bg-amber-50 dark:bg-amber-950/20 dark:border-amber-800 rounded-lg overflow-hidden group">
                  <summary className="cursor-pointer p-4 font-semibold text-amber-800 dark:text-amber-200 list-none flex items-center justify-between gap-2 [&::-webkit-details-marker]:hidden">
                    <span className="flex items-center gap-2">
                      <span className="text-lg" aria-hidden>🎭</span>
                      Actor script (for roleplay partner only &ndash; may reveal case details)
                    </span>
                    <span className="text-sm font-normal text-amber-600 dark:text-amber-300 group-open:rotate-180 transition-transform inline-block">▼</span>
                  </summary>
                  <div className="px-4 pb-4 pt-0 border-t border-amber-200 dark:border-amber-800 space-y-4 mt-4">

                    {/* Opening Statement */}
                    {caseData.actor_info.opening_statement && (
                      <div>
                        <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-1">Opening Statement</h4>
                        <p className="bg-white dark:bg-gray-900 p-3 rounded border italic">
                          &quot;{caseData.actor_info.opening_statement}&quot;
                        </p>
                      </div>
                    )}

                    {/* Freely Given History */}
                    {caseData.actor_info.freely_given_history && (
                      <div>
                        <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-2">Freely Given History</h4>
                        <div className="bg-white dark:bg-gray-900 p-3 rounded border text-sm space-y-2">
                          {caseData.actor_info.freely_given_history.presenting_complaint && (
                            <p><strong>Presenting Complaint:</strong> {caseData.actor_info.freely_given_history.presenting_complaint}</p>
                          )}
                          {caseData.actor_info.freely_given_history.psychosocial_impact && (
                            <p><strong>Psychosocial Impact:</strong> {caseData.actor_info.freely_given_history.psychosocial_impact}</p>
                          )}
                          {Object.entries(caseData.actor_info.freely_given_history)
                            .filter(([k]) => !['presenting_complaint', 'psychosocial_impact', 'ice'].includes(k))
                            .map(([k, v]) => (
                              <p key={k}><strong>{k.replace(/_/g, ' ').replace(/\b\w/g, (c) => c.toUpperCase())}:</strong> {typeof v === 'string' ? v : JSON.stringify(v)}</p>
                            ))
                          }
                        </div>
                      </div>
                    )}

                    {/* History on Direct Questioning */}
                    {caseData.actor_info.history_on_direct_questioning && (
                      <div>
                        <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-2">History on Direct Questioning</h4>
                        <div className="bg-white dark:bg-gray-900 p-3 rounded border text-sm">
                          <RenderObject data={caseData.actor_info.history_on_direct_questioning as Record<string, unknown>} />
                        </div>
                      </div>
                    )}

                    {/* Secondary History */}
                    {caseData.actor_info.secondary_history && (
                      <div>
                        <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-2">Secondary History</h4>
                        <div className="bg-white dark:bg-gray-900 p-3 rounded border text-sm">
                          <RenderObject data={caseData.actor_info.secondary_history as Record<string, unknown>} />
                        </div>
                      </div>
                    )}

                    {/* ICE — separate highlighted box */}
                    {iceData && (
                      <div>
                        <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-2">ICE (Ideas, Concerns, Expectations)</h4>
                        <div className="bg-teal-50 dark:bg-teal-950/30 border border-teal-200 dark:border-teal-800 p-3 rounded text-sm space-y-1">
                          {iceData.ideas && <p><strong>Ideas:</strong> {iceData.ideas}</p>}
                          {iceData.concerns && <p><strong>Concerns:</strong> {iceData.concerns}</p>}
                          {iceData.expectations && <p><strong>Expectations:</strong> {iceData.expectations}</p>}
                        </div>
                      </div>
                    )}

                    {/* Actor Behaviour */}
                    {caseData.actor_behaviour && (
                      <div>
                        <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-1">Actor Behaviour</h4>
                        <p className="bg-amber-100 dark:bg-amber-900/30 p-3 rounded text-sm">
                          {caseData.actor_behaviour}
                        </p>
                      </div>
                    )}

                    {/* Specific Prompts */}
                    {caseData.actor_info.specific_prompts && (
                      <div>
                        <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-1">Specific Prompts</h4>
                        <p className="bg-amber-100 dark:bg-amber-900/30 p-3 rounded text-sm italic">
                          {caseData.actor_info.specific_prompts}
                        </p>
                      </div>
                    )}
                  </div>
                </details>
              )}

              {/* Start buttons */}
              <div className="flex flex-col items-center gap-3 pt-4">
                {caseData.case_type === 'full' && (
                  <>
                    <Button size="lg" onClick={() => { setIsTimerPaused(false); setPhase('priming') }}>
                      Start with 2-Minute Priming
                    </Button>
                    <Button size="lg" variant="outline" onClick={() => { setIsTimerPaused(false); setPhase('practice') }}>
                      Skip Priming &ndash; Start 12-Minute Consultation
                    </Button>
                  </>
                )}
                {caseData.case_type === 'priming' && (
                  <Button size="lg" onClick={() => { setIsTimerPaused(false); setPhase('practice') }}>
                    Start Timed Practice
                  </Button>
                )}
                {caseData.case_type !== 'full' && caseData.case_type !== 'priming' && (
                  <Button size="lg" onClick={() => { setIsTimerPaused(false); setPhase('practice') }}>
                    Start Timed Practice
                  </Button>
                )}
              </div>
            </div>
          )}

          {/* ============================================================ */}
          {/*  PRIMING PHASE (2-minute reading time)                       */}
          {/* ============================================================ */}
          {phase === 'priming' && (
            <div className="space-y-6">
              <div className="sticky top-0 z-10 py-4 px-4 rounded-lg border-2 border-blue-200 dark:border-blue-800 bg-blue-50/50 dark:bg-blue-950/20 space-y-2">
                <div className="flex justify-between items-center">
                  <span className="font-medium text-slate-700 dark:text-slate-300">Priming Time &ndash; Read and Plan</span>
                  <span className={`text-2xl font-bold font-mono ${primingTimeLeft < 30 ? 'text-amber-600' : 'text-blue-600 dark:text-blue-400'}`}>
                    {formatTime(primingTimeLeft)}
                  </span>
                </div>
                <Progress
                  value={(primingTimeLeft / PRIMING_SECONDS) * 100}
                  className={`h-3 ${primingTimeLeft < 30 ? '[&>div]:bg-amber-500' : '[&>div]:bg-blue-500'}`}
                />
                <p className="text-xs text-muted-foreground">Use this time to review the case information and plan your approach. The consultation timer will start automatically.</p>
              </div>

              <div className="flex gap-2">
                <Button variant="outline" size="sm" onClick={() => setIsTimerPaused(!isTimerPaused)}>
                  {isTimerPaused ? 'Resume' : 'Pause'}
                </Button>
                <Button variant="outline" size="sm" onClick={() => { setPhase('practice'); setIsTimerPaused(false) }}>
                  Skip &ndash; Start Consultation Now
                </Button>
              </div>

              {/* Show brief + patient info during priming */}
              <div className="bg-primary/5 border border-primary/20 p-4 rounded-lg">
                <h3 className="font-semibold text-primary mb-2">Doctor&apos;s Brief</h3>
                <div className="prose prose-sm dark:prose-invert">
                  <ReactMarkdown>{cleanScenario(caseData.scenario)}</ReactMarkdown>
                </div>
              </div>

              <div className="bg-muted p-4 rounded-lg">
                <h3 className="font-semibold mb-2">Patient Information</h3>
                <div className="flex flex-wrap gap-4 text-sm">
                  {caseData.patient_info.name && <span><strong>Name:</strong> {caseData.patient_info.name}</span>}
                  <span><strong>Age:</strong> {caseData.patient_info.age}</span>
                  <span><strong>Gender:</strong> {caseData.patient_info.gender}</span>
                </div>
              </div>

              {caseData.case_notes && (
                <div className="border rounded-lg p-4">
                  <h3 className="font-semibold mb-2">Case Notes</h3>
                  <div className="grid md:grid-cols-2 gap-2 text-sm">
                    <div><span className="text-muted-foreground font-medium">PMH:</span> {caseData.case_notes.pmh || 'None'}</div>
                    <div><span className="text-muted-foreground font-medium">Medications:</span> {caseData.case_notes.medications || 'None'}</div>
                    <div><span className="text-muted-foreground font-medium">Allergies:</span> {caseData.case_notes.allergies || 'None'}</div>
                  </div>
                </div>
              )}
            </div>
          )}

          {/* ============================================================ */}
          {/*  PRACTICE PHASE (12-minute consultation)                     */}
          {/* ============================================================ */}
          {phase === 'practice' && (
            <div className="space-y-6">
              {/* Timer */}
              <div className="sticky top-0 z-10 py-4 px-4 rounded-lg border-2 border-teal-200 dark:border-teal-800 bg-teal-50/50 dark:bg-teal-950/20 space-y-2">
                <div className="flex justify-between items-center">
                  <span className="font-medium text-slate-700 dark:text-slate-300">Consultation Time</span>
                  <span className={`text-2xl font-bold font-mono ${consultTimeLeft < 60 ? 'text-destructive' : consultTimeLeft < 120 ? 'text-amber-600' : 'text-teal-600 dark:text-teal-400'}`}>
                    {formatTime(consultTimeLeft)}
                  </span>
                </div>
                <Progress
                  value={(consultTimeLeft / caseData.time_limit) * 100}
                  className={`h-3 ${consultTimeLeft / caseData.time_limit < 0.25 ? '[&>div]:bg-destructive' : consultTimeLeft / caseData.time_limit < 0.5 ? '[&>div]:bg-amber-500' : '[&>div]:bg-teal-500'}`}
                />
              </div>

              {/* Controls */}
              <div className="flex flex-wrap gap-2 justify-between items-center">
                <div className="flex flex-wrap gap-2">
                  <Button variant="outline" size="sm" onClick={() => setIsTimerPaused(!isTimerPaused)}>
                    {isTimerPaused ? 'Resume' : 'Pause'} timer
                  </Button>
                  <Button variant="outline" size="sm" onClick={() => { handleComplete() }}>
                    End consultation
                  </Button>
                </div>
                {caseData.actor_info && (
                  <Button variant="outline" size="sm" onClick={() => setShowActorScript(!showActorScript)}>
                    {showActorScript ? 'Hide' : 'Show'} Actor Script
                  </Button>
                )}
              </div>

              {/* Actor Script during practice */}
              {showActorScript && caseData.actor_info && (
                <div className="border-2 border-amber-200 bg-amber-50 dark:bg-amber-950/20 dark:border-amber-800 rounded-lg p-4 space-y-4">
                  <h3 className="font-semibold text-amber-800 dark:text-amber-200">🎭 Actor Script</h3>

                  {caseData.actor_info.opening_statement && (
                    <div>
                      <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-1">Opening Statement</h4>
                      <p className="bg-white dark:bg-gray-900 p-3 rounded border italic">&quot;{caseData.actor_info.opening_statement}&quot;</p>
                    </div>
                  )}

                  {caseData.actor_info.freely_given_history && (
                    <details>
                      <summary className="cursor-pointer font-medium text-sm text-amber-700 dark:text-amber-300">Freely Given History</summary>
                      <div className="bg-white dark:bg-gray-900 p-3 rounded border text-sm space-y-2 mt-2">
                        {caseData.actor_info.freely_given_history.presenting_complaint && (
                          <p><strong>Presenting Complaint:</strong> {caseData.actor_info.freely_given_history.presenting_complaint}</p>
                        )}
                        {caseData.actor_info.freely_given_history.psychosocial_impact && (
                          <p><strong>Psychosocial Impact:</strong> {caseData.actor_info.freely_given_history.psychosocial_impact}</p>
                        )}
                      </div>
                    </details>
                  )}

                  {caseData.actor_info.history_on_direct_questioning && (
                    <details>
                      <summary className="cursor-pointer font-medium text-sm text-amber-700 dark:text-amber-300">History on Direct Questioning</summary>
                      <div className="bg-white dark:bg-gray-900 p-3 rounded border text-sm mt-2">
                        <RenderObject data={caseData.actor_info.history_on_direct_questioning as Record<string, unknown>} />
                      </div>
                    </details>
                  )}

                  {iceData && (
                    <div className="bg-teal-50 dark:bg-teal-950/30 border border-teal-200 dark:border-teal-800 p-3 rounded text-sm space-y-1">
                      <h4 className="font-medium text-teal-700 dark:text-teal-300">ICE</h4>
                      {iceData.ideas && <p><strong>Ideas:</strong> {iceData.ideas}</p>}
                      {iceData.concerns && <p><strong>Concerns:</strong> {iceData.concerns}</p>}
                      {iceData.expectations && <p><strong>Expectations:</strong> {iceData.expectations}</p>}
                    </div>
                  )}

                  {caseData.actor_behaviour && (
                    <div>
                      <h4 className="font-medium text-sm text-amber-700 dark:text-amber-300 mb-1">Actor Behaviour</h4>
                      <p className="bg-amber-100 dark:bg-amber-900/30 p-3 rounded text-sm">{caseData.actor_behaviour}</p>
                    </div>
                  )}
                </div>
              )}

              {/* Minimal patient info during practice */}
              <div className="bg-muted/50 p-3 rounded-lg text-sm">
                <div className="flex flex-wrap gap-4">
                  {caseData.patient_info.name && <span><strong>Patient:</strong> {caseData.patient_info.name}</span>}
                  <span><strong>Age:</strong> {caseData.patient_info.age}</span>
                  <span><strong>Gender:</strong> {caseData.patient_info.gender}</span>
                </div>
              </div>

              {/* Notes for priming cases */}
              {caseData.case_type === 'priming' && (
                <div className="space-y-2">
                  <label className="block text-sm font-medium">Your Notes</label>
                  <textarea
                    value={primingNotes}
                    onChange={(e) => setPrimingNotes(e.target.value)}
                    className="w-full h-48 p-3 border rounded-md bg-background resize-none focus:outline-none focus:ring-2 focus:ring-ring"
                    placeholder={"Use this space to plan your approach...\n\n• Key differentials\n• Questions to ask\n• Red flags to consider\n• Management plan ideas"}
                  />
                </div>
              )}
            </div>
          )}

          {/* ============================================================ */}
          {/*  REVIEW PHASE                                                */}
          {/* ============================================================ */}
          {phase === 'review' && (
            <div className="space-y-6">
              {/* Time summary */}
              <div className="bg-muted p-4 rounded-lg text-center">
                <p className="text-sm text-muted-foreground">Time Used</p>
                <p className="text-2xl font-bold">{formatTime(caseData.time_limit - consultTimeLeft)}</p>
                <p className="text-xs text-muted-foreground">of {formatTime(caseData.time_limit)} allowed</p>
              </div>

              {/* ---- PRIMING CASE REVIEW ---- */}
              {caseData.case_type === 'priming' && (
                <>
                  {primingNotes && (
                    <div>
                      <h3 className="font-semibold mb-2">Your Notes</h3>
                      <div className="bg-muted p-4 rounded-lg text-sm whitespace-pre-wrap">{primingNotes}</div>
                    </div>
                  )}
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
                      <div className="prose prose-sm dark:prose-invert">
                        <ReactMarkdown>{caseData.model_answer}</ReactMarkdown>
                      </div>
                    </div>
                  </div>
                </>
              )}

              {/* ---- FULL CASE REVIEW ---- */}
              {caseData.case_type === 'full' && (
                <>
                  {/* Self-reflection prompt */}
                  <div className="border-2 border-blue-200 dark:border-blue-800 bg-blue-50/30 dark:bg-blue-950/20 rounded-lg p-5 space-y-3">
                    <h3 className="font-semibold text-blue-800 dark:text-blue-200">Self-Reflection</h3>
                    <p className="text-sm text-muted-foreground">
                      Before reviewing the model answer, take a moment to reflect. What went well? What could you have done better? What would you change next time?
                    </p>
                    <textarea
                      value={reflectionNotes}
                      onChange={(e) => setReflectionNotes(e.target.value)}
                      className="w-full h-32 p-3 border rounded-md bg-background resize-none focus:outline-none focus:ring-2 focus:ring-ring text-sm"
                      placeholder={"What went well in this consultation?\n\nWhat could you improve?\n\nWhat would you do differently next time?"}
                    />
                  </div>

                  {/* Key Points */}
                  <div>
                    <h3 className="font-semibold mb-2">Key Points to Cover</h3>
                    <ul className="list-disc list-inside space-y-1 text-sm">
                      {caseData.key_points.map((point, i) => (
                        <li key={i}>{point}</li>
                      ))}
                    </ul>
                  </div>

                  {/* Model Answer / Case Explanation */}
                  <div>
                    <Button variant="outline" onClick={() => setShowExplanation(!showExplanation)} className="mb-3">
                      {showExplanation ? 'Hide' : 'Show'} Case Explanation
                    </Button>
                    {showExplanation && (
                      <div className="prose prose-sm dark:prose-invert bg-muted p-5 rounded-lg">
                        <ReactMarkdown>{caseData.model_answer}</ReactMarkdown>
                      </div>
                    )}
                  </div>

                  {/* Self-Assessment Marking */}
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
                                      const c = [...domain1Checks]; c[i] = e.target.checked
                                      setDomain1Checks(c); setScoreCalculated(false)
                                    }}
                                    className="mt-1 h-4 w-4 rounded border-gray-300 text-primary focus:ring-primary"
                                  />
                                  <span className="text-sm">{item}</span>
                                </label>
                              ))}
                            </div>
                            <p className="mt-3 text-sm text-muted-foreground">{d1Checked}/{d1Total} items checked</p>
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
                                      const c = [...domain2Checks]; c[i] = e.target.checked
                                      setDomain2Checks(c); setScoreCalculated(false)
                                    }}
                                    className="mt-1 h-4 w-4 rounded border-gray-300 text-primary focus:ring-primary"
                                  />
                                  <span className="text-sm">{item}</span>
                                </label>
                              ))}
                            </div>
                            <p className="mt-3 text-sm text-muted-foreground">{d2Checked}/{d2Total} items checked (weighted 1.5x)</p>
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
                                      const c = [...domain3Checks]; c[i] = e.target.checked
                                      setDomain3Checks(c); setScoreCalculated(false)
                                    }}
                                    className="mt-1 h-4 w-4 rounded border-gray-300 text-primary focus:ring-primary"
                                  />
                                  <span className="text-sm">{item}</span>
                                </label>
                              ))}
                            </div>
                            <p className="mt-3 text-sm text-muted-foreground">{d3Checked}/{d3Total} items checked</p>
                          </div>
                        )}

                        <Button onClick={() => setScoreCalculated(true)} className="w-full">Calculate My Score</Button>

                        {scoreCalculated && (
                          <div className="space-y-4 border-t pt-4">
                            <h4 className="font-semibold text-lg">Your Results</h4>
                            <div className="grid md:grid-cols-3 gap-3">
                              <div className={`p-3 rounded-lg border ${getGradeInfo(d1Points).cls}`}>
                                <div className="text-xs font-medium opacity-80">Domain 1</div>
                                <div className="font-bold">{getGradeInfo(d1Points).grade}</div>
                                <div className="text-xs mt-1">{d1Points}/4 points</div>
                              </div>
                              <div className={`p-3 rounded-lg border ${getGradeInfo(d2Points).cls}`}>
                                <div className="text-xs font-medium opacity-80">Domain 2 (1.5x)</div>
                                <div className="font-bold">{getGradeInfo(d2Points).grade}</div>
                                <div className="text-xs mt-1">{d2Points}/4 → {(d2Points * 1.5).toFixed(1)} pts</div>
                              </div>
                              <div className={`p-3 rounded-lg border ${getGradeInfo(d3Points).cls}`}>
                                <div className="text-xs font-medium opacity-80">Domain 3</div>
                                <div className="font-bold">{getGradeInfo(d3Points).grade}</div>
                                <div className="text-xs mt-1">{d3Points}/4 points</div>
                              </div>
                            </div>
                            <div className={`p-4 rounded-lg ${getOverallGrade().cls}`}>
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

              {/* Navigation */}
              <div className="flex flex-wrap gap-3 justify-center pt-4">
                <Button onClick={() => router.push('/sca')} variant="outline">Back to Cases</Button>
                {caseData.case_type === 'priming' && (
                  <Button onClick={handleTryAnotherPriming} disabled={loadingAnotherPriming}>
                    {loadingAnotherPriming ? 'Loading...' : 'Try another priming case'}
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
