# Android Platform Addendum
## PoP - People Over Party PRD Extension

---

**Document Version:** 1.0
**Date:** January 15, 2026
**Status:** Planning Complete
**Parent Document:** PRD_PoP_App.md

---

## Table of Contents

1. [Android Platform Overview](#1-android-platform-overview)
2. [Technical Architecture](#2-technical-architecture)
3. [Feature Parity Matrix](#3-feature-parity-matrix)
4. [Android-Specific Design](#4-android-specific-design)
5. [Development Phases](#5-development-phases)
6. [Testing Strategy](#6-testing-strategy)
7. [Play Store Strategy](#7-play-store-strategy)
8. [Resource Requirements](#8-resource-requirements)

---

## 1. Android Platform Overview

### 1.1 Why Android?

| Factor | Impact |
|--------|--------|
| **Market Share** | Android holds ~70% of global mobile market, ~45% in US |
| **Demographics** | Higher Android adoption in rural and lower-income areas |
| **South Dakota** | Rural state with significant Android user base |
| **Open Source Alignment** | Android's open nature matches PoP's open-source mission |
| **PAC Expansion** | Essential for nationwide adoption |

### 1.2 Target Specifications

| Specification | Requirement |
|---------------|-------------|
| **Minimum SDK** | API 26 (Android 8.0 Oreo) |
| **Target SDK** | API 34 (Android 14) |
| **Architecture** | Single Activity + Jetpack Compose |
| **Language** | Kotlin 1.9+ |
| **UI Framework** | Jetpack Compose + Material 3 |
| **Persistence** | Room Database |
| **Shared Code** | Kotlin Multiplatform (KMP) |

### 1.3 Device Support Matrix

```
┌─────────────────────────────────────────────────────────────────────┐
│                    ANDROID DEVICE SUPPORT                            │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  PHONES (Primary)                                                   │
│  ├── Small (5.0"-5.5"): 360dp width min                            │
│  ├── Medium (5.5"-6.5"): 390-420dp width                           │
│  └── Large (6.5"+): 420dp+ width                                   │
│                                                                     │
│  TABLETS (Secondary)                                                │
│  ├── 7" tablets: 600dp width                                       │
│  ├── 10" tablets: 800dp+ width                                     │
│  └── Adaptive layouts for landscape                                │
│                                                                     │
│  FOLDABLES (Future)                                                │
│  └── Support for unfolded states                                   │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 2. Technical Architecture

### 2.1 Project Structure

```
pop-multiplatform/
│
├── shared/                           # KMP SHARED MODULE
│   └── src/
│       ├── commonMain/               # Cross-platform code
│       │   ├── models/               # Data classes
│       │   ├── data/                 # Static data (questions, docs)
│       │   ├── repository/           # Repository interfaces
│       │   └── config/               # AppConfig, BrandColors
│       ├── androidMain/              # Android-specific actuals
│       └── iosMain/                  # iOS-specific actuals
│
├── androidApp/                       # ANDROID APPLICATION
│   └── src/main/
│       ├── kotlin/com/pop/android/
│       │   ├── MainActivity.kt       # Single Activity entry
│       │   ├── PopApplication.kt     # Application class
│       │   ├── ui/
│       │   │   ├── theme/            # Material 3 theming
│       │   │   └── screens/          # Compose screens
│       │   ├── navigation/           # Compose Navigation
│       │   ├── viewmodel/            # Android ViewModels
│       │   ├── data/
│       │   │   └── room/             # Room entities & DAOs
│       │   └── di/                   # Dependency injection
│       └── res/                      # Android resources
│
└── iosApp/                           # iOS APPLICATION (existing)
    └── PoP/                          # SwiftUI code
```

### 2.2 Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                         UI LAYER                                     │
│                    (Jetpack Compose)                                 │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│   ┌─────────────┐  ┌─────────────┐  ┌─────────────┐                │
│   │ LearnScreen │  │ DocsScreen  │  │ VoteScreen  │                │
│   └──────┬──────┘  └──────┬──────┘  └──────┬──────┘                │
│          │                │                │                        │
│   ┌──────┴──────┐  ┌──────┴──────┐  ┌──────┴──────┐                │
│   │  LearnVM    │  │   DocsVM    │  │   VoteVM    │                │
│   └──────┬──────┘  └──────┬──────┘  └──────┬──────┘                │
│          │                │                │                        │
├──────────┴────────────────┴────────────────┴────────────────────────┤
│                      DOMAIN LAYER                                    │
│                  (Shared KMP Module)                                 │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│   ┌───────────────────────────────────────────────────────────┐    │
│   │                    REPOSITORIES                            │    │
│   │  FlashcardProgressRepository  │  BookmarkRepository        │    │
│   └───────────────────────────────────────────────────────────┘    │
│                             │                                       │
│   ┌───────────────────────────────────────────────────────────┐    │
│   │                    STATIC DATA                             │    │
│   │  CivicsData  │  SouthDakotaData  │  FoundingDocuments      │    │
│   └───────────────────────────────────────────────────────────┘    │
│                                                                     │
├─────────────────────────────────────────────────────────────────────┤
│                       DATA LAYER                                     │
│                   (Android-Specific)                                 │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│   ┌───────────────────────────────────────────────────────────┐    │
│   │                    ROOM DATABASE                           │    │
│   │  FlashcardProgressEntity  │  BookmarkEntity  │  SignupEntity│    │
│   └───────────────────────────────────────────────────────────┘    │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 2.3 Key Dependencies

| Category | Library | Version | Purpose |
|----------|---------|---------|---------|
| **Core** | Kotlin | 1.9.21 | Language |
| **Core** | Coroutines | 1.7.3 | Async |
| **UI** | Compose BOM | 2023.10.01 | UI Framework |
| **UI** | Material 3 | Latest | Design System |
| **Navigation** | Navigation Compose | 2.7.6 | Screen navigation |
| **Lifecycle** | ViewModel Compose | 2.6.2 | State management |
| **Database** | Room | 2.6.1 | Local persistence |
| **Web** | WebKit | 1.9.0 | WebView support |
| **KMP** | Shared Module | - | Business logic |

---

## 3. Feature Parity Matrix

### 3.1 Feature Implementation Status

| Feature | iOS Status | Android Status | Priority |
|---------|------------|----------------|----------|
| **Learn Tab** |
| USCIS Flashcards | DONE | SCAFFOLD | P0 |
| Category Filtering | DONE | SCAFFOLD | P0 |
| Shuffle Mode | DONE | SCAFFOLD | P0 |
| Progress Tracking | DONE | TODO | P0 |
| **South Dakota Tab** |
| SD Flashcards | DONE | TODO | P0 |
| Legislature Browser | DONE | TODO | P1 |
| Bills Browser | DONE | TODO | P1 |
| Contact Reps | DONE | TODO | P1 |
| Civic Events | DONE | TODO | P2 |
| Committee Hearings | DONE | TODO | P2 |
| **Documents Tab** |
| Document List | DONE | TODO | P0 |
| Full-text Search | DONE | TODO | P1 |
| Bookmarking | DONE | TODO | P1 |
| Font Sizing | DONE | TODO | P2 |
| **Vote Tab** |
| Ballotpedia Embed | DONE | TODO | P0 |
| County Resources | DONE | TODO | P1 |
| State Resources | DONE | TODO | P1 |
| **Connect Tab** |
| Discord Link | DONE | TODO | P0 |
| Newsletter Signup | DONE | TODO | P1 |
| Social Links | DONE | TODO | P1 |
| **About Tab** |
| Mission/Values | DONE | SCAFFOLD | P0 |
| Contact Info | DONE | SCAFFOLD | P0 |
| Donate Link | DONE | TODO | P1 |

### 3.2 Platform-Specific Features

| Feature | iOS | Android | Notes |
|---------|-----|---------|-------|
| Biometric Auth | Face ID / Touch ID | Fingerprint / Face | Future |
| Sharing | UIActivityViewController | ShareSheet Intent | Same UX |
| Deep Linking | Universal Links | App Links | Same URLs |
| Widgets | iOS 14+ Widgets | Android Widgets | Future |
| Notifications | APNs | FCM | Future |

---

## 4. Android-Specific Design

### 4.1 Material 3 Theming

```kotlin
// Color tokens mapped from brand colors
Primary:        #1A7BA8  (PopBlue)
OnPrimary:      #FFFFFF
Secondary:      #E8A832  (PopGold)
OnSecondary:    #0D3D54  (PopDarkBlue)
Background:     #F5F5F5  (Light) / #111D26 (Dark)
Surface:        #FFFFFF  (Light) / #1E1E1E (Dark)
```

### 4.2 Navigation Pattern

```
┌─────────────────────────────────────────────────────────────────┐
│                         TOP APP BAR                              │
│  [Title]                                       [Actions]         │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│                                                                 │
│                       CONTENT AREA                              │
│                                                                 │
│                   (NavHost with Screens)                        │
│                                                                 │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│  BOTTOM NAVIGATION BAR                                          │
│  ┌────┐  ┌────┐  ┌────┐  ┌────┐  ┌────┐  ┌────┐               │
│  │Learn│  │ SD │  │Docs│  │Vote│  │Conn│  │About│              │
│  └────┘  └────┘  └────┘  └────┘  └────┘  └────┘               │
└─────────────────────────────────────────────────────────────────┘
```

### 4.3 Component Mapping (iOS → Android)

| iOS Component | Android Component |
|---------------|-------------------|
| TabView | NavigationBar + NavHost |
| NavigationStack | NavController |
| List | LazyColumn |
| Button | Button / OutlinedButton |
| Toggle | Switch |
| TextField | OutlinedTextField |
| Sheet | ModalBottomSheet |
| Alert | AlertDialog |
| ProgressView | CircularProgressIndicator |
| WebView (WebKit) | WebView (AndroidX) |

### 4.4 Accessibility

| Feature | Implementation |
|---------|----------------|
| Screen Reader | TalkBack support via semantics |
| Font Scaling | Respect system font size |
| Color Contrast | WCAG AA compliant |
| Touch Targets | Minimum 48dp |
| Focus Order | Logical navigation |

---

## 5. Development Phases

### 5.1 Phase Breakdown

```
PHASE 1: KMP FOUNDATION (Completed)
════════════════════════════════════════
✓ Project structure created
✓ Shared module configured
✓ Data models ported to Kotlin
✓ Android app scaffold
✓ Material 3 theme setup
✓ Navigation structure
✓ Learn screen (basic)

PHASE 2: CORE FEATURES
════════════════════════════════════════
□ Complete Learn tab with Room persistence
□ Implement Documents tab
□ Implement Vote tab with WebView
□ Connect tab with intents
□ About tab completion

PHASE 3: SOUTH DAKOTA MODULE
════════════════════════════════════════
□ SD Flashcards screen
□ Legislature WebView browser
□ Bills browser
□ Contact Reps with email intents
□ Civic Events
□ Committee Hearings

PHASE 4: POLISH & OPTIMIZATION
════════════════════════════════════════
□ UI animations and transitions
□ Performance optimization
□ Memory leak testing
□ Accessibility audit
□ Dark mode refinement

PHASE 5: RELEASE PREP
════════════════════════════════════════
□ Play Store listing
□ Screenshots and graphics
□ Privacy policy
□ Beta testing
□ Store submission
```

### 5.2 Milestone Checklist

| Milestone | Deliverable | Dependencies |
|-----------|-------------|--------------|
| **M1** | KMP builds successfully | - |
| **M2** | Learn tab functional | M1 |
| **M3** | Documents readable | M2 |
| **M4** | Vote tab working | M2 |
| **M5** | SD module complete | M3, M4 |
| **M6** | All tabs complete | M5 |
| **M7** | Beta release | M6 |
| **M8** | Play Store launch | M7 |

---

## 6. Testing Strategy

### 6.1 Testing Pyramid

```
                    ┌───────────────┐
                    │    E2E Tests   │  ← UI Automator
                    │    (Few)       │
                    └───────┬───────┘
                            │
                   ┌────────┴────────┐
                   │ Integration Tests │  ← Compose Testing
                   │    (Some)         │
                   └────────┬─────────┘
                            │
          ┌─────────────────┴─────────────────┐
          │           Unit Tests               │  ← JUnit + shared tests
          │            (Many)                  │
          └────────────────────────────────────┘
```

### 6.2 Test Categories

| Category | Framework | Coverage Target |
|----------|-----------|-----------------|
| **Shared Logic** | kotlin.test | 90%+ |
| **ViewModels** | JUnit + Turbine | 80%+ |
| **UI Components** | Compose Testing | 70%+ |
| **Room Database** | Room Testing | 80%+ |
| **Integration** | AndroidX Test | Key flows |
| **E2E** | UI Automator | Critical paths |

### 6.3 Device Testing Matrix

| Category | Devices |
|----------|---------|
| **Phones** | Pixel 4a, Pixel 7, Samsung Galaxy S21 |
| **Tablets** | Pixel Tablet, Samsung Tab S8 |
| **Low-End** | Moto G Power, Samsung A14 |
| **API Levels** | 26, 30, 33, 34 |

---

## 7. Play Store Strategy

### 7.1 Store Listing

| Field | Content |
|-------|---------|
| **App Name** | PoP - People Over Party |
| **Short Description** | Learn civics, find your ballot, engage with democracy |
| **Category** | Education |
| **Content Rating** | Everyone |
| **Target Audience** | 18+ (civic engagement) |

### 7.2 Suggested Long Description

```
PoP (People Over Party) is a free, nonpartisan civic education app
from the Better Together PAC in South Dakota.

FEATURES:
✓ 100+ USCIS civics flashcards
✓ South Dakota state civics
✓ Full founding documents (Constitution, Declaration, etc.)
✓ Find your ballot and voting info
✓ Contact your representatives
✓ Connect with your civic community

Our mission: Educate, don't divide. We believe in:
• People over party
• Education over manipulation
• Community over conflict

This app is open source and available for any state or organization
to adapt for their community.

No ads. No tracking. Just civic education.

From Better Together: People Over Party
Rapid City, South Dakota
```

### 7.3 Screenshots Required

| Screenshot | Content |
|------------|---------|
| 1 | Learn tab - flashcard in action |
| 2 | Documents tab - Constitution |
| 3 | Vote tab - ballot lookup |
| 4 | South Dakota - state resources |
| 5 | About - mission statement |

### 7.4 Release Strategy

| Phase | Audience | Duration |
|-------|----------|----------|
| **Internal Testing** | Dev team | 1 week |
| **Closed Beta** | PAC members | 2 weeks |
| **Open Beta** | Public | 1 week |
| **Production** | Everyone | Ongoing |

---

## 8. Resource Requirements

### 8.1 Development Resources

| Resource | Requirement | Notes |
|----------|-------------|-------|
| **Developer** | Android/Kotlin experience | Compose preferred |
| **Designer** | Material 3 knowledge | Optional if using templates |
| **QA** | Android device access | Multiple devices |
| **DevOps** | Play Store access | Account required |

### 8.2 Infrastructure

| Item | Requirement | Cost |
|------|-------------|------|
| **Play Store Account** | One-time $25 | Required |
| **CI/CD** | GitHub Actions | Free tier |
| **Crash Reporting** | Firebase Crashlytics | Free tier |
| **Analytics** | Optional | TBD |

### 8.3 Ongoing Maintenance

| Task | Frequency | Effort |
|------|-----------|--------|
| Security patches | Monthly | Low |
| SDK updates | Quarterly | Medium |
| Feature updates | As needed | Varies |
| Store listing | As needed | Low |
| User feedback | Weekly | Low |

---

## 9. Risk Mitigation

### 9.1 Android-Specific Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| **Fragmentation** | High | Medium | Test on diverse devices |
| **WebView inconsistency** | Medium | Medium | Use AndroidX WebKit |
| **Play Store rejection** | Low | High | Follow policies strictly |
| **Performance on low-end** | Medium | Medium | Optimize, lazy loading |
| **KMP compatibility** | Low | High | Use stable KMP version |

### 9.2 Contingency Plans

| Issue | Contingency |
|-------|-------------|
| KMP issues | Fall back to pure Android with data copy |
| WebView problems | Use Chrome Custom Tabs instead |
| Store rejection | Address feedback, resubmit |
| Performance issues | Profile with Android Studio, optimize |

---

## Appendix A: Quick Reference

### Build Commands

```bash
# Build shared module
./gradlew :shared:build

# Build Android debug APK
./gradlew :androidApp:assembleDebug

# Build Android release APK
./gradlew :androidApp:assembleRelease

# Run Android tests
./gradlew :androidApp:testDebugUnitTest

# Run shared tests
./gradlew :shared:allTests

# Install on connected device
./gradlew :androidApp:installDebug
```

### Key Files

| Purpose | Path |
|---------|------|
| App entry | `androidApp/src/main/kotlin/.../MainActivity.kt` |
| Theme | `androidApp/src/main/kotlin/.../ui/theme/Theme.kt` |
| Navigation | `androidApp/src/main/kotlin/.../navigation/PopNavHost.kt` |
| Shared data | `shared/src/commonMain/kotlin/.../data/CivicsData.kt` |
| Config | `shared/src/commonMain/kotlin/.../config/AppConfig.kt` |

---

## Appendix B: Forking for Other States

### Steps to Create State Version

1. **Fork Repository**
   ```bash
   git clone https://github.com/peopleoverparty/pop-multiplatform
   ```

2. **Update AppConfig**
   ```kotlin
   // shared/src/commonMain/kotlin/.../config/AppConfig.kt
   object CurrentConfig {
       val config: AppConfig = AppConfig(
           orgName = "Your Organization",
           stateName = "Your State",
           // ... other fields
       )
   }
   ```

3. **Add State Questions**
   - Create `YourStateData.kt` with 100 state civics questions
   - Follow `SouthDakotaData.kt` as template

4. **Update Resources**
   - Replace app name in `strings.xml`
   - Update theme colors if desired
   - Replace app icon

5. **Build and Test**
   ```bash
   ./gradlew :androidApp:assembleDebug
   ```

6. **Submit to Play Store**
   - Use your own developer account
   - Unique package name required

---

*This Android addendum extends the main PRD for cross-platform development of PoP.*
