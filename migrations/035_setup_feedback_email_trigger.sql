-- Migration: Setup Email Trigger for Feedback
-- This creates a trigger that calls the API route when feedback is submitted
-- You'll need to configure the webhook URL in Supabase

-- Function to send feedback notification (via webhook/API)
CREATE OR REPLACE FUNCTION notify_feedback_submitted()
RETURNS TRIGGER AS $$
BEGIN
  -- Call your API endpoint (configure webhook in Supabase Dashboard)
  -- This is a placeholder - you'll need to set up the actual webhook
  PERFORM
    net.http_post(
      url := 'https://your-domain.com/api/feedback/email',
      headers := '{"Content-Type": "application/json"}'::jsonb,
      body := jsonb_build_object(
        'feedback_id', NEW.id,
        'question_id', NEW.question_id,
        'sentiment', NEW.sentiment,
        'topic', NEW.topic,
        'difficulty', NEW.difficulty
      )
    );
  
  RETURN NEW;
EXCEPTION
  WHEN OTHERS THEN
    -- Don't fail the insert if webhook fails
    RAISE WARNING 'Failed to send feedback notification: %', SQLERRM;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger
DROP TRIGGER IF EXISTS on_feedback_submitted ON akt_question_feedback;
CREATE TRIGGER on_feedback_submitted
  AFTER INSERT ON akt_question_feedback
  FOR EACH ROW
  EXECUTE FUNCTION notify_feedback_submitted();

-- Note: For Supabase, you may prefer to use Edge Functions or Database Webhooks
-- instead of this approach. See Supabase documentation for best practices.
