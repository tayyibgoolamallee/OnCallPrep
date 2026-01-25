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
  { id: 'partnership', label: 'Partnership', icon: '🤝' },
  { id: 'other', label: 'Other', icon: '📝' },
]

const preFilledQuestions: Record<string, string[]> = {
  feedback: [
    'I found something that could be improved...',
    'I\'d love to see this feature added',
    'This content would be really helpful for trainees',
  ],
  bug: [
    'Something\'s not working as expected',
    'I encountered an error when...',
    'This page/feature seems broken',
  ],
  feature: [
    'I think this would be a great addition',
    'This would make training so much easier',
    'Could we have something for AKT/SCA/Portfolio?',
  ],
  question: [
    'I\'m not sure how to...',
    'Can you help me understand...',
    'I have a question about...',
  ],
  technical: [
    'I\'m having trouble accessing...',
    'The site isn\'t loading properly',
    'Something seems off with my account',
  ],
  billing: [
    'I need help with my subscription',
    'Payment didn\'t go through',
    'I want to change my plan',
  ],
  partnership: [
    'I\'d like to collaborate',
    'We could work together on...',
    'Partnership opportunity',
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
        <Label className="text-base font-semibold mb-3 block text-slate-900">What can we help you with?</Label>
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
          <Label className="text-sm font-medium mb-2 block text-slate-700">
            Not sure what to write? Click one of these to get started:
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
          placeholder="Share your thoughts, questions, or concerns - we're here to help!"
          rows={6}
          required
        />
      </div>

      {category && (
        <div className="p-3 bg-teal-50 rounded-lg border border-teal-200">
          <div className="text-sm text-teal-800">
            <strong>You're contacting us about:</strong> {contactCategories.find(c => c.id === category)?.label}
          </div>
        </div>
      )}

      <Button type="submit" className="w-full bg-teal-600 hover:bg-teal-700" disabled={loading || !category}>
        {loading ? 'Sending...' : 'Send Message'}
      </Button>
    </form>
  )
}
