//
//  RecommendedReading.swift
//  PoP
//
//  Curated civic reading list - nonpartisan books and resources
//  for understanding democracy, bridging divides, and civic engagement.
//
//  Organized by topic with diverse perspectives.
//

import Foundation

// MARK: - Reading Models

struct ReadingCategory: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let description: String
    let books: [Book]
}

struct Book: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let year: Int
    let description: String
    let whyIncluded: String
    let purchaseURL: String?
    let librarySearchTerm: String

    var libraryURL: String {
        let encoded = librarySearchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return "https://www.worldcat.org/search?q=\(encoded)"
    }
}

// MARK: - Recommended Reading Data

struct RecommendedReadingData {

    // ═══════════════════════════════════════════════════════════════════════════
    // CATEGORY 1: Understanding Polarization
    // ═══════════════════════════════════════════════════════════════════════════

    static let understandingPolarization = ReadingCategory(
        name: "Understanding Polarization",
        icon: "arrow.left.arrow.right",
        description: "Why we're so divided and how we got here",
        books: [
            Book(
                title: "Why We're Polarized",
                author: "Ezra Klein",
                year: 2020,
                description: "Explores how media, identity, and political parties have created a self-reinforcing cycle of division.",
                whyIncluded: "Clear, accessible explanation of polarization dynamics from across the political spectrum.",
                purchaseURL: "https://www.simonandschuster.com/books/Why-Were-Polarized/Ezra-Klein/9781476700366",
                librarySearchTerm: "Why We're Polarized Ezra Klein"
            ),
            Book(
                title: "The Righteous Mind",
                author: "Jonathan Haidt",
                year: 2012,
                description: "Why good people are divided by politics and religion. Explores moral foundations theory.",
                whyIncluded: "Helps you understand why people hold different values—and why they're not crazy.",
                purchaseURL: nil,
                librarySearchTerm: "The Righteous Mind Jonathan Haidt"
            ),
            Book(
                title: "Uncivil Agreement",
                author: "Lilliana Mason",
                year: 2018,
                description: "How politics became our identity and why that makes compromise so hard.",
                whyIncluded: "Academic but accessible look at how partisan identity shapes everything.",
                purchaseURL: nil,
                librarySearchTerm: "Uncivil Agreement Lilliana Mason"
            ),
            Book(
                title: "The Big Sort",
                author: "Bill Bishop",
                year: 2008,
                description: "How Americans have sorted themselves into like-minded communities.",
                whyIncluded: "Explains geographic polarization and why we rarely encounter different views.",
                purchaseURL: nil,
                librarySearchTerm: "The Big Sort Bill Bishop"
            ),
            Book(
                title: "Strangers in Their Own Land",
                author: "Arlie Russell Hochschild",
                year: 2016,
                description: "A sociologist's journey into the heart of the American right.",
                whyIncluded: "Empathetic, nuanced portrait of conservative Americans without condescension.",
                purchaseURL: nil,
                librarySearchTerm: "Strangers in Their Own Land Hochschild"
            )
        ]
    )

    // ═══════════════════════════════════════════════════════════════════════════
    // CATEGORY 2: Bridging Divides
    // ═══════════════════════════════════════════════════════════════════════════

    static let bridgingDivides = ReadingCategory(
        name: "Bridging Divides",
        icon: "person.2.fill",
        description: "Practical approaches to talking across differences",
        books: [
            Book(
                title: "Beyond Your Bubble",
                author: "Tania Israel",
                year: 2020,
                description: "How to connect across the political divide, skills and strategies.",
                whyIncluded: "Practical, evidence-based guide to having productive political conversations.",
                purchaseURL: nil,
                librarySearchTerm: "Beyond Your Bubble Tania Israel"
            ),
            Book(
                title: "I Think You're Wrong (But I'm Listening)",
                author: "Sarah Stewart Holland & Beth Silvers",
                year: 2019,
                description: "A guide to grace-filled political conversations from two friends on opposite sides.",
                whyIncluded: "Written by the hosts of Pantsuit Politics podcast—one progressive, one conservative.",
                purchaseURL: nil,
                librarySearchTerm: "I Think You're Wrong But I'm Listening"
            ),
            Book(
                title: "High Conflict",
                author: "Amanda Ripley",
                year: 2021,
                description: "Why we get trapped in conflict and how to get out.",
                whyIncluded: "Explores how conflict escalates and what helps de-escalate it.",
                purchaseURL: nil,
                librarySearchTerm: "High Conflict Amanda Ripley"
            ),
            Book(
                title: "Braving the Wilderness",
                author: "Brené Brown",
                year: 2017,
                description: "The quest for true belonging and the courage to stand alone.",
                whyIncluded: "On finding belonging without abandoning your values or demonizing others.",
                purchaseURL: nil,
                librarySearchTerm: "Braving the Wilderness Brene Brown"
            ),
            Book(
                title: "The Coddling of the American Mind",
                author: "Greg Lukianoff & Jonathan Haidt",
                year: 2018,
                description: "How good intentions and bad ideas are setting up a generation for failure.",
                whyIncluded: "Explores how to engage with challenging ideas while protecting free inquiry.",
                purchaseURL: nil,
                librarySearchTerm: "Coddling American Mind Lukianoff Haidt"
            )
        ]
    )

    // ═══════════════════════════════════════════════════════════════════════════
    // CATEGORY 3: Civic Engagement & Participation
    // ═══════════════════════════════════════════════════════════════════════════

    static let civicEngagement = ReadingCategory(
        name: "Civic Engagement",
        icon: "checkmark.square.fill",
        description: "How to participate effectively in democracy",
        books: [
            Book(
                title: "On Tyranny: Twenty Lessons from the Twentieth Century",
                author: "Timothy Snyder",
                year: 2017,
                description: "Short, powerful lessons on defending democracy from a historian.",
                whyIncluded: "Quick read with actionable steps for protecting democratic institutions.",
                purchaseURL: nil,
                librarySearchTerm: "On Tyranny Timothy Snyder"
            ),
            Book(
                title: "Politics Is for Power",
                author: "Eitan Hersh",
                year: 2020,
                description: "How to move beyond political hobbyism to civic action that makes a difference.",
                whyIncluded: "Challenges readers to move from consuming politics to participating in it.",
                purchaseURL: nil,
                librarySearchTerm: "Politics Is for Power Eitan Hersh"
            ),
            Book(
                title: "How Democracies Die",
                author: "Steven Levitsky & Daniel Ziblatt",
                year: 2018,
                description: "What history tells us about the threats democracies face.",
                whyIncluded: "Scholarly but accessible analysis of democratic backsliding around the world.",
                purchaseURL: nil,
                librarySearchTerm: "How Democracies Die Levitsky Ziblatt"
            ),
            Book(
                title: "Democracy in One Book or Less",
                author: "David Litt",
                year: 2020,
                description: "How it works, why it doesn't, and why fixing it is easier than you think.",
                whyIncluded: "Funny, approachable guide to understanding (and improving) American democracy.",
                purchaseURL: nil,
                librarySearchTerm: "Democracy in One Book or Less David Litt"
            ),
            Book(
                title: "Bowling Alone",
                author: "Robert Putnam",
                year: 2000,
                description: "The collapse and revival of American community.",
                whyIncluded: "Classic analysis of declining civic participation—and why it matters.",
                purchaseURL: nil,
                librarySearchTerm: "Bowling Alone Robert Putnam"
            )
        ]
    )

    // ═══════════════════════════════════════════════════════════════════════════
    // CATEGORY 4: American History & Founding
    // ═══════════════════════════════════════════════════════════════════════════

    static let americanHistory = ReadingCategory(
        name: "American History & Founding",
        icon: "scroll.fill",
        description: "Understanding where we came from",
        books: [
            Book(
                title: "The Federalist Papers",
                author: "Hamilton, Madison, Jay",
                year: 1788,
                description: "The original arguments for the Constitution.",
                whyIncluded: "Primary source for understanding the founders' intent and reasoning.",
                purchaseURL: nil,
                librarySearchTerm: "Federalist Papers Hamilton Madison Jay"
            ),
            Book(
                title: "1776",
                author: "David McCullough",
                year: 2005,
                description: "The year that shaped the nation and tested its founders.",
                whyIncluded: "Accessible, narrative history of the Revolutionary War's pivotal year.",
                purchaseURL: nil,
                librarySearchTerm: "1776 David McCullough"
            ),
            Book(
                title: "These Truths: A History of the United States",
                author: "Jill Lepore",
                year: 2018,
                description: "Comprehensive one-volume history of America.",
                whyIncluded: "Modern, inclusive history that grapples with America's contradictions.",
                purchaseURL: nil,
                librarySearchTerm: "These Truths Jill Lepore"
            ),
            Book(
                title: "The Quartet",
                author: "Joseph Ellis",
                year: 2015,
                description: "How four founders—Washington, Hamilton, Madison, Jay—created the nation.",
                whyIncluded: "Shows how the Constitution was a political achievement, not inevitable.",
                purchaseURL: nil,
                librarySearchTerm: "The Quartet Joseph Ellis"
            ),
            Book(
                title: "What You Should Know About Politics... But Don't",
                author: "Jessamyn Conrad",
                year: 2020,
                description: "A nonpartisan guide to the issues that matter.",
                whyIncluded: "Clear explainers on major policy areas without political spin.",
                purchaseURL: nil,
                librarySearchTerm: "What You Should Know About Politics Conrad"
            )
        ]
    )

    // ═══════════════════════════════════════════════════════════════════════════
    // CATEGORY 5: Media Literacy & Truth-Seeking
    // ═══════════════════════════════════════════════════════════════════════════

    static let mediaLiteracy = ReadingCategory(
        name: "Media Literacy",
        icon: "newspaper.fill",
        description: "Navigating information in the digital age",
        books: [
            Book(
                title: "Verified",
                author: "Mike Caulfield & Sam Wineburg",
                year: 2023,
                description: "How to think straight, get duped less, and make better decisions about what to believe online.",
                whyIncluded: "Practical guide to evaluating sources and avoiding misinformation.",
                purchaseURL: nil,
                librarySearchTerm: "Verified Caulfield Wineburg"
            ),
            Book(
                title: "Hate Inc.",
                author: "Matt Taibbi",
                year: 2019,
                description: "Why today's media makes us despise one another.",
                whyIncluded: "Critical look at media incentives from a journalist who's seen it from inside.",
                purchaseURL: nil,
                librarySearchTerm: "Hate Inc Matt Taibbi"
            ),
            Book(
                title: "Breaking the News",
                author: "Alan Rusbridger",
                year: 2022,
                description: "Remaking journalism and why it matters now.",
                whyIncluded: "By the former editor of The Guardian—thoughtful on media's challenges.",
                purchaseURL: nil,
                librarySearchTerm: "Breaking the News Alan Rusbridger"
            ),
            Book(
                title: "Network Propaganda",
                author: "Yochai Benkler et al.",
                year: 2018,
                description: "Manipulation, disinformation, and radicalization in American politics.",
                whyIncluded: "Data-driven analysis of how misinformation spreads.",
                purchaseURL: nil,
                librarySearchTerm: "Network Propaganda Benkler"
            ),
            Book(
                title: "Calling Bullshit",
                author: "Carl Bergstrom & Jevin West",
                year: 2020,
                description: "The art of skepticism in a data-driven world.",
                whyIncluded: "How to spot misleading statistics and bad arguments.",
                purchaseURL: nil,
                librarySearchTerm: "Calling Bullshit Bergstrom West"
            )
        ]
    )

    // ═══════════════════════════════════════════════════════════════════════════
    // CATEGORY 6: Local Democracy & Community
    // ═══════════════════════════════════════════════════════════════════════════

    static let localDemocracy = ReadingCategory(
        name: "Local Democracy",
        icon: "building.columns.fill",
        description: "Where democracy actually happens",
        books: [
            Book(
                title: "City of Quartz",
                author: "Mike Davis",
                year: 1990,
                description: "Classic examination of Los Angeles and urban America.",
                whyIncluded: "Shows how local politics shapes communities for generations.",
                purchaseURL: nil,
                librarySearchTerm: "City of Quartz Mike Davis"
            ),
            Book(
                title: "Strong Towns",
                author: "Charles Marohn",
                year: 2019,
                description: "A bottom-up revolution to rebuild American prosperity.",
                whyIncluded: "Practical ideas for making local communities financially and socially stronger.",
                purchaseURL: nil,
                librarySearchTerm: "Strong Towns Charles Marohn"
            ),
            Book(
                title: "Palaces for the People",
                author: "Eric Klinenberg",
                year: 2018,
                description: "How social infrastructure can help fight inequality and polarization.",
                whyIncluded: "Makes the case for libraries, parks, and shared spaces as democracy builders.",
                purchaseURL: nil,
                librarySearchTerm: "Palaces for the People Klinenberg"
            ),
            Book(
                title: "The Death and Life of Great American Cities",
                author: "Jane Jacobs",
                year: 1961,
                description: "The classic critique of urban planning and defense of vibrant neighborhoods.",
                whyIncluded: "Timeless wisdom on how communities thrive.",
                purchaseURL: nil,
                librarySearchTerm: "Death and Life Great American Cities Jacobs"
            )
        ]
    )

    // ═══════════════════════════════════════════════════════════════════════════
    // CATEGORY 7: Nonviolent Social Change
    // ═══════════════════════════════════════════════════════════════════════════

    static let nonviolentChange = ReadingCategory(
        name: "Nonviolent Social Change",
        icon: "heart.fill",
        description: "The tradition that inspires People Over Party",
        books: [
            Book(
                title: "Letter from Birmingham Jail",
                author: "Martin Luther King Jr.",
                year: 1963,
                description: "The classic defense of nonviolent resistance and civil disobedience.",
                whyIncluded: "Essential reading on moral courage and principled engagement.",
                purchaseURL: nil,
                librarySearchTerm: "Letter from Birmingham Jail King"
            ),
            Book(
                title: "The Autobiography of Martin Luther King Jr.",
                author: "Martin Luther King Jr. (ed. Clayborne Carson)",
                year: 1998,
                description: "King's story in his own words, compiled from his writings and speeches.",
                whyIncluded: "Primary source on the philosophy behind the civil rights movement.",
                purchaseURL: nil,
                librarySearchTerm: "Autobiography Martin Luther King"
            ),
            Book(
                title: "This Is an Uprising",
                author: "Mark Engler & Paul Engler",
                year: 2016,
                description: "How nonviolent revolt is shaping the 21st century.",
                whyIncluded: "Modern analysis of how nonviolent movements succeed.",
                purchaseURL: nil,
                librarySearchTerm: "This Is an Uprising Engler"
            ),
            Book(
                title: "Why Civil Resistance Works",
                author: "Erica Chenoweth & Maria Stephan",
                year: 2011,
                description: "Data-driven analysis proving nonviolent campaigns succeed more often.",
                whyIncluded: "Academic proof that nonviolence is not just moral, but effective.",
                purchaseURL: nil,
                librarySearchTerm: "Why Civil Resistance Works Chenoweth"
            ),
            Book(
                title: "The Power of Nonviolence",
                author: "Richard Gregg",
                year: 1934,
                description: "Early and influential work on the theory of nonviolent action.",
                whyIncluded: "Historical context for the nonviolent tradition in America.",
                purchaseURL: nil,
                librarySearchTerm: "Power of Nonviolence Richard Gregg"
            )
        ]
    )

    // ═══════════════════════════════════════════════════════════════════════════
    // ALL CATEGORIES
    // ═══════════════════════════════════════════════════════════════════════════

    static let allCategories: [ReadingCategory] = [
        understandingPolarization,
        bridgingDivides,
        civicEngagement,
        americanHistory,
        mediaLiteracy,
        localDemocracy,
        nonviolentChange
    ]

    // ═══════════════════════════════════════════════════════════════════════════
    // QUICK READS (under 200 pages)
    // ═══════════════════════════════════════════════════════════════════════════

    static let quickReads: [Book] = [
        allCategories.flatMap { $0.books }.first { $0.title == "On Tyranny: Twenty Lessons from the Twentieth Century" }!,
        allCategories.flatMap { $0.books }.first { $0.title == "Letter from Birmingham Jail" }!,
        Book(
            title: "How to Be an Antiracist",
            author: "Ibram X. Kendi",
            year: 2019,
            description: "Challenging book on race in America.",
            whyIncluded: "Important perspective in the national conversation, whether you agree or not.",
            purchaseURL: nil,
            librarySearchTerm: "How to Be an Antiracist Kendi"
        ),
        Book(
            title: "Hillbilly Elegy",
            author: "J.D. Vance",
            year: 2016,
            description: "A memoir of a family and culture in crisis.",
            whyIncluded: "Influential account of working-class white America, whatever your politics.",
            purchaseURL: nil,
            librarySearchTerm: "Hillbilly Elegy J.D. Vance"
        )
    ]

    // ═══════════════════════════════════════════════════════════════════════════
    // PODCASTS & OTHER MEDIA
    // ═══════════════════════════════════════════════════════════════════════════

    static let podcasts: [PodcastResource] = [
        PodcastResource(
            name: "Pantsuit Politics",
            hosts: "Sarah Stewart Holland & Beth Silvers",
            description: "A progressive and a conservative discuss politics with grace.",
            url: "https://www.pantsuitpoliticsshow.com/",
            whyIncluded: "Models the kind of cross-partisan conversation we need more of."
        ),
        PodcastResource(
            name: "The Argument",
            hosts: "New York Times Opinion",
            description: "Debates between people who disagree but engage respectfully.",
            url: "https://www.nytimes.com/column/the-argument",
            whyIncluded: "Shows how to argue productively about real issues."
        ),
        PodcastResource(
            name: "Left, Right & Center",
            hosts: "KCRW",
            description: "Weekly political roundtable with voices from across the spectrum.",
            url: "https://www.kcrw.com/news/shows/left-right-center",
            whyIncluded: "Long-running show modeling civil multi-perspective debate."
        ),
        PodcastResource(
            name: "The Ezra Klein Show",
            hosts: "Ezra Klein",
            description: "Deep conversations on ideas, politics, and culture.",
            url: "https://www.nytimes.com/column/ezra-klein-podcast",
            whyIncluded: "Thoughtful, in-depth interviews with thinkers across the spectrum."
        ),
        PodcastResource(
            name: "Civics 101",
            hosts: "New Hampshire Public Radio",
            description: "Quick, accessible explainers on how American democracy works.",
            url: "https://www.civics101podcast.org/",
            whyIncluded: "Perfect for brushing up on the basics—no spin."
        )
    ]

    // ═══════════════════════════════════════════════════════════════════════════
    // WEBSITES & ORGANIZATIONS
    // ═══════════════════════════════════════════════════════════════════════════

    static let organizations: [OrganizationResource] = [
        OrganizationResource(
            name: "AllSides",
            description: "News and issues from left, center, and right perspectives side by side.",
            url: "https://www.allsides.com/",
            category: "Media Literacy"
        ),
        OrganizationResource(
            name: "Braver Angels",
            description: "Bringing together red and blue Americans for workshops and debates.",
            url: "https://braverangels.org/",
            category: "Bridge Building"
        ),
        OrganizationResource(
            name: "Bridge Alliance",
            description: "Coalition of organizations working to heal American democracy.",
            url: "https://www.bridgealliance.us/",
            category: "Bridge Building"
        ),
        OrganizationResource(
            name: "National Institute for Civil Discourse",
            description: "Research and programs promoting respectful political engagement.",
            url: "https://nicd.arizona.edu/",
            category: "Research"
        ),
        OrganizationResource(
            name: "Ballotpedia",
            description: "Nonpartisan encyclopedia of American politics and elections.",
            url: "https://ballotpedia.org/",
            category: "Voter Information"
        ),
        OrganizationResource(
            name: "Vote Smart",
            description: "Nonpartisan information on candidates and elected officials.",
            url: "https://justfacts.votesmart.org/",
            category: "Voter Information"
        ),
        OrganizationResource(
            name: "FactCheck.org",
            description: "Nonpartisan fact-checking from the Annenberg Public Policy Center.",
            url: "https://www.factcheck.org/",
            category: "Media Literacy"
        ),
        OrganizationResource(
            name: "The King Center",
            description: "Continuing the legacy of Martin Luther King Jr.'s philosophy.",
            url: "https://thekingcenter.org/",
            category: "Nonviolent Change"
        )
    ]
}

// MARK: - Supporting Models

struct PodcastResource: Identifiable {
    let id = UUID()
    let name: String
    let hosts: String
    let description: String
    let url: String
    let whyIncluded: String
}

struct OrganizationResource: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let url: String
    let category: String
}

// MARK: - Reading List Selection Note

/*
 SELECTION PHILOSOPHY:

 This reading list was curated with these principles:

 1. IDEOLOGICAL DIVERSITY: We include authors from across the political spectrum.
    The goal is understanding, not agreement.

 2. INTELLECTUAL HONESTY: These books engage seriously with hard questions.
    We avoid propaganda disguised as scholarship.

 3. ACCESSIBILITY: Most of these books are readable by non-academics.
    Democracy requires informed citizens, not just experts.

 4. RELEVANCE: These books address the challenges Americans face today—
    polarization, media confusion, civic disengagement.

 5. ACTIONABLE: Where possible, we chose books that don't just diagnose
    problems but offer practical ways forward.

 WHAT WE AVOIDED:
 - Pure partisan polemics (books designed to make you hate "the other side")
 - Academic jargon without accessibility
 - Books that preach only to their choir
 - Conspiracy theories and misinformation

 YOUR LOCAL LIBRARY:
 All of these books should be available through your local library or
 interlibrary loan. We've included WorldCat links to help you find them.
 If your library doesn't have a book you want, request it!

 Libraries are democracy in action.
 */
