import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

const plans = [
  {
    name: 'Free',
    price: '0',
    description: 'Get started with essential resources',
    features: [
      'Portfolio stage checklists',
      'Reflective writing guides',
      'Consultation models explained',
      'SCA exam overview',
      '5 sample mock cases',
      '20 demo AKT questions',
      'Study topic overview',
    ],
    cta: 'Get Started',
    href: '/signup',
    popular: false,
  },
  {
    name: 'Pro Monthly',
    price: '12.99',
    period: '/month',
    description: 'Full access to all training resources',
    features: [
      'Everything in Free, plus:',
      'Detailed competency guides',
      'Full mock case library (50+)',
      '2-min diagnosis practice',
      '3-min priming exercises',
      'Full AKT question bank (500+)',
      'Detailed explanations',
      'Guideline references',
      'Progress tracking',
    ],
    cta: 'Start Pro Trial',
    href: '/signup?plan=pro-monthly',
    popular: true,
  },
  {
    name: 'Pro Annual',
    price: '99',
    period: '/year',
    description: 'Best value — save over 2 months',
    features: [
      'Everything in Pro Monthly',
      'Save £56.88/year',
      'Priority support',
      'Early access to new features',
    ],
    cta: 'Start Pro Trial',
    href: '/signup?plan=pro-annual',
    popular: false,
    badge: 'Best Value',
  },
]

const comparison = [
  { feature: 'Portfolio checklists (ST1-ST3)', free: true, pro: true },
  { feature: 'Reflective writing guides', free: true, pro: true },
  { feature: 'Consultation models', free: true, pro: true },
  { feature: 'Detailed competency guides', free: false, pro: true },
  { feature: 'SCA exam overview', free: true, pro: true },
  { feature: 'Sample mock cases', free: '5', pro: '50+' },
  { feature: 'Timed diagnosis practice', free: false, pro: true },
  { feature: 'Priming exercises', free: false, pro: true },
  { feature: 'AKT demo questions', free: '20', pro: '500+' },
  { feature: 'Detailed explanations', free: false, pro: true },
  { feature: 'Guideline references', free: false, pro: true },
  { feature: 'Progress tracking', free: false, pro: true },
]

export default function PricingPage() {
  return (
    <>
      {/* Hero Section */}
      <section className="relative overflow-hidden bg-gradient-to-br from-blue-50 via-white to-purple-50 py-24 sm:py-32">
        <div className="mx-auto max-w-7xl px-6 lg:px-8">
          <div className="mx-auto max-w-2xl text-center">
            <Badge variant="secondary" className="mb-8 inline-flex px-4 py-2 text-sm font-semibold">
              Flexible Pricing
            </Badge>
            <h1 className="text-4xl font-bold tracking-tight text-foreground sm:text-5xl lg:text-6xl">
              Simple, Transparent Pricing
            </h1>
            <p className="mt-6 text-lg leading-8 text-muted-foreground sm:text-xl">
              Start free and upgrade when you&apos;re ready. Cancel anytime.
            </p>
          </div>
        </div>
      </section>

      {/* Pricing Cards */}
      <section className="py-24 sm:py-32">
        <div className="mx-auto max-w-7xl px-6 lg:px-8">
          <div className="mx-auto grid max-w-6xl grid-cols-1 gap-8 lg:grid-cols-3">
            {plans.map((plan) => (
              <Card
                key={plan.name}
                className={`relative overflow-hidden border-2 transition-all ${
                  plan.popular
                    ? 'scale-105 border-primary shadow-xl'
                    : 'hover:shadow-lg'
                }`}
              >
                {plan.popular && (
                  <div className="absolute -top-4 left-1/2 -translate-x-1/2">
                    <Badge className="px-4 py-1">Most Popular</Badge>
                  </div>
                )}
                {plan.badge && (
                  <div className="absolute -top-4 left-1/2 -translate-x-1/2">
                    <Badge variant="secondary" className="px-4 py-1">{plan.badge}</Badge>
                  </div>
                )}
                <CardHeader className="text-center">
                  <CardTitle className="text-2xl">{plan.name}</CardTitle>
                  <CardDescription className="mt-2 text-sm">
                    {plan.description}
                  </CardDescription>
                  <div className="mt-6">
                    <span className="text-5xl font-bold text-foreground">£{plan.price}</span>
                    {plan.period && (
                      <span className="text-base text-muted-foreground">{plan.period}</span>
                    )}
                  </div>
                </CardHeader>
                <CardContent>
                  <ul className="mb-8 space-y-3">
                    {plan.features.map((feature) => (
                      <li key={feature} className="flex items-start gap-3 text-sm">
                        <span className="text-green-600">✓</span>
                        <span>{feature}</span>
                      </li>
                    ))}
                  </ul>
                  <Link href={plan.href}>
                    <Button
                      className="w-full"
                      variant={plan.popular ? 'default' : 'outline'}
                    >
                      {plan.cta}
                    </Button>
                  </Link>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Comparison Table */}
      <section className="bg-gradient-to-br from-purple-50 via-blue-50 to-white py-24 sm:py-32">
        <div className="mx-auto max-w-7xl px-6 lg:px-8">
          <div className="mx-auto max-w-2xl text-center">
            <h2 className="text-3xl font-bold tracking-tight text-foreground sm:text-4xl">
              Feature Comparison
            </h2>
            <p className="mt-4 text-base text-muted-foreground">
              See exactly what's included in each plan
            </p>
          </div>
          <div className="mx-auto mt-16 max-w-4xl">
            <div className="overflow-hidden rounded-2xl border-2 shadow-lg">
              <div className="grid grid-cols-3 bg-primary px-6 py-4 text-white">
                <div className="font-semibold">Feature</div>
                <div className="text-center font-semibold">Free</div>
                <div className="text-center font-semibold">Pro</div>
              </div>
              {comparison.map((row, i) => (
                <div
                  key={row.feature}
                  className={`grid grid-cols-3 px-6 py-4 ${
                    i % 2 === 0 ? 'bg-white' : 'bg-blue-50/30'
                  }`}
                >
                  <div className="text-sm font-medium text-foreground">{row.feature}</div>
                  <div className="text-center">
                    {typeof row.free === 'boolean' ? (
                      row.free ? (
                        <span className="text-green-600">✓</span>
                      ) : (
                        <span className="text-muted-foreground">—</span>
                      )
                    ) : (
                      <span className="text-sm">{row.free}</span>
                    )}
                  </div>
                  <div className="text-center">
                    {typeof row.pro === 'boolean' ? (
                      row.pro ? (
                        <span className="text-green-600">✓</span>
                      ) : (
                        <span className="text-muted-foreground">—</span>
                      )
                    ) : (
                      <span className="text-sm font-semibold text-primary">{row.pro}</span>
                    )}
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* FAQ */}
      <section className="py-24 sm:py-32">
        <div className="mx-auto max-w-7xl px-6 lg:px-8">
          <div className="mx-auto max-w-2xl text-center">
            <h2 className="text-3xl font-bold tracking-tight text-foreground sm:text-4xl">
              Frequently Asked Questions
            </h2>
          </div>
          <div className="mx-auto mt-16 max-w-3xl">
            <div className="space-y-8">
              {[
                {
                  q: 'Can I cancel my subscription anytime?',
                  a: 'Yes, you can cancel your Pro subscription at any time. You\'ll continue to have access until the end of your billing period.',
                },
                {
                  q: 'Is there a free trial?',
                  a: 'Yes! The Free plan gives you access to core features indefinitely. Pro features come with a trial period so you can explore before committing.',
                },
                {
                  q: 'What payment methods do you accept?',
                  a: 'We accept all major credit cards through our secure payment processor, Stripe.',
                },
                {
                  q: 'Can I switch between monthly and annual?',
                  a: 'Absolutely. You can upgrade or downgrade your plan at any time from your account settings.',
                },
              ].map((faq) => (
                <div key={faq.q} className="border-b pb-8 last:border-b-0">
                  <h3 className="text-lg font-semibold text-foreground">{faq.q}</h3>
                  <p className="mt-3 text-base leading-7 text-muted-foreground">{faq.a}</p>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>
    </>
  )
}
