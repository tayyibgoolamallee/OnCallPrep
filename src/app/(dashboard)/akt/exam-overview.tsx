'use client'

import { useState } from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'

export function AKTExamOverview() {
  const [isExpanded, setIsExpanded] = useState(false)

  return (
    <Card className="border-2 border-teal-200 dark:border-teal-800 bg-white dark:bg-slate-900">
      <CardHeader className="bg-teal-700 dark:bg-teal-900 text-white rounded-t-lg">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <span className="text-2xl">📚</span>
            <CardTitle className="text-lg">About the AKT</CardTitle>
          </div>
          <Button
            variant="ghost"
            size="sm"
            onClick={() => setIsExpanded(!isExpanded)}
            className="text-white hover:bg-teal-800 dark:hover:bg-teal-950"
          >
            {isExpanded ? 'Hide Details ▲' : 'Show Details ▼'}
          </Button>
        </div>
        <p className="text-sm text-teal-100 mt-1">
          The Applied Knowledge Test is a computer-based exam testing evidence-based medicine, clinical guidelines, and primary care practice.
        </p>
      </CardHeader>

      {isExpanded && (
        <CardContent className="pt-6 space-y-6">
          {/* Quick Facts */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
            <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 text-center border border-slate-200 dark:border-slate-700">
              <div className="text-2xl mb-1">📝</div>
              <div className="font-semibold text-slate-900 dark:text-slate-100">160 questions</div>
              <div className="text-xs text-slate-600 dark:text-slate-400">Single Best Answer</div>
            </div>
            <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 text-center border border-slate-200 dark:border-slate-700">
              <div className="text-2xl mb-1">⏱️</div>
              <div className="font-semibold text-slate-900 dark:text-slate-100">2h 40m</div>
              <div className="text-xs text-slate-600 dark:text-slate-400">~1 min per question</div>
            </div>
            <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 text-center border border-slate-200 dark:border-slate-700">
              <div className="text-2xl mb-1">📅</div>
              <div className="font-semibold text-slate-900 dark:text-slate-100">4 sittings</div>
              <div className="text-xs text-slate-600 dark:text-slate-400">per year</div>
            </div>
            <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 text-center border border-slate-200 dark:border-slate-700">
              <div className="text-2xl mb-1">🎯</div>
              <div className="font-semibold text-slate-900 dark:text-slate-100">~70%</div>
              <div className="text-xs text-slate-600 dark:text-slate-400">pass mark (varies)</div>
            </div>
          </div>

          {/* Question Distribution */}
          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Question Distribution</h4>
            <div className="grid md:grid-cols-3 gap-3">
              <div className="bg-slate-100 dark:bg-slate-800 rounded-lg p-4 border-l-4 border-slate-500">
                <div className="flex items-center justify-between mb-2">
                  <span className="font-semibold text-slate-700 dark:text-slate-300">Clinical Medicine</span>
                  <span className="text-sm font-bold text-slate-600 dark:text-slate-400">~80%</span>
                </div>
                <div className="text-xs text-slate-600 dark:text-slate-400">~128 questions</div>
                <ul className="text-xs text-slate-700 dark:text-slate-300 mt-2 space-y-0.5">
                  <li>• Cardiovascular, Respiratory</li>
                  <li>• Endocrine, Mental Health</li>
                  <li>• Women&apos;s Health, Child Health</li>
                  <li>• MSK, Dermatology, ENT</li>
                </ul>
              </div>
              <div className="bg-slate-100 dark:bg-slate-800 rounded-lg p-4 border-l-4 border-slate-400">
                <div className="flex items-center justify-between mb-2">
                  <span className="font-semibold text-slate-700 dark:text-slate-300">Evidence-Based Practice</span>
                  <span className="text-sm font-bold text-slate-600 dark:text-slate-400">~10%</span>
                </div>
                <div className="text-xs text-slate-600 dark:text-slate-400">~16 questions</div>
                <ul className="text-xs text-slate-700 dark:text-slate-300 mt-2 space-y-0.5">
                  <li>• ARR, RRR, NNT, NNH</li>
                  <li>• Sensitivity, Specificity</li>
                  <li>• Study design & critical appraisal</li>
                </ul>
              </div>
              <div className="bg-slate-100 dark:bg-slate-800 rounded-lg p-4 border-l-4 border-slate-500">
                <div className="flex items-center justify-between mb-2">
                  <span className="font-semibold text-slate-700 dark:text-slate-300">PCOM</span>
                  <span className="text-sm font-bold text-slate-600 dark:text-slate-400">~10%</span>
                </div>
                <div className="text-xs text-slate-600 dark:text-slate-400">~16 questions</div>
                <ul className="text-xs text-slate-700 dark:text-slate-300 mt-2 space-y-0.5">
                  <li>• Ethics & Law</li>
                  <li>• Communication</li>
                  <li>• NHS Structure, QOF</li>
                </ul>
              </div>
            </div>
          </div>

          {/* EBP Quick Reference */}
          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">EBP Formulas You Must Know</h4>
            <div className="grid md:grid-cols-2 gap-3">
              <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 font-mono text-sm border border-slate-200 dark:border-slate-700">
                <strong className="text-slate-700 dark:text-slate-300">ARR</strong> = CER − EER
                <div className="text-xs text-slate-600 dark:text-slate-400 mt-1">Absolute Risk Reduction</div>
              </div>
              <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 font-mono text-sm border border-slate-200 dark:border-slate-700">
                <strong className="text-slate-700 dark:text-slate-300">RRR</strong> = ARR ÷ CER × 100
                <div className="text-xs text-slate-600 dark:text-slate-400 mt-1">Relative Risk Reduction</div>
              </div>
              <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 font-mono text-sm border border-slate-200 dark:border-slate-700">
                <strong className="text-slate-700 dark:text-slate-300">NNT</strong> = 1 ÷ ARR
                <div className="text-xs text-slate-600 dark:text-slate-400 mt-1">Number Needed to Treat</div>
              </div>
              <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 font-mono text-sm border border-slate-200 dark:border-slate-700">
                <strong className="text-slate-700 dark:text-slate-300">Sens</strong> = TP ÷ (TP + FN) → SnNout
                <div className="text-xs text-slate-600 dark:text-slate-400 mt-1">Sensitivity rules OUT</div>
              </div>
            </div>
          </div>

          {/* Study Strategies */}
          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Study Strategy Modes</h4>
            <div className="grid md:grid-cols-3 gap-3">
              <div className="bg-slate-100 dark:bg-slate-800 rounded-lg p-3 border-l-4 border-slate-500">
                <div className="font-medium text-sm mb-1 text-slate-900 dark:text-slate-100">1. Untimed Mode</div>
                <p className="text-xs text-slate-600 dark:text-slate-400">Learn at your own pace. Read explanations carefully, look up guidelines. Best for early study.</p>
              </div>
              <div className="bg-slate-100 dark:bg-slate-800 rounded-lg p-3 border-l-4 border-slate-500">
                <div className="font-medium text-sm mb-1 text-slate-900 dark:text-slate-100">2. Timed with Notes</div>
                <p className="text-xs text-slate-600 dark:text-slate-400">Practice under time pressure but allow notes. Builds speed while maintaining learning.</p>
              </div>
              <div className="bg-slate-100 dark:bg-slate-800 rounded-lg p-3 border-l-4 border-slate-500">
                <div className="font-medium text-sm mb-1 text-slate-900 dark:text-slate-100">3. Exam Conditions</div>
                <p className="text-xs text-slate-600 dark:text-slate-400">Full simulation - timed, no notes. Best for final preparation and identifying weak areas.</p>
              </div>
            </div>
          </div>

          {/* Key Tips */}
          <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-4 border border-slate-200 dark:border-slate-700">
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Key Study Tips</h4>
            <ul className="text-sm text-slate-700 dark:text-slate-300 space-y-1">
              <li>• <strong>Consistency beats intensity</strong> – 1-2 hours daily is better than 8 hours once a week</li>
              <li>• <strong>Primary care first</strong> – manage safely in GP where appropriate; follow NICE pathways</li>
              <li>• <strong>Safety is rewarded</strong> – choose guideline-backed, low-harm answers</li>
              <li>• <strong>Know your formulas</strong> – EBP questions come up every sitting</li>
              <li>• <strong>Track progress</strong> – keep a log of mock scores; you should see improvement</li>
            </ul>
          </div>

          {/* IMG Support Section */}
          <div className="bg-slate-100 dark:bg-slate-800 rounded-lg p-4 border-l-4 border-slate-500">
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Additional Resources for International Medical Graduates (IMGs)</h4>
            <div className="space-y-3">
              <div className="bg-slate-50 dark:bg-slate-900 rounded-lg p-3">
                <h5 className="font-medium text-slate-900 dark:text-slate-100 mb-2">RCGP Resources</h5>
                <p className="text-sm text-slate-700 dark:text-slate-300 mb-2">
                  The RCGP provides specific guidance and support for international medical graduates preparing for the AKT.
                </p>
                <a 
                  href="https://www.rcgp.org.uk/training-exams/training/training-support/international-medical-graduates.aspx" 
                  target="_blank" 
                  rel="noopener noreferrer" 
                  className="text-slate-700 dark:text-slate-300 hover:underline text-sm font-medium"
                >
                  Visit RCGP IMG Support →
                </a>
              </div>
              <div className="bg-slate-50 dark:bg-slate-900 rounded-lg p-3">
                <h5 className="font-medium text-slate-900 dark:text-slate-100 mb-2">Key Areas to Focus On</h5>
                <ul className="text-sm text-slate-700 dark:text-slate-300 space-y-1 ml-4 list-disc">
                  <li>UK primary care guidelines (NICE, SIGN, BTS, etc.)</li>
                  <li>NHS structure and primary care systems</li>
                  <li>UK-specific clinical pathways and protocols</li>
                  <li>Evidence-based practice terminology and calculations</li>
                  <li>UK medical ethics and legal frameworks</li>
                </ul>
              </div>
              <div className="bg-slate-50 dark:bg-slate-900 rounded-lg p-3">
                <h5 className="font-medium text-slate-900 dark:text-slate-100 mb-2">Study Tips for IMGs</h5>
                <ul className="text-sm text-slate-700 dark:text-slate-300 space-y-1 ml-4 list-disc">
                  <li>Familiarize yourself with UK primary care context - many questions assume GP setting</li>
                  <li>Practice with UK-specific guidelines (NICE CKS is particularly important)</li>
                  <li>Understand UK healthcare system structure (QOF, contracts, referral pathways)</li>
                  <li>Focus on primary care management - when to manage in GP vs. refer to secondary care</li>
                  <li>Join IMG support groups and forums for peer support and study tips</li>
                </ul>
              </div>
            </div>
          </div>
        </CardContent>
      )}
    </Card>
  )
}
