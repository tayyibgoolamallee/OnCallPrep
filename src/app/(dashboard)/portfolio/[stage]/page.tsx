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

const curriculumCapabilities = [
  'Fitness to practise',
  'Maintaining an ethical approach',
  'Communication and consultation skills',
  'Data gathering and interpretation',
  'Clinical examination and procedural skills',
  'Making decisions',
  'Clinical management',
  'Managing medical complexity',
  'Working with colleagues and in teams',
  'Maintaining performance, learning and teaching',
  'Organisation, management and leadership',
  'Practising holistically',
  'Community orientation',
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

  const excludeOtherEvidence: Record<'st1' | 'st2' | 'st3', string[]> = {
    st1: ['prescribing', 'leadership'],
    st2: [],
    st3: [],
  }

  const wpbaForStage = wpbaRequirements
    .map((req) => {
      const detail = req[stageKey]
      if (!detail) return null
      const requirement = detail.requirement
      if (!requirement || requirement.trim() === '0') return null
      return {
        id: req.id,
        name: req.name,
        requirement,
      }
    })
    .filter(Boolean) as { id: string; name: string; requirement: string }[]

  const otherEvidenceForStage = otherEvidence
    .map((req) => {
      const detail = req[stageKey]
      if (!detail) return null
      const requirement = detail.requirement
      if (!requirement || requirement.trim() === '0') return null
      if (excludeOtherEvidence[stageKey].includes(req.id)) return null
      return {
        id: req.id,
        name: req.name,
        requirement,
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

      {/* Important notes for this stage – ST1 bullets; ST2/ST3 flowcharts */}
      <Card className="border-2 border-slate-200 dark:border-slate-700">
        <CardHeader>
          <CardTitle className="text-base">Important notes for {stageInfo[stageKey].name}</CardTitle>
        </CardHeader>
        <CardContent>
          {stage === 'st1' && (
            <ul className="list-disc pl-5 space-y-1 text-sm text-muted-foreground">
              {importantNotes[stage]?.map((note) => (
                <li key={note}>{note}</li>
              ))}
            </ul>
          )}
          {stage === 'st2' && (
            <div className="space-y-4 text-sm text-muted-foreground">
              <div>
                <h3 className="font-semibold text-foreground mb-2">Consultation pace – smooth transition over the year</h3>
                <div className="flex flex-wrap items-center gap-2">
                  <span className="px-3 py-1.5 rounded-lg bg-slate-100 dark:bg-slate-800 border border-slate-200 dark:border-slate-700">
                    ~30 min / 10–12 pts
                  </span>
                  <span className="text-slate-400">→</span>
                  <span className="px-3 py-1.5 rounded-lg bg-slate-100 dark:bg-slate-800 border border-slate-200 dark:border-slate-700">
                    ~20 min
                  </span>
                  <span className="text-slate-400">→</span>
                  <span className="px-3 py-1.5 rounded-lg bg-slate-100 dark:bg-slate-800 border border-slate-200 dark:border-slate-700">
                    ~15 min / 16–20 pts
                  </span>
                </div>
                <p className="text-xs mt-2">Aim for a gradual increase in list size and shorter appointment length so that by the end of ST2 you are seeing around 16–20 patients per day (in discussion with your trainer and VTS).</p>
                <div className="mt-3 pt-3 border-t border-slate-200 dark:border-slate-700">
                  <h4 className="font-semibold text-xs text-foreground mb-1.5">Ways to improve</h4>
                  <ul className="text-xs space-y-0.5 list-disc pl-5">
                    <li>Use a <strong>competence checklist</strong> (e.g. from COT/CBD) so you know what to practise and tick off.</li>
                    <li><strong>Tailor tutorials</strong> with your supervisor to target your direct learning needs (e.g. one consultation skill per tutorial).</li>
                    <li>Follow a <strong>consultation structure</strong> (e.g. Calgary‑Cambridge: open, gather, explain, close) so you don’t drift.</li>
                    <li>Develop an <strong>ICE approach</strong> (Ideas, Concerns, Expectations) and ask early – saves time and improves outcomes.</li>
                    <li><strong>Chunk</strong> the consultation into clear steps (e.g. opening, history, exam, plan, safety‑net) so you stay on track.</li>
                    <li>Use <strong>secondary information</strong> before the patient enters: problem list, repeat meds, recent results, height/weight, documents – so you don’t re‑ask.</li>
                    <li>Brief <strong>preparation</strong> and clear <strong>agenda-setting</strong> at the start; <strong>safety-netting</strong> and one clear action at the end.</li>
                  </ul>
                </div>
              </div>
              <div>
                <h3 className="font-semibold text-foreground mb-2">AKT</h3>
                <div className="flex flex-wrap items-center gap-2">
                  <span className="px-3 py-1.5 rounded-lg bg-amber-50 dark:bg-amber-900/20 border border-amber-200 dark:border-amber-700">
                    3–4 months steady-paced revision
                  </span>
                  <span className="text-slate-400">→</span>
                  <span className="px-3 py-1.5 rounded-lg bg-amber-50 dark:bg-amber-900/20 border border-amber-200 dark:border-amber-700">
                    Last 1–2 months higher intensity
                  </span>
                </div>
                <p className="text-xs mt-2">Plan to sit the AKT when you have had time for steady revision, with a more intense push in the final 1–2 months.</p>
              </div>
            </div>
          )}
          {stage === 'st3' && (
            <div className="space-y-4 text-sm text-muted-foreground">
              <div>
                <h3 className="font-semibold text-foreground mb-2">Consultation pace – towards CCT</h3>
                <div className="flex flex-wrap items-center gap-2">
                  <span className="px-3 py-1.5 rounded-lg bg-slate-100 dark:bg-slate-800 border border-slate-200 dark:border-slate-700">
                    ~15 min / ~16 pts
                  </span>
                  <span className="text-slate-400">→</span>
                  <span className="px-3 py-1.5 rounded-lg bg-slate-100 dark:bg-slate-800 border border-slate-200 dark:border-slate-700">
                    ~10 min / 25–30 pts
                  </span>
                </div>
                <p className="text-xs mt-2">By the end of ST3, aim to be comfortable with 10‑minute consultations and (locally agreed) surgeries of around 25–30 patients per day, in line with typical BMA guidance and salaried GP expectations.</p>
                <div className="mt-3 pt-3 border-t border-slate-200 dark:border-slate-700">
                  <h4 className="font-semibold text-xs text-foreground mb-1.5">Ways to improve</h4>
                  <ul className="text-xs space-y-0.5 list-disc pl-5">
                    <li>Use a <strong>competence checklist</strong> and structure (e.g. Calgary‑Cambridge) so consultations stay focused.</li>
                    <li><strong>Tailor tutorials</strong> to your direct learning needs; use COT feedback to target one skill at a time.</li>
                    <li><strong>ICE early</strong> – Ideas, Concerns, Expectations – to align with the patient and avoid late surprises.</li>
                    <li><strong>Chunk</strong> the consultation (open → gather → explain → close) and keep to time in each phase.</li>
                    <li>Routinely use <strong>secondary information</strong>: problem list, repeat meds, results, documents – so you don’t ask what’s already there.</li>
                    <li>Brief <strong>prep</strong> and <strong>agenda-setting</strong>; clear <strong>safety-netting</strong> and one take‑home action.</li>
                  </ul>
                </div>
              </div>
              <div>
                <h3 className="font-semibold text-foreground mb-2">SCA</h3>
                <p className="text-xs mb-2">Aim to sit the SCA when you can consult at around 12 minutes and feel confident in your decision-making without persistently double-checking or second-guessing yourself.</p>
                <div className="flex flex-wrap items-center gap-2">
                  <span className="px-3 py-1.5 rounded-lg bg-violet-50 dark:bg-violet-900/20 border border-violet-200 dark:border-violet-700">
                    3–6 months revision
                  </span>
                  <span className="text-xs">(less if more intense; more if spaced out)</span>
                </div>
              </div>
            </div>
          )}
        </CardContent>
      </Card>

      {/* Three-link rule & reflective models – ST1 only */}
      {stage === 'st1' && (
        <>
          <Card className="border-2 border-teal-200 dark:border-teal-800">
            <CardHeader>
              <CardTitle className="text-base">Three‑link rule for learning logs</CardTitle>
              <CardDescription>
                Pick one case, choose ~3 capabilities, write 1–2 lines per link. Choose from the capabilities below.
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4 text-sm text-muted-foreground">
              {/* Horizontal flow – same plane */}
              <div className="flex flex-wrap items-stretch gap-2 md:gap-0 md:flex-nowrap md:items-center">
                <div className="flex-1 min-w-[140px] p-3 rounded-lg bg-teal-50 dark:bg-teal-900/20 border border-teal-200 dark:border-teal-700">
                  <h3 className="font-semibold text-sm mb-1">1. Choose the case</h3>
                  <p className="text-xs">One encounter where you learned or were challenged.</p>
                </div>
                <div className="hidden md:block text-xl text-teal-400 shrink-0">→</div>
                <div className="flex-1 min-w-[140px] p-3 rounded-lg bg-teal-50 dark:bg-teal-900/20 border border-teal-200 dark:border-teal-700">
                  <h3 className="font-semibold text-sm mb-1">2. Pick ~3 capabilities</h3>
                  <p className="text-xs">From the list below – the three most relevant.</p>
                </div>
                <div className="hidden md:block text-xl text-teal-400 shrink-0">→</div>
                <div className="flex-1 min-w-[140px] p-3 rounded-lg bg-teal-50 dark:bg-teal-900/20 border border-teal-200 dark:border-teal-700">
                  <h3 className="font-semibold text-sm mb-1">3. Write 1–2 lines each</h3>
                  <p className="text-xs">&ldquo;This case shows [capability] because…&rdquo; + what you&apos;d do next.</p>
                </div>
              </div>
              <div>
                <h3 className="font-semibold text-xs text-foreground mb-2">Curriculum capabilities to choose from</h3>
                <div className="flex flex-wrap gap-1.5">
                  {curriculumCapabilities.map((cap) => (
                    <span
                      key={cap}
                      className="inline-block px-2 py-1 rounded bg-slate-100 dark:bg-slate-800 text-xs border border-slate-200 dark:border-slate-700"
                    >
                      {cap}
                    </span>
                  ))}
                </div>
              </div>
              <div className="p-3 rounded-lg bg-green-50 dark:bg-green-900/20 border border-green-200 dark:border-green-700">
                <h3 className="font-semibold text-xs text-green-800 dark:text-green-200 mb-1">Example – three-link rule (chest pain)</h3>
                <p className="text-xs mb-1.5">You saw a 45‑year‑old with chest pain; you took a history and ECG and referred to ED.</p>
                <ul className="text-xs space-y-0.5 list-disc pl-5">
                  <li><strong>Data gathering and interpretation:</strong> I explored red flags and risk factors and interpreted the ECG with my supervisor.</li>
                  <li><strong>Making decisions:</strong> I balanced low pre-test probability with the seriousness of missing ACS and referred in line with NICE.</li>
                  <li><strong>Communication and consultation skills:</strong> I explained uncertainty and reasons for referral and checked the patient&apos;s understanding.</li>
                </ul>
              </div>
            </CardContent>
          </Card>

          <Card className="border-2 border-slate-200 dark:border-slate-700">
            <CardHeader>
              <CardTitle className="text-base">Reflective models – how to structure your reflection</CardTitle>
              <CardDescription>
                Use one framework per entry. Gibbs gives six steps; Rolfe is a shorter three-step option.
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4 text-sm text-muted-foreground">
              {/* Gibbs – horizontal, steps parallel to questions */}
              <div>
                <h3 className="font-semibold text-foreground mb-2">Gibbs (reflective cycle)</h3>
                <div className="flex flex-wrap items-stretch gap-x-2 gap-y-2">
                  {[
                    { step: 'Description', question: 'What happened?' },
                    { step: 'Feelings', question: 'What did you feel?' },
                    { step: 'Evaluation', question: 'Good and bad?' },
                    { step: 'Analysis', question: 'What sense can you make?' },
                    { step: 'Conclusion', question: 'What else could you have done?' },
                    { step: 'Action plan', question: 'What will you do next time?' },
                  ].map((item, i) => (
                    <span key={item.step} className="flex items-center gap-1.5">
                      <div className="min-w-[100px] px-2 py-1.5 rounded bg-teal-50 dark:bg-teal-900/20 border border-teal-200 dark:border-teal-700">
                        <p className="font-semibold text-xs text-teal-800 dark:text-teal-200">{i + 1}. {item.step}</p>
                        <p className="text-xs text-muted-foreground mt-0.5">{item.question}</p>
                      </div>
                      {i < 5 && <span className="text-teal-400 shrink-0">→</span>}
                    </span>
                  ))}
                </div>
                <p className="text-xs mt-2 text-muted-foreground">Work through 1–6 in order; the cycle repeats with new experiences.</p>
                <div className="p-3 rounded-lg bg-slate-50 dark:bg-slate-900/40 border border-slate-200 dark:border-slate-700 mt-2">
                  <h4 className="font-semibold text-xs text-foreground mb-1">Example (Gibbs) – difficult home visit</h4>
                  <p className="text-xs"><strong>Description:</strong> I did a home visit for an older man with breathlessness; family were anxious and I felt rushed.</p>
                  <p className="text-xs mt-0.5"><strong>Feelings:</strong> I was worried about missing something and guilty that I hadn&apos;t read the notes fully beforehand.</p>
                  <p className="text-xs mt-0.5"><strong>Evaluation:</strong> Good: I did a focused exam and arranged follow-up. Bad: I didn&apos;t explore ICE and the family left with unanswered concerns.</p>
                  <p className="text-xs mt-0.5"><strong>Analysis:</strong> I default to task-focused mode under time pressure; evidence shows addressing concerns improves outcomes and reduces re-attendance.</p>
                  <p className="text-xs mt-0.5"><strong>Conclusion:</strong> I could have said &ldquo;What&apos;s the main thing you want me to address today?&rdquo; and allowed 2 minutes for that.</p>
                  <p className="text-xs mt-0.5"><strong>Action plan:</strong> Before next home visit I will skim the problem list and repeat meds; I will ask one ICE question early in the consultation.</p>
                </div>
              </div>
              {/* Rolfe – compact flow */}
              <div>
                <h3 className="font-semibold text-foreground mb-2">Rolfe (What? So what? Now what?)</h3>
                <div className="flex flex-wrap items-center gap-1.5">
                  <span className="px-2 py-1 rounded bg-slate-100 dark:bg-slate-800 text-xs border border-slate-200 dark:border-slate-700">What?</span>
                  <span className="text-slate-400 text-xs">→</span>
                  <span className="px-2 py-1 rounded bg-slate-100 dark:bg-slate-800 text-xs border border-slate-200 dark:border-slate-700">So what?</span>
                  <span className="text-slate-400 text-xs">→</span>
                  <span className="px-2 py-1 rounded bg-slate-100 dark:bg-slate-800 text-xs border border-slate-200 dark:border-slate-700">Now what?</span>
                </div>
                <p className="text-xs mt-1.5">Describe the situation → Why does it matter? What have you learned? → What will you do differently?</p>
                <div className="p-3 rounded-lg bg-slate-50 dark:bg-slate-900/40 border border-slate-200 dark:border-slate-700 mt-2">
                  <h4 className="font-semibold text-xs text-foreground mb-1">Example (Rolfe) – paediatric fever</h4>
                  <p className="text-xs"><strong>What?</strong> I saw a child with fever; I considered sepsis and discussed safety-netting with the parent.</p>
                  <p className="text-xs mt-0.5"><strong>So what?</strong> I realised I was under-confident in red flags; I looked up NICE fever in under-5s and discussed with my supervisor.</p>
                  <p className="text-xs mt-0.5"><strong>Now what?</strong> I will re-read the traffic-light table before next paediatric clinic and write one more reflection after a similar case.</p>
                </div>
              </div>
              <p className="text-xs">
                More examples and wording tips in the <Link href="/resources/reflection-guide" className="underline">Reflection Guide</Link>.
              </p>
            </CardContent>
          </Card>
        </>
      )}

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
                  – see important notes above for revision timeline; use this for steady practice through ST2.
                </li>
              </>
            )}
            {stage === 'st3' && (
              <>
                <li>
                  <Link href="/sca" className="underline">
                    SCA prep
                  </Link>{' '}
                  – cases and actor scripts; see important notes above for when to sit and how long to revise.
                </li>
                <li>
                  Plan your prescribing audit and leadership activities early, so they are finished well before CCT.
                </li>
                <li>
                  <Link href="/resources/hidden-curriculum" className="underline">
                    Hidden curriculum
                  </Link>{' '}
                  – practical tips on jobs, rota patterns, contracts, and life after CCT.
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
            <div className="space-y-1">
              {wpbaForStage.map((item) => (
                <label
                  key={item.id}
                  className="flex items-start gap-2 rounded border border-slate-200 dark:border-slate-700 bg-slate-50 dark:bg-slate-900/40 px-3 py-2 text-xs"
                >
                  <input type="checkbox" className="mt-0.5 h-3 w-3" />
                  <span>
                    <span className="font-medium">{item.name}:</span> {item.requirement}
                  </span>
                </label>
              ))}
            </div>
          </div>
          <div>
            <h3 className="font-semibold mb-2">Other evidence</h3>
            <div className="space-y-1">
              {otherEvidenceForStage.map((item) => (
                <label
                  key={item.id}
                  className="flex items-start gap-2 rounded border border-slate-200 dark:border-slate-700 bg-slate-50 dark:bg-slate-900/40 px-3 py-2 text-xs"
                >
                  <input type="checkbox" className="mt-0.5 h-3 w-3" />
                  <span>
                    <span className="font-medium">{item.name}:</span> {item.requirement}
                  </span>
                </label>
              ))}
            </div>
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
