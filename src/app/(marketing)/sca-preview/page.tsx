import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

const sampleCase = {
  title: 'Mrs. Thompson - Headache',
  scenario: 'A 45-year-old woman presents with a 2-week history of headaches. She is worried because her mother died of a brain tumour.',
  patientInfo: {
    name: 'Mrs. Sarah Thompson',
    age: 45,
    occupation: 'Teacher',
    pmh: 'Migraines (diagnosed age 20), Anxiety',
    medications: 'None regular',
    allergies: 'Penicillin',
  },
  keyPoints: [
    'Explore red flags for headache',
    'Address ICE - particularly her concerns about brain tumour',
    'Discuss the difference between her current symptoms and red flag symptoms',
    'Provide appropriate reassurance',
    'Safety net appropriately',
  ],
  approach: `**Opening:** Establish rapport, acknowledge her concerns early.

**History:** SOCRATES for headache, red flag screen (thunderclap onset, worse lying down, morning vomiting, neurological symptoms, personality change).

**ICE:** Her mother's death is driving her anxiety - this must be addressed sensitively.

**Examination:** Offer neurological examination if appropriate.

**Explanation:** Explain why this doesn't sound like a brain tumour. Use clear, jargon-free language.

**Plan:** Discuss headache diary, lifestyle factors, when to return urgently.`,
}

const caseTypes = [
  { name: 'Communication Skills', count: 15, icon: '💬' },
  { name: 'Clinical Management', count: 20, icon: '🩺' },
  { name: 'Mental Health', count: 12, icon: '🧠' },
  { name: 'Ethics & Professionalism', count: 10, icon: '⚖️' },
  { name: 'Breaking Bad News', count: 8, icon: '💔' },
  { name: 'Safeguarding', count: 6, icon: '🛡️' },
]

export default function SCAPreviewPage() {
  return (
    <div className="min-h-screen">
      {/* Hero */}
      <section className="py-16 bg-gradient-to-b from-teal-50 to-background">
        <div className="container max-w-6xl">
          <div className="text-center mb-12">
            <Badge className="mb-4">SCA Preparation</Badge>
            <h1 className="text-4xl font-bold mb-4">Conquer the Simulated Consultation Assessment</h1>
            <p className="text-xl text-foreground/70 max-w-2xl mx-auto">
              Practice with realistic mock cases, timed exercises, and structured feedback. Build the consultation skills you need to pass with confidence.
            </p>
          </div>

          <div className="grid md:grid-cols-4 gap-4 mb-12">
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">50+</div>
                <p className="text-sm text-foreground/70">Mock Cases</p>
              </CardContent>
            </Card>
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">35</div>
                <p className="text-sm text-foreground/70">Priming Cases</p>
              </CardContent>
            </Card>
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">12 min</div>
                <p className="text-sm text-foreground/70">Timed Practice</p>
              </CardContent>
            </Card>
            <Card className="text-center">
              <CardContent className="pt-6">
                <div className="text-3xl font-bold text-primary">6</div>
                <p className="text-sm text-foreground/70">Case Categories</p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* Sample Case */}
      <section className="py-16">
        <div className="container max-w-4xl">
          <h2 className="text-2xl font-bold text-center mb-8">Sample Priming Case</h2>
          
          <Card className="overflow-hidden">
            <CardHeader className="bg-teal-50 border-b">
              <div className="flex items-center justify-between">
                <Badge variant="secondary">Communication Skills</Badge>
                <Badge variant="outline">12 minutes</Badge>
              </div>
              <CardTitle className="mt-4">{sampleCase.title}</CardTitle>
              <CardDescription className="text-base">
                {sampleCase.scenario}
              </CardDescription>
            </CardHeader>
            <CardContent className="pt-6">
              {/* Patient Info */}
              <div className="mb-6 p-4 bg-muted/50 rounded-lg">
                <h4 className="font-semibold mb-3">Patient Information</h4>
                <div className="grid md:grid-cols-2 gap-2 text-sm">
                  <div><strong>Name:</strong> {sampleCase.patientInfo.name}</div>
                  <div><strong>Age:</strong> {sampleCase.patientInfo.age}</div>
                  <div><strong>Occupation:</strong> {sampleCase.patientInfo.occupation}</div>
                  <div><strong>PMH:</strong> {sampleCase.patientInfo.pmh}</div>
                  <div><strong>Medications:</strong> {sampleCase.patientInfo.medications}</div>
                  <div><strong>Allergies:</strong> {sampleCase.patientInfo.allergies}</div>
                </div>
              </div>

              {/* Key Points */}
              <div className="mb-6">
                <h4 className="font-semibold mb-3">Key Points to Cover</h4>
                <ul className="space-y-2">
                  {sampleCase.keyPoints.map((point, i) => (
                    <li key={i} className="flex items-start gap-2 text-sm">
                      <span className="text-teal-500 mt-0.5">✓</span>
                      {point}
                    </li>
                  ))}
                </ul>
              </div>

              {/* Suggested Approach */}
              <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
                <h4 className="font-semibold text-teal-700 mb-3">Suggested Approach</h4>
                <div className="text-sm text-foreground/80 whitespace-pre-line">
                  {sampleCase.approach}
                </div>
              </div>
            </CardContent>
          </Card>

          <div className="text-center mt-8">
            <p className="text-foreground/70 mb-4">Sign up to access more priming cases and full mock consultations</p>
            <Link href="/signup">
              <Button size="lg">Get Free Access</Button>
            </Link>
          </div>
        </div>
      </section>

      {/* Case Types */}
      <section className="py-16 bg-muted/30">
        <div className="container max-w-4xl">
          <h2 className="text-2xl font-bold text-center mb-8">Case Categories</h2>
          <div className="grid md:grid-cols-3 gap-4">
            {caseTypes.map((type) => (
              <Card key={type.name} className="text-center">
                <CardContent className="pt-6">
                  <div className="text-3xl mb-2">{type.icon}</div>
                  <h3 className="font-semibold">{type.name}</h3>
                  <p className="text-sm text-foreground/70">{type.count} cases</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* What's Included */}
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
                  <li>• SCA exam overview</li>
                  <li>• Sample priming cases</li>
                  <li>• Consultation structure guides</li>
                  <li>• Basic marking criteria explained</li>
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
                  <li>• 35 priming cases</li>
                  <li>• 50+ full mock cases with actor briefs</li>
                  <li>• 12-minute timed practice mode</li>
                  <li>• Model answers and marking criteria</li>
                  <li>• 2-minute diagnosis practice</li>
                </ul>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-16 bg-primary text-white">
        <div className="container max-w-2xl text-center">
          <h2 className="text-3xl font-bold mb-4">Ready to Practice?</h2>
          <p className="text-blue-100 mb-8">
            Start with free sample cases and see how OnCallPrep can help you prepare for the SCA.
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
