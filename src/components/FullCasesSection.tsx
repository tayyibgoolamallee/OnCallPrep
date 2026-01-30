'use client'

import { useState } from 'react'
import Link from 'next/link'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { ChevronDown, ChevronUp } from 'lucide-react'

interface FullCasesSectionProps {
  cases: any[]
  attemptedIds: Set<string>
  completedIds: Set<string>
  difficulties: string[]
  lockedCount: number
}

export function FullCasesSection({ 
  cases, 
  attemptedIds,
  completedIds,
  difficulties,
  lockedCount 
}: FullCasesSectionProps) {
  const [isOpen, setIsOpen] = useState(false)
  const [selectedDifficulty, setSelectedDifficulty] = useState<string>('all')

  // Normalize difficulty for filtering (merge medium/intermediate); display fallback for missing
  const normalizeDifficulty = (diff: string | null) => {
    if (!diff) return 'medium'
    const d = diff.toLowerCase().trim()
    return d === 'intermediate' ? 'medium' : d
  }

  const filteredCases = selectedDifficulty === 'all' 
    ? cases 
    : cases.filter(c => normalizeDifficulty(c.difficulty) === selectedDifficulty)

  const difficultyOrder = ['easy', 'medium', 'hard', 'advanced']
  const difficultiesFromCases = [...new Set(cases.map(c => normalizeDifficulty(c.difficulty)))].sort(
    (a, b) => {
      const i = difficultyOrder.indexOf(a)
      const j = difficultyOrder.indexOf(b)
      if (i !== -1 && j !== -1) return i - j
      if (i !== -1) return -1
      if (j !== -1) return 1
      return a.localeCompare(b)
    }
  )
  const filterDifficulties = difficulties.length > 0 ? difficulties : difficultiesFromCases

  return (
    <Card className="border-2 border-teal-200 dark:border-teal-800 bg-white dark:bg-slate-900">
      <CardContent className="pt-6">
    <div>
      <div className="flex items-center justify-between mb-4">
        <div>
          <h2 className="text-xl font-semibold text-slate-900 dark:text-slate-100">Full Cases</h2>
          <p className="text-sm text-slate-600 dark:text-slate-400">Complete consultation scenarios with actor scripts</p>
        </div>
        <div className="flex items-center gap-3">
          <Badge className="bg-teal-500 text-white border-0">12 min</Badge>
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
          {filterDifficulties.length > 0 && (
            <div className="flex flex-wrap gap-2">
              <Button
                variant={selectedDifficulty === 'all' ? 'default' : 'outline'}
                size="sm"
                onClick={() => setSelectedDifficulty('all')}
                className={selectedDifficulty === 'all' ? 'bg-teal-500 hover:bg-teal-600' : ''}
              >
                All ({cases.length})
              </Button>
              {filterDifficulties.map((diff) => {
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

          {/* Cases Grid */}
          {filteredCases.length > 0 ? (
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
              {filteredCases.map((c) => (
                <Link key={c.id} href={`/sca/${c.id}`}>
                  <Card className="h-full hover:shadow-md transition-shadow cursor-pointer border-2 border-slate-200 dark:border-slate-700 hover:border-teal-300 dark:hover:border-teal-700">
                    <CardHeader>
                      <div className="flex items-start justify-between">
                        <CardTitle className="text-base text-slate-900 dark:text-slate-100 flex flex-col">
                          <span>{c.category || 'Case'}</span>
                          {c.category_code && (
                            <span className="text-xs font-normal text-slate-500 dark:text-slate-400">
                              {c.category_code}
                            </span>
                          )}
                        </CardTitle>
                        <div className="flex gap-1 flex-wrap">
                          <Badge variant={
                            normalizeDifficulty(c.difficulty) === 'easy' ? 'secondary' :
                            normalizeDifficulty(c.difficulty) === 'hard' || normalizeDifficulty(c.difficulty) === 'advanced' ? 'destructive' : 'default'
                          }>
                            {normalizeDifficulty(c.difficulty)}
                          </Badge>
                          {completedIds.has(c.id) ? (
                            <Badge variant="outline" className="border-green-500 text-green-700 dark:text-green-400 bg-green-50 dark:bg-green-950/30">Completed</Badge>
                          ) : attemptedIds.has(c.id) && (
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
