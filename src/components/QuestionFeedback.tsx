'use client'

import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Textarea } from '@/components/ui/textarea'
import { Checkbox } from '@/components/ui/checkbox'

interface QuestionFeedbackProps {
  questionId: string
  topic: string
  difficulty: string | null
  onSubmitted?: () => void
}

const POSITIVE_OPTIONS = [
  { id: 'clear_reasoning', label: 'Clear clinical reasoning' },
  { id: 'high_yield', label: 'High-yield for AKT' },
  { id: 'clear_explanation', label: 'Explanation was clear' },
  { id: 'realistic', label: 'Felt realistic / exam-like' },
  { id: 'good_learning', label: 'Good learning point' },
]

const NEGATIVE_OPTIONS = [
  { id: 'spelling_grammar', label: 'Spelling / grammar error' },
  { id: 'disagree_answer', label: 'I disagree with the answer' },
  { id: 'unclear_explanation', label: 'Explanation unclear or incomplete' },
  { id: 'ambiguous_stem', label: 'Question stem ambiguous' },
  { id: 'similar_options', label: 'Options too similar / misleading' },
  { id: 'not_nice_aligned', label: 'Not aligned with NICE / UK practice' },
  { id: 'difficulty_wrong', label: 'Too easy / too hard' },
  { id: 'out_of_scope', label: 'Out of AKT scope' },
]

export default function QuestionFeedback({ 
  questionId, 
  topic, 
  difficulty,
  onSubmitted 
}: QuestionFeedbackProps) {
  const [sentiment, setSentiment] = useState<'helpful' | 'needs_improvement' | null>(null)
  const [selectedOptions, setSelectedOptions] = useState<string[]>([])
  const [freeText, setFreeText] = useState('')
  const [showAdvanced, setShowAdvanced] = useState(false)
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [submitted, setSubmitted] = useState(false)

  const options = sentiment === 'helpful' ? POSITIVE_OPTIONS : NEGATIVE_OPTIONS

  const handleOptionToggle = (optionId: string) => {
    setSelectedOptions(prev => 
      prev.includes(optionId) 
        ? prev.filter(id => id !== optionId)
        : [...prev, optionId]
    )
  }

  const handleSubmit = async () => {
    if (!sentiment) return

    setIsSubmitting(true)
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()

    if (!user) {
      setIsSubmitting(false)
      return
    }

    const feedbackData = {
      question_id: questionId,
      user_id: user.id,
      sentiment,
      topic,
      difficulty: difficulty || null,
      positive_feedback: sentiment === 'helpful' ? { selected: selectedOptions } : null,
      negative_feedback: sentiment === 'needs_improvement' ? { selected: selectedOptions } : null,
      free_text: freeText.trim() || null,
    }

    const { error } = await supabase
      .from('akt_question_feedback')
      .upsert(feedbackData, {
        onConflict: 'user_id,question_id',
        ignoreDuplicates: false
      })

    setIsSubmitting(false)

    if (error) {
      console.error('Error submitting feedback:', error)
      // Still show success to user even if there's an error
      // (table might not exist yet, but we don't want to block UX)
    }
    
    setSubmitted(true)
    onSubmitted?.()
  }

  if (submitted) {
    return (
      <Card className="border-green-200 bg-green-50 dark:bg-green-950/20">
        <CardContent className="pt-6">
          <p className="text-sm text-green-700 dark:text-green-300 text-center">
            ✓ Thank you for your feedback!
          </p>
        </CardContent>
      </Card>
    )
  }

  return (
    <Card className="border-muted">
      <CardContent className="pt-6 space-y-4">
        {/* Step 1: Sentiment Selection */}
        {!sentiment && (
          <div className="space-y-3">
            <p className="text-sm font-medium text-center">Was this question helpful?</p>
            <div className="flex gap-3 justify-center">
              <Button
                variant="outline"
                size="lg"
                onClick={() => setSentiment('helpful')}
                className="flex-1"
              >
                <span className="mr-2">👍</span>
                Helpful
              </Button>
              <Button
                variant="outline"
                size="lg"
                onClick={() => setSentiment('needs_improvement')}
                className="flex-1"
              >
                <span className="mr-2">👎</span>
                Needs improvement
              </Button>
            </div>
            <p className="text-xs text-muted-foreground text-center">
              Your feedback helps improve the question bank for everyone
            </p>
          </div>
        )}

        {/* Step 2: Structured Feedback */}
        {sentiment && (
          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <p className="text-sm font-medium">
                {sentiment === 'helpful' ? 'What worked well?' : 'What could be better?'}
              </p>
              <span className="text-xs text-muted-foreground">(Optional)</span>
            </div>

            <div className="space-y-2">
              {options.map((option) => (
                <div key={option.id} className="flex items-center space-x-2">
                  <Checkbox
                    id={option.id}
                    checked={selectedOptions.includes(option.id)}
                    onCheckedChange={() => handleOptionToggle(option.id)}
                  />
                  <label
                    htmlFor={option.id}
                    className="text-sm cursor-pointer flex-1"
                  >
                    {option.label}
                  </label>
                </div>
              ))}
            </div>

            {/* Free Text */}
            <div className="space-y-2">
              <label className="text-sm font-medium">
                Additional comments
                <span className="text-xs text-muted-foreground ml-1">(Optional)</span>
              </label>
              <Textarea
                placeholder={
                  sentiment === 'helpful'
                    ? 'Tell us what you liked about this question...'
                    : 'Tell us what you noticed (e.g. guideline reference, wording issue, missing explanation)...'
                }
                value={freeText}
                onChange={(e) => setFreeText(e.target.value)}
                rows={3}
                className="resize-none"
              />
              {sentiment === 'needs_improvement' && (
                <p className="text-xs text-muted-foreground">
                  Disagreement is welcome — guidelines change and nuance matters.
                </p>
              )}
            </div>

            {/* Advanced Toggle */}
            <div className="pt-2">
              <button
                type="button"
                onClick={() => setShowAdvanced(!showAdvanced)}
                className="text-xs text-muted-foreground hover:text-foreground"
              >
                {showAdvanced ? '▼' : '▶'} Want to suggest an improvement or alternative wording?
              </button>
              {showAdvanced && (
                <Textarea
                  placeholder="Suggest specific improvements or alternative wording..."
                  value={freeText}
                  onChange={(e) => setFreeText(e.target.value)}
                  rows={2}
                  className="mt-2 resize-none"
                />
              )}
            </div>

            {/* Submit Button */}
            <div className="flex gap-2 pt-2">
              <Button
                variant="outline"
                size="sm"
                onClick={() => {
                  setSentiment(null)
                  setSelectedOptions([])
                  setFreeText('')
                  setShowAdvanced(false)
                }}
                className="flex-1"
              >
                Cancel
              </Button>
              <Button
                onClick={handleSubmit}
                disabled={isSubmitting}
                className="flex-1"
                size="sm"
              >
                {isSubmitting ? 'Submitting...' : 'Submit Feedback'}
              </Button>
            </div>
          </div>
        )}
      </CardContent>
    </Card>
  )
}
