import ResourcePageLayout, { ResourceSection, InfoBox, Chunk } from '@/components/ResourcePageLayout'
import { Badge } from '@/components/ui/badge'

export default function HiddenCurriculumPage() {
  return (
    <ResourcePageLayout
      title="Hidden Curriculum"
      description="Essential knowledge beyond the formal curriculum - GP setup, triage, finances, and career paths"
    >
      {/* GP Practice Types */}
      <ResourceSection title="Understanding GP Practice Structures" variant="primary">
        <div className="space-y-4">
          <div className="grid md:grid-cols-2 gap-4">
            <Chunk title="Partnership">
              Own shares in the practice, share profits and losses. More autonomy but also more responsibility and financial risk.
            </Chunk>
            <Chunk title="Salaried GP">
              Employed by the practice with fixed salary. Less financial risk, predictable income, but less say in practice decisions.
            </Chunk>
            <Chunk title="Locum GP">
              Temporary cover, paid per session. Maximum flexibility but no job security or employment benefits.
            </Chunk>
            <Chunk title="Portfolio Career">
              Mix of clinical and non-clinical work - teaching, research, management, special interests. Increasingly popular.
            </Chunk>
          </div>

          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Business Models</h4>
            <div className="grid md:grid-cols-3 gap-3">
              <Chunk title="GMS">
                General Medical Services - Standard NHS contract
              </Chunk>
              <Chunk title="PMS">
                Personal Medical Services - Locally negotiated
              </Chunk>
              <Chunk title="APMS">
                Alternative Provider Medical Services
              </Chunk>
            </div>
          </div>
        </div>
      </ResourceSection>

      {/* Triage */}
      <ResourceSection title="Triage and Urgency Assessment" variant="secondary">
        <div className="space-y-4">
          <InfoBox variant="tip">
            <strong className="text-teal-700 dark:text-teal-400">Key Principle:</strong>{' '}
            <span className="text-slate-700 dark:text-slate-300">Triage is about matching clinical need to appropriate response, not gatekeeping access.</span>
          </InfoBox>

          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Urgency Categories</h4>
            <div className="space-y-2">
              {[
                { level: 'Emergency', desc: '999 / Immediate - Life threatening', bgClass: 'bg-red-500' },
                { level: 'Urgent', desc: 'Same day - Could deteriorate without prompt attention', bgClass: 'bg-orange-500' },
                { level: 'Soon', desc: '24-48 hours - Needs attention but stable', bgClass: 'bg-amber-500' },
                { level: 'Routine', desc: 'Scheduled appointment - Non-urgent', bgClass: 'bg-green-500' },
              ].map((item, i) => (
                <div key={i} className="flex items-center gap-3 p-3 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
                  <Badge className={`${item.bgClass} text-white`}>{item.level}</Badge>
                  <span className="text-sm text-slate-700 dark:text-slate-300">{item.desc}</span>
                </div>
              ))}
            </div>
          </div>

          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Red Flags to Remember</h4>
            <div className="grid md:grid-cols-2 gap-2">
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
                <div key={i} className="flex items-center gap-2 p-2 bg-red-50 dark:bg-red-950/30 rounded border border-red-200 dark:border-red-800">
                  <span className="text-red-500">🚨</span>
                  <span className="text-sm text-slate-700 dark:text-slate-300">{flag}</span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </ResourceSection>

      {/* Finances */}
      <ResourceSection title="GP Finances & Tax" variant="secondary">
        <div className="space-y-4">
          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Income Streams</h4>
            <div className="space-y-2">
              {[
                { title: 'Global Sum', desc: 'Core funding based on practice list size and patient demographics' },
                { title: 'QOF', desc: 'Quality and Outcomes Framework payments for meeting targets' },
                { title: 'Enhanced Services', desc: 'Additional payments for specific services (e.g., minor surgery)' },
              ].map((item, i) => (
                <Chunk key={i} title={item.title}>
                  {item.desc}
                </Chunk>
              ))}
            </div>
          </div>

          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Tax Deductions for GPs</h4>
            <p className="text-sm text-slate-600 dark:text-slate-400 mb-3">As a GP, you may be able to claim tax relief on:</p>
            <div className="grid md:grid-cols-2 gap-2">
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
                <div key={i} className="flex items-center gap-2 p-2 bg-slate-50 dark:bg-slate-800 rounded border border-slate-200 dark:border-slate-700">
                  <span className="text-teal-600 dark:text-teal-400">✓</span>
                  <span className="text-sm text-slate-700 dark:text-slate-300">{item}</span>
                </div>
              ))}
            </div>
          </div>

          <InfoBox variant="tip">
            <strong className="text-teal-700 dark:text-teal-400">Tip:</strong>{' '}
            <span className="text-slate-700 dark:text-slate-300">Keep receipts for everything work-related. Consider getting an accountant who specializes in medical professionals.</span>
          </InfoBox>
        </div>
      </ResourceSection>

      {/* Career Paths */}
      <ResourceSection title="Career Paths & Extended Roles" variant="secondary">
        <div className="space-y-4">
          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Extended Roles</h4>
            <div className="grid md:grid-cols-2 gap-3">
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
                <Chunk key={i} title={item.role}>
                  {item.desc}
                </Chunk>
              ))}
            </div>
          </div>

          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">GPwSI/GPwER Areas</h4>
            <p className="text-sm text-slate-600 dark:text-slate-400 mb-3">GP with Special Interest / Extended Role opportunities:</p>
            <div className="flex flex-wrap gap-2">
              {[
                'Dermatology', 'MSK', 'Cardiology', 'Respiratory', 'Mental Health',
                'Women\'s Health', 'Minor Surgery', 'ENT', 'Elderly Care', 'Palliative Care',
              ].map((area, i) => (
                <Badge key={i} variant="secondary" className="bg-slate-200 dark:bg-slate-700 text-slate-700 dark:text-slate-300">{area}</Badge>
              ))}
            </div>
          </div>
        </div>
      </ResourceSection>

      {/* QI and Audit */}
      <ResourceSection title="Quality Improvement & Audit" variant="secondary">
        <div className="space-y-4">
          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">The Audit Cycle</h4>
            <div className="flex flex-wrap justify-center gap-2 mb-4">
              {['Identify topic', 'Set standards', 'Collect data', 'Compare to standards', 'Implement change', 'Re-audit'].map((step, i) => (
                <div key={i} className="flex items-center">
                  <span className="px-3 py-2 bg-teal-100 dark:bg-teal-900 rounded-full text-sm text-teal-800 dark:text-teal-200">{step}</span>
                  {i < 5 && <span className="mx-2 text-teal-400">→</span>}
                </div>
              ))}
            </div>
          </div>

          <div>
            <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">QI Methodologies</h4>
            <div className="grid md:grid-cols-2 gap-3">
              {[
                { title: 'PDSA Cycles', desc: 'Plan-Do-Study-Act - rapid small-scale tests of change' },
                { title: 'SEA', desc: 'Significant Event Analysis - learning from incidents' },
                { title: 'Root Cause Analysis', desc: 'Deep investigation of why things went wrong' },
                { title: 'Process Mapping', desc: 'Visualizing workflows to identify improvements' },
              ].map((item, i) => (
                <Chunk key={i} title={item.title}>
                  {item.desc}
                </Chunk>
              ))}
            </div>
          </div>
        </div>
      </ResourceSection>

      {/* Reports and Letters */}
      <ResourceSection title="Reports and Administrative Tasks" variant="secondary">
        <div>
          <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-3">Common GP Reports</h4>
          <div className="space-y-2">
            {[
              { type: 'Fit Notes', desc: 'Formerly sick notes - Med3 forms for patients' },
              { type: 'DVLA Reports', desc: 'Medical fitness to drive assessments' },
              { type: 'Insurance Reports', desc: 'Private medical reports for insurers' },
              { type: 'Referral Letters', desc: '2WW, routine, urgent referrals' },
              { type: 'Private Letters', desc: 'Travel vaccinations, private prescriptions' },
              { type: 'Safeguarding Reports', desc: 'Child protection, vulnerable adult concerns' },
            ].map((item, i) => (
              <div key={i} className="flex items-start gap-3 p-3 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
                <span className="text-teal-600 dark:text-teal-400 font-bold">•</span>
                <div>
                  <strong className="text-slate-900 dark:text-slate-100">{item.type}</strong>
                  <span className="text-sm text-slate-600 dark:text-slate-400 ml-2">- {item.desc}</span>
                </div>
              </div>
            ))}
          </div>
        </div>
      </ResourceSection>
    </ResourcePageLayout>
  )
}
