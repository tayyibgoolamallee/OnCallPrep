import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

export default function ReflectionGuidePage() {
  return (
    <div className="space-y-8 max-w-4xl">
      <div>
        <h1 className="text-3xl font-bold">Reflection Guide</h1>
        <p className="text-foreground/70 mt-2 text-lg">
          How to write effective reflections for your portfolio using established frameworks.
        </p>
      </div>

      {/* Why Reflection Matters */}
      <Card className="border-2 border-blue-200">
        <CardHeader className="bg-gradient-to-r from-blue-500 to-blue-600 text-white rounded-t-lg">
          <CardTitle>Why Reflection Matters</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <p className="text-foreground/80 mb-4">
            Reflective practice is at the heart of GP training. Good reflections demonstrate:
          </p>
          <div className="grid md:grid-cols-2 gap-4">
            {[
              { icon: '🎯', text: 'Self-awareness and insight' },
              { icon: '📈', text: 'Professional development over time' },
              { icon: '🔄', text: 'Ability to learn from experience' },
              { icon: '✅', text: 'Competence across curriculum areas' },
            ].map((item, i) => (
              <div key={i} className="flex items-center gap-3 p-3 bg-blue-50 rounded-lg">
                <span className="text-2xl">{item.icon}</span>
                <span className="text-foreground/80">{item.text}</span>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Gibbs Reflective Cycle */}
      <Card className="border-2 border-purple-200">
        <CardHeader className="bg-gradient-to-r from-purple-500 to-purple-600 text-white rounded-t-lg">
          <CardTitle className="flex items-center gap-2">
            🔄 Gibbs&apos; Reflective Cycle
          </CardTitle>
          <p className="text-purple-100">The most widely used reflection framework</p>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="space-y-4">
            {[
              { stage: 'Description', question: 'What happened?', tip: 'Keep it brief and factual. Set the scene without analysis.' },
              { stage: 'Feelings', question: 'What were you thinking and feeling?', tip: 'Be honest. Include uncertainty, anxiety, confidence.' },
              { stage: 'Evaluation', question: 'What was good and bad about the experience?', tip: 'Consider multiple perspectives - yours, the patient\'s, colleagues\'.' },
              { stage: 'Analysis', question: 'What sense can you make of the situation?', tip: 'Link to evidence, guidelines, theory. This is the crucial step.' },
              { stage: 'Conclusion', question: 'What else could you have done?', tip: 'Be specific about alternatives you could have tried.' },
              { stage: 'Action Plan', question: 'What will you do differently next time?', tip: 'Make it concrete and achievable. What learning needs arise?' },
            ].map((item, i) => (
              <div key={i} className="p-4 bg-purple-50 rounded-lg border border-purple-200">
                <div className="flex items-start gap-3">
                  <span className="w-8 h-8 bg-purple-500 text-white rounded-full flex items-center justify-center font-bold flex-shrink-0">
                    {i + 1}
                  </span>
                  <div>
                    <h4 className="font-semibold text-purple-700">{item.stage}</h4>
                    <p className="text-foreground/80 italic">&ldquo;{item.question}&rdquo;</p>
                    <p className="text-sm text-foreground/60 mt-1">💡 {item.tip}</p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Rolfe's Framework */}
      <Card className="border-2 border-green-200">
        <CardHeader className="bg-gradient-to-r from-green-500 to-green-600 text-white rounded-t-lg">
          <CardTitle className="flex items-center gap-2">
            ❓ Rolfe&apos;s What? So What? Now What?
          </CardTitle>
          <p className="text-green-100">A simpler, three-stage approach</p>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="grid md:grid-cols-3 gap-4">
            <div className="p-4 bg-green-50 rounded-lg border border-green-200 text-center">
              <h4 className="font-bold text-green-700 text-xl mb-2">What?</h4>
              <p className="text-foreground/70 text-sm">Describe the situation</p>
              <ul className="text-left text-sm mt-3 space-y-1 text-foreground/60">
                <li>• What happened?</li>
                <li>• What did I do?</li>
                <li>• What did others do?</li>
              </ul>
            </div>
            <div className="p-4 bg-green-50 rounded-lg border border-green-200 text-center">
              <h4 className="font-bold text-green-700 text-xl mb-2">So What?</h4>
              <p className="text-foreground/70 text-sm">Analyse the meaning</p>
              <ul className="text-left text-sm mt-3 space-y-1 text-foreground/60">
                <li>• Why does it matter?</li>
                <li>• What have I learned?</li>
                <li>• What does it mean?</li>
              </ul>
            </div>
            <div className="p-4 bg-green-50 rounded-lg border border-green-200 text-center">
              <h4 className="font-bold text-green-700 text-xl mb-2">Now What?</h4>
              <p className="text-foreground/70 text-sm">Plan for the future</p>
              <ul className="text-left text-sm mt-3 space-y-1 text-foreground/60">
                <li>• What will I do differently?</li>
                <li>• What do I need to learn?</li>
                <li>• How will I apply this?</li>
              </ul>
            </div>
          </div>
          <div className="mt-4 p-4 bg-green-50 rounded-lg border border-green-200">
            <strong className="text-green-700">Best for:</strong>{' '}
            <span className="text-foreground/70">Quick reflections, learning log entries, when you need a simple structure.</span>
          </div>
        </CardContent>
      </Card>

      {/* Common Pitfalls */}
      <Card className="border-2 border-red-200">
        <CardHeader className="bg-gradient-to-r from-red-500 to-red-600 text-white rounded-t-lg">
          <CardTitle>❌ Common Pitfalls to Avoid</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="space-y-3">
            {[
              { pitfall: 'Too descriptive', fix: 'Spend less time on "what happened" and more on analysis and learning.' },
              { pitfall: 'Too brief', fix: 'Explore the learning in depth. One paragraph isn\'t enough for meaningful reflection.' },
              { pitfall: 'Missing the "so what"', fix: 'Always explain why this matters for your future practice.' },
              { pitfall: 'Forgetting patient perspective', fix: 'Consider how the patient experienced the encounter.' },
              { pitfall: 'No evidence base', fix: 'Link your reflections to guidelines, research, or established frameworks.' },
              { pitfall: 'Vague action plans', fix: 'Be specific: "I will read NICE guidance on X" not "I will learn more".' },
            ].map((item, i) => (
              <div key={i} className="flex items-start gap-3 p-3 bg-red-50 rounded-lg">
                <span className="text-red-500 font-bold">✗</span>
                <div>
                  <strong className="text-red-700">{item.pitfall}</strong>
                  <p className="text-sm text-foreground/70">→ {item.fix}</p>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Good Reflection Structure */}
      <Card className="border-2 border-teal-200">
        <CardHeader className="bg-gradient-to-r from-teal-500 to-teal-600 text-white rounded-t-lg">
          <CardTitle>✅ Good Reflection Structure</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="space-y-4">
            <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
              <h4 className="font-semibold text-teal-700">Opening (1-2 sentences)</h4>
              <p className="text-foreground/70 text-sm">Set the scene briefly. What was the clinical context?</p>
              <p className="text-sm italic mt-2 text-foreground/60">
                &ldquo;During a busy clinic, I saw a patient who challenged my communication skills...&rdquo;
              </p>
            </div>
            <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
              <h4 className="font-semibold text-teal-700">What happened</h4>
              <p className="text-foreground/70 text-sm">Describe the key events. What did you observe, think, and do?</p>
            </div>
            <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
              <h4 className="font-semibold text-teal-700">Your feelings</h4>
              <p className="text-foreground/70 text-sm">Be honest about emotions - uncertainty, pride, frustration, confidence.</p>
            </div>
            <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
              <h4 className="font-semibold text-teal-700">Analysis (the crucial part!)</h4>
              <p className="text-foreground/70 text-sm">Ask yourself:</p>
              <ul className="text-sm mt-2 space-y-1 text-foreground/60">
                <li>• What does this tell me about my practice?</li>
                <li>• What assumptions did I make?</li>
                <li>• What would someone else have done differently?</li>
                <li>• What does the evidence/guidelines say?</li>
              </ul>
            </div>
            <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
              <h4 className="font-semibold text-teal-700">Learning and action</h4>
              <p className="text-foreground/70 text-sm">What specific learning will you take forward? What will you do differently?</p>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Linking to Curriculum */}
      <Card className="border-2 border-amber-200">
        <CardHeader className="bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-t-lg">
          <CardTitle>🔗 Linking to the Curriculum</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <p className="text-foreground/80 mb-4">
            Your reflections should demonstrate competence across the GP curriculum capabilities:
          </p>
          <div className="grid md:grid-cols-2 gap-3">
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
              <div key={i} className="p-2 bg-amber-50 rounded text-sm text-foreground/70 border border-amber-200">
                {cap}
              </div>
            ))}
          </div>
          <div className="mt-4 p-4 bg-amber-50 rounded-lg border border-amber-200">
            <strong className="text-amber-700">💡 Tip:</strong>{' '}
            <span className="text-foreground/70">Don&apos;t force curriculum links - choose the 2-3 most relevant capabilities for each reflection.</span>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
