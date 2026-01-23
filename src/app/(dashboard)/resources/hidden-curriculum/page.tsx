import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

export default function HiddenCurriculumPage() {
  return (
    <div className="space-y-8 max-w-4xl">
      <div>
        <h1 className="text-3xl font-bold">Hidden Curriculum</h1>
        <p className="text-foreground/70 mt-2 text-lg">
          Essential knowledge beyond the formal curriculum - GP setup, triage, finances, and career paths.
        </p>
      </div>

      {/* GP Practice Types */}
      <Card className="border-2 border-blue-200">
        <CardHeader className="bg-gradient-to-r from-blue-500 to-blue-600 text-white rounded-t-lg">
          <CardTitle>🏥 Understanding GP Practice Structures</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="space-y-4">
            <div className="p-4 bg-blue-50 rounded-lg border border-blue-200">
              <h4 className="font-semibold text-blue-700">Partnership</h4>
              <p className="text-sm text-foreground/70 mt-1">Own shares in the practice, share profits and losses. More autonomy but also more responsibility and financial risk.</p>
            </div>
            <div className="p-4 bg-blue-50 rounded-lg border border-blue-200">
              <h4 className="font-semibold text-blue-700">Salaried GP</h4>
              <p className="text-sm text-foreground/70 mt-1">Employed by the practice with fixed salary. Less financial risk, predictable income, but less say in practice decisions.</p>
            </div>
            <div className="p-4 bg-blue-50 rounded-lg border border-blue-200">
              <h4 className="font-semibold text-blue-700">Locum GP</h4>
              <p className="text-sm text-foreground/70 mt-1">Temporary cover, paid per session. Maximum flexibility but no job security or employment benefits.</p>
            </div>
            <div className="p-4 bg-blue-50 rounded-lg border border-blue-200">
              <h4 className="font-semibold text-blue-700">Portfolio Career</h4>
              <p className="text-sm text-foreground/70 mt-1">Mix of clinical and non-clinical work - teaching, research, management, special interests. Increasingly popular.</p>
            </div>
          </div>

          <h4 className="font-semibold text-foreground mt-6 mb-3">Business Models</h4>
          <div className="grid md:grid-cols-3 gap-3">
            <div className="p-3 bg-gray-50 rounded-lg text-center">
              <strong className="text-foreground">GMS</strong>
              <p className="text-xs text-foreground/60">General Medical Services - Standard NHS contract</p>
            </div>
            <div className="p-3 bg-gray-50 rounded-lg text-center">
              <strong className="text-foreground">PMS</strong>
              <p className="text-xs text-foreground/60">Personal Medical Services - Locally negotiated</p>
            </div>
            <div className="p-3 bg-gray-50 rounded-lg text-center">
              <strong className="text-foreground">APMS</strong>
              <p className="text-xs text-foreground/60">Alternative Provider Medical Services</p>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Triage */}
      <Card className="border-2 border-green-200">
        <CardHeader className="bg-gradient-to-r from-green-500 to-green-600 text-white rounded-t-lg">
          <CardTitle>📞 Triage and Urgency Assessment</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="p-4 bg-green-50 rounded-lg border border-green-200 mb-4">
            <strong className="text-green-700">💡 Key Principle:</strong>{' '}
            <span className="text-foreground/70">Triage is about matching clinical need to appropriate response, not gatekeeping access.</span>
          </div>

          <h4 className="font-semibold text-foreground mb-3">Urgency Categories</h4>
          <div className="space-y-2">
            <div className="flex items-center gap-3 p-3 bg-red-50 rounded-lg border border-red-200">
              <Badge className="bg-red-500">Emergency</Badge>
              <span className="text-sm text-foreground/70">999 / Immediate - Life threatening</span>
            </div>
            <div className="flex items-center gap-3 p-3 bg-orange-50 rounded-lg border border-orange-200">
              <Badge className="bg-orange-500">Urgent</Badge>
              <span className="text-sm text-foreground/70">Same day - Could deteriorate without prompt attention</span>
            </div>
            <div className="flex items-center gap-3 p-3 bg-yellow-50 rounded-lg border border-yellow-200">
              <Badge className="bg-yellow-500 text-black">Soon</Badge>
              <span className="text-sm text-foreground/70">24-48 hours - Needs attention but stable</span>
            </div>
            <div className="flex items-center gap-3 p-3 bg-green-50 rounded-lg border border-green-200">
              <Badge className="bg-green-500">Routine</Badge>
              <span className="text-sm text-foreground/70">Scheduled appointment - Non-urgent</span>
            </div>
          </div>

          <h4 className="font-semibold text-foreground mt-6 mb-3">Red Flags to Remember</h4>
          <div className="grid md:grid-cols-2 gap-2 text-sm">
            {[
              'Chest pain with cardiac features',
              'Sudden severe headache',
              'Signs of meningitis',
              'Acute abdomen',
              'Significant bleeding',
              'Stroke symptoms',
              'Severe allergic reaction',
              'Altered consciousness',
            ].map((flag, i) => (
              <div key={i} className="flex items-center gap-2 p-2 bg-red-50 rounded">
                <span className="text-red-500">🚨</span>
                <span className="text-foreground/70">{flag}</span>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Finances */}
      <Card className="border-2 border-purple-200">
        <CardHeader className="bg-gradient-to-r from-purple-500 to-purple-600 text-white rounded-t-lg">
          <CardTitle>💰 GP Finances & Tax</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <h4 className="font-semibold text-foreground mb-3">Income Streams</h4>
          <div className="space-y-2 mb-6">
            <div className="p-3 bg-purple-50 rounded-lg border border-purple-200">
              <strong className="text-purple-700">Global Sum</strong>
              <span className="text-sm text-foreground/70 ml-2">- Core funding based on practice list size and patient demographics</span>
            </div>
            <div className="p-3 bg-purple-50 rounded-lg border border-purple-200">
              <strong className="text-purple-700">QOF</strong>
              <span className="text-sm text-foreground/70 ml-2">- Quality and Outcomes Framework payments for meeting targets</span>
            </div>
            <div className="p-3 bg-purple-50 rounded-lg border border-purple-200">
              <strong className="text-purple-700">Enhanced Services</strong>
              <span className="text-sm text-foreground/70 ml-2">- Additional payments for specific services (e.g., minor surgery)</span>
            </div>
          </div>

          <h4 className="font-semibold text-foreground mb-3">Tax Deductions for GPs</h4>
          <p className="text-sm text-foreground/70 mb-3">As a GP, you may be able to claim tax relief on:</p>
          <div className="grid md:grid-cols-2 gap-2 text-sm">
            {[
              'GMC registration',
              'Medical defence (MDU/MPS)',
              'BMA/RCGP subscriptions',
              'Professional courses/CPD',
              'Medical equipment',
              'Professional journals',
              'Work travel (not commuting)',
              'Locum agency fees',
            ].map((item, i) => (
              <div key={i} className="flex items-center gap-2 p-2 bg-purple-50 rounded">
                <span className="text-purple-500">✓</span>
                <span className="text-foreground/70">{item}</span>
              </div>
            ))}
          </div>

          <div className="mt-4 p-4 bg-amber-50 rounded-lg border border-amber-200">
            <strong className="text-amber-700">💡 Tip:</strong>{' '}
            <span className="text-foreground/70">Keep receipts for everything work-related. Consider getting an accountant who specializes in medical professionals.</span>
          </div>
        </CardContent>
      </Card>

      {/* Career Paths */}
      <Card className="border-2 border-teal-200">
        <CardHeader className="bg-gradient-to-r from-teal-500 to-teal-600 text-white rounded-t-lg">
          <CardTitle>🛤️ Career Paths & Extended Roles</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <h4 className="font-semibold text-foreground mb-3">Extended Roles</h4>
          <div className="grid md:grid-cols-2 gap-3 mb-6">
            {[
              { role: 'GP Trainer', desc: 'Supervise and teach GP registrars' },
              { role: 'Appraiser', desc: 'Conduct annual appraisals for GPs' },
              { role: 'PCN Clinical Director', desc: 'Lead a Primary Care Network' },
              { role: 'CCG/ICB Work', desc: 'Commissioning and system leadership' },
              { role: 'Medical Educator', desc: 'Teaching at medical schools' },
              { role: 'Research', desc: 'Academic GP roles and research' },
              { role: 'Special Interest', desc: 'Develop expertise in specific areas' },
              { role: 'Forensic/Police', desc: 'Forensic medical examiner work' },
            ].map((item, i) => (
              <div key={i} className="p-3 bg-teal-50 rounded-lg border border-teal-200">
                <strong className="text-teal-700">{item.role}</strong>
                <p className="text-xs text-foreground/60 mt-1">{item.desc}</p>
              </div>
            ))}
          </div>

          <h4 className="font-semibold text-foreground mb-3">GPwSI/GPwER Areas</h4>
          <p className="text-sm text-foreground/70 mb-3">GP with Special Interest / Extended Role opportunities:</p>
          <div className="flex flex-wrap gap-2">
            {[
              'Dermatology', 'MSK', 'Cardiology', 'Respiratory', 'Mental Health',
              'Women&apos;s Health', 'Minor Surgery', 'ENT', 'Elderly Care', 'Palliative Care',
            ].map((area, i) => (
              <Badge key={i} variant="secondary">{area}</Badge>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* QI and Audit */}
      <Card className="border-2 border-amber-200">
        <CardHeader className="bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-t-lg">
          <CardTitle>📊 Quality Improvement & Audit</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <h4 className="font-semibold text-foreground mb-3">The Audit Cycle</h4>
          <div className="flex flex-wrap justify-center gap-2 mb-4">
            {['Identify topic', 'Set standards', 'Collect data', 'Compare to standards', 'Implement change', 'Re-audit'].map((step, i) => (
              <div key={i} className="flex items-center">
                <span className="px-3 py-2 bg-amber-100 rounded-full text-sm text-amber-800">{step}</span>
                {i < 5 && <span className="mx-2 text-amber-400">→</span>}
              </div>
            ))}
          </div>

          <h4 className="font-semibold text-foreground mb-3">QI Methodologies</h4>
          <div className="grid md:grid-cols-2 gap-3">
            <div className="p-3 bg-amber-50 rounded-lg border border-amber-200">
              <strong className="text-amber-700">PDSA Cycles</strong>
              <p className="text-xs text-foreground/60 mt-1">Plan-Do-Study-Act - rapid small-scale tests of change</p>
            </div>
            <div className="p-3 bg-amber-50 rounded-lg border border-amber-200">
              <strong className="text-amber-700">SEA</strong>
              <p className="text-xs text-foreground/60 mt-1">Significant Event Analysis - learning from incidents</p>
            </div>
            <div className="p-3 bg-amber-50 rounded-lg border border-amber-200">
              <strong className="text-amber-700">Root Cause Analysis</strong>
              <p className="text-xs text-foreground/60 mt-1">Deep investigation of why things went wrong</p>
            </div>
            <div className="p-3 bg-amber-50 rounded-lg border border-amber-200">
              <strong className="text-amber-700">Process Mapping</strong>
              <p className="text-xs text-foreground/60 mt-1">Visualizing workflows to identify improvements</p>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Reports and Letters */}
      <Card className="border-2 border-gray-200">
        <CardHeader>
          <CardTitle>📝 Reports and Administrative Tasks</CardTitle>
        </CardHeader>
        <CardContent>
          <h4 className="font-semibold text-foreground mb-3">Common GP Reports</h4>
          <div className="space-y-2">
            {[
              { type: 'Fit Notes', desc: 'Formerly sick notes - Med3 forms for patients' },
              { type: 'DVLA Reports', desc: 'Medical fitness to drive assessments' },
              { type: 'Insurance Reports', desc: 'Private medical reports for insurers' },
              { type: 'Referral Letters', desc: '2WW, routine, urgent referrals' },
              { type: 'Private Letters', desc: 'Travel vaccinations, private prescriptions' },
              { type: 'Safeguarding Reports', desc: 'Child protection, vulnerable adult concerns' },
            ].map((item, i) => (
              <div key={i} className="flex items-start gap-3 p-3 bg-gray-50 rounded-lg">
                <span className="text-primary font-bold">•</span>
                <div>
                  <strong className="text-foreground">{item.type}</strong>
                  <span className="text-sm text-foreground/70 ml-2">- {item.desc}</span>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
