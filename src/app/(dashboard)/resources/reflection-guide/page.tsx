import ResourcePageLayout, { ResourceSection, InfoBox, Chunk } from '@/components/ResourcePageLayout'
import { Badge } from '@/components/ui/badge'

export default function ReflectionGuidePage() {
  return (
    <ResourcePageLayout
      title="Reflection Guide"
      description="How to write effective reflections for your portfolio using established frameworks"
    >
      {/* Why Reflection Matters */}
      <ResourceSection title="Why Reflection Matters" variant="primary">
        <p className="text-slate-700 dark:text-slate-300 mb-4">
          Reflective practice is at the heart of GP training. Good reflections demonstrate:
        </p>
        <div className="grid md:grid-cols-2 gap-3">
          {[
            { icon: '🎯', text: 'Self-awareness and insight' },
            { icon: '📈', text: 'Professional development over time' },
            { icon: '🔄', text: 'Ability to learn from experience' },
            { icon: '✅', text: 'Competence across curriculum areas' },
          ].map((item, i) => (
            <Chunk key={i} title={item.icon}>
              {item.text}
            </Chunk>
          ))}
        </div>
      </ResourceSection>

      {/* Gibbs Reflective Cycle */}
      <ResourceSection title="Gibbs' Reflective Cycle" description="The most widely used reflection framework" variant="secondary">
        <div className="space-y-4">
          {[
            { stage: 'Description', question: 'What happened?', tip: 'Keep it brief and factual. Set the scene without analysis.' },
            { stage: 'Feelings', question: 'What were you thinking and feeling?', tip: 'Be honest. Include uncertainty, anxiety, confidence.' },
            { stage: 'Evaluation', question: 'What was good and bad about the experience?', tip: 'Consider multiple perspectives - yours, the patient\'s, colleagues\'.' },
            { stage: 'Analysis', question: 'What sense can you make of the situation?', tip: 'Link to evidence, guidelines, theory. This is the crucial step.' },
            { stage: 'Conclusion', question: 'What else could you have done?', tip: 'Be specific about alternatives you could have tried.' },
            { stage: 'Action Plan', question: 'What will you do differently next time?', tip: 'Make it concrete and achievable. What learning needs arise?' },
          ].map((item, i) => (
            <div key={i} className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <div className="flex items-start gap-3">
                <span className="w-10 h-10 bg-teal-600 dark:bg-teal-700 text-white rounded-full flex items-center justify-center font-bold flex-shrink-0">
                  {i + 1}
                </span>
                <div className="flex-1">
                  <h4 className="font-semibold text-teal-700 dark:text-teal-400 mb-1">{item.stage}</h4>
                  <p className="text-slate-700 dark:text-slate-300 italic mb-2">&ldquo;{item.question}&rdquo;</p>
                  <p className="text-sm text-slate-600 dark:text-slate-400">💡 {item.tip}</p>
                </div>
              </div>
            </div>
          ))}
        </div>
      </ResourceSection>

      {/* Rolfe's Framework */}
      <ResourceSection title="Rolfe's What? So What? Now What?" description="A simpler, three-stage approach" variant="secondary">
        <div className="grid md:grid-cols-3 gap-4">
          <Chunk title="What?">
            <p className="mb-2 font-medium">Describe the situation</p>
            <ul className="text-sm space-y-1 text-slate-600 dark:text-slate-400">
              <li>• What happened?</li>
              <li>• What did I do?</li>
              <li>• What did others do?</li>
            </ul>
          </Chunk>
          <Chunk title="So What?">
            <p className="mb-2 font-medium">Analyse the meaning</p>
            <ul className="text-sm space-y-1 text-slate-600 dark:text-slate-400">
              <li>• Why does it matter?</li>
              <li>• What have I learned?</li>
              <li>• What does it mean?</li>
            </ul>
          </Chunk>
          <Chunk title="Now What?">
            <p className="mb-2 font-medium">Plan for the future</p>
            <ul className="text-sm space-y-1 text-slate-600 dark:text-slate-400">
              <li>• What will I do differently?</li>
              <li>• What do I need to learn?</li>
              <li>• How will I apply this?</li>
            </ul>
          </Chunk>
        </div>
        <InfoBox variant="tip" className="mt-4">
          <strong className="text-teal-700 dark:text-teal-400">Best for:</strong>{' '}
          <span className="text-slate-700 dark:text-slate-300">Quick reflections, learning log entries, when you need a simple structure.</span>
        </InfoBox>
      </ResourceSection>

      {/* Common Pitfalls */}
      <ResourceSection title="Common Pitfalls to Avoid" variant="secondary">
        <div className="space-y-3">
          {[
            { pitfall: 'Too descriptive', fix: 'Spend less time on "what happened" and more on analysis and learning.' },
            { pitfall: 'Too brief', fix: 'Explore the learning in depth. One paragraph isn\'t enough for meaningful reflection.' },
            { pitfall: 'Missing the "so what"', fix: 'Always explain why this matters for your future practice.' },
            { pitfall: 'Forgetting patient perspective', fix: 'Consider how the patient experienced the encounter.' },
            { pitfall: 'No evidence base', fix: 'Link your reflections to guidelines, research, or established frameworks.' },
            { pitfall: 'Vague action plans', fix: 'Be specific: "I will read NICE guidance on X" not "I will learn more".' },
          ].map((item, i) => (
            <div key={i} className="flex items-start gap-3 p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <span className="text-red-500 font-bold text-xl">✗</span>
              <div>
                <strong className="text-slate-900 dark:text-slate-100">{item.pitfall}</strong>
                <p className="text-sm text-slate-600 dark:text-slate-400 mt-1">→ {item.fix}</p>
              </div>
            </div>
          ))}
        </div>
      </ResourceSection>

      {/* Good Reflection Structure */}
      <ResourceSection title="Good Reflection Structure" variant="secondary">
        <div className="space-y-3">
          {[
            { title: 'Opening (1-2 sentences)', desc: 'Set the scene briefly. What was the clinical context?', example: '"During a busy clinic, I saw a patient who challenged my communication skills..."' },
            { title: 'What happened', desc: 'Describe the key events. What did you observe, think, and do?' },
            { title: 'Your feelings', desc: 'Be honest about emotions - uncertainty, pride, frustration, confidence.' },
            { title: 'Analysis (the crucial part!)', desc: 'Ask yourself: What does this tell me about my practice? What assumptions did I make? What would someone else have done differently? What does the evidence/guidelines say?' },
            { title: 'Learning and action', desc: 'What specific learning will you take forward? What will you do differently?' },
          ].map((item, i) => (
            <Chunk key={i} title={item.title}>
              <p className="mb-1">{item.desc}</p>
              {item.example && (
                <p className="italic text-slate-600 dark:text-slate-400 mt-2">{item.example}</p>
              )}
            </Chunk>
          ))}
        </div>
      </ResourceSection>

      {/* Linking to Curriculum */}
      <ResourceSection title="Linking to the Curriculum" variant="secondary">
        <p className="text-slate-700 dark:text-slate-300 mb-4">
          Your reflections should demonstrate competence across the GP curriculum capabilities:
        </p>
        <div className="grid md:grid-cols-2 gap-2">
          {[
            'Fitness to practise',
            'Maintaining an ethical approach',
            'Communication and consultation skills',
            'Data gathering and interpretation',
            'Clinical examination and procedural skills',
            'Making decisions',
            'Clinical management',
            'Managing medical complexity',
            'Working with colleagues and in teams',
            'Maintaining performance, learning and teaching',
            'Organisation, management and leadership',
            'Practising holistically',
            'Community orientation',
          ].map((cap, i) => (
            <div key={i} className="p-2 bg-slate-50 dark:bg-slate-800 rounded text-sm text-slate-700 dark:text-slate-300 border border-slate-200 dark:border-slate-700">
              {cap}
            </div>
          ))}
        </div>
        <InfoBox variant="tip" className="mt-4">
          <strong className="text-teal-700 dark:text-teal-400">Tip:</strong>{' '}
          <span className="text-slate-700 dark:text-slate-300">Don't force curriculum links - choose the 2-3 most relevant capabilities for each reflection.</span>
        </InfoBox>
      </ResourceSection>
    </ResourcePageLayout>
  )
}
