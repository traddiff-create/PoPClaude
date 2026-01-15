//
//  CivicEventHostingGuide.swift
//  PoP
//
//  Complete guide for hosting civic engagement events.
//  From planning to facilitation to follow-up.
//

import Foundation

// MARK: - Hosting Guide Model

struct HostingGuide: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let sections: [HostingSection]
}

struct HostingSection: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let checklist: [ChecklistItem]?
    let tips: [String]?
}

struct ChecklistItem: Identifiable {
    let id = UUID()
    let text: String
    let category: String?
}

// MARK: - Complete Hosting Guide Data

struct CivicEventHostingData {

    // ═══════════════════════════════════════════════════════════════════════
    // MAIN HOSTING GUIDE
    // ═══════════════════════════════════════════════════════════════════════

    static let completeGuide = HostingGuide(
        title: "How to Host a Civic Event",
        icon: "calendar.badge.plus",
        sections: [

            // SECTION 1: Planning
            HostingSection(
                title: "Planning Your Event",
                content: """
                Great civic events don't happen by accident. Whether you're hosting a town hall, discussion group, voter registration drive, or community forum, thoughtful planning makes the difference between a productive gathering and a frustrating one.

                Start planning at least 2-4 weeks in advance for small events, 6-8 weeks for larger ones.
                """,
                checklist: [
                    ChecklistItem(text: "Define your purpose - What do you want attendees to walk away with?", category: "Purpose"),
                    ChecklistItem(text: "Identify your audience - Who needs to be in the room?", category: "Purpose"),
                    ChecklistItem(text: "Set a realistic goal - One focused outcome is better than many vague ones", category: "Purpose"),
                    ChecklistItem(text: "Choose a neutral venue - Libraries, community centers, churches (if nonpartisan)", category: "Logistics"),
                    ChecklistItem(text: "Pick a time that works for working people - Evenings or weekends", category: "Logistics"),
                    ChecklistItem(text: "Plan for accessibility - ADA compliance, parking, transit access", category: "Logistics"),
                    ChecklistItem(text: "Arrange seating for dialogue - Circles or small groups, not lecture-style", category: "Logistics"),
                    ChecklistItem(text: "Prepare materials - Agendas, name tags, handouts, sign-in sheets", category: "Materials"),
                    ChecklistItem(text: "Test any technology - Projectors, microphones, Zoom if hybrid", category: "Materials"),
                    ChecklistItem(text: "Have water and light refreshments - People connect over food", category: "Materials"),
                    ChecklistItem(text: "Recruit a facilitator - Someone neutral who can guide discussion", category: "People"),
                    ChecklistItem(text: "Invite diverse perspectives - Actively reach across political lines", category: "People"),
                    ChecklistItem(text: "Designate a note-taker - Capture key points and action items", category: "People"),
                    ChecklistItem(text: "Promote widely - Social media, flyers, word of mouth, local media", category: "Outreach"),
                    ChecklistItem(text: "Send reminders - 1 week before and day-of", category: "Outreach")
                ],
                tips: [
                    "Co-host with someone from a different political perspective to signal nonpartisanship",
                    "Avoid election season if you want to keep things nonpartisan",
                    "Have a backup plan for weather or low turnout",
                    "Consider childcare to increase accessibility"
                ]
            ),

            // SECTION 2: Setting Ground Rules
            HostingSection(
                title: "Establishing Ground Rules",
                content: """
                Ground rules create psychological safety and set expectations. Without them, one difficult person can derail an entire event. Post them visibly and review them at the start.

                Good ground rules are clear, brief, and focused on behavior (not beliefs).
                """,
                checklist: [
                    ChecklistItem(text: "Post ground rules visibly where everyone can see", category: nil),
                    ChecklistItem(text: "Review rules at the start - don't assume people read them", category: nil),
                    ChecklistItem(text: "Ask for verbal agreement from the group", category: nil),
                    ChecklistItem(text: "Explain consequences for violations (gentle redirection first)", category: nil),
                    ChecklistItem(text: "Model the rules yourself", category: nil)
                ],
                tips: [
                    "Let the group add one or two of their own rules",
                    "Frame rules positively (\"Do this\" rather than \"Don't do that\")",
                    "Humor helps: \"We're all adults here, but just in case...\""
                ]
            ),

            // SECTION 3: Facilitation
            HostingSection(
                title: "Facilitation Techniques",
                content: """
                A good facilitator is like a referee: mostly invisible when things go well, essential when they don't. Your job is to guide the process, not dominate the content.

                The best facilitators talk less than anyone else in the room.
                """,
                checklist: nil,
                tips: [
                    "**Opening:** Start with an easy, non-threatening question to get people talking",
                    "**Equal time:** Watch for who's dominating and who's silent. Actively invite quieter voices.",
                    "**Paraphrasing:** \"So what I hear you saying is...\" confirms understanding and slows things down",
                    "**Bridging:** \"Sarah, you mentioned X. Tom, how does that connect to what you said about Y?\"",
                    "**Parking lot:** Write off-topic but important issues on a board to address later",
                    "**Time management:** Give warnings (\"We have 10 minutes left on this topic\")",
                    "**Neutrality:** If you have a strong opinion, don't share it—or share it last with a disclaimer",
                    "**Body language:** Stand up to regain control, sit down to reduce your presence",
                    "**Energy:** If energy drops, take a break or switch to small group discussion"
                ]
            ),

            // SECTION 4: De-escalation
            HostingSection(
                title: "De-escalation Strategies",
                content: """
                Even well-planned events can get heated. Having de-escalation strategies ready helps you stay calm and keep the conversation productive.

                Remember: Most people aren't trying to be difficult—they're passionate about something that matters to them.
                """,
                checklist: nil,
                tips: [
                    "**Stay calm:** Your energy sets the tone. Take a breath before responding.",
                    "**Acknowledge feelings:** \"I can see this is really important to you.\"",
                    "**Find the kernel of truth:** Even in an extreme statement, there's usually a legitimate concern underneath.",
                    "**Redirect to values:** \"It sounds like we all care about fairness—we just see the path differently.\"",
                    "**Take a break:** \"Let's pause for 5 minutes, grab some water, and come back fresh.\"",
                    "**Change format:** Switch from large group to pairs—people are less performative one-on-one.",
                    "**Ask a clarifying question:** \"Help me understand what you mean by that.\" (Slows things down)",
                    "**Use \"Yes, and...\":** Validate before adding perspective. \"Yes, that's a real concern, and there's also...\"",
                    "**Private conversation:** If one person is derailing, speak with them during a break.",
                    "**Last resort:** \"We agreed to ground rules. I'm going to ask us all to recommit to them.\""
                ]
            ),

            // SECTION 5: Handling Difficult Situations
            HostingSection(
                title: "Handling Difficult Situations",
                content: """
                Every facilitator faces challenging moments. Here are specific scenarios and how to handle them.
                """,
                checklist: nil,
                tips: [
                    "**The Dominator:** \"Thank you, John. Let's hear from someone who hasn't spoken yet.\" Or: \"John, can you summarize your point in one sentence so we can hear other views?\"",
                    "**The Silent Ones:** \"We've heard some great points. Who hasn't had a chance to share yet?\" Or use round-robin: everyone answers briefly in turn.",
                    "**The Personal Attacker:** \"Let's keep our comments focused on ideas, not individuals. Can you reframe that as a critique of the policy?\"",
                    "**The Fact-Denier:** Don't debate facts in the moment. \"That's a factual claim we can look up later. For now, let's focus on values and perspectives.\"",
                    "**The Emotional Outburst:** \"I can see you feel strongly about this. Would you like to take a moment?\" Let them speak, then gently redirect.",
                    "**The Off-Topic Rambler:** \"That's interesting—let me add it to our parking lot. For now, can we return to [topic]?\"",
                    "**The Know-It-All:** \"Thanks for that expertise. Let's also hear from people with different experiences.\"",
                    "**Two People Arguing:** \"Let's pause this one-on-one. Both of you have made your points—let's hear from others.\""
                ]
            ),

            // SECTION 6: Closing Well
            HostingSection(
                title: "Closing Your Event",
                content: """
                How you end matters as much as how you begin. A strong close leaves people feeling their time was well spent and gives them something to do next.
                """,
                checklist: [
                    ChecklistItem(text: "Summarize key points and areas of agreement", category: nil),
                    ChecklistItem(text: "Acknowledge areas of disagreement without relitigating them", category: nil),
                    ChecklistItem(text: "Identify concrete next steps or action items", category: nil),
                    ChecklistItem(text: "Thank participants for their time and willingness to engage", category: nil),
                    ChecklistItem(text: "Share how people can stay connected (email list, next event)", category: nil),
                    ChecklistItem(text: "End on time—respect people's schedules", category: nil),
                    ChecklistItem(text: "Give a closing round: \"One word for how you're leaving this conversation\"", category: nil)
                ],
                tips: [
                    "Even if the conversation was difficult, find something positive to highlight",
                    "Avoid introducing new topics in the last 10 minutes",
                    "Have sign-up sheets ready for people who want to continue engaging",
                    "Thank your facilitator, venue host, and volunteers publicly"
                ]
            ),

            // SECTION 7: Follow-Up
            HostingSection(
                title: "After the Event",
                content: """
                The event is just the beginning. Follow-up determines whether the conversation leads to action or fades away.
                """,
                checklist: [
                    ChecklistItem(text: "Send thank-you email within 24-48 hours", category: "Within 48 hours"),
                    ChecklistItem(text: "Share summary of key points and any action items", category: "Within 48 hours"),
                    ChecklistItem(text: "Include resources mentioned during the event", category: "Within 48 hours"),
                    ChecklistItem(text: "Ask for feedback - what worked? what didn't?", category: "Within 1 week"),
                    ChecklistItem(text: "Connect people who wanted to follow up with each other", category: "Within 1 week"),
                    ChecklistItem(text: "Plan your next event based on what you learned", category: "Within 2 weeks"),
                    ChecklistItem(text: "Share outcomes publicly (social media, newsletter)", category: "Within 2 weeks"),
                    ChecklistItem(text: "Follow through on any commitments you made", category: "Ongoing")
                ],
                tips: [
                    "Photos help promote future events (get permission first)",
                    "A short feedback survey can provide valuable insights",
                    "Celebrate small wins—every productive conversation matters"
                ]
            )
        ]
    )

    // ═══════════════════════════════════════════════════════════════════════
    // QUICK REFERENCE CARDS
    // ═══════════════════════════════════════════════════════════════════════

    static let quickReferenceCards = [

        QuickReferenceCard(
            title: "Before the Event",
            items: [
                "✓ Venue confirmed and accessible",
                "✓ Materials printed and ready",
                "✓ Technology tested",
                "✓ Facilitator briefed",
                "✓ Ground rules posted",
                "✓ Refreshments available",
                "✓ Sign-in sheet ready"
            ]
        ),

        QuickReferenceCard(
            title: "Facilitator Phrases",
            items: [
                "\"Tell me more about that.\"",
                "\"What I hear you saying is...\"",
                "\"How does that connect to what [name] said?\"",
                "\"Let's hear from someone else.\"",
                "\"That's a great point for our parking lot.\"",
                "\"Can you say more about the 'why' behind that?\"",
                "\"Where do you see common ground?\""
            ]
        ),

        QuickReferenceCard(
            title: "De-escalation Phrases",
            items: [
                "\"I can see this matters a lot to you.\"",
                "\"Let's take a breath and slow down.\"",
                "\"Help me understand your perspective.\"",
                "\"We agreed to respect each other's views.\"",
                "\"Let's focus on the issue, not each other.\"",
                "\"Would a 5-minute break help?\"",
                "\"What outcome would you like to see?\""
            ]
        ),

        QuickReferenceCard(
            title: "Closing Phrases",
            items: [
                "\"What's one thing you're taking away?\"",
                "\"Where did we find agreement?\"",
                "\"What's one thing we could do next?\"",
                "\"Thank you for being willing to engage.\"",
                "\"Democracy depends on conversations like this.\""
            ]
        )
    ]
}

struct QuickReferenceCard: Identifiable {
    let id = UUID()
    let title: String
    let items: [String]
}

// MARK: - Event Types

enum CivicEventType: String, CaseIterable {
    case townHall = "Town Hall"
    case discussionGroup = "Discussion Group"
    case voterRegistration = "Voter Registration Drive"
    case candidateForum = "Candidate Forum"
    case issueWorkshop = "Issue Workshop"
    case communityListening = "Community Listening Session"
    case bookClub = "Civic Book Club"
    case watchParty = "Debate/Hearing Watch Party"

    var description: String {
        switch self {
        case .townHall:
            return "Open forum where citizens can ask questions of elected officials or candidates."
        case .discussionGroup:
            return "Small group conversation focused on understanding different perspectives."
        case .voterRegistration:
            return "Event focused on helping eligible citizens register to vote."
        case .candidateForum:
            return "Structured event where candidates present their positions and answer questions."
        case .issueWorkshop:
            return "Educational session diving deep into a specific policy issue."
        case .communityListening:
            return "Session where leaders or organizers listen to community concerns."
        case .bookClub:
            return "Group discussion of a book related to civics, democracy, or current issues."
        case .watchParty:
            return "Gathering to watch and discuss a debate, hearing, or civic event together."
        }
    }

    var icon: String {
        switch self {
        case .townHall: return "person.3.sequence.fill"
        case .discussionGroup: return "bubble.left.and.bubble.right.fill"
        case .voterRegistration: return "pencil.and.list.clipboard"
        case .candidateForum: return "person.2.fill"
        case .issueWorkshop: return "lightbulb.fill"
        case .communityListening: return "ear.fill"
        case .bookClub: return "book.fill"
        case .watchParty: return "tv.fill"
        }
    }

    var suggestedDuration: String {
        switch self {
        case .townHall: return "90-120 minutes"
        case .discussionGroup: return "60-90 minutes"
        case .voterRegistration: return "2-4 hours"
        case .candidateForum: return "90-120 minutes"
        case .issueWorkshop: return "60-90 minutes"
        case .communityListening: return "90-120 minutes"
        case .bookClub: return "60-90 minutes"
        case .watchParty: return "Duration of event + 30 min discussion"
        }
    }

    var suggestedGroupSize: String {
        switch self {
        case .townHall: return "20-100+ people"
        case .discussionGroup: return "6-15 people"
        case .voterRegistration: return "Any size"
        case .candidateForum: return "30-200+ people"
        case .issueWorkshop: return "10-30 people"
        case .communityListening: return "15-50 people"
        case .bookClub: return "5-15 people"
        case .watchParty: return "5-30 people"
        }
    }
}
