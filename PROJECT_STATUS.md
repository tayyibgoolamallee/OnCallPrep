# OnCallPrep - Project Status & Next Steps

**Last Updated:** January 2025

---

## ✅ What We've Built So Far

### 1. **Core Website Structure**
- ✅ Complete navigation system
- ✅ Responsive design (mobile-ready)
- ✅ Consistent branding and styling
- ✅ Footer with site-wide links

### 2. **Portfolio Section** (Complete)
- ✅ **Portfolio Hub** (`portfolio.html`) - Overview of ST1/2/3
- ✅ **ST1 Guide** (`st1.html`) - Foundation year requirements
- ✅ **ST2 Guide** (`st2.html`) - Development year & AKT prep
- ✅ **ST3 Guide** (`st3.html`) - Exit year & SCA prep
- ✅ **WPBA Checklist** (`wpba-checklist.html`) - Downloadable checklist
- ✅ **Reflection Writing Guide** (`reflection-guide.html`) - Complete guide
- ✅ **Consultation Models** (`consultation-models.html`) - All major models
- ✅ **Hidden Curriculum** (`hidden-curriculum.html`) - GP setup, triage, reports, QI, leadership

**Key Features:**
- Detailed WPBA requirements table (exact numbers for ST1/2/3)
- Portfolio strategy section (Three-Link Rule, high-yield reflections)
- Strategic focus areas for each training stage
- Career planning guidance

### 3. **SCA (Simulated Consultation Assessment) Section** (Complete)
- ✅ **SCA Overview** (`sca.html`) - Exam structure, marking, 12-minute framework
- ✅ **SCA Practice Tools** (`sca-practice.html`) - Interactive practice
  - 5 free mock cases with self-assessment checklists
  - 10 priming exercise stems
  - 2-Minute Explain generator (paid feature)
  - Self-assessment scoring system (Domain 1, 2 weighted 1.5x, Domain 3)

**Key Features:**
- Clear Pass/Pass/Minor Fail/Clear Fail grading
- Separate domain scores
- Visual feedback with color-coded cards
- Exam day practical tips

### 4. **AKT (Applied Knowledge Test) Section** (Complete)
- ✅ **AKT Overview** (`akt.html`) - Exam format, pass rates, study strategies
- ✅ **AKT Question Bank Interface** (`akt-questions.html`) - Interactive question system
- ✅ **Question Data Structure** (`data/akt-questions.json`) - JSON format ready for 200+ questions
- ✅ **IMG Tips Section** - Comprehensive guide for International Medical Graduates

**Key Features:**
- Updated to 160 questions format (Oct 2025 change)
- 3-month study schedule
- Three study strategy modes (untimed, timed with notes, exam conditions)
- IMG-specific pitfalls and strategies
- Mobile-friendly question interface

### 5. **Clinical Topics Section** (Complete)
- ✅ **Clinical Topics Hub** (`clinical-topics.html`)
- ✅ 6 free sample topics (Asthma, COPD, Hypertension, Heart Failure, IBS, Eczema)
- ✅ 50+ locked topics organized by system (paid content)
- ✅ Detailed explanations, symptoms, differentials, management, safety netting

### 6. **Technical Infrastructure**
- ✅ **CSS System:**
  - Main stylesheet with CSS variables
  - Content page styles
  - SCA-specific styles
  - Practice tools styles
  - Clinical topics styles
- ✅ **JavaScript:**
  - Self-assessment scoring system
  - Practice tools (timers, random generators)
  - Navigation and mobile menu
- ✅ **Question Bank System:**
  - JSON data structure (ready for database)
  - Interactive HTML interface
  - Mobile-responsive design
  - Ready for native app conversion

---

## 📊 Current Content Status

### Free Content (Available to All)
- Portfolio hub and overview
- ST1/ST2/ST3 guides
- WPBA checklist (downloadable)
- Reflection writing guide
- Consultation models
- Hidden curriculum page
- SCA overview and exam structure
- 5 free mock SCA cases
- 10 priming exercise stems
- AKT overview and study strategies
- IMG tips section
- 6 free clinical topics
- Example AKT questions

### Paid Content (Pro Members)
- 2-Minute Explain generator (diagnosis practice)
- Full clinical topics library (50+ topics)
- Complete AKT question bank (200+ questions)
- 75 EBP & PCOM bespoke questions
- Additional mock cases
- Progress tracking and analytics

---

## 🎯 Next Steps for Production Readiness

### Phase 1: Content Completion (Priority: HIGH)

#### 1.1 Question Bank Population
- [ ] Add all 200 AKT questions to JSON file
- [ ] Add 75 EBP & PCOM questions to JSON file
- [ ] Add explanations, key points, and links for each question
- [ ] Organize by topic and difficulty

**Estimated Time:** 2-3 days

#### 1.2 Clinical Topics Expansion
- [ ] Complete all 50+ clinical topics with full content
- [ ] Ensure consistent format across all topics
- [ ] Add internal cross-references

**Estimated Time:** 3-5 days

#### 1.3 Additional Mock Cases
- [ ] Create 10-15 more SCA mock cases
- [ ] Add self-assessment checklists to all cases
- [ ] Create difficulty levels (beginner, intermediate, advanced)

**Estimated Time:** 2-3 days

### Phase 2: Backend & Database (Priority: HIGH)

#### 2.1 User Authentication System
- [ ] User registration and login
- [ ] Password reset functionality
- [ ] Email verification
- [ ] Session management

**Tech Options:**
- Firebase Authentication (quickest)
- Supabase (PostgreSQL + auth)
- Custom Node.js/Express backend

**Estimated Time:** 2-3 days

#### 2.2 Database Setup
- [ ] User accounts table
- [ ] Subscription/payment tracking
- [ ] Progress tracking (question attempts, scores)
- [ ] User preferences and settings

**Tech Options:**
- Firebase Firestore (NoSQL, easy)
- Supabase (PostgreSQL, more powerful)
- MongoDB Atlas

**Estimated Time:** 1-2 days

#### 2.3 Payment Integration
- [ ] Stripe or PayPal integration
- [ ] Subscription management (monthly/annual)
- [ ] Free trial handling
- [ ] Payment webhooks

**Estimated Time:** 2-3 days

### Phase 3: Interactive Features (Priority: MEDIUM)

#### 3.1 Question Bank Enhancements
- [ ] Progress tracking per question
- [ ] Bookmark/favorite questions
- [ ] Filter by topic, difficulty, category
- [ ] Timed practice mode
- [ ] Mock exam mode (full 160 questions)
- [ ] Performance analytics dashboard

**Estimated Time:** 3-4 days

#### 3.2 Self-Assessment Improvements
- [ ] Save assessment results
- [ ] Track progress over time
- [ ] Compare scores across cases
- [ ] Identify weak domains

**Estimated Time:** 1-2 days

### Phase 4: Mobile App Conversion (Priority: MEDIUM)

#### 4.1 Framework Selection
- [ ] Choose: React Native, Flutter, or PWA
- [ ] Set up development environment
- [ ] Create app structure

**Recommendation:** Start with PWA (Progressive Web App) - works on all devices, easier to maintain

**Estimated Time:** 1 day setup

#### 4.2 App Features
- [ ] Offline question access
- [ ] Push notifications for study reminders
- [ ] Native app feel
- [ ] App store submission (iOS/Android)

**Estimated Time:** 5-7 days

### Phase 5: Polish & Launch (Priority: MEDIUM)

#### 5.1 UI/UX Final Polish
- [ ] Cross-browser testing
- [ ] Mobile device testing
- [ ] Accessibility audit (WCAG compliance)
- [ ] Performance optimization
- [ ] SEO optimization

**Estimated Time:** 2-3 days

#### 5.2 Content Review
- [ ] Proofread all content
- [ ] Verify all links work
- [ ] Check for broken images
- [ ] Ensure consistent formatting

**Estimated Time:** 1-2 days

#### 5.3 Legal & Compliance
- [ ] Privacy policy
- [ ] Terms of service
- [ ] Cookie policy
- [ ] GDPR compliance (if targeting EU)
- [ ] Medical disclaimer

**Estimated Time:** 1 day

---

## 🚀 Recommended Launch Sequence

### Week 1-2: Content & Backend
1. Complete question bank (200 + 75 questions)
2. Set up user authentication
3. Set up database
4. Payment integration

### Week 3: Features & Testing
1. Progress tracking
2. Question filtering and search
3. Mock exam mode
4. Internal testing

### Week 4: Polish & Launch
1. UI/UX polish
2. Content review
3. Legal pages
4. Beta launch with limited users

### Week 5+: Mobile App
1. PWA conversion
2. App store submission
3. Marketing and promotion

---

## 💰 Monetization Strategy

### Free Tier
- Portfolio guides
- SCA overview
- 5 mock cases
- 6 clinical topics
- AKT overview and IMG tips

### Pro Tier (£X/month or £Y/year)
- Full question bank (200+ questions)
- All clinical topics (50+)
- Additional mock cases
- Progress tracking
- Timed practice modes
- Performance analytics
- 2-Minute Explain generator

### Potential Add-ons
- One-on-one tutoring
- Live webinars
- Study groups
- Personalized study plans

---

## 🛠️ Technical Stack Recommendations

### Frontend (Current)
- ✅ HTML/CSS/JavaScript (vanilla)
- ✅ Mobile-responsive design
- ✅ CSS variables for consistency

### Backend Options

**Option 1: Firebase (Fastest to Launch)**
- Authentication: Firebase Auth
- Database: Firestore
- Storage: Firebase Storage
- Hosting: Firebase Hosting
- **Pros:** Quick setup, free tier, real-time updates
- **Cons:** Vendor lock-in, NoSQL limitations

**Option 2: Supabase (Most Flexible)**
- Authentication: Supabase Auth
- Database: PostgreSQL
- Storage: Supabase Storage
- Hosting: Vercel/Netlify
- **Pros:** Open source, SQL database, more control
- **Cons:** Slightly more setup

**Option 3: Custom Backend**
- Node.js/Express + PostgreSQL
- **Pros:** Full control
- **Cons:** More development time

**Recommendation:** Start with **Supabase** - best balance of speed and flexibility

---

## 📝 Immediate Action Items

### This Week:
1. ✅ Complete CSS standardization (in progress)
2. [ ] Add all 75 EBP/PCOM questions to JSON
3. [ ] Set up development environment for backend
4. [ ] Choose hosting platform (Vercel/Netlify recommended)

### Next Week:
1. [ ] Implement user authentication
2. [ ] Set up database schema
3. [ ] Begin payment integration
4. [ ] Add progress tracking to question bank

---

## 📈 Success Metrics to Track

- User registrations
- Free to paid conversion rate
- Question completion rate
- Average time spent on site
- Mock exam pass rates
- User feedback and reviews

---

## 🎓 Content Quality Checklist

- [ ] All medical information verified against NICE/CKS
- [ ] All links to external resources working
- [ ] No sensitive/trainee-specific information
- [ ] Consistent tone and style throughout
- [ ] All images optimized
- [ ] Mobile-friendly on all devices

---

## 📞 Support & Maintenance

### Post-Launch Needs:
- Content updates (guidelines change)
- Bug fixes
- User support
- Feature requests
- Marketing and SEO

---

**Current Status:** ✅ Core structure complete, ready for content population and backend integration

**Next Milestone:** Complete question bank + user authentication system




