import Link from 'next/link'
import { createClient } from '@/lib/supabase/server'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Progress } from '@/components/ui/progress'
import { stageInfo } from '@/lib/portfolio-requirements'

const stages = [
  { id: 'st1', name: 'ST1', description: stageInfo.st1.description },
  { id: 'st2', name: 'ST2', description: stageInfo.st2.description },
  { id: 'st3', name: 'ST3', description: stageInfo.st3.description },
]

const resources = [
  {
    title: 'Consultation Models',
    description: 'Calgary-Cambridge, Pendleton, Neighbour, and more frameworks',
    href: '/resources/consultation-models',
    icon: '📋',
  },
  {
    title: 'Reflection Guide',
    description: 'How to write effective reflections using Gibbs, Rolfe, and other frameworks',
    href: '/resources/reflection-guide',
    icon: '✍️',
  },
  {
    title: 'AI Reflection Assistant',
    description: 'Guidance on using AI tools appropriately for portfolio reflections',
    href: '/resources/ai-reflection',
    icon: '🤖',
  },
  {
    title: 'Hidden Curriculum',
    description: 'GP setup, triage, finances, career paths, and essential knowledge',
    href: '/resources/hidden-curriculum',
    icon: '🎓',
  },
  {
    title: 'WPBA Checklist',
    description: 'Complete guide to workplace-based assessments',
    href: '/resources/wpba-checklist',
    icon: '✅',
  },
  {
    title: 'Clinical Topics',
    description: 'Quick reference guides for common GP presentations',
    href: '/resources/clinical-topics',
    icon: '🩺',
  },
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

      {/* Overview Section */}
      <Card>
        <CardHeader>
          <CardTitle>Portfolio Overview</CardTitle>
          <CardDescription>
            Understanding your training requirements across ST1, ST2, and ST3
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="grid md:grid-cols-3 gap-4">
            <div>
              <h3 className="font-semibold mb-2">ST1 - First Year</h3>
              <p className="text-sm text-muted-foreground">
                Foundation year focusing on core competencies and workplace-based assessments. 
                Establish baseline assessments including Mini-CEX/COTs, CBDs, MSF, and learning logs.
              </p>
            </div>
            <div>
              <h3 className="font-semibold mb-2">ST2 - Second Year</h3>
              <p className="text-sm text-muted-foreground">
                Building on ST1 foundations with increased responsibility. 
                Continue assessments and begin leadership development activities.
              </p>
            </div>
            <div>
              <h3 className="font-semibold mb-2">ST3 - Final Year</h3>
              <p className="text-sm text-muted-foreground">
                Final year preparing for CCT. Complete all intimate examinations, 
                leadership activities, and comprehensive evidence requirements.
              </p>
            </div>
          </div>
          <div className="pt-4 border-t">
            <p className="text-sm text-muted-foreground">
              <strong>Key Points:</strong> Assessments should be spread throughout each training year with roughly half 
              completed in each 6-month review period. Less Than Full Time (LTFT) trainees complete the same total 
              number pro-rata. CPR&AED and Safeguarding knowledge updates are required every 12 months (not pro-rata).
            </p>
          </div>
        </CardContent>
      </Card>

      {/* Resources Section */}
      <div>
        <h2 className="text-2xl font-bold mb-4">Learning Resources</h2>
        <p className="text-muted-foreground mb-6">
          Essential guides and tools to support your portfolio development
        </p>
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
          {resources.map((resource) => (
            <Link key={resource.href} href={resource.href}>
              <Card className="h-full hover:shadow-lg transition-shadow cursor-pointer border-2 hover:border-primary/50">
                <CardHeader>
                  <div className="flex items-start justify-between">
                    <span className="text-3xl">{resource.icon}</span>
                  </div>
                  <CardTitle className="mt-4 text-lg">{resource.title}</CardTitle>
                  <CardDescription className="text-foreground/70">
                    {resource.description}
                  </CardDescription>
                </CardHeader>
              </Card>
            </Link>
          ))}
        </div>
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
