import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

const features = [
  {
    title: 'AKT Question Bank',
    description: 'Comprehensive question bank with guideline-driven explanations. Practice smarter with high-yield content.',
    items: [
      { name: 'Demo questions (20)', free: true },
      { name: 'Study topic overview', free: true },
      { name: 'Full question bank (500+)', free: false },
      { name: 'Progress tracking', free: false },
    ],
    href: '/akt-preview',
    borderColor: 'border-l-primary',
    bgColor: 'bg-primary/5',
  },
  {
    title: 'SCA Preparation',
    description: 'Master the Simulated Consultation Assessment with structured practice, timed exercises, and realistic mock cases.',
    items: [
      { name: 'Exam overview & guidance', free: true },
      { name: 'Sample mock cases', free: true },
      { name: '2-min diagnosis practice', free: false },
      { name: 'Full mock case library (50+)', free: false },
    ],
    href: '/sca-preview',
    borderColor: 'border-l-accent',
    bgColor: 'bg-accent/5',
  },
  {
    title: 'Portfolio Helper',
    description: 'Clear, structured guidance through ST1, ST2, and ST3 requirements. Never feel lost in your training journey again.',
    items: [
      { name: 'Stage-by-stage checklists', free: true },
      { name: 'Reflective writing guides', free: true },
      { name: 'Consultation models explained', free: true },
      { name: 'Detailed competency guides', free: false },
    ],
    href: '/portfolio-preview',
    borderColor: 'border-l-violet-600',
    bgColor: 'bg-violet-50',
  },
]

const testimonials = [
  {
    quote: 'The portfolio checklists alone saved me hours of confusion. Finally, clear guidance on what\'s actually required at each stage.',
    author: 'Dr. Sarah K.',
    role: 'ST2, North London',
  },
  {
    quote: 'The timed SCA practice was exactly what I needed. Being able to practice explaining diagnoses under pressure made a huge difference.',
    author: 'Dr. Mohammed R.',
    role: 'ST3, Manchester',
  },
  {
    quote: 'The AKT questions are genuinely challenging and the explanations reference actual guidelines. Much better than other resources I\'ve tried.',
    author: 'Dr. Emily P.',
    role: 'ST1, Birmingham',
  },
]

export default function HomePage() {
  return (
    <>
      {/* Hero Section */}
      <section className="relative overflow-hidden bg-gradient-to-b from-primary/5 via-white to-accent/5 py-24 sm:py-32 lg:py-40">
        <div className="mx-auto max-w-7xl px-6 lg:px-8 relative">
          <div className="mx-auto max-w-4xl text-center">
            <Badge className="mb-8 inline-flex px-4 py-2 text-sm font-semibold bg-primary/10 text-primary border-primary/20">
              Built by trainees, for trainees
            </Badge>
            <h1 className="text-5xl font-bold tracking-tight text-foreground sm:text-6xl lg:text-7xl">
              Simplify GP Training.
              <br />
              <span className="text-primary">Say Goodbye to Overwhelm.</span>
            </h1>
            <p className="mt-8 text-lg leading-8 text-foreground/80 sm:text-xl lg:text-2xl">
              Master your portfolio, ace the AKT, and conquer the SCA with confidence.
              Everything you need for GP training success in one place.
            </p>
            <div className="mt-12 flex items-center justify-center gap-x-6">
              <Link href="/signup">
                <Button size="lg" className="h-12 px-8 text-base font-semibold">
                  Get Started Free
                </Button>
              </Link>
              <Link href="/explore">
                <Button size="lg" variant="outline" className="h-12 px-8 text-base font-semibold border-2 hover:bg-primary/5">
                  Explore Resources
                </Button>
              </Link>
            </div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section id="features" className="py-24 sm:py-32">
        <div className="mx-auto max-w-7xl px-6 lg:px-8">
          <div className="mx-auto max-w-2xl text-center">
            <h2 className="text-3xl font-bold tracking-tight text-foreground sm:text-4xl lg:text-5xl">
              Master Every Aspect of GP Training
            </h2>
            <p className="mt-6 text-lg leading-8 text-foreground/80">
              Three powerful tools working together to make your training journey easier
            </p>
          </div>
          <div className="mx-auto mt-16 grid max-w-7xl grid-cols-1 gap-8 lg:grid-cols-3">
            {features.map((feature) => (
              <Card key={feature.title} className={`relative overflow-hidden border-l-4 ${feature.borderColor} ${feature.bgColor} transition-shadow hover:shadow-lg`}>
                <CardHeader>
                  <CardTitle className="text-xl text-foreground">{feature.title}</CardTitle>
                  <CardDescription className="text-base leading-7 text-foreground/80">
                    {feature.description}
                  </CardDescription>
                </CardHeader>
                <CardContent>
                  <ul className="mb-8 space-y-3">
                    {feature.items.map((item) => (
                      <li key={item.name} className="flex items-center gap-3">
                        <span className={`text-lg ${item.free ? 'text-primary' : 'text-accent'}`}>
                          {item.free ? '✓' : '★'}
                        </span>
                        <span className="flex-1 text-sm text-foreground">{item.name}</span>
                        <Badge variant={item.free ? 'secondary' : 'default'} className="text-xs">
                          {item.free ? 'Free' : 'Pro'}
                        </Badge>
                      </li>
                    ))}
                  </ul>
                  <Link href={feature.href}>
                    <Button variant="outline" className="w-full border-2">
                      Learn More
                    </Button>
                  </Link>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* How It Works */}
      <section className="bg-gradient-to-br from-teal-50 via-white to-orange-50 py-24 sm:py-32">
        <div className="mx-auto max-w-7xl px-6 lg:px-8">
          <div className="mx-auto max-w-2xl text-center">
            <h2 className="text-3xl font-bold tracking-tight text-foreground sm:text-4xl lg:text-5xl">
              How OnCallPrep Works
            </h2>
            <p className="mt-6 text-lg leading-8 text-foreground/80">
              Get started in minutes, see results in weeks
            </p>
          </div>
          <div className="mx-auto mt-16 grid max-w-5xl grid-cols-1 gap-12 sm:grid-cols-2 lg:grid-cols-4">
            {[
              {
                step: '1',
                title: 'Create',
                desc: 'Sign up in seconds. No credit card required. Start exploring immediately.',
                color: 'bg-teal-600'
              },
              {
                step: '2',
                title: 'Prepare',
                desc: 'Master your portfolio with stage-by-stage guidance. Never miss a requirement.',
                color: 'bg-teal-600'
              },
              {
                step: '3',
                title: 'Practice',
                desc: 'Ace the AKT and SCA with timed exercises and realistic mock cases.',
                color: 'bg-teal-600'
              },
              {
                step: '4',
                title: 'Succeed',
                desc: 'Pass your exams, complete your portfolio, and secure your dream GP job.',
                color: 'bg-teal-600'
              },
            ].map((item) => (
              <div key={item.step} className="text-center">
                <div className={`mx-auto flex h-14 w-14 items-center justify-center rounded-2xl ${item.color} text-2xl font-bold text-white shadow-lg`}>
                  {item.step}
                </div>
                <h3 className="mt-6 text-lg font-semibold text-foreground">{item.title}</h3>
                <p className="mt-2 text-sm leading-6 text-foreground/75">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Testimonials */}
      <section className="py-24 sm:py-32">
        <div className="mx-auto max-w-7xl px-6 lg:px-8">
          <div className="mx-auto max-w-2xl text-center">
            <h2 className="text-3xl font-bold tracking-tight text-foreground sm:text-4xl lg:text-5xl">
              What Trainees Are Saying
            </h2>
            <p className="mt-6 text-lg leading-8 text-foreground/80">
              Join hundreds of successful GP trainees
            </p>
          </div>
          <div className="mx-auto mt-16 grid max-w-7xl grid-cols-1 gap-8 lg:grid-cols-3">
            {testimonials.map((testimonial) => (
              <Card key={testimonial.author} className="border-2 transition-shadow hover:shadow-lg">
                <CardContent className="pt-8">
                  <p className="text-base italic leading-7 text-foreground/80">
                    &ldquo;{testimonial.quote}&rdquo;
                  </p>
                  <div className="mt-6">
                    <p className="font-semibold text-foreground">{testimonial.author}</p>
                    <p className="text-sm text-foreground/70">{testimonial.role}</p>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="relative isolate overflow-hidden bg-primary py-24 sm:py-32">
        <div className="mx-auto max-w-7xl px-6 lg:px-8">
          <div className="mx-auto max-w-2xl text-center">
            <h2 className="text-3xl font-bold tracking-tight text-white sm:text-4xl lg:text-5xl">
              Ready to Master GP Training?
            </h2>
            <p className="mt-6 text-lg leading-8 text-blue-100">
              Join hundreds of trainees who have simplified their journey with OnCallPrep
            </p>
            <div className="mt-10 flex items-center justify-center gap-x-6">
              <Link href="/signup">
                <Button size="lg" className="h-12 bg-white px-8 text-base font-semibold text-primary hover:bg-blue-50 border-2 border-white">
                  Get Started Free
                </Button>
              </Link>
              <Link href="/pricing">
                <Button size="lg" variant="outline" className="h-12 border-2 border-white px-8 text-base font-semibold text-white hover:bg-white/10 bg-transparent">
                  View Pricing
                </Button>
              </Link>
            </div>
          </div>
        </div>
      </section>
    </>
  )
}
