# Product Requirements Document (PRD)
## PoP - People Over Party
### Open Source Civic Engagement Platform

---

**Document Version:** 1.0
**Date:** January 15, 2026
**Author:** Product Analysis
**Status:** Market Validation Complete

---

## Executive Summary

PoP (People Over Party) is an open-source iOS application designed to increase civic engagement through education, voter resources, and community building. Initially developed for the Better Together PAC in South Dakota, the platform is architected for nationwide adoption by any state or organization promoting nonpartisan civic participation.

---

## 1. Market Validation & Analysis

### 1.1 Market Size & Opportunity

| Metric | Value | Source |
|--------|-------|--------|
| Civic Tech Market Value | $6 billion | Brookings Institution |
| Government IT Spending (external) | $25.5 billion | Federal reports |
| Gen Z + Millennial Eligible Voters (2024) | 48.5% | Brennan Center |
| Projected Gen Z + Millennial Majority | 2028 | Demographic analysis |
| Rock the Vote Registrations to Date | 14+ million | Rock the Vote |

### 1.2 Target Market Segments

```
┌─────────────────────────────────────────────────────────────────┐
│                    TOTAL ADDRESSABLE MARKET                      │
│                   (~160M eligible US voters)                     │
├─────────────────────────────────────────────────────────────────┤
│  ┌───────────────────────────────────────────────────────────┐  │
│  │              SERVICEABLE ADDRESSABLE MARKET                │  │
│  │        (~77M Gen Z + Millennial eligible voters)           │  │
│  ├───────────────────────────────────────────────────────────┤  │
│  │  ┌─────────────────────────────────────────────────────┐  │  │
│  │  │           SERVICEABLE OBTAINABLE MARKET              │  │  │
│  │  │    (~2M civically-engaged app users per state)       │  │  │
│  │  │                                                       │  │  │
│  │  │   Initial Focus: South Dakota (~650K eligible)        │  │  │
│  │  └─────────────────────────────────────────────────────┘  │  │
│  └───────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

### 1.3 Market Trends (2025-2026)

| Trend | Impact | Opportunity |
|-------|--------|-------------|
| 75% of Gen Z spend 3+ hrs daily on phones | HIGH | Mobile-first design essential |
| 60% of Gen Z get news from social media | HIGH | Shareable content features |
| 44% of millennials identify as independent | HIGH | Nonpartisan positioning |
| 85% of millennials want to help community | HIGH | Civic engagement resonates |
| <20% of millennials trust government | MEDIUM | Educational, not political messaging |

---

## 2. Competitive Analysis

### 2.1 Direct Competitors

| Competitor | Type | Strengths | Weaknesses | PoP Advantage |
|------------|------|-----------|------------|---------------|
| **Vote.org** | Nonprofit | Largest GOTV platform, established brand | No civics education, national focus only | State-specific + education |
| **Ballotpedia** | Info Platform | Comprehensive ballot data, trusted | Web-only, no community features | Native app, offline access |
| **Rock the Vote** | Nonprofit | 14M+ registrations, youth focus | Registration-only, no education | Full civic ecosystem |
| **BallotReady** | Tech Startup | Personalized ballots, modern UI | No founding documents, no state focus | Educational depth |
| **iCivics** | Education | Strong K-12 content, gamified | Student focus, no voter resources | Adult civic education |
| **TurboVote** | Nonprofit | 3M+ users, reminder system | No state-specific content | Local focus |

### 2.2 Indirect Competitors

| Competitor | Overlap | Differentiation |
|------------|---------|-----------------|
| USCIS Civics Test App | Flashcard format | Citizen-focused, not naturalization |
| NGP VAN / Aristotle | PAC technology | Nonpartisan, open source |
| Decidim / Consul | Open source civic | Mobile-native, US-focused |
| State SOS Websites | Voter info | Aggregated, better UX |

### 2.3 Competitive Positioning Matrix

```
                    HIGH EDUCATION VALUE
                           │
           ┌───────────────┼───────────────┐
           │               │               │
           │   iCivics     │    ★ PoP ★    │
           │               │               │
           │               │               │
NARROW ────┼───────────────┼───────────────┼──── BROAD
FOCUS      │               │               │    FOCUS
           │               │               │
           │  State SOS    │   Vote.org    │
           │  Websites     │   Ballotpedia │
           │               │               │
           └───────────────┼───────────────┘
                           │
                    LOW EDUCATION VALUE
```

**PoP Unique Position:** Combines broad civic resources with deep educational content, state-specific customization, and open-source adaptability.

---

## 3. SWOT Analysis

### 3.1 Strengths

| Strength | Description | Strategic Value |
|----------|-------------|-----------------|
| **Open Source Architecture** | Forkable for any state/PAC | Viral adoption potential |
| **State-Specific Focus** | SD module as template | Scalable to all 50 states |
| **Nonpartisan Positioning** | No candidate endorsements | Broader audience appeal |
| **Offline-First Design** | Core Data persistence | Rural/low-connectivity users |
| **Educational Depth** | 100+ civics flashcards per state | Unique value proposition |
| **Founding Documents** | Full-text searchable | Constitutional education |
| **King Center Philosophy** | Principled framework | Mission-driven community |
| **No Account Required** | Privacy-focused | Lower barrier to entry |
| **Native iOS** | SwiftUI performance | Superior UX |

### 3.2 Weaknesses

| Weakness | Description | Mitigation Strategy |
|----------|-------------|---------------------|
| **iOS Only** | No Android version | Phase 2: React Native or KMP |
| **Single State Launch** | SD-only initially | Template documentation for forks |
| **No Backend** | Limited analytics | Phase 2: Optional analytics |
| **Manual Data Updates** | Legislature/bills data | Community contribution model |
| **Unknown Brand** | New entrant | Leverage PAC network |
| **Resource Constraints** | Small team | Open source contributors |

### 3.3 Opportunities

| Opportunity | Timeline | Potential Impact |
|-------------|----------|------------------|
| **2026 Midterm Elections** | Nov 2026 | HIGH - Peak civic interest |
| **Multi-State Expansion** | Q2 2026+ | HIGH - 50x market reach |
| **PAC Network Effect** | Ongoing | HIGH - Organic distribution |
| **Foundation Grants** | Q1 2026 | MEDIUM - Development funding |
| **University Partnerships** | Q3 2026 | MEDIUM - Campus deployment |
| **Civic Tech Community** | Ongoing | MEDIUM - Developer contributions |
| **Local News Partnerships** | Q2 2026 | MEDIUM - User acquisition |

### 3.4 Threats

| Threat | Probability | Severity | Mitigation |
|--------|-------------|----------|------------|
| **Platform Monopoly** | LOW | HIGH | Focus on unique value (education) |
| **Data Accuracy Issues** | MEDIUM | HIGH | Community verification, official sources |
| **Political Polarization** | HIGH | MEDIUM | Strict nonpartisan guidelines |
| **App Store Rejection** | LOW | HIGH | Comply with guidelines, no political ads |
| **Low Adoption** | MEDIUM | HIGH | PAC-driven distribution |
| **Competitor Features** | MEDIUM | LOW | Maintain education focus |
| **Volunteer Fatigue** | MEDIUM | MEDIUM | Simple contribution process |

---

## 4. Target User Personas

### 4.1 Primary Personas

#### Persona 1: "Civic-Curious Casey" (Primary)
```
┌────────────────────────────────────────────────────────────┐
│  CASEY - The Newly Engaged Citizen                         │
├────────────────────────────────────────────────────────────┤
│  Age: 22-35 │ Generation: Gen Z / Millennial               │
│  Location: Suburban/Urban South Dakota                     │
│  Education: Some college to bachelor's degree              │
├────────────────────────────────────────────────────────────┤
│  GOALS:                                                    │
│  • Understand how government actually works                │
│  • Find reliable, nonpartisan voting information           │
│  • Feel more confident participating in democracy          │
│  • Connect with like-minded community members              │
├────────────────────────────────────────────────────────────┤
│  PAIN POINTS:                                              │
│  • Overwhelmed by partisan news sources                    │
│  • Doesn't know who represents them                        │
│  • Never learned civics properly in school                 │
│  • Distrusts political institutions                        │
├────────────────────────────────────────────────────────────┤
│  BEHAVIORS:                                                │
│  • 4+ hours daily smartphone use                           │
│  • Prefers learning through short-form content             │
│  • Values authenticity and transparency                    │
│  • Shares content that resonates on social media           │
├────────────────────────────────────────────────────────────┤
│  SUCCESS METRICS:                                          │
│  • Completes 50+ flashcards                                │
│  • Bookmarks founding document sections                    │
│  • Uses Vote tab before election                           │
│  • Joins community Discord                                 │
└────────────────────────────────────────────────────────────┘
```

#### Persona 2: "Engaged Emma" (Secondary)
```
┌────────────────────────────────────────────────────────────┐
│  EMMA - The Active Advocate                                │
├────────────────────────────────────────────────────────────┤
│  Age: 35-55 │ Generation: Gen X / Older Millennial         │
│  Location: Small town / Rural South Dakota                 │
│  Education: Bachelor's degree or higher                    │
├────────────────────────────────────────────────────────────┤
│  GOALS:                                                    │
│  • Monitor state legislature effectively                   │
│  • Contact representatives on key issues                   │
│  • Organize community civic events                         │
│  • Educate others on civic participation                   │
├────────────────────────────────────────────────────────────┤
│  PAIN POINTS:                                              │
│  • Legislature info hard to navigate                       │
│  • Difficult to find representative contact info           │
│  • No central hub for local civic events                   │
│  • Committee hearings hard to track                        │
├────────────────────────────────────────────────────────────┤
│  BEHAVIORS:                                                │
│  • Attends town halls and public meetings                  │
│  • Writes letters to representatives                       │
│  • Volunteers for nonpartisan causes                       │
│  • Organizes in-person events                              │
├────────────────────────────────────────────────────────────┤
│  SUCCESS METRICS:                                          │
│  • Uses Contact Reps feature monthly                       │
│  • Submits civic event                                     │
│  • Shares app with 5+ people                               │
│  • Testifies at hearing (via app guidance)                 │
└────────────────────────────────────────────────────────────┘
```

#### Persona 3: "New Citizen Navid" (Tertiary)
```
┌────────────────────────────────────────────────────────────┐
│  NAVID - The New American                                  │
├────────────────────────────────────────────────────────────┤
│  Age: 25-45 │ Status: Naturalized citizen or permanent res │
│  Location: Urban area                                      │
│  Education: Varies                                         │
├────────────────────────────────────────────────────────────┤
│  GOALS:                                                    │
│  • Master US civics knowledge                              │
│  • Understand American founding documents                  │
│  • Participate fully in democracy                          │
│  • Help family members learn civics                        │
├────────────────────────────────────────────────────────────┤
│  PAIN POINTS:                                              │
│  • Formal civics test anxiety                              │
│  • Language barriers with complex documents                │
│  • Unfamiliar with state/local government                  │
│  • Limited understanding of local voting process           │
├────────────────────────────────────────────────────────────┤
│  SUCCESS METRICS:                                          │
│  • Completes all 100 USCIS flashcards                      │
│  • Reads full Constitution                                 │
│  • Registers to vote via app resources                     │
└────────────────────────────────────────────────────────────┘
```

### 4.2 User Demographics Summary

| Demographic | Primary | Secondary | Tertiary |
|-------------|---------|-----------|----------|
| Age Range | 22-35 | 35-55 | 25-45 |
| Generation | Gen Z/Millennial | Gen X | Mixed |
| Tech Comfort | High | Medium-High | Medium |
| Civic Knowledge | Low-Medium | High | Low |
| Engagement Level | Learning | Active | Learning |
| Platform | iOS-primary | iOS/Desktop | iOS |

---

## 5. Core User Loops

### 5.1 Primary Loop: Learn & Engage

```
                    ┌─────────────────┐
                    │   DISCOVERY     │
                    │  (App Download) │
                    └────────┬────────┘
                             │
                             ▼
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐    │
│    │   LEARN     │───▶│  EXPLORE    │───▶│   ACTION    │    │
│    │ Flashcards  │    │  Documents  │    │   Vote/     │    │
│    │ (Civics)    │    │  Resources  │    │  Contact    │    │
│    └─────────────┘    └─────────────┘    └─────────────┘    │
│           │                  │                  │            │
│           │                  │                  │            │
│           ▼                  ▼                  ▼            │
│    ┌─────────────────────────────────────────────────────┐  │
│    │              PROGRESS TRACKING                       │  │
│    │         (Cards viewed, bookmarks, activity)          │  │
│    └─────────────────────────────────────────────────────┘  │
│                             │                                │
│                             ▼                                │
│    ┌─────────────────────────────────────────────────────┐  │
│    │                COMMUNITY                             │  │
│    │        (Discord, Newsletter, Events)                 │  │
│    └─────────────────────────────────────────────────────┘  │
│                             │                                │
└─────────────────────────────┼────────────────────────────────┘
                              │
                              ▼
                    ┌─────────────────┐
                    │    RETENTION    │
                    │   (Daily Use)   │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │    ADVOCACY     │
                    │  (Share App)    │
                    └─────────────────┘
```

### 5.2 Engagement Metrics

| Stage | Key Metric | Target | Measurement |
|-------|------------|--------|-------------|
| Discovery | Downloads | 5K (SD launch) | App Store |
| Activation | First flashcard viewed | 80% of downloads | Core Data |
| Retention | Week 1 return | 40% | Core Data |
| Revenue | Newsletter signups | 20% of users | Core Data |
| Referral | App shares | 10% share rate | Estimate |

### 5.3 Session Flow

```
Average Session Duration Target: 5-8 minutes

QUICK SESSION (2-3 min):
┌──────────┐   ┌──────────┐   ┌──────────┐
│ Open App │──▶│ 5-10     │──▶│  Close   │
│          │   │ Flashcards│   │          │
└──────────┘   └──────────┘   └──────────┘

DEEP SESSION (8-15 min):
┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐
│ Open App │──▶│ Browse   │──▶│ Read     │──▶│ Bookmark │
│          │   │ Documents│   │ Section  │   │ & Share  │
└──────────┘   └──────────┘   └──────────┘   └──────────┘

ACTION SESSION (5-10 min):
┌──────────┐   ┌──────────┐   ┌──────────┐
│ Open App │──▶│ Find Rep │──▶│ Send     │
│          │   │ Info     │   │ Email    │
└──────────┘   └──────────┘   └──────────┘
```

---

## 6. MVP Scope

### 6.1 Feature Priority Matrix

| Feature | Impact | Effort | Priority | MVP |
|---------|--------|--------|----------|-----|
| USCIS Flashcards (100) | HIGH | LOW | P0 | YES |
| SD Flashcards (100) | HIGH | MEDIUM | P0 | YES |
| Founding Documents | HIGH | MEDIUM | P0 | YES |
| Document Search | HIGH | LOW | P0 | YES |
| Bookmarks | MEDIUM | LOW | P0 | YES |
| Vote Resources | HIGH | LOW | P0 | YES |
| Contact Reps | HIGH | MEDIUM | P0 | YES |
| Newsletter Signup | MEDIUM | LOW | P0 | YES |
| SD Legislature Browser | MEDIUM | MEDIUM | P1 | YES |
| 2026 Bills Browser | MEDIUM | MEDIUM | P1 | YES |
| Committee Hearings | MEDIUM | MEDIUM | P1 | YES |
| Civic Events | MEDIUM | HIGH | P1 | YES |
| Testify Guide | MEDIUM | LOW | P1 | YES |
| Push Notifications | MEDIUM | HIGH | P2 | NO |
| Android Version | HIGH | HIGH | P2 | NO |
| Multi-language | MEDIUM | HIGH | P2 | NO |
| Offline Sync | LOW | HIGH | P3 | NO |
| Analytics Dashboard | LOW | MEDIUM | P3 | NO |

### 6.2 MVP Feature Set

```
┌─────────────────────────────────────────────────────────────┐
│                    MVP SCOPE (v1.0)                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  LEARN TAB                    SOUTH DAKOTA TAB              │
│  ├── 100 USCIS Flashcards    ├── 100 SD Flashcards          │
│  ├── Category Filtering      ├── Legislature Hub            │
│  ├── Shuffle Mode            │   ├── Statutes Browser       │
│  └── Progress Tracking       │   └── 2026 Bills Browser     │
│                              ├── Contact Representatives    │
│  DOCUMENTS TAB               ├── Civic Events               │
│  ├── Declaration             └── Committee Hearings         │
│  ├── Constitution                                           │
│  ├── Bill of Rights          VOTE TAB                       │
│  ├── All 27 Amendments       ├── Ballotpedia Embed          │
│  ├── SD Constitution (link)  ├── Pennington County Links    │
│  ├── Full-text Search        └── SD SOS Resources           │
│  └── Bookmarking                                            │
│                              CONNECT TAB                     │
│  ABOUT TAB                   ├── Discord Link               │
│  ├── Mission & Values        ├── Newsletter Signup          │
│  ├── Founder Info            └── Social Media Links         │
│  └── Donate Link                                            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 6.3 Out of Scope (v1.0)

- User accounts / authentication
- Push notifications
- Android version
- Multi-language support
- Backend analytics
- Event calendar sync
- Volunteer management
- Donation processing in-app

---

## 7. Technical Stack

### 7.1 Current Architecture

| Layer | Technology | Rationale |
|-------|------------|-----------|
| **Platform** | iOS 17.0+ | Modern SwiftUI features |
| **Language** | Swift 5.9+ | Type safety, performance |
| **UI Framework** | SwiftUI | Declarative, native feel |
| **Persistence** | Core Data | Offline-first, Apple standard |
| **Web Content** | WebKit | Legislature/Ballotpedia embeds |
| **Build System** | Xcode 15+ | Standard iOS toolchain |

### 7.2 Architecture Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                      PRESENTATION LAYER                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌───────────┐ ┌───────────┐ ┌───────────┐ ┌───────────┐  │
│   │  LearnTab │ │   SDTab   │ │  DocsTab  │ │  VoteTab  │  │
│   │   View    │ │   View    │ │   View    │ │   View    │  │
│   └─────┬─────┘ └─────┬─────┘ └─────┬─────┘ └─────┬─────┘  │
│         │             │             │             │         │
│   ┌─────┴─────┐ ┌─────┴─────┐ ┌─────┴─────┐ ┌─────┴─────┐  │
│   │ConnectTab │ │ AboutTab  │ │  Shared   │ │  WebView  │  │
│   │   View    │ │   View    │ │Components │ │ Wrapper   │  │
│   └───────────┘ └───────────┘ └───────────┘ └───────────┘  │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│                      BUSINESS LOGIC LAYER                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌─────────────────┐  ┌─────────────────┐                  │
│   │ FlashcardProgress│  │ SD Progress     │                  │
│   │    Manager      │  │   Manager       │                  │
│   └────────┬────────┘  └────────┬────────┘                  │
│            │                    │                           │
│   ┌────────┴────────┐  ┌────────┴────────┐                  │
│   │ BookmarkManager │  │NewsletterManager│                  │
│   └────────┬────────┘  └────────┬────────┘                  │
│            │                    │                           │
├────────────┴────────────────────┴───────────────────────────┤
│                      DATA LAYER                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌─────────────────────────────────────────────────────┐   │
│   │                    CORE DATA                         │   │
│   ├─────────────────────────────────────────────────────┤   │
│   │  FlashcardProgress │ SDFlashcardProgress            │   │
│   │  NewsletterSignup  │ DocumentBookmark               │   │
│   └─────────────────────────────────────────────────────┘   │
│                                                             │
│   ┌─────────────────────────────────────────────────────┐   │
│   │               STATIC DATA (Swift)                    │   │
│   ├─────────────────────────────────────────────────────┤   │
│   │  CivicsQuestions.swift   │ SDQuestions.swift        │   │
│   │  FoundingDocuments.swift │ SDLegislators.swift      │   │
│   └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 7.3 State Configuration System (Open Source Key)

```swift
// Planned: AppConfig.swift for state/org customization

struct AppConfig {
    // Organization Details
    let orgName: String
    let orgTagline: String
    let contactEmail: String
    let websiteURL: URL

    // State Configuration
    let stateName: String
    let stateAbbrev: String
    let capital: String
    let legislatureURL: URL
    let sosElectionsURL: URL

    // County/Local (Optional)
    let primaryCounty: String?
    let countyElectionsURL: URL?

    // Branding
    let primaryColor: Color
    let accentColor: Color
    let logoImageName: String

    // Feature Flags
    let enableLegislature: Bool
    let enableEvents: Bool
    let enableContactReps: Bool
}
```

### 7.4 Future Technical Considerations

| Phase | Technology | Purpose |
|-------|------------|---------|
| v1.1 | CloudKit | Optional sync across devices |
| v2.0 | React Native / KMP | Android support |
| v2.0 | Supabase / Firebase | Backend analytics |
| v2.x | OpenAI / Local LLM | Document Q&A |
| v3.0 | Vapor / Swift Server | Newsletter backend |

---

## 8. Development Timeline

### 8.1 Phase Overview

```
┌─────────────────────────────────────────────────────────────────────┐
│                        DEVELOPMENT PHASES                            │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  PHASE 1: MVP COMPLETION                                            │
│  ────────────────────────                                           │
│  • Complete SD Legislature web views testing                        │
│  • Create AppConfig.swift configuration system                      │
│  • App icon and launch screen assets                                │
│  • Full simulator testing across devices                            │
│  • Bug fixes and polish                                             │
│                                                                     │
│  PHASE 2: APP STORE LAUNCH                                          │
│  ─────────────────────────                                          │
│  • App Store Connect setup                                          │
│  • Screenshots and marketing materials                              │
│  • Privacy policy and terms                                         │
│  • TestFlight beta testing                                          │
│  • App Store submission and review                                  │
│                                                                     │
│  PHASE 3: OPEN SOURCE RELEASE                                       │
│  ───────────────────────────                                        │
│  • Clean up codebase for public release                             │
│  • Write comprehensive README and contributing guide                │
│  • Create state template documentation                              │
│  • GitHub repository setup with issues templates                    │
│  • License selection (MIT/Apache 2.0)                               │
│                                                                     │
│  PHASE 4: MULTI-STATE EXPANSION                                     │
│  ─────────────────────────────                                      │
│  • Partner with PACs in 2-3 additional states                       │
│  • Create state data packages                                       │
│  • Community contributor onboarding                                 │
│  • Shared component library                                         │
│                                                                     │
│  PHASE 5: PLATFORM EXPANSION                                        │
│  ───────────────────────────                                        │
│  • Android version development                                      │
│  • Backend infrastructure for analytics                             │
│  • Push notification system                                         │
│  • Multi-language support                                           │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 8.2 Milestone Checklist

| Milestone | Dependencies | Status |
|-----------|--------------|--------|
| Core UI Complete | - | DONE |
| USCIS Flashcards | - | DONE |
| SD Module | Core UI | DONE |
| Founding Documents | - | DONE |
| Contact Reps | SD Module | DONE |
| Civic Events | SD Module | DONE |
| Committee Hearings | SD Module | DONE |
| AppConfig System | All features | TODO |
| App Icon/Launch | - | TODO |
| TestFlight Beta | All features | TODO |
| App Store Launch | TestFlight | TODO |
| GitHub Public | App Store | TODO |

---

## 9. Domain & Distribution Strategy

### 9.1 Distribution Channels

| Channel | Strategy | Expected Impact |
|---------|----------|-----------------|
| **App Store** | Primary distribution, SEO optimization | HIGH |
| **PAC Website** | Direct download link, QR codes | HIGH |
| **PAC Events** | In-person demos, flyers | HIGH |
| **Social Media** | @bettertogether_605 Instagram | MEDIUM |
| **Local Media** | Press releases, news coverage | MEDIUM |
| **Partner PACs** | Cross-promotion (future) | MEDIUM |
| **Universities** | Campus civic engagement programs | LOW (initial) |

### 9.2 App Store Optimization (ASO)

**Proposed App Store Listing:**

| Element | Content |
|---------|---------|
| **App Name** | PoP - People Over Party |
| **Subtitle** | Civic Education & Voter Resources |
| **Keywords** | civics, voting, constitution, flashcards, democracy, South Dakota, voter registration, civic engagement |
| **Category** | Education (Primary), Reference (Secondary) |
| **Age Rating** | 4+ |

**Value Propositions for Screenshots:**
1. "Learn civics with 100+ flashcards"
2. "Explore the Constitution & founding documents"
3. "Find your ballot and voting info"
4. "Contact your representatives"
5. "Join your civic community"

### 9.3 Open Source Repository Structure

```
github.com/peopleoverparty/pop-ios/
├── README.md                    # Quick start guide
├── CONTRIBUTING.md             # How to contribute
├── LICENSE                     # MIT or Apache 2.0
├── CODE_OF_CONDUCT.md          # Community guidelines
├── FORKING_GUIDE.md            # How to create state version
├── docs/
│   ├── ARCHITECTURE.md         # Technical overview
│   ├── STATE_TEMPLATE.md       # Creating state modules
│   └── DATA_FORMATS.md         # Question/document formats
├── PoP/                        # Main iOS project
├── StateTemplates/             # Template files for new states
│   ├── {State}Questions.swift.template
│   ├── {State}Legislators.swift.template
│   └── {State}Config.swift.template
└── Scripts/
    └── generate-state.py       # State module generator
```

---

## 10. Launch Strategy

### 10.1 Pre-Launch

| Action | Purpose | Timing |
|--------|---------|--------|
| TestFlight beta with PAC members | Early feedback | Pre-launch |
| Soft launch press release | Local media awareness | 1 week before |
| Social media teaser campaign | Build anticipation | 2 weeks before |
| PAC newsletter announcement | Existing audience | Launch day |

### 10.2 Launch

| Action | Channel | Notes |
|--------|---------|-------|
| App Store release | iOS App Store | Coordinate with PAC |
| Press release | Local SD media | Rapid City Journal, KOTA |
| Social media blitz | Instagram, Facebook | Day-of posts |
| PAC event demo | In-person | Launch event |
| Email to subscribers | Newsletter | Immediate |

### 10.3 Post-Launch

| Action | Timeline | Goal |
|--------|----------|------|
| Monitor App Store reviews | Daily (week 1) | Quick issue response |
| Gather user feedback | Ongoing | Feature prioritization |
| Submit GitHub repository | Week 2-3 | Open source visibility |
| Contact partner PACs | Month 2+ | Multi-state expansion |
| Apply for civic tech grants | Month 2+ | Funding for expansion |

### 10.4 Growth Metrics

| Metric | 30 Days | 90 Days | 1 Year |
|--------|---------|---------|--------|
| Downloads | 500 | 2,000 | 10,000 |
| DAU | 50 | 200 | 1,000 |
| Newsletter signups | 100 | 500 | 2,500 |
| App Store rating | 4.0+ | 4.5+ | 4.5+ |
| GitHub stars | - | 50 | 500 |
| State forks | - | 0 | 3-5 |

---

## 11. Success Metrics & KPIs

### 11.1 Key Performance Indicators

| Category | KPI | Target | Measurement |
|----------|-----|--------|-------------|
| **Acquisition** | Downloads | 10K Year 1 | App Store Connect |
| **Activation** | First flashcard | 80% of downloads | Core Data |
| **Engagement** | Flashcards/session | 10+ | Core Data |
| **Retention** | D7 retention | 40% | Core Data |
| **Retention** | D30 retention | 20% | Core Data |
| **Community** | Newsletter signups | 25% of users | Core Data |
| **Community** | Discord joins | 10% of users | Manual |
| **Action** | Vote tab usage | 30% of users | Core Data |
| **Action** | Contact reps usage | 15% of users | Core Data |
| **Open Source** | GitHub forks | 5+ states | GitHub |

### 11.2 Civic Impact Metrics (Qualitative)

- Number of committee hearing testimonies (self-reported)
- Voter registration assistance
- Community events facilitated
- Other states/PACs adopting platform
- Media coverage and mentions

---

## 12. Risks & Mitigations

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| **Low adoption** | Medium | High | Strong PAC distribution channel, local media |
| **App Store rejection** | Low | High | Strict nonpartisan policy, no political ads |
| **Data accuracy issues** | Medium | Medium | Official sources, community verification |
| **Contributor burnout** | Medium | Medium | Clear documentation, small commits |
| **Political backlash** | Low | Medium | Strict nonpartisan positioning, King Center philosophy |
| **Platform competition** | Medium | Low | Focus on education + state-specific niche |
| **Technical debt** | Medium | Medium | Clean architecture, code reviews |

---

## 13. Appendices

### Appendix A: Competitor Feature Comparison

| Feature | PoP | Vote.org | Ballotpedia | Rock the Vote | BallotReady |
|---------|-----|----------|-------------|---------------|-------------|
| Voter Registration | Link | YES | YES | YES | YES |
| Ballot Lookup | Embed | YES | YES | YES | YES |
| Civics Education | 200+ cards | NO | NO | NO | NO |
| Founding Documents | Full text | NO | NO | NO | NO |
| State-Specific | YES | NO | Partial | NO | Partial |
| Contact Reps | YES | NO | Link | NO | NO |
| Legislature Browser | YES | NO | Link | NO | NO |
| Community Features | YES | NO | NO | NO | NO |
| Offline Access | YES | NO | NO | NO | NO |
| Open Source | YES | NO | NO | NO | NO |
| iOS Native | YES | NO | NO | NO | YES |

### Appendix B: State Expansion Potential

| State | Population | Independent Voters | Civic PAC Presence | Priority |
|-------|------------|-------------------|-------------------|----------|
| South Dakota | 909K | High | YES (PoP) | CURRENT |
| Montana | 1.1M | High | Unknown | HIGH |
| Wyoming | 577K | High | Unknown | HIGH |
| North Dakota | 779K | High | Unknown | HIGH |
| Iowa | 3.2M | Medium | Unknown | MEDIUM |
| Minnesota | 5.7M | Medium | Unknown | MEDIUM |
| Nebraska | 2.0M | Medium | Unknown | MEDIUM |
| Colorado | 5.8M | High | Multiple | MEDIUM |

### Appendix C: Key Resources

**Official Sources:**
- USCIS Civics Test: https://www.uscis.gov/citizenship
- Ballotpedia: https://ballotpedia.org/
- SD Secretary of State: https://sdsos.gov/elections-voting/
- The King Center: https://thekingcenter.org/

**Open Source Civic Tech:**
- Decidim: https://decidim.org/
- Consul: https://consulproject.org/
- Citizens Foundation: https://github.com/CitizensFoundation

**Research:**
- Brennan Center: https://www.brennancenter.org/
- Brookings Civic Tech: https://www.brookings.edu/articles/the-future-of-civic-technology/

---

## Document History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | Jan 15, 2026 | Product Analysis | Initial PRD with full market validation |

---

*This PRD supports the mission of Better Together: People Over Party - promoting civic engagement through education, not division.*
