import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import Link from 'next/link'

export default function SupportPage() {
  return (
    <div className="min-h-screen bg-gradient-to-b from-slate-50 to-slate-100 dark:from-slate-950 dark:to-slate-900 py-12">
      <div className="max-w-4xl mx-auto px-4 space-y-8">
        {/* Header */}
        <div className="text-center space-y-4">
          <h1 className="text-4xl font-bold text-slate-900 dark:text-slate-100">Trainee Support</h1>
          <p className="text-lg text-slate-600 dark:text-slate-400 max-w-2xl mx-auto">
            Access to support services, resources, and guidance during your GP training journey
          </p>
        </div>

        {/* Support Services */}
        <Card className="border-2 border-teal-200 dark:border-teal-800 bg-white dark:bg-slate-900">
          <CardHeader className="bg-teal-600 dark:bg-teal-800 text-white rounded-t-lg">
            <CardTitle className="text-2xl">Support Services</CardTitle>
            <CardDescription className="text-teal-100">
              Professional and personal support available to GP trainees
            </CardDescription>
          </CardHeader>
          <CardContent className="pt-6 space-y-6">
            <div className="grid md:grid-cols-2 gap-4">
              <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
                <h3 className="font-semibold text-teal-700 dark:text-teal-400 mb-2">Educational Supervisor</h3>
                <p className="text-sm text-slate-600 dark:text-slate-400">
                  Your primary point of contact for training support, portfolio guidance, and career development.
                </p>
              </div>
              <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
                <h3 className="font-semibold text-teal-700 dark:text-teal-400 mb-2">Clinical Supervisor</h3>
                <p className="text-sm text-slate-600 dark:text-slate-400">
                  Provides day-to-day clinical supervision and support in your current placement.
                </p>
              </div>
              <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
                <h3 className="font-semibold text-teal-700 dark:text-teal-400 mb-2">Training Programme Director</h3>
                <p className="text-sm text-slate-600 dark:text-slate-400">
                  Oversees your training programme and can help with training-related concerns.
                </p>
              </div>
              <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
                <h3 className="font-semibold text-teal-700 dark:text-teal-400 mb-2">Deanery/HEE</h3>
                <p className="text-sm text-slate-600 dark:text-slate-400">
                  Contact your local deanery or Health Education England for training programme queries.
                </p>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Professional Support */}
        <Card className="border-2 border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-900">
          <CardHeader>
            <CardTitle className="text-2xl text-slate-900 dark:text-slate-100">Professional Support</CardTitle>
            <CardDescription className="text-slate-600 dark:text-slate-400">
              Organisations and services for professional development and wellbeing
            </CardDescription>
          </CardHeader>
          <CardContent className="pt-6 space-y-4">
            <div className="space-y-3">
              <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
                <h3 className="font-semibold text-teal-700 dark:text-teal-400 mb-2">RCGP</h3>
                <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                  Royal College of General Practitioners - support, resources, and guidance for GP trainees
                </p>
                <a href="https://www.rcgp.org.uk" target="_blank" rel="noopener noreferrer" className="text-teal-600 dark:text-teal-400 hover:underline text-sm">
                  Visit RCGP website →
                </a>
              </div>
              <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
                <h3 className="font-semibold text-teal-700 dark:text-teal-400 mb-2">BMA</h3>
                <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                  British Medical Association - professional support, advice, and representation
                </p>
                <a href="https://www.bma.org.uk" target="_blank" rel="noopener noreferrer" className="text-teal-600 dark:text-teal-400 hover:underline text-sm">
                  Visit BMA website →
                </a>
              </div>
              <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
                <h3 className="font-semibold text-teal-700 dark:text-teal-400 mb-2">GMC</h3>
                <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                  General Medical Council - registration, guidance, and fitness to practise support
                </p>
                <a href="https://www.gmc-uk.org" target="_blank" rel="noopener noreferrer" className="text-teal-600 dark:text-teal-400 hover:underline text-sm">
                  Visit GMC website →
                </a>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Wellbeing Support */}
        <Card className="border-2 border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-900">
          <CardHeader>
            <CardTitle className="text-2xl text-slate-900 dark:text-slate-100">Wellbeing & Mental Health Support</CardTitle>
            <CardDescription className="text-slate-600 dark:text-slate-400">
              Confidential support services for trainees experiencing difficulties
            </CardDescription>
          </CardHeader>
          <CardContent className="pt-6 space-y-4">
            <div className="grid md:grid-cols-2 gap-4">
              <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
                <h3 className="font-semibold text-teal-700 dark:text-teal-400 mb-2">BMA Wellbeing Support</h3>
                <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                  Free, confidential 24/7 counselling and peer support for doctors
                </p>
                <p className="text-xs text-slate-500 dark:text-slate-500">0330 123 1245</p>
              </div>
              <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
                <h3 className="font-semibold text-teal-700 dark:text-teal-400 mb-2">Practitioner Health</h3>
                <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                  Specialist NHS service for doctors and dentists with mental health or addiction concerns
                </p>
                <a href="https://www.practitionerhealth.nhs.uk" target="_blank" rel="noopener noreferrer" className="text-teal-600 dark:text-teal-400 hover:underline text-xs">
                  Visit website →
                </a>
              </div>
              <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
                <h3 className="font-semibold text-teal-700 dark:text-teal-400 mb-2">Samaritans</h3>
                <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                  Free, confidential 24/7 emotional support
                </p>
                <p className="text-xs text-slate-500 dark:text-slate-500">116 123</p>
              </div>
              <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
                <h3 className="font-semibold text-teal-700 dark:text-teal-400 mb-2">Deanery Support Services</h3>
                <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                  Contact your local deanery for trainee support services and counselling
                </p>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* When to Seek Help */}
        <Card className="border-2 border-teal-200 dark:border-teal-800 bg-white dark:bg-slate-900">
          <CardHeader className="bg-teal-600 dark:bg-teal-800 text-white rounded-t-lg">
            <CardTitle className="text-2xl">When to Seek Help</CardTitle>
            <CardDescription className="text-teal-100">
              It's okay to ask for support - early intervention is important
            </CardDescription>
          </CardHeader>
          <CardContent className="pt-6">
            <div className="space-y-3">
              <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border-l-4 border-teal-600">
                <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Signs you might need support:</h4>
                <ul className="text-sm text-slate-600 dark:text-slate-400 space-y-1 ml-4 list-disc">
                  <li>Feeling overwhelmed or unable to cope</li>
                  <li>Persistent low mood or anxiety</li>
                  <li>Difficulty sleeping or concentrating</li>
                  <li>Changes in appetite or energy levels</li>
                  <li>Withdrawing from colleagues or activities</li>
                  <li>Concerns about your performance or training</li>
                </ul>
              </div>
              <div className="p-4 bg-teal-50 dark:bg-teal-950/30 rounded-lg">
                <p className="text-sm text-slate-700 dark:text-slate-300">
                  <strong>Remember:</strong> Seeking help is a sign of strength, not weakness. Your wellbeing is important, 
                  and there are people and services ready to support you.
                </p>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Quick Links */}
        <Card className="border-2 border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-900">
          <CardHeader>
            <CardTitle className="text-2xl text-slate-900 dark:text-slate-100">Quick Links</CardTitle>
          </CardHeader>
          <CardContent className="pt-6">
            <div className="grid md:grid-cols-2 gap-3">
              <Link href="/portfolio" className="p-3 bg-slate-50 dark:bg-slate-800 rounded-lg hover:bg-slate-100 dark:hover:bg-slate-700 transition-colors">
                <div className="font-medium text-teal-700 dark:text-teal-400">Portfolio Helper</div>
                <div className="text-xs text-slate-600 dark:text-slate-400 mt-1">Track your WPBA requirements</div>
              </Link>
              <Link href="/resources" className="p-3 bg-slate-50 dark:bg-slate-800 rounded-lg hover:bg-slate-100 dark:hover:bg-slate-700 transition-colors">
                <div className="font-medium text-teal-700 dark:text-teal-400">Learning Resources</div>
                <div className="text-xs text-slate-600 dark:text-slate-400 mt-1">Guides and tools</div>
              </Link>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
