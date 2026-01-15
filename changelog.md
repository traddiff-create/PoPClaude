# PoP iOS App - Changelog

All notable changes to the People Over Party iOS app are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

### Planned
- AppConfig.swift for state/org configuration
- App icon and launch screen design
- Full SD Legislators database population
- App Store submission prep
- Forking documentation for other PACs

---

## [0.3.0] - 2026-01-14

### Added - Civic Engagement Features

#### Committee Hearings (`SDHearingsView.swift`)
- Committee schedule browser via WebView (sdlegislature.gov)
- "How to Testify" detailed 5-step guide
- Tips for effective testimony (do's and don'ts)
- Standing committees reference (14 committees)
- LRC contact information (phone and email)
- Registration requirement alert banner

#### Civic Events (`CivicEventsView.swift`)
- Events hub with WebView integration to Squarespace
- Browse events at peopleoverpartysd.com/events
- Submit events at peopleoverpartysd.com/events/submit
- Event type categories (Rallies, Town Halls, Marches, Voter Drives, Forums, Community)
- Nonviolence Guidelines view with King Center Six Principles
- Event submission guidelines (admin-approved, nonviolent only)

### Changed
- Updated `SouthDakotaView.swift` with 2 new feature cards (Civic Events, Committee Hearings)
- South Dakota hub now has 5 features (was 3)

---

## [0.2.0] - 2026-01-14

### Added - Contact Representatives Feature

#### Representatives Database (`SDLegislators.swift`)
- US Congress members (Thune, Rounds, Johnson)
- SD Senate sample representatives
- SD House sample representatives
- Party affiliation enum (Republican, Democrat, Independent)
- Contact info (email, phone, district)

#### Contact Interface (`ContactRepsView.swift`)
- Native list with checkbox selection
- Individual email and phone buttons
- "Select All" for batch operations
- Floating action bar when reps selected
- "Find My Representatives" via WebView (sdlegislature.gov/Legislators/Find)

#### Email Functionality
- `EmailComposer` helper for mailto: URL generation
- Group email support (multiple recipients)
- `MessageTemplate` with 5 pre-written templates:
  - General Constituent Message
  - Support a Bill
  - Oppose a Bill
  - Request a Meeting
  - Thank You Message

### Changed
- Updated `SouthDakotaView.swift` to include Contact Representatives card

---

## [0.1.0] - 2026-01-14

### Added - South Dakota Module

#### SD Civics Flashcards
- `SouthDakotaQuestions.swift` - 100 SD-specific civics questions
- Three categories: State, County (Pennington), Municipal (Rapid City)
- `SouthDakotaLearnView.swift` - Flashcard UI matching US civics style
- `SDProgressManager.swift` - Core Data persistence for SD progress
- `SDFlashcardProgress` Core Data entity

#### SD Legislature Browser
- `SDLegislatureView.swift` - Hub for legislature resources
- `SDStatutesView.swift` - Browse all 63 SDCL titles with WebKit
- `SDBillsView.swift` - 2026 Session bills browser (71st Session)
- WebView integration for all legislature content

#### Hub View
- `SouthDakotaView.swift` - Main hub with feature cards
- Quick stats (Statehood: 1889, Capital: Pierre, Counties: 66)

### Changed
- Added "South Dakota" tab to main TabView in `ContentView.swift`
- Updated `CLAUDE.md` with SD module documentation

---

## [0.0.1] - 2026-01-13

### Added - Initial App Structure

#### Core App
- `PoPApp.swift` - App entry point with Core Data integration
- `ContentView.swift` - Main TabView with 6 tabs
- `Persistence.swift` - Core Data stack setup
- `Theme.swift` - Brand colors (popBlue, popGold, popDarkBlue)

#### Learn Tab (US Civics)
- `LearnView.swift` - Flashcard UI with categories
- `CivicsQuestions.swift` - All 100 USCIS naturalization questions
- `FlashcardProgressManager.swift` - Progress tracking
- Shuffle/random mode, progress tracking

#### Documents Tab
- `DocumentsView.swift` - Document list with search
- `FoundingDocuments.swift` - Complete document text:
  - Declaration of Independence (with signers)
  - U.S. Constitution (Preamble + 7 Articles)
  - All 27 Constitutional Amendments
  - South Dakota Constitution (placeholder)
- `BookmarkManager.swift` - Section bookmarking

#### Vote Tab
- `VoteView.swift` - Ballotpedia integration
- Pennington County quick links
- SD Secretary of State resources

#### Connect Tab
- `ConnectView.swift` - Newsletter signup form
- `NewsletterManager.swift` - Local storage with CSV export
- Social media links

#### About Tab
- `AboutView.swift` - Mission, values, founder info
- King Center philosophy integration
- Contact information

### Documentation
- `CLAUDE.md` - Comprehensive project documentation
- King Center Six Principles of Nonviolence
- Adaptable architecture vision

### Configuration
- Bundle Identifier: `com.peopleoverpartysd.pop`
- Deployment Target: iOS 17.0
- Removed Push Notifications and iCloud entitlements

---

## Version History Summary

| Version | Date | Focus |
|---------|------|-------|
| 0.3.0 | 2026-01-14 | Civic Events & Hearings |
| 0.2.0 | 2026-01-14 | Contact Representatives |
| 0.1.0 | 2026-01-14 | South Dakota Module |
| 0.0.1 | 2026-01-13 | Initial App Structure |

---

## Contributors

- **Organization**: Better Together: People Over Party
- **Founder**: Nicole Stone
- **Location**: Rapid City, South Dakota
