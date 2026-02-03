import Link from 'next/link'
import { notFound } from 'next/navigation'
import { createClient } from '@/lib/supabase/server'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import ReactMarkdown from 'react-markdown'
import { stageInfo, wpbaRequirements, otherEvidence } from '@/lib/portfolio-requirements'

const stageNames: Record<string, string> = {
  st1: stageInfo.st1.fullName,
  st2: stageInfo.st2.fullName,
  st3: stageInfo.st3.fullName,
}

const stageDescriptions: Record<string, string> = {
  st1: stageInfo.st1.description,
  st2: stageInfo.st2.description,
  st3: stageInfo.st3.description,
}

const keyPointsText =
  'Assessments should be spread throughout each training year with roughly half completed in each 6‑month review period. Less Than Full Time (LTFT) trainees complete the same total number pro‑rata. CPR&AED and Safeguarding knowledge updates are required every 12 months (not pro‑rata).'

const importantNotes: Record<string, string[]> = {
  st1: [
    'Spread assessments steadily across the year (usually every 4–6 months depending on your programme).',
    'If you are LTFT, review periods are the same length but numbers are pro‑rata.',
  ],
  st2: [
    'Keep WPBAs spread across posts – avoid a last‑minute rush before ARCP.',
    'Build a pattern of regular reflections linked to curriculum capabilities.',
  ],
  st3: [
    'Plan remaining assessments early in the year so nothing is left just before CCT.',
    'Use WPBAs to evidence readiness for independent practice, not just minimum numbers.',
  ],
}

const categories = [
  { id: 'checklist', name: 'Checklists', icon: '✓' },
  { id: 'reflection', name: 'Reflective Writing', icon: '📝' },
  { id: 'consultation', name: 'Consultation Models', icon: '💬' },
  { id: 'competency', name: 'Competency Guides', icon: '🎯' },
]

export default async function PortfolioStagePage({
  params,
}: {
  params: Promise<{ stage: string }>
}) {
  const { stage } = await params

  if (!['st1', 'st2', 'st3'].includes(stage)) {
    notFound()
  }

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: guides } = await supabase
    .from('portfolio_guides')
    .select('*')
    .eq('stage', stage)
    .eq('published', true)
    .order('sort_order')

  const { data: progress } = await supabase
    .from('user_progress')
    .select('*')
    .eq('user_id', user!.id)
    .eq('content_type', 'portfolio')

  const { data: profile } = await supabase
    .from('user_profiles')
    .select('subscription_tier, pro_until')
    .eq('id', user!.id)
    .single()

  const isPro = profile?.subscription_tier === 'pro' || (profile?.pro_until != null && new Date(profile.pro_until) > new Date())
  const completedIds = new Set(progress?.filter(p => p.completed).map(p => p.content_id))

  const stageKey = stage as 'st1' | 'st2' | 'st3'

  const wpbaForStage = wpbaRequirements
    .map((req) => {
      const detail = req[stageKey]
      if (!detail) return null
      return {
        id: req.id,
        name: req.name,
        requirement: detail.requirement,
      }
    })
    .filter(Boolean) as { id: string; name: string; requirement: string }[]

  const otherEvidenceForStage = otherEvidence
    .map((req) => {
      const detail = req[stageKey]
      if (!detail) return null
      return {
        id: req.id,
        name: req.name,
        requirement: detail.requirement,
      }
    })
    .filter(Boolean) as { id: string; name: string; requirement: string }[]

  return (
    <div className="space-y-8">
      <div className="flex items-center gap-4">
        <Link href="/portfolio">
          <Button variant="ghost" size="sm">← Back</Button>
        </Link>
        <div>
          <h1 className="text-3xl font-bold">{stageNames[stage]}</h1>
          <p className="text-muted-foreground">Portfolio requirements and guides</p>
        </div>
      </div>

      {/* Stage overview – simple flow to conceptualise the year */}
      <Card className="border-2 border-slate-200 dark:border-slate-700">
        <CardHeader>
          <CardTitle>Overview for {stageNames[stage]}</CardTitle>
          <CardDescription>{stageDescriptions[stage]}</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="flex flex-col md:flex-row md:items-stretch gap-3">
            <div className="flex-1 p-3 rounded-lg bg-slate-50 dark:bg-slate-900/40 border border-slate-200 dark:border-slate-700">
              <h3 className="font-semibold text-sm mb-1">Start of year</h3>
              <p className="text-xs text-muted-foreground">
                Meet your supervisor, plan posts, and map required WPBAs and learning logs.
              </p>
            </div>
            <div className="hidden md:flex items-center justify-center text-slate-400 text-2xl">
              →
            </div>
            <div className="flex-1 p-3 rounded-lg bg-slate-50 dark:bg-slate-900/40 border border-slate-200 dark:border-slate-700">
              <h3 className="font-semibold text-sm mb-1">Mid‑year</h3>
              <p className="text-xs text-muted-foreground">
                Continue WPBAs, add reflections, and check curriculum coverage against the capabilities.
              </p>
            </div>
            <div className="hidden md:flex items-center justify-center text-slate-400 text-2xl">
              →
            </div>
            <div className="flex-1 p-3 rounded-lg bg-slate-50 dark:bg-slate-900/40 border border-slate-200 dark:border-slate-700">
              <h3 className="font-semibold text-sm mb-1">End of year</h3>
              <p className="text-xs text-muted-foreground">
                Tie up remaining evidence, complete ESR and ARCP preparation, and plan for the next year.
              </p>
            </div>
          </div>
          <p className="text-xs text-muted-foreground">
            <strong>Key points:</strong> {keyPointsText}
          </p>
        </CardContent>
      </Card>

      {/* Important notes for this stage */}
      <Card className="border-2 border-slate-200 dark:border-slate-700">
        <CardHeader>
          <CardTitle className="text-base">Important notes for {stageInfo[stageKey].name}</CardTitle>
        </CardHeader>
        <CardContent>
          <ul className="list-disc pl-5 space-y-1 text-sm text-muted-foreground">
            {importantNotes[stage]?.map((note) => (
              <li key={note}>{note}</li>
            ))}
          </ul>
        </CardContent>
      </Card>

      {/* Three-link rule & reflection guidance */}
      <Card className="border-2 border-teal-200 dark:border-teal-800">
        <CardHeader>
          <CardTitle className="text-base">Three‑link rule for learning logs</CardTitle>
          <CardDescription>
            A quick structure to make sure each reflection does enough work for your portfolio.
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-3">
          <div className="space-y-2 text-sm text-muted-foreground">
            <p>When you write a reflection, try this simple flow:</p>
            <ol className="list-decimal pl-5 space-y-1">
              <li>Choose one case where you genuinely learned or were challenged.</li>
              <li>Pick about three curriculum capabilities that best fit the case.</li>
              <li>Write 1–2 lines on how the case shows each capability and what you learned.</li>
            </ol>
          </div>
          <p className="text-xs text-muted-foreground">
            For full examples and wording, see the{' '}
            <Link href="/resources/reflection-guide" className="underline">
              Reflection Guide
            </Link>.
          </p>
        </CardContent>
      </Card>

      {/* Stage-specific resources */}
      <Card className="border-2 border-slate-200 dark:border-slate-700">
        <CardHeader>
          <CardTitle className="text-base">
            Helpful resources for {stageInfo[stageKey].name}
          </CardTitle>
        </CardHeader>
        <CardContent>
          <ul className="space-y-2 text-sm text-muted-foreground">
            <li>
              <Link href="/resources/wpba-checklist" className="underline">
                WPBA Checklist
              </Link>{' '}
              – quick guide to CBDs, Mini‑CEX/COTs, PSQ and MSF.
            </li>
            <li>
              <Link href="/resources/consultation-models" className="underline">
                Consultation models
              </Link>{' '}
              – frameworks to structure challenging consultations.
            </li>
            <li>
              <Link href="/resources/reflection-guide" className="underline">
                Reflection Guide
              </Link>{' '}
              – step‑by‑step help for learning log entries.
            </li>
            {stage === 'st2' && (
              <>
                <li>
                  <Link href="/akt" className="underline">
                    AKT question bank
                  </Link>{' '}
                  – start planning AKT and building question practice gradually through ST2.
                </li>
                <li>
                  Aim to reduce your average consultation length over ST2 from longer new‑starter
                  clinics towards 10–15 minute appointments, targeting around 16–20 patients per
                  day by the end of the year (in discussion with your trainer and VTS).
                </li>
              </>
            )}
            {stage === 'st3' && (
              <>
                <li>
                  <Link href="/sca" className="underline">
                    SCA prep
                  </Link>{' '}
                  – cases and actor scripts to prepare for the Simulated Consultation Assessment.
                </li>
                <li>
                  Plan your prescribing audit and leadership activities early, so they are finished
                  well before CCT.
                </li>
                <li>
                  <Link href="/resources/hidden-curriculum" className="underline">
                    Hidden curriculum
                  </Link>{' '}
                  – practical tips on jobs, rota patterns, contracts, and life after CCT.
                </li>
                <li>
                  By the end of ST3, aim to be comfortable with 10‑minute consultations and
                  (locally agreed) surgeries of around 25–30 patients per day, which aligns with
                  typical BMA guidance and salaried GP expectations.
                </li>
              </>
            )}
          </ul>
        </CardContent>
      </Card>

      {categories.map((category) => {
        const categoryGuides = guides?.filter(g => g.category === category.id) || []
        if (categoryGuides.length === 0) return null

        return (
          <div key={category.id}>
            <h2 className="text-xl font-semibold mb-4 flex items-center gap-2">
              <span>{category.icon}</span>
              {category.name}
            </h2>
            <div className="grid gap-4">
              {categoryGuides.map((guide) => {
                const isLocked = guide.is_pro && !isPro
                const isCompleted = completedIds.has(guide.id)

                return (
                  <Card
                    key={guide.id}
                    className={`border-2 border-slate-200 dark:border-slate-700 hover:border-teal-500 dark:hover:border-teal-400 hover:shadow-md transition-shadow ${isLocked ? 'opacity-75' : ''}`}
                  >
                    <CardHeader>
                      <div className="flex items-start justify-between">
                        <div>
                          <CardTitle className="text-lg flex items-center gap-2">
                            {isCompleted && <span className="text-green-600">✓</span>}
                            {guide.title}
                          </CardTitle>
                        </div>
                        <div className="flex gap-2">
                          {guide.is_pro && <Badge>Pro</Badge>}
                          {isCompleted && <Badge variant="secondary">Completed</Badge>}
                        </div>
                      </div>
                    </CardHeader>
                    <CardContent>
                      {isLocked ? (
                        <div className="text-center py-4">
                          <p className="text-muted-foreground mb-4">
                            This guide is available with Pro
                          </p>
                          <Link href="/pricing">
                            <Button size="sm">Upgrade to Pro</Button>
                          </Link>
                        </div>
                      ) : (
                        <div className="prose prose-sm max-w-none dark:prose-invert">
                          <ReactMarkdown>{guide.content}</ReactMarkdown>
                        </div>
                      )}
                    </CardContent>
                  </Card>
                )
              })}
            </div>
          </div>
        )
      })}

      {(!guides || guides.length === 0) && (
        <Card>
          <CardContent className="py-8 text-center">
            <p className="text-muted-foreground">
              No guides available for this stage yet. Check back soon!
            </p>
          </CardContent>
        </Card>
      )}

      {/* WPBA checklist at the end of the page */}
      <Card className="border-2 border-slate-200 dark:border-slate-700">
        <CardHeader>
          <CardTitle className="text-base">WPBA checklist for {stageInfo[stageKey].name}</CardTitle>
          <CardDescription>
            Snapshot of the main assessments and other evidence expected in this training year.
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-4 text-sm text-muted-foreground">
          <div>
            <h3 className="font-semibold mb-2">Assessments</h3>
            <ul className="space-y-1 list-disc pl-5">
              {wpbaForStage.map((item) => (
                <li key={item.id}>
                  <span className="font-medium">{item.name}:</span> {item.requirement}
                </li>
              ))}
            </ul>
          </div>
          <div>
            <h3 className="font-semibold mb-2">Other evidence</h3>
            <ul className="space-y-1 list-disc pl-5">
              {otherEvidenceForStage.map((item) => (
                <li key={item.id}>
                  <span className="font-medium">{item.name}:</span> {item.requirement}
                </li>
              ))}
            </ul>
          </div>
          <p className="text-xs">
            Always check your deanery or training programme guidance, as local requirements and
            templates can vary.
          </p>
        </CardContent>
      </Card>
    </div>
  )
}
