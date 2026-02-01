import { createClient } from '@/lib/supabase/server'
import { NextResponse } from 'next/server'

/**
 * GET: Return another user's email only if they have opted in to share with study buddies.
 * No message content is stored – contact is direct (mailto:) between users.
 */
export async function GET(
  _request: Request,
  { params }: { params: Promise<{ userId: string }> }
) {
  const { userId } = await params
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }
  const { data: email, error } = await supabase.rpc('get_contact_email_for_study_buddy', {
    target_user_id: userId,
  })
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }
  if (email == null || email === '') {
    return NextResponse.json({ error: 'Contact not available' }, { status: 404 })
  }
  return NextResponse.json({ email: email as string })
}
