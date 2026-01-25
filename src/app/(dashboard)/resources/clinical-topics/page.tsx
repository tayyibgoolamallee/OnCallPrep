import ResourcePageLayout, { ResourceSection, InfoBox, Chunk } from '@/components/ResourcePageLayout'
import { Badge } from '@/components/ui/badge'

const topics = [
  {
    category: 'Cardiovascular',
    items: ['Hypertension', 'Heart Failure', 'Atrial Fibrillation', 'Chest Pain', 'DVT/PE', 'Peripheral Vascular Disease'],
  },
  {
    category: 'Respiratory',
    items: ['Asthma', 'COPD', 'Pneumonia', 'URTI', 'Cough', 'Sleep Apnoea'],
  },
  {
    category: 'Mental Health',
    items: ['Depression', 'Anxiety', 'Insomnia', 'Dementia', 'Psychosis', 'Eating Disorders'],
  },
  {
    category: 'MSK',
    items: ['Back Pain', 'Osteoarthritis', 'Rheumatoid Arthritis', 'Gout', 'Shoulder Pain', 'Knee Pain'],
  },
  {
    category: 'Dermatology',
    items: ['Eczema', 'Psoriasis', 'Acne', 'Skin Cancer', 'Infections', 'Rashes'],
  },
  {
    category: 'Endocrine',
    items: ['Type 2 Diabetes', 'Hypothyroidism', 'Hyperthyroidism', 'PCOS', 'Osteoporosis'],
  },
  {
    category: 'Women\'s Health',
    items: ['Contraception', 'Menopause', 'Menstrual Problems', 'Pregnancy', 'Cervical Screening'],
  },
  {
    category: 'GI',
    items: ['IBS', 'GORD', 'Constipation', 'Diarrhoea', 'Liver Disease', 'Coeliac Disease'],
  },
]

export default function ClinicalTopicsPage() {
  return (
    <ResourcePageLayout
      title="Clinical Topics"
      description="Quick reference guides for common GP presentations. Click on any topic for detailed guidance."
    >
      {/* Study Tip */}
      <InfoBox variant="tip">
        <strong className="text-teal-700 dark:text-teal-400">Study Tip:</strong>{' '}
        <span className="text-slate-700 dark:text-slate-300">
          For AKT preparation, focus on NICE guidelines and common presentations. For SCA, practice explaining these conditions to patients in plain language.
        </span>
      </InfoBox>

      {/* Clinical Topics Grid */}
      <ResourceSection title="Clinical Topics" variant="primary">
        <div className="grid md:grid-cols-2 gap-4">
          {topics.map((topic) => (
            <Chunk key={topic.category} title={topic.category}>
              <div className="flex flex-wrap gap-2 mt-2">
                {topic.items.map((item) => (
                  <Badge key={item} variant="secondary" className="bg-slate-200 dark:bg-slate-700 text-slate-700 dark:text-slate-300">
                    {item}
                  </Badge>
                ))}
              </div>
            </Chunk>
          ))}
        </div>
      </ResourceSection>

      {/* Key Resources */}
      <ResourceSection title="Key Resources" variant="secondary">
        <div className="grid md:grid-cols-2 gap-4">
          {[
            { 
              title: 'NICE Guidelines', 
              desc: 'Essential for AKT and clinical practice',
              link: 'https://www.nice.org.uk/guidance',
              linkText: 'nice.org.uk/guidance'
            },
            { 
              title: 'CKS (Clinical Knowledge Summaries)', 
              desc: 'Practical GP-focused guidance',
              link: 'https://cks.nice.org.uk/',
              linkText: 'cks.nice.org.uk'
            },
            { 
              title: 'BNF', 
              desc: 'Drug information and interactions',
              link: 'https://bnf.nice.org.uk/',
              linkText: 'bnf.nice.org.uk'
            },
            { 
              title: 'Patient.info', 
              desc: 'Patient information leaflets',
              link: 'https://patient.info/doctor',
              linkText: 'patient.info'
            },
          ].map((resource, i) => (
            <Chunk key={i} title={resource.title}>
              <p className="mb-2">{resource.desc}</p>
              <a 
                href={resource.link} 
                target="_blank" 
                rel="noopener noreferrer"
                className="text-teal-600 dark:text-teal-400 hover:underline text-sm"
              >
                {resource.linkText} →
              </a>
            </Chunk>
          ))}
        </div>
      </ResourceSection>

      {/* Coming Soon */}
      <ResourceSection title="Detailed Topic Guides Coming Soon" variant="secondary">
        <div className="text-center py-6">
          <span className="text-4xl mb-4 block">🚧</span>
          <p className="text-slate-600 dark:text-slate-400">
            We're working on detailed guides for each clinical topic with key facts, red flags, and management summaries.
          </p>
        </div>
      </ResourceSection>
    </ResourcePageLayout>
  )
}
