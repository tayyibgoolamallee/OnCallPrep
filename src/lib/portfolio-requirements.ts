// WPBA Requirements Data Structure
// Based on RCGP Portfolio Requirements Document

export interface Requirement {
  id: string
  name: string
  st1?: RequirementDetail
  st2?: RequirementDetail
  st3?: RequirementDetail
  notes?: string
  rcgpLink?: string
}

export interface RequirementDetail {
  requirement: string
  notes?: string
}

export const wpbaRequirements: Requirement[] = [
  {
    id: 'minicex-cots',
    name: 'Mini-CEX/COTs',
    st1: {
      requirement: '4 (all 4 types)',
      notes: 'COTs of all types to be completed over training time including audio, face to face/in person (i.e. patient is in the same room as the registrar) and virtual/remote. At least 1 Audio COT and 1 face to face/in person COT should be completed.'
    },
    st2: {
      requirement: '4 (all 4 types)'
    },
    st3: {
      requirement: '7 (all 4 types)'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/workplace-based-assessment-wpba/consultation-observation-tool-cot.aspx'
  },
  {
    id: 'cbds-cats',
    name: 'CBDs / CATs',
    st1: {
      requirement: '4 CbD'
    },
    st2: {
      requirement: '4 CbD'
    },
    st3: {
      requirement: '5 CAT'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/workplace-based-assessment-wpba/case-based-discussion-cbd.aspx'
  },
  {
    id: 'msf',
    name: 'MSF',
    st1: {
      requirement: '1 (min. 5 clinical, 5 non-clinical)',
      notes: 'In non-primary care posts where it is not possible to find 5 non-clinician respondents it is acceptable to ask more clinicians, but the minimum of 10 total respondents still applies.'
    },
    st2: {
      requirement: '2 (1 MSF 5&5 responses, 1 Leadership MSF)',
      notes: 'In ST3, the MSF should be completed in the first 6 months of the training year, with the Leadership MSF being completed in the second 6 months and after the Leadership Activity has been completed.'
    },
    st3: {
      requirement: '2 (1 MSF 5&5 responses, 1 Leadership MSF)',
      notes: 'In ST3, the MSF should be completed in the first 6 months of the training year, with the Leadership MSF being completed in the second 6 months and after the Leadership Activity has been completed.'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/workplace-based-assessment-wpba/multi-source-feedback-msf.aspx'
  },
  {
    id: 'csr',
    name: 'CSR PSQ',
    st1: {
      requirement: '1 per post',
      notes: 'CSR to be completed in each post in ST1 and ST2, and in ST3 if any of the following apply: 1) The clinical supervisor in practice is a different person from the educational supervisor. 2) The evidence in the Portfolio does not give a full enough picture of the registrar and information in the CSR would provide this missing information, and 3) if either the registrar or supervisor feel it is appropriate.'
    },
    st2: {
      requirement: '1 per post',
      notes: 'CSR to be completed in each post in ST1 and ST2, and in ST3 if any of the following apply: 1) The clinical supervisor in practice is a different person from the educational supervisor. 2) The evidence in the Portfolio does not give a full enough picture of the registrar and information in the CSR would provide this missing information, and 3) if either the registrar or supervisor feel it is appropriate.'
    },
    st3: {
      requirement: '1 per post (if applicable)',
      notes: 'CSR to be completed in each post in ST1 and ST2, and in ST3 if any of the following apply: 1) The clinical supervisor in practice is a different person from the educational supervisor. 2) The evidence in the Portfolio does not give a full enough picture of the registrar and information in the CSR would provide this missing information, and 3) if either the registrar or supervisor feel it is appropriate.'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/workplace-based-assessment-wpba/clinical-supervisor-report-csr.aspx'
  },
  {
    id: 'ceps',
    name: 'CEPS',
    st1: {
      requirement: 'Ongoing: some appropriate to post (including some \'system\'/\'other\' CEPS)',
      notes: 'Throughout your training, you must be completing some, relevant to post, CEPS in each training year. By the end of ST3, and to be awarded your CCT, evidence for all the intimate examinations must be included, and you must have a range of additional CEPS relevant to General Practice which demonstrate competence. 7 "system" GP focussed observed CEPS categories are included in the Clinical Examination and Procedural Skills section of the Portfolio.'
    },
    st2: {
      requirement: 'Ongoing: some appropriate to post (including some \'system\'/\'other\' CEPS)',
      notes: 'For complete clarity, a range cannot be demonstrated with just 2 CEPS, nor could it be demonstrated with CEPS of only one type (i.e. 3 "ENT" CEPS). It will always be up to the judgment of the Trainer/Educational Supervisor as to what evidence is required for CEPS. However, being graded as "able to complete unsupervised" in all of the 7 "system" GP focussed observed CEPS would provide strong evidence of competency.'
    },
    st3: {
      requirement: 'For CCT: all intimate + a range of others (including 7 \'system\'/\'other\' CEPS)',
      notes: 'For CCT: all intimate examinations must be included, and you must have a range of additional CEPS relevant to General Practice which demonstrate competence. 7 "system" GP focussed observed CEPS categories are included.'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/workplace-based-assessment-wpba/clinical-examination-and-procedural-skills-ceps.aspx'
  },
  {
    id: 'learning-logs',
    name: 'Learning logs',
    st1: {
      requirement: '36 CCRs',
      notes: 'Clinical Case Reviews (CCRs) must be about real patients that you have personally seen. Registrars should have more than one log entry which addresses each capability in each 6-month review period. Therefore a range of logs should be completed, not only CCRs, in order to capture capabilities such as organisation, management and leadership, ethics, and fitness to practice.'
    },
    st2: {
      requirement: '36 CCRs',
      notes: 'Clinical Case Reviews (CCRs) must be about real patients that you have personally seen. Registrars should have more than one log entry which addresses each capability in each 6-month review period.'
    },
    st3: {
      requirement: '36 CCRs',
      notes: 'Clinical Case Reviews (CCRs) must be about real patients that you have personally seen. Other logs that don\'t demonstrate clinical learning, or are not about patients that you have personally seen, should be recorded in the other learning log formats available, such as Supporting Documentation.'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/learning-logs.aspx'
  },
  {
    id: 'placement-planning',
    name: 'Placement planning',
    st1: {
      requirement: '1 per post',
      notes: '1 (if in GP) assessed by Registrar & ES'
    },
    st2: {
      requirement: '1 per post',
      notes: '1 (if in GP) – if not done in ST1'
    },
    st3: {
      requirement: '0 (unless not been completed in ST1/2)',
      notes: 'Unless not been completed in ST1/2'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/placement-planning.aspx'
  },
  {
    id: 'qip',
    name: 'QIP',
    st1: {
      requirement: '1 (min. 5 clinical, 5 non-clinical)',
      notes: 'QIA is required in every training year. If you do a QIP in ST1 or ST2 this can count as the QIA for that year (the QIP must be in a GP post and assessed using the QIP form by the registrar and trainer). An LEA, reflection on feedback, or leadership project do not count as the mandatory QIA.'
    },
    st2: {
      requirement: '1 per post',
      notes: 'QIA is required in every training year. If you do a QIP in ST1 or ST2 this can count as the QIA for that year.'
    },
    st3: {
      requirement: '1 per post',
      notes: 'QIA is required in every training year.'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/quality-improvement-activity-qia.aspx'
  },
  {
    id: 'esr',
    name: 'ESR',
    st1: {
      requirement: '1',
      notes: 'An interim ESR review can also be completed at the mid point of each year only if the registrar is progressing satisfactorily. If there are any concerns about the registrar\'s performance, or they have had a developmental outcome in their previous ARCP then the full ESR will be required.'
    },
    st2: {
      requirement: '1',
      notes: 'An interim ESR review can also be completed at the mid point of each year only if the registrar is progressing satisfactorily.'
    },
    st3: {
      requirement: '1',
      notes: 'An interim ESR review can also be completed at the mid point of each year only if the registrar is progressing satisfactorily.'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/educational-supervisor-review-esr.aspx'
  },
]

export const otherEvidence: Requirement[] = [
  {
    id: 'safeguarding-adults',
    name: 'Safeguarding adults level 3',
    st1: {
      requirement: 'Certificate and reflective log entry',
      notes: 'Safeguarding certificates may last 3 years but a knowledge update is needed in addition every 12 months (even if LTFT) if not completing the full level 3 in that year. Demonstration of the application of knowledge should be presented in the portfolio using a CCR in each training year (ST1/2/3).'
    },
    st2: {
      requirement: 'Certificate, knowledge update every 12 months, and reflective log entry',
      notes: 'Safeguarding certificates may last 3 years but a knowledge update is needed in addition every 12 months (even if LTFT) if not completing the full level 3 in that year.'
    },
    st3: {
      requirement: 'Certificate, knowledge update every 12 months, and reflective log entry',
      notes: 'Safeguarding certificates may last 3 years but a knowledge update is needed in addition every 12 months (even if LTFT) if not completing the full level 3 in that year.'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/safeguarding.aspx'
  },
  {
    id: 'safeguarding-children',
    name: 'Safeguarding children level 3',
    st1: {
      requirement: 'Certificate, knowledge update every 12 months, and reflective log entry',
      notes: 'If a registrar does not have a placement within a specific training year that includes children, then it is not mandatory (but still recommended) to record and document their learning on Child safeguarding.'
    },
    st2: {
      requirement: 'Certificate, knowledge update every 12 months, and reflective log entry',
      notes: 'If a registrar does not have a placement within a specific training year that includes children, then it is not mandatory (but still recommended) to record and document their learning on Child safeguarding.'
    },
    st3: {
      requirement: 'Certificate, knowledge update every 12 months, and reflective log entry',
      notes: 'If a registrar does not have a placement within a specific training year that includes children, then it is not mandatory (but still recommended) to record and document their learning on Child safeguarding.'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/safeguarding.aspx'
  },
  {
    id: 'cpr-aed',
    name: 'Annual evidence of competence in CPR & AED (Adults & Children)',
    st1: {
      requirement: 'Certificate and reflective log entry',
      notes: 'All initial and refresher training in CPR and AED for both adults and children must be face-to-face and include active participation. ALS though lasting for 3-4 years needs to be updated every 12 months with evidence of competence in CPR and AED. Certificates (such as a BLS certificate) should be added to Supporting Documentation and the Compliance Passport.'
    },
    st2: {
      requirement: 'Annual evidence of competence in CPR & AED (Adults & Children)',
      notes: 'All initial and refresher training in CPR and AED for both adults and children must be face-to-face and include active participation.'
    },
    st3: {
      requirement: 'Annual evidence of competence in CPR & AED (Adults & Children)',
      notes: 'All initial and refresher training in CPR and AED for both adults and children must be face-to-face and include active participation.'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/compliance-passport.aspx'
  },
  {
    id: 'form-r',
    name: 'Form R or SOAR (Scotland)',
    st1: {
      requirement: '1 per ARCP',
      notes: 'Form R should be uploaded to your compliance passport and is required for ARCP at least annually. Ensure Time out of Training (\'TOOT\') days match between the form R and the portfolio and any complaints are declared and reflected on in a LEA. In Scotland SOAR must be completed along with a separate absence declaration.'
    },
    st2: {
      requirement: '1 per ARCP',
      notes: 'Form R should be uploaded to your compliance passport and is required for ARCP at least annually.'
    },
    st3: {
      requirement: '1 per ARCP',
      notes: 'Form R should be uploaded to your compliance passport and is required for ARCP at least annually.'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/form-r.aspx'
  },
  {
    id: 'pdp',
    name: 'PDP',
    st1: {
      requirement: 'A minimum of 2 PDPs created per training year, with progress demonstrated in at least one',
      notes: 'Personal Development Plans should be created and updated regularly throughout training.'
    },
    st2: {
      requirement: 'A minimum of 2 PDPs created per training year, with progress demonstrated in at least one',
      notes: 'Personal Development Plans should be created and updated regularly throughout training.'
    },
    st3: {
      requirement: 'A minimum of 2 PDPs created per training year, with progress demonstrated in at least one',
      notes: 'Personal Development Plans should be created and updated regularly throughout training.'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/personal-development-plan-pdp.aspx'
  },
  {
    id: 'lea',
    name: 'Learning event analysis',
    st1: {
      requirement: '1'
    },
    st2: {
      requirement: '1'
    },
    st3: {
      requirement: '1'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/learning-event-analysis-lea.aspx'
  },
  {
    id: 'prescribing',
    name: 'Prescribing',
    st1: {
      requirement: '0'
    },
    st2: {
      requirement: '0'
    },
    st3: {
      requirement: '1'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/prescribing-assessment.aspx'
  },
  {
    id: 'leadership',
    name: 'Leadership activity',
    st1: {
      requirement: '0'
    },
    st2: {
      requirement: '0'
    },
    st3: {
      requirement: '1'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/leadership-activity.aspx'
  },
  {
    id: 'significant-event',
    name: 'Significant event',
    st1: {
      requirement: 'Only if reaches GMC threshold of potential or actual serious harm to patients',
      notes: 'Any Fitness to practise issues should be considered and commented upon. Must be declared on Form R.'
    },
    st2: {
      requirement: 'Only if reaches GMC threshold of potential or actual serious harm to patients',
      notes: 'Any Fitness to practise issues should be considered and commented upon. Must be declared on Form R.'
    },
    st3: {
      requirement: 'Only if reaches GMC threshold of potential or actual serious harm to patients',
      notes: 'Any Fitness to practise issues should be considered and commented upon. Must be declared on Form R.'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/learning-event-analysis-lea.aspx'
  },
  {
    id: 'arcp-requirements',
    name: 'Any requirements of last ARCP',
    st1: {
      requirement: 'Check (even if Outcome 1)'
    },
    st2: {
      requirement: 'Check (even if Outcome 1)'
    },
    st3: {
      requirement: 'Check (even if Outcome 1)'
    },
    rcgpLink: 'https://www.rcgp.org.uk/training-exams/training/portfolio/arcp.aspx'
  },
]

export const stageInfo = {
  st1: {
    name: 'ST1',
    fullName: 'ST1 - First Year of Specialty Training',
    description: 'Foundation year focusing on core competencies and workplace-based assessments.'
  },
  st2: {
    name: 'ST2',
    fullName: 'ST2 - Second Year of Specialty Training',
    description: 'Building on ST1 foundations with increased responsibility and leadership opportunities.'
  },
  st3: {
    name: 'ST3',
    fullName: 'ST3 - Final Year of Specialty Training',
    description: 'Final year preparing for CCT with comprehensive evidence requirements including all intimate examinations and leadership activities.'
  },
}
