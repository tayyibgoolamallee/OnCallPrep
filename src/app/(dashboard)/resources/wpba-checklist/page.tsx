import ResourcePageLayout, { ResourceSection, InfoBox, Chunk } from '@/components/ResourcePageLayout'
import { Badge } from '@/components/ui/badge'

export default function WPBAChecklistPage() {
  return (
    <ResourcePageLayout
      title="WPBA Checklist"
      description="Complete guide to Workplace-Based Assessments - CBD, Mini-CEX, COT, PSQ, and more"
    >
      {/* Overview */}
      <ResourceSection title="WPBA Overview" variant="primary">
        <p className="text-slate-700 dark:text-slate-300 mb-4">
          Workplace-Based Assessments (WPBAs) are formative assessments that help you develop clinical skills and build evidence for your portfolio.
          They should be spread throughout the year, not crammed at the end.
        </p>
        <InfoBox variant="tip">
          <strong className="text-teal-700 dark:text-teal-400">Key Principle:</strong>{' '}
          <span className="text-slate-700 dark:text-slate-300">WPBAs are for learning, not just ticking boxes. Use them to get quality feedback and improve.</span>
        </InfoBox>
      </ResourceSection>

      {/* CBD */}
      <ResourceSection title="Case-based Discussion (CBD)" variant="secondary">
        <div className="space-y-4">
          <div className="grid md:grid-cols-2 gap-4">
            <Chunk title="What it is">
              A structured discussion about a case you've managed, focusing on your clinical reasoning and decision-making.
            </Chunk>
            <Chunk title="Duration">
              20-30 minutes including feedback
            </Chunk>
          </div>

          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">CBD Checklist</h4>
            <div className="space-y-2">
              {[
                'Choose a case where you made decisions (not just "interesting" cases)',
                'Bring the notes/records to discuss',
                'Be prepared to explain your reasoning',
                'Think about what you would do differently',
                'Consider guidelines/evidence that informed your approach',
                'Reflect on the patient\'s perspective',
              ].map((item, i) => (
                <div key={i} className="flex items-start gap-3 p-3 bg-slate-50 dark:bg-slate-800 rounded border border-slate-200 dark:border-slate-700">
                  <input type="checkbox" className="mt-1" />
                  <span className="text-sm text-slate-700 dark:text-slate-300">{item}</span>
                </div>
              ))}
            </div>
          </div>

          <InfoBox variant="info">
            <strong className="text-teal-700 dark:text-teal-400">Best for:</strong>{' '}
            <span className="text-slate-700 dark:text-slate-300">Complex cases, diagnostic dilemmas, ethical issues, multimorbidity</span>
          </InfoBox>
        </div>
      </ResourceSection>

      {/* Mini-CEX */}
      <ResourceSection title="Mini-CEX (Clinical Evaluation Exercise)" variant="secondary">
        <div className="space-y-4">
          <div className="grid md:grid-cols-2 gap-4">
            <Chunk title="What it is">
              Direct observation of a patient encounter by your assessor, followed by feedback.
            </Chunk>
            <Chunk title="Duration">
              15-20 minutes consultation + 5-10 minutes feedback
            </Chunk>
          </div>

          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Mini-CEX Checklist</h4>
            <div className="space-y-2">
              {[
                'Choose a variety of case types (don\'t always pick easy ones)',
                'Brief your assessor on what feedback you want',
                'Include patients of different ages and backgrounds',
                'Don\'t avoid challenging consultations',
                'Ask for specific, actionable feedback',
                'Use a mix of assessors',
              ].map((item, i) => (
                <div key={i} className="flex items-start gap-3 p-3 bg-slate-50 dark:bg-slate-800 rounded border border-slate-200 dark:border-slate-700">
                  <input type="checkbox" className="mt-1" />
                  <span className="text-sm text-slate-700 dark:text-slate-300">{item}</span>
                </div>
              ))}
            </div>
          </div>

          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Domains Assessed</h4>
            <div className="flex flex-wrap gap-2">
              {['History taking', 'Physical examination', 'Communication', 'Clinical judgement', 'Professionalism', 'Organisation'].map((domain, i) => (
                <Badge key={i} variant="secondary" className="bg-slate-200 dark:bg-slate-700 text-slate-700 dark:text-slate-300">{domain}</Badge>
              ))}
            </div>
          </div>
        </div>
      </ResourceSection>

      {/* COT */}
      <ResourceSection title="Consultation Observation Tool (COT)" variant="secondary">
        <div className="space-y-4">
          <div className="grid md:grid-cols-2 gap-4">
            <Chunk title="What it is">
              Review of a video-recorded consultation, assessed against specific criteria.
            </Chunk>
            <Chunk title="Requirement">
              Minimum of recordings reviewed across your training
            </Chunk>
          </div>

          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">COT Tips</h4>
            <div className="space-y-2">
              {[
                'Get patient consent before recording',
                'Choose a range of consultation types',
                'Watch your own recording first before the review',
                'Be ready to self-critique',
                'Focus on what you\'d do differently, not defensiveness',
                'Use it to identify specific learning needs',
              ].map((item, i) => (
                <div key={i} className="flex items-start gap-3 p-3 bg-slate-50 dark:bg-slate-800 rounded border border-slate-200 dark:border-slate-700">
                  <input type="checkbox" className="mt-1" />
                  <span className="text-sm text-slate-700 dark:text-slate-300">{item}</span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </ResourceSection>

      {/* PSQ */}
      <ResourceSection title="Patient Satisfaction Questionnaire (PSQ)" variant="secondary">
        <div className="space-y-4">
          <div className="grid md:grid-cols-2 gap-4">
            <Chunk title="What it is">
              Feedback from patients about their consultations with you.
            </Chunk>
            <Chunk title="Requirement">
              Usually 40 questionnaires per PSQ cycle
            </Chunk>
          </div>

          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">PSQ Checklist</h4>
            <div className="space-y-2">
              {[
                'Collect from a mix of consultation types',
                'Don\'t cherry-pick only satisfied patients',
                'Include telephone/video as well as face-to-face',
                'Reflect on free-text comments',
                'Identify patterns in feedback',
                'Create an action plan based on results',
              ].map((item, i) => (
                <div key={i} className="flex items-start gap-3 p-3 bg-slate-50 dark:bg-slate-800 rounded border border-slate-200 dark:border-slate-700">
                  <input type="checkbox" className="mt-1" />
                  <span className="text-sm text-slate-700 dark:text-slate-300">{item}</span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </ResourceSection>

      {/* MSF */}
      <ResourceSection title="Multi-Source Feedback (MSF)" variant="secondary">
        <div className="space-y-4">
          <div className="grid md:grid-cols-2 gap-4">
            <Chunk title="What it is">
              360-degree feedback from colleagues you work with.
            </Chunk>
            <Chunk title="Who to ask">
              Doctors, nurses, admin staff, pharmacists, others
            </Chunk>
          </div>

          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">MSF Tips</h4>
            <div className="space-y-2">
              {[
                'Choose a range of colleagues (not just friends)',
                'Include different professional groups',
                'Be open to constructive criticism',
                'Reflect on themes in the feedback',
                'Discuss results with your supervisor',
                'Create actions based on development areas',
              ].map((item, i) => (
                <div key={i} className="flex items-start gap-3 p-3 bg-slate-50 dark:bg-slate-800 rounded border border-slate-200 dark:border-slate-700">
                  <input type="checkbox" className="mt-1" />
                  <span className="text-sm text-slate-700 dark:text-slate-300">{item}</span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </ResourceSection>

      {/* Annual Requirements */}
      <ResourceSection title="Annual WPBA Requirements" variant="secondary">
        <div className="space-y-4">
          <p className="text-sm text-slate-600 dark:text-slate-400">
            Requirements may vary by deanery - always check with your training programme. Typical minimums:
          </p>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-slate-300 dark:border-slate-700">
                  <th className="text-left p-3 font-semibold text-slate-900 dark:text-slate-100">Assessment</th>
                  <th className="text-left p-3 font-semibold text-slate-900 dark:text-slate-100">ST1</th>
                  <th className="text-left p-3 font-semibold text-slate-900 dark:text-slate-100">ST2</th>
                  <th className="text-left p-3 font-semibold text-slate-900 dark:text-slate-100">ST3</th>
                </tr>
              </thead>
              <tbody className="text-slate-700 dark:text-slate-300">
                {[
                  { assessment: 'CBD', st1: '6', st2: '6', st3: '6' },
                  { assessment: 'Mini-CEX', st1: '6', st2: '6', st3: '6' },
                  { assessment: 'COT', st1: '-', st2: 'As required', st3: 'As required' },
                  { assessment: 'PSQ', st1: '1', st2: '1', st3: '1' },
                  { assessment: 'MSF', st1: '1', st2: '1', st3: '1' },
                ].map((row, i) => (
                  <tr key={i} className="border-b border-slate-200 dark:border-slate-700">
                    <td className="p-3">{row.assessment}</td>
                    <td className="p-3">{row.st1}</td>
                    <td className="p-3">{row.st2}</td>
                    <td className="p-3">{row.st3}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          <InfoBox variant="warning">
            <strong className="text-amber-700 dark:text-amber-400">Remember:</strong>{' '}
            <span className="text-slate-700 dark:text-slate-300">These are minimums. Aim for regular assessments throughout the year, not a rush at ARCP time.</span>
          </InfoBox>
        </div>
      </ResourceSection>
    </ResourcePageLayout>
  )
}
