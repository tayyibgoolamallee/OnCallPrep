'use client'

import { useState } from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'

export function SCAExamOverview() {
  const [isExpanded, setIsExpanded] = useState(false)

  return (
    <Card className="border-2 border-teal-200 dark:border-teal-800 bg-white dark:bg-slate-900">
      <CardHeader className="bg-teal-600 dark:bg-teal-800 text-white rounded-t-lg">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <span className="text-2xl">🎯</span>
            <CardTitle className="text-lg">About the SCA</CardTitle>
          </div>
          <Button
            variant="ghost"
            size="sm"
            onClick={() => setIsExpanded(!isExpanded)}
            className="text-white hover:bg-teal-700 dark:hover:bg-teal-900"
          >
            {isExpanded ? 'Hide Details ▲' : 'Show Details ▼'}
          </Button>
        </div>
        <p className="text-sm text-teal-100 mt-1">
          The Simulated Consultation Assessment tests your ability to manage consultations in a realistic GP setting.
        </p>
      </CardHeader>

      {isExpanded && (
        <CardContent className="pt-6 space-y-6">
          {/* Quick Facts */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
            <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 text-center border border-slate-200 dark:border-slate-700">
              <div className="text-2xl mb-1">⏱️</div>
              <div className="font-semibold text-slate-900 dark:text-slate-100">12 minutes</div>
              <div className="text-xs text-slate-600 dark:text-slate-400">per case</div>
            </div>
            <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 text-center border border-slate-200 dark:border-slate-700">
              <div className="text-2xl mb-1">📋</div>
              <div className="font-semibold text-slate-900 dark:text-slate-100">12 cases</div>
              <div className="text-xs text-slate-600 dark:text-slate-400">total</div>
            </div>
            <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 text-center border border-slate-200 dark:border-slate-700">
              <div className="text-2xl mb-1">📅</div>
              <div className="font-semibold text-slate-900 dark:text-slate-100">9 sittings</div>
              <div className="text-xs text-slate-600 dark:text-slate-400">per year</div>
            </div>
            <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 text-center border border-slate-200 dark:border-slate-700">
              <div className="text-2xl mb-1">🎭</div>
              <div className="font-semibold text-slate-900 dark:text-slate-100">Actors</div>
              <div className="text-xs text-slate-600 dark:text-slate-400">simulated patients</div>
            </div>
          </div>

          {/* 12-Minute Framework */}
          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">The 12-Minute Consultation Framework</h4>
            <div className="grid md:grid-cols-4 gap-3">
              <div className="bg-teal-50 dark:bg-teal-950/30 rounded-lg p-3 border-l-4 border-teal-600">
                <div className="font-bold text-teal-700 dark:text-teal-400 text-lg">0-1 min</div>
                <div className="font-medium text-sm text-slate-900 dark:text-slate-100">Opening & Verification</div>
                <ul className="text-xs text-slate-700 dark:text-slate-300 mt-1 space-y-0.5">
                  <li>• Introductions</li>
                  <li>• Patient verification</li>
                  <li>• Golden minute</li>
                </ul>
              </div>
              <div className="bg-slate-100 dark:bg-slate-800 rounded-lg p-3 border-l-4 border-slate-400">
                <div className="font-bold text-slate-700 dark:text-slate-300 text-lg">2-6 min</div>
                <div className="font-medium text-sm text-slate-900 dark:text-slate-100">Data Gathering & ICE</div>
                <ul className="text-xs text-slate-700 dark:text-slate-300 mt-1 space-y-0.5">
                  <li>• History taking</li>
                  <li>• Ideas, Concerns, Expectations</li>
                  <li>• Relevant past history</li>
                </ul>
              </div>
              <div className="bg-teal-50 dark:bg-teal-950/30 rounded-lg p-3 border-l-4 border-teal-600">
                <div className="font-bold text-teal-700 dark:text-teal-400 text-lg">7-11 min</div>
                <div className="font-medium text-sm text-slate-900 dark:text-slate-100">Explanation & Options</div>
                <ul className="text-xs text-slate-700 dark:text-slate-300 mt-1 space-y-0.5">
                  <li>• Explain diagnosis</li>
                  <li>• Management options</li>
                  <li>• Shared decision-making</li>
                </ul>
              </div>
              <div className="bg-slate-100 dark:bg-slate-800 rounded-lg p-3 border-l-4 border-slate-400">
                <div className="font-bold text-slate-700 dark:text-slate-300 text-lg">11-12 min</div>
                <div className="font-medium text-sm text-slate-900 dark:text-slate-100">Closing & Safety</div>
                <ul className="text-xs text-slate-700 dark:text-slate-300 mt-1 space-y-0.5">
                  <li>• Agree plan</li>
                  <li>• Arrange follow-up</li>
                  <li>• Safety netting</li>
                </ul>
              </div>
            </div>
          </div>

          {/* Marking Domains */}
          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Marking Domains</h4>
            <p className="text-sm text-slate-700 dark:text-slate-300 mb-3">
              Each domain is scored 0-4 points. <strong>Domain 2 is weighted 1.5x</strong> (total possible: 10.5 points).
            </p>
            <div className="grid md:grid-cols-3 gap-3">
              <div className="bg-teal-50 dark:bg-teal-950/30 rounded-lg p-3 border-l-4 border-teal-600">
                <div className="font-semibold text-teal-700 dark:text-teal-400 mb-1">Domain 1: Data Gathering</div>
                <ul className="text-xs text-slate-700 dark:text-slate-300 space-y-0.5">
                  <li>• History taking</li>
                  <li>• Physical examination</li>
                  <li>• Interpretation of findings</li>
                  <li>• Clinical reasoning</li>
                </ul>
              </div>
              <div className="bg-slate-100 dark:bg-slate-800 rounded-lg p-3 border-l-4 border-slate-400">
                <div className="font-semibold text-slate-700 dark:text-slate-300 mb-1">Domain 2: Clinical Management</div>
                <div className="text-xs font-medium text-teal-600 dark:text-teal-500 mb-1">⚡ Weighted 1.5x</div>
                <ul className="text-xs text-slate-700 dark:text-slate-300 space-y-0.5">
                  <li>• Diagnosis and differentials</li>
                  <li>• Management plan</li>
                  <li>• Safety netting</li>
                  <li>• Follow-up</li>
                </ul>
              </div>
              <div className="bg-teal-50 dark:bg-teal-950/30 rounded-lg p-3 border-l-4 border-teal-600">
                <div className="font-semibold text-teal-700 dark:text-teal-400 mb-1">Domain 3: Interpersonal Skills</div>
                <ul className="text-xs text-slate-700 dark:text-slate-300 space-y-0.5">
                  <li>• Communication</li>
                  <li>• Empathy</li>
                  <li>• Patient-centred care</li>
                  <li>• Professionalism</li>
                </ul>
              </div>
            </div>
          </div>

          {/* Grading */}
          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Grading System</h4>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
              <div className="bg-teal-50 dark:bg-teal-950/30 rounded-lg p-3 text-center border-l-4 border-teal-600">
                <div className="text-2xl font-bold text-teal-700 dark:text-teal-400">4</div>
                <div className="font-medium text-sm text-slate-900 dark:text-slate-100">Clear Pass</div>
                <div className="text-xs text-slate-600 dark:text-slate-400">&gt;9/10.5</div>
              </div>
              <div className="bg-slate-100 dark:bg-slate-800 rounded-lg p-3 text-center border-l-4 border-slate-400">
                <div className="text-2xl font-bold text-slate-700 dark:text-slate-300">3</div>
                <div className="font-medium text-sm text-slate-900 dark:text-slate-100">Pass</div>
                <div className="text-xs text-slate-600 dark:text-slate-400">6-9/10.5</div>
              </div>
              <div className="bg-slate-100 dark:bg-slate-800 rounded-lg p-3 text-center border-l-4 border-slate-400">
                <div className="text-2xl font-bold text-slate-700 dark:text-slate-300">2</div>
                <div className="font-medium text-sm text-slate-900 dark:text-slate-100">Fail</div>
                <div className="text-xs text-slate-600 dark:text-slate-400">3-6/10.5</div>
              </div>
              <div className="bg-slate-100 dark:bg-slate-800 rounded-lg p-3 text-center border-l-4 border-slate-400">
                <div className="text-2xl font-bold text-slate-700 dark:text-slate-300">1</div>
                <div className="font-medium text-sm text-slate-900 dark:text-slate-100">Clear Fail</div>
                <div className="text-xs text-slate-600 dark:text-slate-400">&lt;3/10.5</div>
              </div>
            </div>
          </div>

          {/* Exam Day Tips */}
          <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-4 border border-slate-200 dark:border-slate-700">
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Exam Day Tips</h4>
            <ul className="text-sm text-slate-700 dark:text-slate-300 space-y-1">
              <li>• <strong>Arrive early</strong> – give yourself time to settle and breathe</li>
              <li>• <strong>Stay calm between cases</strong> – one slow breath resets focus</li>
              <li>• <strong>Use the full 2 minutes</strong> – read notes carefully; no rush</li>
              <li>• <strong>Domain 2 first</strong> – safe, shared plans and safety netting</li>
              <li>• <strong>Be yourself</strong> – natural, kind consulting is what passes</li>
            </ul>
          </div>
        </CardContent>
      )}
    </Card>
  )
}
