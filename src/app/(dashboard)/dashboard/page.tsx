import Link from 'next/link'
import { createClient } from '@/lib/supabase/server'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'

const sections = [
  {
    title: 'Portfolio Helper',
    description: 'Track your progress through ST1, ST2, and ST3 requirements',
    href: '/portfolio',
    icon: '📁',
    color: 'bg-blue-500/10 border-blue-500/20',
  },
  {
    title: 'AKT Question Bank',
    description: 'Test your knowledge with guideline-referenced questions',
    href: '/akt',
    icon: '📝',
    color: 'bg-purple-500/10 border-purple-500/20',
  },
  {
    title: 'SCA Preparation',
    description: 'Practice timed cases and build consultation skills',
    href: '/sca',
    icon: '🩺',
    color: 'bg-teal-500/10 border-teal-500/20',
  },
]

export default async function DashboardPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: profile } = await supabase
    .from('user_profiles')
    .select('*')
    .eq('id', user!.id)
    .single()

  const { data: progress } = await supabase
    .from('user_progress')
    .select('*')
    .eq('user_id', user!.id)

  const portfolioProgress = progress?.filter(p => p.content_type === 'portfolio') || []
  const scaProgress = progress?.filter(p => p.content_type === 'sca') || []
  const aktProgress = progress?.filter(p => p.content_type === 'akt') || []

  const aktScore = aktProgress.length > 0
    ? Math.round((aktProgress.filter(p => p.score === 1).length / aktProgress.length) * 100)
    : 0

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold">
          Welcome back{profile?.full_name ? `, ${profile.full_name.split(' ')[0]}` : ''}
        </h1>
        <p className="text-muted-foreground mt-1">
          Continue your GP training journey
        </p>
      </div>

      {/* Subscription Status */}
      {profile?.subscription_tier === 'free' && (
        <Card className="bg-gradient-to-r from-primary/10 to-accent/10 border-primary/20">
          <CardContent className="flex items-center justify-between py-4">
            <div>
              <p className="font-medium">Upgrade to Pro for full access</p>
              <p className="text-sm text-muted-foreground">
                Get 50+ mock cases, 500+ AKT questions, and detailed guides
              </p>
            </div>
            <Link href="/pricing">
              <Button>Upgrade Now</Button>
            </Link>
          </CardContent>
        </Card>
      )}

      {/* Quick Stats */}
      <div className="grid md:grid-cols-3 gap-4">
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>Portfolio Items</CardDescription>
            <CardTitle className="text-2xl">{portfolioProgress.filter(p => p.completed).length}</CardTitle>
          </CardHeader>
          <CardContent>
            <p className="text-xs text-muted-foreground">completed</p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>AKT Score</CardDescription>
            <CardTitle className="text-2xl">{aktScore}%</CardTitle>
          </CardHeader>
          <CardContent>
            <Progress value={aktScore} className="h-2" />
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>SCA Cases</CardDescription>
            <CardTitle className="text-2xl">{scaProgress.length}</CardTitle>
          </CardHeader>
          <CardContent>
            <p className="text-xs text-muted-foreground">attempted</p>
          </CardContent>
        </Card>
      </div>

      {/* Section Cards */}
      <div className="grid md:grid-cols-3 gap-6">
        {sections.map((section) => (
          <Link key={section.href} href={section.href}>
            <Card className={`h-full hover:shadow-md transition-shadow cursor-pointer ${section.color}`}>
              <CardHeader>
                <div className="text-3xl mb-2">{section.icon}</div>
                <CardTitle className="text-lg">{section.title}</CardTitle>
                <CardDescription>{section.description}</CardDescription>
              </CardHeader>
              <CardContent>
                <Badge variant="secondary">Explore</Badge>
              </CardContent>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  )
}
