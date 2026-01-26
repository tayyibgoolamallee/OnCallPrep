import Link from 'next/link'
import { createClient } from '@/lib/supabase/server'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { SCAExamOverview } from './exam-overview'
import { FullCasesSection } from '@/components/FullCasesSection'

export default async function SCAPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: cases } = await supabase
    .from('sca_cases')
    .select('*')
    .eq('published', true)
    .order('created_at', { ascending: false })

  const userId = user?.id
  
  const { data: progress } = userId ? await supabase
    .from('user_progress')
    .select('*')
    .eq('user_id', userId)
    .eq('content_type', 'sca') : { data: null }

  const { data: profile } = userId ? await supabase
    .from('user_profiles')
    .select('subscription_tier')
    .eq('id', userId)
    .single() : { data: null }

  const isPro = profile?.subscription_tier === 'pro'
  const attemptedIds = new Set(progress?.map(p => p.content_id))
  const completedIds = new Set(progress?.filter(p => p.completed === true).map(p => p.content_id))

  const getCasesByType = (type: string) => cases?.filter(c => c.case_type === type) || []
  const primingCases = getCasesByType('priming')
  const fullCases = getCasesByType('full')
  const accessiblePriming = primingCases.filter(c => !c.is_pro || isPro)
  const accessibleFull = fullCases.filter(c => !c.is_pro || isPro)

  // Get unique difficulties for filtering, normalize medium/intermediate
  const normalizedDifficulties = fullCases.map(c => {
    if (!c.difficulty) return null
    const d = c.difficulty.toLowerCase()
    return d === 'intermediate' ? 'medium' : d
  })
  // Ensure a consistent ordering of difficulty filters: easy → medium → hard → advanced → others
  const difficultyOrder = ['easy', 'medium', 'hard', 'advanced']
  const difficulties = [...new Set(normalizedDifficulties.filter((d): d is string => d !== null && d !== undefined))].sort(
    (a, b) => {
      const indexA = difficultyOrder.indexOf(a)
      const indexB = difficultyOrder.indexOf(b)

      // Both in predefined order
      if (indexA !== -1 && indexB !== -1) return indexA - indexB
      // Only A known
      if (indexA !== -1) return -1
      // Only B known
      if (indexB !== -1) return 1
      // Neither known – fall back to alpha
      return a.localeCompare(b)
    }
  )

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold text-slate-900 dark:text-slate-100">SCA Preparation</h1>
        <p className="text-slate-600 dark:text-slate-400 mt-1">
          Practice timed consultation exercises and mock cases
        </p>
      </div>

      {/* Exam Overview */}
      <SCAExamOverview />

      {/* Stats */}
      <div className="grid md:grid-cols-3 gap-4">
        <Card className="border-2 border-slate-200 dark:border-slate-700">
          <CardHeader className="pb-2">
            <CardDescription>Cases Attempted</CardDescription>
            <CardTitle className="text-2xl">{progress?.length || 0}</CardTitle>
          </CardHeader>
        </Card>
        <Card className="border-2 border-slate-200 dark:border-slate-700">
          <CardHeader className="pb-2">
            <CardDescription>Available Cases</CardDescription>
            <CardTitle className="text-2xl">{cases?.filter(c => !c.is_pro || isPro).length || 0}</CardTitle>
          </CardHeader>
        </Card>
        <Card className="border-2 border-slate-200 dark:border-slate-700">
          <CardHeader className="pb-2">
            <CardDescription>Your Plan</CardDescription>
            <CardTitle className="text-2xl">{isPro ? 'Pro' : 'Free'}</CardTitle>
          </CardHeader>
        </Card>
      </div>

      {/* Practice Tools */}
      <div>
        <h2 className="text-xl font-semibold mb-4 text-slate-900 dark:text-slate-100">Practice Tools</h2>
        
        {/* 2-Minute Diagnosis Practice */}
        <Link href="/sca/diagnosis-practice">
          <Card className="hover:shadow-lg transition-shadow cursor-pointer border-2 border-teal-200 dark:border-teal-800 hover:border-teal-300 dark:hover:border-teal-700 bg-white dark:bg-slate-900 mb-4">
            <CardHeader>
              <div className="flex items-start justify-between">
                <div>
                  <CardTitle className="text-lg flex items-center gap-2 text-slate-900 dark:text-slate-100">
                    <span className="text-2xl">⏱️</span>
                    2-Minute Diagnosis Practice
                  </CardTitle>
                  <CardDescription className="mt-2 text-slate-600 dark:text-slate-400">
                    Practice explaining 56 common diagnoses clearly and concisely – a key SCA skill
                  </CardDescription>
                </div>
                <Badge className="bg-teal-500 text-white">120s</Badge>
              </div>
            </CardHeader>
            <CardContent>
              <p className="text-sm text-slate-600 dark:text-slate-400">
                Name it → Explain it → Link it → Plan it → Safety net it
              </p>
            </CardContent>
          </Card>
        </Link>

        {/* 3-Minute Priming - Similar to 2-minute practice */}
        {accessiblePriming.length > 0 && (
          <Link href={`/sca/${accessiblePriming[0].id}`}>
            <Card className="hover:shadow-lg transition-shadow cursor-pointer border-2 border-teal-200 dark:border-teal-800 hover:border-teal-300 dark:hover:border-teal-700 bg-white dark:bg-slate-900">
              <CardHeader>
                <div className="flex items-start justify-between">
                  <div>
                    <CardTitle className="text-lg flex items-center gap-2 text-slate-900 dark:text-slate-100">
                      <span className="text-2xl">🧠</span>
                      3-Minute Priming Practice
                    </CardTitle>
                    <CardDescription className="mt-2 text-slate-600 dark:text-slate-400">
                      Prepare your consultation approach with structured priming exercises
                    </CardDescription>
                  </div>
                  <Badge className="bg-teal-500 text-white">180s</Badge>
                </div>
              </CardHeader>
              <CardContent>
                <p className="text-sm text-slate-600 dark:text-slate-400">
                  {accessiblePriming.length} {accessiblePriming.length === 1 ? 'case' : 'cases'} available
                </p>
              </CardContent>
            </Card>
          </Link>
        )}
      </div>

      {/* Full Cases - Collapsible with filters */}
      {accessibleFull.length > 0 && (
        <FullCasesSection 
          cases={accessibleFull} 
          attemptedIds={attemptedIds}
          completedIds={completedIds}
          difficulties={difficulties}
          lockedCount={fullCases.length - accessibleFull.length}
        />
      )}

      {!isPro && (primingCases.length - accessiblePriming.length > 0 || fullCases.length - accessibleFull.length > 0) && (
        <Card className="bg-slate-50 dark:bg-slate-800 border-2 border-slate-200 dark:border-slate-700">
          <CardContent className="py-6 flex items-center justify-between">
            <div>
              <h3 className="font-semibold text-slate-900 dark:text-slate-100">Unlock More Cases</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400">
                Get full access to our comprehensive case library
              </p>
            </div>
            <Link href="/pricing">
              <Button className="bg-teal-500 hover:bg-teal-600">Upgrade to Pro</Button>
            </Link>
          </CardContent>
        </Card>
      )}
    </div>
  )
}
