'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Progress } from '@/components/ui/progress'
import ReactMarkdown from 'react-markdown'

interface PatientInfo {
  age: number
  gender: string
  presenting_complaint: string
  [key: string]: unknown
}

interface SCACase {
  id: string
  title: string
  scenario: string
  patient_info: PatientInfo
  case_type: string
  time_limit: number
  difficulty: string | null
  key_points: string[]
  model_answer: string
  is_pro: boolean | null
}

export default function SCACasePage({
  params,
}: {
  params: Promise<{ id: string }>
}) {
  const router = useRouter()
  const [caseData, setCaseData] = useState<SCACase | null>(null)
  const [loading, setLoading] = useState(true)
  const [phase, setPhase] = useState<'info' | 'practice' | 'review'>('info')
  const [timeLeft, setTimeLeft] = useState(0)
  const [response, setResponse] = useState('')
  const [showAnswer, setShowAnswer] = useState(false)

  useEffect(() => {
    async function loadCase() {
      const { id } = await params
      const supabase = createClient()
      const { data } = await supabase
        .from('sca_cases')
        .select('*')
        .eq('id', id)
        .single()

      if (data) {
        setCaseData({
          ...data,
          patient_info: data.patient_info as unknown as PatientInfo
        })
        setTimeLeft(data.time_limit)
      }
      setLoading(false)
    }
    loadCase()
  }, [params])

  useEffect(() => {
    if (phase !== 'practice' || timeLeft <= 0) return

    const timer = setInterval(() => {
      setTimeLeft((t) => {
        if (t <= 1) {
          clearInterval(timer)
          setPhase('review')
          return 0
        }
        return t - 1
      })
    }, 1000)

    return () => clearInterval(timer)
  }, [phase, timeLeft])

  async function handleSubmit() {
    if (!caseData) return

    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()

    if (user) {
      await supabase.from('user_progress').upsert({
        user_id: user.id,
        content_type: 'sca',
        content_id: caseData.id,
        completed: true,
        time_taken: caseData.time_limit - timeLeft,
        user_response: response,
      }, {
        onConflict: 'user_id,content_type,content_id'
      })
    }

    setPhase('review')
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <p className="text-muted-foreground">Loading case...</p>
      </div>
    )
  }

  if (!caseData) {
    return (
      <div className="text-center py-12">
        <p className="text-muted-foreground mb-4">Case not found</p>
        <Button onClick={() => router.push('/sca')}>Back to SCA</Button>
      </div>
    )
  }

  const formatTime = (seconds: number) => {
    const mins = Math.floor(seconds / 60)
    const secs = seconds % 60
    return `${mins}:${secs.toString().padStart(2, '0')}`
  }

  const timeProgress = (timeLeft / caseData.time_limit) * 100

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <Button variant="ghost" onClick={() => router.push('/sca')}>
            ← Back to SCA
          </Button>
        </div>
        <div className="flex items-center gap-2">
          <Badge>{caseData.case_type}</Badge>
          <Badge variant={
            caseData.difficulty === 'easy' ? 'secondary' :
            caseData.difficulty === 'hard' ? 'destructive' : 'default'
          }>
            {caseData.difficulty}
          </Badge>
        </div>
      </div>

      <Card>
        <CardHeader>
          <CardTitle>{caseData.title}</CardTitle>
          <CardDescription>Time limit: {formatTime(caseData.time_limit)}</CardDescription>
        </CardHeader>
        <CardContent>
          {/* Patient Info */}
          <div className="bg-muted p-4 rounded-lg mb-6">
            <h3 className="font-semibold mb-2">Patient Information</h3>
            <div className="grid grid-cols-2 gap-2 text-sm">
              <div><span className="text-muted-foreground">Age:</span> {caseData.patient_info.age}</div>
              <div><span className="text-muted-foreground">Gender:</span> {caseData.patient_info.gender}</div>
              <div className="col-span-2">
                <span className="text-muted-foreground">Presenting complaint:</span>{' '}
                {caseData.patient_info.presenting_complaint}
              </div>
            </div>
          </div>

          {phase === 'info' && (
            <div className="space-y-4">
              <div className="prose prose-sm dark:prose-invert">
                <h3>Scenario</h3>
                <ReactMarkdown>{caseData.scenario}</ReactMarkdown>
              </div>
              <div className="flex justify-center pt-4">
                <Button size="lg" onClick={() => setPhase('practice')}>
                  Start Timed Practice
                </Button>
              </div>
            </div>
          )}

          {phase === 'practice' && (
            <div className="space-y-4">
              {/* Timer */}
              <div className="space-y-2">
                <div className="flex justify-between text-sm">
                  <span>Time remaining</span>
                  <span className={timeLeft < 30 ? 'text-destructive font-bold' : ''}>
                    {formatTime(timeLeft)}
                  </span>
                </div>
                <Progress
                  value={timeProgress}
                  className={`h-2 ${timeProgress < 25 ? '[&>div]:bg-destructive' : ''}`}
                />
              </div>

              {/* Response area */}
              <div>
                <label className="block text-sm font-medium mb-2">
                  Your response
                </label>
                <textarea
                  value={response}
                  onChange={(e) => setResponse(e.target.value)}
                  className="w-full h-48 p-3 border rounded-md bg-background resize-none focus:outline-none focus:ring-2 focus:ring-ring"
                  placeholder="Type your response here..."
                />
              </div>

              <div className="flex justify-end gap-2">
                <Button variant="outline" onClick={() => setPhase('review')}>
                  Skip to Review
                </Button>
                <Button onClick={handleSubmit}>
                  Submit Response
                </Button>
              </div>
            </div>
          )}

          {phase === 'review' && (
            <div className="space-y-6">
              {response && (
                <div>
                  <h3 className="font-semibold mb-2">Your Response</h3>
                  <div className="bg-muted p-4 rounded-lg text-sm whitespace-pre-wrap">
                    {response}
                  </div>
                </div>
              )}

              <div>
                <h3 className="font-semibold mb-2">Key Points to Cover</h3>
                <ul className="list-disc list-inside space-y-1 text-sm">
                  {caseData.key_points.map((point, i) => (
                    <li key={i}>{point}</li>
                  ))}
                </ul>
              </div>

              <div>
                <Button
                  variant="outline"
                  onClick={() => setShowAnswer(!showAnswer)}
                  className="mb-2"
                >
                  {showAnswer ? 'Hide' : 'Show'} Model Answer
                </Button>
                {showAnswer && (
                  <div className="prose prose-sm dark:prose-invert bg-muted p-4 rounded-lg">
                    <ReactMarkdown>{caseData.model_answer}</ReactMarkdown>
                  </div>
                )}
              </div>

              <div className="flex justify-center pt-4">
                <Button onClick={() => router.push('/sca')}>
                  Back to Cases
                </Button>
              </div>
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  )
}
