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
  difficulties: string[]
  lockedCount: number
}

export function FullCasesSection({ 
  cases, 
  attemptedIds, 
  difficulties,
  lockedCount 
}: FullCasesSectionProps) {
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
