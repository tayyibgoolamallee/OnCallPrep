import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

const sampleQuestions = [
  {
    id: 1,
    topic: 'Evidence-Based Practice',
    difficulty: 'Medium',
    stem: 'Absolute risk reduction (ARR) is best defined as:',
    options: [
      { label: 'A', text: 'Relative reduction in risk between two groups' },
      { label: 'B', text: 'Difference in outcome rates between intervention and control groups' },
      { label: 'C', text: 'Number of patients needed to prevent one adverse event' },
      { label: 'D', text: 'Ratio of risk in exposed vs unexposed groups' },
    ],
    answer: 'B',
    explanation: 'Absolute Risk Reduction (ARR) is the absolute difference in event rates between the control and treatment groups. ARR = Control Event Rate - Treatment Event Rate.',
  },
  {
    id: 2,
    topic: 'Cardiovascular',
    difficulty: 'Medium',
    stem: 'A 58-year-old man with type 2 diabetes and hypertension has an eGFR of 45. According to NICE guidelines, which antihypertensive should be first-line?',
    options: [
      { label: 'A', text: 'Amlodipine' },
      { label: 'B', text: 'Ramipril' },
      { label: 'C', text: 'Bendroflumethiazide' },
      { label: 'D', text: 'Doxazosin' },
    ],
    answer: 'B',
    explanation: 'NICE recommends ACE inhibitors (or ARBs) as first-line for hypertension in patients with diabetes, regardless of age. The renal protective benefits are particularly important with reduced eGFR.',
  },
]

const topics = [
  { name: 'Evidence-Based Practice', count: 45, color: 'bg-blue-100 text-blue-800' },
  { name: 'Cardiovascular', count: 52, color: 'bg-red-100 text-red-800' },
  { name: 'Respiratory', count: 38, color: 'bg-teal-100 text-teal-800' },
  { name: 'Mental Health', count: 41, color: 'bg-purple-100 text-purple-800' },
  { name: 'Endocrine', count: 35, color: 'bg-amber-100 text-amber-800' },
  { name: 'Gastroenterology', count: 32, color: 'bg-green-100 text-green-800' },
  { name: 'Musculoskeletal', count: 29, color: 'bg-orange-100 text-orange-800' },
  { name: 'Dermatology', count: 24, color: 'bg-pink-100 text-pink-800' },
]

export default function AKTPreviewPage() {
  return (
    <div className="min-h-screen">
      {/* Hero */}
      <section className="py-16 bg-gradient-to-b from-purple-50 to-background">
        <div className="container max-w-6xl">
          <div className="text-center mb-12">
            <Badge className="mb-4">AKT Question Bank</Badge>
            <h1 className="text-4xl font-bold mb-4">Master the Applied Knowledge Test</h1>
            <p className="text-xl text-foreground/70 max-w-2xl mx-auto">
              500+ guideline-referenced questions covering all AKT topics. Practice smarter with detailed explanations linked to NICE and RCGP guidance.
            </p>
          </div>

          <div className="grid md:grid-cols-4 gap-4 mb-12">
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">500+</div>
                <p className="text-sm text-foreground/70">Questions</p>
              </CardContent>
            </Card>
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">20</div>
                <p className="text-sm text-foreground/70">Free Demo Questions</p>
              </CardContent>
            </Card>
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">15+</div>
                <p className="text-sm text-foreground/70">Topic Areas</p>
              </CardContent>
            </Card>
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">100%</div>
                <p className="text-sm text-foreground/70">NICE Referenced</p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* Sample Questions */}
      <section className="py-16">
        <div className="container max-w-4xl">
          <h2 className="text-2xl font-bold text-center mb-8">Try Sample Questions</h2>
          
          <div className="space-y-8">
            {sampleQuestions.map((q, index) => (
              <Card key={q.id} className="overflow-hidden">
                <CardHeader className="bg-muted/50">
                  <div className="flex items-center justify-between">
                    <Badge variant="secondary">{q.topic}</Badge>
                    <Badge variant="outline">{q.difficulty}</Badge>
                  </div>
                  <CardTitle className="text-lg mt-4">Question {index + 1}</CardTitle>
                </CardHeader>
                <CardContent className="pt-6">
                  <p className="font-medium mb-4">{q.stem}</p>
                  <div className="space-y-2 mb-6">
                    {q.options.map((opt) => (
                      <div
                        key={opt.label}
                        className={`p-3 rounded-lg border-2 ${
                          opt.label === q.answer
                            ? 'border-green-500 bg-green-50'
                            : 'border-gray-200'
                        }`}
                      >
                        <span className="font-semibold mr-2">{opt.label}.</span>
                        {opt.text}
                        {opt.label === q.answer && (
                          <Badge className="ml-2 bg-green-500">Correct</Badge>
                        )}
                      </div>
                    ))}
                  </div>
                  <div className="p-4 bg-blue-50 rounded-lg border border-blue-200">
                    <h4 className="font-semibold text-blue-700 mb-2">Explanation</h4>
                    <p className="text-sm text-foreground/80">{q.explanation}</p>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>

          <div className="text-center mt-8">
            <p className="text-foreground/70 mb-4">Sign up to access 20 free demo questions</p>
            <Link href="/signup">
              <Button size="lg">Get Free Access</Button>
            </Link>
          </div>
        </div>
      </section>

      {/* Topics */}
      <section className="py-16 bg-muted/30">
        <div className="container max-w-4xl">
          <h2 className="text-2xl font-bold text-center mb-8">Topics Covered</h2>
          <div className="grid md:grid-cols-4 gap-3">
            {topics.map((topic) => (
              <div key={topic.name} className={`p-3 rounded-lg text-center ${topic.color}`}>
                <div className="font-semibold text-sm">{topic.name}</div>
                <div className="text-xs opacity-80">{topic.count} questions</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Features */}
      <section className="py-16">
        <div className="container max-w-4xl">
          <h2 className="text-2xl font-bold text-center mb-8">What You Get</h2>
          <div className="grid md:grid-cols-2 gap-6">
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <span className="text-green-500">✓</span> Free Access
                </CardTitle>
              </CardHeader>
              <CardContent>
                <ul className="space-y-2 text-foreground/70">
                  <li>• 20 demo questions</li>
                  <li>• Topic overview</li>
                  <li>• Basic explanations</li>
                  <li>• Study tips</li>
                </ul>
              </CardContent>
            </Card>
            <Card className="border-primary">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <span className="text-primary">★</span> Pro Access
                </CardTitle>
              </CardHeader>
              <CardContent>
                <ul className="space-y-2 text-foreground/70">
                  <li>• 500+ questions</li>
                  <li>• Detailed NICE-referenced explanations</li>
                  <li>• Progress tracking</li>
                  <li>• Weak area identification</li>
                  <li>• Timed mock exams</li>
                </ul>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-16 bg-primary text-white">
        <div className="container max-w-2xl text-center">
          <h2 className="text-3xl font-bold mb-4">Ready to Start Practicing?</h2>
          <p className="text-blue-100 mb-8">
            Sign up for free and try 20 demo questions. No credit card required.
          </p>
          <div className="flex gap-4 justify-center">
            <Link href="/signup">
              <Button size="lg" className="bg-white text-primary hover:bg-blue-50">
                Start Free Trial
              </Button>
            </Link>
            <Link href="/pricing">
              <Button size="lg" variant="outline" className="border-white text-white hover:bg-white/10">
                View Pricing
              </Button>
            </Link>
          </div>
        </div>
      </section>
    </div>
  )
}
