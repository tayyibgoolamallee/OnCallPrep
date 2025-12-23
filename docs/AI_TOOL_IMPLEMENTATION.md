# Implementing an AI Reflection Assistant Tool

## Overview
This document outlines how to embed an AI-powered reflection assistant directly on the OnCallPrep website.

## Architecture Options

### Option 1: Vercel Serverless Functions (Recommended)
**Best for:** Simple, cost-effective, works with your existing Vercel deployment

**How it works:**
- Create API routes in `/api` folder
- Functions run serverless (only when called)
- Secure API keys stored as environment variables
- No additional infrastructure needed

**Setup:**
1. Create `/api/reflect` folder in your project
2. Add `index.js` with OpenAI API integration
3. Add OpenAI API key to Vercel environment variables
4. Frontend calls `/api/reflect` endpoint

**Costs:**
- Vercel: Free tier includes 100GB-hours/month
- OpenAI: ~$0.01-0.03 per reflection (depending on length)

### Option 2: Supabase Edge Functions
**Best for:** If you want to integrate with Supabase user management

**How it works:**
- Use Supabase Edge Functions (Deno runtime)
- Can check user authentication
- Rate limiting per user
- Store usage in Supabase database

**Setup:**
1. Create Supabase Edge Function
2. Deploy via Supabase CLI
3. Call from frontend with user auth

**Costs:**
- Supabase: Free tier includes 500K function invocations/month
- OpenAI: Same as above

### Option 3: Direct Client-Side (Not Recommended)
**Limitations:**
- API keys exposed in frontend (security risk)
- No rate limiting
- Higher costs (can't optimize)
- Not suitable for production

## Implementation Steps

### Step 1: Get OpenAI API Key
1. Sign up at https://platform.openai.com
2. Create API key
3. Add credits to account
4. Store key securely (never commit to git)

### Step 2: Create Backend Function

**For Vercel (recommended):**
Create `/api/reflect/index.js`:

```javascript
import OpenAI from 'openai';

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { reflection } = req.body;

  if (!reflection) {
    return res.status(400).json({ error: 'Reflection text required' });
  }

  try {
    const prompt = `You are an assistant helping a GP trainee improve their portfolio reflection. 
    
IMPORTANT GUIDELINES:
- The reflection must be based on a REAL patient encounter
- Help structure the reflection using established frameworks
- Suggest competency links (at least 3)
- Improve clarity and professionalism
- DO NOT create fictional cases or content
- Focus on helping the trainee express their own learning

Reflection to review:
${reflection}

Please provide:
1. Structured version using Gibbs Reflective Cycle
2. Suggested competency links (minimum 3)
3. Areas for improvement
4. Strengths of the reflection`;

    const completion = await openai.chat.completions.create({
      model: "gpt-4o-mini", // Cost-effective option
      messages: [
        {
          role: "system",
          content: "You are a helpful assistant for GP trainees writing portfolio reflections. Always emphasize that reflections must be based on real patient encounters."
        },
        {
          role: "user",
          content: prompt
        }
      ],
      temperature: 0.7,
      max_tokens: 1500
    });

    const response = completion.choices[0].message.content;

    res.status(200).json({ 
      suggestions: response,
      model: "gpt-4o-mini"
    });

  } catch (error) {
    console.error('OpenAI API error:', error);
    res.status(500).json({ error: 'Failed to process reflection' });
  }
}
```

### Step 3: Add Environment Variable
In Vercel dashboard:
1. Go to Project Settings → Environment Variables
2. Add `OPENAI_API_KEY` with your key
3. Redeploy

### Step 4: Create Frontend Interface

Add to `ai-reflections.html`:

```html
<!-- AI Reflection Tool -->
<div class="content-section" id="ai-tool-section">
    <h2>Try the AI Reflection Assistant</h2>
    <p>Enter your reflection below. The AI will help structure it and suggest improvements.</p>
    
    <div style="margin-top: var(--space-lg);">
        <label for="reflection-input" style="display: block; margin-bottom: var(--space-sm); font-weight: 600;">
            Your Reflection (based on a real patient encounter):
        </label>
        <textarea 
            id="reflection-input" 
            rows="10" 
            style="width: 100%; padding: var(--space-md); border: 2px solid var(--color-gray-300); border-radius: var(--radius-lg); font-family: inherit;"
            placeholder="Describe your patient encounter and your reflection..."
        ></textarea>
        
        <button 
            id="analyze-btn" 
            class="btn btn-primary" 
            style="margin-top: var(--space-md);"
            onclick="analyzeReflection()"
        >
            Get AI Suggestions
        </button>
        
        <div id="loading" style="display: none; margin-top: var(--space-md);">
            <p>Analyzing your reflection...</p>
        </div>
        
        <div id="results" style="display: none; margin-top: var(--space-lg); padding: var(--space-lg); background: var(--color-primary-50); border-radius: var(--radius-xl); border: 2px solid var(--color-primary-200);">
            <h3>AI Suggestions</h3>
            <div id="suggestions-content"></div>
        </div>
    </div>
</div>

<script>
async function analyzeReflection() {
    const input = document.getElementById('reflection-input').value;
    const loading = document.getElementById('loading');
    const results = document.getElementById('results');
    const suggestionsContent = document.getElementById('suggestions-content');
    const analyzeBtn = document.getElementById('analyze-btn');
    
    if (!input.trim()) {
        alert('Please enter your reflection first.');
        return;
    }
    
    // Show loading
    loading.style.display = 'block';
    results.style.display = 'none';
    analyzeBtn.disabled = true;
    
    try {
        const response = await fetch('/api/reflect', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ reflection: input })
        });
        
        if (!response.ok) {
            throw new Error('Failed to analyze reflection');
        }
        
        const data = await response.json();
        
        // Display results
        suggestionsContent.innerHTML = `<div style="white-space: pre-line; line-height: 1.8;">${data.suggestions}</div>`;
        results.style.display = 'block';
        results.scrollIntoView({ behavior: 'smooth' });
        
    } catch (error) {
        console.error('Error:', error);
        alert('Failed to analyze reflection. Please try again.');
    } finally {
        loading.style.display = 'none';
        analyzeBtn.disabled = false;
    }
}
</script>
```

## Security Considerations

1. **API Key Protection:**
   - Never expose API keys in frontend code
   - Always use environment variables
   - Use serverless functions as proxy

2. **Rate Limiting:**
   - Implement per-user rate limits
   - Track usage in database
   - Consider Pro feature limits

3. **Input Validation:**
   - Validate reflection length
   - Sanitize user input
   - Prevent abuse

4. **Cost Management:**
   - Set usage limits per user
   - Monitor API costs
   - Consider making it a Pro feature

## Cost Estimates

**OpenAI Pricing (as of 2024):**
- GPT-4o-mini: $0.15 per 1M input tokens, $0.60 per 1M output tokens
- Average reflection: ~500 input tokens, ~1000 output tokens
- Cost per reflection: ~$0.00075 (less than 1 cent)

**Monthly estimates (1000 users, 2 reflections each):**
- 2000 reflections × $0.00075 = $1.50/month
- Very affordable for MVP

## Making it a Pro Feature

You could:
1. Limit free users to 3 AI reflections/month
2. Unlimited for Pro users
3. Track usage in Supabase
4. Show usage counter in UI

## Next Steps

1. **MVP Approach:**
   - Start with Vercel serverless function
   - Basic prompt for structuring reflections
   - Free for all users initially

2. **Enhanced Version:**
   - Add user authentication check
   - Implement rate limiting
   - Store usage in Supabase
   - Make it Pro feature

3. **Advanced Features:**
   - Multiple reflection frameworks
   - Competency auto-linking
   - Export to e-portfolio format
   - Save drafts

Would you like me to implement the basic version now?

