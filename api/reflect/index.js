/**
 * Vercel Serverless Function for AI Reflection Assistant
 * 
 * This function acts as a secure proxy to OpenAI API
 * API keys are stored in Vercel environment variables
 */

export default async function handler(req, res) {
  // Only allow POST requests
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  // Get reflection text from request
  const { reflection } = req.body;

  if (!reflection || typeof reflection !== 'string' || reflection.trim().length === 0) {
    return res.status(400).json({ error: 'Reflection text is required' });
  }

  // Validate length (prevent abuse)
  if (reflection.length > 5000) {
    return res.status(400).json({ error: 'Reflection is too long (max 5000 characters)' });
  }

  // Check for OpenAI API key
  const apiKey = process.env.OPENAI_API_KEY;
  if (!apiKey) {
    console.error('OPENAI_API_KEY not configured');
    return res.status(500).json({ error: 'AI service not configured. Please contact support.' });
  }

  try {
    // Import OpenAI SDK dynamically (for serverless)
    const OpenAI = (await import('openai')).default;
    
    const openai = new OpenAI({
      apiKey: apiKey,
    });

    // Create prompt that emphasizes RCGP compliance
    const systemPrompt = `You are an assistant helping a GP trainee improve their portfolio reflection for the RCGP e-portfolio.

CRITICAL GUIDELINES:
1. The reflection MUST be based on a REAL patient encounter that the trainee personally experienced
2. Help structure the reflection using established frameworks (Gibbs, Rolfe, or Borton)
3. Suggest at least 3 competency links from the GP curriculum
4. Improve clarity, professionalism, and demonstrate learning
5. DO NOT create fictional cases, patient details, or content
6. Focus on helping the trainee express their own authentic learning and insights
7. Emphasize that the reflection must be their own work - you are a drafting aid only

Your response should include:
1. A structured version of their reflection using a reflection framework
2. Suggested competency links (minimum 3, with brief explanations)
3. Areas for improvement (clarity, depth, learning demonstration)
4. Strengths of the reflection
5. A reminder that this is a drafting aid and the final reflection must be their own authentic work`;

    const userPrompt = `Please review and help improve this portfolio reflection:

${reflection}

Provide structured feedback and suggestions as outlined in the guidelines.`;

    // Call OpenAI API
    const completion = await openai.chat.completions.create({
      model: "gpt-4o-mini", // Cost-effective model (~$0.00075 per reflection)
      messages: [
        {
          role: "system",
          content: systemPrompt
        },
        {
          role: "user",
          content: userPrompt
        }
      ],
      temperature: 0.7, // Balanced creativity and consistency
      max_tokens: 2000, // Sufficient for detailed feedback
    });

    const suggestions = completion.choices[0].message.content;

    // Return suggestions
    res.status(200).json({ 
      suggestions: suggestions,
      model: "gpt-4o-mini",
      tokens_used: completion.usage?.total_tokens || 0
    });

  } catch (error) {
    console.error('OpenAI API error:', error);
    
    // Handle specific OpenAI errors
    if (error.response) {
      const status = error.response.status;
      const message = error.response.data?.error?.message || 'OpenAI API error';
      
      if (status === 401) {
        return res.status(500).json({ error: 'AI service authentication failed. Please contact support.' });
      } else if (status === 429) {
        return res.status(429).json({ error: 'AI service is currently busy. Please try again in a moment.' });
      } else if (status === 500) {
        return res.status(500).json({ error: 'AI service error. Please try again later.' });
      }
      
      return res.status(500).json({ error: `AI service error: ${message}` });
    }
    
    // Generic error
    return res.status(500).json({ error: 'Failed to process reflection. Please try again.' });
  }
}

