import Link from 'next/link'
import { createClient } from '@/lib/supabase/server'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { SCAExamOverview } from './exam-overview'

const caseTypes = [
  { id: 'priming', name: '3-Min Priming', time: '180s', description: 'Prepare your consultation approach' },
  { id: 'full', name: 'Full Cases', time: '12 min', description: 'Complete consultation scenarios with actor scripts' },
]

export default async function SCAPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: cases } = await supabase
    .from('sca_cases')
    .select('*')
    .eq('published', true)
    .order('created_at', { ascending: false })

  // Handle case where user might be null
  const userId = user?.id
  
  const { data: progress } = userId ? await supabase
    .from('user_progress')
    .select('*')
    .eq('user_id', userId)
    .eq('content_type', 'sca') : { data: null }

  const { data: profile } = userId ? await supabase
    .from('user_profiles')
    .select('subscription_tier')
    .eq('id', userId)
    .single() : { data: null }

  const isPro = profile?.subscription_tier === 'pro'
  const attemptedIds = new Set(progress?.map(p => p.content_id))

  const getCasesByType = (type: string) => cases?.filter(c => c.case_type === type) || []

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold">SCA Preparation</h1>
        <p className="text-muted-foreground mt-1">
          Practice timed consultation exercises and mock cases
        </p>
      </div>

      {/* Exam Overview */}
      <SCAExamOverview />

      {/* Stats */}
      <div className="grid md:grid-cols-3 gap-4">
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>Cases Attempted</CardDescription>
            <CardTitle className="text-2xl">{progress?.length || 0}</CardTitle>
          </CardHeader>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>Available Cases</CardDescription>
            <CardTitle className="text-2xl">{cases?.filter(c => !c.is_pro || isPro).length || 0}</CardTitle>
          </CardHeader>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>Your Plan</CardDescription>
            <CardTitle className="text-2xl">{isPro ? 'Pro' : 'Free'}</CardTitle>
          </CardHeader>
        </Card>
      </div>

      {/* Practice Tools */}
      <div>
        <h2 className="text-xl font-semibold mb-4">Practice Tools</h2>
        <Link href="/sca/diagnosis-practice">
          <Card className="hover:shadow-lg transition-shadow cursor-pointer border-2 hover:border-primary/50 bg-primary/5">
            <CardHeader>
              <div className="flex items-start justify-between">
                <div>
                  <CardTitle className="text-lg flex items-center gap-2">
                    <span className="text-2xl">⏱️</span>
                    2-Minute Diagnosis Practice
                  </CardTitle>
                  <CardDescription className="mt-2">
                    Practice explaining 56 common diagnoses clearly and concisely – a key SCA skill
                  </CardDescription>
                </div>
                <Badge>120s</Badge>
              </div>
            </CardHeader>
            <CardContent>
              <p className="text-sm text-muted-foreground">
                Name it → Explain it → Link it → Plan it → Safety net it
              </p>
            </CardContent>
          </Card>
        </Link>
      </div>

      {/* Case Types */}
      {caseTypes.map((type) => {
        const typeCases = getCasesByType(type.id)
        const accessibleCases = typeCases.filter(c => !c.is_pro || isPro)
        const lockedCount = typeCases.length - accessibleCases.length

        return (
          <div key={type.id}>
            <div className="flex items-center justify-between mb-4">
              <div>
                <h2 className="text-xl font-semibold">{type.name}</h2>
                <p className="text-sm text-muted-foreground">{type.description}</p>
              </div>
              <Badge variant="outline">{type.time}</Badge>
            </div>

            {accessibleCases.length > 0 ? (
              <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
                {accessibleCases.map((c) => (
                  <Link key={c.id} href={`/sca/${c.id}`}>
                    <Card className="h-full hover:shadow-md transition-shadow cursor-pointer">
                      <CardHeader>
                        <div className="flex items-start justify-between">
                          <CardTitle className="text-base">{c.title}</CardTitle>
                          <div className="flex gap-1">
                            <Badge variant={
                              c.difficulty === 'easy' ? 'secondary' :
                              c.difficulty === 'hard' ? 'destructive' : 'default'
                            }>
                              {c.difficulty}
                            </Badge>
                            {attemptedIds.has(c.id) && (
                              <Badge variant="outline">Attempted</Badge>
                            )}
                          </div>
                        </div>
                      </CardHeader>
                      <CardContent>
                        <p className="text-sm text-muted-foreground line-clamp-2">
                          {c.scenario.substring(0, 100)}...
                        </p>
                      </CardContent>
                    </Card>
                  </Link>
                ))}
              </div>
            ) : (
              <Card>
                <CardContent className="py-6 text-center text-muted-foreground">
                  No cases available in this category yet.
                </CardContent>
              </Card>
            )}

            {lockedCount > 0 && (
              <div className="mt-4">
                <Card className="bg-muted/50">
                  <CardContent className="py-4 flex items-center justify-between">
                    <p className="text-sm text-muted-foreground">
                      +{lockedCount} more {type.name.toLowerCase()} cases available with Pro
                    </p>
                    <Link href="/pricing">
                      <Button size="sm" variant="outline">Upgrade</Button>
                    </Link>
                  </CardContent>
                </Card>
              </div>
            )}
          </div>
        )
      })}
    </div>
  )
}
