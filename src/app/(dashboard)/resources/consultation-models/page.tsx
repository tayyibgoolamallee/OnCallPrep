import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

const ModelStep = ({ number, title, description, example, color }: {
  number: number
  title: string
  description: string
  example: string
  color: string
}) => (
  <div className="flex gap-4 mb-4">
    <div className={`flex-shrink-0 w-8 h-8 rounded-full ${color} text-white flex items-center justify-center font-bold`}>
      {number}
    </div>
    <div className="flex-1">
      <h4 className="font-semibold text-foreground">{title}</h4>
      <p className="text-foreground/70 text-sm">{description}</p>
      <div className="mt-2 p-3 bg-muted rounded-lg text-sm italic text-foreground/70">
        <strong>Example:</strong> {example}
      </div>
    </div>
  </div>
)

export default function ConsultationModelsPage() {
  return (
    <div className="space-y-8 max-w-4xl">
      <div>
        <h1 className="text-3xl font-bold">Consultation Models</h1>
        <p className="text-foreground/70 mt-2 text-lg">
          Structured frameworks for effective, patient-centred consultations. Learn when and how to use each model.
        </p>
      </div>

      {/* Calgary-Cambridge */}
      <Card className="border-2 border-blue-200">
        <CardHeader className="bg-gradient-to-r from-blue-500 to-blue-600 text-white rounded-t-lg">
          <CardTitle className="flex items-center gap-2">
            📋 Calgary-Cambridge Model
          </CardTitle>
          <p className="text-blue-100">The most widely used consultation model in UK general practice</p>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="mb-4 p-3 bg-blue-50 border-l-4 border-blue-500 rounded">
            <strong className="text-blue-700">When to use:</strong>{' '}
            <span className="text-foreground/70">Most consultations, especially complex cases requiring comprehensive assessment</span>
          </div>
          
          <ModelStep 
            number={1}
            title="Initiating the session"
            description="Establish rapport, identify reason for attendance"
            example={`"Hello, I'm Dr. Smith. What brings you in today?" - Open question, maintain eye contact, show interest.`}
            color="bg-blue-500"
          />
          <ModelStep 
            number={2}
            title="Gathering information"
            description="Explore patient's perspective, biomedical perspective, background information"
            example={`"How has this been affecting you?" (patient perspective) → "When did the pain start?" (biomedical) → "Any family history?" (background)`}
            color="bg-blue-500"
          />
          <ModelStep 
            number={3}
            title="Physical examination"
            description="If required, explain and gain consent"
            example={`"I'd like to examine your chest to listen to your breathing. Is that okay? I'll need you to remove your top."`}
            color="bg-blue-500"
          />
          <ModelStep 
            number={4}
            title="Explanation and planning"
            description="Share information, reach shared understanding, involve patient in decisions"
            example={`"Based on what you've told me, this sounds like asthma. We have a few options: inhaler, lifestyle changes, or both. What do you think would work best for you?"`}
            color="bg-blue-500"
          />
          <ModelStep 
            number={5}
            title="Closing the session"
            description="Summarize, safety net, arrange follow-up"
            example={`"So we've agreed on the inhaler. If your breathing gets worse or you're not better in a week, come back. I'll see you in 2 weeks to check how you're getting on."`}
            color="bg-blue-500"
          />
        </CardContent>
      </Card>

      {/* Pendleton's 7 Tasks */}
      <Card className="border-2 border-purple-200">
        <CardHeader className="bg-gradient-to-r from-purple-500 to-purple-600 text-white rounded-t-lg">
          <CardTitle className="flex items-center gap-2">
            ✅ Pendleton&apos;s 7 Tasks
          </CardTitle>
          <p className="text-purple-100">A task-based approach to consultations</p>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="mb-4 p-3 bg-purple-50 border-l-4 border-purple-500 rounded">
            <strong className="text-purple-700">When to use:</strong>{' '}
            <span className="text-foreground/70">Teaching, structured assessments, complex cases requiring systematic approach</span>
          </div>
          
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
              <div key={i} className="p-4 bg-purple-50 rounded-lg">
                <div className="flex items-start gap-3">
                  <span className="flex-shrink-0 w-6 h-6 bg-purple-500 text-white rounded-full flex items-center justify-center text-sm font-bold">
                    {i + 1}
                  </span>
                  <div>
                    <strong className="text-purple-700">{item.task}</strong>
                    <p className="text-sm italic text-foreground/70 mt-1">{item.example}</p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Neighbour's Inner Consultation */}
      <Card className="border-2 border-green-200">
        <CardHeader className="bg-gradient-to-r from-green-500 to-green-600 text-white rounded-t-lg">
          <CardTitle className="flex items-center gap-2">
            ⚡ Neighbour&apos;s Inner Consultation
          </CardTitle>
          <p className="text-green-100">Five checkpoints for effective consultations</p>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="mb-4 p-3 bg-green-50 border-l-4 border-green-500 rounded">
            <strong className="text-green-700">When to use:</strong>{' '}
            <span className="text-foreground/70">Quick consultations, time-pressured situations, when you need a simple framework</span>
          </div>
          
          <ModelStep 
            number={1}
            title="Connecting"
            description="Establish rapport and understand the patient's agenda"
            example={`"Hi, how can I help you today?" - Simple, open, welcoming.`}
            color="bg-green-500"
          />
          <ModelStep 
            number={2}
            title="Summarizing"
            description="Check understanding before moving forward"
            example={`"So you've had this cough for 3 weeks, it's worse at night, and you're worried it might be something serious?"`}
            color="bg-green-500"
          />
          <ModelStep 
            number={3}
            title="Handing over"
            description="Share decision-making and management"
            example={`"I think this is likely a post-viral cough. We could try a simple cough medicine, or wait another week. What would you prefer?"`}
            color="bg-green-500"
          />
          <ModelStep 
            number={4}
            title="Safety netting"
            description="What to do if things don't improve"
            example={`"If it's not better in a week, or if you develop a fever or breathlessness, come back or call 111."`}
            color="bg-green-500"
          />
          <ModelStep 
            number={5}
            title="Housekeeping"
            description="Manage your own feelings and maintain boundaries"
            example={`Reflect after consultation: "Did I handle that well? Am I feeling frustrated? Do I need to debrief with someone?"`}
            color="bg-green-500"
          />
        </CardContent>
      </Card>

      {/* Byrne & Long */}
      <Card className="border-2 border-amber-200">
        <CardHeader className="bg-gradient-to-r from-amber-500 to-amber-600 text-white rounded-t-lg">
          <CardTitle className="flex items-center gap-2">
            🔄 Byrne & Long Model
          </CardTitle>
          <p className="text-amber-100">Doctor-centred vs patient-centred approach</p>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="mb-4 p-3 bg-amber-50 border-l-4 border-amber-500 rounded">
            <strong className="text-amber-700">When to use:</strong>{' '}
            <span className="text-foreground/70">Understanding consultation styles, teaching communication skills, reflecting on your approach</span>
          </div>
          
          <div className="grid md:grid-cols-2 gap-4 mt-4">
            <div className="p-4 bg-red-50 rounded-xl border-2 border-red-200">
              <h3 className="text-red-600 font-semibold mb-3">❌ Doctor-Centred</h3>
              <ul className="space-y-2 text-sm text-foreground/70">
                <li>• Doctor controls the consultation</li>
                <li>• Closed questions dominate</li>
                <li>• Biomedical focus</li>
                <li>• Doctor makes decisions</li>
                <li>• Less patient involvement</li>
              </ul>
              <div className="mt-3 p-2 bg-white rounded text-sm italic">
                <strong>Example:</strong> &ldquo;Where does it hurt? When did it start? Take this medication twice daily.&rdquo;
              </div>
            </div>
            <div className="p-4 bg-green-50 rounded-xl border-2 border-green-200">
              <h3 className="text-green-600 font-semibold mb-3">✅ Patient-Centred</h3>
              <ul className="space-y-2 text-sm text-foreground/70">
                <li>• Patient&apos;s agenda is explored</li>
                <li>• Open questions used</li>
                <li>• Psychosocial factors considered</li>
                <li>• Shared decision-making</li>
                <li>• Patient actively involved</li>
              </ul>
              <div className="mt-3 p-2 bg-white rounded text-sm italic">
                <strong>Example:</strong> &ldquo;How has this been affecting you? What are you most worried about?&rdquo;
              </div>
            </div>
          </div>
          
          <div className="mt-4 p-4 bg-amber-50 rounded-xl border-2 border-amber-200">
            <strong className="text-amber-700">💡 Key Learning:</strong>{' '}
            <span className="text-foreground/70">Most effective consultations blend both approaches - patient-centred for understanding, doctor-centred for efficiency when appropriate.</span>
          </div>
        </CardContent>
      </Card>

      {/* Stott & Davis */}
      <Card className="border-2 border-blue-200">
        <CardHeader className="bg-gradient-to-r from-blue-500 to-blue-600 text-white rounded-t-lg">
          <CardTitle className="flex items-center gap-2">
            🎯 Stott & Davis Model
          </CardTitle>
          <p className="text-blue-100">Four areas to address in every consultation</p>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="mb-4 p-3 bg-blue-50 border-l-4 border-blue-500 rounded">
            <strong className="text-blue-700">When to use:</strong>{' '}
            <span className="text-foreground/70">Making the most of every consultation opportunity, chronic disease management</span>
          </div>
          
          <div className="grid md:grid-cols-2 gap-4">
            {[
              { title: "Management of presenting problem", desc: "Address why the patient came today", example: "Treating the headache they came in with" },
              { title: "Management of continuing problems", desc: "Review ongoing conditions", example: "Checking blood pressure control" },
              { title: "Modification of help-seeking behaviour", desc: "Educate about when to seek help", example: "When to come for headaches vs self-manage" },
              { title: "Opportunistic health promotion", desc: "Take preventive opportunities", example: "Discussing smoking cessation, flu jab" },
            ].map((item, i) => (
              <div key={i} className="p-4 bg-blue-50 rounded-lg border border-blue-200">
                <div className="flex items-start gap-2">
                  <span className="w-6 h-6 bg-blue-500 text-white rounded-full flex items-center justify-center text-sm font-bold flex-shrink-0">
                    {i + 1}
                  </span>
                  <div>
                    <h4 className="font-semibold text-blue-700">{item.title}</h4>
                    <p className="text-sm text-foreground/70">{item.desc}</p>
                    <p className="text-sm italic text-foreground/60 mt-1">e.g., {item.example}</p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* ICE Framework */}
      <Card className="border-2 border-teal-200">
        <CardHeader className="bg-gradient-to-r from-teal-500 to-teal-600 text-white rounded-t-lg">
          <CardTitle className="flex items-center gap-2">
            🧊 ICE Framework
          </CardTitle>
          <p className="text-teal-100">Ideas, Concerns, and Expectations</p>
        </CardHeader>
        <CardContent className="pt-6">
          <div className="mb-4 p-3 bg-teal-50 border-l-4 border-teal-500 rounded">
            <strong className="text-teal-700">When to use:</strong>{' '}
            <span className="text-foreground/70">Every consultation - understanding the patient&apos;s perspective is fundamental</span>
          </div>
          
          <div className="space-y-4">
            <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
              <h4 className="font-semibold text-teal-700 text-lg">💭 Ideas</h4>
              <p className="text-foreground/70">What does the patient think is wrong?</p>
              <p className="text-sm italic mt-2">&ldquo;What do you think might be causing this?&rdquo;</p>
            </div>
            <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
              <h4 className="font-semibold text-teal-700 text-lg">😟 Concerns</h4>
              <p className="text-foreground/70">What is the patient worried about?</p>
              <p className="text-sm italic mt-2">&ldquo;Is there anything particular you&apos;re worried about?&rdquo;</p>
            </div>
            <div className="p-4 bg-teal-50 rounded-lg border border-teal-200">
              <h4 className="font-semibold text-teal-700 text-lg">🎯 Expectations</h4>
              <p className="text-foreground/70">What does the patient hope to get from the consultation?</p>
              <p className="text-sm italic mt-2">&ldquo;What were you hoping we might do today?&rdquo;</p>
            </div>
          </div>
          
          <div className="mt-4 p-4 bg-teal-50 rounded-xl border-2 border-teal-200">
            <strong className="text-teal-700">💡 Pro Tip:</strong>{' '}
            <span className="text-foreground/70">ICE isn&apos;t a checklist to tick off - weave these questions naturally throughout the consultation.</span>
          </div>
        </CardContent>
      </Card>

      {/* Quick Reference */}
      <Card className="border-2 border-gray-200">
        <CardHeader>
          <CardTitle>📊 Quick Reference: Which Model When?</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b">
                  <th className="text-left p-3 font-semibold">Situation</th>
                  <th className="text-left p-3 font-semibold">Recommended Model</th>
                </tr>
              </thead>
              <tbody className="text-foreground/70">
                <tr className="border-b">
                  <td className="p-3">Complex new problem</td>
                  <td className="p-3">Calgary-Cambridge</td>
                </tr>
                <tr className="border-b">
                  <td className="p-3">Teaching/being observed</td>
                  <td className="p-3">Pendleton&apos;s Tasks</td>
                </tr>
                <tr className="border-b">
                  <td className="p-3">Quick consultation</td>
                  <td className="p-3">Neighbour&apos;s Checkpoints</td>
                </tr>
                <tr className="border-b">
                  <td className="p-3">Chronic disease review</td>
                  <td className="p-3">Stott & Davis</td>
                </tr>
                <tr className="border-b">
                  <td className="p-3">Any consultation</td>
                  <td className="p-3">ICE (always!)</td>
                </tr>
                <tr>
                  <td className="p-3">Reflecting on your style</td>
                  <td className="p-3">Byrne & Long</td>
                </tr>
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
