# State Data Templates

Blank templates for creating your state's data files. Copy these templates and fill in your state's information.

---

## Table of Contents
1. [Legislator Data Template](#legislator-data-template)
2. [State Civics Questions Template](#state-civics-questions-template)
3. [State Facts Template](#state-facts-template)
4. [Election Resources Checklist](#election-resources-checklist)
5. [Example: Completed State Data](#example-completed-state-data)

---

## Legislator Data Template

### US Congress Members

```swift
// US Senators (2 per state)
Representative(
    name: "[FULL NAME]",
    chamber: .usSenate,
    district: 0,
    party: .[republican/democrat/independent],
    email: "[EMAIL]",
    phone: "([AREA]) [NUMBER]",
    hometown: "[CITY]",
    photoURL: nil
),

// US Representatives (varies by state)
Representative(
    name: "[FULL NAME]",
    chamber: .usHouse,
    district: [DISTRICT NUMBER],
    party: .[republican/democrat/independent],
    email: "[EMAIL]",
    phone: "([AREA]) [NUMBER]",
    hometown: "[CITY]",
    photoURL: nil
),
```

### State Legislators

```swift
// State Senator
Representative(
    name: "[FULL NAME]",
    chamber: .sdSenate,  // Update enum value for your state
    district: [DISTRICT NUMBER],
    party: .[republican/democrat/independent],
    email: "[firstname].[lastname]@[legislature.state.gov]",
    phone: nil,  // Optional
    hometown: nil,  // Optional
    photoURL: nil
),

// State Representative/Assembly Member
Representative(
    name: "[FULL NAME]",
    chamber: .sdHouse,  // Update enum value for your state
    district: [DISTRICT NUMBER],
    party: .[republican/democrat/independent],
    email: "[firstname].[lastname]@[legislature.state.gov]",
    phone: nil,
    hometown: nil,
    photoURL: nil
),
```

### Spreadsheet Format (for data collection)

| Name | Chamber | District | Party | Email | Phone | Hometown |
|------|---------|----------|-------|-------|-------|----------|
| John Smith | State Senate | 1 | R | john.smith@leg.state.gov | (555) 123-4567 | Capital City |
| Jane Doe | State House | 1 | D | jane.doe@leg.state.gov | | Anytown |

---

## State Civics Questions Template

### Question Structure

```swift
StateQuestion(
    id: [UNIQUE NUMBER],
    question: "[QUESTION TEXT]?",
    answer: "[ANSWER TEXT]",
    category: .[state/county/municipal]
),
```

### Recommended Categories

1. **State Government** (40-50 questions)
   - State history and symbols
   - Executive branch (Governor, Lt. Governor, etc.)
   - Legislative branch (structure, how laws are made)
   - Judicial branch (court system)
   - State constitution

2. **County Government** (20-30 questions)
   - County structure and leadership
   - County services
   - Local history
   - School districts

3. **Municipal Government** (20-30 questions)
   - City/town structure
   - Mayor and council
   - Local services
   - Community features

### Sample Questions by Category

#### State Government
```swift
// History
StateQuestion(id: 1, question: "What is the capital of [STATE]?", answer: "[CAPITAL CITY]", category: .state),
StateQuestion(id: 2, question: "When did [STATE] become a state?", answer: "[YEAR] (the [Xth] state)", category: .state),
StateQuestion(id: 3, question: "What is the state bird of [STATE]?", answer: "[BIRD NAME]", category: .state),
StateQuestion(id: 4, question: "What is the state motto of [STATE]?", answer: "[MOTTO]", category: .state),

// Executive
StateQuestion(id: 10, question: "Who is the current Governor of [STATE]?", answer: "[NAME] ([PARTY])", category: .state),
StateQuestion(id: 11, question: "How long is the Governor's term?", answer: "[X] years", category: .state),
StateQuestion(id: 12, question: "How many terms can the Governor serve?", answer: "[Limit or 'No limit']", category: .state),

// Legislative
StateQuestion(id: 20, question: "How many members are in the [STATE] Senate?", answer: "[NUMBER] senators", category: .state),
StateQuestion(id: 21, question: "How many members are in the [STATE] House?", answer: "[NUMBER] representatives", category: .state),
StateQuestion(id: 22, question: "How long is a State Senator's term?", answer: "[X] years", category: .state),
StateQuestion(id: 23, question: "How long is a State Representative's term?", answer: "[X] years", category: .state),

// Judicial
StateQuestion(id: 30, question: "What is the highest court in [STATE]?", answer: "[STATE] Supreme Court", category: .state),
StateQuestion(id: 31, question: "How many justices are on the [STATE] Supreme Court?", answer: "[NUMBER] justices", category: .state),
```

#### County Government
```swift
StateQuestion(id: 50, question: "When was [COUNTY] County established?", answer: "[YEAR]", category: .county),
StateQuestion(id: 51, question: "What is the county seat of [COUNTY] County?", answer: "[CITY]", category: .county),
StateQuestion(id: 52, question: "Who is the current [COUNTY] County Sheriff?", answer: "[NAME]", category: .county),
StateQuestion(id: 53, question: "How many commissioners serve on the [COUNTY] County Commission?", answer: "[NUMBER]", category: .county),
```

#### Municipal Government
```swift
StateQuestion(id: 70, question: "Who is the current Mayor of [CITY]?", answer: "[NAME]", category: .municipal),
StateQuestion(id: 71, question: "How many members are on the [CITY] City Council?", answer: "[NUMBER]", category: .municipal),
StateQuestion(id: 72, question: "What form of government does [CITY] use?", answer: "[Mayor-Council/Council-Manager/etc.]", category: .municipal),
StateQuestion(id: 73, question: "When was [CITY] incorporated?", answer: "[YEAR]", category: .municipal),
```

---

## State Facts Template

### Basic Information

| Fact | Value |
|------|-------|
| State Name | |
| Abbreviation | |
| Capital | |
| Statehood Year | |
| Statehood Order | (e.g., "40th state") |
| Number of Counties | |
| Population (approx.) | |
| State Bird | |
| State Flower | |
| State Motto | |

### Legislature Information

| Fact | Value |
|------|-------|
| Legislature Name | (e.g., "General Assembly") |
| Upper Chamber Name | (e.g., "Senate") |
| Upper Chamber Size | |
| Upper Chamber Term | |
| Lower Chamber Name | (e.g., "House of Representatives") |
| Lower Chamber Size | |
| Lower Chamber Term | |
| Session Schedule | (e.g., "Annual" or "Biennial") |
| Legislature Website | |

### Key URLs

| Resource | URL |
|----------|-----|
| State Legislature | |
| Secretary of State | |
| Voter Registration | |
| Voter Status Check | |
| Sample Ballot Lookup | |
| Election Calendar | |
| Find My Legislator | |

---

## Election Resources Checklist

### URLs to Collect

- [ ] State Secretary of State homepage
- [ ] Online voter registration
- [ ] Voter registration status check
- [ ] Polling place locator
- [ ] Absentee/mail ballot request
- [ ] Sample ballot lookup
- [ ] Election results page
- [ ] Campaign finance database

### For Your Primary County

- [ ] County elections office homepage
- [ ] County voter registration
- [ ] County polling locations
- [ ] County election calendar
- [ ] County auditor/clerk contact

### For Your Primary City

- [ ] City clerk/elections page
- [ ] Municipal election information
- [ ] City council meeting schedule

---

## Example: Completed State Data

### Texas Example (Partial)

```swift
// TXLegislators.swift

struct TXLegislators {

    // US Congress
    static let usCongressMembers: [Representative] = [
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
        Representative(
            name: "Ted Cruz",
            chamber: .usSenate,
            district: 0,
            party: .republican,
            email: "senator@cruz.senate.gov",
            phone: "(202) 224-5922",
            hometown: "Houston",
            photoURL: nil
        ),
        // ... 38 US Representatives
    ]

    // State Senate (31 members)
    static let txSenate: [Representative] = [
        Representative(
            name: "Bryan Hughes",
            chamber: .sdSenate,
            district: 1,
            party: .republican,
            email: "bryan.hughes@senate.texas.gov",
            phone: nil,
            hometown: "Mineola",
            photoURL: nil
        ),
        // ... remaining 30 senators
    ]

    // State House (150 members)
    static let txHouse: [Representative] = [
        Representative(
            name: "Gary VanDeaver",
            chamber: .sdHouse,
            district: 1,
            party: .republican,
            email: "gary.vandeaver@house.texas.gov",
            phone: nil,
            hometown: "New Boston",
            photoURL: nil
        ),
        // ... remaining 149 representatives
    ]
}
```

### Texas Civics Questions (Partial)

```swift
// TXQuestions.swift

struct TXQuestions {
    static let allQuestions: [StateQuestion] = [
        // State Government
        StateQuestion(
            id: 1,
            question: "What is the capital of Texas?",
            answer: "Austin",
            category: .state
        ),
        StateQuestion(
            id: 2,
            question: "When did Texas become a state?",
            answer: "1845 (the 28th state)",
            category: .state
        ),
        StateQuestion(
            id: 3,
            question: "How many members are in the Texas Senate?",
            answer: "31 senators",
            category: .state
        ),
        StateQuestion(
            id: 4,
            question: "How many members are in the Texas House?",
            answer: "150 representatives",
            category: .state
        ),
        StateQuestion(
            id: 5,
            question: "What is the Texas state motto?",
            answer: "Friendship",
            category: .state
        ),
        // ... continue with more questions
    ]
}
```

### Texas State Facts

| Fact | Value |
|------|-------|
| State Name | Texas |
| Abbreviation | TX |
| Capital | Austin |
| Statehood Year | 1845 |
| Statehood Order | 28th state |
| Number of Counties | 254 |
| State Bird | Northern Mockingbird |
| State Motto | Friendship |
| Legislature | Texas Legislature |
| Senate Size | 31 members |
| House Size | 150 members |
| Legislature URL | https://capitol.texas.gov/ |
| SOS URL | https://www.sos.state.tx.us/ |

---

## Data Collection Tips

### Finding Legislator Data

1. **Start with Ballotpedia** - Most comprehensive, regularly updated
2. **Cross-reference with official site** - Verify email formats
3. **Use spreadsheet first** - Easier to organize before coding
4. **Automate if possible** - Consider scripts for large legislatures

### Writing Civics Questions

1. **Start with state constitution** - Great source of factual questions
2. **Focus on practical knowledge** - What citizens need to know
3. **Verify all answers** - Use official government sources
4. **Update annually** - Names and positions change

### Quality Checklist

- [ ] All legislator names spelled correctly
- [ ] All email addresses verified
- [ ] All district numbers accurate
- [ ] Party affiliations current
- [ ] Question answers verified with official sources
- [ ] URLs tested and working

---

*Use these templates to create accurate, comprehensive data for your state's civic engagement app.*
