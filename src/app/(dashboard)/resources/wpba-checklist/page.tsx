import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

export default function WPBAChecklistPage() {
  return (
    <div className="space-y-8 max-w-4xl">
      <div>
        <h1 className="text-3xl font-bold">WPBA Checklist</h1>
        <p className="text-foreground/70 mt-2 text-lg">
          Complete guide to Workplace-Based Assessments - CBD, Mini-CEX, COT, PSQ, and more.
        </p>
      </div>

      {/* Overview */}
      <Card className="border-2 border-blue-200">
        <CardHeader className="bg-gradient-to-r from-blue-500 to-blue-600 text-white rounded-t-lg">
          <CardTitle>📋 WPBA Overview</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <p className="text-foreground/80 mb-4">
            Workplace-Based Assessments (WPBAs) are formative assessments that help you develop clinical skills and build evidence for your portfolio.
            They should be spread throughout the year, not crammed at the end.
          </p>
          <div className="p-4 bg-blue-50 rounded-lg border border-blue-200">
            <strong className="text-blue-700">💡 Key Principle:</strong>{' '}
            <span className="text-foreground/70">WPBAs are for learning, not just ticking boxes. Use them to get quality feedback and improve.</span>
          </div>
        </CardContent>
      </Card>

      {/* CBD */}
      <Card className="border-2 border-purple-200">
        <CardHeader className="bg-gradient-to-r from-purple-500 to-purple-600 text-white rounded-t-lg">
          <CardTitle className="flex items-center gap-2">
            💬 Case-based Discussion (CBD)
          </CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="grid md:grid-cols-2 gap-4 mb-4">
            <div>
              <h4 className="font-semibold text-foreground mb-2">What it is</h4>
              <p className="text-sm text-foreground/70">A structured discussion about a case you&apos;ve managed, focusing on your clinical reasoning and decision-making.</p>
            </div>
            <div>
              <h4 className="font-semibold text-foreground mb-2">Duration</h4>
              <p className="text-sm text-foreground/70">20-30 minutes including feedback</p>
            </div>
          </div>

          <h4 className="font-semibold text-foreground mb-3">CBD Checklist</h4>
          <div className="space-y-2">
            {[
              'Choose a case where you made decisions (not just "interesting" cases)',
              'Bring the notes/records to discuss',
              'Be prepared to explain your reasoning',
              'Think about what you would do differently',
              'Consider guidelines/evidence that informed your approach',
              'Reflect on the patient&apos;s perspective',
            ].map((item, i) => (
              <div key={i} className="flex items-start gap-3 p-2 bg-purple-50 rounded">
                <input type="checkbox" className="mt-1" />
                <span className="text-sm text-foreground/70">{item}</span>
              </div>
            ))}
          </div>

          <div className="mt-4 p-3 bg-purple-50 rounded-lg border border-purple-200">
            <strong className="text-purple-700">Best for:</strong>{' '}
            <span className="text-foreground/70">Complex cases, diagnostic dilemmas, ethical issues, multimorbidity</span>
          </div>
        </CardContent>
      </Card>

      {/* Mini-CEX */}
      <Card className="border-2 border-green-200">
        <CardHeader className="bg-gradient-to-r from-green-500 to-green-600 text-white rounded-t-lg">
          <CardTitle className="flex items-center gap-2">
            👀 Mini-CEX (Clinical Evaluation Exercise)
          </CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="grid md:grid-cols-2 gap-4 mb-4">
            <div>
              <h4 className="font-semibold text-foreground mb-2">What it is</h4>
              <p className="text-sm text-foreground/70">Direct observation of a patient encounter by your assessor, followed by feedback.</p>
            </div>
            <div>
              <h4 className="font-semibold text-foreground mb-2">Duration</h4>
              <p className="text-sm text-foreground/70">15-20 minutes consultation + 5-10 minutes feedback</p>
            </div>
          </div>

          <h4 className="font-semibold text-foreground mb-3">Mini-CEX Checklist</h4>
          <div className="space-y-2">
            {[
              'Choose a variety of case types (don&apos;t always pick easy ones)',
              'Brief your assessor on what feedback you want',
              'Include patients of different ages and backgrounds',
              'Don&apos;t avoid challenging consultations',
              'Ask for specific, actionable feedback',
              'Use a mix of assessors',
            ].map((item, i) => (
              <div key={i} className="flex items-start gap-3 p-2 bg-green-50 rounded">
                <input type="checkbox" className="mt-1" />
                <span className="text-sm text-foreground/70">{item}</span>
              </div>
            ))}
          </div>

          <h4 className="font-semibold text-foreground mt-4 mb-2">Domains Assessed</h4>
          <div className="flex flex-wrap gap-2">
            {['History taking', 'Physical examination', 'Communication', 'Clinical judgement', 'Professionalism', 'Organisation'].map((domain, i) => (
              <Badge key={i} variant="secondary">{domain}</Badge>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* COT */}
      <Card className="border-2 border-amber-200">
        <CardHeader className="bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-t-lg">
          <CardTitle className="flex items-center gap-2">
            🎥 Consultation Observation Tool (COT)
          </CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="grid md:grid-cols-2 gap-4 mb-4">
            <div>
              <h4 className="font-semibold text-foreground mb-2">What it is</h4>
              <p className="text-sm text-foreground/70">Review of a video-recorded consultation, assessed against specific criteria.</p>
            </div>
            <div>
              <h4 className="font-semibold text-foreground mb-2">Requirement</h4>
              <p className="text-sm text-foreground/70">Minimum of recordings reviewed across your training</p>
            </div>
          </div>

          <h4 className="font-semibold text-foreground mb-3">COT Tips</h4>
          <div className="space-y-2">
            {[
              'Get patient consent before recording',
              'Choose a range of consultation types',
              'Watch your own recording first before the review',
              'Be ready to self-critique',
              'Focus on what you&apos;d do differently, not defensiveness',
              'Use it to identify specific learning needs',
            ].map((item, i) => (
              <div key={i} className="flex items-start gap-3 p-2 bg-amber-50 rounded">
                <input type="checkbox" className="mt-1" />
                <span className="text-sm text-foreground/70">{item}</span>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* PSQ */}
      <Card className="border-2 border-teal-200">
        <CardHeader className="bg-gradient-to-r from-teal-500 to-teal-600 text-white rounded-t-lg">
          <CardTitle className="flex items-center gap-2">
            📊 Patient Satisfaction Questionnaire (PSQ)
          </CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="grid md:grid-cols-2 gap-4 mb-4">
            <div>
              <h4 className="font-semibold text-foreground mb-2">What it is</h4>
              <p className="text-sm text-foreground/70">Feedback from patients about their consultations with you.</p>
            </div>
            <div>
              <h4 className="font-semibold text-foreground mb-2">Requirement</h4>
              <p className="text-sm text-foreground/70">Usually 40 questionnaires per PSQ cycle</p>
            </div>
          </div>

          <h4 className="font-semibold text-foreground mb-3">PSQ Checklist</h4>
          <div className="space-y-2">
            {[
              'Collect from a mix of consultation types',
              'Don&apos;t cherry-pick only satisfied patients',
              'Include telephone/video as well as face-to-face',
              'Reflect on free-text comments',
              'Identify patterns in feedback',
              'Create an action plan based on results',
            ].map((item, i) => (
              <div key={i} className="flex items-start gap-3 p-2 bg-teal-50 rounded">
                <input type="checkbox" className="mt-1" />
                <span className="text-sm text-foreground/70">{item}</span>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* MSF */}
      <Card className="border-2 border-pink-200">
        <CardHeader className="bg-gradient-to-r from-pink-500 to-pink-600 text-white rounded-t-lg">
          <CardTitle className="flex items-center gap-2">
            👥 Multi-Source Feedback (MSF)
          </CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="grid md:grid-cols-2 gap-4 mb-4">
            <div>
              <h4 className="font-semibold text-foreground mb-2">What it is</h4>
              <p className="text-sm text-foreground/70">360-degree feedback from colleagues you work with.</p>
            </div>
            <div>
              <h4 className="font-semibold text-foreground mb-2">Who to ask</h4>
              <p className="text-sm text-foreground/70">Doctors, nurses, admin staff, pharmacists, others</p>
            </div>
          </div>

          <h4 className="font-semibold text-foreground mb-3">MSF Tips</h4>
          <div className="space-y-2">
            {[
              'Choose a range of colleagues (not just friends)',
              'Include different professional groups',
              'Be open to constructive criticism',
              'Reflect on themes in the feedback',
              'Discuss results with your supervisor',
              'Create actions based on development areas',
            ].map((item, i) => (
              <div key={i} className="flex items-start gap-3 p-2 bg-pink-50 rounded">
                <input type="checkbox" className="mt-1" />
                <span className="text-sm text-foreground/70">{item}</span>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Annual Requirements */}
      <Card className="border-2 border-gray-200">
        <CardHeader>
          <CardTitle>📅 Annual WPBA Requirements</CardTitle>
        </CardHeader>
        <CardContent>
          <p className="text-sm text-foreground/70 mb-4">
            Requirements may vary by deanery - always check with your training programme. Typical minimums:
          </p>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b">
                  <th className="text-left p-3 font-semibold">Assessment</th>
                  <th className="text-left p-3 font-semibold">ST1</th>
                  <th className="text-left p-3 font-semibold">ST2</th>
                  <th className="text-left p-3 font-semibold">ST3</th>
                </tr>
              </thead>
              <tbody className="text-foreground/70">
                <tr className="border-b">
                  <td className="p-3">CBD</td>
                  <td className="p-3">6</td>
                  <td className="p-3">6</td>
                  <td className="p-3">6</td>
                </tr>
                <tr className="border-b">
                  <td className="p-3">Mini-CEX</td>
                  <td className="p-3">6</td>
                  <td className="p-3">6</td>
                  <td className="p-3">6</td>
                </tr>
                <tr className="border-b">
                  <td className="p-3">COT</td>
                  <td className="p-3">-</td>
                  <td className="p-3">As required</td>
                  <td className="p-3">As required</td>
                </tr>
                <tr className="border-b">
                  <td className="p-3">PSQ</td>
                  <td className="p-3">1</td>
                  <td className="p-3">1</td>
                  <td className="p-3">1</td>
                </tr>
                <tr>
                  <td className="p-3">MSF</td>
                  <td className="p-3">1</td>
                  <td className="p-3">1</td>
                  <td className="p-3">1</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div className="mt-4 p-3 bg-amber-50 rounded-lg border border-amber-200">
            <strong className="text-amber-700">⚠️ Remember:</strong>{' '}
            <span className="text-foreground/70">These are minimums. Aim for regular assessments throughout the year, not a rush at ARCP time.</span>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
