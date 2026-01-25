import Link from 'next/link'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import ContactForm from '@/components/ContactForm'

export default function AboutPage() {
  return (
    <div className="min-h-screen">
      {/* Hero Section */}
      <section className="py-16 bg-secondary">
        <div className="mx-auto max-w-4xl px-6 text-center">
          <h1 className="text-4xl font-bold mb-4">About OnCallPrep</h1>
          <p className="text-xl text-foreground/70">
            Supporting GP trainees through their training journey
          </p>
        </div>
      </section>

      <section className="py-12 bg-white">
        <div className="mx-auto max-w-4xl px-6 space-y-12">
          {/* Mission */}
          <Card>
            <CardHeader>
              <CardTitle>Our Mission</CardTitle>
            </CardHeader>
            <CardContent className="space-y-4 text-foreground/80">
              <p>
                OnCallPrep was created by GP trainees, for GP trainees. We understand the challenges of GP training -
                the portfolio requirements, the exams, the never-ending learning, and the juggle between clinical work and study.
              </p>
              <p>
                Our mission is to provide high-quality, accessible resources that help you succeed in your training
                without breaking the bank. We believe every trainee deserves access to excellent preparation materials.
              </p>
            </CardContent>
          </Card>

          {/* What We Offer */}
          <Card>
            <CardHeader>
              <CardTitle>What We Offer</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid md:grid-cols-2 gap-6">
                <div className="p-4 bg-blue-50 rounded-lg border border-blue-200">
                  <span className="text-2xl">📝</span>
                  <h3 className="font-semibold text-blue-700 mt-2">AKT Question Bank</h3>
                  <p className="text-sm text-foreground/70 mt-1">
                    Hundreds of practice questions covering clinical medicine, evidence-based practice, and administrative topics.
                  </p>
                </div>
                <div className="p-4 bg-green-50 rounded-lg border border-green-200">
                  <span className="text-2xl">🩺</span>
                  <h3 className="font-semibold text-green-700 mt-2">SCA Preparation</h3>
                  <p className="text-sm text-foreground/70 mt-1">
                    Priming cases, mock consultations, and structured approaches to help you excel in the clinical assessment.
                  </p>
                </div>
                <div className="p-4 bg-purple-50 rounded-lg border border-purple-200">
                  <span className="text-2xl">📁</span>
                  <h3 className="font-semibold text-purple-700 mt-2">Portfolio Guidance</h3>
                  <p className="text-sm text-foreground/70 mt-1">
                    Stage-by-stage guides, reflection frameworks, and tips for building a strong portfolio.
                  </p>
                </div>
                <div className="p-4 bg-amber-50 rounded-lg border border-amber-200">
                  <span className="text-2xl">📚</span>
                  <h3 className="font-semibold text-amber-700 mt-2">Learning Resources</h3>
                  <p className="text-sm text-foreground/70 mt-1">
                    Consultation models, clinical topics, WPBA guides, and everything you need beyond the formal curriculum.
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Contact */}
          <Card>
            <CardHeader>
              <CardTitle>Contact Us</CardTitle>
              <CardDescription>
                We&apos;d love to hear from you! Whether you have feedback, suggestions, questions, or just want to say hello.
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-6">
              {/* Contact Form */}
              <ContactForm />

              {/* Contact Information */}
              <div className="pt-6 border-t border-slate-200">
                <div className="grid md:grid-cols-2 gap-6">
                  <div>
                    <h4 className="font-semibold text-slate-900 mb-2">Email</h4>
                    <a href="mailto:hello@oncallprep.com" className="text-teal-600 hover:underline">
                      hello@oncallprep.com
                    </a>
                  </div>
                  <div>
                    <h4 className="font-semibold text-slate-900 mb-2">Social Media</h4>
                    <p className="text-sm text-slate-600">Follow us for updates and tips</p>
                  </div>
                </div>

                {/* Business Hours */}
                <div className="mt-6 p-4 bg-slate-50 rounded-lg border border-slate-200">
                  <h4 className="font-semibold text-slate-900 mb-3">Business Hours</h4>
                  <div className="space-y-1 text-sm text-slate-700">
                    <div className="flex justify-between">
                      <span>Monday - Friday:</span>
                      <span>9:00 AM - 6:00 PM GMT</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Saturday:</span>
                      <span>10:00 AM - 4:00 PM GMT</span>
                    </div>
                    <div className="flex justify-between">
                      <span>Sunday:</span>
                      <span>Closed</span>
                    </div>
                    <p className="text-xs text-slate-500 mt-2 pt-2 border-t border-slate-200">
                      We typically respond within 24-48 hours during business hours.
                    </p>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Disclaimer */}
          <Card className="border-amber-200">
            <CardHeader>
              <CardTitle className="text-amber-700">Important Disclaimer</CardTitle>
            </CardHeader>
            <CardContent className="text-foreground/70 space-y-3">
              <p>
                OnCallPrep is designed to supplement your GP training, not replace it. While we strive for accuracy,
                medical knowledge evolves constantly.
              </p>
              <p>
                Always verify clinical information against current guidelines and consult your educational supervisor
                for training-specific questions. Our content should not be used for clinical decision-making without
                verification from authoritative sources.
              </p>
              <p>
                OnCallPrep is not affiliated with or endorsed by the RCGP, NHS, or any deanery.
              </p>
            </CardContent>
          </Card>

        </div>
      </section>

      {/* CTA */}
      <section className="py-16 bg-primary text-white">
        <div className="mx-auto max-w-4xl px-6 text-center">
          <h2 className="text-2xl font-bold mb-4">Ready to get started?</h2>
          <div className="flex gap-4 justify-center">
            <Link href="/signup">
              <Button size="lg" variant="secondary">Start Free Trial</Button>
            </Link>
            <Link href="/pricing">
              <Button variant="outline" size="lg" className="border-white text-white hover:bg-white/10">View Pricing</Button>
            </Link>
          </div>
        </div>
      </section>
    </div>
  )
}
