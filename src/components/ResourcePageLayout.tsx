import { ReactNode } from 'react'
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'

interface ResourcePageLayoutProps {
  title: string
  description: string
  children: ReactNode
}

export default function ResourcePageLayout({ title, description, children }: ResourcePageLayoutProps) {
  return (
    <div className="min-h-screen bg-gradient-to-b from-slate-50 to-slate-100 dark:from-slate-950 dark:to-slate-900 py-12">
      <div className="max-w-3xl mx-auto px-4 space-y-8">
        {/* Centered Header */}
        <div className="text-center space-y-4">
          <h1 className="text-4xl font-bold text-slate-900 dark:text-slate-100">{title}</h1>
          <p className="text-lg text-slate-600 dark:text-slate-400 max-w-2xl mx-auto">
            {description}
          </p>
        </div>

        {/* Content */}
        <div className="space-y-6">
          {children}
        </div>
      </div>
    </div>
  )
}

interface ResourceSectionProps {
  title: string
  description?: string
  children: ReactNode
  variant?: 'primary' | 'secondary'
}

export function ResourceSection({ title, description, children, variant = 'primary' }: ResourceSectionProps) {
  const isPrimary = variant === 'primary'
  
  return (
    <Card className={`border-2 ${isPrimary ? 'border-teal-200 dark:border-teal-800 bg-white dark:bg-slate-900' : 'border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-900'}`}>
      <CardHeader className={isPrimary ? 'bg-teal-600 dark:bg-teal-800 text-white rounded-t-lg' : 'bg-slate-700 dark:bg-slate-800 text-white rounded-t-lg'}>
        <CardTitle className="text-xl">{title}</CardTitle>
        {description && (
          <CardDescription className={isPrimary ? 'text-teal-100' : 'text-slate-300'}>
            {description}
          </CardDescription>
        )}
      </CardHeader>
      <CardContent className="pt-6">
        {children}
      </CardContent>
    </Card>
  )
}

interface InfoBoxProps {
  children: ReactNode
  variant?: 'info' | 'warning' | 'tip'
}

export function InfoBox({ children, variant = 'info' }: InfoBoxProps) {
  const variants = {
    info: 'bg-teal-50 dark:bg-teal-950/30 border-teal-200 dark:border-teal-800',
    warning: 'bg-amber-50 dark:bg-amber-950/30 border-amber-200 dark:border-amber-800',
    tip: 'bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700'
  }

  return (
    <div className={`p-4 rounded-lg border-l-4 ${variants[variant]}`}>
      {children}
    </div>
  )
}

interface ChunkProps {
  title?: string
  children: ReactNode
}

export function Chunk({ title, children }: ChunkProps) {
  return (
    <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700 space-y-2">
      {title && (
        <h4 className="font-semibold text-teal-700 dark:text-teal-400">{title}</h4>
      )}
      <div className="text-sm text-slate-600 dark:text-slate-400">
        {children}
      </div>
    </div>
  )
}
