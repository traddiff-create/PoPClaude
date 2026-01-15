# Forking Guide: Adapt PoP for Your State

Step-by-step instructions to customize the People Over Party app for your state or organization.

**Estimated time:** 2-4 hours

---

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Fork and Clone](#fork-and-clone)
3. [Files to Customize](#files-to-customize)
4. [Step-by-Step Customization](#step-by-step-customization)
5. [Data Sources](#data-sources)
6. [Testing](#testing)
7. [App Store Submission](#app-store-submission)

---

## Prerequisites

### Required
- **macOS** Sonoma (14.0) or later
- **Xcode** 15.0 or later ([Download from App Store](https://apps.apple.com/us/app/xcode/id497799835))
- **Apple Developer Account** ($99/year for App Store distribution)
- Basic familiarity with Xcode and Swift

### Recommended
- Git for version control
- Text editor (VS Code, Sublime Text, etc.)
- Spreadsheet app for organizing legislator data

---

## Fork and Clone

### Option A: GitHub Fork (Recommended)

1. Go to the repository on GitHub
2. Click **Fork** in the top right
3. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/PoP.git
   cd PoP
   ```

### Option B: Direct Download

1. Download the repository as a ZIP
2. Extract to your desired location
3. Open Terminal and navigate to the folder

### Open in Xcode

```bash
open PoP/PoP.xcodeproj
```

---

## Files to Customize

Here's a complete list of files you'll need to modify:

| Priority | File | Changes Required |
|----------|------|------------------|
| **High** | `SDLegislators.swift` | Replace with your state's legislators |
| **High** | `SouthDakotaQuestions.swift` | Replace with your state's civics questions |
| **High** | `AboutView.swift` | Organization name, founder, mission |
| **High** | `ConnectView.swift` | Contact email, phone, address |
| **Medium** | `Theme.swift` | Brand colors (optional) |
| **Medium** | `VoteView.swift` | State election resource URLs |
| **Medium** | `ContentView.swift` | Tab names |
| **Medium** | `SouthDakotaView.swift` | State name and facts |
| **Low** | `Info.plist` | Bundle ID for App Store |
| **Low** | `Assets.xcassets` | App icon (optional) |

---

## Step-by-Step Customization

### Step 1: Update Legislators Database

**File:** `PoP/PoP/SDLegislators.swift`

**Rename the file** to match your state (e.g., `TXLegislators.swift` for Texas).

**Update the struct and static arrays:**

```swift
// Change from:
struct SDLegislators {
    static let usCongressMembers: [Representative] = [...]
    static let sdSenate: [Representative] = [...]
    static let sdHouse: [Representative] = [...]
}

// To (example for Texas):
struct TXLegislators {
    static let usCongressMembers: [Representative] = [
        // Texas has 2 US Senators
        Representative(
            name: "John Cornyn",
            chamber: .usSenate,
            district: 0,
            party: .republican,
            email: "senator@cornyn.senate.gov",
            phone: "(202) 224-2934",
            hometown: "Austin",
            photoURL: nil
        ),
        // Add second senator...
        // Texas has 38 US Representatives
        // Add all representatives...
    ]

    static let txSenate: [Representative] = [
        // Texas has 31 State Senators
        Representative(
            name: "Senator Name",
            chamber: .sdSenate,  // Note: Update Chamber enum if needed
            district: 1,
            party: .republican,
            email: "firstname.lastname@senate.texas.gov",
            phone: nil,
            hometown: "City",
            photoURL: nil
        ),
        // Add all 31 senators...
    ]

    static let txHouse: [Representative] = [
        // Texas has 150 State Representatives
        // Add all representatives...
    ]
}
```

**Update the Chamber enum** in the same file if your state uses different terminology:

```swift
enum Chamber: String, CaseIterable {
    case sdSenate = "TX Senate"      // Change display name
    case sdHouse = "TX House"        // Change display name
    case usSenate = "US Senate"
    case usHouse = "US House"
    // ...
}
```

**Update helper methods** at the bottom of the file to reference your new struct name.

---

### Step 2: Update State Civics Questions

**File:** `PoP/PoP/SouthDakotaQuestions.swift`

**Rename** to `YourStateQuestions.swift`.

**Update the questions:**

```swift
// Change category names if needed
enum YourStateCategory: String, CaseIterable {
    case state = "State Government"
    case county = "County Government"    // Or your equivalent
    case municipal = "City Government"   // Or your equivalent
}

// Update questions
struct YourStateQuestions {
    static let allQuestions: [StateQuestion] = [
        // State Government Questions
        StateQuestion(
            id: 1,
            question: "What is the capital of [Your State]?",
            answer: "[Your Capital]",
            category: .state
        ),
        StateQuestion(
            id: 2,
            question: "When did [Your State] become a state?",
            answer: "[Year] (the [Xth] state)",
            category: .state
        ),
        // Add 40-50 state questions
        // Add 20-30 county questions
        // Add 20-30 municipal questions
    ]
}
```

---

### Step 3: Update Organization Info

**File:** `PoP/PoP/Views/AboutView.swift`

Find and replace:
- Organization name
- Founder name and info
- Location
- Website URL

```swift
// Around line 37, change:
Text("Rapid City, South Dakota")
// To:
Text("Your City, Your State")

// Around lines 99-103, update founder info:
Text("Nicole Stone")  // → Your founder's name
Text("Founded in...")  // → Your story
```

---

### Step 4: Update Contact Information

**File:** `PoP/PoP/Views/ConnectView.swift`

```swift
// Around line 134, update social media:
Text("@bettertogether_605")
// To:
Text("@your_handle")

// Around lines 162-164, update contact:
Text("hello@peopleoverpartysd.com")  // → Your email
Text("(605) 389-3613")               // → Your phone
Text("2511 W Chicago, Rapid City, SD") // → Your address
```

---

### Step 5: Update Theme Colors (Optional)

**File:** `PoP/PoP/Theme.swift`

```swift
// Update brand colors (RGB values 0-1):
extension Color {
    // Primary color
    static let popBlue = Color(red: 0.102, green: 0.482, blue: 0.659)
    // Accent color
    static let popGold = Color(red: 0.910, green: 0.659, blue: 0.196)
    // Dark background
    static let popDarkBlue = Color(red: 0.051, green: 0.239, blue: 0.329)
}

// Tip: Use a color converter to get RGB from hex:
// #1A7BA8 → red: 0.102, green: 0.482, blue: 0.659
```

---

### Step 6: Update Voting Resources

**File:** `PoP/PoP/Views/VoteView.swift`

Update all URLs to your state's resources:

```swift
// Around line 47, voter registration:
"https://sdsos.gov/elections-voting/voting/register-to-vote/"
// To:
"https://your-state-sos.gov/voter-registration"

// Around line 66, voter status check:
"https://vip.sdsos.gov/VIPLogin.aspx"
// To:
"https://your-state-voter-lookup-url"
```

---

### Step 7: Update Tab Names

**File:** `PoP/PoP/ContentView.swift`

```swift
// Find the TabView and update labels:
TabView {
    // ...
    SouthDakotaView()  // Rename to YourStateView()
        .tabItem {
            Label("South Dakota", systemImage: "star.fill")
            // Change to:
            Label("Texas", systemImage: "star.fill")
        }
}
```

---

### Step 8: Update State View

**File:** `PoP/PoP/Views/SouthDakotaView.swift`

**Rename** to `YourStateView.swift`.

Update state facts:

```swift
// Update the stats section:
HStack {
    StatBox(label: "Statehood", value: "1889")    // Your year
    StatBox(label: "Capital", value: "Pierre")    // Your capital
    StatBox(label: "Counties", value: "66")       // Your count
}

// Update legislature URLs throughout the file
```

---

### Step 9: Update Bundle Identifier

**In Xcode:**

1. Select the project in the navigator (blue icon at top)
2. Select the "PoP" target
3. Go to "Signing & Capabilities" tab
4. Change **Bundle Identifier** from:
   `com.peopleoverpartysd.pop`
   To:
   `com.yourorganization.yourapp`

---

### Step 10: Update App Icon (Optional)

**Location:** `PoP/PoP/Assets.xcassets/AppIcon.appiconset/`

1. Create a 1024x1024 PNG image for your app icon
2. Name it `AppIcon.png`
3. Replace the existing file
4. Xcode will auto-generate smaller sizes

---

## Data Sources

### Finding Your State's Legislators

| Source | URL | Notes |
|--------|-----|-------|
| **Ballotpedia** | [ballotpedia.org](https://ballotpedia.org/) | Comprehensive, searchable |
| **OpenStates** | [openstates.org](https://openstates.org/) | API available |
| **Your State Legislature** | Varies | Official but may require scraping |
| **Civic APIs** | [civicapi.us](https://www.civicapi.us/) | Programmatic access |

### Email Format Patterns

Most state legislatures use one of these patterns:
- `firstname.lastname@legislature.state.gov`
- `firstname.lastname@leg.state.gov`
- `flastname@senate.state.gov`

Check your state legislature's website for the correct format.

### State Civics Questions

Sources for state-specific civics content:
- Your state's Secretary of State website
- State bar association civic education materials
- Local library resources
- State historical society

---

## Testing

### Before Publishing

- [ ] App builds without errors (`Cmd+B`)
- [ ] App runs on simulator (`Cmd+R`)
- [ ] All legislators display correctly
- [ ] Contact buttons work (email, phone)
- [ ] All civics questions display
- [ ] Theme colors appear correctly
- [ ] All external links work
- [ ] App works on iPhone and iPad
- [ ] No crashes during normal use

### Test Devices

Test on multiple simulator devices:
- iPhone 17 Pro Max (largest)
- iPhone 17 (standard)
- iPhone SE (smallest)
- iPad Pro 13" (if supporting iPad)

---

## App Store Submission

### Requirements

1. **Apple Developer Account** ($99/year)
2. **App Icon** (1024x1024)
3. **Screenshots** (6.9" iPhone required, 13" iPad if supporting iPad)
4. **App Description** (up to 4000 characters)
5. **Privacy Policy URL** (hosted on your website)

### Steps

1. **Archive the app:** Product → Archive
2. **Validate:** Window → Organizer → Validate App
3. **Upload:** Organizer → Distribute App → App Store Connect
4. **Configure in App Store Connect:**
   - Fill in metadata
   - Upload screenshots
   - Set pricing (Free)
   - Submit for review

### Tips

- App Review typically takes 1-3 days
- Be specific about your app's civic education purpose
- Emphasize nonpartisan nature in description
- Have privacy policy ready before submission

---

## Common Issues

### "Cannot find X in scope"

You renamed a file but didn't update all references. Use Xcode's Find and Replace (`Cmd+Shift+F`) to find all occurrences.

### Build errors after renaming

Make sure to update:
- Struct names
- File references in other files
- Import statements if you created new modules

### Simulator won't launch

Try: Product → Clean Build Folder (`Cmd+Shift+K`), then rebuild.

---

## Questions?

- Open an issue on GitHub
- Email the original developers: hello@peopleoverpartysd.com

---

*Good luck with your civic engagement app!*
