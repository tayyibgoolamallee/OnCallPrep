import Link from 'next/link'
import { createClient } from '@/lib/supabase/server'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Progress } from '@/components/ui/progress'

const stages = [
  { id: 'st1', name: 'ST1', description: 'First year of specialty training' },
  { id: 'st2', name: 'ST2', description: 'Second year of specialty training' },
  { id: 'st3', name: 'ST3', description: 'Final year of specialty training' },
]

export default async function PortfolioPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: guides } = await supabase
    .from('portfolio_guides')
    .select('*')
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

  const getStageStats = (stageId: string) => {
    const stageGuides = guides?.filter(g => g.stage === stageId) || []
    const accessibleGuides = stageGuides.filter(g => !g.is_pro || isPro)
    const completedGuides = progress?.filter(p =>
      accessibleGuides.some(g => g.id === p.content_id && p.completed)
    ) || []
    return {
      total: accessibleGuides.length,
      completed: completedGuides.length,
      progress: accessibleGuides.length > 0
        ? Math.round((completedGuides.length / accessibleGuides.length) * 100)
        : 0
    }
  }

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold">Portfolio Helper</h1>
        <p className="text-muted-foreground mt-1">
          Structured guidance through your GP training requirements
        </p>
      </div>

      <div className="grid md:grid-cols-3 gap-6">
        {stages.map((stage) => {
          const stats = getStageStats(stage.id)
          return (
            <Link key={stage.id} href={`/portfolio/${stage.id}`}>
              <Card className="h-full hover:shadow-md transition-shadow cursor-pointer">
                <CardHeader>
                  <div className="flex items-center justify-between">
                    <CardTitle>{stage.name}</CardTitle>
                    <Badge variant="secondary">{stats.completed}/{stats.total}</Badge>
                  </div>
                  <CardDescription>{stage.description}</CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="space-y-2">
                    <Progress value={stats.progress} className="h-2" />
                    <p className="text-xs text-muted-foreground">
                      {stats.progress}% complete
                    </p>
                  </div>
                </CardContent>
              </Card>
            </Link>
          )
        })}
      </div>

      {!isPro && (
        <Card className="bg-muted/50">
          <CardContent className="py-6">
            <div className="flex items-center justify-between">
              <div>
                <h3 className="font-semibold">Unlock all portfolio guides</h3>
                <p className="text-sm text-muted-foreground">
                  Get detailed competency guides and advanced content with Pro
                </p>
              </div>
              <Link href="/pricing">
                <Badge>Upgrade to Pro</Badge>
              </Link>
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  )
}
