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

function normalizeDifficulty(diff: string | null) {
  if (!diff) return null
  const d = diff.toLowerCase()
  return d === 'intermediate' ? 'medium' : d
}

export function PrimingCasesSection({
  cases,
  attemptedIds,
  completedIds,
  lockedCount,
}: PrimingCasesSectionProps) {
  const [isOpen, setIsOpen] = useState(false)

  return (
    <div>
      <div className="flex items-center justify-between mb-4">
        <div>
          <h2 className="text-xl font-semibold text-slate-900 dark:text-slate-100">3-Minute Priming Exercises</h2>
          <p className="text-sm text-slate-600 dark:text-slate-400">Prepare your consultation approach with structured priming exercises</p>
        </div>
        <div className="flex items-center gap-3">
          <Badge variant="outline" className="border-slate-300 dark:border-slate-600">180s</Badge>
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
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
            {cases.map((c) => (
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
                          normalizeDifficulty(c.difficulty) === 'hard' ? 'destructive' : 'default'
                        }>
                          {normalizeDifficulty(c.difficulty) || c.difficulty || 'medium'}
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
  )
}
