# Kotlin Multiplatform (KMP) Migration Plan
## PoP - People Over Party

---

**Document Version:** 1.0
**Date:** January 15, 2026
**Purpose:** File-by-file guide for adding Android support via Kotlin Multiplatform

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Architecture Overview](#2-architecture-overview)
3. [Current iOS File Analysis](#3-current-ios-file-analysis)
4. [Migration Phases](#4-migration-phases)
5. [File-by-File Migration Guide](#5-file-by-file-migration-guide)
6. [Shared Module Structure](#6-shared-module-structure)
7. [Platform-Specific Implementations](#7-platform-specific-implementations)
8. [Testing Strategy](#8-testing-strategy)
9. [Build Configuration](#9-build-configuration)
10. [Timeline and Milestones](#10-timeline-and-milestones)

---

## 1. Executive Summary

### Why Kotlin Multiplatform?

| Factor | KMP Advantage |
|--------|---------------|
| **Language Similarity** | Swift and Kotlin share similar syntax and concepts |
| **Native UI** | Keep SwiftUI on iOS, use Jetpack Compose on Android |
| **Code Sharing** | Share 50-70% of business logic across platforms |
| **Gradual Adoption** | Migrate incrementally without rewriting iOS |
| **Open Source Fit** | Single codebase for community contributions |
| **JetBrains Support** | Stable tooling, growing ecosystem |

### What Gets Shared vs Platform-Specific

```
┌─────────────────────────────────────────────────────────────────────┐
│                         SHARED (Kotlin)                              │
├─────────────────────────────────────────────────────────────────────┤
│  • Data Models (Questions, Documents, Representatives)              │
│  • Static Data (All 200+ civics questions, founding documents)      │
│  • Business Logic (Filtering, shuffling, category lookup)           │
│  • Repository Interfaces                                            │
│  • State Configuration (AppConfig)                                  │
│  • Utilities (Email composer, date formatting)                      │
└─────────────────────────────────────────────────────────────────────┘
                                 │
                    ┌────────────┴────────────┐
                    ▼                         ▼
┌─────────────────────────────┐  ┌─────────────────────────────┐
│      iOS (Swift/SwiftUI)     │  │   Android (Kotlin/Compose)   │
├─────────────────────────────┤  ├─────────────────────────────┤
│  • SwiftUI Views             │  │  • Jetpack Compose UI        │
│  • Core Data Persistence     │  │  • Room Persistence          │
│  • UIKit Integration         │  │  • Android Navigation        │
│  • WebKit WebViews           │  │  • WebView (AndroidX)        │
│  • iOS Theming               │  │  • Material 3 Theming        │
│  • App Lifecycle             │  │  • App Lifecycle             │
└─────────────────────────────┘  └─────────────────────────────┘
```

---

## 2. Architecture Overview

### Current iOS Architecture

```
PoP/
├── PoPApp.swift                 # App entry point
├── ContentView.swift            # Main TabView
├── Theme.swift                  # Brand colors/styles
├── Persistence.swift            # Core Data stack
│
├── Data Models & Static Data
│   ├── CivicsQuestions.swift    # 100 USCIS questions
│   ├── SouthDakotaQuestions.swift # 100 SD questions
│   ├── FoundingDocuments.swift  # Full document texts
│   └── SDLegislators.swift      # Representative data
│
├── Managers (Business Logic)
│   ├── FlashcardProgressManager.swift
│   ├── SDProgressManager.swift
│   ├── BookmarkManager.swift
│   ├── NewsletterManager.swift
│   └── CheckInManager.swift
│
└── Views (UI)
    ├── LearnView.swift
    ├── SouthDakotaView.swift
    ├── DocumentsView.swift
    ├── VoteView.swift
    └── [15+ more views...]
```

### Target KMP Architecture

```
pop-multiplatform/
│
├── shared/                           # KOTLIN MULTIPLATFORM MODULE
│   ├── build.gradle.kts
│   └── src/
│       ├── commonMain/kotlin/com/pop/shared/
│       │   ├── models/               # Data classes
│       │   ├── data/                 # Static data
│       │   ├── repository/           # Repository interfaces
│       │   ├── config/               # AppConfig
│       │   └── util/                 # Utilities
│       │
│       ├── iosMain/kotlin/com/pop/shared/
│       │   └── platform/             # iOS-specific expect/actual
│       │
│       └── androidMain/kotlin/com/pop/shared/
│           └── platform/             # Android-specific expect/actual
│
├── iosApp/                           # EXISTING iOS APP
│   └── PoP/                          # Existing SwiftUI code
│       ├── Views/                    # Keep all SwiftUI views
│       ├── Managers/                 # Adapt to use shared module
│       └── ...
│
└── androidApp/                       # NEW ANDROID APP
    ├── build.gradle.kts
    └── src/main/
        ├── kotlin/com/pop/android/
        │   ├── ui/                   # Jetpack Compose screens
        │   ├── viewmodel/            # Android ViewModels
        │   ├── navigation/           # Compose Navigation
        │   └── di/                   # Dependency Injection
        └── res/                      # Android resources
```

---

## 3. Current iOS File Analysis

### Shareability Matrix

| File | Lines | Shareable | Migration Priority | Notes |
|------|-------|-----------|-------------------|-------|
| **Data Models** |
| `CivicsQuestions.swift` | 165 | 95% | P0 - Critical | Core data, easy port |
| `SouthDakotaQuestions.swift` | 195 | 95% | P0 - Critical | Core data, easy port |
| `FoundingDocuments.swift` | 624 | 95% | P0 - Critical | Large text, easy port |
| `SDLegislators.swift` | 304 | 90% | P0 - Critical | Models + helpers |
| **Managers** |
| `FlashcardProgressManager.swift` | 122 | 40% | P1 - High | Interface shared, impl platform |
| `SDProgressManager.swift` | ~120 | 40% | P1 - High | Same pattern as above |
| `BookmarkManager.swift` | 93 | 40% | P1 - High | Interface shared |
| `NewsletterManager.swift` | 111 | 30% | P2 - Medium | CSV export platform-specific |
| `CheckInManager.swift` | ~80 | 30% | P2 - Medium | Event check-in logic |
| **Configuration** |
| `Theme.swift` | 133 | 20% | P2 - Medium | Colors shared, modifiers not |
| `Persistence.swift` | 58 | 0% | N/A | iOS Core Data only |
| **Views** |
| All `*View.swift` files | ~2000 | 0% | N/A | Platform-specific UI |

### Code Distribution

```
                    CURRENT iOS CODEBASE
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│  ████████████████████  Data/Models (35%)                       │
│  ████████████████████  - Shareable: ~95%                       │
│                                                                 │
│  ████████████  Managers (20%)                                  │
│  ████████████  - Shareable: ~40% (interfaces)                  │
│                                                                 │
│  ██████████████████████████████  Views (40%)                   │
│  ██████████████████████████████  - Shareable: 0%              │
│                                                                 │
│  ████  Config (5%)                                             │
│  ████  - Shareable: ~50%                                       │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘

           ESTIMATED SHARED CODE: 50-60%
```

---

## 4. Migration Phases

### Phase 1: Foundation Setup

**Goal:** Set up KMP project structure without changing iOS app

```
Tasks:
├── Create KMP project with Gradle
├── Configure shared module
├── Set up commonMain source set
├── Configure iOS framework export
├── Verify iOS app still builds
└── Duration: ~3-5 days

Deliverables:
├── Working Gradle build
├── Empty shared module compiles
└── iOS app unchanged and functional
```

### Phase 2: Data Model Migration

**Goal:** Port all data models to shared Kotlin

```
Tasks:
├── Port CivicsQuestion model
├── Port SDQuestion model
├── Port FoundingDocument model
├── Port Representative model
├── Port all static data arrays
├── Export to iOS via framework
├── Update iOS imports to use shared
└── Duration: ~5-7 days

Deliverables:
├── All models in commonMain
├── iOS app using shared models
└── All tests passing
```

### Phase 3: Repository Layer

**Goal:** Create shared repository interfaces with platform implementations

```
Tasks:
├── Define repository interfaces
├── Create expect/actual for persistence
├── Port filtering/lookup logic
├── iOS: Adapt managers to repositories
├── Android: Create Room implementations
└── Duration: ~7-10 days

Deliverables:
├── Repository interfaces in shared
├── iOS managers refactored
└── Ready for Android persistence
```

### Phase 4: Android App Scaffold

**Goal:** Create basic Android app using shared module

```
Tasks:
├── Create androidApp module
├── Set up Jetpack Compose
├── Implement Material 3 theming
├── Create basic navigation
├── Build first screen (Learn)
└── Duration: ~5-7 days

Deliverables:
├── Android app launches
├── Learn screen functional
└── Uses shared data models
```

### Phase 5: Android Feature Parity

**Goal:** Implement all iOS features on Android

```
Tasks:
├── Learn Tab (flashcards)
├── South Dakota Tab
├── Documents Tab
├── Vote Tab (WebView)
├── Connect Tab
├── About Tab
├── Action Tab
└── Duration: ~10-15 days

Deliverables:
├── Full feature parity
├── Both apps functional
└── Ready for testing
```

### Phase 6: Polish and Release

**Goal:** Prepare both apps for release

```
Tasks:
├── UI polish and animations
├── Testing on multiple devices
├── Performance optimization
├── App Store/Play Store prep
├── Documentation updates
└── Duration: ~5-7 days

Deliverables:
├── Release candidates
├── Store listings ready
└── Open source repo updated
```

---

## 5. File-by-File Migration Guide

### 5.1 CivicsQuestions.swift → CivicsQuestions.kt

**Source (Swift):**
```swift
// CivicsQuestions.swift
struct CivicsQuestion: Identifiable, Equatable {
    let id: Int
    let question: String
    let answer: String
    let category: CivicsCategory
}

enum CivicsCategory: String, CaseIterable {
    case americanGovernment = "American Government"
    case americanHistory = "American History"
    case integratedCivics = "Integrated Civics"
}
```

**Target (Kotlin):**
```kotlin
// shared/src/commonMain/kotlin/com/pop/shared/models/CivicsQuestion.kt
package com.pop.shared.models

data class CivicsQuestion(
    val id: Int,
    val question: String,
    val answer: String,
    val category: CivicsCategory
)

enum class CivicsCategory(val displayName: String) {
    AMERICAN_GOVERNMENT("American Government"),
    AMERICAN_HISTORY("American History"),
    INTEGRATED_CIVICS("Integrated Civics");

    val icon: String
        get() = when (this) {
            AMERICAN_GOVERNMENT -> "building.columns"
            AMERICAN_HISTORY -> "clock.arrow.circlepath"
            INTEGRATED_CIVICS -> "flag"
        }
}
```

**Static Data:**
```kotlin
// shared/src/commonMain/kotlin/com/pop/shared/data/CivicsData.kt
package com.pop.shared.data

import com.pop.shared.models.CivicsCategory
import com.pop.shared.models.CivicsQuestion

object CivicsData {
    val questions: List<CivicsQuestion> = listOf(
        CivicsQuestion(
            id = 1,
            question = "What is the supreme law of the land?",
            answer = "The Constitution",
            category = CivicsCategory.AMERICAN_GOVERNMENT
        ),
        CivicsQuestion(
            id = 2,
            question = "What does the Constitution do?",
            answer = "Sets up the government, defines the government, and protects basic rights of Americans",
            category = CivicsCategory.AMERICAN_GOVERNMENT
        ),
        // ... all 100 questions
    )

    fun questionsByCategory(category: CivicsCategory): List<CivicsQuestion> =
        questions.filter { it.category == category }

    fun randomQuestion(): CivicsQuestion = questions.random()

    fun shuffledQuestions(): List<CivicsQuestion> = questions.shuffled()
}
```

**iOS Integration:**
```swift
// In iOS, import the shared framework
import shared

// Use directly:
let questions = CivicsData.shared.questions
let govQuestions = CivicsData.shared.questionsByCategory(category: .americanGovernment)
```

---

### 5.2 SouthDakotaQuestions.swift → SouthDakotaQuestions.kt

**Target (Kotlin):**
```kotlin
// shared/src/commonMain/kotlin/com/pop/shared/models/SDQuestion.kt
package com.pop.shared.models

data class SDQuestion(
    val id: Int,
    val question: String,
    val answer: String,
    val category: SDCategory
)

enum class SDCategory(val displayName: String) {
    STATE("State"),
    COUNTY("County"),
    MUNICIPAL("Municipal");

    val icon: String
        get() = when (this) {
            STATE -> "building.columns"
            COUNTY -> "map"
            MUNICIPAL -> "building.2"
        }
}
```

```kotlin
// shared/src/commonMain/kotlin/com/pop/shared/data/SouthDakotaData.kt
package com.pop.shared.data

import com.pop.shared.models.SDCategory
import com.pop.shared.models.SDQuestion

object SouthDakotaData {
    val questions: List<SDQuestion> = listOf(
        SDQuestion(
            id = 1,
            question = "When did South Dakota become a state?",
            answer = "November 2, 1889 (40th state)",
            category = SDCategory.STATE
        ),
        // ... all 100 questions
    )

    fun questionsByCategory(category: SDCategory): List<SDQuestion> =
        questions.filter { it.category == category }

    val stateQuestions: List<SDQuestion>
        get() = questionsByCategory(SDCategory.STATE)

    val countyQuestions: List<SDQuestion>
        get() = questionsByCategory(SDCategory.COUNTY)

    val municipalQuestions: List<SDQuestion>
        get() = questionsByCategory(SDCategory.MUNICIPAL)

    fun randomQuestion(): SDQuestion = questions.random()

    fun shuffledQuestions(): List<SDQuestion> = questions.shuffled()
}
```

---

### 5.3 FoundingDocuments.swift → FoundingDocuments.kt

**Target (Kotlin):**
```kotlin
// shared/src/commonMain/kotlin/com/pop/shared/models/FoundingDocument.kt
package com.pop.shared.models

import com.pop.shared.util.randomUUID

data class FoundingDocument(
    val id: String = randomUUID(),
    val title: String,
    val subtitle: String,
    val year: Int,
    val category: String,
    val icon: String,
    val content: String
)
```

```kotlin
// shared/src/commonMain/kotlin/com/pop/shared/data/FoundingDocuments.kt
package com.pop.shared.data

import com.pop.shared.models.FoundingDocument

object FoundingDocuments {

    val declarationOfIndependence = """
THE DECLARATION OF INDEPENDENCE

Action of Second Continental Congress, July 4, 1776
The Unanimous Declaration of the thirteen united States of America

WHEN in the Course of human Events...
[Full text here - same as Swift version]
""".trimIndent()

    val usConstitution = """
THE CONSTITUTION OF THE UNITED STATES OF AMERICA

We the People of the United States...
[Full text here]
""".trimIndent()

    val amendments = """
AMENDMENTS TO THE CONSTITUTION...
[Full text here]
""".trimIndent()

    val southDakotaConstitution = """
SOUTH DAKOTA CONSTITUTION...
[Full text here]
""".trimIndent()

    val all: List<FoundingDocument> = listOf(
        FoundingDocument(
            title = "Declaration of Independence",
            subtitle = "The founding document of the United States",
            year = 1776,
            category = "Founding",
            icon = "scroll",
            content = declarationOfIndependence
        ),
        FoundingDocument(
            title = "U.S. Constitution",
            subtitle = "The supreme law of the land",
            year = 1787,
            category = "Constitution",
            icon = "building.columns",
            content = usConstitution
        ),
        FoundingDocument(
            title = "Constitutional Amendments",
            subtitle = "All 27 amendments including the Bill of Rights",
            year = 1791,
            category = "Amendments",
            icon = "list.bullet.rectangle",
            content = amendments
        ),
        FoundingDocument(
            title = "South Dakota Constitution",
            subtitle = "The state constitution",
            year = 1889,
            category = "State",
            icon = "flag",
            content = southDakotaConstitution
        )
    )
}
```

---

### 5.4 SDLegislators.swift → SDLegislators.kt

**Target (Kotlin):**
```kotlin
// shared/src/commonMain/kotlin/com/pop/shared/models/Representative.kt
package com.pop.shared.models

import com.pop.shared.util.randomUUID

data class Representative(
    val id: String = randomUUID(),
    val name: String,
    val chamber: Chamber,
    val district: Int,
    val party: Party,
    val email: String,
    val phone: String? = null,
    val hometown: String? = null,
    val photoURL: String? = null
) {
    val displayTitle: String
        get() = when (chamber) {
            Chamber.SD_SENATE -> "Senator"
            Chamber.SD_HOUSE -> "Representative"
            Chamber.US_SENATE -> "U.S. Senator"
            Chamber.US_HOUSE -> "U.S. Representative"
        }

    val districtDisplay: String
        get() = if (chamber.isFederal && chamber == Chamber.US_HOUSE) {
            "At-Large"
        } else {
            "District $district"
        }
}

enum class Chamber(val displayName: String) {
    SD_SENATE("SD Senate"),
    SD_HOUSE("SD House"),
    US_SENATE("US Senate"),
    US_HOUSE("US House");

    val isState: Boolean
        get() = this == SD_SENATE || this == SD_HOUSE

    val isFederal: Boolean
        get() = this == US_SENATE || this == US_HOUSE

    val icon: String
        get() = when (this) {
            SD_SENATE, US_SENATE -> "building.columns"
            SD_HOUSE, US_HOUSE -> "person.3"
        }
}

enum class Party(val abbreviation: String, val fullName: String) {
    REPUBLICAN("R", "Republican"),
    DEMOCRAT("D", "Democrat"),
    INDEPENDENT("I", "Independent")
}
```

```kotlin
// shared/src/commonMain/kotlin/com/pop/shared/data/SDLegislators.kt
package com.pop.shared.data

import com.pop.shared.models.*

object SDLegislators {

    val usCongressMembers: List<Representative> = listOf(
        Representative(
            name = "John Thune",
            chamber = Chamber.US_SENATE,
            district = 0,
            party = Party.REPUBLICAN,
            email = "john_thune@thune.senate.gov",
            phone = "(202) 224-2321",
            hometown = "Sioux Falls"
        ),
        Representative(
            name = "Mike Rounds",
            chamber = Chamber.US_SENATE,
            district = 0,
            party = Party.REPUBLICAN,
            email = "mike_rounds@rounds.senate.gov",
            phone = "(202) 224-5842",
            hometown = "Fort Pierre"
        ),
        Representative(
            name = "Dusty Johnson",
            chamber = Chamber.US_HOUSE,
            district = 1,
            party = Party.REPUBLICAN,
            email = "dusty.johnson@mail.house.gov",
            phone = "(202) 225-2801",
            hometown = "Mitchell"
        )
    )

    val sdSenate: List<Representative> = listOf(
        // All 35 SD Senators
    )

    val sdHouse: List<Representative> = listOf(
        // All 70 SD Representatives
    )

    val penningtonCountyDistricts = listOf(30, 31, 32, 33, 34, 35)

    val penningtonCountyLegislators: List<Representative>
        get() = allStateLegislators.filter {
            penningtonCountyDistricts.contains(it.district)
        }

    val allStateLegislators: List<Representative>
        get() = sdSenate + sdHouse

    val allLegislators: List<Representative>
        get() = usCongressMembers + allStateLegislators

    fun legislators(forDistrict: Int): List<Representative> =
        allStateLegislators.filter { it.district == forDistrict }

    fun byParty(party: Party): List<Representative> =
        allStateLegislators.filter { it.party == party }

    const val legislatureURL = "https://sdlegislature.gov/Legislators"
    const val findMyLegislatorURL = "https://sdlegislature.gov/Legislators/Contacts/ByAddress"
}
```

---

### 5.5 FlashcardProgressManager → Repository Pattern

**Shared Interface (Kotlin):**
```kotlin
// shared/src/commonMain/kotlin/com/pop/shared/repository/FlashcardProgressRepository.kt
package com.pop.shared.repository

import com.pop.shared.models.FlashcardProgress

interface FlashcardProgressRepository {
    suspend fun getKnownQuestionIds(): Set<Int>
    suspend fun getViewedQuestionIds(): Set<Int>
    suspend fun markViewed(questionId: Int)
    suspend fun toggleKnown(questionId: Int)
    suspend fun isKnown(questionId: Int): Boolean
    suspend fun resetAllProgress()
}

data class FlashcardProgress(
    val questionId: Int,
    val timesViewed: Int,
    val lastViewed: Long?, // Unix timestamp
    val isMarkedKnown: Boolean
)
```

**iOS Implementation (Swift - wrapper):**
```swift
// PoP/Repository/IOSFlashcardProgressRepository.swift
import shared
import CoreData

class IOSFlashcardProgressRepository: FlashcardProgressRepository {
    private let viewContext: NSManagedObjectContext

    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
    }

    // Implement protocol methods using existing Core Data logic
    // This wraps the existing FlashcardProgressManager functionality
}
```

**Android Implementation (Kotlin):**
```kotlin
// androidApp/src/main/kotlin/com/pop/android/data/AndroidFlashcardProgressRepository.kt
package com.pop.android.data

import com.pop.shared.repository.FlashcardProgressRepository
import com.pop.shared.models.FlashcardProgress
import com.pop.android.data.room.FlashcardProgressDao

class AndroidFlashcardProgressRepository(
    private val dao: FlashcardProgressDao
) : FlashcardProgressRepository {

    override suspend fun getKnownQuestionIds(): Set<Int> =
        dao.getKnownQuestionIds().toSet()

    override suspend fun getViewedQuestionIds(): Set<Int> =
        dao.getViewedQuestionIds().toSet()

    override suspend fun markViewed(questionId: Int) {
        val existing = dao.getById(questionId)
        if (existing != null) {
            dao.update(existing.copy(
                timesViewed = existing.timesViewed + 1,
                lastViewed = System.currentTimeMillis()
            ))
        } else {
            dao.insert(FlashcardProgressEntity(
                questionId = questionId,
                timesViewed = 1,
                lastViewed = System.currentTimeMillis(),
                isMarkedKnown = false
            ))
        }
    }

    override suspend fun toggleKnown(questionId: Int) {
        val existing = dao.getById(questionId)
        if (existing != null) {
            dao.update(existing.copy(isMarkedKnown = !existing.isMarkedKnown))
        }
    }

    override suspend fun isKnown(questionId: Int): Boolean =
        dao.getById(questionId)?.isMarkedKnown ?: false

    override suspend fun resetAllProgress() {
        dao.deleteAll()
    }
}
```

---

### 5.6 Theme.swift → Theme.kt (Partial Share)

**Shared Colors (Kotlin):**
```kotlin
// shared/src/commonMain/kotlin/com/pop/shared/config/BrandColors.kt
package com.pop.shared.config

object BrandColors {
    // Primary brand colors from Better Together logo
    val popBlue = Color(0x1A7BA8)           // #1A7BA8
    val popGold = Color(0xE8A832)           // #E8A832
    val popDarkBlue = Color(0x0D3D54)       // #0D3D54

    // Background colors
    val popLightBackground = Color(0xF5F5F5) // #F5F5F5
    val popDarkBackground = Color(0x111D26)  // #111D26

    // Semantic aliases
    val accent = popGold
    val primary = popBlue
}

// Simple color representation that can be converted to platform-specific
data class Color(val hex: Int) {
    val red: Float get() = ((hex shr 16) and 0xFF) / 255f
    val green: Float get() = ((hex shr 8) and 0xFF) / 255f
    val blue: Float get() = (hex and 0xFF) / 255f
}
```

**Android Theme (Kotlin/Compose):**
```kotlin
// androidApp/src/main/kotlin/com/pop/android/ui/theme/Theme.kt
package com.pop.android.ui.theme

import androidx.compose.material3.*
import androidx.compose.ui.graphics.Color
import com.pop.shared.config.BrandColors

// Convert shared colors to Compose colors
val PopBlue = Color(BrandColors.popBlue.hex.toLong() or 0xFF000000)
val PopGold = Color(BrandColors.popGold.hex.toLong() or 0xFF000000)
val PopDarkBlue = Color(BrandColors.popDarkBlue.hex.toLong() or 0xFF000000)

private val LightColorScheme = lightColorScheme(
    primary = PopBlue,
    secondary = PopGold,
    tertiary = PopDarkBlue,
    background = Color(0xFFF5F5F5),
    surface = Color.White
)

private val DarkColorScheme = darkColorScheme(
    primary = PopBlue,
    secondary = PopGold,
    tertiary = PopDarkBlue,
    background = Color(0xFF111D26),
    surface = Color(0xFF1E1E1E)
)

@Composable
fun PopTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    content: @Composable () -> Unit
) {
    val colorScheme = if (darkTheme) DarkColorScheme else LightColorScheme

    MaterialTheme(
        colorScheme = colorScheme,
        typography = PopTypography,
        content = content
    )
}
```

---

### 5.7 AppConfig.kt (New Shared Configuration)

```kotlin
// shared/src/commonMain/kotlin/com/pop/shared/config/AppConfig.kt
package com.pop.shared.config

data class AppConfig(
    // Organization Details
    val orgName: String,
    val orgTagline: String,
    val contactEmail: String,
    val contactPhone: String,
    val websiteURL: String,

    // State Configuration
    val stateName: String,
    val stateAbbrev: String,
    val capital: String,
    val legislatureURL: String,
    val sosElectionsURL: String,

    // County/Municipal (Optional)
    val primaryCounty: String? = null,
    val countyElectionsURL: String? = null,
    val municipalName: String? = null,

    // Feature Flags
    val enableLegislature: Boolean = true,
    val enableEvents: Boolean = true,
    val enableContactReps: Boolean = true
) {
    companion object {
        val southDakota = AppConfig(
            orgName = "People Over Party",
            orgTagline = "Better Together",
            contactEmail = "hello@peopleoverpartysd.com",
            contactPhone = "(605) 389-3613",
            websiteURL = "https://www.peopleoverpartysd.com/",
            stateName = "South Dakota",
            stateAbbrev = "SD",
            capital = "Pierre",
            legislatureURL = "https://sdlegislature.gov/",
            sosElectionsURL = "https://sdsos.gov/elections-voting/",
            primaryCounty = "Pennington County",
            countyElectionsURL = "https://www.pennco.org/",
            municipalName = "Rapid City"
        )
    }
}

// Active configuration (can be changed for different state forks)
object CurrentConfig {
    val config: AppConfig = AppConfig.southDakota
}
```

---

## 6. Shared Module Structure

### Complete Directory Structure

```
shared/
├── build.gradle.kts
└── src/
    ├── commonMain/
    │   └── kotlin/com/pop/shared/
    │       │
    │       ├── models/                      # Data Classes
    │       │   ├── CivicsQuestion.kt
    │       │   ├── SDQuestion.kt
    │       │   ├── FoundingDocument.kt
    │       │   ├── Representative.kt
    │       │   ├── FlashcardProgress.kt
    │       │   ├── NewsletterSignup.kt
    │       │   └── BookmarkedDocument.kt
    │       │
    │       ├── data/                        # Static Data
    │       │   ├── CivicsData.kt            # 100 USCIS questions
    │       │   ├── SouthDakotaData.kt       # 100 SD questions
    │       │   ├── FoundingDocuments.kt     # Full document texts
    │       │   ├── SDLegislators.kt         # Representative data
    │       │   └── MessageTemplates.kt      # Email templates
    │       │
    │       ├── repository/                  # Repository Interfaces
    │       │   ├── FlashcardProgressRepository.kt
    │       │   ├── SDProgressRepository.kt
    │       │   ├── BookmarkRepository.kt
    │       │   └── NewsletterRepository.kt
    │       │
    │       ├── config/                      # Configuration
    │       │   ├── AppConfig.kt
    │       │   ├── BrandColors.kt
    │       │   └── CurrentConfig.kt
    │       │
    │       └── util/                        # Utilities
    │           ├── UUID.kt                  # expect/actual for UUID
    │           ├── DateUtils.kt
    │           └── EmailComposer.kt
    │
    ├── iosMain/
    │   └── kotlin/com/pop/shared/
    │       └── platform/
    │           └── UUID.kt                  # actual implementation
    │
    └── androidMain/
        └── kotlin/com/pop/shared/
            └── platform/
                └── UUID.kt                  # actual implementation
```

### Shared Module build.gradle.kts

```kotlin
// shared/build.gradle.kts
plugins {
    kotlin("multiplatform")
    id("com.android.library")
}

kotlin {
    androidTarget {
        compilations.all {
            kotlinOptions {
                jvmTarget = "17"
            }
        }
    }

    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach {
        it.binaries.framework {
            baseName = "shared"
            isStatic = true
        }
    }

    sourceSets {
        val commonMain by getting {
            dependencies {
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.3")
            }
        }
        val commonTest by getting {
            dependencies {
                implementation(kotlin("test"))
            }
        }
        val androidMain by getting
        val iosX64Main by getting
        val iosArm64Main by getting
        val iosSimulatorArm64Main by getting
        val iosMain by creating {
            dependsOn(commonMain)
            iosX64Main.dependsOn(this)
            iosArm64Main.dependsOn(this)
            iosSimulatorArm64Main.dependsOn(this)
        }
    }
}

android {
    namespace = "com.pop.shared"
    compileSdk = 34
    defaultConfig {
        minSdk = 26
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
```

---

## 7. Platform-Specific Implementations

### 7.1 UUID Generation (expect/actual)

```kotlin
// shared/src/commonMain/kotlin/com/pop/shared/util/UUID.kt
package com.pop.shared.util

expect fun randomUUID(): String
```

```kotlin
// shared/src/androidMain/kotlin/com/pop/shared/platform/UUID.kt
package com.pop.shared.util

import java.util.UUID

actual fun randomUUID(): String = UUID.randomUUID().toString()
```

```kotlin
// shared/src/iosMain/kotlin/com/pop/shared/platform/UUID.kt
package com.pop.shared.util

import platform.Foundation.NSUUID

actual fun randomUUID(): String = NSUUID().UUIDString()
```

### 7.2 iOS Framework Integration

After building the shared module, iOS can import it:

```swift
// In any Swift file
import shared

// Access shared data
let questions = CivicsData.shared.questions
let documents = FoundingDocuments.shared.all
let config = CurrentConfig.shared.config
```

### 7.3 Android Room Database

```kotlin
// androidApp/src/main/kotlin/com/pop/android/data/room/FlashcardProgressEntity.kt
package com.pop.android.data.room

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "flashcard_progress")
data class FlashcardProgressEntity(
    @PrimaryKey val questionId: Int,
    val timesViewed: Int,
    val lastViewed: Long?,
    val isMarkedKnown: Boolean
)
```

```kotlin
// androidApp/src/main/kotlin/com/pop/android/data/room/FlashcardProgressDao.kt
package com.pop.android.data.room

import androidx.room.*

@Dao
interface FlashcardProgressDao {
    @Query("SELECT questionId FROM flashcard_progress WHERE isMarkedKnown = 1")
    suspend fun getKnownQuestionIds(): List<Int>

    @Query("SELECT questionId FROM flashcard_progress")
    suspend fun getViewedQuestionIds(): List<Int>

    @Query("SELECT * FROM flashcard_progress WHERE questionId = :id")
    suspend fun getById(id: Int): FlashcardProgressEntity?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(progress: FlashcardProgressEntity)

    @Update
    suspend fun update(progress: FlashcardProgressEntity)

    @Query("DELETE FROM flashcard_progress")
    suspend fun deleteAll()
}
```

---

## 8. Testing Strategy

### 8.1 Shared Module Tests

```kotlin
// shared/src/commonTest/kotlin/com/pop/shared/CivicsDataTest.kt
package com.pop.shared

import com.pop.shared.data.CivicsData
import com.pop.shared.models.CivicsCategory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class CivicsDataTest {

    @Test
    fun `should have exactly 100 questions`() {
        assertEquals(100, CivicsData.questions.size)
    }

    @Test
    fun `should have questions in all categories`() {
        val categories = CivicsData.questions.map { it.category }.toSet()
        assertEquals(CivicsCategory.values().toSet(), categories)
    }

    @Test
    fun `questionsByCategory should filter correctly`() {
        val govQuestions = CivicsData.questionsByCategory(CivicsCategory.AMERICAN_GOVERNMENT)
        assertTrue(govQuestions.all { it.category == CivicsCategory.AMERICAN_GOVERNMENT })
    }

    @Test
    fun `shuffledQuestions should return all questions`() {
        val shuffled = CivicsData.shuffledQuestions()
        assertEquals(100, shuffled.size)
        assertEquals(CivicsData.questions.toSet(), shuffled.toSet())
    }
}
```

### 8.2 Android Instrumented Tests

```kotlin
// androidApp/src/androidTest/kotlin/com/pop/android/FlashcardProgressRepositoryTest.kt
package com.pop.android

import androidx.room.Room
import androidx.test.core.app.ApplicationProvider
import com.pop.android.data.AndroidFlashcardProgressRepository
import com.pop.android.data.room.PopDatabase
import kotlinx.coroutines.runBlocking
import org.junit.After
import org.junit.Before
import org.junit.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class FlashcardProgressRepositoryTest {

    private lateinit var database: PopDatabase
    private lateinit var repository: AndroidFlashcardProgressRepository

    @Before
    fun setup() {
        database = Room.inMemoryDatabaseBuilder(
            ApplicationProvider.getApplicationContext(),
            PopDatabase::class.java
        ).build()
        repository = AndroidFlashcardProgressRepository(database.flashcardProgressDao())
    }

    @After
    fun teardown() {
        database.close()
    }

    @Test
    fun markViewed_shouldTrackProgress() = runBlocking {
        repository.markViewed(1)

        val viewed = repository.getViewedQuestionIds()
        assertTrue(viewed.contains(1))
    }

    @Test
    fun toggleKnown_shouldUpdateStatus() = runBlocking {
        repository.markViewed(1)
        repository.toggleKnown(1)

        assertTrue(repository.isKnown(1))

        repository.toggleKnown(1)
        assertTrue(!repository.isKnown(1))
    }
}
```

---

## 9. Build Configuration

### 9.1 Root build.gradle.kts

```kotlin
// build.gradle.kts (root)
plugins {
    kotlin("multiplatform") version "1.9.21" apply false
    kotlin("android") version "1.9.21" apply false
    id("com.android.application") version "8.2.0" apply false
    id("com.android.library") version "8.2.0" apply false
    id("org.jetbrains.compose") version "1.5.11" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
```

### 9.2 settings.gradle.kts

```kotlin
// settings.gradle.kts
pluginManagement {
    repositories {
        google()
        gradlePluginPortal()
        mavenCentral()
    }
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "PoP"
include(":shared")
include(":androidApp")
```

### 9.3 Android App build.gradle.kts

```kotlin
// androidApp/build.gradle.kts
plugins {
    id("com.android.application")
    kotlin("android")
    id("org.jetbrains.compose")
}

android {
    namespace = "com.pop.android"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.pop.android"
        minSdk = 26
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildFeatures {
        compose = true
    }

    composeOptions {
        kotlinCompilerExtensionVersion = "1.5.6"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    implementation(project(":shared"))

    // Compose
    implementation(platform("androidx.compose:compose-bom:2023.10.01"))
    implementation("androidx.compose.ui:ui")
    implementation("androidx.compose.ui:ui-graphics")
    implementation("androidx.compose.ui:ui-tooling-preview")
    implementation("androidx.compose.material3:material3")
    implementation("androidx.activity:activity-compose:1.8.1")
    implementation("androidx.navigation:navigation-compose:2.7.6")

    // Room
    implementation("androidx.room:room-runtime:2.6.1")
    implementation("androidx.room:room-ktx:2.6.1")
    kapt("androidx.room:room-compiler:2.6.1")

    // Lifecycle
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.6.2")
    implementation("androidx.lifecycle:lifecycle-runtime-compose:2.6.2")

    // Testing
    testImplementation("junit:junit:4.13.2")
    androidTestImplementation("androidx.test.ext:junit:1.1.5")
    androidTestImplementation("androidx.compose.ui:ui-test-junit4")
}
```

---

## 10. Timeline and Milestones

### Gantt-Style Overview

```
PHASE                         TASKS
═══════════════════════════════════════════════════════════════════════
Phase 1: Foundation Setup     ████████████
                              • KMP project setup
                              • Gradle configuration
                              • iOS framework export

Phase 2: Data Migration       ████████████████████
                              • Port all data models
                              • Port static data
                              • Update iOS imports

Phase 3: Repository Layer     ████████████████████████████
                              • Define interfaces
                              • expect/actual implementations
                              • Refactor iOS managers

Phase 4: Android Scaffold     ████████████████████
                              • Create androidApp module
                              • Setup Compose + Navigation
                              • First screen working

Phase 5: Feature Parity       ████████████████████████████████████████████
                              • Learn Tab
                              • South Dakota Tab
                              • Documents Tab
                              • Vote Tab
                              • Connect Tab
                              • About Tab
                              • Action Tab

Phase 6: Polish & Release     ████████████████████
                              • UI polish
                              • Testing
                              • Store prep
                              • Documentation
═══════════════════════════════════════════════════════════════════════
```

### Milestone Checklist

| Milestone | Phase | Deliverables | Dependencies |
|-----------|-------|--------------|--------------|
| **M1: KMP Builds** | 1 | Gradle builds, shared module compiles | None |
| **M2: iOS Uses Shared** | 2 | iOS imports shared models | M1 |
| **M3: Repository Layer** | 3 | Interfaces defined, iOS refactored | M2 |
| **M4: Android Launches** | 4 | App opens, navigation works | M3 |
| **M5: Learn Tab** | 5 | Flashcards functional on Android | M4 |
| **M6: Documents Tab** | 5 | Document reader on Android | M5 |
| **M7: Full Parity** | 5 | All tabs functional | M6 |
| **M8: Release Ready** | 6 | Both apps ready for stores | M7 |

---

## Appendix A: Quick Reference Commands

### Build Commands

```bash
# Build shared module
./gradlew :shared:build

# Build iOS framework
./gradlew :shared:linkDebugFrameworkIosArm64
./gradlew :shared:linkReleaseFrameworkIosArm64

# Build Android app
./gradlew :androidApp:assembleDebug
./gradlew :androidApp:assembleRelease

# Run all tests
./gradlew test

# Clean build
./gradlew clean
```

### Xcode Integration

After building the shared framework:

1. In Xcode, go to PoP target > Build Phases
2. Add "Run Script" phase before "Compile Sources"
3. Script:
```bash
cd "$SRCROOT/.."
./gradlew :shared:embedAndSignAppleFrameworkForXcode
```

---

## Appendix B: Resources

### Official Documentation
- [KMP Official Docs](https://kotlinlang.org/docs/multiplatform.html)
- [KMP Wizard](https://kmp.jetbrains.com/)
- [Compose Multiplatform](https://www.jetbrains.com/lp/compose-multiplatform/)

### Sample Projects
- [KMP Template](https://github.com/JetBrains/compose-multiplatform-template)
- [KMP Samples](https://github.com/Kotlin/kmm-samples)

### Community
- [KMP Discord](https://kotlinlang.org/community/)
- [#kotlin-multiplatform Slack](https://kotlinlang.slack.com/)

---

*This migration plan supports the open-source vision of PoP - enabling any state or PAC to contribute to and benefit from a shared codebase.*
