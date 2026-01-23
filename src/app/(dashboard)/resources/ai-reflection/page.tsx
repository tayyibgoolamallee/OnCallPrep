import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

export default function AIReflectionPage() {
  return (
    <div className="space-y-8 max-w-4xl">
      <div>
        <h1 className="text-3xl font-bold">AI Reflection Assistant</h1>
        <p className="text-foreground/70 mt-2 text-lg">
          Guidance on using AI tools appropriately for portfolio reflections.
        </p>
      </div>

      {/* Critical Warning */}
      <Card className="border-2 border-amber-400 bg-amber-50">
        <CardContent className="pt-6">
          <div className="flex items-start gap-4">
            <span className="text-3xl">⚠️</span>
            <div>
              <h3 className="font-bold text-amber-800 text-lg">Critical: Read This First</h3>
              <p className="text-amber-900 mt-2">
                <strong>This guidance is for drafting and structuring reflections only.</strong> Your reflections must be based on{' '}
                <strong>real patient encounters</strong> that you have personally experienced. The reflective learning must be{' '}
                <strong>your own</strong>.
              </p>
              <p className="text-amber-800 mt-2 text-sm">
                AI should never be used to create artificial patient encounters or to generate reflections without genuine personal reflection.
                Educational Supervisors and ARCP panels may interrogate your reflections, and you must be able to discuss the underlying cases authentically.
              </p>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* RCGP Guidance */}
      <Card className="border-2 border-blue-200">
        <CardHeader className="bg-gradient-to-r from-blue-500 to-blue-600 text-white rounded-t-lg">
          <CardTitle>📋 RCGP Guidance on AI</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <p className="text-foreground/80 mb-4">
            The RCGP has published guidance on AI in training and examinations. Key points:
          </p>
          <div className="space-y-3">
            <div className="p-4 bg-green-50 rounded-lg border border-green-200">
              <h4 className="font-semibold text-green-700 flex items-center gap-2">
                ✅ Acceptable Uses
              </h4>
              <ul className="mt-2 space-y-1 text-sm text-foreground/70">
                <li>• Using AI to help structure your thoughts</li>
                <li>• Improving grammar and clarity of writing</li>
                <li>• Generating ideas for what to include</li>
                <li>• Checking your reflection covers key elements</li>
              </ul>
            </div>
            <div className="p-4 bg-red-50 rounded-lg border border-red-200">
              <h4 className="font-semibold text-red-700 flex items-center gap-2">
                ❌ Unacceptable Uses
              </h4>
              <ul className="mt-2 space-y-1 text-sm text-foreground/70">
                <li>• Generating fictional patient encounters</li>
                <li>• Having AI write reflections you haven&apos;t actually experienced</li>
                <li>• Submitting AI-generated content as your own work without review</li>
                <li>• Using AI in examinations (unless specifically permitted)</li>
              </ul>
            </div>
          </div>
          <div className="mt-4 p-3 bg-blue-50 rounded-lg">
            <p className="text-sm text-foreground/70">
              <strong>Reference:</strong>{' '}
              <a href="https://www.rcgp.org.uk/mrcgp-exams/artificial-intelligence-exams-training" 
                 target="_blank" 
                 rel="noopener noreferrer"
                 className="text-blue-600 hover:underline">
                RCGP guidance on AI in training and examinations
              </a>
            </p>
          </div>
        </CardContent>
      </Card>

      {/* What AI Can Help With */}
      <Card className="border-2 border-purple-200">
        <CardHeader className="bg-gradient-to-r from-purple-500 to-purple-600 text-white rounded-t-lg">
          <CardTitle>🤖 What AI Reflection Tools Can Help With</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="grid md:grid-cols-2 gap-4">
            <div className="p-4 bg-purple-50 rounded-lg border border-purple-200">
              <span className="text-2xl">✍️</span>
              <h4 className="font-semibold text-purple-700 mt-2">Structuring Your Thoughts</h4>
              <p className="text-sm text-foreground/70 mt-1">
                Helps organize your reflection using established frameworks (Gibbs, Rolfe, Borton, etc.)
              </p>
            </div>
            <div className="p-4 bg-purple-50 rounded-lg border border-purple-200">
              <span className="text-2xl">🔗</span>
              <h4 className="font-semibold text-purple-700 mt-2">Linking Competencies</h4>
              <p className="text-sm text-foreground/70 mt-1">
                Suggests relevant curriculum competency links based on your reflection content
              </p>
            </div>
            <div className="p-4 bg-purple-50 rounded-lg border border-purple-200">
              <span className="text-2xl">📝</span>
              <h4 className="font-semibold text-purple-700 mt-2">Improving Clarity</h4>
              <p className="text-sm text-foreground/70 mt-1">
                Helps refine language and ensure your reflection demonstrates learning
              </p>
            </div>
            <div className="p-4 bg-purple-50 rounded-lg border border-purple-200">
              <span className="text-2xl">✅</span>
              <h4 className="font-semibold text-purple-700 mt-2">Quality Checks</h4>
              <p className="text-sm text-foreground/70 mt-1">
                Reviews your reflection to ensure it meets RCGP requirements
              </p>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* How to Use AI Appropriately */}
      <Card className="border-2 border-green-200">
        <CardHeader className="bg-gradient-to-r from-green-500 to-green-600 text-white rounded-t-lg">
          <CardTitle>✅ How to Use AI Appropriately</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
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
              <div key={item.step} className="flex items-start gap-4 p-4 bg-green-50 rounded-lg border border-green-200">
                <span className="w-8 h-8 bg-green-500 text-white rounded-full flex items-center justify-center font-bold flex-shrink-0">
                  {item.step}
                </span>
                <div>
                  <h4 className="font-semibold text-green-700">{item.title}</h4>
                  <p className="text-sm text-foreground/70 mt-1">{item.desc}</p>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Example Prompts */}
      <Card className="border-2 border-teal-200">
        <CardHeader className="bg-gradient-to-r from-teal-500 to-teal-600 text-white rounded-t-lg">
          <CardTitle>💬 Example Prompts for AI Tools</CardTitle>
        </CardHeader>
        <CardContent className="pt-6">
          <p className="text-foreground/70 mb-4">
            Here are some appropriate ways to use AI assistance:
          </p>
          <div className="space-y-3">
            <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
              <p className="text-sm font-mono text-foreground/80">
                &ldquo;Help me structure this reflection using Gibbs&apos; reflective cycle: [your notes]&rdquo;
              </p>
            </div>
            <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
              <p className="text-sm font-mono text-foreground/80">
                &ldquo;What GP curriculum competencies might this reflection link to? [your draft]&rdquo;
              </p>
            </div>
            <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
              <p className="text-sm font-mono text-foreground/80">
                &ldquo;Review this reflection and suggest where I could add more analysis: [your draft]&rdquo;
              </p>
            </div>
            <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
              <p className="text-sm font-mono text-foreground/80">
                &ldquo;Help me improve the clarity of this paragraph without changing the meaning: [text]&rdquo;
              </p>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Important Reminders */}
      <Card className="border-2 border-gray-200">
        <CardHeader>
          <CardTitle>📌 Key Reminders</CardTitle>
        </CardHeader>
        <CardContent>
          <ul className="space-y-3">
            {[
              'Your reflections will be discussed at ARCP - you must be able to talk about them authentically',
              'Educational Supervisors can ask probing questions about any reflection',
              'The GMC expects honest documentation of your learning',
              'Using AI to fabricate experiences could be considered misconduct',
              'When in doubt, write it yourself',
            ].map((item, i) => (
              <li key={i} className="flex items-start gap-3">
                <span className="text-primary">•</span>
                <span className="text-foreground/80">{item}</span>
              </li>
            ))}
          </ul>
        </CardContent>
      </Card>
    </div>
  )
}
