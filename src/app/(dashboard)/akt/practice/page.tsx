'use client'

import { useState, useEffect } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Progress } from '@/components/ui/progress'
import ReactMarkdown from 'react-markdown'
// import QuestionFeedback from '@/components/QuestionFeedback' // Temporarily disabled for debugging

interface Option {
  id?: string
  label?: string
  text: string
}

// Helper to get option identifier (handles both 'id' and 'label' formats)
const getOptionId = (opt: Option): string => opt.id || opt.label || ''

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

const QUESTION_COUNT_OPTIONS = [10, 20, 30, 50, 100, 200]

export default function AKTPracticePage() {
  const router = useRouter()
  const searchParams = useSearchParams()
  const [phase, setPhase] = useState<'setup' | 'practice' | 'complete'>('setup')
  const [questions, setQuestions] = useState<Question[]>([])
  const [availableCount, setAvailableCount] = useState(0)
  const [selectedCount, setSelectedCount] = useState(20)
  const [selectedTopic, setSelectedTopic] = useState<string | null>(null)
  const [availableTopics, setAvailableTopics] = useState<string[]>([])
  const [currentIndex, setCurrentIndex] = useState(0)
  const [selectedOption, setSelectedOption] = useState<string | null>(null)
  const [showAnswer, setShowAnswer] = useState(false)
  const [score, setScore] = useState({ correct: 0, total: 0 })
  const [loading, setLoading] = useState(true)
  const [isPro, setIsPro] = useState(false)

  // Load available question count on mount
  useEffect(() => {
    async function checkAvailability() {
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

      const userIsPro = profile?.subscription_tier === 'pro'
      setIsPro(userIsPro)

      // Count available questions and get topics
      let query = supabase
        .from('akt_questions')
        .select('id, topic', { count: 'exact' })
        .eq('published', true)

      if (!userIsPro) {
        query = query.eq('is_pro', false)
      }

      const { data, count } = await query

      setAvailableCount(count || 0)
      
      // Get unique topics
      const topics = [...new Set(data?.map(q => q.topic).filter((t): t is string => !!t) || [])].sort()
      setAvailableTopics(topics)
      
      // Check if topic is in URL params
      const topicParam = searchParams.get('topic')
      if (topicParam && topics.includes(topicParam)) {
        setSelectedTopic(topicParam)
      }
      
      setLoading(false)
    }
    checkAvailability()
  }, [router, searchParams])

  async function startPractice() {
    setLoading(true)
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()

    if (!user) {
      router.push('/login')
      return
    }

    let query = supabase
      .from('akt_questions')
      .select('*')
      .eq('published', true)

    if (!isPro) {
      query = query.eq('is_pro', false)
    }

    // Filter by topic if selected
    if (selectedTopic) {
      query = query.eq('topic', selectedTopic)
    }

    const { data } = await query.limit(selectedCount)

    if (data) {
      const shuffled = data
        .map(q => ({
          ...q,
          options: q.options as unknown as Option[]
        }))
        .sort(() => Math.random() - 0.5)
      setQuestions(shuffled)
      setPhase('practice')
    }
    setLoading(false)
  }

  const currentQuestion = questions[currentIndex]

  async function handleAnswer(optionId: string) {
    if (showAnswer) return
    setSelectedOption(optionId)
    setShowAnswer(true)

    // Case-insensitive comparison since labels might be uppercase (A, B, C) and correct_option lowercase (a, b, c)
    const isCorrect = optionId.toLowerCase() === currentQuestion.correct_option?.toLowerCase()
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
    } else {
      setPhase('complete')
    }
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <p className="text-muted-foreground">Loading...</p>
      </div>
    )
  }

  // Setup Phase - Choose number of questions
  if (phase === 'setup') {
    return (
      <div className="max-w-2xl mx-auto space-y-6">
        <div className="flex items-center justify-between">
          <Button variant="ghost" onClick={() => router.push('/akt')}>
            ← Back to AKT
          </Button>
        </div>

        <Card>
          <CardHeader className="text-center">
            <CardTitle className="text-2xl">AKT Practice Session</CardTitle>
            <CardDescription>
              Choose how many questions you want to practice
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-6">
            <div className="text-center text-sm text-muted-foreground">
              <span className="font-semibold text-foreground">{availableCount}</span> questions available
              {!isPro && <span className="ml-2">(Upgrade to Pro for more)</span>}
            </div>

            {/* Topic Selection */}
            <div>
              <label className="text-sm font-medium mb-2 block">Filter by Topic (Optional)</label>
              <select
                value={selectedTopic || ''}
                onChange={(e) => setSelectedTopic(e.target.value || null)}
                className="w-full p-2 border rounded-lg bg-background"
              >
                <option value="">All Topics</option>
                {availableTopics.map((topic) => (
                  <option key={topic} value={topic}>{topic}</option>
                ))}
              </select>
              {selectedTopic && (
                <p className="text-xs text-muted-foreground mt-1">
                  Questions will be filtered to: <strong>{selectedTopic}</strong>
                </p>
              )}
            </div>

            <div className="grid grid-cols-3 gap-3">
              {QUESTION_COUNT_OPTIONS.map((count) => {
                const isDisabled = count > availableCount
                const isSelected = selectedCount === count
                return (
                  <button
                    key={count}
                    onClick={() => !isDisabled && setSelectedCount(count)}
                    disabled={isDisabled}
                    className={`
                      p-4 rounded-lg border-2 transition-all text-center
                      ${isSelected 
                        ? 'border-primary bg-primary/10 text-primary font-semibold' 
                        : 'border-muted hover:border-primary/50'
                      }
                      ${isDisabled ? 'opacity-40 cursor-not-allowed' : 'cursor-pointer'}
                    `}
                  >
                    <div className="text-2xl font-bold">{count}</div>
                    <div className="text-xs text-muted-foreground">questions</div>
                  </button>
                )
              })}
            </div>

            <div className="pt-4">
              <Button 
                onClick={startPractice} 
                className="w-full" 
                size="lg"
                disabled={selectedCount > availableCount}
              >
                Start Practice ({selectedCount} questions)
              </Button>
            </div>

            <div className="text-center text-xs text-muted-foreground">
              Questions will be randomly selected and shuffled
            </div>
          </CardContent>
        </Card>
      </div>
    )
  }

  // Practice Phase
  if (phase === 'practice') {
    if (questions.length === 0 || !currentQuestion) {
      return (
        <div className="text-center py-12">
          <p className="text-muted-foreground mb-4">No questions available</p>
          <Button onClick={() => router.push('/akt')}>Back to AKT</Button>
        </div>
      )
    }

    const progressPercent = ((currentIndex + (showAnswer ? 1 : 0)) / questions.length) * 100

    return (
      <div className="max-w-3xl mx-auto space-y-6">
        <div className="flex items-center justify-between">
          <Button variant="ghost" onClick={() => setPhase('setup')}>
            ← End Session
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

        <Card>
          <CardHeader>
            <div className="flex items-center justify-between">
              <Badge variant="secondary">{currentQuestion.topic}</Badge>
              {currentQuestion.difficulty && (
                <Badge variant={
                  currentQuestion.difficulty === 'easy' ? 'secondary' :
                  currentQuestion.difficulty === 'hard' ? 'destructive' : 'default'
                }>
                  {currentQuestion.difficulty}
                </Badge>
              )}
            </div>
          </CardHeader>
          <CardContent className="space-y-6">
            {/* Question */}
            <div className="prose prose-sm dark:prose-invert">
              <ReactMarkdown>{currentQuestion.question}</ReactMarkdown>
            </div>

            {/* Options */}
            <div className="space-y-3">
              {currentQuestion.options?.filter(opt => opt && (opt.id || opt.label)).map((option) => {
                const optionId = getOptionId(option)
                const isSelected = selectedOption === optionId
                const isCorrect = optionId.toLowerCase() === currentQuestion.correct_option?.toLowerCase()
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
                    key={optionId}
                    className={className}
                    onClick={() => handleAnswer(optionId)}
                    disabled={showAnswer}
                  >
                    <span className="font-medium mr-2">{optionId.toUpperCase()}.</span>
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

                {/* Feedback Component - Temporarily disabled for debugging */}
                {/* <div className="pt-4">
                  <QuestionFeedback
                    questionId={currentQuestion.id}
                    topic={currentQuestion.topic}
                    difficulty={currentQuestion.difficulty}
                  />
                </div> */}

                <div className="flex justify-end pt-4">
                  <Button onClick={handleNext}>
                    {currentIndex < questions.length - 1 ? 'Next Question' : 'Finish'}
                  </Button>
                </div>
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    )
  }

  // Complete Phase
  return (
    <div className="max-w-2xl mx-auto">
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
          
          {/* Performance breakdown */}
          <div className="grid grid-cols-3 gap-4 py-4">
            <div className="text-center">
              <div className="text-2xl font-bold text-green-600">{score.correct}</div>
              <div className="text-xs text-muted-foreground">Correct</div>
            </div>
            <div className="text-center">
              <div className="text-2xl font-bold text-red-600">{score.total - score.correct}</div>
              <div className="text-xs text-muted-foreground">Incorrect</div>
            </div>
            <div className="text-center">
              <div className="text-2xl font-bold">{score.total}</div>
              <div className="text-xs text-muted-foreground">Total</div>
            </div>
          </div>

          <div className="flex justify-center gap-4 pt-4">
            <Button variant="outline" onClick={() => router.push('/akt')}>
              Back to AKT
            </Button>
            <Button onClick={() => {
              setPhase('setup')
              setQuestions([])
              setCurrentIndex(0)
              setSelectedOption(null)
              setShowAnswer(false)
              setScore({ correct: 0, total: 0 })
              setSelectedTopic(null)
            }}>
              Practice Again
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
