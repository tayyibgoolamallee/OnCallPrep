'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Progress } from '@/components/ui/progress'
import ReactMarkdown from 'react-markdown'

interface Option {
  id: string
  text: string
}

interface Question {
  id: string
  topic: string
  question: string
  options: Option[]
  correct_option: string
  explanation: string
  guideline_refs: string[] | null
  difficulty: string | null
  is_pro: boolean | null
}

export default function AKTPracticePage() {
  const router = useRouter()
  const [questions, setQuestions] = useState<Question[]>([])
  const [currentIndex, setCurrentIndex] = useState(0)
  const [selectedOption, setSelectedOption] = useState<string | null>(null)
  const [showAnswer, setShowAnswer] = useState(false)
  const [score, setScore] = useState({ correct: 0, total: 0 })
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function loadQuestions() {
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()

      if (!user) {
        router.push('/login')
        return
      }

      const { data: profile } = await supabase
        .from('user_profiles')
        .select('subscription_tier')
        .eq('id', user.id)
        .single()

      const isPro = profile?.subscription_tier === 'pro'

      let query = supabase
        .from('akt_questions')
        .select('*')
        .eq('published', true)

      if (!isPro) {
        query = query.eq('is_pro', false)
      }

      const { data } = await query.limit(10)

      if (data) {
        const shuffled = data
          .map(q => ({
            ...q,
            options: q.options as unknown as Option[]
          }))
          .sort(() => Math.random() - 0.5)
        setQuestions(shuffled)
      }
      setLoading(false)
    }
    loadQuestions()
  }, [router])

  const currentQuestion = questions[currentIndex]

  async function handleAnswer(optionId: string) {
    if (showAnswer) return
    setSelectedOption(optionId)
    setShowAnswer(true)

    const isCorrect = optionId === currentQuestion.correct_option
    setScore(prev => ({
      correct: prev.correct + (isCorrect ? 1 : 0),
      total: prev.total + 1
    }))

    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()

    if (user) {
      await supabase.from('user_progress').upsert({
        user_id: user.id,
        content_type: 'akt',
        content_id: currentQuestion.id,
        completed: true,
        score: isCorrect ? 1 : 0,
      }, {
        onConflict: 'user_id,content_type,content_id'
      })
    }
  }

  function handleNext() {
    if (currentIndex < questions.length - 1) {
      setCurrentIndex(prev => prev + 1)
      setSelectedOption(null)
      setShowAnswer(false)
    }
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <p className="text-muted-foreground">Loading questions...</p>
      </div>
    )
  }

  if (questions.length === 0 || !currentQuestion) {
    return (
      <div className="text-center py-12">
        <p className="text-muted-foreground mb-4">No questions available</p>
        <Button onClick={() => router.push('/akt')}>Back to AKT</Button>
      </div>
    )
  }

  const isComplete = currentIndex >= questions.length - 1 && showAnswer
  const progressPercent = ((currentIndex + (showAnswer ? 1 : 0)) / questions.length) * 100

  return (
    <div className="max-w-3xl mx-auto space-y-6">
      <div className="flex items-center justify-between">
        <Button variant="ghost" onClick={() => router.push('/akt')}>
          ← Back to AKT
        </Button>
        <div className="text-sm text-muted-foreground">
          Question {currentIndex + 1} of {questions.length}
        </div>
      </div>

      {/* Progress */}
      <div className="space-y-2">
        <Progress value={progressPercent} className="h-2" />
        <div className="flex justify-between text-xs text-muted-foreground">
          <span>Score: {score.correct}/{score.total}</span>
          <span>{Math.round(progressPercent)}% complete</span>
        </div>
      </div>

      {!isComplete ? (
        <Card>
          <CardHeader>
            <div className="flex items-center justify-between">
              <Badge variant="secondary">{currentQuestion.topic}</Badge>
              <Badge variant={
                currentQuestion.difficulty === 'easy' ? 'secondary' :
                currentQuestion.difficulty === 'hard' ? 'destructive' : 'default'
              }>
                {currentQuestion.difficulty}
              </Badge>
            </div>
          </CardHeader>
          <CardContent className="space-y-6">
            {/* Question */}
            <div className="prose prose-sm dark:prose-invert">
              <ReactMarkdown>{currentQuestion.question}</ReactMarkdown>
            </div>

            {/* Options */}
            <div className="space-y-3">
              {currentQuestion.options?.filter(opt => opt && opt.id).map((option) => {
                const isSelected = selectedOption === option.id
                const isCorrect = option.id === currentQuestion.correct_option
                let className = 'w-full p-4 text-left border rounded-lg transition-colors '

                if (showAnswer) {
                  if (isCorrect) {
                    className += 'border-green-500 bg-green-50 dark:bg-green-950'
                  } else if (isSelected) {
                    className += 'border-destructive bg-destructive/10'
                  } else {
                    className += 'opacity-50'
                  }
                } else {
                  className += 'hover:bg-muted cursor-pointer'
                }

                return (
                  <button
                    key={option.id}
                    className={className}
                    onClick={() => handleAnswer(option.id)}
                    disabled={showAnswer}
                  >
                    <span className="font-medium mr-2">{option.id?.toUpperCase?.() || '?'}.</span>
                    {option.text}
                  </button>
                )
              })}
            </div>

            {/* Explanation */}
            {showAnswer && (
              <div className="space-y-4 pt-4 border-t">
                <div>
                  <h4 className="font-semibold mb-2">Explanation</h4>
                  <div className="prose prose-sm dark:prose-invert bg-muted p-4 rounded-lg">
                    <ReactMarkdown>{currentQuestion.explanation}</ReactMarkdown>
                  </div>
                </div>

                {currentQuestion.guideline_refs && currentQuestion.guideline_refs.length > 0 && (
                  <div>
                    <h4 className="font-semibold mb-2">Guideline References</h4>
                    <ul className="text-sm space-y-1">
                      {currentQuestion.guideline_refs.map((ref, i) => (
                        <li key={i} className="text-muted-foreground">• {ref}</li>
                      ))}
                    </ul>
                  </div>
                )}

                <div className="flex justify-end">
                  <Button onClick={handleNext}>
                    {currentIndex < questions.length - 1 ? 'Next Question' : 'Finish'}
                  </Button>
                </div>
              </div>
            )}
          </CardContent>
        </Card>
      ) : (
        <Card>
          <CardHeader className="text-center">
            <CardTitle className="text-2xl">Practice Complete!</CardTitle>
          </CardHeader>
          <CardContent className="text-center space-y-6">
            <div className="text-6xl font-bold text-primary">
              {score.total > 0 ? Math.round((score.correct / score.total) * 100) : 0}%
            </div>
            <p className="text-muted-foreground">
              You got {score.correct} out of {score.total} questions correct
            </p>
            <div className="flex justify-center gap-4">
              <Button variant="outline" onClick={() => router.push('/akt')}>
                Back to AKT
              </Button>
              <Button onClick={() => window.location.reload()}>
                Practice Again
              </Button>
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  )
}
