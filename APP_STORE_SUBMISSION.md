# PoP - People Over Party: App Store Submission Guide

## App Information

| Field | Value |
|-------|-------|
| **App Name** | PoP - People Over Party |
| **Subtitle** | Civic Engagement Made Easy |
| **Bundle ID** | com.peopleoverpartysd.pop |
| **Version** | 1.0.0 |
| **Primary Category** | Reference |
| **Secondary Category** | Education |
| **Age Rating** | 4+ |
| **Copyright** | 2026 Better Together: People Over Party |

---

## App Description (4000 chars max)

```
PoP - People Over Party is your essential South Dakota civic engagement companion. Built by Better Together: People Over Party PAC, this app makes it easy to learn about civics, contact your representatives, and participate in democracy.

FEATURES:

LEARN
- 100 USCIS naturalization test questions in flashcard format
- 100 South Dakota-specific civics questions covering state, county, and municipal government
- Track your learning progress and mark cards as learned

SOUTH DAKOTA
- Browse all 63 South Dakota Codified Law titles
- Track current legislative bills (71st Session)
- Contact all 108 South Dakota legislators directly via email
- Find your representatives by address
- Committee hearing schedules and testifying guide
- Civic events calendar

DOCUMENTS
- Read the U.S. Constitution, Bill of Rights, and Declaration of Independence
- Browse the South Dakota Constitution
- Full-text search across all documents
- Bookmark your favorite sections

VOTE
- Find your ballot information via Ballotpedia
- Quick links to voter registration
- Pennington County and SD Secretary of State resources

ENGAGE
- Discussion guides for productive civic conversations
- Issue explorer with multiple perspectives on key topics
- Common Ground Finder quiz to discover shared values
- Candidate research guide

CONNECT
- Join our community
- Sign up for the newsletter
- Contact information

People Over Party promotes civic engagement without telling you how to vote. We believe an informed citizenry is essential for democracy.

Inspired by Dr. Martin Luther King Jr.'s principles of nonviolence.

Built with love in Rapid City, South Dakota.
```

---

## Keywords (100 chars max)

```
civics,voting,South Dakota,legislature,constitution,democracy,civic engagement,SD,voter,bill tracker
```

---

## Promotional Text (170 chars, editable without new build)

```
Learn civics, contact your SD legislators, and engage in democracy. Now featuring the complete 71st Session legislator directory with all 108 representatives!
```

---

## What's New (for updates)

```
Version 1.0.0 - Initial Release
- 100 USCIS civics flashcards
- 100 South Dakota civics flashcards
- Complete founding documents library
- Full SD Legislature directory (108 legislators)
- Contact representatives directly
- Committee hearings guide
- Civic events integration
- Issue explorer with multiple perspectives
- Common Ground Finder quiz
```

---

## Screenshots Required

### iPhone 6.9" (1260 x 2736 px) - REQUIRED
Capture these screens on iPhone 17 Pro Max simulator:

1. **Learn Tab** - Show a flashcard with question visible
2. **South Dakota Tab** - Hub view with feature cards
3. **Contact Reps** - List showing legislators
4. **Documents Tab** - Constitution or Declaration view
5. **Vote Tab** - Voting resources
6. **Engage Tab** - Discussion guides or quiz

### iPad 13" (2064 x 2752 px) - If supporting iPad
Same screens as iPhone

---

## Support Information

| Field | Value |
|-------|-------|
| **Support URL** | https://www.peopleoverpartysd.com/ |
| **Marketing URL** | https://www.peopleoverpartysd.com/ |
| **Privacy Policy URL** | https://www.peopleoverpartysd.com/privacy |

---

## Contact Information

| Field | Value |
|-------|-------|
| **First Name** | Nicole |
| **Last Name** | Stone |
| **Email** | hello@peopleoverpartysd.com |
| **Phone** | (605) 389-3613 |
| **Address** | 2511 W Chicago, Rapid City, SD |

---

## App Privacy Labels

### Data Collected

| Data Type | Usage | Linked to User |
|-----------|-------|----------------|
| Name | Newsletter signup | Yes |
| Email | Newsletter signup | Yes |

### Data NOT Collected
- Location
- Financial info
- Health & Fitness
- Browsing history
- Search history
- Purchases

### Privacy Practices
- **Data Used to Track You**: No
- **Data Linked to You**: Name, Email (newsletter only)
- **Third-Party Advertising**: No
- **Third-Party Analytics**: No

---

## Export Compliance

| Question | Answer |
|----------|--------|
| Does your app use encryption? | No (standard HTTPS only) |
| Does your app qualify for exemption? | Yes - standard encryption |

---

## Content Rights

- All content is original or properly licensed
- No third-party intellectual property without permission
- Ballotpedia data used with attribution
- Government documents are public domain

---

## Privacy Policy Draft

```
PRIVACY POLICY FOR PoP - PEOPLE OVER PARTY

Last Updated: January 2026

Better Together: People Over Party ("we", "our", "us") operates the PoP mobile application.

INFORMATION WE COLLECT

Newsletter Signup:
- Name (optional)
- Email address

This information is stored locally on your device and may be synced via Apple's iCloud if you have iCloud enabled.

Learning Progress:
- Flashcard progress (which cards you've viewed/learned)
- Document bookmarks

This data is stored locally to personalize your learning experience.

Event Check-ins:
- Event codes
- Volunteer names
- Check-in times

This data helps track volunteer participation at events.

HOW WE USE YOUR INFORMATION

- To send newsletters (if you sign up)
- To track your learning progress
- To improve the app experience

SHARING YOUR INFORMATION

We do not sell, trade, or share your personal information with third parties, except:
- When required by law
- With your explicit consent

DATA STORAGE

Your data is stored locally on your device using Apple's Core Data framework. If you have iCloud enabled, data may sync across your Apple devices.

YOUR RIGHTS

You can:
- Delete your newsletter signup at any time
- Clear your learning progress
- Delete the app to remove all local data

CHILDREN'S PRIVACY

Our app is rated 4+ and does not knowingly collect information from children under 13.

CHANGES TO THIS POLICY

We may update this privacy policy. Changes will be posted in the app.

CONTACT US

Better Together: People Over Party
2511 W Chicago
Rapid City, SD
Email: hello@peopleoverpartysd.com
Phone: (605) 389-3613
```

---

## Pre-Submission Checklist

- [ ] Apple Developer Program membership active ($99/year)
- [ ] App ID registered in Developer Portal
- [ ] Provisioning profiles created (Development + Distribution)
- [ ] App icon uploaded (1024x1024)
- [ ] Launch screen configured
- [ ] Screenshots captured for iPhone 6.9"
- [ ] Screenshots captured for iPad 13" (if iPad support)
- [ ] App description finalized
- [ ] Keywords optimized
- [ ] Privacy policy hosted at URL
- [ ] Privacy labels configured in App Store Connect
- [ ] Support URL accessible
- [ ] Age rating questionnaire completed
- [ ] Export compliance answered
- [ ] Archive app in Xcode (Product > Archive)
- [ ] Validate archive
- [ ] Upload to App Store Connect
- [ ] Submit for review

---

## Build & Upload Commands

```bash
# Open in Xcode
open /Users/rorystone/Documents/PoPClaude/PoP/PoP.xcodeproj

# Build for Release
xcodebuild -project PoP.xcodeproj -scheme PoP -configuration Release -destination 'generic/platform=iOS'

# Archive (do this in Xcode GUI)
# Product > Archive > Distribute App > App Store Connect
```
