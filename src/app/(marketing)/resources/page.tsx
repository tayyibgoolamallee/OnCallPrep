import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

const resources = [
  {
    id: 'akt',
    title: 'AKT Preparation',
    subtitle: 'Applied Knowledge Test',
    description: 'The AKT is a computer-based assessment of the knowledge that underpins GP practice. Our question bank covers all curriculum areas with NICE-referenced explanations.',
    stats: [
      { label: 'Questions', value: '500+' },
      { label: 'Topics', value: '15+' },
      { label: 'Pass Rate Support', value: '71%+' },
    ],
    highlights: [
      'Evidence-based practice & statistics',
      'Clinical medicine across all specialties',
      'Administration, ethics & NHS structure',
      'Detailed explanations with guideline links',
    ],
    href: '/akt-preview',
    color: 'border-l-primary',
    bgColor: 'bg-primary/5',
  },
  {
    id: 'sca',
    title: 'SCA Preparation',
    subtitle: 'Simulated Consultation Assessment',
    description: 'The SCA tests your consultation skills through 12 video-based cases with trained role players. Practice with our structured mock cases and timed exercises.',
    stats: [
      { label: 'Mock Cases', value: '50+' },
      { label: 'Case Types', value: '6' },
      { label: 'Timed Practice', value: '12 min' },
    ],
    highlights: [
      'Data gathering & red flag recognition',
      'Clinical management & safety netting',
      'Interpersonal skills & shared decisions',
      '2-min diagnosis & 3-min priming drills',
    ],
    href: '/sca-preview',
    color: 'border-l-accent',
    bgColor: 'bg-accent/5',
  },
  {
    id: 'portfolio',
    title: 'Portfolio Guidance',
    subtitle: 'ePortfolio & ARCP Support',
    description: 'Navigate GP training with confidence. Our stage-by-stage guides help you understand requirements, write effective reflections, and prepare for ARCP.',
    stats: [
      { label: 'Training Stages', value: '3' },
      { label: 'Guides', value: '20+' },
      { label: 'Capabilities', value: '13' },
    ],
    highlights: [
      'ST1, ST2, ST3 stage checklists',
      'WPBA requirements & examples',
      'Reflective writing frameworks',
      'ARCP preparation guides',
    ],
    href: '/portfolio-preview',
    color: 'border-l-[#7c3aed]',
    bgColor: 'bg-violet-50',
  },
]

const additionalResources = [
  {
    title: 'Consultation Models',
    description: 'Calgary-Cambridge, Pendleton, Neighbour and more - understand the frameworks that structure effective consultations.',
    free: true,
  },
  {
    title: 'Reflection Guides',
    description: 'Gibbs Cycle, three-link reflections, and practical tips for meaningful portfolio entries.',
    free: true,
  },
  {
    title: 'Hidden Curriculum',
    description: 'The unwritten rules and practical wisdom that experienced GPs know but rarely teach explicitly.',
    free: true,
  },
  {
    title: 'Clinical Topics',
    description: 'Key clinical areas mapped to the curriculum with common presentations and management approaches.',
    free: false,
  },
]

export default function ResourcesPage() {
  return (
    <div className="min-h-screen">
      {/* Hero */}
      <section className="py-16 bg-gradient-to-b from-primary/5 to-white">
        <div className="container max-w-5xl text-center">
          <Badge className="mb-4 bg-primary text-white">Learning Resources</Badge>
          <h1 className="text-4xl font-bold mb-4 text-foreground">
            Everything You Need for GP Training
          </h1>
          <p className="text-lg text-foreground/70 max-w-2xl mx-auto">
            Comprehensive resources for the AKT, SCA, and portfolio - built by trainees who understand the challenges you face.
          </p>
        </div>
      </section>

      {/* Main Resources */}
      <section className="py-12">
        <div className="container max-w-5xl">
          <div className="space-y-8">
            {resources.map((resource) => (
              <Card key={resource.id} className={`overflow-hidden border-l-4 ${resource.color}`}>
                <div className={`${resource.bgColor}`}>
                  <CardHeader>
                    <div className="flex items-start justify-between">
                      <div>
                        <Badge variant="outline" className="mb-2 text-xs">{resource.subtitle}</Badge>
                        <CardTitle className="text-2xl text-foreground">{resource.title}</CardTitle>
                        <CardDescription className="mt-2 text-foreground/70 max-w-2xl">
                          {resource.description}
                        </CardDescription>
                      </div>
                    </div>
                  </CardHeader>
                  <CardContent>
                    {/* Stats */}
                    <div className="flex gap-6 mb-6">
                      {resource.stats.map((stat) => (
                        <div key={stat.label} className="text-center">
                          <div className="text-2xl font-bold text-primary">{stat.value}</div>
                          <div className="text-xs text-foreground/60">{stat.label}</div>
                        </div>
                      ))}
                    </div>

                    {/* Highlights */}
                    <div className="grid md:grid-cols-2 gap-2 mb-6">
                      {resource.highlights.map((highlight, i) => (
                        <div key={i} className="flex items-center gap-2 text-sm text-foreground/80">
                          <span className="text-primary">✓</span>
                          {highlight}
                        </div>
                      ))}
                    </div>

                    {/* CTA */}
                    <div className="flex gap-3">
                      <Link href={resource.href}>
                        <Button variant="outline" size="sm">
                          Learn More
                        </Button>
                      </Link>
                      <Link href="/signup">
                        <Button size="sm">
                          Get Started Free
                        </Button>
                      </Link>
                    </div>
                  </CardContent>
                </div>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Additional Resources */}
      <section className="py-12 bg-muted/30">
        <div className="container max-w-5xl">
          <h2 className="text-2xl font-bold text-center mb-8 text-foreground">Additional Learning Resources</h2>
          <div className="grid md:grid-cols-2 gap-4">
            {additionalResources.map((resource) => (
              <Card key={resource.title} className="border">
                <CardHeader className="pb-2">
                  <div className="flex items-center justify-between">
                    <CardTitle className="text-base text-foreground">{resource.title}</CardTitle>
                    <Badge variant={resource.free ? 'secondary' : 'outline'} className="text-xs">
                      {resource.free ? 'Free' : 'Pro'}
                    </Badge>
                  </div>
                </CardHeader>
                <CardContent>
                  <p className="text-sm text-foreground/70">{resource.description}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-16 bg-primary text-white">
        <div className="container max-w-3xl text-center">
          <h2 className="text-3xl font-bold mb-4">Ready to Start Your Journey?</h2>
          <p className="text-lg text-white/80 mb-8">
            Join thousands of GP trainees who are simplifying their training with OnCallPrep.
          </p>
          <div className="flex justify-center gap-4">
            <Link href="/signup">
              <Button size="lg" variant="secondary" className="font-semibold">
                Create Free Account
              </Button>
            </Link>
            <Link href="/pricing">
              <Button size="lg" variant="outline" className="font-semibold border-white text-white hover:bg-white/10">
                View Pricing
              </Button>
            </Link>
          </div>
        </div>
      </section>
    </div>
  )
}
