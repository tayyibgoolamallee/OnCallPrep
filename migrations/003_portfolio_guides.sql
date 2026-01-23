-- Migration: Portfolio Guides Initial Content
-- Run this in Supabase SQL Editor
-- Essential portfolio guidance for ST1, ST2, and ST3 trainees

-- First, clear existing guides if re-running
DELETE FROM portfolio_guides;

-- Insert portfolio guides
INSERT INTO portfolio_guides (stage, category, title, content, sort_order, is_pro, published)
VALUES

-- ==========================================
-- ST1 GUIDES
-- ==========================================

-- ST1 - Getting Started (Free)
('st1', 'getting-started', 'Welcome to ST1 - Your First Year', 
'# Welcome to ST1

Congratulations on starting your GP specialty training! ST1 is your foundation year where you''ll begin building the clinical and professional skills needed for independent practice.

## What to Expect

During ST1, you''ll typically complete:
- **Hospital posts** (usually 6-month rotations in relevant specialties)
- Regular **educational supervision** meetings
- Initial **workplace-based assessments** (WPBAs)
- Begin building your **ePortfolio**

## Key Priorities for ST1

1. **Get organised early** - Set up your ePortfolio and understand the requirements
2. **Build relationships** - Connect with your educational supervisor and training programme
3. **Start reflections** - Document learning from day one
4. **Complete WPBAs** - Aim for regular assessments throughout each post

## Common ST1 Concerns

> "I feel like I don''t know enough"

This is completely normal! ST1 is about building foundations. Focus on being safe, asking for help when needed, and learning from every patient encounter.

> "The portfolio seems overwhelming"

Break it down into manageable chunks. Focus on a few WPBAs per month rather than trying to do everything at once.', 
1, false, true),

-- ST1 - Portfolio Requirements (Free)
('st1', 'requirements', 'ST1 Portfolio Requirements Checklist', 
'# ST1 Portfolio Requirements

This checklist covers the essential portfolio requirements for ST1. Requirements may vary slightly between deaneries, so always confirm with your local programme.

## Mandatory Components

### Workplace-Based Assessments (WPBAs)
- [ ] **Mini-CEX** (Clinical Evaluation Exercise) - minimum 6 per year
- [ ] **CbD** (Case-based Discussion) - minimum 6 per year
- [ ] **DOPs** (Direct Observation of Procedures) - as appropriate
- [ ] **PSQ** (Patient Satisfaction Questionnaire) - typically 1 per year

### Educational Meetings
- [ ] Regular Educational Supervisor meetings (monthly recommended)
- [ ] Documentation of learning discussions
- [ ] Progress review at each ARCP

### Reflective Entries
- [ ] Significant Event Analysis (SEA) - minimum 2 per year
- [ ] Learning log entries documenting key experiences
- [ ] Reflections on feedback received

### Courses and Certificates
- [ ] BLS/ILS certification (must be in date)
- [ ] Safeguarding training (Level 2 minimum)

## Tips for Success

1. **Little and often** - Regular portfolio entries are easier than trying to catch up
2. **Quality over quantity** - Thoughtful reflections matter more than numbers
3. **Get feedback** - Discuss entries with your supervisor before finalising
4. **Use the curriculum** - Map your learning to competency areas', 
2, false, true),

-- ST1 - Reflective Writing Guide (Free)
('st1', 'skills', 'How to Write Good Reflections', 
'# Writing Effective Reflections

Reflective practice is at the heart of GP training. Good reflections demonstrate learning and professional development.

## The Reflection Cycle

Most reflection frameworks follow similar principles:

1. **Description** - What happened?
2. **Feelings** - How did you feel?
3. **Evaluation** - What was good and bad?
4. **Analysis** - What sense can you make of it?
5. **Conclusion** - What else could you have done?
6. **Action plan** - What will you do differently?

## Common Pitfalls

❌ **Too descriptive** - Just telling the story without analysis
❌ **Too brief** - Not exploring the learning in depth
❌ **Missing the "so what"** - Not explaining why this matters for future practice
❌ **Forgetting patient perspective** - Only focusing on your actions

## Good Reflection Structure

### Opening
Set the scene briefly (1-2 sentences). What was the clinical context?

### What happened
Describe the key events. What did you observe, think, and do?

### Your feelings
Be honest about emotions - uncertainty, pride, frustration, confidence

### Analysis
This is the crucial part. Ask yourself:
- What does this tell me about my practice?
- What assumptions did I make?
- What would someone else have done differently?
- What does the evidence/guidelines say?

### Learning and action
- What specific learning will you take forward?
- What will you do differently next time?
- What further learning needs has this identified?

## Example Opening Lines

✅ "During a busy clinic, I saw a patient who challenged my communication skills..."
✅ "This case made me reflect on my approach to diagnostic uncertainty..."
❌ "Today I saw a 45-year-old man with chest pain..." (too clinical, not reflective)', 
3, false, true),

-- ST1 - WPBA Guide (Free)
('st1', 'assessments', 'Guide to Workplace-Based Assessments', 
'# Workplace-Based Assessments (WPBAs)

WPBAs are formative assessments that help you develop clinical skills and build evidence for your portfolio.

## Types of WPBAs

### Mini-CEX (Clinical Evaluation Exercise)
- **What**: Observation of a patient encounter
- **Duration**: 15-20 minutes consultation + feedback
- **Focus**: History, examination, communication, clinical reasoning
- **Tips**: Choose a variety of cases (different ages, problems, settings)

### Case-based Discussion (CbD)
- **What**: Discussion of your clinical reasoning for a case
- **Duration**: 20-30 minutes
- **Focus**: Decision-making, evidence base, patient safety
- **Tips**: Bring cases where you had to make decisions, not just "interesting" cases

### DOPs (Direct Observation of Procedures)
- **What**: Observation of practical skills
- **Duration**: Varies by procedure
- **Focus**: Technical skill, communication, safety
- **Examples**: Venepuncture, ECG, joint injection, minor surgery

## Getting Good Feedback

### Before the assessment
- Brief your assessor on what you''d like feedback on
- Choose an appropriate case (not too simple, not too complex)
- Ensure there''s time for proper discussion

### During feedback
- Listen actively without being defensive
- Ask clarifying questions
- Focus on specific, actionable points

### After the assessment
- Document the feedback promptly
- Reflect on how you''ll apply the learning
- Plan your next assessment to address development areas

## Common Mistakes

❌ Only doing assessments when things go well
❌ Leaving all assessments to the end of the post
❌ Choosing the same assessor repeatedly
❌ Not following up on feedback

✅ Aim for 1-2 WPBAs per month throughout the year', 
4, false, true),

-- ST1 - Consultation Models (Pro)
('st1', 'skills', 'Consultation Models Explained', 
'# Consultation Models for GP Training

Understanding consultation models helps structure your approach and provides frameworks for reflection and learning.

## Essential Models

### Calgary-Cambridge Model
The most comprehensive and widely used model.

**Key Components:**
1. Initiating the session
2. Gathering information
3. Physical examination
4. Explanation and planning
5. Closing the session

**Running through both:**
- Providing structure
- Building the relationship

*Best for: Detailed analysis of consultations, teaching, and comprehensive patient encounters*

### Neighbour''s Model ("The Inner Consultation")
**Five checkpoints:**
1. **Connecting** - Establish rapport
2. **Summarising** - Demonstrate understanding
3. **Handing over** - Agree the plan
4. **Safety netting** - Manage uncertainty
5. **Housekeeping** - Look after yourself

*Best for: Quick reference during consultations, managing uncertainty*

### Pendleton''s Rules
**Feedback structure:**
1. What the learner thinks they did well
2. What the observer thinks they did well
3. What could be done differently
4. Summary of learning points

*Best for: Giving and receiving feedback on consultations*

### Stott and Davis
**Four areas to consider:**
1. Management of presenting problem
2. Management of continuing problems
3. Modification of help-seeking behaviour
4. Opportunistic health promotion

*Best for: Making the most of every consultation opportunity*

## Applying Models in Practice

Different models suit different situations:
- **Complex patients**: Calgary-Cambridge for thoroughness
- **Time pressure**: Neighbour''s checkpoints
- **Health promotion**: Stott and Davis framework
- **Teaching**: Pendleton''s rules for feedback

## Reflecting on Consultations

When writing reflections, reference the model you used and analyse:
- Which parts went well?
- Which parts were challenging?
- What would the model suggest you do differently?
- What learning needs does this identify?', 
5, true, true),

-- ==========================================
-- ST2 GUIDES  
-- ==========================================

-- ST2 - Overview (Free)
('st2', 'getting-started', 'Welcome to ST2 - Building Independence', 
'# Welcome to ST2

ST2 marks the transition from foundation to consolidation. You''ll spend more time in general practice settings and begin taking on increased clinical responsibility.

## What Changes in ST2

### Clinical Setting
- More time in GP placements
- Beginning to see patients more independently
- Increasing complexity of presentations

### Portfolio Expectations
- Greater depth of reflection expected
- Building evidence across all curriculum areas
- Preparing for CSA examination

### Professional Development
- Developing your own clinical style
- Building management and organisational skills
- Starting to think about your career direction

## Key Priorities for ST2

1. **Maximise GP placement learning** - This is where you develop your generalist skills
2. **Prepare for CSA** - Start thinking about examination preparation
3. **Broaden your experience** - Seek out variety in presentations and settings
4. **Develop clinical independence** - Aim to manage more without immediate supervision

## Common ST2 Challenges

> "The breadth of general practice feels overwhelming"

Focus on safe, systematic approaches rather than trying to know everything. Develop your consultation skills and clinical reasoning.

> "I''m worried about the CSA"

Start early with case-based practice. The CSA tests what you do every day - good consultation skills and clinical reasoning.', 
1, false, true),

-- ST2 - CSA Preparation (Pro)
('st2', 'exams', 'CSA Preparation Guide', 
'# Simulated Consultation Assessment (SCA) Preparation

The SCA (formerly CSA) is the clinical examination for GP training. This guide covers essential preparation strategies.

## Understanding the Exam

### Format
- 12 cases in a single session
- Each case: 10 minutes total (typically 8-9 mins consultation + 1-2 mins to review next case)
- Mix of face-to-face and telephone/video consultations
- Cases cover the full curriculum

### Marking Domains
1. **Data Gathering, Technical and Assessment Skills**
2. **Clinical Management Skills**
3. **Interpersonal Skills**

Each case is marked across these domains. You need to demonstrate competence across all three.

## Preparation Strategy

### Timeline
- **6 months before**: Understand format, start observing consultations critically
- **3 months before**: Regular practice with peers, video review
- **1 month before**: Intensive practice, mock exams, refine approach
- **Final weeks**: Maintain confidence, don''t over-study

### Essential Skills

**Data Gathering**
- Systematic history taking
- Focused examination skills
- Appropriate investigation selection

**Clinical Management**
- Working diagnosis and differential
- Shared decision-making
- Safety-netting
- Appropriate follow-up

**Interpersonal Skills**
- Active listening
- Empathy and rapport
- Clear explanations
- Checking understanding

## Practice Techniques

### Peer Practice
- Form a study group (3-4 trainees ideal)
- Rotate roles: doctor, patient, observer
- Use real cases from your practice
- Video record and review

### 3-Minute Priming
Before each case, use 3 minutes to:
1. Read the information carefully
2. Identify likely differentials
3. Plan your opening questions
4. Consider what the examiner expects

### 2-Minute Diagnosis Practice
Rapid differential generation:
- Read a brief scenario
- Generate 3-5 differentials in 2 minutes
- Identify red flags
- Plan key questions', 
2, true, true),

-- ST2 - Complex Consultations (Pro)
('st2', 'skills', 'Managing Complex Consultations', 
'# Managing Complex Consultations

ST2 is when you start encountering more complexity in consultations. This guide helps you develop frameworks for managing challenging scenarios.

## Types of Complexity

### Clinical Complexity
- Multiple co-morbidities
- Diagnostic uncertainty
- Unusual presentations
- Medication interactions

### Psychosocial Complexity
- Mental health issues alongside physical problems
- Family/relationship difficulties
- Financial/housing problems
- Cultural considerations

### Communication Complexity
- Breaking bad news
- Managing conflict
- Health literacy challenges
- Third parties in consultations

## Frameworks for Complexity

### The "Golden Minute"
Start every complex consultation by letting the patient speak uninterrupted for 60-90 seconds. This:
- Reveals hidden agendas
- Builds rapport
- Saves time in the long run

### Prioritisation
When there are multiple problems:
1. **Safety first** - What could harm this patient today?
2. **Patient priorities** - What matters most to them?
3. **Quick wins** - What can be resolved now?
4. **Plan for later** - What needs a follow-up appointment?

### The ICE Framework (Ideas, Concerns, Expectations)
Essential for uncovering:
- What the patient thinks is wrong
- What they''re worried about
- What they hope you''ll do

## Time Management

Complex consultations often overrun. Strategies include:
- **Acknowledge complexity** - "There''s a lot to discuss today"
- **Negotiate focus** - "Which of these concerns is most pressing?"
- **Book follow-up** - "This needs more time than we have today"
- **Written information** - Resources for them to read later

## Self-Care

Complex consultations are draining. Remember:
- Debrief with colleagues after difficult cases
- Build in breaks where possible
- Recognise when you need supervision support
- Reflect constructively rather than ruminating', 
3, true, true),

-- ==========================================
-- ST3 GUIDES
-- ==========================================

-- ST3 - Overview (Free)
('st3', 'getting-started', 'Welcome to ST3 - Preparing for Independence', 
'# Welcome to ST3

ST3 is your final year of training. By the end, you''ll be ready to work as an independent GP. This is an exciting but intensive time.

## ST3 Objectives

### Clinical
- Managing the full breadth of general practice
- Working with minimal supervision
- Making complex decisions independently
- Developing special interests

### Professional
- Understanding practice organisation and management
- Financial and business awareness
- Leadership and teamwork skills
- Career planning

### Examinations
- Complete AKT if not already done
- Pass SCA/CSA examination
- Meet all portfolio requirements

## Key Priorities

1. **Complete examinations** - Plan your exam schedule early
2. **Fill portfolio gaps** - Review requirements and address weaknesses
3. **Develop independence** - Aim to manage most situations without help
4. **Plan your career** - Start thinking about your first post as a qualified GP

## The ARCP Process

Your ST3 ARCPs are crucial:
- **Mid-year review** - Check progress, identify gaps
- **Final ARCP** - Determines CCT (Certificate of Completion of Training)

Ensure all requirements are met before your final ARCP:
- All mandatory WPBAs completed
- Examinations passed
- Satisfactory ESR (Educational Supervisor Report)
- Out-of-hours experience documented', 
1, false, true),

-- ST3 - AKT Preparation (Pro)
('st3', 'exams', 'AKT Preparation Guide', 
'# Applied Knowledge Test (AKT) Preparation

The AKT tests your clinical knowledge and critical appraisal skills. This guide covers effective preparation strategies.

## Exam Structure

### Format
- 200 questions in 3 hours 10 minutes
- Computer-based, multiple choice
- Single best answer (SBA) format
- No negative marking

### Content Split
- **Clinical Medicine**: ~80%
- **Evidence-Based Practice**: ~10%
- **Organisational/Professional**: ~10%

## Preparation Strategy

### Timeline
- **6 months before**: Identify weak areas, start systematic revision
- **3 months before**: Regular question practice, focused study
- **1 month before**: Intensive question practice, mock exams
- **Final weeks**: Review weak areas, rest before exam

### Resources
**Guidelines**:
- NICE guidelines (essential)
- SIGN guidelines
- RCGP curriculum
- BNF

**Question Banks**:
- Use multiple sources
- Focus on explanation, not just answers
- Track your performance by topic

### Effective Revision

**Active Learning**
- Practice questions > passive reading
- Teach concepts to others
- Create summary notes/flashcards

**Spaced Repetition**
- Review material at increasing intervals
- Focus more on weak areas
- Don''t cram everything at the end

### Key Topics

High-yield areas (commonly tested):
- Cardiovascular (hypertension, AF, heart failure)
- Respiratory (asthma, COPD)
- Mental health (depression, anxiety)
- MSK (back pain, OA, RA)
- Dermatology (common presentations)
- Women''s health (contraception, menopause)
- Evidence-based medicine (statistics, study design)
- Practice organisation (QOF, prescribing, governance)

## Exam Day

- Arrive early, stay calm
- Read questions carefully
- Flag difficult questions to review
- Trust your preparation
- Don''t change answers without good reason', 
2, true, true),

-- ST3 - Career Planning (Free)
('st3', 'professional', 'Career Planning for New GPs', 
'# Planning Your Career as a Qualified GP

As ST3 draws to a close, you''ll need to make decisions about your career direction.

## Employment Options

### Salaried GP
- Regular salary with benefits
- Less financial risk
- Good work-life balance potential
- May have less autonomy

### GP Partner
- Share in practice profits
- Greater autonomy and influence
- Financial investment required
- More administrative responsibility

### Locum GP
- Flexibility in hours and location
- Higher day rate potential
- No long-term commitments
- Less stability, no employment benefits

### Portfolio Career
Many GPs combine roles:
- Clinical sessions in practice
- Teaching/education roles
- Medical education
- NHS management
- Special interest clinics
- Research

## Decision Factors

Consider:
- **Work-life balance** - What hours do you want?
- **Financial goals** - Income needs and stability preferences
- **Career aspirations** - Where do you want to be in 5-10 years?
- **Geography** - Where do you want to work?
- **Special interests** - Areas you want to develop

## Job Hunting Tips

### Timing
- Start looking 3-4 months before CCT
- Allow time for interviews and notice periods
- Consider starting as a locum to try different practices

### What to Look For
- Practice culture and values
- List size and demographics
- Support systems and mentoring
- Development opportunities
- Work-life balance
- Financial terms

### Interviews
Prepare to discuss:
- Your strengths and interests
- How you handle challenging situations
- Your approach to teamwork
- Your career goals
- Questions about the practice', 
3, false, true),

-- ST3 - Independent Practice (Pro)
('st3', 'skills', 'Preparing for Independent Practice', 
'# Preparing for Independent Practice

The transition from trainee to independent GP is significant. This guide helps you prepare for working without day-to-day supervision.

## Key Mindset Shifts

### From Trainee to Practitioner
- **Supervision**: Moving from regular case discussion to self-directed learning
- **Decision-making**: Full responsibility for your clinical decisions
- **Uncertainty**: Learning to manage without immediate backup
- **Self-reliance**: Building your own support networks

### Managing Uncertainty

As a qualified GP, you''ll face uncertainty daily. Strategies include:

**Structured Safety Netting**
- Clear criteria for return
- Specific timeframes
- What to do if things change
- Written information when helpful

**Using Colleagues**
- Informal "corridor consultations"
- Peer support groups
- Mentoring relationships
- MDT discussions

**Knowing Your Limits**
- When to refer
- When to seek advice
- When to say "I don''t know"

## Building Your Support Network

### Professional Support
- Find a mentor (experienced GP willing to advise)
- Join local GP groups
- Connect with your LMC
- Maintain links with training programme

### Peer Support
- Stay in touch with fellow trainees
- Join or create peer support groups
- Online communities for GPs
- Protected learning time networks

### Personal Wellbeing
- Maintain work-life boundaries
- Regular exercise and hobbies
- Strong personal relationships
- Know when to seek help

## Continuous Professional Development

As a qualified GP, you''ll need to:
- Complete annual appraisal
- Maintain revalidation requirements
- Continue learning through CPD
- Reflect on practice regularly

Start good habits during ST3 that will continue throughout your career.

## Common New GP Challenges

### Imposter Syndrome
- Very common in new GPs
- Remember: you''ve passed rigorous training
- Seek support when struggling
- It gets easier with experience

### Time Management
- Learning to manage full lists
- Balancing clinical and admin work
- Handling interruptions
- Avoiding burnout

### Complex Relationships
- Navigating practice politics
- Working with difficult colleagues
- Managing patient relationships over time
- Dealing with complaints', 
4, true, true);

-- Verify the import
SELECT stage, category, title, is_pro 
FROM portfolio_guides 
ORDER BY stage, sort_order;
