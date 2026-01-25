'use client'

import { useState } from 'react'
import Link from 'next/link'
import { createClient } from '@/lib/supabase/server'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { SCAExamOverview } from './exam-overview'
import { ChevronDown, ChevronUp } from 'lucide-react'

const caseTypes = [
  { id: 'priming', name: '3-Min Priming', time: '180s', description: 'Prepare your consultation approach' },
  { id: 'full', name: 'Full Cases', time: '12 min', description: 'Complete consultation scenarios with actor scripts' },
]

// Component to handle client-side data fetching
async function getSCAData() {
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

  return { cases, progress, profile }
}

export default async function SCAPage() {
  const { cases, progress, profile } = await getSCAData()
  const isPro = profile?.subscription_tier === 'pro'
  const attemptedIds = new Set(progress?.map(p => p.content_id))

  const getCasesByType = (type: string) => cases?.filter(c => c.case_type === type) || []
  const primingCases = getCasesByType('priming')
  const fullCases = getCasesByType('full')
  const accessiblePriming = primingCases.filter(c => !c.is_pro || isPro)
  const accessibleFull = fullCases.filter(c => !c.is_pro || isPro)

  // Get unique difficulties and case types for filtering
  const difficulties = [...new Set(fullCases.map(c => c.difficulty).filter(Boolean))]
  const caseCategories = [...new Set(fullCases.map(c => c.case_type).filter(Boolean))]

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold">SCA Preparation</h1>
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
          <Card className="hover:shadow-lg transition-shadow cursor-pointer border-2 border-teal-200 dark:border-teal-800 hover:border-teal-400 dark:hover:border-teal-600 bg-white dark:bg-slate-900 mb-4">
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
                <Badge className="bg-teal-600 text-white">120s</Badge>
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
            <Card className="hover:shadow-lg transition-shadow cursor-pointer border-2 border-teal-200 dark:border-teal-800 hover:border-teal-400 dark:hover:border-teal-600 bg-white dark:bg-slate-900">
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
                  <Badge className="bg-teal-600 text-white">180s</Badge>
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
              <Button className="bg-teal-600 hover:bg-teal-700">Upgrade to Pro</Button>
            </Link>
          </CardContent>
        </Card>
      )}
    </div>
  )
}

// Client component for collapsible full cases section
function FullCasesSection({ 
  cases, 
  attemptedIds, 
  difficulties,
  lockedCount 
}: { 
  cases: any[]
  attemptedIds: Set<string>
  difficulties: string[]
  lockedCount: number
}) {
  const [isOpen, setIsOpen] = useState(false)
  const [selectedDifficulty, setSelectedDifficulty] = useState<string>('all')

  const filteredCases = selectedDifficulty === 'all' 
    ? cases 
    : cases.filter(c => c.difficulty === selectedDifficulty)

  return (
    <div>
      <div className="flex items-center justify-between mb-4">
        <div>
          <h2 className="text-xl font-semibold text-slate-900 dark:text-slate-100">Full Cases</h2>
          <p className="text-sm text-slate-600 dark:text-slate-400">Complete consultation scenarios with actor scripts</p>
        </div>
        <div className="flex items-center gap-3">
          <Badge variant="outline" className="border-slate-300 dark:border-slate-600">12 min</Badge>
          <Button
            variant="ghost"
            size="sm"
            onClick={() => setIsOpen(!isOpen)}
            className="text-slate-700 dark:text-slate-300"
          >
            {isOpen ? (
              <>
                <ChevronUp className="h-4 w-4 mr-1" />
                Hide
              </>
            ) : (
              <>
                <ChevronDown className="h-4 w-4 mr-1" />
                Show ({cases.length})
              </>
            )}
          </Button>
        </div>
      </div>

      {isOpen && (
        <div className="space-y-4">
          {/* Filter by Difficulty */}
          {difficulties.length > 0 && (
            <div className="flex flex-wrap gap-2">
              <Button
                variant={selectedDifficulty === 'all' ? 'default' : 'outline'}
                size="sm"
                onClick={() => setSelectedDifficulty('all')}
                className={selectedDifficulty === 'all' ? 'bg-teal-600 hover:bg-teal-700' : ''}
              >
                All ({cases.length})
              </Button>
              {difficulties.map((diff) => {
                const count = cases.filter(c => c.difficulty === diff).length
                return (
                  <Button
                    key={diff}
                    variant={selectedDifficulty === diff ? 'default' : 'outline'}
                    size="sm"
                    onClick={() => setSelectedDifficulty(diff)}
                    className={selectedDifficulty === diff ? 'bg-teal-600 hover:bg-teal-700' : ''}
                  >
                    {diff.charAt(0).toUpperCase() + diff.slice(1)} ({count})
                  </Button>
                )
              })}
            </div>
          )}

          {/* Cases Grid */}
          {filteredCases.length > 0 ? (
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
              {filteredCases.map((c) => (
                <Link key={c.id} href={`/sca/${c.id}`}>
                  <Card className="h-full hover:shadow-md transition-shadow cursor-pointer border-2 border-slate-200 dark:border-slate-700 hover:border-teal-400 dark:hover:border-teal-600">
                    <CardHeader>
                      <div className="flex items-start justify-between">
                        <CardTitle className="text-base text-slate-900 dark:text-slate-100">{c.title}</CardTitle>
                        <div className="flex gap-1 flex-wrap">
                          <Badge variant={
                            c.difficulty === 'easy' ? 'secondary' :
                            c.difficulty === 'hard' ? 'destructive' : 'default'
                          }>
                            {c.difficulty}
                          </Badge>
                          {attemptedIds.has(c.id) && (
                            <Badge variant="outline" className="border-teal-300 dark:border-teal-700">Attempted</Badge>
                          )}
                        </div>
                      </div>
                    </CardHeader>
                    <CardContent>
                      <p className="text-sm text-slate-600 dark:text-slate-400 line-clamp-2">
                        {c.scenario.substring(0, 100)}...
                      </p>
                    </CardContent>
                  </Card>
                </Link>
              ))}
            </div>
          ) : (
            <Card className="border-2 border-slate-200 dark:border-slate-700">
              <CardContent className="py-6 text-center text-slate-600 dark:text-slate-400">
                No cases found with selected filter.
              </CardContent>
            </Card>
          )}

          {lockedCount > 0 && (
            <Card className="bg-slate-50 dark:bg-slate-800 border-2 border-slate-200 dark:border-slate-700">
              <CardContent className="py-4 flex items-center justify-between">
                <p className="text-sm text-slate-600 dark:text-slate-400">
                  +{lockedCount} more full cases available with Pro
                </p>
                <Link href="/pricing">
                  <Button size="sm" variant="outline" className="border-teal-600 text-teal-700 hover:bg-teal-50">Upgrade</Button>
                </Link>
              </CardContent>
            </Card>
          )}
        </div>
      )}
    </div>
  )
}
