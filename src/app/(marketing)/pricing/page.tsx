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
    ],
    cta: 'Get Started',
    href: '/signup',
    popular: false,
  },
  {
    name: '1 Month',
    price: '12.99',
    period: '/month',
    description: 'Try Pro features',
    features: [
      'Everything in Free, plus:',
      'Full AKT question bank (500+)',
      'Full mock case library (50+)',
      'Detailed explanations',
      'Progress tracking',
    ],
    cta: 'Get 1 Month',
    href: '/signup?plan=pro-monthly',
    popular: false,
  },
  {
    name: '3 Months',
    price: '29.99',
    period: '/3 months',
    pricePerMonth: '£10/mo',
    description: 'Focused exam prep',
    features: [
      'Everything in 1 Month',
      'Save 23% vs monthly',
      '2-min diagnosis practice',
      '3-min priming exercises',
    ],
    cta: 'Get 3 Months',
    href: '/signup?plan=pro-3month',
    popular: false,
  },
  {
    name: '6 Months',
    price: '49.99',
    period: '/6 months',
    pricePerMonth: '£8.33/mo',
    description: 'Most popular for trainees',
    features: [
      'Everything in 3 Months',
      'Save 36% vs monthly',
      'Guideline references',
      'Priority support',
    ],
    cta: 'Get 6 Months',
    href: '/signup?plan=pro-6month',
    popular: true,
    badge: 'Most Popular',
  },
  {
    name: '12 Months',
    price: '79.99',
    period: '/year',
    pricePerMonth: '£6.67/mo',
    description: 'Best value for training',
    features: [
      'Everything in 6 Months',
      'Save 49% vs monthly',
      'Early access to features',
    ],
    cta: 'Get Annual',
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
      <section className="relative overflow-hidden bg-gradient-to-b from-primary/5 to-white py-24 sm:py-32">
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
      <section className="py-24 sm:py-32 bg-secondary">
        <div className="mx-auto max-w-7xl px-6 lg:px-8">
          <div className="mx-auto grid max-w-7xl grid-cols-1 gap-6 md:grid-cols-2 lg:grid-cols-5 items-stretch">
            {plans.map((plan) => (
              <Card
                key={plan.name}
                className={`relative border-2 bg-white flex flex-col ${
                  plan.popular
                    ? 'border-primary shadow-lg'
                    : 'border-border hover:border-primary/50 hover:shadow-md'
                }`}
              >
                {/* Badge - consistent height for all cards */}
                <div className="h-8 flex items-center justify-center">
                  {plan.badge ? (
                    <div className="bg-primary text-white text-xs font-semibold text-center py-1.5 w-full">
                      {plan.badge}
                    </div>
                  ) : (
                    <div className="h-0"></div>
                  )}
                </div>

                {/* Header - titles aligned */}
                <CardHeader className="text-center pt-6 pb-4">
                  <CardTitle className="text-lg font-bold text-foreground h-7 flex items-center justify-center">
                    {plan.name}
                  </CardTitle>
                  <CardDescription className="mt-2 text-xs text-muted-foreground min-h-[3rem] flex items-center justify-center">
                    {plan.description}
                  </CardDescription>
                </CardHeader>

                {/* Price - aligned across all cards */}
                <div className="px-6 pb-4 text-center min-h-[5rem] flex flex-col justify-center">
                  <span className="text-3xl font-bold text-foreground">£{plan.price}</span>
                  {plan.period && (
                    <span className="text-xs text-muted-foreground block mt-1">{plan.period}</span>
                  )}
                  {plan.pricePerMonth && (
                    <span className="text-xs text-primary font-semibold mt-1 block">{plan.pricePerMonth}</span>
                  )}
                </div>

                {/* Features - flexible space */}
                <CardContent className="pt-0 pb-4 flex-1 flex flex-col">
                  <ul className="mb-6 space-y-2 flex-1">
                    {plan.features.map((feature) => (
                      <li key={feature} className="flex items-start gap-2 text-xs">
                        <span className="text-primary font-bold">✓</span>
                        <span className="text-foreground">{feature}</span>
                      </li>
                    ))}
                  </ul>
                  
                  {/* Button - aligned at bottom */}
                  <Link href={plan.href} className="mt-auto">
                    <Button
                      className="w-full border-2"
                      variant={plan.popular ? 'default' : 'outline'}
                      size="sm"
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
      <section className="bg-slate-50 py-24 sm:py-32">
        <div className="mx-auto max-w-7xl px-6 lg:px-8">
          <div className="mx-auto max-w-2xl text-center">
            <h2 className="text-3xl font-bold tracking-tight text-slate-900 sm:text-4xl">
              Feature Comparison
            </h2>
            <p className="mt-4 text-base text-slate-700">
              See exactly what's included in each plan
            </p>
          </div>
          <div className="mx-auto mt-16 max-w-4xl">
            <div className="overflow-hidden rounded-2xl border-2 border-slate-300 shadow-lg">
              <div className="grid grid-cols-3 bg-teal-600 px-6 py-4 text-white">
                <div className="font-semibold">Feature</div>
                <div className="text-center font-semibold">Free</div>
                <div className="text-center font-semibold">Pro</div>
              </div>
              {comparison.map((row, i) => (
                <div
                  key={row.feature}
                  className={`grid grid-cols-3 px-6 py-4 ${
                    i % 2 === 0 ? 'bg-white' : 'bg-slate-50'
                  }`}
                >
                  <div className="text-sm font-medium text-slate-900">{row.feature}</div>
                  <div className="text-center">
                    {typeof row.free === 'boolean' ? (
                      row.free ? (
                        <span className="text-teal-600 font-bold text-lg">✓</span>
                      ) : (
                        <span className="text-slate-400 font-semibold">—</span>
                      )
                    ) : (
                      <span className="text-sm font-semibold text-slate-900">{row.free}</span>
                    )}
                  </div>
                  <div className="text-center">
                    {typeof row.pro === 'boolean' ? (
                      row.pro ? (
                        <span className="text-teal-600 font-bold text-lg">✓</span>
                      ) : (
                        <span className="text-slate-400 font-semibold">—</span>
                      )
                    ) : (
                      <span className="text-sm font-semibold text-teal-700">{row.pro}</span>
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
