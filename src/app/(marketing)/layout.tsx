import Link from 'next/link'
import { Button } from '@/components/ui/button'

export default function MarketingLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <div className="min-h-screen flex flex-col">
      {/* Header */}
      <header className="sticky top-0 z-50 w-full border-b bg-white/95 backdrop-blur supports-[backdrop-filter]:bg-white/60">
        <div className="mx-auto flex h-16 max-w-7xl items-center justify-between px-6 lg:px-8">
          <Link href="/" className="flex items-center gap-3">
            <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-primary shadow-sm">
              <span className="text-lg font-bold text-primary-foreground">OC</span>
            </div>
            <span className="text-xl font-bold text-foreground">OnCallPrep</span>
          </Link>

          <nav className="hidden md:flex items-center gap-6">
            <Link
              href="/explore"
              className="text-sm font-medium text-foreground/70 transition-colors hover:text-foreground"
            >
              Explore
            </Link>
            <Link
              href="/pricing"
              className="text-sm font-medium text-foreground/70 transition-colors hover:text-foreground"
            >
              Pricing
            </Link>
            <Link
              href="/about"
              className="text-sm font-medium text-foreground/70 transition-colors hover:text-foreground"
            >
              About
            </Link>
          </nav>

          <div className="flex items-center gap-4">
            <Link href="/login">
              <Button variant="ghost" size="sm">
                Sign in
              </Button>
            </Link>
            <Link href="/signup">
              <Button size="sm">
                Get Started
              </Button>
            </Link>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="flex-1">
        {children}
      </main>

      {/* Footer */}
      <footer className="border-t bg-slate-50">
        <div className="mx-auto max-w-7xl px-6 py-12 lg:px-8">
          <div className="grid grid-cols-1 gap-8 md:grid-cols-4">
            {/* Brand */}
            <div className="md:col-span-2">
              <div className="flex items-center gap-3">
                <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-primary">
                  <span className="text-lg font-bold text-primary-foreground">OC</span>
                </div>
                <span className="text-xl font-bold text-foreground">OnCallPrep</span>
              </div>
              <p className="mt-4 max-w-sm text-sm leading-6 text-foreground/70">
                Your complete companion for GP training success. Built by trainees, for trainees.
              </p>
            </div>

            {/* Features Links */}
            <div>
              <h3 className="text-sm font-semibold text-foreground">Resources</h3>
              <ul className="mt-4 space-y-3">
                <li>
                  <Link href="/explore" className="text-sm text-foreground/70 transition-colors hover:text-foreground">
                    Explore All
                  </Link>
                </li>
                <li>
                  <Link href="/akt-preview" className="text-sm text-foreground/70 transition-colors hover:text-foreground">
                    AKT Preparation
                  </Link>
                </li>
                <li>
                  <Link href="/sca-preview" className="text-sm text-foreground/70 transition-colors hover:text-foreground">
                    SCA Preparation
                  </Link>
                </li>
                <li>
                  <Link href="/portfolio-preview" className="text-sm text-foreground/70 transition-colors hover:text-foreground">
                    Portfolio Guidance
                  </Link>
                </li>
              </ul>
            </div>

            {/* Company Links */}
            <div>
              <h3 className="text-sm font-semibold text-foreground">Company</h3>
              <ul className="mt-4 space-y-3">
                <li>
                  <Link href="/about" className="text-sm text-foreground/70 transition-colors hover:text-foreground">
                    About Us
                  </Link>
                </li>
                <li>
                  <Link href="/pricing" className="text-sm text-foreground/70 transition-colors hover:text-foreground">
                    Pricing
                  </Link>
                </li>
                <li>
                  <Link href="/login" className="text-sm text-foreground/70 transition-colors hover:text-foreground">
                    Sign In
                  </Link>
                </li>
              </ul>
            </div>
          </div>

          <div className="mt-8 border-t pt-8">
            <p className="text-center text-xs text-foreground/60">
              © 2025 OnCallPrep. All rights reserved.
            </p>
          </div>
        </div>
      </footer>
    </div>
  )
}
