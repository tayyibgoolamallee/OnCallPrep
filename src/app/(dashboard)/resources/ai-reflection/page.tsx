import ResourcePageLayout, { ResourceSection, InfoBox, Chunk } from '@/components/ResourcePageLayout'

export default function AIReflectionPage() {
  return (
    <ResourcePageLayout
      title="AI Reflection Assistant"
      description="Guidance on using AI tools appropriately for portfolio reflections"
    >
      {/* Critical Warning */}
      <InfoBox variant="warning">
        <div className="flex items-start gap-4">
          <span className="text-3xl">⚠️</span>
          <div>
            <h3 className="font-bold text-amber-800 dark:text-amber-300 text-lg mb-2">Critical: Read This First</h3>
            <p className="text-amber-900 dark:text-amber-200 mb-2">
              <strong>This guidance is for drafting and structuring reflections only.</strong> Your reflections must be based on{' '}
              <strong>real patient encounters</strong> that you have personally experienced. The reflective learning must be{' '}
              <strong>your own</strong>.
            </p>
            <p className="text-amber-800 dark:text-amber-300 text-sm">
              AI should never be used to create artificial patient encounters or to generate reflections without genuine personal reflection.
              Educational Supervisors and ARCP panels may interrogate your reflections, and you must be able to discuss the underlying cases authentically.
            </p>
          </div>
        </div>
      </InfoBox>

      {/* RCGP Guidance */}
      <ResourceSection title="RCGP Guidance on AI" variant="primary">
        <p className="text-slate-700 dark:text-slate-300 mb-4">
          The RCGP has published guidance on AI in training and examinations. Key points:
        </p>
        <div className="space-y-3">
          <Chunk title="✅ Acceptable Uses">
            <ul className="space-y-1 text-slate-600 dark:text-slate-400">
              <li>• Using AI to help structure your thoughts</li>
              <li>• Improving grammar and clarity of writing</li>
              <li>• Generating ideas for what to include</li>
              <li>• Checking your reflection covers key elements</li>
            </ul>
          </Chunk>
          <Chunk title="❌ Unacceptable Uses">
            <ul className="space-y-1 text-slate-600 dark:text-slate-400">
              <li>• Generating fictional patient encounters</li>
              <li>• Having AI write reflections you haven't actually experienced</li>
              <li>• Submitting AI-generated content as your own work without review</li>
              <li>• Using AI in examinations (unless specifically permitted)</li>
            </ul>
          </Chunk>
        </div>
        <div className="mt-4 p-3 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
          <p className="text-sm text-slate-600 dark:text-slate-400">
            <strong>Reference:</strong>{' '}
            <a href="https://www.rcgp.org.uk/mrcgp-exams/artificial-intelligence-exams-training" 
               target="_blank" 
               rel="noopener noreferrer"
               className="text-teal-600 dark:text-teal-400 hover:underline">
              RCGP guidance on AI in training and examinations
            </a>
          </p>
        </div>
      </ResourceSection>

      {/* What AI Can Help With */}
      <ResourceSection title="What AI Reflection Tools Can Help With" variant="secondary">
        <div className="grid md:grid-cols-2 gap-4">
          {[
            { icon: '✍️', title: 'Structuring Your Thoughts', desc: 'Helps organize your reflection using established frameworks (Gibbs, Rolfe, Borton, etc.)' },
            { icon: '🔗', title: 'Linking Competencies', desc: 'Suggests relevant curriculum competency links based on your reflection content' },
            { icon: '📝', title: 'Improving Clarity', desc: 'Helps refine language and ensure your reflection demonstrates learning' },
            { icon: '✅', title: 'Quality Checks', desc: 'Reviews your reflection to ensure it meets RCGP requirements' },
          ].map((item, i) => (
            <Chunk key={i} title={`${item.icon} ${item.title}`}>
              {item.desc}
            </Chunk>
          ))}
        </div>
      </ResourceSection>

      {/* How to Use AI Appropriately */}
      <ResourceSection title="How to Use AI Appropriately" variant="secondary">
        <div className="space-y-4">
          {[
            {
              step: 1,
              title: 'Start with your own experience',
              desc: 'Write down the key points from your real patient encounter. What happened? How did you feel? What did you learn?'
            },
            {
              step: 2,
              title: 'Use AI to structure',
              desc: 'Ask AI to help organize your notes into a reflective framework (e.g., Gibbs cycle). Provide your own content for it to work with.'
            },
            {
              step: 3,
              title: 'Review and personalize',
              desc: 'Read through the AI-assisted draft carefully. Does it accurately represent your experience and learning? Edit to ensure authenticity.'
            },
            {
              step: 4,
              title: 'Add your genuine insights',
              desc: 'The analysis and learning must be yours. Add specific details only you would know from the encounter.'
            },
            {
              step: 5,
              title: 'Final check',
              desc: 'Could you discuss this reflection authentically with your supervisor? If not, revise until you can.'
            },
          ].map((item) => (
            <div key={item.step} className="flex items-start gap-4 p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <span className="w-10 h-10 bg-teal-600 dark:bg-teal-700 text-white rounded-full flex items-center justify-center font-bold flex-shrink-0">
                {item.step}
              </span>
              <div>
                <h4 className="font-semibold text-teal-700 dark:text-teal-400 mb-1">{item.title}</h4>
                <p className="text-sm text-slate-600 dark:text-slate-400">{item.desc}</p>
              </div>
            </div>
          ))}
        </div>
      </ResourceSection>

      {/* Example Prompts */}
      <ResourceSection title="Example Prompts for AI Tools" variant="secondary">
        <p className="text-slate-600 dark:text-slate-400 mb-4">
          Here are some appropriate ways to use AI assistance:
        </p>
        <div className="space-y-3">
          {[
            'Help me structure this reflection using Gibbs\' reflective cycle: [your notes]',
            'What GP curriculum competencies might this reflection link to? [your draft]',
            'Review this reflection and suggest where I could add more analysis: [your draft]',
            'Help me improve the clarity of this paragraph without changing the meaning: [text]',
          ].map((prompt, i) => (
            <div key={i} className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <p className="text-sm font-mono text-slate-700 dark:text-slate-300">
                &ldquo;{prompt}&rdquo;
              </p>
            </div>
          ))}
        </div>
      </ResourceSection>

      {/* Important Reminders */}
      <ResourceSection title="Key Reminders" variant="secondary">
        <div className="space-y-2">
          {[
            'Your reflections will be discussed at ARCP - you must be able to talk about them authentically',
            'Educational Supervisors can ask probing questions about any reflection',
            'The GMC expects honest documentation of your learning',
            'Using AI to fabricate experiences could be considered misconduct',
            'When in doubt, write it yourself',
          ].map((item, i) => (
            <div key={i} className="flex items-start gap-3 p-3 bg-slate-50 dark:bg-slate-800 rounded-lg">
              <span className="text-teal-600 dark:text-teal-400 font-bold">•</span>
              <span className="text-slate-700 dark:text-slate-300">{item}</span>
            </div>
          ))}
        </div>
      </ResourceSection>
    </ResourcePageLayout>
  )
}
