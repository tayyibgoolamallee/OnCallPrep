'use client'

import { useState } from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'

export function AKTExamOverview() {
  const [isExpanded, setIsExpanded] = useState(false)

  return (
    <Card className="bg-gradient-to-br from-cyan-50 to-cyan-100/50 dark:from-cyan-950/30 dark:to-cyan-900/20 border-cyan-200 dark:border-cyan-800">
      <CardHeader className="pb-3">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <span className="text-2xl">📚</span>
            <CardTitle className="text-lg">About the AKT</CardTitle>
          </div>
          <Button
            variant="ghost"
            size="sm"
            onClick={() => setIsExpanded(!isExpanded)}
            className="text-cyan-700 dark:text-cyan-300"
          >
            {isExpanded ? 'Hide Details ▲' : 'Show Details ▼'}
          </Button>
        </div>
        <p className="text-sm text-muted-foreground mt-1">
          The Applied Knowledge Test is a computer-based exam testing evidence-based medicine, clinical guidelines, and primary care practice.
        </p>
      </CardHeader>

      {isExpanded && (
        <CardContent className="space-y-6">
          {/* Quick Facts */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
            <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-3 text-center">
              <div className="text-2xl mb-1">📝</div>
              <div className="font-semibold text-cyan-700 dark:text-cyan-300">160 questions</div>
              <div className="text-xs text-muted-foreground">Single Best Answer</div>
            </div>
            <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-3 text-center">
              <div className="text-2xl mb-1">⏱️</div>
              <div className="font-semibold text-cyan-700 dark:text-cyan-300">3 hours</div>
              <div className="text-xs text-muted-foreground">~1.1 min per question</div>
            </div>
            <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-3 text-center">
              <div className="text-2xl mb-1">📅</div>
              <div className="font-semibold text-cyan-700 dark:text-cyan-300">3 sittings</div>
              <div className="text-xs text-muted-foreground">per year</div>
            </div>
            <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-3 text-center">
              <div className="text-2xl mb-1">🎯</div>
              <div className="font-semibold text-cyan-700 dark:text-cyan-300">~70%</div>
              <div className="text-xs text-muted-foreground">pass mark (varies)</div>
            </div>
          </div>

          {/* Question Distribution */}
          <div>
            <h4 className="font-semibold mb-3">Question Distribution</h4>
            <div className="grid md:grid-cols-3 gap-3">
              <div className="bg-blue-50 dark:bg-blue-900/30 rounded-lg p-4 border-l-4 border-blue-500">
                <div className="flex items-center justify-between mb-2">
                  <span className="font-semibold text-blue-700 dark:text-blue-300">Clinical Medicine</span>
                  <span className="text-sm font-bold text-blue-600 dark:text-blue-400">~80%</span>
                </div>
                <div className="text-xs text-muted-foreground">~128 questions</div>
                <ul className="text-xs text-muted-foreground mt-2 space-y-0.5">
                  <li>• Cardiovascular, Respiratory</li>
                  <li>• Endocrine, Mental Health</li>
                  <li>• Women&apos;s Health, Child Health</li>
                  <li>• MSK, Dermatology, ENT</li>
                </ul>
              </div>
              <div className="bg-purple-50 dark:bg-purple-900/30 rounded-lg p-4 border-l-4 border-purple-500">
                <div className="flex items-center justify-between mb-2">
                  <span className="font-semibold text-purple-700 dark:text-purple-300">Evidence-Based Practice</span>
                  <span className="text-sm font-bold text-purple-600 dark:text-purple-400">~10%</span>
                </div>
                <div className="text-xs text-muted-foreground">~16 questions</div>
                <ul className="text-xs text-muted-foreground mt-2 space-y-0.5">
                  <li>• ARR, RRR, NNT, NNH</li>
                  <li>• Sensitivity, Specificity</li>
                  <li>• Study design & critical appraisal</li>
                </ul>
              </div>
              <div className="bg-green-50 dark:bg-green-900/30 rounded-lg p-4 border-l-4 border-green-500">
                <div className="flex items-center justify-between mb-2">
                  <span className="font-semibold text-green-700 dark:text-green-300">PCOM</span>
                  <span className="text-sm font-bold text-green-600 dark:text-green-400">~10%</span>
                </div>
                <div className="text-xs text-muted-foreground">~16 questions</div>
                <ul className="text-xs text-muted-foreground mt-2 space-y-0.5">
                  <li>• Ethics & Law</li>
                  <li>• Communication</li>
                  <li>• NHS Structure, QOF</li>
                </ul>
              </div>
            </div>
          </div>

          {/* EBP Quick Reference */}
          <div>
            <h4 className="font-semibold mb-3">EBP Formulas You Must Know</h4>
            <div className="grid md:grid-cols-2 gap-3">
              <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-3 font-mono text-sm">
                <strong className="text-cyan-700 dark:text-cyan-300">ARR</strong> = CER − EER
                <div className="text-xs text-muted-foreground mt-1">Absolute Risk Reduction</div>
              </div>
              <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-3 font-mono text-sm">
                <strong className="text-cyan-700 dark:text-cyan-300">RRR</strong> = ARR ÷ CER × 100
                <div className="text-xs text-muted-foreground mt-1">Relative Risk Reduction</div>
              </div>
              <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-3 font-mono text-sm">
                <strong className="text-cyan-700 dark:text-cyan-300">NNT</strong> = 1 ÷ ARR
                <div className="text-xs text-muted-foreground mt-1">Number Needed to Treat</div>
              </div>
              <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-3 font-mono text-sm">
                <strong className="text-cyan-700 dark:text-cyan-300">Sens</strong> = TP ÷ (TP + FN) → SnNout
                <div className="text-xs text-muted-foreground mt-1">Sensitivity rules OUT</div>
              </div>
            </div>
          </div>

          {/* Study Strategies */}
          <div>
            <h4 className="font-semibold mb-3">Study Strategy Modes</h4>
            <div className="grid md:grid-cols-3 gap-3">
              <div className="bg-blue-50 dark:bg-blue-900/30 rounded-lg p-3 border-l-4 border-blue-400">
                <div className="font-medium text-sm mb-1">1. Untimed Mode</div>
                <p className="text-xs text-muted-foreground">Learn at your own pace. Read explanations carefully, look up guidelines. Best for early study.</p>
              </div>
              <div className="bg-green-50 dark:bg-green-900/30 rounded-lg p-3 border-l-4 border-green-400">
                <div className="font-medium text-sm mb-1">2. Timed with Notes</div>
                <p className="text-xs text-muted-foreground">Practice under time pressure but allow notes. Builds speed while maintaining learning.</p>
              </div>
              <div className="bg-amber-50 dark:bg-amber-900/30 rounded-lg p-3 border-l-4 border-amber-400">
                <div className="font-medium text-sm mb-1">3. Exam Conditions</div>
                <p className="text-xs text-muted-foreground">Full simulation - timed, no notes. Best for final preparation and identifying weak areas.</p>
              </div>
            </div>
          </div>

          {/* Key Tips */}
          <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-4">
            <h4 className="font-semibold mb-2">Key Study Tips</h4>
            <ul className="text-sm text-muted-foreground space-y-1">
              <li>• <strong>Consistency beats intensity</strong> – 1-2 hours daily is better than 8 hours once a week</li>
              <li>• <strong>Primary care first</strong> – manage safely in GP where appropriate; follow NICE pathways</li>
              <li>• <strong>Safety is rewarded</strong> – choose guideline-backed, low-harm answers</li>
              <li>• <strong>Know your formulas</strong> – EBP questions come up every sitting</li>
              <li>• <strong>Track progress</strong> – keep a log of mock scores; you should see improvement</li>
            </ul>
          </div>
        </CardContent>
      )}
    </Card>
  )
}
