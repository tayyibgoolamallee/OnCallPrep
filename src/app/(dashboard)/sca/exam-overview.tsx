'use client'

import { useState } from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { ChevronDown, ChevronUp } from 'lucide-react'

export function SCAExamOverview() {
  const [isExpanded, setIsExpanded] = useState(false)

  return (
    <Card className="bg-gradient-to-br from-blue-50 to-blue-100/50 dark:from-blue-950/30 dark:to-blue-900/20 border-blue-200 dark:border-blue-800">
      <CardHeader className="pb-3">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <span className="text-2xl">🎯</span>
            <CardTitle className="text-lg">About the SCA</CardTitle>
          </div>
          <Button
            variant="ghost"
            size="sm"
            onClick={() => setIsExpanded(!isExpanded)}
            className="text-blue-700 dark:text-blue-300"
          >
            {isExpanded ? (
              <>Hide Details <ChevronUp className="ml-1 h-4 w-4" /></>
            ) : (
              <>Show Details <ChevronDown className="ml-1 h-4 w-4" /></>
            )}
          </Button>
        </div>
        <p className="text-sm text-muted-foreground mt-1">
          The Simulated Consultation Assessment tests your ability to manage consultations in a realistic GP setting.
        </p>
      </CardHeader>

      {isExpanded && (
        <CardContent className="space-y-6">
          {/* Quick Facts */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
            <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-3 text-center">
              <div className="text-2xl mb-1">⏱️</div>
              <div className="font-semibold text-blue-700 dark:text-blue-300">12 minutes</div>
              <div className="text-xs text-muted-foreground">per case</div>
            </div>
            <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-3 text-center">
              <div className="text-2xl mb-1">📋</div>
              <div className="font-semibold text-blue-700 dark:text-blue-300">12 cases</div>
              <div className="text-xs text-muted-foreground">total</div>
            </div>
            <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-3 text-center">
              <div className="text-2xl mb-1">🕐</div>
              <div className="font-semibold text-blue-700 dark:text-blue-300">~3 hours</div>
              <div className="text-xs text-muted-foreground">with breaks</div>
            </div>
            <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-3 text-center">
              <div className="text-2xl mb-1">🎭</div>
              <div className="font-semibold text-blue-700 dark:text-blue-300">Actors</div>
              <div className="text-xs text-muted-foreground">simulated patients</div>
            </div>
          </div>

          {/* 12-Minute Framework */}
          <div>
            <h4 className="font-semibold mb-3">The 12-Minute Consultation Framework</h4>
            <div className="grid md:grid-cols-4 gap-3">
              <div className="bg-blue-100 dark:bg-blue-900/40 rounded-lg p-3 border-l-4 border-blue-500">
                <div className="font-bold text-blue-700 dark:text-blue-300 text-lg">0-1 min</div>
                <div className="font-medium text-sm">Opening & Verification</div>
                <ul className="text-xs text-muted-foreground mt-1 space-y-0.5">
                  <li>• Introductions</li>
                  <li>• Patient verification</li>
                  <li>• Golden minute</li>
                </ul>
              </div>
              <div className="bg-green-100 dark:bg-green-900/40 rounded-lg p-3 border-l-4 border-green-500">
                <div className="font-bold text-green-700 dark:text-green-300 text-lg">2-6 min</div>
                <div className="font-medium text-sm">Data Gathering & ICE</div>
                <ul className="text-xs text-muted-foreground mt-1 space-y-0.5">
                  <li>• History taking</li>
                  <li>• Ideas, Concerns, Expectations</li>
                  <li>• Relevant past history</li>
                </ul>
              </div>
              <div className="bg-amber-100 dark:bg-amber-900/40 rounded-lg p-3 border-l-4 border-amber-500">
                <div className="font-bold text-amber-700 dark:text-amber-300 text-lg">7-11 min</div>
                <div className="font-medium text-sm">Explanation & Options</div>
                <ul className="text-xs text-muted-foreground mt-1 space-y-0.5">
                  <li>• Explain diagnosis</li>
                  <li>• Management options</li>
                  <li>• Shared decision-making</li>
                </ul>
              </div>
              <div className="bg-purple-100 dark:bg-purple-900/40 rounded-lg p-3 border-l-4 border-purple-500">
                <div className="font-bold text-purple-700 dark:text-purple-300 text-lg">11-12 min</div>
                <div className="font-medium text-sm">Closing & Safety</div>
                <ul className="text-xs text-muted-foreground mt-1 space-y-0.5">
                  <li>• Agree plan</li>
                  <li>• Arrange follow-up</li>
                  <li>• Safety netting</li>
                </ul>
              </div>
            </div>
          </div>

          {/* Marking Domains */}
          <div>
            <h4 className="font-semibold mb-3">Marking Domains</h4>
            <p className="text-sm text-muted-foreground mb-3">
              Each domain is scored 0-4 points. <strong>Domain 2 is weighted 1.5x</strong> (total possible: 10.5 points).
            </p>
            <div className="grid md:grid-cols-3 gap-3">
              <div className="bg-blue-50 dark:bg-blue-900/30 rounded-lg p-3 border-l-4 border-blue-500">
                <div className="font-semibold text-blue-700 dark:text-blue-300 mb-1">Domain 1: Data Gathering</div>
                <ul className="text-xs text-muted-foreground space-y-0.5">
                  <li>• History taking</li>
                  <li>• Physical examination</li>
                  <li>• Interpretation of findings</li>
                  <li>• Clinical reasoning</li>
                </ul>
              </div>
              <div className="bg-green-50 dark:bg-green-900/30 rounded-lg p-3 border-l-4 border-green-500">
                <div className="font-semibold text-green-700 dark:text-green-300 mb-1">Domain 2: Clinical Management</div>
                <div className="text-xs font-medium text-green-600 dark:text-green-400 mb-1">⚡ Weighted 1.5x</div>
                <ul className="text-xs text-muted-foreground space-y-0.5">
                  <li>• Diagnosis and differentials</li>
                  <li>• Management plan</li>
                  <li>• Safety netting</li>
                  <li>• Follow-up</li>
                </ul>
              </div>
              <div className="bg-purple-50 dark:bg-purple-900/30 rounded-lg p-3 border-l-4 border-purple-500">
                <div className="font-semibold text-purple-700 dark:text-purple-300 mb-1">Domain 3: Interpersonal Skills</div>
                <ul className="text-xs text-muted-foreground space-y-0.5">
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
            <h4 className="font-semibold mb-3">Grading System</h4>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
              <div className="bg-green-100 dark:bg-green-900/40 rounded-lg p-3 text-center border-l-4 border-green-600">
                <div className="text-2xl font-bold text-green-700 dark:text-green-300">4</div>
                <div className="font-medium text-sm">Clear Pass</div>
                <div className="text-xs text-muted-foreground">&gt;9/10.5</div>
              </div>
              <div className="bg-blue-100 dark:bg-blue-900/40 rounded-lg p-3 text-center border-l-4 border-blue-600">
                <div className="text-2xl font-bold text-blue-700 dark:text-blue-300">3</div>
                <div className="font-medium text-sm">Pass</div>
                <div className="text-xs text-muted-foreground">6-9/10.5</div>
              </div>
              <div className="bg-amber-100 dark:bg-amber-900/40 rounded-lg p-3 text-center border-l-4 border-amber-600">
                <div className="text-2xl font-bold text-amber-700 dark:text-amber-300">2</div>
                <div className="font-medium text-sm">Fail</div>
                <div className="text-xs text-muted-foreground">3-6/10.5</div>
              </div>
              <div className="bg-red-100 dark:bg-red-900/40 rounded-lg p-3 text-center border-l-4 border-red-600">
                <div className="text-2xl font-bold text-red-700 dark:text-red-300">1</div>
                <div className="font-medium text-sm">Clear Fail</div>
                <div className="text-xs text-muted-foreground">&lt;3/10.5</div>
              </div>
            </div>
          </div>

          {/* Exam Day Tips */}
          <div className="bg-white/70 dark:bg-gray-900/50 rounded-lg p-4">
            <h4 className="font-semibold mb-2">Exam Day Tips</h4>
            <ul className="text-sm text-muted-foreground space-y-1">
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
