import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

const resources = [
  {
    title: 'Consultation Models',
    description: 'Calgary-Cambridge, Pendleton, Neighbour, and more frameworks explained with examples',
    icon: '📋',
    free: true,
    highlights: ['6 major models', 'Practical examples', 'When to use each'],
  },
  {
    title: 'Hidden Curriculum',
    description: 'GP setup, triage, finances, career paths - essential knowledge beyond the formal curriculum',
    icon: '🎓',
    free: true,
    highlights: ['Practice structures', 'Tax deductions', 'Career options'],
  },
  {
    title: 'Reflection Guide',
    description: 'How to write effective reflections using Gibbs, Rolfe, and other frameworks',
    icon: '✍️',
    free: true,
    highlights: ['Gibbs cycle', 'Rolfe framework', 'Common pitfalls'],
  },
  {
    title: 'WPBA Checklist',
    description: 'Complete guide to CBD, Mini-CEX, COT, PSQ, and MSF assessments',
    icon: '✅',
    free: true,
    highlights: ['Requirements by stage', 'Tips for each type', 'Annual targets'],
  },
  {
    title: 'Clinical Topics',
    description: 'Quick reference guides for common GP presentations across all systems',
    icon: '🩺',
    free: true,
    highlights: ['8 clinical areas', 'Key resources', 'NICE links'],
  },
  {
    title: 'AI Reflection Assistant',
    description: 'Guidance on using AI tools appropriately for portfolio reflections',
    icon: '🤖',
    free: true,
    highlights: ['RCGP guidance', 'Appropriate uses', 'Example prompts'],
  },
]

const consultationModels = [
  { name: 'Calgary-Cambridge', desc: 'Most widely used in UK GP', color: 'bg-blue-100 text-blue-800' },
  { name: 'Pendleton\'s 7 Tasks', desc: 'Task-based approach', color: 'bg-purple-100 text-purple-800' },
  { name: 'Neighbour\'s Checkpoints', desc: '5 quick checkpoints', color: 'bg-green-100 text-green-800' },
  { name: 'ICE Framework', desc: 'Ideas, Concerns, Expectations', color: 'bg-teal-100 text-teal-800' },
]

export default function ResourcesPreviewPage() {
  return (
    <div className="min-h-screen">
      {/* Hero */}
      <section className="py-16 bg-gradient-to-b from-amber-50 to-background">
        <div className="container max-w-6xl">
          <div className="text-center mb-12">
            <Badge className="mb-4">Learning Resources</Badge>
            <h1 className="text-4xl font-bold mb-4">Everything Beyond the Textbooks</h1>
            <p className="text-xl text-foreground/70 max-w-2xl mx-auto">
              Practical guides for the knowledge you actually need in GP training - consultation skills, career guidance, and the hidden curriculum.
            </p>
          </div>

          <div className="grid md:grid-cols-3 gap-4 mb-12">
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">6</div>
                <p className="text-sm text-foreground/70">Resource Categories</p>
              </CardContent>
            </Card>
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">100%</div>
                <p className="text-sm text-foreground/70">Free Access</p>
              </CardContent>
            </Card>
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">GP</div>
                <p className="text-sm text-foreground/70">Trainee Focused</p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* Resources Grid */}
      <section className="py-16">
        <div className="container max-w-5xl">
          <h2 className="text-2xl font-bold text-center mb-8">Available Resources</h2>
          
          <div className="grid md:grid-cols-2 gap-6">
            {resources.map((resource) => (
              <Card key={resource.title} className="h-full hover:shadow-md transition-shadow">
                <CardHeader>
                  <div className="flex items-start justify-between">
                    <span className="text-3xl">{resource.icon}</span>
                    <Badge variant="secondary">Free</Badge>
                  </div>
                  <CardTitle className="mt-2">{resource.title}</CardTitle>
                  <CardDescription>{resource.description}</CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="flex flex-wrap gap-2">
                    {resource.highlights.map((highlight, i) => (
                      <span key={i} className="text-xs bg-muted px-2 py-1 rounded">
                        {highlight}
                      </span>
                    ))}
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Sample Content - Consultation Models */}
      <section className="py-16 bg-muted/30">
        <div className="container max-w-4xl">
          <h2 className="text-2xl font-bold text-center mb-8">Sample: Consultation Models</h2>
          
          <Card>
            <CardHeader className="bg-amber-50 border-b">
              <CardTitle>Calgary-Cambridge Model</CardTitle>
              <CardDescription className="text-base">
                The most widely used consultation model in UK general practice
              </CardDescription>
            </CardHeader>
            <CardContent className="pt-6">
              <div className="space-y-4">
                {[
                  { step: 1, title: 'Initiating the session', desc: 'Establish rapport, identify reason for attendance' },
                  { step: 2, title: 'Gathering information', desc: 'Explore patient\'s perspective, biomedical perspective, background' },
                  { step: 3, title: 'Physical examination', desc: 'If required, explain and gain consent' },
                  { step: 4, title: 'Explanation and planning', desc: 'Share information, reach shared understanding, involve patient' },
                  { step: 5, title: 'Closing the session', desc: 'Summarize, safety net, arrange follow-up' },
                ].map((item) => (
                  <div key={item.step} className="flex gap-4">
                    <div className="flex-shrink-0 w-8 h-8 rounded-full bg-blue-500 text-white flex items-center justify-center font-bold">
                      {item.step}
                    </div>
                    <div>
                      <h4 className="font-semibold">{item.title}</h4>
                      <p className="text-sm text-foreground/70">{item.desc}</p>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>

          <div className="mt-8">
            <h3 className="font-semibold text-center mb-4">Other Models Covered</h3>
            <div className="grid md:grid-cols-2 gap-3">
              {consultationModels.map((model) => (
                <div key={model.name} className={`p-3 rounded-lg ${model.color}`}>
                  <div className="font-semibold text-sm">{model.name}</div>
                  <div className="text-xs opacity-80">{model.desc}</div>
                </div>
              ))}
            </div>
          </div>

          <div className="text-center mt-8">
            <p className="text-foreground/70 mb-4">Sign up to access all consultation models with detailed examples</p>
            <Link href="/signup">
              <Button size="lg">Get Free Access</Button>
            </Link>
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-16 bg-primary text-white">
        <div className="container max-w-2xl text-center">
          <h2 className="text-3xl font-bold mb-4">Ready to Explore?</h2>
          <p className="text-blue-100 mb-8">
            All learning resources are free. Sign up to access the complete guides.
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
