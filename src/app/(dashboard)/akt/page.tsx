import Link from 'next/link'
import { createClient } from '@/lib/supabase/server'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Progress } from '@/components/ui/progress'
import { AKTExamOverview } from './exam-overview'

export default async function AKTPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: questions } = await supabase
    .from('akt_questions')
    .select('*')
    .eq('published', true)

  // Handle case where user might be null
  const userId = user?.id
  
  const { data: progress } = userId ? await supabase
    .from('user_progress')
    .select('*')
    .eq('user_id', userId)
    .eq('content_type', 'akt') : { data: null }

  const { data: profile } = userId ? await supabase
    .from('user_profiles')
    .select('subscription_tier')
    .eq('id', userId)
    .single() : { data: null }

  const isPro = profile?.subscription_tier === 'pro'

  // Ensure all questions have valid id and filter by access
  const accessibleQuestions = questions?.filter(q => q && q.id && (!q.is_pro || isPro)) || []
  const answeredIds = new Set(progress?.map(p => p.content_id))
  const correctAnswers = progress?.filter(p => p.score === 1).length || 0
  const totalAnswered = progress?.length || 0
  const accuracy = totalAnswered > 0 ? Math.round((correctAnswers / totalAnswered) * 100) : 0

  // Filter out undefined/null topics to prevent runtime errors
  const topics = [...new Set(questions?.map(q => q.topic).filter((t): t is string => !!t) || [])]
  const getTopicStats = (topic: string) => {
    const topicQuestions = accessibleQuestions.filter(q => q.topic === topic)
    const answered = progress?.filter(p =>
      topicQuestions.some(q => q.id === p.content_id)
    ) || []
    const correct = answered.filter(p => p.score === 1).length
    return {
      total: topicQuestions.length,
      answered: answered.length,
      correct,
      accuracy: answered.length > 0 ? Math.round((correct / answered.length) * 100) : 0
    }
  }

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold">AKT Question Bank</h1>
        <p className="text-muted-foreground mt-1">
          Practice with guideline-referenced questions
        </p>
      </div>

      {/* Exam Overview */}
      <AKTExamOverview />

      {/* Stats */}
      <div className="grid md:grid-cols-4 gap-4">
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>Questions Answered</CardDescription>
            <CardTitle className="text-2xl">{totalAnswered}</CardTitle>
          </CardHeader>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>Correct Answers</CardDescription>
            <CardTitle className="text-2xl">{correctAnswers}</CardTitle>
          </CardHeader>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>Accuracy</CardDescription>
            <CardTitle className="text-2xl">{accuracy}%</CardTitle>
          </CardHeader>
          <CardContent>
            <Progress value={accuracy} className="h-2" />
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardDescription>Available Questions</CardDescription>
            <CardTitle className="text-2xl">{accessibleQuestions.length}</CardTitle>
          </CardHeader>
        </Card>
      </div>

      {/* Practice Button */}
      <Card className="bg-primary/5 border-primary/20">
        <CardContent className="py-6 flex items-center justify-between">
          <div>
            <h3 className="font-semibold">Start Practice Session</h3>
            <p className="text-sm text-muted-foreground">
              Answer random questions from your available pool
            </p>
          </div>
          <Link href="/akt/practice">
            <Button size="lg">Start Practice</Button>
          </Link>
        </CardContent>
      </Card>

      {/* Topics */}
      <div>
        <h2 className="text-xl font-semibold mb-4">Topics</h2>
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
          {topics.map((topic) => {
            const stats = getTopicStats(topic)
            return (
              <Card key={topic}>
                <CardHeader className="pb-2">
                  <div className="flex items-center justify-between">
                    <CardTitle className="text-base">{topic}</CardTitle>
                    <Badge variant="secondary">
                      {stats.answered}/{stats.total}
                    </Badge>
                  </div>
                </CardHeader>
                <CardContent>
                  <div className="space-y-2">
                    <Progress value={stats.total > 0 ? (stats.answered / stats.total) * 100 : 0} className="h-2" />
                    <p className="text-xs text-muted-foreground">
                      {stats.accuracy}% accuracy
                    </p>
                  </div>
                </CardContent>
              </Card>
            )
          })}
        </div>
      </div>

      {!isPro && (
        <Card className="bg-muted/50">
          <CardContent className="py-6 flex items-center justify-between">
            <div>
              <h3 className="font-semibold">Unlock 500+ questions</h3>
              <p className="text-sm text-muted-foreground">
                Get full access to our comprehensive question bank with detailed explanations
              </p>
            </div>
            <Link href="/pricing">
              <Button>Upgrade to Pro</Button>
            </Link>
          </CardContent>
        </Card>
      )}
    </div>
  )
}
