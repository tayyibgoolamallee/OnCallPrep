import Link from 'next/link'
import { createClient } from '@/lib/supabase/server'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'

export default async function AdminPage() {
  const supabase = await createClient()

  const [
    { count: portfolioCount },
    { count: scaCount },
    { count: aktCount },
    { count: userCount },
  ] = await Promise.all([
    supabase.from('portfolio_guides').select('*', { count: 'exact', head: true }),
    supabase.from('sca_cases').select('*', { count: 'exact', head: true }),
    supabase.from('akt_questions').select('*', { count: 'exact', head: true }),
    supabase.from('user_profiles').select('*', { count: 'exact', head: true }),
  ])

  const stats = [
    { name: 'Portfolio Guides', count: portfolioCount || 0, href: '/admin/portfolio' },
    { name: 'SCA Cases', count: scaCount || 0, href: '/admin/sca' },
    { name: 'AKT Questions', count: aktCount || 0, href: '/admin/akt' },
    { name: 'Users', count: userCount || 0, href: '#' },
  ]

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold">Admin Dashboard</h1>
        <p className="text-muted-foreground mt-1">
          Manage your content and users
        </p>
      </div>

      <div className="grid md:grid-cols-4 gap-4">
        {stats.map((stat) => (
          <Link key={stat.name} href={stat.href}>
            <Card className="hover:shadow-md transition-shadow cursor-pointer">
              <CardHeader className="pb-2">
                <CardDescription>{stat.name}</CardDescription>
                <CardTitle className="text-3xl">{stat.count}</CardTitle>
              </CardHeader>
            </Card>
          </Link>
        ))}
      </div>

      <div className="grid md:grid-cols-3 gap-6">
        <Link href="/admin/portfolio">
          <Card className="h-full hover:shadow-md transition-shadow cursor-pointer">
            <CardHeader>
              <CardTitle>Manage Portfolio Guides</CardTitle>
              <CardDescription>
                Create and edit checklists, reflective guides, and competency content
              </CardDescription>
            </CardHeader>
          </Card>
        </Link>
        <Link href="/admin/sca">
          <Card className="h-full hover:shadow-md transition-shadow cursor-pointer">
            <CardHeader>
              <CardTitle>Manage SCA Cases</CardTitle>
              <CardDescription>
                Add mock cases with patient info, scenarios, and model answers
              </CardDescription>
            </CardHeader>
          </Card>
        </Link>
        <Link href="/admin/akt">
          <Card className="h-full hover:shadow-md transition-shadow cursor-pointer">
            <CardHeader>
              <CardTitle>Manage AKT Questions</CardTitle>
              <CardDescription>
                Create MCQ questions with explanations and guideline references
              </CardDescription>
            </CardHeader>
          </Card>
        </Link>
      </div>
    </div>
  )
}
