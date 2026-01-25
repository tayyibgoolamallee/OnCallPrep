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
        <div className="space-y-6">
          <p className="text-sm text-slate-600 dark:text-slate-400">
            Requirements may vary by deanery - always check with your training programme. This table shows the official RCGP requirements:
          </p>
          
          {/* WPBA Table */}
          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">WPBA Assessments</h4>
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
                    { assessment: 'Mini-CEX/COTs (all 4 types)', st1: '4', st2: '4', st3: '7' },
                    { assessment: 'CBDs / CATs', st1: '4 CBD', st2: '4 CBD', st3: '5 CAT' },
                    { assessment: 'MSF', st1: '1 (min. 5 clinical, 5 non-clinical)', st2: '1', st3: '2 (1 MSF 5&5, 1 Leadership MSF)' },
                    { assessment: 'CSR PSQ', st1: '1 per post', st2: '1 per post', st3: '1 per post' },
                    { assessment: 'CEPS', st1: '0', st2: 'Ongoing: some appropriate to post', st3: 'For CCT: all intimate + range of others (including 7 system/other CEPS)' },
                    { assessment: 'Learning logs (CCRs)', st1: '36', st2: '36', st3: '36' },
                    { assessment: 'Placement planning', st1: '1 per post', st2: '1 per post (if in GP, if not done in ST1)', st3: '0 (unless not completed in ST1/2)' },
                    { assessment: 'Quality improvement activity', st1: 'Required each year', st2: 'Required each year', st3: 'Required each year' },
                    { assessment: 'Learning event analysis', st1: '1', st2: '1', st3: '1' },
                    { assessment: 'Prescribing', st1: '0', st2: '0', st3: '1' },
                    { assessment: 'Leadership activity', st1: '0', st2: '0', st3: '1' },
                    { assessment: 'ESR', st1: '1', st2: '1', st3: '1' },
                  ].map((row, i) => (
                    <tr key={i} className="border-b border-slate-200 dark:border-slate-700">
                      <td className="p-3 font-medium">{row.assessment}</td>
                      <td className="p-3">{row.st1}</td>
                      <td className="p-3">{row.st2}</td>
                      <td className="p-3">{row.st3}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>

          {/* Other Evidence Table */}
          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Other Evidence</h4>
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-300 dark:border-slate-700">
                    <th className="text-left p-3 font-semibold text-slate-900 dark:text-slate-100">Evidence Type</th>
                    <th className="text-left p-3 font-semibold text-slate-900 dark:text-slate-100">ST1</th>
                    <th className="text-left p-3 font-semibold text-slate-900 dark:text-slate-100">ST2</th>
                    <th className="text-left p-3 font-semibold text-slate-900 dark:text-slate-100">ST3</th>
                  </tr>
                </thead>
                <tbody className="text-slate-700 dark:text-slate-300">
                  {[
                    { evidence: 'Safeguarding adults level 3', st1: 'Certificate and reflective log entry', st2: 'Certificate, knowledge update every 12 months, and reflective log entry', st3: 'Certificate, knowledge update every 12 months, and reflective log entry' },
                    { evidence: 'Safeguarding children level 3', st1: 'Certificate, knowledge update every 12 months, and reflective log entry', st2: 'Certificate, knowledge update every 12 months, and reflective log entry', st3: 'Certificate, knowledge update every 12 months, and reflective log entry' },
                    { evidence: 'CPR & AED (Adults & Children)', st1: 'Certificate and reflective log entry', st2: 'Annual evidence of competence', st3: 'Annual evidence of competence' },
                    { evidence: 'Form R / SOAR (Scotland)', st1: '1 per ARCP', st2: '1 per ARCP', st3: '1 per ARCP' },
                    { evidence: 'PDP', st1: 'Min. 2 PDPs per year, progress demonstrated in at least one', st2: 'Min. 2 PDPs per year, progress demonstrated in at least one', st3: 'Min. 2 PDPs per year, progress demonstrated in at least one' },
                    { evidence: 'Any requirements of last ARCP', st1: 'Check (even if Outcome 1)', st2: 'Check (even if Outcome 1)', st3: 'Check (even if Outcome 1)' },
                  ].map((row, i) => (
                    <tr key={i} className="border-b border-slate-200 dark:border-slate-700">
                      <td className="p-3 font-medium">{row.evidence}</td>
                      <td className="p-3">{row.st1}</td>
                      <td className="p-3">{row.st2}</td>
                      <td className="p-3">{row.st3}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>

          {/* Important Notes */}
          <div className="space-y-3">
            <InfoBox variant="tip">
              <strong className="text-teal-700 dark:text-teal-400">COT Types:</strong>{' '}
              <span className="text-slate-700 dark:text-slate-300">COTs of all types to be completed over training time including audio, face-to-face/in-person, and virtual/remote. At least 1 Audio COT and 1 face-to-face/in-person COT should be completed.</span>
            </InfoBox>
            <InfoBox variant="tip">
              <strong className="text-teal-700 dark:text-teal-400">MSF Requirements:</strong>{' '}
              <span className="text-slate-700 dark:text-slate-300">In non-primary care posts where it's not possible to find 5 non-clinician respondents, it's acceptable to ask more clinicians, but the minimum of 10 total respondents still applies. In ST3, the MSF should be completed in the first 6 months, with the Leadership MSF in the second 6 months after the Leadership Activity.</span>
            </InfoBox>
            <InfoBox variant="tip">
              <strong className="text-teal-700 dark:text-teal-400">CEPS:</strong>{' '}
              <span className="text-slate-700 dark:text-slate-300">Throughout training, complete some CEPS relevant to post in each year. By end of ST3, evidence for all intimate examinations must be included, plus a range of additional CEPS. Being graded as "able to complete unsupervised" in all 7 "system" GP-focussed observed CEPS provides strong evidence of competency.</span>
            </InfoBox>
            <InfoBox variant="warning">
              <strong className="text-amber-700 dark:text-amber-400">Important:</strong>{' '}
              <span className="text-slate-700 dark:text-slate-300">Assessments should be spread throughout the training year with roughly half in each review period. LTFT registrars do the same total number pro-rata. CPR & AED and Safeguarding knowledge updates are required every 12 months (not pro-rata). ESR is required every 6 months (not pro-rata).</span>
            </InfoBox>
          </div>
        </div>
      </ResourceSection>
    </ResourcePageLayout>
  )
}
