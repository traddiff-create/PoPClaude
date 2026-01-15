# PoP - People Over Party

**Civic engagement made easy. Democracy starts with you.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-iOS%2017%2B-lightgrey.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org/)

An open-source iOS app for civic education and engagement, built by [Better Together: People Over Party](https://www.peopleoverpartysd.com/) in Rapid City, South Dakota.

---

## Mission

People Over Party promotes civic engagement without telling you how to vote. We believe an informed citizenry is essential for democracy.

Our philosophy is inspired by Dr. Martin Luther King Jr.'s [Six Principles of Nonviolence](https://thekingcenter.org/about-tkc/the-king-philosophy/):
1. **Courageous Resistance** - Active resistance to injustice
2. **Friendship and Understanding** - The goal is reconciliation
3. **Targeting Evil, Not People** - Distinguish wrongdoers from wrong actions
4. **Redemptive Suffering** - Voluntary suffering for justice
5. **Love Over Hate** - Resist through understanding
6. **Faith in Justice** - Deep conviction that justice will prevail

---

## Features

### Learn
- 100 USCIS naturalization civics questions in flashcard format
- 100 state-specific civics questions (state, county, municipal)
- Track your learning progress

### Documents
- U.S. Constitution (full text, searchable)
- Bill of Rights and all 27 Amendments
- Declaration of Independence
- State Constitution
- Bookmark your favorite sections

### Vote
- Find your ballot via Ballotpedia
- Voter registration links
- County and state election resources

### Contact Representatives
- Complete directory of state legislators
- Contact via email or phone
- Find your representatives by address
- Pre-written message templates

### Engage
- Discussion guides for civic conversations
- Issue explorer with multiple perspectives
- Common Ground Finder quiz
- Candidate research guide

### Connect
- Newsletter signup
- Community links
- Organization contact information

---

## For Developers

### Requirements
- Xcode 15.0+
- iOS 17.0+
- Swift 5.9+
- Apple Developer Account (for App Store distribution)

### Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/PoP.git

# Open in Xcode
cd PoP
open PoP/PoP.xcodeproj

# Build and run on simulator
# Select iPhone 17 Pro Max and press Cmd+R
```

### Project Structure

```
PoP/
├── PoP/
│   ├── PoPApp.swift              # App entry point
│   ├── ContentView.swift         # Main TabView
│   ├── Theme.swift               # Brand colors and styles
│   ├── Views/                    # SwiftUI views by tab
│   ├── Data/                     # Static data (questions, documents)
│   └── Managers/                 # Core Data managers
└── docs/                         # Documentation
```

---

## Adapt for Your State

This app is designed to be forked and customized for any state or civic organization.

**Getting Started:**
1. [Starting a PAC](docs/STARTING_A_PAC.md) - Guide to forming a civic engagement organization
2. [Forking Guide](docs/FORKING_GUIDE.md) - Step-by-step instructions to customize the app
3. [State Data Template](docs/STATE_DATA_TEMPLATE.md) - Templates for your state's data

**Estimated time to customize:** 2-4 hours

---

## Tech Stack

- **SwiftUI** - Modern declarative UI framework
- **Core Data** - Local persistence for progress tracking
- **WebKit** - Embedded web views for legislature resources
- **No external dependencies** - Fully self-contained

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

Areas where we'd love help:
- Adding support for more states
- Improving accessibility (VoiceOver, Dynamic Type)
- Localization for multiple languages
- Bug fixes and performance improvements

---

## License

This project is licensed under the MIT License - see [LICENSE](LICENSE) for details.

---

## Credits

**Organization:** Better Together: People Over Party
**Founder:** Nicole Stone
**Location:** Rapid City, South Dakota
**Website:** [peopleoverpartysd.com](https://www.peopleoverpartysd.com/)

**Data Sources:**
- [Ballotpedia](https://ballotpedia.org/) - Election information
- [The King Center](https://thekingcenter.org/) - Nonviolence principles
- [U.S. Citizenship and Immigration Services](https://www.uscis.gov/) - Civics test questions

---

## Contact

- **Email:** hello@peopleoverpartysd.com
- **Phone:** (605) 389-3613
- **Instagram:** [@bettertogether_605](https://instagram.com/bettertogether_605)

---

*"People Over Party - because democracy works best when we work together."*
