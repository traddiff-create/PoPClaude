# PoP - People Over Party iOS App

## Project Overview

**PoP** (People Over Party) is an iOS app for the **Better Together: People Over Party** political action committee based in Rapid City, South Dakota. Founded by Nicole Stone, the PAC promotes civic engagement, voter education, and community building without telling people how to vote.

### Mission
- Educate citizens on civics and the democratic process
- Provide easy access to voter resources and registration
- Make founding documents accessible and searchable
- Build community through shared civic values
- Encourage participation in democracy

### Guiding Philosophy
Inspired by Dr. Martin Luther King Jr.'s philosophy of nonviolence (The King Center):

**Six Principles of Nonviolence:**
1. **Courageous Resistance** – Active resistance to injustice, not passive acceptance
2. **Friendship and Understanding** – The goal is reconciliation, creating "Beloved Community"
3. **Targeting Evil, Not People** – Distinguishing between wrongdoers and wrong actions
4. **Redemptive Suffering** – Voluntary suffering for justice can educate and transform
5. **Love Over Hate** – Resisting through understanding and creative love
6. **Faith in Justice** – Deep conviction that justice will ultimately prevail

**Six Steps for Nonviolent Social Change:**
1. Information Gathering – Research all perspectives
2. Education – Inform and gain support through knowledge
3. Personal Commitment – Prepare for the work ahead
4. Negotiation – Engage respectfully to highlight issues
5. Direct Action – Apply creative pressure when needed
6. Reconciliation – Seek friendship and collaborative resolution

Source: https://thekingcenter.org/about-tkc/the-king-philosophy/

### Contact
- **Address**: 2511 W Chicago, Rapid City, SD
- **Phone**: (605) 389-3613
- **Email**: hello@peopleoverpartysd.com
- **Newsletter**: peopleoverpartysd@gmail.com
- **Instagram**: @bettertogether_605
- **Website**: https://www.peopleoverpartysd.com/

---

## App Architecture

### Platform
- iOS 17.0+ (iPhone and iPad)
- SwiftUI with Core Data for offline document storage
- No user accounts required
- Offline-first design

### Brand Colors
- **Primary Blue**: `#1A7BA8` (Deep teal)
- **Accent Gold**: `#E8A832` (Warm golden yellow)
- **White**: `#FFFFFF`
- **Dark Background**: `#0D3D54`
- **Light Background**: `#F5F5F5`

### Main Tabs
1. **Learn** - Civics flashcards (100 USCIS naturalization questions)
2. **South Dakota** - State-specific resources hub:
   - SD Civics Flashcards (100 questions: State/County/Municipal)
   - SD Legislature (Statutes browser, 2026 Bills)
3. **Documents** - Searchable founding documents database
4. **Vote** - Ballotpedia ballot lookup + Pennington County resources
5. **Connect** - Community links (Discord) + newsletter signup
6. **About** - Organization info and mission

---

## Feature Specifications

### 1. Learn Tab (Civics Flashcards)
- 100 USCIS civics test questions in flashcard format
- Tap to reveal answer
- Shuffle/random mode
- Progress tracking (cards viewed)
- Categories: American Government, American History, Integrated Civics
- Fun, educational tone - not a test

### 2. Documents Tab
- **Included Documents**:
  - U.S. Constitution (organized by Article/Section)
  - Bill of Rights (separate, Amendments 1-10)
  - Declaration of Independence
  - South Dakota Constitution
- Full-text search across all documents
- Bookmark sections (user can save favorites)
- Adjustable font size for reading
- Offline access - all text stored locally
- Clean, readable typography

### 3. Vote Tab
- **Ballotpedia Integration**: Embedded "Find My Ballot" lookup
- **Pennington County Quick Links**:
  - Voter Registration
  - Polling Locations
  - Absentee Voting
  - Election Calendar
- **South Dakota State Resources**:
  - SD Secretary of State
  - State election info
- Attribution to Ballotpedia as data source

### 4. Connect Tab
- Discord community link (or similar)
- Newsletter signup form (name + email)
- "Newsletter coming soon" messaging
- Social media links
- Contact information

### 5. About Tab
- Organization mission and values
- "People Over Party" philosophy
- Nicole Stone founder info
- How to get involved
- Donate link
- Open-source vision for other PACs

---

## Data Models (Core Data)

### Document Entity
```
- id: UUID
- title: String
- category: String (constitution, billOfRights, declaration)
- content: String (full text)
- sectionTitle: String?
- sectionNumber: Int?
- isBookmarked: Bool
- lastAccessed: Date?
```

### FlashcardProgress Entity
```
- id: UUID
- questionId: Int
- timesViewed: Int
- lastViewed: Date?
- isMarkedKnown: Bool
```

### NewsletterSignup Entity
```
- id: UUID
- name: String
- email: String
- signupDate: Date
- syncedToServer: Bool
```

---

## External Resources

### Ballotpedia
- URL: https://ballotpedia.org/
- Use for: Sample ballot lookup, election info
- Must cite as source

### Pennington County Elections
- URL: https://www.pennco.org/index.asp?SEC=178876A6-5EBF-4727-B9AC-396FA4392859
- Phone: 605-394-2153
- Address: PO Box 6160, Rapid City SD 57709-6160

### South Dakota Secretary of State
- URL: https://sdsos.gov/elections-voting/

---

## Development Notes

### File Structure
```
PoP/
├── PoPApp.swift              # App entry point
├── ContentView.swift         # Main TabView
├── Persistence.swift         # Core Data stack
├── Theme/
│   └── Theme.swift           # Colors, fonts, styling
├── Models/
│   └── DataModels.swift      # Swift data structures
├── Views/
│   ├── LearnTab/
│   │   ├── LearnView.swift
│   │   └── FlashcardView.swift
│   ├── DocumentsTab/
│   │   ├── DocumentsView.swift
│   │   └── DocumentDetailView.swift
│   ├── VoteTab/
│   │   └── VoteView.swift
│   ├── ConnectTab/
│   │   └── ConnectView.swift
│   └── AboutTab/
│       └── AboutView.swift
├── Data/
│   ├── CivicsQuestions.swift
│   └── FoundingDocuments.swift
└── Assets.xcassets/
    └── Colors/
```

### Adaptable Architecture (Open Source Vision)

**GOAL: Make this app adaptable for any state or PAC to promote transparency and civic engagement nationwide.**

#### Configuration System (Planned)
```swift
// AppConfig.swift - Central configuration for state/org customization
struct AppConfig {
    // Organization
    let orgName: String           // "People Over Party"
    let orgTagline: String        // "Better Together"
    let contactEmail: String
    let contactPhone: String
    let website: URL

    // State Configuration
    let stateName: String         // "South Dakota"
    let stateAbbrev: String       // "SD"
    let capital: String           // "Pierre"
    let legislatureURL: URL       // sdlegislature.gov
    let sosURL: URL               // Secretary of State

    // County/Municipal (optional)
    let countyName: String?       // "Pennington County"
    let municipalName: String?    // "Rapid City"

    // Branding
    let primaryColor: Color
    let accentColor: Color
    let logoImage: String
}
```

#### State Module Structure
Each state would have its own module containing:
- `{State}Questions.swift` - State/County/Municipal civics questions
- `{State}LegislatureView.swift` - State legislature browser
- `{State}StatutesData.swift` - State law titles and links
- `{State}Resources.swift` - County/municipal election offices

#### Forking Guide for Other PACs
1. Fork the repository
2. Update `AppConfig.swift` with your organization details
3. Replace state-specific data files
4. Update branding colors and assets
5. Configure App Store submission info

#### Future Features
- Multi-state support within single app
- Automatic legislature session updates
- Event calendar integration
- Volunteer signup system
- Push notifications for action alerts
- Multiple language support
- Accessibility enhancements

---

## Build Commands

```bash
# Open in Xcode
open /Users/rorystone/Documents/PoPClaude/PoP/PoP.xcodeproj

# Build from command line
xcodebuild -project PoP.xcodeproj -scheme PoP -destination 'platform=iOS Simulator,name=iPhone 15'
```

---

## Development Progress

### Completed (Jan 14, 2026)

**Core App:**
- [x] ContentView.swift - Main TabView with 6 tabs (added South Dakota)
- [x] Theme.swift - Brand colors and button styles
- [x] CivicsQuestions.swift - All 100 USCIS questions
- [x] LearnView.swift - Flashcard UI with categories, shuffle, progress tracking
- [x] DocumentsView.swift - Document list with search and bookmarking
- [x] VoteView.swift - Ballotpedia + county/state resources
- [x] ConnectView.swift - Newsletter signup with Core Data persistence + CSV export
- [x] AboutView.swift - Mission, values, founder info
- [x] FlashcardProgressManager.swift - Core Data persistence for learning progress
- [x] NewsletterManager.swift - Local storage with CSV export for signups
- [x] BookmarkManager.swift - Document bookmark persistence

**Founding Documents:**
- [x] FoundingDocuments.swift - Complete with full text:
  - Declaration of Independence (with all signers)
  - U.S. Constitution (Preamble + 7 Articles with signers)
  - All 27 Constitutional Amendments
  - South Dakota Constitution (placeholder with link)

**South Dakota Module (NEW):**
- [x] SouthDakotaView.swift - Hub for all SD content
- [x] SouthDakotaQuestions.swift - 100 SD civics questions (State/County/Municipal)
- [x] SouthDakotaLearnView.swift - SD flashcard UI
- [x] SDProgressManager.swift - Core Data persistence for SD progress
- [x] SDLegislatureView.swift - SD Legislature hub
- [x] SDStatutesView.swift - Browse all 63 SDCL titles with WebKit
- [x] SDBillsView.swift - 2026 Session bills browser (71st Session)
- [x] Core Data entity: SDFlashcardProgress

**Contact Representatives Feature (NEW):**
- [x] SDLegislators.swift - Database of SD legislators (US Congress + State)
- [x] ContactRepsView.swift - Native contact list with selection
- [x] EmailComposer helper - Group email functionality
- [x] MessageTemplate - Pre-written message templates
- [x] Individual email/phone buttons
- [x] "Select All" for batch emailing
- [x] Find My Legislator (by address) via WebView

**Civic Events Feature (NEW):**
- [x] CivicEventsView.swift - Events hub with WebView integration
- [x] Find/browse events (Squarespace-hosted)
- [x] Submit event form (admin-approved)
- [x] Event type categories (rallies, town halls, voter drives, etc.)
- [x] NonviolenceGuidelinesView - King Center Six Principles
- [x] Event guidelines and submission rules

**Committee Hearings Feature (NEW):**
- [x] SDHearingsView.swift - Legislature hearings hub
- [x] Committee schedule browser (WebView)
- [x] HowToTestifyView - 5-step guide to testifying
- [x] Registration info and tips
- [x] Standing committees reference
- [x] LRC contact information

### Next Steps
- [ ] Build and test SD Legislature web views
- [ ] Create AppConfig.swift for state/org configuration
- [ ] App icon and launch screen design
- [ ] Test all features on simulator
- [ ] App Store submission prep
- [ ] Create forking documentation for other PACs

---

## Credits

- **Organization**: Better Together: People Over Party
- **Founder**: Nicole Stone
- **Location**: Rapid City, South Dakota
- **Civic Data**: Ballotpedia (https://ballotpedia.org/)
- **Inspiration**: Dakota Rural Action (https://www.dakotarural.org/)
