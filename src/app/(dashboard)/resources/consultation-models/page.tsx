import ResourcePageLayout, { ResourceSection, InfoBox, Chunk } from '@/components/ResourcePageLayout'
import { Badge } from '@/components/ui/badge'

const ModelStep = ({ number, title, description, example }: {
  number: number
  title: string
  description: string
  example: string
}) => (
  <div className="flex gap-4 mb-4">
    <div className="flex-shrink-0 w-10 h-10 rounded-full bg-teal-600 dark:bg-teal-700 text-white flex items-center justify-center font-bold">
      {number}
    </div>
    <div className="flex-1">
      <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-1">{title}</h4>
      <p className="text-slate-600 dark:text-slate-400 text-sm mb-2">{description}</p>
      <div className="p-3 bg-slate-50 dark:bg-slate-800 rounded-lg text-sm italic text-slate-600 dark:text-slate-400 border border-slate-200 dark:border-slate-700">
        <strong>Example:</strong> {example}
      </div>
    </div>
  </div>
)

export default function ConsultationModelsPage() {
  return (
    <ResourcePageLayout
      title="Consultation Models"
      description="Structured frameworks for effective, patient-centred consultations. Learn when and how to use each model."
    >
      {/* Calgary-Cambridge */}
      <ResourceSection title="Calgary-Cambridge Model" description="The most widely used consultation model in UK general practice" variant="primary">
        <div className="space-y-4">
          <InfoBox variant="info">
            <strong className="text-teal-700 dark:text-teal-400">When to use:</strong>{' '}
            <span className="text-slate-700 dark:text-slate-300">Most consultations, especially complex cases requiring comprehensive assessment</span>
          </InfoBox>
          
          <div className="space-y-3">
            <ModelStep 
              number={1}
              title="Initiating the session"
              description="Establish rapport, identify reason for attendance"
              example={`"Hello, I'm Dr. Smith. What brings you in today?" - Open question, maintain eye contact, show interest.`}
            />
            <ModelStep 
              number={2}
              title="Gathering information"
              description="Explore patient's perspective, biomedical perspective, background information"
              example={`"How has this been affecting you?" (patient perspective) → "When did the pain start?" (biomedical) → "Any family history?" (background)`}
            />
            <ModelStep 
              number={3}
              title="Physical examination"
              description="If required, explain and gain consent"
              example={`"I'd like to examine your chest to listen to your breathing. Is that okay? I'll need you to remove your top."`}
            />
            <ModelStep 
              number={4}
              title="Explanation and planning"
              description="Share information, reach shared understanding, involve patient in decisions"
              example={`"Based on what you've told me, this sounds like asthma. We have a few options: inhaler, lifestyle changes, or both. What do you think would work best for you?"`}
            />
            <ModelStep 
              number={5}
              title="Closing the session"
              description="Summarize, safety net, arrange follow-up"
              example={`"So we've agreed on the inhaler. If your breathing gets worse or you're not better in a week, come back. I'll see you in 2 weeks to check how you're getting on."`}
            />
          </div>
        </div>
      </ResourceSection>

      {/* Pendleton's 7 Tasks */}
      <ResourceSection title="Pendleton's 7 Tasks" description="A task-based approach to consultations" variant="secondary">
        <div className="space-y-4">
          <InfoBox variant="info">
            <strong className="text-teal-700 dark:text-teal-400">When to use:</strong>{' '}
            <span className="text-slate-700 dark:text-slate-300">Teaching, structured assessments, complex cases requiring systematic approach</span>
          </InfoBox>
          
          <div className="space-y-3">
            {[
              { task: "Define the reason for attendance", example: `"So you've come in about the chest pain you've been having?"` },
              { task: "Consider other problems", example: `"Is there anything else you'd like to discuss today?"` },
              { task: "Choose an appropriate action", example: `"Given your symptoms, I think we should do an ECG and some blood tests."` },
              { task: "Achieve a shared understanding", example: `"So we both agree this is likely anxiety-related chest pain?"` },
              { task: "Involve the patient in management", example: `"Would you prefer to try breathing exercises first, or would you like to consider medication?"` },
              { task: "Use time and resources appropriately", example: `"I think we can manage this here without needing a referral at this stage."` },
              { task: "Establish or maintain relationship", example: `"I'm here if you need to talk about this again. How are you feeling about everything we've discussed?"` },
            ].map((item, i) => (
              <Chunk key={i} title={`${i + 1}. ${item.task}`}>
                <p className="italic text-slate-600 dark:text-slate-400">{item.example}</p>
              </Chunk>
            ))}
          </div>
        </div>
      </ResourceSection>

      {/* Neighbour's Inner Consultation */}
      <ResourceSection title="Neighbour's Inner Consultation" description="Five checkpoints for effective consultations" variant="secondary">
        <div className="space-y-4">
          <InfoBox variant="info">
            <strong className="text-teal-700 dark:text-teal-400">When to use:</strong>{' '}
            <span className="text-slate-700 dark:text-slate-300">Quick consultations, time-pressured situations, when you need a simple framework</span>
          </InfoBox>
          
          <div className="space-y-3">
            <ModelStep 
              number={1}
              title="Connecting"
              description="Establish rapport and understand the patient's agenda"
              example={`"Hi, how can I help you today?" - Simple, open, welcoming.`}
            />
            <ModelStep 
              number={2}
              title="Summarizing"
              description="Check understanding before moving forward"
              example={`"So you've had this cough for 3 weeks, it's worse at night, and you're worried it might be something serious?"`}
            />
            <ModelStep 
              number={3}
              title="Handing over"
              description="Share decision-making and management"
              example={`"I think this is likely a post-viral cough. We could try a simple cough medicine, or wait another week. What would you prefer?"`}
            />
            <ModelStep 
              number={4}
              title="Safety netting"
              description="What to do if things don't improve"
              example={`"If it's not better in a week, or if you develop a fever or breathlessness, come back or call 111."`}
            />
            <ModelStep 
              number={5}
              title="Housekeeping"
              description="Manage your own feelings and maintain boundaries"
              example={`Reflect after consultation: "Did I handle that well? Am I feeling frustrated? Do I need to debrief with someone?"`}
            />
          </div>
        </div>
      </ResourceSection>

      {/* ICE Framework */}
      <ResourceSection title="ICE Framework" description="Ideas, Concerns, and Expectations" variant="secondary">
        <div className="space-y-4">
          <InfoBox variant="info">
            <strong className="text-teal-700 dark:text-teal-400">When to use:</strong>{' '}
            <span className="text-slate-700 dark:text-slate-300">Every consultation - understanding the patient's perspective is fundamental</span>
          </InfoBox>
          
          <div className="space-y-3">
            <Chunk title="💭 Ideas">
              <p className="mb-2">What does the patient think is wrong?</p>
              <p className="italic text-slate-600 dark:text-slate-400">"What do you think might be causing this?"</p>
            </Chunk>
            <Chunk title="😟 Concerns">
              <p className="mb-2">What is the patient worried about?</p>
              <p className="italic text-slate-600 dark:text-slate-400">"Is there anything particular you're worried about?"</p>
            </Chunk>
            <Chunk title="🎯 Expectations">
              <p className="mb-2">What does the patient hope to get from the consultation?</p>
              <p className="italic text-slate-600 dark:text-slate-400">"What were you hoping we might do today?"</p>
            </Chunk>
          </div>
          
          <InfoBox variant="tip">
            <strong className="text-teal-700 dark:text-teal-400">Pro Tip:</strong>{' '}
            <span className="text-slate-700 dark:text-slate-300">ICE isn't a checklist to tick off - weave these questions naturally throughout the consultation.</span>
          </InfoBox>
        </div>
      </ResourceSection>

      {/* Quick Reference */}
      <ResourceSection title="Quick Reference: Which Model When?" variant="secondary">
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-slate-300 dark:border-slate-700">
                <th className="text-left p-3 font-semibold text-slate-900 dark:text-slate-100">Situation</th>
                <th className="text-left p-3 font-semibold text-slate-900 dark:text-slate-100">Recommended Model</th>
              </tr>
            </thead>
            <tbody className="text-slate-700 dark:text-slate-300">
              {[
                { situation: 'Complex new problem', model: 'Calgary-Cambridge' },
                { situation: 'Teaching/being observed', model: 'Pendleton\'s Tasks' },
                { situation: 'Quick consultation', model: 'Neighbour\'s Checkpoints' },
                { situation: 'Chronic disease review', model: 'Stott & Davis' },
                { situation: 'Any consultation', model: 'ICE (always!)' },
                { situation: 'Reflecting on your style', model: 'Byrne & Long' },
              ].map((row, i) => (
                <tr key={i} className="border-b border-slate-200 dark:border-slate-700">
                  <td className="p-3">{row.situation}</td>
                  <td className="p-3 font-medium text-teal-700 dark:text-teal-400">{row.model}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </ResourceSection>
    </ResourcePageLayout>
  )
}
