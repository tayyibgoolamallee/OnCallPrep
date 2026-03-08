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

      {/* Choosing a structure */}
      <ResourceSection
        title="Choosing a simple structure"
        description="You don't need a complex framework – use something that helps you tell the story and show learning."
        variant="secondary"
      >
        <div className="space-y-3 text-sm text-slate-700 dark:text-slate-300">
          <p>
            Most trainees do well with a <strong>simple framework</strong> such as{' '}
            <strong>Rolfe&apos;s What? So What? Now What?</strong> plus a short checklist like the{' '}
            <strong>three‑link rule</strong> (linking to ~3 curriculum capabilities).
          </p>
          <p>
            You do <strong>not</strong> have to use Gibbs&apos; reflective cycle. Pick one structure that feels natural,
            and use it consistently so your reflections are clear and easy to write.
          </p>
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

      {/* Common Pitfalls vs Better Alternatives */}
      <ResourceSection title="Common Pitfalls vs Better Alternatives" variant="secondary">
        <div className="space-y-3 text-sm">
          {[
            {
              pitfall: 'Too descriptive',
              better: 'Keep the description brief; spend more words on analysis, learning, and what you will do differently.',
            },
            {
              pitfall: 'Too brief',
              better: 'Write enough to show your thinking – usually several short paragraphs, not just a couple of sentences.',
            },
            {
              pitfall: 'Missing the \"so what\"',
              better: 'Explicitly answer: Why does this matter for my future practice? What have I learned?',
            },
            {
              pitfall: 'Forgetting patient perspective',
              better: 'Add a line on how the patient (or their family) might have experienced the encounter.',
            },
            {
              pitfall: 'No evidence base',
              better: 'Mention key guidelines, research, or teaching that supports your decisions or highlights gaps.',
            },
            {
              pitfall: 'Vague action plans',
              better: 'Make actions SMART: specific, realistic next steps with when/how you will do them.',
            },
          ].map((item, i) => (
            <div
              key={i}
              className="grid md:grid-cols-2 gap-3 p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700"
            >
              <div className="flex items-start gap-2">
                <span className="text-red-500 font-bold text-xl mt-0.5">✗</span>
                <div>
                  <p className="font-semibold text-slate-900 dark:text-slate-100">Pitfall</p>
                  <p className="mt-1 text-slate-700 dark:text-slate-300">{item.pitfall}</p>
                </div>
              </div>
              <div className="flex items-start gap-2">
                <span className="text-green-500 font-bold text-xl mt-0.5">✓</span>
                <div>
                  <p className="font-semibold text-slate-900 dark:text-slate-100">Try instead</p>
                  <p className="mt-1 text-slate-700 dark:text-slate-300">{item.better}</p>
                </div>
              </div>
            </div>
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

      {/* Reflection models – overview and links */}
      <ResourceSection
        title="Reflection models – overview and links"
        description="Different frameworks that can help you move from description to analysis and learning."
        variant="secondary"
      >
        <div className="grid md:grid-cols-2 gap-3 text-sm text-slate-700 dark:text-slate-300">
          <Chunk title="Gibbs' Reflective Cycle (6 stages)">
            <p className="mb-1">Description, Feelings, Evaluation, Analysis, Conclusion, Action plan – detailed look at a single experience.</p>
            <p className="text-xs mt-1">
              More:{' '}
              <a
                href="https://www.brookes.ac.uk/students/upgrade/study-skills/reflective-writing-gibbs"
                target="_blank"
                rel="noreferrer"
                className="underline"
              >
                Oxford Brookes guide
              </a>
            </p>
          </Chunk>
          <Chunk title="Kolb's Learning Cycle (4 stages)">
            <p className="mb-1">Concrete experience → Reflective observation → Abstract conceptualisation → Active experimentation.</p>
            <p className="text-xs mt-1">
              More:{' '}
              <a
                href="https://www.learning-theories.com/experiential-learning-kolb.html"
                target="_blank"
                rel="noreferrer"
                className="underline"
              >
                Learning-theories.com
              </a>
            </p>
          </Chunk>
          <Chunk title="Schön – reflection-in / on-action">
            <p className="mb-1">
              Distinguishes thinking <em>during</em> practice (in-action) and <em>after</em> practice (on-action) – helpful for complex consultations.
            </p>
            <p className="text-xs mt-1">
              More:{' '}
              <a
                href="https://infed.org/mobi/donald-schon-learning-reflection-change/"
                target="_blank"
                rel="noreferrer"
                className="underline"
              >
                Infed overview
              </a>
            </p>
          </Chunk>
          <Chunk title="Driscoll / Rolfe / Borton (What? So what? Now what?)">
            <p className="mb-1">Simple three-question frameworks for rapid reflections – ideal for learning log entries.</p>
            <p className="text-xs mt-1">
              More:{' '}
              <a
                href="https://libguides.hull.ac.uk/reflective-practice/models"
                target="_blank"
                rel="noreferrer"
                className="underline"
              >
                Hull reflective models
              </a>
            </p>
          </Chunk>
          <Chunk title="Johns' Model of Structured Reflection">
            <p className="mb-1">Encourages &quot;looking in&quot; (thoughts/feelings) and &quot;looking out&quot; (context and factors) before drawing learning.</p>
          </Chunk>
          <Chunk title="Atkins & Murphy">
            <p className="mb-1">Focuses on the trigger for reflection, analysis of feelings, and critical evaluation of assumptions.</p>
          </Chunk>
          <Chunk title="Brookfield’s Four Lenses">
            <p className="mb-1">Look at practice through autobiography, learners, colleagues, and theory to gain richer insight.</p>
          </Chunk>
          <Chunk title="CARL (Context, Action, Result, Learning)">
            <p className="mb-1">Useful for short, structured reflections or interview-style examples.</p>
          </Chunk>
        </div>
        <InfoBox variant="tip" className="mt-4">
          <strong className="text-teal-700 dark:text-teal-400">Tip:</strong>{' '}
          <span>Choose one or two models that suit you, and use them consistently rather than trying to use every framework.</span>
        </InfoBox>
      </ResourceSection>
    </ResourcePageLayout>
  )
}
