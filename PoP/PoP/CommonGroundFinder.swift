//
//  CommonGroundFinder.swift
//  PoP
//
//  Interactive tool for discovering shared values across political divides.
//  Users answer questions about values (not policies) and see where they
//  overlap with people who vote differently.
//
//  Inspired by research showing most Americans share core values
//  but disagree on how to achieve them.
//

import Foundation

// MARK: - Core Models

/// A value that people might prioritize
struct CoreValue: Identifiable, Equatable, Hashable {
    let id: String
    let name: String
    let icon: String
    let description: String
    let leftFrame: String      // How progressives often express this value
    let rightFrame: String     // How conservatives often express this value
    let commonGround: String   // Where both sides meet
}

/// A question designed to surface values without policy framing
struct ValueQuestion: Identifiable {
    let id = UUID()
    let question: String
    let valueRevealed: String  // ID of the CoreValue this question explores
    let options: [ValueOption]
}

struct ValueOption: Identifiable {
    let id = UUID()
    let text: String
    let valuesReinforced: [String]  // IDs of CoreValues this answer indicates
    let weight: Double              // 0.0 to 1.0, how strongly it indicates the value
}

/// User's completed assessment
struct CommonGroundProfile: Identifiable, Codable {
    let id: UUID
    let createdAt: Date
    var topValues: [String]           // IDs of top 5 values
    var answerHistory: [AnswerRecord] // For review
    var sharedCount: Int              // Times shared with others
}

struct AnswerRecord: Identifiable, Codable {
    let id: UUID
    let questionId: String
    let selectedOptionIndex: Int
    let timestamp: Date
}

// MARK: - Core Values Data

struct CommonGroundData {

    // ═══════════════════════════════════════════════════════════════════════════
    // THE CORE VALUES
    // Research shows these values are shared across the political spectrum,
    // though they're prioritized and expressed differently.
    // ═══════════════════════════════════════════════════════════════════════════

    static let coreValues: [CoreValue] = [

        CoreValue(
            id: "fairness",
            name: "Fairness",
            icon: "scale.3d",
            description: "Everyone should be treated justly and given a fair chance.",
            leftFrame: "Everyone deserves equal opportunity, and systems should be changed when they produce unequal outcomes.",
            rightFrame: "People should be judged by their actions and effort, not given advantages based on group membership.",
            commonGround: "We all want a society where hard work is rewarded and no one is held back unfairly."
        ),

        CoreValue(
            id: "freedom",
            name: "Freedom",
            icon: "bird.fill",
            description: "People should be free to live their lives as they choose.",
            leftFrame: "Freedom from oppression, discrimination, and systems that limit human potential.",
            rightFrame: "Freedom from government overreach and the ability to make your own choices.",
            commonGround: "We all believe individuals should have maximum control over their own lives."
        ),

        CoreValue(
            id: "security",
            name: "Safety & Security",
            icon: "shield.fill",
            description: "People deserve to feel safe in their homes and communities.",
            leftFrame: "Security means healthcare, housing stability, and protection from hate.",
            rightFrame: "Security means strong borders, law enforcement, and national defense.",
            commonGround: "We all want to protect our families and communities from harm."
        ),

        CoreValue(
            id: "community",
            name: "Community",
            icon: "person.3.fill",
            description: "We're stronger together than alone.",
            leftFrame: "Society has an obligation to care for all its members, especially the vulnerable.",
            rightFrame: "Strong families, churches, and local organizations are the backbone of society.",
            commonGround: "We all believe in taking care of each other and looking out for our neighbors."
        ),

        CoreValue(
            id: "responsibility",
            name: "Personal Responsibility",
            icon: "figure.stand",
            description: "People should take ownership of their choices and actions.",
            leftFrame: "Those with more should give more; we're responsible to society.",
            rightFrame: "Success comes from hard work; people should earn their own way.",
            commonGround: "We all believe in working hard and being accountable for our actions."
        ),

        CoreValue(
            id: "respect",
            name: "Respect & Dignity",
            icon: "hand.raised.fill",
            description: "Every person deserves to be treated with basic respect.",
            leftFrame: "Respecting identity, culture, and lived experience.",
            rightFrame: "Respecting tradition, earned authority, and different viewpoints.",
            commonGround: "We all want to be treated with dignity and extend that to others."
        ),

        CoreValue(
            id: "truth",
            name: "Truth & Honesty",
            icon: "checkmark.seal.fill",
            description: "Honesty matters, and people should be able to trust information.",
            leftFrame: "Science, facts, and expertise should guide policy decisions.",
            rightFrame: "People and institutions should be honest; skepticism of elites is healthy.",
            commonGround: "We all want to know the truth and make decisions based on honest information."
        ),

        CoreValue(
            id: "opportunity",
            name: "Opportunity",
            icon: "arrow.up.right",
            description: "Everyone should have a chance to build a good life.",
            leftFrame: "Systems should ensure everyone has access to education, jobs, and upward mobility.",
            rightFrame: "Government shouldn't pick winners; the free market creates opportunity.",
            commonGround: "We all want our children to have the chance to do better than we did."
        ),

        CoreValue(
            id: "tradition",
            name: "Heritage & Tradition",
            icon: "clock.arrow.circlepath",
            description: "The wisdom of the past has value.",
            leftFrame: "Honoring the struggles of those who came before us.",
            rightFrame: "Preserving the institutions and values that made America great.",
            commonGround: "We all value learning from history and honoring those who built what we have."
        ),

        CoreValue(
            id: "compassion",
            name: "Compassion",
            icon: "heart.fill",
            description: "We should care about the suffering of others.",
            leftFrame: "Government programs should help those in need.",
            rightFrame: "Charity and community support are the best way to help people.",
            commonGround: "We all feel called to help those who are struggling."
        ),

        CoreValue(
            id: "stewardship",
            name: "Stewardship",
            icon: "leaf.fill",
            description: "We should take care of what we've been given.",
            leftFrame: "Protecting the environment for future generations.",
            rightFrame: "Responsible use of resources; conservation through ownership.",
            commonGround: "We all want to leave the world better than we found it for our children."
        ),

        CoreValue(
            id: "voice",
            name: "Having a Voice",
            icon: "megaphone.fill",
            description: "People deserve to be heard and have a say in decisions that affect them.",
            leftFrame: "Every vote should count equally; marginalized voices need amplification.",
            rightFrame: "Local control matters; people closest to problems should decide.",
            commonGround: "We all believe citizens should have a real say in how they're governed."
        )
    ]

    // ═══════════════════════════════════════════════════════════════════════════
    // VALUE-SURFACING QUESTIONS
    // These questions are designed to reveal values WITHOUT asking about policy.
    // The framing avoids partisan triggers.
    // ═══════════════════════════════════════════════════════════════════════════

    static let valueQuestions: [ValueQuestion] = [

        // Question 1: What's most important for a good society?
        ValueQuestion(
            question: "What's MOST important for a society to thrive?",
            valueRevealed: "community",
            options: [
                ValueOption(
                    text: "People looking out for each other",
                    valuesReinforced: ["community", "compassion"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Individual freedom to pursue your own path",
                    valuesReinforced: ["freedom", "opportunity"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Strong institutions and rule of law",
                    valuesReinforced: ["security", "truth"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "A sense of shared history and values",
                    valuesReinforced: ["tradition", "respect"],
                    weight: 1.0
                )
            ]
        ),

        // Question 2: What makes you most proud?
        ValueQuestion(
            question: "What makes you MOST proud about America?",
            valueRevealed: "tradition",
            options: [
                ValueOption(
                    text: "That we keep trying to live up to our ideals",
                    valuesReinforced: ["fairness", "opportunity"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Our freedom compared to other countries",
                    valuesReinforced: ["freedom", "voice"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "How we come together in times of crisis",
                    valuesReinforced: ["community", "compassion"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "What our founders and ancestors built",
                    valuesReinforced: ["tradition", "stewardship"],
                    weight: 1.0
                )
            ]
        ),

        // Question 3: What bothers you most?
        ValueQuestion(
            question: "What bothers you MOST about the current state of things?",
            valueRevealed: "fairness",
            options: [
                ValueOption(
                    text: "People aren't treated fairly",
                    valuesReinforced: ["fairness", "respect"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "You can't trust what you hear",
                    valuesReinforced: ["truth", "responsibility"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "People don't take care of each other",
                    valuesReinforced: ["community", "compassion"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "People feel unsafe in their communities",
                    valuesReinforced: ["security", "voice"],
                    weight: 1.0
                )
            ]
        ),

        // Question 4: What do you want for your kids?
        ValueQuestion(
            question: "What do you MOST want for the next generation?",
            valueRevealed: "opportunity",
            options: [
                ValueOption(
                    text: "A fair shot at success, no matter where they start",
                    valuesReinforced: ["opportunity", "fairness"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Freedom to live according to their own values",
                    valuesReinforced: ["freedom", "respect"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "A safe and stable world",
                    valuesReinforced: ["security", "stewardship"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Strong communities and families",
                    valuesReinforced: ["community", "tradition"],
                    weight: 1.0
                )
            ]
        ),

        // Question 5: What kind of leader?
        ValueQuestion(
            question: "What quality do you value MOST in a leader?",
            valueRevealed: "responsibility",
            options: [
                ValueOption(
                    text: "Honesty, even when it's hard",
                    valuesReinforced: ["truth", "responsibility"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Stands up for people who need it",
                    valuesReinforced: ["compassion", "fairness"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Keeps us safe and secure",
                    valuesReinforced: ["security", "responsibility"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Listens to regular people, not just elites",
                    valuesReinforced: ["voice", "respect"],
                    weight: 1.0
                )
            ]
        ),

        // Question 6: How should help be provided?
        ValueQuestion(
            question: "When someone in your community is struggling, what's the best way to help?",
            valueRevealed: "compassion",
            options: [
                ValueOption(
                    text: "Neighbors and community stepping up",
                    valuesReinforced: ["community", "responsibility"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Programs that give everyone a safety net",
                    valuesReinforced: ["compassion", "security"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Giving them the tools to help themselves",
                    valuesReinforced: ["opportunity", "freedom"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Churches and charities that know them personally",
                    valuesReinforced: ["community", "tradition"],
                    weight: 1.0
                )
            ]
        ),

        // Question 7: What's worth protecting?
        ValueQuestion(
            question: "What's MOST worth protecting for future generations?",
            valueRevealed: "stewardship",
            options: [
                ValueOption(
                    text: "The natural world—land, water, air",
                    valuesReinforced: ["stewardship", "responsibility"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Our rights and freedoms",
                    valuesReinforced: ["freedom", "tradition"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Economic opportunity and prosperity",
                    valuesReinforced: ["opportunity", "security"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Our culture, history, and way of life",
                    valuesReinforced: ["tradition", "community"],
                    weight: 1.0
                )
            ]
        ),

        // Question 8: What makes you hopeful?
        ValueQuestion(
            question: "What makes you MOST hopeful about the future?",
            valueRevealed: "voice",
            options: [
                ValueOption(
                    text: "Young people are engaged and care",
                    valuesReinforced: ["voice", "stewardship"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "People are waking up to problems",
                    valuesReinforced: ["truth", "responsibility"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "We've overcome hard times before",
                    valuesReinforced: ["tradition", "community"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "There are still good people everywhere",
                    valuesReinforced: ["compassion", "respect"],
                    weight: 1.0
                )
            ]
        ),

        // Question 9: What frustrates you?
        ValueQuestion(
            question: "What frustrates you MOST about politics today?",
            valueRevealed: "truth",
            options: [
                ValueOption(
                    text: "No one listens to each other anymore",
                    valuesReinforced: ["respect", "community"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Regular people's voices don't matter",
                    valuesReinforced: ["voice", "fairness"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "You can't tell what's true anymore",
                    valuesReinforced: ["truth", "responsibility"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "Nothing ever actually gets better",
                    valuesReinforced: ["opportunity", "security"],
                    weight: 1.0
                )
            ]
        ),

        // Question 10: What defines a good neighbor?
        ValueQuestion(
            question: "What MOST defines a good neighbor?",
            valueRevealed: "respect",
            options: [
                ValueOption(
                    text: "They help when you need it",
                    valuesReinforced: ["compassion", "community"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "They respect your privacy and property",
                    valuesReinforced: ["respect", "freedom"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "They're honest and trustworthy",
                    valuesReinforced: ["truth", "responsibility"],
                    weight: 1.0
                ),
                ValueOption(
                    text: "They look out for the whole community",
                    valuesReinforced: ["security", "stewardship"],
                    weight: 1.0
                )
            ]
        )
    ]

    // ═══════════════════════════════════════════════════════════════════════════
    // COMMON GROUND INSIGHTS
    // Messages to display based on value combinations
    // ═══════════════════════════════════════════════════════════════════════════

    static let insights: [String: String] = [
        "fairness+freedom": "You value both fairness and freedom. Many Americans share this—the debate is often about how best to achieve both at once.",

        "community+responsibility": "You believe in both community and personal responsibility. This combination drives both conservative and progressive visions of a good society.",

        "security+compassion": "You want people to be both safe and cared for. Most Americans agree—they differ on which threats are most urgent and which solutions work best.",

        "truth+voice": "You want honest information and for regular people to have a say. This is foundational to democracy itself.",

        "tradition+opportunity": "You value both honoring the past and creating new possibilities. This tension has always been at the heart of the American story.",

        "freedom+community": "You believe in both individual liberty and caring for each other. The American experiment has always tried to balance these.",

        "stewardship+opportunity": "You want to protect what we have while creating new chances. Balancing these has been a challenge for every generation.",

        "respect+truth": "You value treating people with dignity and being honest. These values are essential for any real dialogue across differences."
    ]

    // ═══════════════════════════════════════════════════════════════════════════
    // PAIR DISCUSSION PROMPTS
    // When two people have both completed the assessment, use these
    // ═══════════════════════════════════════════════════════════════════════════

    static let pairDiscussionPrompts: [String] = [
        "You both value [SHARED_VALUE]. Talk about a time when that value guided a decision you made.",
        "You both care about [SHARED_VALUE]. What do you think threatens that value today?",
        "Looking at where you both value [SHARED_VALUE]—can you think of something you could work on together locally?",
        "You see [SHARED_VALUE] differently in some ways. What experiences shaped how you think about it?",
        "If we agree on [SHARED_VALUE], why do you think we sometimes end up supporting different policies?",
        "What's one thing you learned about [SHARED_VALUE] from someone who votes differently than you?"
    ]

    // ═══════════════════════════════════════════════════════════════════════════
    // STATISTICS FOR CONTEXT
    // Show users they're not alone
    // ═══════════════════════════════════════════════════════════════════════════

    static let statisticsContext: [String: String] = [
        "fairness": "90% of Americans believe everyone deserves a fair chance, regardless of political party.",
        "freedom": "Over 85% of both Democrats and Republicans say freedom is a core American value.",
        "community": "77% of Americans say they wish people in their community knew each other better.",
        "security": "Both parties rank safety as a top concern, though they define threats differently.",
        "truth": "83% of Americans say they're concerned about the spread of misinformation.",
        "compassion": "Most Americans, regardless of party, donate time or money to help those in need.",
        "opportunity": "The 'American Dream'—the idea that anyone can succeed—is believed by majorities in both parties.",
        "respect": "Over 90% of Americans say they want to be treated with basic dignity and respect."
    ]
}

// MARK: - Helper Types

/// Result after completing the assessment
struct CommonGroundResult {
    let topValues: [CoreValue]
    let sharedPercentage: Int  // Estimate of Americans who share your top value
    let bridgingInsight: String
    let discussionPrompt: String
}

/// For displaying "People who value X also tend to value Y"
struct ValueCorrelation {
    let primaryValue: String
    let correlatedValue: String
    let strength: Double  // 0.0 to 1.0
}

// MARK: - Common Ground Finder Logic

struct CommonGroundFinder {

    /// Calculate top values from a set of answers
    static func calculateTopValues(from answers: [(questionIndex: Int, optionIndex: Int)]) -> [CoreValue] {
        var valueScores: [String: Double] = [:]

        // Initialize all values with 0
        for value in CommonGroundData.coreValues {
            valueScores[value.id] = 0.0
        }

        // Sum up scores based on answers
        for answer in answers {
            guard answer.questionIndex < CommonGroundData.valueQuestions.count,
                  answer.optionIndex < CommonGroundData.valueQuestions[answer.questionIndex].options.count else {
                continue
            }

            let option = CommonGroundData.valueQuestions[answer.questionIndex].options[answer.optionIndex]
            for valueId in option.valuesReinforced {
                valueScores[valueId, default: 0.0] += option.weight
            }
        }

        // Sort and return top 5
        let sorted = valueScores.sorted { $0.value > $1.value }
        let topIds = Array(sorted.prefix(5).map { $0.key })

        return topIds.compactMap { id in
            CommonGroundData.coreValues.first { $0.id == id }
        }
    }

    /// Find shared values between two profiles
    static func findSharedValues(profile1: [String], profile2: [String]) -> [CoreValue] {
        let shared = Set(profile1).intersection(Set(profile2))
        return shared.compactMap { id in
            CommonGroundData.coreValues.first { $0.id == id }
        }
    }

    /// Generate insight for a pair of values
    static func insightFor(value1: String, value2: String) -> String? {
        let key1 = "\(value1)+\(value2)"
        let key2 = "\(value2)+\(value1)"
        return CommonGroundData.insights[key1] ?? CommonGroundData.insights[key2]
    }

    /// Generate a discussion prompt for shared values
    static func discussionPromptFor(sharedValue: CoreValue) -> String {
        let template = CommonGroundData.pairDiscussionPrompts.randomElement() ?? ""
        return template.replacingOccurrences(of: "[SHARED_VALUE]", with: sharedValue.name)
    }
}

// MARK: - Sharing Support

struct ShareableValuesProfile {
    let topValues: [CoreValue]
    let createdAt: Date

    /// Generate shareable text for the values profile
    var shareText: String {
        let valueNames = topValues.prefix(3).map { $0.name }.joined(separator: ", ")
        return """
        My Top Values: \(valueNames)

        I discovered my core values using the Common Ground Finder in the People Over Party app. What are yours?

        #PeopleOverParty #CommonGround #CivicEngagement
        """
    }

    /// Generate a summary for display
    var summaryText: String {
        guard let topValue = topValues.first else { return "" }
        return CommonGroundData.statisticsContext[topValue.id] ?? "You share this value with millions of Americans."
    }

    /// Get the common ground statement for top value pair
    var bridgingStatement: String? {
        guard topValues.count >= 2 else { return nil }
        return CommonGroundFinder.insightFor(value1: topValues[0].id, value2: topValues[1].id)
    }
}

extension CommonGroundFinder {

    /// Create a shareable profile from quiz results
    static func createShareableProfile(from answers: [(questionIndex: Int, optionIndex: Int)]) -> ShareableValuesProfile {
        let topValues = calculateTopValues(from: answers)
        return ShareableValuesProfile(topValues: topValues, createdAt: Date())
    }

    /// Generate share card data for social media
    static func generateShareCardData(profile: ShareableValuesProfile) -> ShareCardData {
        let valueIcons = profile.topValues.prefix(3).map { $0.icon }
        let valueNames = profile.topValues.prefix(3).map { $0.name }

        return ShareCardData(
            title: "My Core Values",
            subtitle: "Discovered with People Over Party",
            values: Array(zip(valueNames, valueIcons)).map { (name: $0.0, icon: $0.1) },
            insight: profile.bridgingStatement ?? profile.summaryText,
            appURL: "https://peopleoverpartysd.com"
        )
    }
}

struct ShareCardData {
    let title: String
    let subtitle: String
    let values: [(name: String, icon: String)]
    let insight: String
    let appURL: String
}

// MARK: - Usage Notes

/*
 HOW THIS FEATURE WORKS:

 1. INDIVIDUAL MODE:
    - User answers 10 questions about their values
    - Each answer reinforces certain core values
    - At the end, they see their "Value Profile" - top 5 values
    - They learn how their values connect to the broader American story

 2. PAIR MODE:
    - Two people (ideally from different political perspectives) each complete the assessment
    - The app shows them where their values overlap
    - They get discussion prompts based on shared values
    - The goal: realize they share more than they thought

 3. GROUP MODE (Future):
    - A group completes assessments
    - Facilitator sees aggregate data
    - Group discusses: "We all care about X. How do we see it differently?"

 WHY THIS WORKS:

 Research shows:
 - People across the political spectrum share core values
 - We differ on HOW to achieve those values, not WHAT we want
 - When people discover shared values, they're more willing to listen
 - Values-based conversations are less triggering than policy debates

 WHAT THIS IS NOT:

 - Not a personality test
 - Not telling you what to believe
 - Not trying to change anyone's mind
 - Not suggesting "both sides are equally right"

 It's simply a tool for discovering common ground.
 */
