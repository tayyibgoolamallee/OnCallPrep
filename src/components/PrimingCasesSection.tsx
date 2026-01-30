'use client'

import { useState } from 'react'
import Link from 'next/link'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { ChevronDown, ChevronUp } from 'lucide-react'

interface PrimingCasesSectionProps {
  cases: { id: string; title: string; scenario: string; difficulty: string | null; is_pro: boolean | null }[]
  attemptedIds: Set<string>
  completedIds: Set<string>
  lockedCount: number
}

const VALID_DIFFICULTIES = ['easy', 'medium', 'hard', 'advanced'] as const
function normalizeDifficulty(diff: string | null | undefined): string {
  const d = (diff == null || typeof diff !== 'string') ? '' : diff.trim().toLowerCase()
  if (!d || d === 'intermediate') return 'medium'
  return VALID_DIFFICULTIES.includes(d as typeof VALID_DIFFICULTIES[number]) ? d : 'medium'
}

const DIFFICULTY_ORDER = ['easy', 'medium', 'hard', 'advanced']

export function PrimingCasesSection({
  cases,
  attemptedIds,
  completedIds,
  lockedCount,
}: PrimingCasesSectionProps) {
  const [isOpen, setIsOpen] = useState(false)
  const [selectedDifficulty, setSelectedDifficulty] = useState<string>('all')

  const difficulties = [...new Set(cases.map(c => normalizeDifficulty(c.difficulty)))].sort(
    (a, b) => {
      const i = DIFFICULTY_ORDER.indexOf(a)
      const j = DIFFICULTY_ORDER.indexOf(b)
      if (i !== -1 && j !== -1) return i - j
      if (i !== -1) return -1
      if (j !== -1) return 1
      return a.localeCompare(b)
    }
  )

  const filteredCases = selectedDifficulty === 'all'
    ? cases
    : cases.filter(c => normalizeDifficulty(c.difficulty) === selectedDifficulty)

  return (
    <Card className="border-2 border-teal-200 dark:border-teal-800 bg-white dark:bg-slate-900">
      <CardContent className="pt-6">
    <div>
      <div className="flex items-center justify-between mb-4">
        <div>
          <h2 className="text-xl font-semibold text-slate-900 dark:text-slate-100">3-Minute Priming Exercises</h2>
          <p className="text-sm text-slate-600 dark:text-slate-400">Prepare your consultation approach with structured priming exercises</p>
        </div>
        <div className="flex items-center gap-3">
          <Badge className="bg-teal-500 text-white border-0">180s</Badge>
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
                className={selectedDifficulty === 'all' ? 'bg-teal-500 hover:bg-teal-600' : ''}
              >
                All ({cases.length})
              </Button>
              {difficulties.map((diff) => {
                const count = cases.filter(c => normalizeDifficulty(c.difficulty) === diff).length
                return (
                  <Button
                    key={diff}
                    variant={selectedDifficulty === diff ? 'default' : 'outline'}
                    size="sm"
                    onClick={() => setSelectedDifficulty(diff)}
                    className={selectedDifficulty === diff ? 'bg-teal-500 hover:bg-teal-600' : ''}
                  >
                    {diff.charAt(0).toUpperCase() + diff.slice(1)} ({count})
                  </Button>
                )
              })}
            </div>
          )}

          {filteredCases.length > 0 ? (
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
            {filteredCases.map((c) => (
              <Link key={c.id} href={`/sca/${c.id}`}>
                <Card className="h-full hover:shadow-md transition-shadow cursor-pointer border-2 border-slate-200 dark:border-slate-700 hover:border-teal-300 dark:hover:border-teal-700">
                  <CardHeader>
                    <div className="flex items-start justify-between gap-2">
                      <CardTitle className="text-base text-slate-900 dark:text-slate-100 line-clamp-2">
                        {c.title}
                      </CardTitle>
                      <div className="flex gap-1 flex-wrap shrink-0">
                        <Badge variant={
                          normalizeDifficulty(c.difficulty) === 'easy' ? 'secondary' :
                          normalizeDifficulty(c.difficulty) === 'hard' || normalizeDifficulty(c.difficulty) === 'advanced' ? 'destructive' : 'default'
                        }>
                          {normalizeDifficulty(c.difficulty)}
                        </Badge>
                        {completedIds.has(c.id) ? (
                          <Badge variant="outline" className="border-green-500 text-green-700 dark:text-green-400 bg-green-50 dark:bg-green-950/30">Done</Badge>
                        ) : attemptedIds.has(c.id) && (
                          <Badge variant="outline" className="border-teal-300 dark:border-teal-700">Attempted</Badge>
                        )}
                      </div>
                    </div>
                  </CardHeader>
                  <CardContent>
                    <p className="text-sm text-slate-600 dark:text-slate-400 line-clamp-2">
                      {c.scenario.substring(0, 120)}...
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
                  +{lockedCount} more priming exercises available with Pro
                </p>
                <Link href="/pricing">
                  <Button size="sm" variant="outline" className="border-teal-500 text-teal-700 hover:bg-teal-50">Upgrade</Button>
                </Link>
              </CardContent>
            </Card>
          )}
        </div>
      )}
    </div>
      </CardContent>
    </Card>
  )
}
