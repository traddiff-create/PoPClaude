# PoP iOS App - Project Status

**Last Updated:** January 14, 2026

---

## Quick Status

| Category | Status |
|----------|--------|
| **Development** | Active |
| **Version** | 0.3.0 (Pre-release) |
| **Platform** | iOS 17.0+ |
| **Build Status** | Ready for Testing |
| **App Store** | Not Submitted |

---

## Feature Completion

### Core App Structure

| Feature | Status | Notes |
|---------|--------|-------|
| TabView Navigation | Done | 6 tabs |
| Theme System | Done | Brand colors applied |
| Core Data Setup | Done | 4 entities |

### Tab 1: Learn (US Civics)

| Feature | Status | Notes |
|---------|--------|-------|
| 100 USCIS Questions | Done | All questions loaded |
| Flashcard UI | Done | Tap to reveal |
| Category Filter | Done | 3 categories |
| Shuffle Mode | Done | Random order |
| Progress Tracking | Done | Core Data persistence |

### Tab 2: South Dakota

| Feature | Status | Notes |
|---------|--------|-------|
| Hub View | Done | 5 feature cards |
| SD Civics Flashcards | Done | 100 questions |
| Contact Representatives | Done | Email + phone |
| Civic Events | Done | WebView to Squarespace |
| Committee Hearings | Done | Testimony guide |
| SD Legislature | Done | Statutes + Bills |

### Tab 3: Documents

| Feature | Status | Notes |
|---------|--------|-------|
| Declaration of Independence | Done | Full text + signers |
| US Constitution | Done | Preamble + 7 Articles |
| Bill of Rights | Done | Amendments 1-10 |
| All 27 Amendments | Done | Complete |
| SD Constitution | Partial | Link only (placeholder) |
| Search | Done | Full-text search |
| Bookmarks | Done | Core Data persistence |

### Tab 4: Vote

| Feature | Status | Notes |
|---------|--------|-------|
| Ballotpedia Embed | Done | Find My Ballot |
| Pennington County Links | Done | 4 quick links |
| SD SOS Links | Done | State resources |

### Tab 5: Connect

| Feature | Status | Notes |
|---------|--------|-------|
| Newsletter Signup | Done | Name + Email form |
| Local Storage | Done | Core Data |
| CSV Export | Done | For admin use |
| Social Links | Done | Instagram link |

### Tab 6: About

| Feature | Status | Notes |
|---------|--------|-------|
| Mission Statement | Done | |
| Founder Info | Done | Nicole Stone |
| King Center Philosophy | Done | 6 Principles |
| Contact Info | Done | Address, phone, email |
| Donate Link | Done | Website link |

---

## South Dakota Module Detail

### SD Civics Flashcards

| Category | Questions | Status |
|----------|-----------|--------|
| State Government | ~40 | Done |
| County (Pennington) | ~30 | Done |
| Municipal (Rapid City) | ~30 | Done |
| **Total** | **100** | **Done** |

### Contact Representatives

| Group | Count | Status |
|-------|-------|--------|
| US Congress | 3 | Done (Thune, Rounds, Johnson) |
| SD Senate | 35 | Sample data (needs full list) |
| SD House | 70 | Sample data (needs full list) |

### SD Legislature Browser

| Feature | URL | Status |
|---------|-----|--------|
| Statutes | sdlegislature.gov/Statutes | Done (63 titles) |
| 2026 Bills | sdlegislature.gov/Session/Bills/71 | Done |
| Committees | sdlegislature.gov/Session/Committees/71 | Done |
| Calendar | sdlegislature.gov/Session/Calendar/71 | Done |
| Find Legislator | sdlegislature.gov/Legislators/Find | Done |

### Civic Events (Squarespace Integration)

| Feature | URL | Status |
|---------|-----|--------|
| Browse Events | peopleoverpartysd.com/events | Pending (admin setup) |
| Submit Event | peopleoverpartysd.com/events/submit | Pending (admin setup) |
| Event Guidelines | In-app | Done |
| Nonviolence Principles | In-app | Done |

---

## Pending Tasks

### High Priority

- [ ] **Build & Test** - Run full app in iOS Simulator
- [ ] **Squarespace Setup** - Create /events and /events/submit pages
- [ ] **Full Legislators List** - Populate all 105 SD legislators

### Medium Priority

- [ ] **App Icon** - Design and add to Assets
- [ ] **Launch Screen** - Create branded splash screen
- [ ] **AppConfig.swift** - Create configuration system for adaptability

### Low Priority

- [ ] **SD Constitution** - Add full text (long document)
- [ ] **Forking Guide** - Documentation for other PACs
- [ ] **App Store Prep** - Screenshots, description, metadata

---

## Admin Tasks (Non-Development)

### Squarespace (peopleoverpartysd.com)

| Task | Status | Notes |
|------|--------|-------|
| Create /events page | Not Started | List upcoming events |
| Create /events/submit page | Not Started | Submission form |
| Add nonviolence pledge checkbox | Not Started | Required field |
| Mobile-responsive styling | Not Started | Match app colors |
| Form notification setup | Not Started | Email to admin |

### Content

| Task | Status | Notes |
|------|--------|-------|
| Gather full SD legislator list | Not Started | All 105 members |
| Add legislator photos (optional) | Not Started | Enhancement |
| Write additional message templates | Not Started | Topic-specific |

---

## Technical Debt

| Issue | Priority | Notes |
|-------|----------|-------|
| WebView loading states | Low | Add loading indicators |
| Error handling in WebViews | Low | Handle failed loads |
| Accessibility audit | Medium | VoiceOver, Dynamic Type |
| Unit tests | Medium | Test data managers |
| UI tests | Low | Test navigation flows |

---

## File Inventory

### Documentation
- [x] CLAUDE.md - Main project documentation
- [x] architecture.md - Technical architecture
- [x] changelog.md - Version history
- [x] project_status.md - This file

### Swift Files (PoP/PoP/)

#### Core
- [x] PoPApp.swift
- [x] ContentView.swift
- [x] Persistence.swift

#### Theme
- [x] Theme/Theme.swift

#### Data
- [x] Data/CivicsQuestions.swift
- [x] Data/FoundingDocuments.swift
- [x] Data/SouthDakotaQuestions.swift
- [x] Data/SDLegislators.swift

#### Managers
- [x] Managers/FlashcardProgressManager.swift
- [x] Managers/SDProgressManager.swift
- [x] Managers/BookmarkManager.swift
- [x] Managers/NewsletterManager.swift

#### Views
- [x] Views/LearnView.swift
- [x] Views/SouthDakotaView.swift
- [x] Views/SouthDakotaLearnView.swift
- [x] Views/SDLegislatureView.swift
- [x] Views/SDStatutesView.swift
- [x] Views/SDBillsView.swift
- [x] Views/ContactRepsView.swift
- [x] Views/CivicEventsView.swift
- [x] Views/SDHearingsView.swift
- [x] Views/DocumentsView.swift
- [x] Views/VoteView.swift
- [x] Views/ConnectView.swift
- [x] Views/AboutView.swift

---

## Contact

**Organization:** Better Together: People Over Party
**Founder:** Nicole Stone
**Email:** hello@peopleoverpartysd.com
**Phone:** (605) 389-3613
**Address:** 2511 W Chicago, Rapid City, SD
**Website:** https://www.peopleoverpartysd.com/

---

## Version

**Current:** 0.3.0 (Pre-release)
**Next Milestone:** 1.0.0 (App Store Release)
