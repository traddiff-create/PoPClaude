# PoP iOS App - Architecture Documentation

## Overview

PoP (People Over Party) is a native iOS application built with SwiftUI and Core Data, designed to promote civic engagement in South Dakota. The architecture prioritizes offline-first functionality, modular state-specific content, and adaptability for other states/PACs.

---

## Technology Stack

| Layer | Technology | Purpose |
|-------|------------|---------|
| UI Framework | SwiftUI | Declarative native iOS interface |
| Navigation | NavigationStack | iOS 16+ navigation with type-safe routing |
| Persistence | Core Data | Local storage for progress, bookmarks, signups |
| Web Content | WebKit (WKWebView) | Embedded legislature and event browsing |
| Minimum Target | iOS 17.0 | iPhone and iPad support |

---

## Application Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         PoPApp.swift                            │
│                      (App Entry Point)                          │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                       ContentView.swift                         │
│                    (Main TabView - 6 Tabs)                      │
├─────────┬─────────┬─────────┬─────────┬─────────┬──────────────┤
│  Learn  │   SD    │  Docs   │  Vote   │ Connect │    About     │
│   Tab   │   Tab   │   Tab   │   Tab   │   Tab   │     Tab      │
└─────────┴─────────┴─────────┴─────────┴─────────┴──────────────┘
```

---

## Module Structure

### Core Modules

```
PoP/
├── PoPApp.swift                 # @main entry point
├── ContentView.swift            # TabView container
├── Persistence.swift            # Core Data stack
│
├── Theme/
│   └── Theme.swift              # Brand colors, button styles
│
├── Models/
│   └── DataModels.swift         # Swift data structures
│
├── Data/
│   ├── CivicsQuestions.swift    # 100 USCIS questions
│   └── FoundingDocuments.swift  # Full document text
│
├── Managers/
│   ├── FlashcardProgressManager.swift  # US civics progress
│   ├── SDProgressManager.swift         # SD civics progress
│   ├── BookmarkManager.swift           # Document bookmarks
│   └── NewsletterManager.swift         # Signup storage + CSV
│
└── Views/
    ├── LearnTab/
    ├── SouthDakotaTab/
    ├── DocumentsTab/
    ├── VoteTab/
    ├── ConnectTab/
    └── AboutTab/
```

### South Dakota Module (State-Specific)

```
Views/SouthDakotaTab/
├── SouthDakotaView.swift        # Hub with 5 feature cards
├── SouthDakotaLearnView.swift   # SD flashcard UI
├── SouthDakotaQuestions.swift   # 100 SD civics questions
├── SDProgressManager.swift      # Core Data persistence
│
├── Legislature/
│   ├── SDLegislatureView.swift  # Legislature hub
│   ├── SDStatutesView.swift     # 63 SDCL titles browser
│   └── SDBillsView.swift        # 2026 Session bills
│
├── Representatives/
│   ├── SDLegislators.swift      # Legislators database
│   └── ContactRepsView.swift    # Contact list + email
│
├── Events/
│   └── CivicEventsView.swift    # Events hub + WebView
│
└── Hearings/
    └── SDHearingsView.swift     # Testimony guide
```

---

## Data Flow Architecture

### Core Data Model

```
┌─────────────────────────────────────────────────────────────────┐
│                    NSPersistentContainer                        │
│                        (PoP.xcdatamodel)                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐  │
│  │ FlashcardProgress│  │SDFlashcardProgress│ │NewsletterSignup │  │
│  ├─────────────────┤  ├─────────────────┤  ├─────────────────┤  │
│  │ id: UUID        │  │ id: UUID        │  │ id: UUID        │  │
│  │ questionId: Int │  │ questionId: Int │  │ name: String    │  │
│  │ timesViewed: Int│  │ timesViewed: Int│  │ email: String   │  │
│  │ lastViewed: Date│  │ lastViewed: Date│  │ signupDate: Date│  │
│  │ isMarkedKnown   │  │ isMarkedKnown   │  │ syncedToServer  │  │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘  │
│                                                                 │
│  ┌─────────────────┐                                            │
│  │ DocumentBookmark │                                            │
│  ├─────────────────┤                                            │
│  │ id: UUID        │                                            │
│  │ documentId: Str │                                            │
│  │ sectionId: Str? │                                            │
│  │ createdAt: Date │                                            │
│  └─────────────────┘                                            │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Manager Pattern

All data managers use @MainActor singleton pattern for thread safety:

```swift
@MainActor
final class FlashcardProgressManager: ObservableObject {
    static let shared = FlashcardProgressManager()

    @Published var progress: [Int: FlashcardProgress] = [:]

    private let context: NSManagedObjectContext

    private init() {
        context = PersistenceController.shared.container.viewContext
        loadProgress()
    }
}
```

---

## Navigation Architecture

### Tab Structure

```swift
TabView {
    LearnView()           // Tab 1: US Civics
    SouthDakotaView()     // Tab 2: SD Hub
    DocumentsView()       // Tab 3: Founding Docs
    VoteView()            // Tab 4: Ballotpedia
    ConnectView()         // Tab 5: Newsletter
    AboutView()           // Tab 6: Mission
}
```

### South Dakota Navigation Graph

```
SouthDakotaView (Hub)
├── SouthDakotaLearnView
│   └── Flashcard interaction
│
├── ContactRepsView
│   ├── FindByAddressView (WebView)
│   ├── TemplatesListView (Sheet)
│   └── EmailComposerSheet
│
├── CivicEventsView
│   ├── EventsWebView (Browse)
│   ├── EventsWebView (Submit)
│   └── NonviolenceGuidelinesView
│
├── SDHearingsView
│   ├── HearingWebView (Committees)
│   └── HowToTestifyView
│
└── SDLegislatureView
    ├── SDStatutesView
    │   └── StatuteWebView (per title)
    └── SDBillsView
        └── BillsWebView
```

---

## WebView Integration

### UIViewRepresentable Pattern

```swift
struct StatuteWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.allowsBackForwardNavigationGestures = true
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
```

### WebView Usage

| View | URL | Purpose |
|------|-----|---------|
| SDStatutesView | sdlegislature.gov/Statutes/Codified_Laws/Title_* | Browse SDCL |
| SDBillsView | sdlegislature.gov/Session/Bills/71 | 2026 Bills |
| CivicEventsView | peopleoverpartysd.com/events | Find events |
| SDHearingsView | sdlegislature.gov/Session/Committees/71 | Hearings |
| FindByAddressView | sdlegislature.gov/Legislators/Find | Lookup |

---

## Theming System

### Brand Colors

```swift
extension Color {
    static let popBlue = Color(hex: "1A7BA8")       // Primary
    static let popGold = Color(hex: "E8A832")       // Accent
    static let popDarkBlue = Color(hex: "0D3D54")   // Text/Dark BG
    static let popLightBackground = Color(hex: "F5F5F5")
}
```

### Button Styles

```swift
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.popBlue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
}
```

---

## Adaptability Architecture

### Configuration-Driven Design

Future `AppConfig.swift` structure for multi-state support:

```swift
struct AppConfig {
    // Organization
    let orgName: String           // "People Over Party"
    let orgTagline: String        // "Better Together"
    let contactEmail: String
    let website: URL

    // State Configuration
    let stateName: String         // "South Dakota"
    let stateAbbrev: String       // "SD"
    let capital: String           // "Pierre"
    let legislatureURL: URL
    let sosURL: URL               // Secretary of State

    // County/Municipal (optional)
    let countyName: String?       // "Pennington County"
    let municipalName: String?    // "Rapid City"

    // Branding
    let primaryColor: Color
    let accentColor: Color
}
```

### State Module Template

Each state would contain:
```
{State}Module/
├── {State}Questions.swift       # State civics questions
├── {State}LearnView.swift       # Flashcard UI
├── {State}Legislators.swift     # Representatives data
├── {State}LegislatureView.swift # Legislature browser
├── {State}StatutesData.swift    # Law titles/links
└── {State}Resources.swift       # County election offices
```

---

## External Dependencies

| Dependency | Type | Purpose |
|------------|------|---------|
| WebKit | System Framework | WKWebView for web content |
| Core Data | System Framework | Local persistence |
| MessageUI | System Framework | Email composition (optional) |

**No third-party dependencies** - App uses only Apple frameworks.

---

## Security Considerations

1. **No User Accounts** - No authentication required
2. **Local Data Only** - Core Data stored on device
3. **No API Keys** - All web content via public URLs
4. **URL Scheme Safety** - `mailto:` and `tel:` for actions
5. **WebView Isolation** - Sandboxed web content

---

## Performance Considerations

1. **Lazy Loading** - Views loaded on-demand via NavigationStack
2. **Efficient Lists** - ForEach with Identifiable items
3. **Image Caching** - SF Symbols used (no remote images)
4. **WebView Reuse** - Single WKWebView per sheet
5. **Core Data Batching** - Fetch on init, update incrementally

---

## Testing Strategy

| Test Type | Tool | Coverage |
|-----------|------|----------|
| Unit Tests | XCTest | Data managers, models |
| UI Tests | XCUITest | Navigation flows |
| Snapshot Tests | (Future) | View consistency |
| Manual Testing | iOS Simulator | Full app walkthrough |

---

## Build Configuration

```bash
# Open project
open /Users/rorystone/Documents/PoPClaude/PoP/PoP.xcodeproj

# Build for simulator
xcodebuild -project PoP.xcodeproj \
  -scheme PoP \
  -destination 'platform=iOS Simulator,name=iPhone 15'

# Bundle Identifier
com.peopleoverpartysd.pop
```

---

## Future Architecture Considerations

1. **CloudKit Sync** - Sync bookmarks/progress across devices
2. **Push Notifications** - Bill alerts, event reminders
3. **Widget Extension** - Home screen quick actions
4. **App Intents** - Siri shortcuts for common actions
5. **Localization** - Multi-language support
6. **Accessibility** - VoiceOver, Dynamic Type enhancements
