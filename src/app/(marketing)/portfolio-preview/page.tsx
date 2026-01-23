import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

const stages = [
  {
    name: 'ST1',
    title: 'Foundation Year',
    description: 'Your first year of GP training - building foundations',
    items: [
      'Getting started guide',
      'WPBA requirements',
      'Reflection writing basics',
      'First ARCP preparation',
    ],
  },
  {
    name: 'ST2',
    title: 'Development Year',
    description: 'Building independence and preparing for exams',
    items: [
      'Clinical competencies',
      'AKT/SCA preparation',
      'Complex case management',
      'Portfolio building',
    ],
  },
  {
    name: 'ST3',
    title: 'Completion Year',
    description: 'Final stretch to CCT',
    items: [
      'CCT requirements',
      'Final ARCP checklist',
      'Career planning',
      'Post-CCT options',
    ],
  },
]

const guides = [
  { title: 'Gibbs\' Reflective Cycle', description: 'The most widely used reflection framework', free: true },
  { title: 'The Three-Link Rule', description: 'How to link reflections to competencies', free: true },
  { title: 'ARCP Preparation', description: 'Complete guide to your annual review', free: false },
  { title: 'WPBA Checklist', description: 'CBD, Mini-CEX, COT, PSQ requirements', free: true },
  { title: 'Trainee Wellbeing', description: 'Looking after yourself during training', free: true },
  { title: 'CCT Preparation', description: 'Roadmap to completion of training', free: false },
]

export default function PortfolioPreviewPage() {
  return (
    <div className="min-h-screen">
      {/* Hero */}
      <section className="py-16 bg-gradient-to-b from-blue-50 to-background">
        <div className="container max-w-6xl">
          <div className="text-center mb-12">
            <Badge className="mb-4">Portfolio Helper</Badge>
            <h1 className="text-4xl font-bold mb-4">Navigate GP Training with Confidence</h1>
            <p className="text-xl text-foreground/70 max-w-2xl mx-auto">
              Clear, structured guidance through ST1, ST2, and ST3 requirements. Never feel lost in your training journey again.
            </p>
          </div>

          <div className="grid md:grid-cols-3 gap-4 mb-12">
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">3</div>
                <p className="text-sm text-foreground/70">Training Stages</p>
              </CardContent>
            </Card>
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">20+</div>
                <p className="text-sm text-foreground/70">Detailed Guides</p>
              </CardContent>
            </Card>
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">13</div>
                <p className="text-sm text-foreground/70">Capabilities Covered</p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* Stages */}
      <section className="py-16">
        <div className="container max-w-5xl">
          <h2 className="text-2xl font-bold text-center mb-8">Stage-by-Stage Guidance</h2>
          
          <div className="grid md:grid-cols-3 gap-6">
            {stages.map((stage) => (
              <Card key={stage.name} className="h-full">
                <CardHeader>
                  <Badge variant="outline" className="w-fit mb-2">{stage.name}</Badge>
                  <CardTitle>{stage.title}</CardTitle>
                  <CardDescription>{stage.description}</CardDescription>
                </CardHeader>
                <CardContent>
                  <ul className="space-y-2">
                    {stage.items.map((item, i) => (
                      <li key={i} className="flex items-center gap-2 text-sm text-foreground/70">
                        <span className="text-blue-500">•</span>
                        {item}
                      </li>
                    ))}
                  </ul>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Sample Content - Reflection Guide */}
      <section className="py-16 bg-muted/30">
        <div className="container max-w-4xl">
          <h2 className="text-2xl font-bold text-center mb-8">Sample Guide: Writing Reflections</h2>
          
          <Card>
            <CardHeader className="bg-blue-50 border-b">
              <CardTitle>The Three-Link Rule</CardTitle>
              <CardDescription className="text-base">
                A key principle for high-quality portfolio reflections
              </CardDescription>
            </CardHeader>
            <CardContent className="pt-6">
              <div className="space-y-4">
                <p className="text-foreground/80">
                  Every reflection should link to <strong>at least three competencies</strong> from the GP curriculum. This demonstrates:
                </p>
                
                <div className="grid md:grid-cols-3 gap-4">
                  <div className="p-4 bg-blue-50 rounded-lg">
                    <h4 className="font-semibold text-blue-700">Holistic Thinking</h4>
                    <p className="text-sm text-foreground/70">Seeing the whole patient, not just the problem</p>
                  </div>
                  <div className="p-4 bg-blue-50 rounded-lg">
                    <h4 className="font-semibold text-blue-700">Skill Integration</h4>
                    <p className="text-sm text-foreground/70">How different competencies work together</p>
                  </div>
                  <div className="p-4 bg-blue-50 rounded-lg">
                    <h4 className="font-semibold text-blue-700">Higher-Level Reflection</h4>
                    <p className="text-sm text-foreground/70">Moving beyond description to analysis</p>
                  </div>
                </div>

                <div className="p-4 bg-green-50 rounded-lg border border-green-200 mt-6">
                  <h4 className="font-semibold text-green-700 mb-2">Example</h4>
                  <p className="text-sm text-foreground/80">
                    <strong>Case:</strong> Managing a 45-year-old man with chest pain
                  </p>
                  <ul className="text-sm text-foreground/70 mt-2 space-y-1">
                    <li><strong>1. Data gathering:</strong> Systematic history, ECG interpretation</li>
                    <li><strong>2. Making decisions:</strong> Differential diagnosis, when to refer</li>
                    <li><strong>3. Communication:</strong> Explaining risk, managing anxiety</li>
                  </ul>
                </div>
              </div>
            </CardContent>
          </Card>

          <div className="text-center mt-8">
            <p className="text-foreground/70 mb-4">Sign up to access complete reflection guides and templates</p>
            <Link href="/signup">
              <Button size="lg">Get Free Access</Button>
            </Link>
          </div>
        </div>
      </section>

      {/* Available Guides */}
      <section className="py-16">
        <div className="container max-w-4xl">
          <h2 className="text-2xl font-bold text-center mb-8">Available Guides</h2>
          <div className="grid md:grid-cols-2 gap-4">
            {guides.map((guide) => (
              <Card key={guide.title} className={guide.free ? '' : 'border-primary/30'}>
                <CardContent className="flex items-center justify-between py-4">
                  <div>
                    <h3 className="font-semibold">{guide.title}</h3>
                    <p className="text-sm text-foreground/70">{guide.description}</p>
                  </div>
                  <Badge variant={guide.free ? 'secondary' : 'default'}>
                    {guide.free ? 'Free' : 'Pro'}
                  </Badge>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-16 bg-primary text-white">
        <div className="container max-w-2xl text-center">
          <h2 className="text-3xl font-bold mb-4">Ready to Simplify Your Training?</h2>
          <p className="text-blue-100 mb-8">
            Access free portfolio guides and checklists. No credit card required.
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
