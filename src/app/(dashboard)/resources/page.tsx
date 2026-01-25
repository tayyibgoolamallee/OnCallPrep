import Link from 'next/link'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'

const resources = [
  {
    title: 'Consultation Models',
    description: 'Calgary-Cambridge, Pendleton, Neighbour, and more frameworks for effective consultations',
    href: '/resources/consultation-models',
    icon: '📋',
    category: 'Clinical Skills',
  },
  {
    title: 'Reflection Guide',
    description: 'How to write effective reflections using Gibbs, Rolfe, and other frameworks',
    href: '/resources/reflection-guide',
    icon: '✍️',
    category: 'Portfolio',
  },
  {
    title: 'AI Reflection Assistant',
    description: 'Guidance on using AI tools appropriately for portfolio reflections',
    href: '/resources/ai-reflection',
    icon: '🤖',
    category: 'Portfolio',
  },
  {
    title: 'Hidden Curriculum',
    description: 'GP setup, triage, finances, career paths, and essential knowledge beyond the formal curriculum',
    href: '/resources/hidden-curriculum',
    icon: '🎓',
    category: 'Career',
  },
  {
    title: 'WPBA Checklist',
    description: 'Complete guide to workplace-based assessments - CBD, Mini-CEX, COT, PSQ',
    href: '/resources/wpba-checklist',
    icon: '✅',
    category: 'Portfolio',
  },
  {
    title: 'Clinical Topics',
    description: 'Quick reference guides for common GP presentations',
    href: '/resources/clinical-topics',
    icon: '🩺',
    category: 'Clinical Skills',
  },
  {
    title: 'Trainee Support',
    description: 'Access to support services, resources, and guidance during your GP training journey',
    href: '/resources/support',
    icon: '💙',
    category: 'Support',
  },
]

export default function ResourcesPage() {
  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold">Learning Resources</h1>
        <p className="text-foreground/70 mt-1">
          Comprehensive guides to support your GP training journey
        </p>
      </div>

      <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
        {resources.map((resource) => (
          <Link key={resource.href} href={resource.href}>
            <Card className="h-full hover:shadow-lg transition-shadow cursor-pointer border-2 hover:border-primary/50">
              <CardHeader>
                <div className="flex items-start justify-between">
                  <span className="text-4xl">{resource.icon}</span>
                  <Badge variant="secondary">{resource.category}</Badge>
                </div>
                <CardTitle className="mt-4">{resource.title}</CardTitle>
                <CardDescription className="text-foreground/70">
                  {resource.description}
                </CardDescription>
              </CardHeader>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  )
}
