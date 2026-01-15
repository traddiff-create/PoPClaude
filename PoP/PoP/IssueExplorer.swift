//
//  IssueExplorer.swift
//  PoP
//
//  Balanced exploration of political issues from multiple perspectives.
//  NOT telling you what to think—helping you understand the debate.
//
//  Inspired by VoteSmart's approach to presenting issues and
//  AllSides' multi-perspective framing.
//

import Foundation

// MARK: - Issue Models

struct PoliticalIssue: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let summary: String
    let keyQuestions: [String]
    let perspectives: [IssuePerspective]
    let commonGround: String?
    let keyTerms: [KeyTerm]
    let furtherReading: [IssueResource]
}

struct IssuePerspective: Identifiable {
    let id = UUID()
    let label: String           // "Progressive View", "Conservative View", "Libertarian View", etc.
    let coreArgument: String
    let supportingPoints: [String]
    let commonCriticism: String
    let examplePolicy: String?
}

struct KeyTerm: Identifiable {
    let id = UUID()
    let term: String
    let definition: String
    let usedBy: String?         // "Often used by progressives", "Often used by conservatives", nil if neutral
}

struct IssueResource: Identifiable {
    let id = UUID()
    let title: String
    let url: String
    let perspective: String?    // "Left-leaning", "Right-leaning", "Nonpartisan"
}

// MARK: - Issue Data

struct IssueExplorerData {

    static let disclaimer = """
    This section presents multiple perspectives on controversial issues. We're not telling you which view is correct—we're helping you understand the debate.

    You'll find thoughtful people on all sides of these issues. Understanding WHY people disagree is the first step to productive conversation.
    """

    // ═══════════════════════════════════════════════════════════════════════════
    // ISSUE 1: Immigration
    // ═══════════════════════════════════════════════════════════════════════════

    static let immigration = PoliticalIssue(
        name: "Immigration",
        icon: "globe.americas.fill",
        summary: "How should America handle people who want to come here, both legally and illegally?",
        keyQuestions: [
            "What should happen to undocumented immigrants already here?",
            "How many legal immigrants should we accept each year?",
            "What criteria should we use for admitting immigrants?",
            "How should we secure the border?",
            "Should there be a path to citizenship for DACA recipients?"
        ],
        perspectives: [
            IssuePerspective(
                label: "Progressive View",
                coreArgument: "Immigration strengthens America. We should create more pathways to legal status and treat immigrants humanely.",
                supportingPoints: [
                    "Immigrants contribute to the economy and pay taxes",
                    "America was built by immigrants",
                    "Family separation and detention are inhumane",
                    "Undocumented immigrants are often fleeing violence",
                    "Most undocumented immigrants have been here for years and are integrated into communities"
                ],
                commonCriticism: "Critics say this approach encourages illegal immigration and doesn't address legitimate security concerns.",
                examplePolicy: "Path to citizenship for DACA recipients and long-term residents"
            ),
            IssuePerspective(
                label: "Conservative View",
                coreArgument: "We must enforce existing laws, secure the border, and prioritize legal immigration that serves American interests.",
                supportingPoints: [
                    "A nation has the right to control its borders",
                    "Illegal immigration is unfair to those who follow the rules",
                    "Unchecked immigration can strain public services",
                    "Some immigrants pose security risks",
                    "American workers face wage competition from illegal labor"
                ],
                commonCriticism: "Critics say this approach is inhumane and ignores the economic benefits of immigration.",
                examplePolicy: "Complete border wall, mandatory E-Verify for employers"
            ),
            IssuePerspective(
                label: "Libertarian View",
                coreArgument: "Free movement of people, like free trade, benefits everyone. Government restrictions on immigration violate individual liberty.",
                supportingPoints: [
                    "People should be free to live and work where they choose",
                    "Immigrants create economic value",
                    "Most immigration restrictions are arbitrary",
                    "Free markets require free movement of labor"
                ],
                commonCriticism: "Critics say open borders are impractical and ignore national security and social cohesion concerns.",
                examplePolicy: "Greatly expanded legal immigration with minimal restrictions"
            )
        ],
        commonGround: "Most Americans support some form of legal immigration and believe we should treat immigrants humanely. The disagreement is often about numbers, criteria, and what to do about those already here illegally.",
        keyTerms: [
            KeyTerm(term: "DACA", definition: "Deferred Action for Childhood Arrivals—Obama-era program protecting undocumented immigrants brought as children", usedBy: nil),
            KeyTerm(term: "Undocumented immigrant", definition: "Person living in the US without legal authorization", usedBy: "Often used by progressives"),
            KeyTerm(term: "Illegal alien", definition: "Person living in the US without legal authorization", usedBy: "Often used by conservatives"),
            KeyTerm(term: "Asylum seeker", definition: "Person fleeing persecution who requests protection in another country", usedBy: nil),
            KeyTerm(term: "Chain migration", definition: "Family-based immigration allowing citizens to sponsor relatives", usedBy: "Often used critically by conservatives"),
            KeyTerm(term: "Family reunification", definition: "Immigration policy allowing citizens to sponsor relatives", usedBy: "Often used supportively by progressives")
        ],
        furtherReading: [
            IssueResource(title: "Migration Policy Institute", url: "https://www.migrationpolicy.org/", perspective: "Nonpartisan"),
            IssueResource(title: "Center for Immigration Studies", url: "https://cis.org/", perspective: "Right-leaning"),
            IssueResource(title: "American Immigration Council", url: "https://www.americanimmigrationcouncil.org/", perspective: "Left-leaning")
        ]
    )

    // ═══════════════════════════════════════════════════════════════════════════
    // ISSUE 2: Healthcare
    // ═══════════════════════════════════════════════════════════════════════════

    static let healthcare = PoliticalIssue(
        name: "Healthcare",
        icon: "heart.text.square.fill",
        summary: "How should Americans get and pay for healthcare?",
        keyQuestions: [
            "Should healthcare be a right or a personal responsibility?",
            "What role should government play in healthcare?",
            "How do we control rising healthcare costs?",
            "Should there be a public option or single-payer system?",
            "How should we handle pre-existing conditions?"
        ],
        perspectives: [
            IssuePerspective(
                label: "Progressive View",
                coreArgument: "Healthcare is a human right. Government should ensure universal coverage, either through single-payer or a strong public option.",
                supportingPoints: [
                    "The US spends more on healthcare with worse outcomes than other developed nations",
                    "Medical bills are the leading cause of bankruptcy",
                    "Employer-based insurance traps people in jobs",
                    "Other countries provide universal coverage at lower cost",
                    "Preventive care saves money long-term"
                ],
                commonCriticism: "Critics say government-run healthcare leads to long waits, rationing, and reduced innovation.",
                examplePolicy: "Medicare for All, single-payer system"
            ),
            IssuePerspective(
                label: "Conservative View",
                coreArgument: "Free-market competition and individual choice produce better healthcare than government programs. Government involvement increases costs and reduces quality.",
                supportingPoints: [
                    "America leads the world in medical innovation",
                    "Government programs are inefficient and bureaucratic",
                    "People should choose their own coverage based on their needs",
                    "Competition drives down prices and improves quality",
                    "Personal responsibility encourages healthy choices"
                ],
                commonCriticism: "Critics say market-based healthcare leaves millions uninsured and allows insurers to deny coverage.",
                examplePolicy: "Health Savings Accounts, interstate insurance competition, reduced regulations"
            ),
            IssuePerspective(
                label: "Moderate/Bipartisan View",
                coreArgument: "We should fix what's broken in our current system without completely replacing it—expand access while preserving choice.",
                supportingPoints: [
                    "Build on the existing system rather than starting over",
                    "Protect pre-existing condition coverage",
                    "Add a public option for those who want it",
                    "Use market mechanisms where they work",
                    "Address prescription drug prices"
                ],
                commonCriticism: "Critics on the left say this doesn't go far enough; critics on the right say it's still too much government.",
                examplePolicy: "ACA expansion with public option, drug price negotiation"
            )
        ],
        commonGround: "Most Americans agree that healthcare is too expensive, that people with pre-existing conditions should be protected, and that no one should go bankrupt from medical bills. The disagreement is about HOW to achieve these goals.",
        keyTerms: [
            KeyTerm(term: "Single-payer", definition: "System where government pays for all healthcare (like Medicare for everyone)", usedBy: nil),
            KeyTerm(term: "Public option", definition: "Government-run insurance plan that competes with private insurers", usedBy: nil),
            KeyTerm(term: "Universal coverage", definition: "System ensuring everyone has health insurance", usedBy: nil),
            KeyTerm(term: "Pre-existing condition", definition: "Health issue that exists before getting insurance", usedBy: nil),
            KeyTerm(term: "Medicare", definition: "Government health insurance for people 65+", usedBy: nil),
            KeyTerm(term: "Medicaid", definition: "Government health insurance for low-income people", usedBy: nil)
        ],
        furtherReading: [
            IssueResource(title: "Kaiser Family Foundation", url: "https://www.kff.org/", perspective: "Nonpartisan"),
            IssueResource(title: "Heritage Foundation Health Policy", url: "https://www.heritage.org/health-care-reform", perspective: "Right-leaning"),
            IssueResource(title: "Commonwealth Fund", url: "https://www.commonwealthfund.org/", perspective: "Left-leaning")
        ]
    )

    // ═══════════════════════════════════════════════════════════════════════════
    // ISSUE 3: Gun Policy
    // ═══════════════════════════════════════════════════════════════════════════

    static let gunPolicy = PoliticalIssue(
        name: "Gun Policy",
        icon: "shield.fill",
        summary: "How should we balance gun rights with public safety?",
        keyQuestions: [
            "What does the Second Amendment protect?",
            "Should there be universal background checks?",
            "Should certain weapons be restricted or banned?",
            "Do gun control laws reduce violence?",
            "How do we address mass shootings?"
        ],
        perspectives: [
            IssuePerspective(
                label: "Gun Control Advocate View",
                coreArgument: "Common-sense gun regulations can reduce gun violence while respecting the rights of responsible gun owners.",
                supportingPoints: [
                    "Other developed nations have fewer guns and less gun violence",
                    "Universal background checks prevent dangerous people from buying guns",
                    "Military-style weapons aren't needed for self-defense or hunting",
                    "Gun violence is a public health crisis requiring intervention",
                    "The Second Amendment allows for reasonable regulation"
                ],
                commonCriticism: "Critics say gun control doesn't stop criminals and infringes on constitutional rights.",
                examplePolicy: "Universal background checks, assault weapons ban, red flag laws"
            ),
            IssuePerspective(
                label: "Gun Rights Advocate View",
                coreArgument: "The Second Amendment protects an individual right to keep and bear arms. Gun control laws don't stop criminals and only burden law-abiding citizens.",
                supportingPoints: [
                    "The Second Amendment is a fundamental constitutional right",
                    "Guns are used defensively millions of times per year",
                    "Criminals don't follow gun laws",
                    "Gun ownership is part of American culture and heritage",
                    "The real problem is mental health, not guns"
                ],
                commonCriticism: "Critics say this position ignores the gun violence epidemic and that other rights have reasonable limits.",
                examplePolicy: "Constitutional carry, opposing new restrictions, mental health focus"
            ),
            IssuePerspective(
                label: "Middle Ground View",
                coreArgument: "We can improve background check systems and keep guns from dangerous people while protecting the rights of responsible gun owners.",
                supportingPoints: [
                    "Most gun owners support universal background checks",
                    "Focus on enforcement of existing laws",
                    "Address mental health and warning signs",
                    "Secure storage and safety training",
                    "Both rights and responsibilities matter"
                ],
                commonCriticism: "Both sides often see this as inadequate—too much restriction or not enough.",
                examplePolicy: "Fix NICS background check system, voluntary safe storage incentives"
            )
        ],
        commonGround: "Most Americans, including most gun owners, support keeping guns out of the hands of dangerous people. Majorities support universal background checks. The disagreement is about which specific policies are effective and constitutional.",
        keyTerms: [
            KeyTerm(term: "Second Amendment", definition: "Constitutional amendment protecting the right to keep and bear arms", usedBy: nil),
            KeyTerm(term: "Universal background checks", definition: "Requiring background checks for all gun sales, including private sales", usedBy: nil),
            KeyTerm(term: "Red flag laws", definition: "Laws allowing temporary removal of guns from people deemed dangerous", usedBy: nil),
            KeyTerm(term: "Assault weapon", definition: "Semi-automatic firearms with certain features (definition varies)", usedBy: "Often used by gun control advocates"),
            KeyTerm(term: "Modern sporting rifle", definition: "Term for AR-15 style rifles", usedBy: "Often used by gun rights advocates"),
            KeyTerm(term: "Constitutional carry", definition: "Carrying firearms without a permit", usedBy: nil)
        ],
        furtherReading: [
            IssueResource(title: "RAND Gun Policy Research", url: "https://www.rand.org/research/gun-policy.html", perspective: "Nonpartisan"),
            IssueResource(title: "Everytown for Gun Safety", url: "https://www.everytown.org/", perspective: "Left-leaning"),
            IssueResource(title: "NRA-ILA", url: "https://www.nraila.org/", perspective: "Right-leaning")
        ]
    )

    // ═══════════════════════════════════════════════════════════════════════════
    // ISSUE 4: Climate & Energy
    // ═══════════════════════════════════════════════════════════════════════════

    static let climateEnergy = PoliticalIssue(
        name: "Climate & Energy",
        icon: "leaf.fill",
        summary: "How should we address climate change and meet our energy needs?",
        keyQuestions: [
            "How urgent is the climate crisis?",
            "What role should fossil fuels play going forward?",
            "Should government mandate the transition to clean energy?",
            "How do we balance environmental protection with economic concerns?",
            "What obligations do we have to future generations?"
        ],
        perspectives: [
            IssuePerspective(
                label: "Climate Action View",
                coreArgument: "Climate change is an existential threat requiring urgent, large-scale government action to transition to clean energy.",
                supportingPoints: [
                    "Scientific consensus says human activity is causing dangerous warming",
                    "The costs of inaction far exceed the costs of transition",
                    "Clean energy creates jobs and economic opportunity",
                    "We have a moral obligation to future generations",
                    "Extreme weather is already causing damage and displacement"
                ],
                commonCriticism: "Critics say climate policies hurt the economy, raise energy prices, and won't work without global cooperation.",
                examplePolicy: "Green New Deal, carbon tax, renewable energy mandates"
            ),
            IssuePerspective(
                label: "Energy Independence View",
                coreArgument: "We need affordable, reliable energy. Rushing to abandon fossil fuels hurts workers and raises costs. Technology and markets, not mandates, should drive the transition.",
                supportingPoints: [
                    "Fossil fuels provide affordable, reliable energy",
                    "Regulations kill jobs in energy-producing communities",
                    "Developing nations will keep burning fossil fuels regardless",
                    "Nuclear power is carbon-free but often opposed by environmentalists",
                    "Innovation, not regulation, will solve energy challenges"
                ],
                commonCriticism: "Critics say this ignores the scientific consensus and delays necessary action.",
                examplePolicy: "All-of-the-above energy, reduce regulations, promote nuclear"
            ),
            IssuePerspective(
                label: "Pragmatic Middle View",
                coreArgument: "Climate change is real and requires action, but transition must be gradual to avoid economic disruption. Market-based solutions can work better than mandates.",
                supportingPoints: [
                    "Take climate seriously while managing economic impact",
                    "Carbon pricing lets markets find efficient solutions",
                    "Invest in innovation and adaptation",
                    "Nuclear should be part of the clean energy mix",
                    "Help workers in transitioning industries"
                ],
                commonCriticism: "Seen as too slow by climate activists, still too much government by free-market advocates.",
                examplePolicy: "Revenue-neutral carbon tax, nuclear investment, just transition funds"
            )
        ],
        commonGround: "Most Americans believe climate change is happening and support clean energy development. Many also want affordable energy and worry about job losses. The disagreement is about how fast to transition and who should bear the costs.",
        keyTerms: [
            KeyTerm(term: "Carbon tax", definition: "Tax on carbon dioxide emissions to discourage fossil fuel use", usedBy: nil),
            KeyTerm(term: "Cap and trade", definition: "System limiting emissions and allowing companies to trade permits", usedBy: nil),
            KeyTerm(term: "Green New Deal", definition: "Proposed legislation linking climate action to economic justice", usedBy: "Associated with progressives"),
            KeyTerm(term: "All-of-the-above", definition: "Energy policy using all sources including fossil fuels", usedBy: "Often used by conservatives"),
            KeyTerm(term: "Net zero", definition: "Balancing carbon emissions with carbon removal", usedBy: nil),
            KeyTerm(term: "Just transition", definition: "Ensuring workers aren't left behind in energy transition", usedBy: nil)
        ],
        furtherReading: [
            IssueResource(title: "IPCC Reports", url: "https://www.ipcc.ch/", perspective: "Scientific consensus"),
            IssueResource(title: "Resources for the Future", url: "https://www.rff.org/", perspective: "Nonpartisan"),
            IssueResource(title: "Heritage Foundation Energy", url: "https://www.heritage.org/energy-economics", perspective: "Right-leaning")
        ]
    )

    // ═══════════════════════════════════════════════════════════════════════════
    // ALL ISSUES
    // ═══════════════════════════════════════════════════════════════════════════

    static let allIssues: [PoliticalIssue] = [
        immigration,
        healthcare,
        gunPolicy,
        climateEnergy
    ]

    // Additional issues to be explored (placeholders for expansion)
    static let additionalTopics: [String] = [
        "Abortion & Reproductive Rights",
        "Criminal Justice Reform",
        "Education Policy",
        "Economic Policy & Taxes",
        "Foreign Policy",
        "LGBTQ+ Rights",
        "Social Security & Medicare",
        "Technology & Privacy",
        "Voting Rights & Election Security"
    ]
}

// MARK: - How to Use This Feature

/*
 DESIGN PHILOSOPHY:

 This feature is NOT:
 - A quiz telling you what to believe
 - A tool to "match" you to a party
 - An argument for any particular position

 This feature IS:
 - An educational resource to understand multiple perspectives
 - A starting point for deeper research
 - A tool for productive conversations with people who disagree

 PRESENTATION GUIDELINES:

 1. Always present perspectives in rotating order (not always left-first or right-first)
 2. Use neutral language in the summary and key questions
 3. Give each perspective its strongest arguments, not strawmen
 4. Include common ground to show where agreement exists
 5. Provide resources from multiple perspectives for further reading

 ADDING NEW ISSUES:

 When adding a new issue:
 1. Start with key questions that reasonable people disagree on
 2. Identify 2-4 distinct perspectives (not just "left" and "right")
 3. Present each perspective's strongest case
 4. Include criticism that perspective commonly faces
 5. Find genuine common ground
 6. Define terms that might be used differently by different groups
 7. Include resources from multiple perspectives
 */
