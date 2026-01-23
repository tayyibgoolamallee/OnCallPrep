import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

const examFormat = [
  { label: 'Total Cases', value: '12' },
  { label: 'Per Case', value: '10 mins + 2 prep' },
  { label: 'Format', value: 'Video consultation' },
  { label: 'Pass Mark', value: '~71%' },
]

const markingDomains = [
  { domain: 'Data Gathering', description: 'History taking, identifying red flags, systematic questioning', weight: 'High' },
  { domain: 'Clinical Management', description: 'Diagnosis, investigation, treatment planning, safety netting', weight: 'High' },
  { domain: 'Interpersonal Skills', description: 'Communication, empathy, shared decision-making, ICE', weight: 'High' },
]

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
  { name: 'Communication Skills', count: 15 },
  { name: 'Clinical Management', count: 20 },
  { name: 'Mental Health', count: 12 },
  { name: 'Ethics & Professionalism', count: 10 },
  { name: 'Breaking Bad News', count: 8 },
  { name: 'Safeguarding', count: 6 },
]

export default function SCAPreviewPage() {
  return (
    <div className="min-h-screen">
      {/* Hero */}
      <section className="py-16 bg-gradient-to-br from-primary/5 via-white to-accent/5">
        <div className="container max-w-6xl">
          <div className="text-center mb-12">
            <Badge className="mb-4 bg-primary">SCA Preparation</Badge>
            <h1 className="text-4xl font-bold mb-4">Conquer the Simulated Consultation Assessment</h1>
            <p className="text-xl text-foreground/70 max-w-2xl mx-auto">
              Practice with realistic mock cases, timed exercises, and structured feedback. Build the consultation skills you need to pass with confidence.
            </p>
          </div>

          {/* Exam Format */}
          <div className="grid md:grid-cols-4 gap-4 mb-12">
            {examFormat.map((item) => (
              <Card key={item.label} className="text-center border-2 border-primary/10 bg-white/80 backdrop-blur">
                <CardContent className="pt-6">
                  <div className="text-2xl font-bold text-primary">{item.value}</div>
                  <p className="text-sm text-foreground/70">{item.label}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* What is the SCA */}
      <section className="py-16 bg-white">
        <div className="container max-w-4xl">
          <h2 className="text-2xl font-bold text-center mb-8">Understanding the SCA</h2>
          <Card className="border-2 border-primary/20 rounded-2xl overflow-hidden">
            <CardHeader className="bg-gradient-to-r from-primary/5 to-accent/5">
              <CardTitle>What is the Simulated Consultation Assessment?</CardTitle>
            </CardHeader>
            <CardContent className="pt-6 space-y-4">
              <p className="text-foreground/80">
                The SCA is a video-based clinical assessment where you conduct 12 simulated consultations with trained role players. 
                It assesses your ability to gather information, make clinical decisions, and communicate effectively with patients.
              </p>
              <p className="text-foreground/80">
                Each case is a unique clinical scenario you might encounter in general practice. There is no physical examination - 
                you must reason through history and communication alone.
              </p>
            </CardContent>
          </Card>

          {/* Marking Domains */}
          <div className="mt-8">
            <h3 className="text-xl font-semibold mb-4 text-center">Marking Domains</h3>
            <div className="grid md:grid-cols-3 gap-4">
              {markingDomains.map((item) => (
                <Card key={item.domain} className="border border-primary/20 rounded-xl">
                  <CardContent className="pt-6">
                    <div className="flex items-center justify-between mb-2">
                      <h4 className="font-semibold text-primary">{item.domain}</h4>
                    </div>
                    <p className="text-sm text-foreground/70">{item.description}</p>
                  </CardContent>
                </Card>
              ))}
            </div>
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
              <Card key={type.name} className="text-center border-2 border-primary/10 hover:border-primary/30 transition-colors">
                <CardContent className="pt-6">
                  <h3 className="font-semibold text-primary">{type.name}</h3>
                  <p className="text-sm text-foreground/70 mt-1">{type.count} cases</p>
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
