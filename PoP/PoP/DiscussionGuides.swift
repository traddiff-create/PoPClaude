//
//  DiscussionGuides.swift
//  PoP
//
//  Civic Conversation Guides - Structured frameworks for
//  respectful, nonpartisan dialogue across differences.
//
//  Inspired by The King Center's Six Principles of Nonviolence
//  and deliberative democracy best practices.
//

import Foundation

// MARK: - Discussion Guide Model

struct DiscussionGuide: Identifiable, Equatable {
    let id: UUID
    let title: String
    let subtitle: String
    let icon: String
    let duration: String
    let groupSize: String
    let overview: String
    let groundRules: [String]
    let openingQuestions: [String]
    let deeperQuestions: [String]
    let closingQuestions: [String]
    let facilitatorTips: [String]
    let takeaways: [String]

    init(
        id: UUID = UUID(),
        title: String,
        subtitle: String,
        icon: String,
        duration: String,
        groupSize: String,
        overview: String,
        groundRules: [String],
        openingQuestions: [String],
        deeperQuestions: [String],
        closingQuestions: [String],
        facilitatorTips: [String],
        takeaways: [String]
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.duration = duration
        self.groupSize = groupSize
        self.overview = overview
        self.groundRules = groundRules
        self.openingQuestions = openingQuestions
        self.deeperQuestions = deeperQuestions
        self.closingQuestions = closingQuestions
        self.facilitatorTips = facilitatorTips
        self.takeaways = takeaways
    }
}

// MARK: - Discussion Guides Data

struct DiscussionGuidesData {

    // MARK: - Universal Ground Rules

    static let universalGroundRules = [
        "Listen to understand, not to respond",
        "Speak from your own experience using \"I\" statements",
        "Assume good intentions from others",
        "Respect that reasonable people can disagree",
        "Keep confidentiality - share ideas, not names",
        "One voice at a time - no interrupting",
        "Challenge ideas, not people",
        "It's okay to change your mind"
    ]

    // MARK: - All Guides

    static let guides: [DiscussionGuide] = [

        // ═══════════════════════════════════════════════════════════════
        // GUIDE 1: Holiday & Family Conversations
        // ═══════════════════════════════════════════════════════════════

        DiscussionGuide(
            title: "Talking Across the Table",
            subtitle: "Navigating political conversations with family and friends",
            icon: "person.3.fill",
            duration: "Ongoing / As needed",
            groupSize: "2-10 people",
            overview: """
            Holiday gatherings and family events often bring together people with different political views. This guide helps you navigate these conversations with grace, maintain relationships, and maybe even find unexpected common ground.

            Remember: The goal isn't to change minds—it's to understand each other better and preserve the relationships that matter most.
            """,
            groundRules: [
                "Relationships matter more than winning arguments",
                "You can leave a conversation at any time",
                "Ask questions out of genuine curiosity",
                "It's okay to say \"I don't know\" or \"I'll think about that\"",
                "Avoid labels and generalizations",
                "Find the person behind the position"
            ],
            openingQuestions: [
                "What's something you're hopeful about for our community?",
                "What local issue affects you or your family the most?",
                "What's a value you hold that guides how you vote?",
                "What do you wish more people understood about your perspective?"
            ],
            deeperQuestions: [
                "Can you help me understand how you came to that view?",
                "What experiences shaped your thinking on this?",
                "What would need to be true for you to see it differently?",
                "Is there anything about the other side's argument you find reasonable?",
                "What's a time you changed your mind about something political?"
            ],
            closingQuestions: [
                "What's one thing we actually agree on?",
                "What did I say that surprised you?",
                "How can we stay connected even when we disagree?",
                "What's something positive we can do together in our community?"
            ],
            facilitatorTips: [
                "If things get heated, pivot to shared memories or common concerns",
                "Use 'bridging' phrases: \"I hear you saying...\" or \"Help me understand...\"",
                "It's okay to set boundaries: \"I'd rather not discuss that today\"",
                "Model curiosity by asking follow-up questions",
                "Acknowledge emotions: \"I can see this matters a lot to you\""
            ],
            takeaways: [
                "You don't have to resolve every disagreement",
                "Finding one point of agreement is a success",
                "People remember how you made them feel, not what you said",
                "You can disagree and still love each other"
            ]
        ),

        // ═══════════════════════════════════════════════════════════════
        // GUIDE 2: Understanding Your Neighbor's Vote
        // ═══════════════════════════════════════════════════════════════

        DiscussionGuide(
            title: "Understanding Your Neighbor",
            subtitle: "A conversation guide for bridging political divides",
            icon: "house.and.flag.fill",
            duration: "45-60 minutes",
            groupSize: "2-6 people",
            overview: """
            Most Americans have more in common than our political discourse suggests. This guide helps facilitate a structured conversation between people who vote differently, focusing on shared values and mutual understanding.

            Based on research showing that face-to-face conversations reduce polarization more than any other intervention.
            """,
            groundRules: universalGroundRules,
            openingQuestions: [
                "What do you love most about living in South Dakota?",
                "What does being a good citizen mean to you?",
                "What's a challenge facing our community that concerns you?",
                "What would you want your kids or grandkids to know about democracy?"
            ],
            deeperQuestions: [
                "When you think about voting, what values guide your decisions?",
                "What's something your own party gets wrong?",
                "What's a policy issue where you feel torn or uncertain?",
                "If you could change one thing about how our government works, what would it be?",
                "What would it take to restore trust in our institutions?",
                "Do you think compromise is possible? What would it look like?"
            ],
            closingQuestions: [
                "What did you learn about me that surprised you?",
                "Where do our values actually overlap?",
                "What's one thing we could work on together locally?",
                "Would you be willing to have another conversation like this?"
            ],
            facilitatorTips: [
                "Start with personal stories, not policy positions",
                "When someone shares a view you disagree with, respond with curiosity: \"Tell me more\"",
                "Look for the underlying value behind each position",
                "If someone says something factually incorrect, gently redirect rather than correct",
                "End on a positive note, even if you still disagree"
            ],
            takeaways: [
                "Most people want similar things: safety, opportunity, fairness",
                "We disagree on how to get there, not where we're going",
                "Understanding doesn't require agreement",
                "One conversation won't change everything, but it's a start"
            ]
        ),

        // ═══════════════════════════════════════════════════════════════
        // GUIDE 3: Local Issues Discussion
        // ═══════════════════════════════════════════════════════════════

        DiscussionGuide(
            title: "Our Community, Our Future",
            subtitle: "Discussing local issues that affect us all",
            icon: "building.2.fill",
            duration: "60-90 minutes",
            groupSize: "4-12 people",
            overview: """
            Local issues—schools, roads, public safety, development—affect our daily lives more than national politics. Yet we often spend more time debating distant issues than the ones in our own backyard.

            This guide helps community members discuss local challenges and opportunities in a productive, solution-oriented way.
            """,
            groundRules: universalGroundRules + [
                "Focus on local issues, not national politics",
                "Everyone's experience in this community is valid",
                "Propose solutions, not just problems"
            ],
            openingQuestions: [
                "How long have you lived here? What brought you to this community?",
                "What do you appreciate most about our town/county?",
                "What's changed in our community over the past 10 years—for better or worse?",
                "If you could show a visitor one thing about our community, what would it be?"
            ],
            deeperQuestions: [
                "What local issue keeps you up at night?",
                "Where should our tax dollars be prioritized?",
                "How can we attract and keep young people in our community?",
                "What's working well in our local government? What isn't?",
                "How do we balance growth with preserving what makes us special?",
                "What role should citizens play in local decision-making?",
                "Are there services our community needs that we don't have?"
            ],
            closingQuestions: [
                "What's one local issue we seem to agree on?",
                "What's a small, concrete step our community could take?",
                "How can we stay engaged beyond this conversation?",
                "Who else should be part of these discussions?"
            ],
            facilitatorTips: [
                "Keep discussions focused on local, actionable issues",
                "Encourage people to speak from their own experience",
                "If national politics come up, gently redirect: \"How does that play out locally?\"",
                "Make sure quieter voices get heard",
                "Capture action items and follow up"
            ],
            takeaways: [
                "Local change is possible and meaningful",
                "Showing up at city council matters more than Twitter debates",
                "Your neighbors are your best allies for local improvement",
                "Democracy works best when we start at home"
            ]
        ),

        // ═══════════════════════════════════════════════════════════════
        // GUIDE 4: Ballot Measure Discussion
        // ═══════════════════════════════════════════════════════════════

        DiscussionGuide(
            title: "Making Sense of the Ballot",
            subtitle: "Understanding and discussing ballot measures together",
            icon: "checkmark.rectangle.fill",
            duration: "45-60 minutes per measure",
            groupSize: "3-8 people",
            overview: """
            Ballot measures can be confusing. The language is often technical, and it's hard to know what a "Yes" or "No" vote actually means. This guide helps groups work through ballot measures together, hearing different perspectives before making individual decisions.

            Note: This is NOT about telling anyone how to vote. It's about understanding the issues fully.
            """,
            groundRules: [
                "We're here to understand, not to campaign",
                "Present both sides fairly, even if you have a preference",
                "Acknowledge what you don't know",
                "Respect that people will vote differently—and that's okay",
                "Focus on the measure itself, not the people behind it",
                "No judgment about anyone's final decision"
            ],
            openingQuestions: [
                "What's your initial understanding of this measure?",
                "What questions do you have about what it would do?",
                "Have you seen ads or information about this? What did they say?",
                "What would you need to know to feel confident voting on this?"
            ],
            deeperQuestions: [
                "What problem is this measure trying to solve?",
                "Who supports this measure? Who opposes it? Why?",
                "What are the strongest arguments FOR this measure?",
                "What are the strongest arguments AGAINST this measure?",
                "What are the potential unintended consequences?",
                "How would this affect our community specifically?",
                "Is there a middle ground or alternative approach?"
            ],
            closingQuestions: [
                "What's clearer to you now than when we started?",
                "What questions do you still have?",
                "Where can we find reliable, nonpartisan information?",
                "How do you feel about discussing this with others now?"
            ],
            facilitatorTips: [
                "Read the actual ballot language together, not just summaries",
                "Identify what's factual vs. what's opinion or prediction",
                "If you have a strong opinion, share it last and acknowledge bias",
                "Encourage people to steelman the opposing view",
                "Point people to official sources: SD Secretary of State, LRC analysis"
            ],
            takeaways: [
                "It's okay to be undecided—that means you're thinking carefully",
                "Talking through measures with others helps clarify your own thinking",
                "You can vote differently from your friends and still be friends",
                "An informed vote is more important than a quick vote"
            ]
        ),

        // ═══════════════════════════════════════════════════════════════
        // GUIDE 5: Youth Civic Engagement
        // ═══════════════════════════════════════════════════════════════

        DiscussionGuide(
            title: "Your Voice Matters",
            subtitle: "A discussion guide for young citizens (16-25)",
            icon: "graduationcap.fill",
            duration: "45-60 minutes",
            groupSize: "4-15 people",
            overview: """
            Young people are often told they're "the future"—but you're also the present. Your perspectives, concerns, and ideas matter now. This guide helps young people discuss civic issues, find their voice, and discover ways to make a difference.

            Designed for high school classes, college groups, or informal gatherings of young adults.
            """,
            groundRules: [
                "Every perspective is welcome—there are no wrong answers",
                "You don't need to be an expert to participate",
                "Respect different backgrounds and experiences",
                "It's okay to not know something—that's why we're learning",
                "Listen to understand, especially to those different from you",
                "What's shared here, stays here"
            ],
            openingQuestions: [
                "What's one issue that affects your daily life that you wish adults paid more attention to?",
                "Do you feel like your voice matters in our political system? Why or why not?",
                "What's your earliest memory of being aware of politics or government?",
                "If you could change one thing about our community tomorrow, what would it be?"
            ],
            deeperQuestions: [
                "What makes it hard for young people to get involved in civic life?",
                "Do you trust the government? Why or why not?",
                "What role should social media play in politics?",
                "How do you decide what news or information to trust?",
                "What issues do you think your generation will have to solve?",
                "What can young people do that older generations can't?",
                "If you could ask an elected official one question, what would it be?"
            ],
            closingQuestions: [
                "What's one way you could get more involved in your community?",
                "Who's someone you could talk to about these issues?",
                "What's something you learned from someone else in this discussion?",
                "What's one thing you want to learn more about?"
            ],
            facilitatorTips: [
                "Let young people lead the conversation as much as possible",
                "Don't lecture—facilitate and ask follow-up questions",
                "Validate frustrations while also highlighting agency",
                "Connect abstract issues to concrete local examples",
                "Share resources for getting involved (like this app!)"
            ],
            takeaways: [
                "You don't have to wait until you're older to make a difference",
                "Civic engagement is more than voting—it's showing up",
                "Your experiences give you unique insights that matter",
                "Democracy needs you—not someday, but now"
            ]
        )
    ]

    // MARK: - Helper Functions

    static func guideById(_ id: UUID) -> DiscussionGuide? {
        guides.first { $0.id == id }
    }
}

// MARK: - King Center Connection

struct KingCenterPrinciples {

    static let sixPrinciples = [
        KingPrinciple(
            number: 1,
            title: "Courageous Resistance",
            summary: "Active resistance to injustice, not passive acceptance",
            applicationToDialogue: "Engage difficult conversations with courage, not avoidance. Speaking up respectfully is an act of civic courage."
        ),
        KingPrinciple(
            number: 2,
            title: "Friendship and Understanding",
            summary: "The goal is reconciliation, creating \"Beloved Community\"",
            applicationToDialogue: "The goal of civic conversation isn't to win—it's to build understanding and community across differences."
        ),
        KingPrinciple(
            number: 3,
            title: "Targeting Evil, Not People",
            summary: "Distinguishing between wrongdoers and wrong actions",
            applicationToDialogue: "Challenge ideas and policies, not the people who hold them. Separate the person from the position."
        ),
        KingPrinciple(
            number: 4,
            title: "Redemptive Suffering",
            summary: "Voluntary suffering for justice can educate and transform",
            applicationToDialogue: "Sometimes listening to views that frustrate us is uncomfortable—but that discomfort can lead to growth."
        ),
        KingPrinciple(
            number: 5,
            title: "Love Over Hate",
            summary: "Resisting through understanding and creative love",
            applicationToDialogue: "Approach even those you disagree with strongly with empathy. Seek to understand their humanity."
        ),
        KingPrinciple(
            number: 6,
            title: "Faith in Justice",
            summary: "Deep conviction that justice will ultimately prevail",
            applicationToDialogue: "Have faith that dialogue, over time, bends communities toward understanding and justice."
        )
    ]
}

struct KingPrinciple: Identifiable {
    let id = UUID()
    let number: Int
    let title: String
    let summary: String
    let applicationToDialogue: String
}
