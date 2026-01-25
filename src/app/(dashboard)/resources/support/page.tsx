import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import Link from 'next/link'
import ResourcePageLayout, { ResourceSection, InfoBox, Chunk } from '@/components/ResourcePageLayout'

export default function SupportPage() {
  return (
    <ResourcePageLayout
      title="Trainee Support"
      description="Access to support services, resources, and guidance during your GP training journey"
    >
      {/* Support Services */}
      <ResourceSection title="Support Services">
        <Chunk>
          <div className="grid md:grid-cols-2 gap-4">
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <h3 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Educational Supervisor</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400">
                Your primary point of contact for training support, portfolio guidance, and career development.
              </p>
            </div>
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <h3 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Clinical Supervisor</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400">
                Provides day-to-day clinical supervision and support in your current placement.
              </p>
            </div>
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <h3 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Training Programme Director</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400">
                Oversees your training programme and can help with training-related concerns.
              </p>
            </div>
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <h3 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Deanery/HEE</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400">
                Contact your local deanery or Health Education England for training programme queries.
              </p>
            </div>
          </div>
        </Chunk>
      </ResourceSection>

      {/* Professional Support */}
      <ResourceSection title="Professional Support">
        <Chunk>
          <div className="space-y-3">
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
              <h3 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">RCGP</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                Royal College of General Practitioners - support, resources, and guidance for GP trainees
              </p>
              <a href="https://www.rcgp.org.uk" target="_blank" rel="noopener noreferrer" className="text-teal-600 dark:text-teal-400 hover:underline text-sm">
                Visit RCGP website →
              </a>
            </div>
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
              <h3 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">BMA</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                British Medical Association - professional support, advice, and representation
              </p>
              <a href="https://www.bma.org.uk" target="_blank" rel="noopener noreferrer" className="text-teal-600 dark:text-teal-400 hover:underline text-sm">
                Visit BMA website →
              </a>
            </div>
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
              <h3 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">GMC</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                General Medical Council - registration, guidance, and fitness to practise support
              </p>
              <a href="https://www.gmc-uk.org" target="_blank" rel="noopener noreferrer" className="text-teal-600 dark:text-teal-400 hover:underline text-sm">
                Visit GMC website →
              </a>
            </div>
          </div>
        </Chunk>
      </ResourceSection>

      {/* Email Templates */}
      <ResourceSection title="Professional Email Templates">
        <Chunk>
          <p className="text-slate-600 dark:text-slate-400 mb-4">
            Use these templates as a starting point for professional and courteous communication. 
            Personalize them to your situation and always maintain a respectful, solution-focused tone.
          </p>
        </Chunk>

        <Chunk title="Struggling with Clinical Confidence">
          <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-4 border border-slate-200 dark:border-slate-700">
            <div className="font-mono text-sm text-slate-700 dark:text-slate-300 whitespace-pre-wrap">
{`Subject: Request for Support - Clinical Confidence

Dear [Educational Supervisor/Clinical Supervisor name],

I hope this email finds you well. I am writing to discuss an area where I would benefit from additional support and guidance.

I have been reflecting on my clinical practice and have identified that I am experiencing some challenges with my clinical confidence in [specific area/situation, if applicable]. I am committed to my professional development and believe that with appropriate support, I can address these concerns effectively.

I would be very grateful if we could arrange a time to discuss this further. I am open to suggestions for how we might address this, including:
- Additional supervised practice opportunities
- Targeted learning activities
- Regular feedback sessions
- Any other approaches you feel would be helpful

I am keen to work collaboratively to develop my skills and confidence in this area. Please let me know when would be convenient for you to meet.

Thank you for your time and support.

Kind regards,
[Your name]`}
            </div>
          </div>
        </Chunk>

        <Chunk title="Rota Issues">
          <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-4 border border-slate-200 dark:border-slate-700">
            <div className="font-mono text-sm text-slate-700 dark:text-slate-300 whitespace-pre-wrap">
{`Subject: Rota Concerns - Request for Discussion

Dear [Rota Coordinator/Clinical Supervisor name],

I hope you are well. I am writing to raise some concerns regarding my current rota and to request a discussion about potential solutions.

[Briefly describe the specific issue, e.g., "I have noticed that my rota does not comply with the working time regulations" or "I am concerned about the frequency of on-call shifts" or "I have identified a pattern that may impact my training requirements"].

I am aware that rota planning can be complex, and I appreciate the challenges involved. However, I believe it would be helpful to discuss this to ensure:
- Compliance with working time regulations
- Adequate rest periods between shifts
- Appropriate training opportunities
- My wellbeing and ability to provide safe patient care

I would be grateful if we could arrange a time to discuss this matter. I am happy to work collaboratively to find a solution that addresses these concerns while being mindful of service needs.

Thank you for your consideration.

Best regards,
[Your name]`}
            </div>
          </div>
        </Chunk>

        <Chunk title="Datix/Significant Event">
          <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-4 border border-slate-200 dark:border-slate-700">
            <div className="font-mono text-sm text-slate-700 dark:text-slate-300 whitespace-pre-wrap">
{`Subject: Significant Event/Datix - Request for Support and Discussion

Dear [Educational Supervisor/Clinical Supervisor name],

I am writing to inform you that I have been involved in a significant event [or "a Datix has been submitted relating to an incident I was involved in"]. I wanted to bring this to your attention at the earliest opportunity.

[Brief factual description - keep this concise and factual, e.g., "The incident occurred on [date] and involved [brief description]. A Datix was submitted on [date]."]

I have already:
- Completed the necessary documentation
- Reflected on the incident
- Identified learning points
- [Any other relevant actions taken]

I would appreciate the opportunity to discuss this with you to:
- Ensure I have understood the situation correctly
- Identify any additional learning needs
- Discuss how this might be addressed in my portfolio
- Receive guidance on any further steps required

I am committed to learning from this experience and ensuring I provide the best possible care going forward. I would be grateful if we could arrange a time to meet to discuss this further.

Thank you for your support.

Kind regards,
[Your name]`}
            </div>
          </div>
        </Chunk>

        <Chunk title="Received a Complaint">
          <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-4 border border-slate-200 dark:border-slate-700">
            <div className="font-mono text-sm text-slate-700 dark:text-slate-300 whitespace-pre-wrap">
{`Subject: Complaint Received - Request for Support

Dear [Educational Supervisor/Clinical Supervisor name],

I am writing to inform you that I have received notification of a complaint [or "a complaint has been made about my practice"]. I wanted to bring this to your attention and request your support and guidance.

[Brief factual description - keep this brief and factual, e.g., "I received notification on [date] regarding a complaint about [brief description]. The complaint relates to [date of incident]."]

I understand the importance of:
- Taking all complaints seriously
- Reflecting on the concerns raised
- Responding appropriately and professionally
- Learning from the experience

I would be very grateful if we could arrange a time to discuss this, as I would value your:
- Guidance on the complaint process
- Support in preparing my response
- Advice on any learning or development needs identified
- Assistance in accessing any additional support if needed

I am committed to addressing this matter professionally and learning from the experience. Please let me know when would be convenient for you to meet.

Thank you for your support.

Best regards,
[Your name]`}
            </div>
          </div>
        </Chunk>
      </ResourceSection>

      {/* Understanding Support Channels */}
      <ResourceSection title="Understanding Support Channels">
        <Chunk>
          <InfoBox variant="tip">
            <p className="text-slate-700 dark:text-slate-300">
              <strong>Informal before formal:</strong> Many issues can be resolved through informal channels. 
              Exploring these options first can often lead to quicker, more collaborative solutions.
            </p>
          </InfoBox>
        </Chunk>

        <Chunk title="Informal Support Channels">
          <ul className="text-slate-700 dark:text-slate-300 space-y-2 ml-4 list-disc">
            <li><strong>Previous trainees:</strong> Reach out to trainees who have completed the same placement or programme. They can offer valuable perspective on whether your concern is common, how they navigated similar situations, and what approaches worked for them.</li>
            <li><strong>Peer support:</strong> Discuss concerns with colleagues at a similar stage of training. They may have experienced similar issues and can provide practical advice and emotional support.</li>
            <li><strong>Clinical/Educational Supervisor:</strong> Often the first port of call. They can provide guidance, mediate concerns, and help identify solutions before issues escalate.</li>
            <li><strong>Training Programme Director:</strong> Can offer advice on training-related concerns and may be able to address issues at a programme level.</li>
          </ul>
        </Chunk>

        <Chunk title="Understanding Systemic vs Personal Issues">
          <p className="text-slate-600 dark:text-slate-400 mb-3">
            Before escalating a concern, it can be helpful to consider whether the issue is:
          </p>
          <div className="grid md:grid-cols-2 gap-4">
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Systemic/Theme Issue</h4>
              <ul className="text-sm text-slate-600 dark:text-slate-400 space-y-1 ml-4 list-disc">
                <li>Affects multiple trainees or staff members</li>
                <li>Related to organisational policies, procedures, or culture</li>
                <li>Persistent across different supervisors or placements</li>
                <li>May require organisational-level intervention</li>
              </ul>
            </div>
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Personal/Isolated Issue</h4>
              <ul className="text-sm text-slate-600 dark:text-slate-400 space-y-1 ml-4 list-disc">
                <li>Specific to your individual circumstances</li>
                <li>May relate to personal learning needs or preferences</li>
                <li>Could be addressed through targeted support or adjustments</li>
                <li>May benefit from individual development planning</li>
              </ul>
            </div>
          </div>
          <InfoBox variant="info" className="mt-4">
            <p className="text-slate-700 dark:text-slate-300">
              <strong>Remember:</strong> Both types of issues are valid and deserve appropriate support. 
              Understanding the nature of your concern can help you identify the most appropriate channel for addressing it.
            </p>
          </InfoBox>
        </Chunk>

        <Chunk title="Formal Support Channels">
          <div className="space-y-3">
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
              <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Guardians of Safe Working</h4>
              <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                Guardians of Safe Working are senior clinicians responsible for ensuring safe working conditions 
                and addressing concerns about working patterns, workload, and working time regulations. They can 
                help if you have concerns about:
              </p>
              <ul className="text-sm text-slate-600 dark:text-slate-400 space-y-1 ml-4 list-disc">
                <li>Working hours and rest periods</li>
                <li>Rota compliance with regulations</li>
                <li>Workload and staffing levels</li>
                <li>Safe working practices</li>
              </ul>
              <p className="text-xs text-slate-500 dark:text-slate-500 mt-2">
                Contact your local Guardian of Safe Working through your trust or deanery.
              </p>
            </div>
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
              <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Freedom to Speak Up Guardians</h4>
              <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                Freedom to Speak Up Guardians provide independent, confidential support for staff who want to 
                raise concerns about patient safety, quality of care, or workplace culture. They can help with:
              </p>
              <ul className="text-sm text-slate-600 dark:text-slate-400 space-y-1 ml-4 list-disc">
                <li>Concerns about patient safety or care quality</li>
                <li>Workplace culture issues</li>
                <li>Bullying, harassment, or discrimination</li>
                <li>Any concern you feel unable to raise through normal channels</li>
              </ul>
              <p className="text-xs text-slate-500 dark:text-slate-500 mt-2">
                Freedom to Speak Up Guardians are independent and confidential. Contact your local guardian 
                through your trust or visit the National Guardian's Office website.
              </p>
            </div>
          </div>
        </Chunk>
      </ResourceSection>

      {/* Burnout Section */}
      <ResourceSection title="Understanding Burnout">
        <Chunk>
          <p className="text-slate-600 dark:text-slate-400 mb-4">
            Burnout is recognised by the World Health Organisation as an occupational phenomenon resulting from 
            chronic workplace stress that hasn't been successfully managed. It's important to recognise the signs 
            and know how to support yourself.
          </p>
        </Chunk>

        <Chunk title="What is Burnout?">
          <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-4 border border-slate-200 dark:border-slate-700">
            <p className="text-slate-700 dark:text-slate-300 mb-3">
              Burnout is characterised by <strong>three key dimensions:</strong>
            </p>
            <ul className="text-slate-700 dark:text-slate-300 space-y-2 ml-4 list-disc">
              <li><strong>Energy depletion or exhaustion:</strong> Feeling drained, tired, or unable to recharge</li>
              <li><strong>Increased mental distance from work:</strong> Feelings of negativism, cynicism, or detachment related to your job</li>
              <li><strong>Reduced professional efficacy:</strong> Decreased sense of accomplishment, competence, or effectiveness</li>
            </ul>
            <InfoBox variant="info" className="mt-4">
              <p className="text-slate-700 dark:text-slate-300">
                <strong>Important:</strong> Burnout is not the same as depression. Burnout is specific to the work context 
                and often improves with time away or changes to working conditions. If you're experiencing symptoms 
                that extend beyond work into all areas of life, or if symptoms persist despite time away, consider 
                speaking with a healthcare professional.
              </p>
            </InfoBox>
          </div>
        </Chunk>

        <Chunk title="Signs and Risk Factors">
          <div className="grid md:grid-cols-2 gap-4">
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Common Signs</h4>
              <ul className="text-sm text-slate-600 dark:text-slate-400 space-y-1 ml-4 list-disc">
                <li>Persistent fatigue that doesn't improve with rest</li>
                <li>Feeling cynical or negative about work</li>
                <li>Reduced sense of accomplishment</li>
                <li>Difficulty concentrating or making decisions</li>
                <li>Withdrawing from colleagues or work activities</li>
                <li>Feeling like you're "on a treadmill"</li>
                <li>Physical symptoms (headaches, sleep problems, changes in appetite)</li>
                <li>Increased irritability or emotional reactivity</li>
              </ul>
            </div>
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Risk Factors</h4>
              <ul className="text-sm text-slate-600 dark:text-slate-400 space-y-1 ml-4 list-disc">
                <li>Excessive workload or time pressure</li>
                <li>Lack of control over work tasks or schedule</li>
                <li>Insufficient recognition or reward</li>
                <li>Poor workplace relationships or community</li>
                <li>Unfair treatment or lack of fairness</li>
                <li>Conflict between personal values and organisational values</li>
                <li>Inadequate breaks or recovery time</li>
                <li>Presenteeism (working when unwell)</li>
              </ul>
            </div>
          </div>
        </Chunk>

        <Chunk title="Ways to Support Yourself">
          <div className="space-y-4">
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Individual Strategies</h4>
              <ul className="text-sm text-slate-600 dark:text-slate-400 space-y-1 ml-4 list-disc">
                <li><strong>Prioritise rest and recovery:</strong> Take regular breaks during work, ensure adequate sleep, and protect time for rest</li>
                <li><strong>Set boundaries:</strong> Learn to say "no" when appropriate to protect your wellbeing and patient safety</li>
                <li><strong>Maintain work-life balance:</strong> Protect time for activities outside work that bring you joy and relaxation</li>
                <li><strong>Celebrate achievements:</strong> Regularly acknowledge your accomplishments, no matter how small</li>
                <li><strong>Seek support:</strong> Talk to colleagues, supervisors, friends, or professional support services</li>
                <li><strong>Practice self-compassion:</strong> Be kind to yourself and recognise that perfection is not achievable</li>
                <li><strong>Stay connected:</strong> Maintain relationships with colleagues, friends, and family</li>
                <li><strong>Engage in meaningful activities:</strong> Ensure at least some of your work aligns with your values and interests</li>
              </ul>
            </div>
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700">
              <h4 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">When to Seek Help</h4>
              <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                Consider seeking additional support if:
              </p>
              <ul className="text-sm text-slate-600 dark:text-slate-400 space-y-1 ml-4 list-disc">
                <li>Signs of burnout persist despite self-care efforts</li>
                <li>You're experiencing significant impact on your ability to work safely</li>
                <li>Symptoms are affecting your personal life or relationships</li>
                <li>You're having thoughts of leaving the profession due to wellbeing concerns</li>
                <li>You're using unhealthy coping strategies (substance use, avoidance, etc.)</li>
              </ul>
              <InfoBox variant="warning" className="mt-3">
                <p className="text-slate-700 dark:text-slate-300">
                  <strong>Remember:</strong> Seeking help is a sign of strength, not weakness. Early intervention 
                  is important, and there are many support services available.
                </p>
              </InfoBox>
            </div>
          </div>
        </Chunk>
      </ResourceSection>

      {/* Wellbeing Support */}
      <ResourceSection title="Wellbeing & Mental Health Support">
        <Chunk>
          <div className="grid md:grid-cols-2 gap-4">
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
              <h3 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">BMA Wellbeing Support</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                Free, confidential 24/7 counselling and peer support for doctors
              </p>
              <p className="text-xs text-slate-500 dark:text-slate-500">0330 123 1245</p>
            </div>
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
              <h3 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Practitioner Health</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                Specialist NHS service for doctors and dentists with mental health or addiction concerns
              </p>
              <a href="https://www.practitionerhealth.nhs.uk" target="_blank" rel="noopener noreferrer" className="text-teal-600 dark:text-teal-400 hover:underline text-xs">
                Visit website →
              </a>
            </div>
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
              <h3 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Samaritans</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                Free, confidential 24/7 emotional support
              </p>
              <p className="text-xs text-slate-500 dark:text-slate-500">116 123</p>
            </div>
            <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
              <h3 className="font-semibold text-slate-900 dark:text-slate-100 mb-2">Deanery Support Services</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400 mb-2">
                Contact your local deanery for trainee support services and counselling
              </p>
            </div>
          </div>
        </Chunk>
      </ResourceSection>
    </ResourcePageLayout>
  )
}
