'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

const contactCategories = [
  { id: 'feedback', label: 'Feedback & Suggestions', icon: '💬' },
  { id: 'bug', label: 'Report a Bug', icon: '🐛' },
  { id: 'feature', label: 'Feature Request', icon: '✨' },
  { id: 'question', label: 'General Question', icon: '❓' },
  { id: 'technical', label: 'Technical Support', icon: '🔧' },
  { id: 'billing', label: 'Billing Inquiry', icon: '💳' },
  { id: 'other', label: 'Other', icon: '📝' },
]

const preFilledQuestions: Record<string, string[]> = {
  feedback: [
    'How can we improve the user experience?',
    'What features would be most helpful?',
    'Is there content you\'d like to see added?',
  ],
  bug: [
    'What page/feature is not working?',
    'What were you trying to do when the error occurred?',
    'Can you describe the issue in detail?',
  ],
  feature: [
    'What feature would you like to see?',
    'How would this feature help your training?',
    'Is this related to AKT, SCA, or Portfolio?',
  ],
  question: [
    'What would you like to know?',
    'Is this about pricing or features?',
    'How can we help you?',
  ],
  technical: [
    'What technical issue are you experiencing?',
    'What device/browser are you using?',
    'Have you tried clearing your cache?',
  ],
  billing: [
    'What is your billing question?',
    'Are you having trouble with payment?',
    'Do you need help with your subscription?',
  ],
}

export default function ContactForm() {
  const [category, setCategory] = useState<string>('')
  const [selectedQuestion, setSelectedQuestion] = useState<string>('')
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    subject: '',
    message: '',
  })
  const [submitted, setSubmitted] = useState(false)
  const [loading, setLoading] = useState(false)

  const handleCategorySelect = (catId: string) => {
    setCategory(catId)
    setSelectedQuestion('')
    setFormData(prev => ({ ...prev, subject: '', message: '' }))
  }

  const handleQuestionSelect = (question: string) => {
    setSelectedQuestion(question)
    setFormData(prev => ({ ...prev, subject: question }))
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)

    try {
      const response = await fetch('/api/contact', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          ...formData,
          category,
          selectedQuestion,
        }),
      })

      if (response.ok) {
        setSubmitted(true)
        setFormData({ name: '', email: '', subject: '', message: '' })
        setCategory('')
        setSelectedQuestion('')
      } else {
        alert('There was an error submitting your message. Please try again.')
      }
    } catch (error) {
      alert('There was an error submitting your message. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  if (submitted) {
    return (
      <Card className="border-green-200 bg-green-50">
        <CardContent className="pt-6">
          <div className="text-center">
            <div className="text-4xl mb-4">✓</div>
            <h3 className="text-lg font-semibold text-green-800 mb-2">Thank you for contacting us!</h3>
            <p className="text-sm text-green-700">
              We've received your message and will get back to you as soon as possible.
            </p>
            <Button
              onClick={() => setSubmitted(false)}
              variant="outline"
              className="mt-4 border-green-300 text-green-700 hover:bg-green-100"
            >
              Send another message
            </Button>
          </div>
        </CardContent>
      </Card>
    )
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      {/* Category Selection */}
      <div>
        <Label className="text-base font-semibold mb-3 block">What can we help you with?</Label>
        <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
          {contactCategories.map((cat) => (
            <button
              key={cat.id}
              type="button"
              onClick={() => handleCategorySelect(cat.id)}
              className={`p-3 rounded-lg border-2 text-sm font-medium transition-all ${
                category === cat.id
                  ? 'border-teal-600 bg-teal-50 text-teal-700'
                  : 'border-slate-200 bg-white text-slate-700 hover:border-teal-300 hover:bg-teal-50/50'
              }`}
            >
              <div className="text-xl mb-1">{cat.icon}</div>
              <div>{cat.label}</div>
            </button>
          ))}
        </div>
      </div>

      {/* Pre-filled Questions */}
      {category && preFilledQuestions[category] && (
        <div>
          <Label className="text-sm font-medium mb-2 block text-slate-600">
            Quick questions (optional - click to pre-fill):
          </Label>
          <div className="space-y-2">
            {preFilledQuestions[category].map((question, idx) => (
              <button
                key={idx}
                type="button"
                onClick={() => handleQuestionSelect(question)}
                className={`w-full text-left p-3 rounded-lg border text-sm transition-all ${
                  selectedQuestion === question
                    ? 'border-teal-600 bg-teal-50 text-teal-700'
                    : 'border-slate-200 bg-white text-slate-600 hover:border-teal-300 hover:bg-teal-50/50'
                }`}
              >
                {question}
              </button>
            ))}
          </div>
        </div>
      )}

      {/* Contact Form Fields */}
      <div className="grid md:grid-cols-2 gap-4">
        <div className="space-y-2">
          <Label htmlFor="name">Your Name *</Label>
          <Input
            id="name"
            value={formData.name}
            onChange={(e) => setFormData(prev => ({ ...prev, name: e.target.value }))}
            placeholder="Dr. Jane Smith"
            required
          />
        </div>
        <div className="space-y-2">
          <Label htmlFor="email">Your Email *</Label>
          <Input
            id="email"
            type="email"
            value={formData.email}
            onChange={(e) => setFormData(prev => ({ ...prev, email: e.target.value }))}
            placeholder="you@example.com"
            required
          />
        </div>
      </div>

      <div className="space-y-2">
        <Label htmlFor="subject">Subject *</Label>
        <Input
          id="subject"
          value={formData.subject}
          onChange={(e) => setFormData(prev => ({ ...prev, subject: e.target.value }))}
          placeholder={category ? `Your ${contactCategories.find(c => c.id === category)?.label.toLowerCase()}` : 'What is this about?'}
          required
        />
      </div>

      <div className="space-y-2">
        <Label htmlFor="message">Message *</Label>
        <Textarea
          id="message"
          value={formData.message}
          onChange={(e) => setFormData(prev => ({ ...prev, message: e.target.value }))}
          placeholder="Tell us more about your inquiry..."
          rows={6}
          required
        />
      </div>

      {category && (
        <div className="p-3 bg-slate-50 rounded-lg border border-slate-200">
          <div className="text-xs text-slate-600">
            <strong>Category:</strong> {contactCategories.find(c => c.id === category)?.label}
          </div>
        </div>
      )}

      <Button type="submit" className="w-full bg-teal-600 hover:bg-teal-700" disabled={loading || !category}>
        {loading ? 'Sending...' : 'Send Message'}
      </Button>
    </form>
  )
}
