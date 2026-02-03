import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

const portfolioComponents = [
  { name: 'Learning Log Entries', count: '36/year', description: 'Reflections on clinical encounters' },
  { name: 'WPBAs', count: '12+/year', description: 'CBD, Mini-CEX, COT, PSQ, MSF' },
  { name: 'Curriculum Coverage', count: '13 caps', description: 'Professional capabilities' },
  { name: 'Out of Hours', count: '72 hrs/yr', description: 'Emergency and OOH experience' },
]

const stages = [
  {
    name: 'ST1',
    title: 'Foundation Year',
    description: 'Your first year of GP training - building foundations',
    color: 'border-teal-200 bg-teal-50/50',
    items: [
      'Getting started guide',
      'WPBA requirements',
      'Reflection writing basics',
      'First ARCP preparation',
      'Hospital post integration',
    ],
  },
  {
    name: 'ST2',
    title: 'Development Year',
    description: 'Building independence and preparing for exams',
    color: 'border-orange-200 bg-orange-50/50',
    items: [
      'Clinical competencies',
      'AKT/SCA preparation',
      'Complex case management',
      'Portfolio building',
      'GP placement focus',
    ],
  },
  {
    name: 'ST3',
    title: 'Completion Year',
    description: 'Final stretch to CCT',
    color: 'border-violet-200 bg-violet-50/50',
    items: [
      'CCT requirements',
      'Final ARCP checklist',
      'Career planning',
      'Post-CCT options',
      'Independent practice readiness',
    ],
  },
]

const guides = [
  { title: 'Reflection Guide', description: 'Step-by-step help to structure learning log entries', free: true },
  { title: 'The Three-Link Rule', description: 'Simple checklist for linking to curriculum capabilities', free: true },
  { title: 'ARCP Preparation', description: 'Complete guide to your annual review', free: false },
  { title: 'WPBA Checklist', description: 'CBD, Mini-CEX, COT, PSQ requirements', free: true },
  { title: 'Trainee Wellbeing', description: 'Looking after yourself during training', free: true },
  { title: 'CCT Preparation', description: 'Roadmap to completion of training', free: false },
]

export default function PortfolioPreviewPage() {
  return (
    <div className="min-h-screen">
      {/* Hero */}
      <section className="py-16 bg-gradient-to-b from-primary/5 to-white">
        <div className="container max-w-6xl">
          <div className="text-center mb-12">
            <Badge className="mb-4 bg-primary text-white">Portfolio Helper</Badge>
            <h1 className="text-4xl font-bold mb-4">Navigate GP Training with Confidence</h1>
            <p className="text-xl text-foreground/70 max-w-2xl mx-auto">
              Clear, structured guidance through ST1, ST2, and ST3 requirements. Never feel lost in your training journey again.
            </p>
          </div>

          {/* Portfolio Components Overview */}
          <div className="grid md:grid-cols-4 gap-4 mb-12">
            {portfolioComponents.map((item) => (
              <Card key={item.name} className="text-center border-2 border-primary/10 bg-white/80 backdrop-blur">
                <CardContent className="pt-6">
                  <div className="text-2xl font-bold text-primary">{item.count}</div>
                  <p className="text-sm font-medium text-foreground">{item.name}</p>
                  <p className="text-xs text-foreground/60 mt-1">{item.description}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* What is the Portfolio */}
      <section className="py-12 bg-white">
        <div className="container max-w-4xl">
          <Card className="border-2 border-primary/20 rounded-2xl overflow-hidden">
            <CardHeader className="bg-gradient-to-r from-primary/5 to-accent/5">
              <CardTitle>Understanding the GP Portfolio</CardTitle>
            </CardHeader>
            <CardContent className="pt-6 space-y-4">
              <p className="text-foreground/80">
                The ePortfolio is the central repository of evidence demonstrating your competence and development throughout GP training. 
                It&apos;s reviewed at your Annual Review of Competence Progression (ARCP) to determine if you&apos;re ready to progress.
              </p>
              <p className="text-foreground/80">
                A well-maintained portfolio isn&apos;t just about ticking boxes - it&apos;s about demonstrating reflective practice, 
                professional development, and readiness for independent general practice.
              </p>
            </CardContent>
          </Card>
        </div>
      </section>

      {/* Stages */}
      <section className="py-16 bg-muted/30">
        <div className="container max-w-5xl">
          <h2 className="text-2xl font-bold text-center mb-8">Stage-by-Stage Guidance</h2>
          
          <div className="grid md:grid-cols-3 gap-6">
            {stages.map((stage) => (
              <Card key={stage.name} className={`h-full border-2 ${stage.color}`}>
                <CardHeader>
                  <Badge variant="outline" className="w-fit mb-2 border-primary text-primary">{stage.name}</Badge>
                  <CardTitle>{stage.title}</CardTitle>
                  <CardDescription className="text-foreground/70">{stage.description}</CardDescription>
                </CardHeader>
                <CardContent>
                  <ul className="space-y-2">
                    {stage.items.map((item, i) => (
                      <li key={i} className="flex items-center gap-2 text-sm text-foreground/80">
                        <span className="text-primary">•</span>
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

      {/* Sample Content - Reflection Guide / Three-Link Rule */}
      <section className="py-16 bg-muted/30">
        <div className="container max-w-4xl">
          <h2 className="text-2xl font-bold text-center mb-8">Sample Guide: Writing Reflections</h2>
          
          <Card>
            <CardHeader className="bg-blue-50 border-b">
              <CardTitle>The Three-Link Rule</CardTitle>
              <CardDescription className="text-base">
                A quick way to check that each reflection is doing enough work for your portfolio
              </CardDescription>
            </CardHeader>
            <CardContent className="pt-6">
              <div className="space-y-4">
                <p className="text-foreground/80">
                  Aim for <strong>around three clear curriculum links</strong> in each learning log entry. Think in three simple steps:
                </p>
                {/* Simple flow chart style */}
                <div className="space-y-3">
                  <div className="flex flex-col md:flex-row md:items-center gap-3">
                    <div className="flex-1 p-4 bg-blue-50 rounded-lg border border-blue-100">
                      <h4 className="font-semibold text-blue-700 mb-1">1. Choose the case</h4>
                      <p className="text-sm text-foreground/80">Pick one encounter where you genuinely learned or were challenged.</p>
                    </div>
                    <div className="hidden md:block text-2xl text-blue-400">→</div>
                  </div>
                  <div className="flex flex-col md:flex-row md:items-center gap-3">
                    <div className="flex-1 p-4 bg-blue-50 rounded-lg border border-blue-100">
                      <h4 className="font-semibold text-blue-700 mb-1">2. Pick ~3 capabilities</h4>
                      <p className="text-sm text-foreground/80">From the curriculum list, choose the <strong>3 most relevant</strong> (e.g. data gathering, decision making, communication).</p>
                    </div>
                    <div className="hidden md:block text-2xl text-blue-400">→</div>
                  </div>
                  <div className="flex flex-col md:flex-row md:items-center gap-3">
                    <div className="flex-1 p-4 bg-blue-50 rounded-lg border border-blue-100">
                      <h4 className="font-semibold text-blue-700 mb-1">3. Write 1–2 lines per link</h4>
                      <p className="text-sm text-foreground/80">
                        For each capability, add a short sentence: <em>&ldquo;This case shows <strong>communication</strong> because…&rdquo;</em>
                      </p>
                    </div>
                  </div>
                </div>

                <p className="text-sm text-foreground/70 mt-4">
                  For full examples and wording, see the{' '}
                  <Link href="/resources/reflection-guide" className="underline text-blue-700">
                    Reflection Guide
                  </Link>.
                </p>
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
