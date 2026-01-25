import Link from 'next/link'
import { notFound } from 'next/navigation'
import { createClient } from '@/lib/supabase/server'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import ReactMarkdown from 'react-markdown'
import WPBATracker from '@/components/WPBATracker'
import { stageInfo } from '@/lib/portfolio-requirements'

const stageNames: Record<string, string> = {
  st1: stageInfo.st1.fullName,
  st2: stageInfo.st2.fullName,
  st3: stageInfo.st3.fullName,
}

const categories = [
  { id: 'checklist', name: 'Checklists', icon: '✓' },
  { id: 'reflection', name: 'Reflective Writing', icon: '📝' },
  { id: 'consultation', name: 'Consultation Models', icon: '💬' },
  { id: 'competency', name: 'Competency Guides', icon: '🎯' },
]

export default async function PortfolioStagePage({
  params,
}: {
  params: Promise<{ stage: string }>
}) {
  const { stage } = await params

  if (!['st1', 'st2', 'st3'].includes(stage)) {
    notFound()
  }

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: guides } = await supabase
    .from('portfolio_guides')
    .select('*')
    .eq('stage', stage)
    .eq('published', true)
    .order('sort_order')

  const { data: progress } = await supabase
    .from('user_progress')
    .select('*')
    .eq('user_id', user!.id)
    .eq('content_type', 'portfolio')

  const { data: profile } = await supabase
    .from('user_profiles')
    .select('subscription_tier')
    .eq('id', user!.id)
    .single()

  const isPro = profile?.subscription_tier === 'pro'
  const completedIds = new Set(progress?.filter(p => p.completed).map(p => p.content_id))

  return (
    <div className="space-y-8">
      <div className="flex items-center gap-4">
        <Link href="/portfolio">
          <Button variant="ghost" size="sm">← Back</Button>
        </Link>
        <div>
          <h1 className="text-3xl font-bold">{stageNames[stage]}</h1>
          <p className="text-muted-foreground">Portfolio requirements and guides</p>
        </div>
      </div>

      {/* WPBA Requirements Tracker */}
      <WPBATracker stage={stage as 'st1' | 'st2' | 'st3'} />

      {categories.map((category) => {
        const categoryGuides = guides?.filter(g => g.category === category.id) || []
        if (categoryGuides.length === 0) return null

        return (
          <div key={category.id}>
            <h2 className="text-xl font-semibold mb-4 flex items-center gap-2">
              <span>{category.icon}</span>
              {category.name}
            </h2>
            <div className="grid gap-4">
              {categoryGuides.map((guide) => {
                const isLocked = guide.is_pro && !isPro
                const isCompleted = completedIds.has(guide.id)

                return (
                  <Card key={guide.id} className={isLocked ? 'opacity-75' : ''}>
                    <CardHeader>
                      <div className="flex items-start justify-between">
                        <div>
                          <CardTitle className="text-lg flex items-center gap-2">
                            {isCompleted && <span className="text-green-600">✓</span>}
                            {guide.title}
                          </CardTitle>
                        </div>
                        <div className="flex gap-2">
                          {guide.is_pro && <Badge>Pro</Badge>}
                          {isCompleted && <Badge variant="secondary">Completed</Badge>}
                        </div>
                      </div>
                    </CardHeader>
                    <CardContent>
                      {isLocked ? (
                        <div className="text-center py-4">
                          <p className="text-muted-foreground mb-4">
                            This guide is available with Pro
                          </p>
                          <Link href="/pricing">
                            <Button size="sm">Upgrade to Pro</Button>
                          </Link>
                        </div>
                      ) : (
                        <div className="prose prose-sm max-w-none dark:prose-invert">
                          <ReactMarkdown>{guide.content}</ReactMarkdown>
                        </div>
                      )}
                    </CardContent>
                  </Card>
                )
              })}
            </div>
          </div>
        )
      })}

      {(!guides || guides.length === 0) && (
        <Card>
          <CardContent className="py-8 text-center">
            <p className="text-muted-foreground">
              No guides available for this stage yet. Check back soon!
            </p>
          </CardContent>
        </Card>
      )}
    </div>
  )
}
