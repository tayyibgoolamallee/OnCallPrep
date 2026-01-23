import Link from 'next/link'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

const topics = [
  {
    category: 'Cardiovascular',
    items: ['Hypertension', 'Heart Failure', 'Atrial Fibrillation', 'Chest Pain', 'DVT/PE', 'Peripheral Vascular Disease'],
    color: 'red',
  },
  {
    category: 'Respiratory',
    items: ['Asthma', 'COPD', 'Pneumonia', 'URTI', 'Cough', 'Sleep Apnoea'],
    color: 'blue',
  },
  {
    category: 'Mental Health',
    items: ['Depression', 'Anxiety', 'Insomnia', 'Dementia', 'Psychosis', 'Eating Disorders'],
    color: 'purple',
  },
  {
    category: 'MSK',
    items: ['Back Pain', 'Osteoarthritis', 'Rheumatoid Arthritis', 'Gout', 'Shoulder Pain', 'Knee Pain'],
    color: 'green',
  },
  {
    category: 'Dermatology',
    items: ['Eczema', 'Psoriasis', 'Acne', 'Skin Cancer', 'Infections', 'Rashes'],
    color: 'amber',
  },
  {
    category: 'Endocrine',
    items: ['Type 2 Diabetes', 'Hypothyroidism', 'Hyperthyroidism', 'PCOS', 'Osteoporosis'],
    color: 'teal',
  },
  {
    category: 'Women&apos;s Health',
    items: ['Contraception', 'Menopause', 'Menstrual Problems', 'Pregnancy', 'Cervical Screening'],
    color: 'pink',
  },
  {
    category: 'GI',
    items: ['IBS', 'GORD', 'Constipation', 'Diarrhoea', 'Liver Disease', 'Coeliac Disease'],
    color: 'orange',
  },
]

const colorClasses: Record<string, { bg: string; border: string; text: string; badge: string }> = {
  red: { bg: 'bg-red-50', border: 'border-red-200', text: 'text-red-700', badge: 'bg-red-100 text-red-800' },
  blue: { bg: 'bg-blue-50', border: 'border-blue-200', text: 'text-blue-700', badge: 'bg-blue-100 text-blue-800' },
  purple: { bg: 'bg-purple-50', border: 'border-purple-200', text: 'text-purple-700', badge: 'bg-purple-100 text-purple-800' },
  green: { bg: 'bg-green-50', border: 'border-green-200', text: 'text-green-700', badge: 'bg-green-100 text-green-800' },
  amber: { bg: 'bg-amber-50', border: 'border-amber-200', text: 'text-amber-700', badge: 'bg-amber-100 text-amber-800' },
  teal: { bg: 'bg-teal-50', border: 'border-teal-200', text: 'text-teal-700', badge: 'bg-teal-100 text-teal-800' },
  pink: { bg: 'bg-pink-50', border: 'border-pink-200', text: 'text-pink-700', badge: 'bg-pink-100 text-pink-800' },
  orange: { bg: 'bg-orange-50', border: 'border-orange-200', text: 'text-orange-700', badge: 'bg-orange-100 text-orange-800' },
}

export default function ClinicalTopicsPage() {
  return (
    <div className="space-y-8 max-w-5xl">
      <div>
        <h1 className="text-3xl font-bold">Clinical Topics</h1>
        <p className="text-foreground/70 mt-2 text-lg">
          Quick reference guides for common GP presentations. Click on any topic for detailed guidance.
        </p>
      </div>

      <div className="p-4 bg-blue-50 rounded-lg border border-blue-200">
        <strong className="text-blue-700">💡 Study Tip:</strong>{' '}
        <span className="text-foreground/70">
          For AKT preparation, focus on NICE guidelines and common presentations. For SCA, practice explaining these conditions to patients in plain language.
        </span>
      </div>

      <div className="grid md:grid-cols-2 gap-6">
        {topics.map((topic) => {
          const colors = colorClasses[topic.color]
          return (
            <Card key={topic.category} className={`border-2 ${colors.border}`}>
              <CardHeader className={colors.bg}>
                <CardTitle className={colors.text}>{topic.category}</CardTitle>
              </CardHeader>
              <CardContent className="pt-4">
                <div className="flex flex-wrap gap-2">
                  {topic.items.map((item) => (
                    <Badge key={item} className={colors.badge} variant="secondary">
                      {item}
                    </Badge>
                  ))}
                </div>
              </CardContent>
            </Card>
          )
        })}
      </div>

      {/* Key Resources */}
      <Card className="border-2 border-gray-200">
        <CardHeader>
          <CardTitle>📚 Key Resources</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="grid md:grid-cols-2 gap-4">
            <div className="p-4 bg-gray-50 rounded-lg">
              <h4 className="font-semibold text-foreground">NICE Guidelines</h4>
              <p className="text-sm text-foreground/70 mt-1">Essential for AKT and clinical practice</p>
              <a 
                href="https://www.nice.org.uk/guidance" 
                target="_blank" 
                rel="noopener noreferrer"
                className="text-sm text-primary hover:underline mt-2 inline-block"
              >
                nice.org.uk/guidance →
              </a>
            </div>
            <div className="p-4 bg-gray-50 rounded-lg">
              <h4 className="font-semibold text-foreground">CKS (Clinical Knowledge Summaries)</h4>
              <p className="text-sm text-foreground/70 mt-1">Practical GP-focused guidance</p>
              <a 
                href="https://cks.nice.org.uk/" 
                target="_blank" 
                rel="noopener noreferrer"
                className="text-sm text-primary hover:underline mt-2 inline-block"
              >
                cks.nice.org.uk →
              </a>
            </div>
            <div className="p-4 bg-gray-50 rounded-lg">
              <h4 className="font-semibold text-foreground">BNF</h4>
              <p className="text-sm text-foreground/70 mt-1">Drug information and interactions</p>
              <a 
                href="https://bnf.nice.org.uk/" 
                target="_blank" 
                rel="noopener noreferrer"
                className="text-sm text-primary hover:underline mt-2 inline-block"
              >
                bnf.nice.org.uk →
              </a>
            </div>
            <div className="p-4 bg-gray-50 rounded-lg">
              <h4 className="font-semibold text-foreground">Patient.info</h4>
              <p className="text-sm text-foreground/70 mt-1">Patient information leaflets</p>
              <a 
                href="https://patient.info/doctor" 
                target="_blank" 
                rel="noopener noreferrer"
                className="text-sm text-primary hover:underline mt-2 inline-block"
              >
                patient.info →
              </a>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Coming Soon */}
      <Card className="border-2 border-dashed border-gray-300">
        <CardContent className="py-8 text-center">
          <span className="text-4xl">🚧</span>
          <h3 className="font-semibold text-foreground mt-4">Detailed Topic Guides Coming Soon</h3>
          <p className="text-sm text-foreground/60 mt-2">
            We&apos;re working on detailed guides for each clinical topic with key facts, red flags, and management summaries.
          </p>
        </CardContent>
      </Card>
    </div>
  )
}
