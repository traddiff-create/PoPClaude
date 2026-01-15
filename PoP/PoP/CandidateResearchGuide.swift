//
//  CandidateResearchGuide.swift
//  PoP
//
//  Guide for researching candidates yourself - nonpartisan approach
//  that teaches HOW to evaluate candidates, not WHO to vote for.
//
//  Inspired by VoteSmart's "Voter's Self-Defense System"
//

import Foundation

// MARK: - Research Guide Models

struct ResearchCategory: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let description: String
    let questions: [ResearchQuestion]
    let resources: [ResearchResource]
}

struct ResearchQuestion: Identifiable {
    let id = UUID()
    let question: String
    let whyItMatters: String
    let howToFind: String
    let redFlags: [String]?
}

struct ResearchResource: Identifiable {
    let id = UUID()
    let name: String
    let url: String
    let description: String
    let isNonpartisan: Bool
    let dataType: String  // "Voting Records", "Finances", "Positions", etc.
}

// MARK: - Candidate Research Data

struct CandidateResearchData {

    // ═══════════════════════════════════════════════════════════════════════════
    // INTRODUCTION
    // ═══════════════════════════════════════════════════════════════════════════

    static let introduction = """
    In a healthy democracy, voters research candidates themselves rather than relying on ads, social media, or party labels alone.

    This guide teaches you HOW to evaluate candidates—not WHO to vote for. The questions work for any candidate, any party, any office.

    Good research takes time, but an informed vote is worth it.
    """

    // ═══════════════════════════════════════════════════════════════════════════
    // RESEARCH CATEGORIES
    // ═══════════════════════════════════════════════════════════════════════════

    static let categories: [ResearchCategory] = [

        // CATEGORY 1: Background & Experience
        ResearchCategory(
            name: "Background & Experience",
            icon: "person.text.rectangle.fill",
            description: "Who is this person, and what qualifies them for office?",
            questions: [
                ResearchQuestion(
                    question: "What's their professional background?",
                    whyItMatters: "Experience in relevant fields (law, business, public service, military) can indicate preparedness for the role.",
                    howToFind: "Official campaign website 'About' page, LinkedIn, local news profiles, Ballotpedia",
                    redFlags: ["Vague or missing employment history", "Claims that can't be verified", "Significant gaps without explanation"]
                ),
                ResearchQuestion(
                    question: "Have they held public office before?",
                    whyItMatters: "Prior service shows how they actually govern, not just how they campaign.",
                    howToFind: "Vote Smart, Ballotpedia, state legislature websites, city/county records",
                    redFlags: ["Claiming accomplishments they can't document", "Hiding previous terms that went poorly"]
                ),
                ResearchQuestion(
                    question: "What's their education?",
                    whyItMatters: "While not everything, education can indicate expertise in policy areas.",
                    howToFind: "Campaign website, LinkedIn, news interviews",
                    redFlags: ["Claiming degrees they don't have", "Misrepresenting institutions"]
                ),
                ResearchQuestion(
                    question: "Do they live in the community they'd represent?",
                    whyItMatters: "Local candidates should understand local issues firsthand.",
                    howToFind: "Voter registration records (public), campaign filings, local news",
                    redFlags: ["Recently moved to the district just to run", "Primary residence elsewhere"]
                )
            ],
            resources: [
                ResearchResource(
                    name: "Ballotpedia",
                    url: "https://ballotpedia.org/",
                    description: "Comprehensive candidate profiles including background and positions",
                    isNonpartisan: true,
                    dataType: "Profiles"
                ),
                ResearchResource(
                    name: "Vote Smart",
                    url: "https://votesmart.org/",
                    description: "Candidate backgrounds, positions, and voting records",
                    isNonpartisan: true,
                    dataType: "Profiles"
                )
            ]
        ),

        // CATEGORY 2: Positions on Issues
        ResearchCategory(
            name: "Issue Positions",
            icon: "list.bullet.clipboard.fill",
            description: "Where do they stand on issues that matter to you?",
            questions: [
                ResearchQuestion(
                    question: "What do they say about issues you care about?",
                    whyItMatters: "Campaign promises are the baseline of accountability.",
                    howToFind: "Campaign website 'Issues' page, Vote Smart Political Courage Test, debate transcripts",
                    redFlags: ["Vague platitudes without specifics", "Different positions for different audiences", "No issues page at all"]
                ),
                ResearchQuestion(
                    question: "Have their positions changed over time?",
                    whyItMatters: "Changing your mind is fine—but the reasons matter.",
                    howToFind: "News archives, old campaign materials, voting records vs. current statements",
                    redFlags: ["Sudden changes right before elections", "Denying documented past positions"]
                ),
                ResearchQuestion(
                    question: "Do they give specific policy proposals or just slogans?",
                    whyItMatters: "Specific plans can be evaluated; slogans cannot.",
                    howToFind: "Campaign website, interviews, debate responses, policy papers",
                    redFlags: ["Only attacks opponents without own solutions", "Promises that sound too good to be true"]
                ),
                ResearchQuestion(
                    question: "How do they talk about people who disagree?",
                    whyItMatters: "Governance requires working with people you disagree with.",
                    howToFind: "Debates, social media, interviews, town halls",
                    redFlags: ["Dehumanizing language about opponents", "Refusing to acknowledge any valid concerns on the other side"]
                )
            ],
            resources: [
                ResearchResource(
                    name: "Vote Smart Political Courage Test",
                    url: "https://votesmart.org/",
                    description: "Candidate responses to standardized questions on key issues",
                    isNonpartisan: true,
                    dataType: "Positions"
                ),
                ResearchResource(
                    name: "On The Issues",
                    url: "https://www.ontheissues.org/",
                    description: "Tracks candidate positions from public statements over time",
                    isNonpartisan: true,
                    dataType: "Positions"
                ),
                ResearchResource(
                    name: "iSideWith",
                    url: "https://www.isidewith.com/",
                    description: "Quiz comparing your positions to candidates",
                    isNonpartisan: true,
                    dataType: "Positions"
                )
            ]
        ),

        // CATEGORY 3: Voting Record (Incumbents)
        ResearchCategory(
            name: "Voting Record",
            icon: "checkmark.square.fill",
            description: "For incumbents: How have they actually voted?",
            questions: [
                ResearchQuestion(
                    question: "Do their votes match their stated positions?",
                    whyItMatters: "Actions speak louder than campaign promises.",
                    howToFind: "Vote Smart key votes, GovTrack, state legislature websites",
                    redFlags: ["Voting opposite of campaign promises", "Frequent absences on important votes"]
                ),
                ResearchQuestion(
                    question: "How often do they vote with their party?",
                    whyItMatters: "Shows whether they think independently or follow party line.",
                    howToFind: "GovTrack party loyalty scores, ProPublica Congress API",
                    redFlags: nil // This is informational, not necessarily a red flag
                ),
                ResearchQuestion(
                    question: "What bills have they sponsored or co-sponsored?",
                    whyItMatters: "Shows what they prioritize enough to take action on.",
                    howToFind: "Congress.gov, state legislature bill search, Vote Smart",
                    redFlags: ["No significant legislation despite years in office", "Only symbolic/messaging bills"]
                ),
                ResearchQuestion(
                    question: "How do they vote on procedural matters?",
                    whyItMatters: "Procedural votes (filibusters, committee assignments) often matter more than final votes.",
                    howToFind: "GovTrack, congressional records, political news analysis",
                    redFlags: ["Voting against something in final vote but enabling it procedurally"]
                )
            ],
            resources: [
                ResearchResource(
                    name: "GovTrack",
                    url: "https://www.govtrack.us/",
                    description: "Detailed voting records, bill tracking, legislator stats",
                    isNonpartisan: true,
                    dataType: "Voting Records"
                ),
                ResearchResource(
                    name: "Vote Smart Key Votes",
                    url: "https://votesmart.org/bills",
                    description: "Important votes organized by issue area",
                    isNonpartisan: true,
                    dataType: "Voting Records"
                ),
                ResearchResource(
                    name: "SD Legislature",
                    url: "https://sdlegislature.gov/",
                    description: "Official South Dakota legislative records and votes",
                    isNonpartisan: true,
                    dataType: "Voting Records"
                ),
                ResearchResource(
                    name: "ProPublica Congress API",
                    url: "https://projects.propublica.org/represent/",
                    description: "Congressional voting data and analysis",
                    isNonpartisan: true,
                    dataType: "Voting Records"
                )
            ]
        ),

        // CATEGORY 4: Campaign Finances
        ResearchCategory(
            name: "Follow the Money",
            icon: "dollarsign.circle.fill",
            description: "Who's funding their campaign, and what might they expect in return?",
            questions: [
                ResearchQuestion(
                    question: "Where does their money come from?",
                    whyItMatters: "Large donors often expect access or favorable policy.",
                    howToFind: "OpenSecrets, FollowTheMoney.org, FEC filings",
                    redFlags: ["Most funding from out-of-state or out-of-district", "Heavy PAC/dark money funding", "Single donor providing majority of funds"]
                ),
                ResearchQuestion(
                    question: "Do their donors have business before the office they're seeking?",
                    whyItMatters: "Potential conflicts of interest.",
                    howToFind: "Cross-reference donor lists with lobbying records, government contracts",
                    redFlags: ["Donors with pending legislation or contracts", "Industries they'd regulate giving heavily"]
                ),
                ResearchQuestion(
                    question: "How do they spend campaign money?",
                    whyItMatters: "Shows priorities and potentially problematic self-dealing.",
                    howToFind: "FEC expenditure reports, state campaign finance databases",
                    redFlags: ["Paying family members large salaries", "Luxury expenses", "Payments to own businesses"]
                ),
                ResearchQuestion(
                    question: "Do they have a personal financial interest in issues they'd vote on?",
                    whyItMatters: "Stock holdings, business interests can create conflicts.",
                    howToFind: "Financial disclosure forms (required for federal officials)",
                    redFlags: ["Refusing to disclose", "Trading stocks in industries they regulate"]
                )
            ],
            resources: [
                ResearchResource(
                    name: "OpenSecrets",
                    url: "https://www.opensecrets.org/",
                    description: "Campaign finance data for federal candidates",
                    isNonpartisan: true,
                    dataType: "Finances"
                ),
                ResearchResource(
                    name: "FollowTheMoney.org",
                    url: "https://www.followthemoney.org/",
                    description: "State-level campaign finance tracking",
                    isNonpartisan: true,
                    dataType: "Finances"
                ),
                ResearchResource(
                    name: "FEC.gov",
                    url: "https://www.fec.gov/",
                    description: "Official federal campaign finance records",
                    isNonpartisan: true,
                    dataType: "Finances"
                ),
                ResearchResource(
                    name: "SD Secretary of State",
                    url: "https://sdsos.gov/elections-voting/campaign-finance/",
                    description: "South Dakota campaign finance filings",
                    isNonpartisan: true,
                    dataType: "Finances"
                )
            ]
        ),

        // CATEGORY 5: Endorsements & Ratings
        ResearchCategory(
            name: "Endorsements & Ratings",
            icon: "star.fill",
            description: "Who supports them, and what do interest groups say?",
            questions: [
                ResearchQuestion(
                    question: "Which organizations have endorsed them?",
                    whyItMatters: "Endorsements signal alignment with those groups' priorities.",
                    howToFind: "Campaign website, Vote Smart endorsements database, organization websites",
                    redFlags: nil // Endorsements are informational
                ),
                ResearchQuestion(
                    question: "How do interest groups rate them?",
                    whyItMatters: "Ratings from groups across the spectrum show where they land.",
                    howToFind: "Vote Smart ratings, individual organization scorecards",
                    redFlags: ["Ratings that contradict their stated positions"]
                ),
                ResearchQuestion(
                    question: "Have newspapers or civic groups endorsed them?",
                    whyItMatters: "Editorial boards often do detailed candidate research.",
                    howToFind: "Local newspaper websites, League of Women Voters guides",
                    redFlags: nil
                ),
                ResearchQuestion(
                    question: "Who's endorsing their opponent?",
                    whyItMatters: "Comparing endorsements shows the coalition behind each candidate.",
                    howToFind: "Opponent's campaign website, news coverage",
                    redFlags: nil
                )
            ],
            resources: [
                ResearchResource(
                    name: "Vote Smart Interest Group Ratings",
                    url: "https://votesmart.org/",
                    description: "Ratings from 1,500+ organizations across the political spectrum",
                    isNonpartisan: true,
                    dataType: "Ratings"
                ),
                ResearchResource(
                    name: "League of Women Voters",
                    url: "https://www.lwv.org/",
                    description: "Nonpartisan voter guides and candidate forums",
                    isNonpartisan: true,
                    dataType: "Guides"
                )
            ]
        ),

        // CATEGORY 6: Character & Conduct
        ResearchCategory(
            name: "Character & Conduct",
            icon: "person.fill.checkmark",
            description: "What does their behavior tell you about how they'd govern?",
            questions: [
                ResearchQuestion(
                    question: "How do they treat people who work for them?",
                    whyItMatters: "Staff turnover and workplace culture signal leadership style.",
                    howToFind: "News reports, Glassdoor (for businesses), staff turnover records",
                    redFlags: ["High staff turnover", "Workplace complaints or lawsuits", "Former staff speaking out"]
                ),
                ResearchQuestion(
                    question: "Have they faced legal or ethical issues?",
                    whyItMatters: "Past behavior predicts future behavior.",
                    howToFind: "Court records, news archives, ethics commission rulings",
                    redFlags: ["Criminal convictions", "Ethics violations", "Pattern of lawsuits"]
                ),
                ResearchQuestion(
                    question: "Do they admit mistakes?",
                    whyItMatters: "Leaders who can't acknowledge error don't learn from it.",
                    howToFind: "Interviews, press conferences, debate responses when challenged",
                    redFlags: ["Never wrong about anything", "Blaming others for their mistakes"]
                ),
                ResearchQuestion(
                    question: "How do they engage with constituents?",
                    whyItMatters: "Accessibility signals whether they'll listen once elected.",
                    howToFind: "Town hall schedules, response to constituent mail, social media engagement",
                    redFlags: ["Refusing debates", "No town halls", "Only friendly audiences"]
                )
            ],
            resources: [
                ResearchResource(
                    name: "Local News Archives",
                    url: "https://news.google.com/",
                    description: "Search for candidate coverage over time",
                    isNonpartisan: false,
                    dataType: "News"
                ),
                ResearchResource(
                    name: "PACER",
                    url: "https://pacer.uscourts.gov/",
                    description: "Federal court records (some fees apply)",
                    isNonpartisan: true,
                    dataType: "Legal"
                )
            ]
        )
    ]

    // ═══════════════════════════════════════════════════════════════════════════
    // RESEARCH CHECKLIST
    // ═══════════════════════════════════════════════════════════════════════════

    static let researchChecklist: [ResearchChecklistSection] = [
        ResearchChecklistSection(
            title: "Before You Start",
            items: [
                "Identify what issues matter most to you",
                "List the offices on your ballot",
                "Set aside dedicated research time (not the night before!)",
                "Bookmark nonpartisan resources"
            ]
        ),
        ResearchChecklistSection(
            title: "For Each Candidate",
            items: [
                "Read their official campaign website",
                "Look up their background on Ballotpedia",
                "Check their voting record (if incumbent)",
                "Review campaign finance reports",
                "See what interest groups say about them",
                "Watch at least one debate or interview",
                "Search for recent news coverage"
            ]
        ),
        ResearchChecklistSection(
            title: "Critical Thinking",
            items: [
                "Compare what they say vs. what they've done",
                "Consider who benefits from their policies",
                "Look for specifics, not just slogans",
                "Check claims that seem too good (or bad) to be true",
                "Read sources from different perspectives"
            ]
        ),
        ResearchChecklistSection(
            title: "Making Your Decision",
            items: [
                "Weigh issues by importance to you",
                "Consider both policy AND character",
                "Remember: no candidate is perfect",
                "Trust your research over ads",
                "It's okay to leave races blank if truly undecided"
            ]
        )
    ]

    // ═══════════════════════════════════════════════════════════════════════════
    // TIPS FOR EVALUATING INFORMATION
    // ═══════════════════════════════════════════════════════════════════════════

    static let evaluationTips: [EvaluationTip] = [
        EvaluationTip(
            title: "Consider the Source",
            icon: "magnifyingglass",
            tips: [
                "Who created this information? What's their agenda?",
                "Is this a news report, opinion piece, or ad?",
                "Is the source nonpartisan, or openly partisan?",
                "Does the source cite evidence you can verify?"
            ]
        ),
        EvaluationTip(
            title: "Check for Bias",
            icon: "scale.3d",
            tips: [
                "Does it only present one side?",
                "Does it use emotionally charged language?",
                "Are claims sourced, or just asserted?",
                "Would the other side describe it the same way?"
            ]
        ),
        EvaluationTip(
            title: "Verify Claims",
            icon: "checkmark.seal.fill",
            tips: [
                "Can you find the same info from multiple sources?",
                "Is there primary evidence (documents, video)?",
                "What do fact-checkers say?",
                "Is this taken out of context?"
            ]
        ),
        EvaluationTip(
            title: "Beware of Manipulation",
            icon: "exclamationmark.triangle.fill",
            tips: [
                "Last-minute \"bombshells\" deserve extra scrutiny",
                "Screenshots can be faked—find the original",
                "Emotional appeals may distract from facts",
                "If it confirms everything you believe, double-check it"
            ]
        )
    ]

    // ═══════════════════════════════════════════════════════════════════════════
    // NONPARTISAN RESOURCES DIRECTORY
    // ═══════════════════════════════════════════════════════════════════════════

    static let allResources: [ResearchResource] = [
        // Voting Information
        ResearchResource(
            name: "Vote Smart",
            url: "https://votesmart.org/",
            description: "Comprehensive candidate info: backgrounds, positions, votes, finances, ratings",
            isNonpartisan: true,
            dataType: "Comprehensive"
        ),
        ResearchResource(
            name: "Ballotpedia",
            url: "https://ballotpedia.org/",
            description: "Encyclopedia of American politics with candidate profiles",
            isNonpartisan: true,
            dataType: "Profiles"
        ),
        ResearchResource(
            name: "GovTrack",
            url: "https://www.govtrack.us/",
            description: "Congressional voting records and bill tracking",
            isNonpartisan: true,
            dataType: "Voting Records"
        ),
        ResearchResource(
            name: "OpenSecrets",
            url: "https://www.opensecrets.org/",
            description: "Money in politics—campaign finance and lobbying data",
            isNonpartisan: true,
            dataType: "Finances"
        ),
        ResearchResource(
            name: "FollowTheMoney.org",
            url: "https://www.followthemoney.org/",
            description: "State-level campaign finance tracking",
            isNonpartisan: true,
            dataType: "Finances"
        ),

        // Fact-Checking
        ResearchResource(
            name: "FactCheck.org",
            url: "https://www.factcheck.org/",
            description: "Annenberg Public Policy Center fact-checking",
            isNonpartisan: true,
            dataType: "Fact-Checking"
        ),
        ResearchResource(
            name: "PolitiFact",
            url: "https://www.politifact.com/",
            description: "Fact-checking political claims with Truth-O-Meter",
            isNonpartisan: true,
            dataType: "Fact-Checking"
        ),
        ResearchResource(
            name: "Snopes",
            url: "https://www.snopes.com/",
            description: "Fact-checking rumors, viral claims, and misinformation",
            isNonpartisan: true,
            dataType: "Fact-Checking"
        ),

        // Official Sources
        ResearchResource(
            name: "Congress.gov",
            url: "https://www.congress.gov/",
            description: "Official federal legislation and congressional records",
            isNonpartisan: true,
            dataType: "Official"
        ),
        ResearchResource(
            name: "FEC.gov",
            url: "https://www.fec.gov/",
            description: "Official federal campaign finance filings",
            isNonpartisan: true,
            dataType: "Official"
        ),
        ResearchResource(
            name: "SD Legislature",
            url: "https://sdlegislature.gov/",
            description: "South Dakota bills, votes, and legislative records",
            isNonpartisan: true,
            dataType: "Official"
        ),
        ResearchResource(
            name: "SD Secretary of State",
            url: "https://sdsos.gov/",
            description: "South Dakota elections, candidates, and voting info",
            isNonpartisan: true,
            dataType: "Official"
        ),

        // Civic Organizations
        ResearchResource(
            name: "League of Women Voters",
            url: "https://www.lwv.org/",
            description: "Nonpartisan voter guides and election information",
            isNonpartisan: true,
            dataType: "Guides"
        ),
        ResearchResource(
            name: "AllSides",
            url: "https://www.allsides.com/",
            description: "News from left, center, and right perspectives",
            isNonpartisan: true,
            dataType: "News"
        )
    ]
}

// MARK: - Supporting Models

struct ResearchChecklistSection: Identifiable {
    let id = UUID()
    let title: String
    let items: [String]
}

struct EvaluationTip: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let tips: [String]
}

// MARK: - Philosophy Note

/*
 WHY THIS GUIDE EXISTS:

 People Over Party believes in educated voters, not directed voters.

 We don't tell you who to vote for. We teach you how to find out for
 yourself. This is harder than just following a party line or believing
 what you see on TV, but it's what democracy requires.

 These questions work regardless of your political views:
 - A conservative can use them to evaluate conservative candidates
 - A progressive can use them to evaluate progressive candidates
 - An independent can use them to evaluate anyone

 The goal isn't to change your mind. It's to help you make up your
 mind based on facts, not just feelings or party loyalty.

 "An educated citizenry is a vital requisite for our survival as a
 free people." — Often attributed to Thomas Jefferson
 */
