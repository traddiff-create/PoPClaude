//
//  DiscussionGuideDetailView.swift
//  PoP
//
//  Detail view for a single discussion guide.
//

import SwiftUI

struct DiscussionGuideDetailView: View {
    let guide: DiscussionGuide

    @State private var overviewExpanded = true
    @State private var groundRulesExpanded = false
    @State private var openingExpanded = false
    @State private var deeperExpanded = false
    @State private var closingExpanded = false
    @State private var tipsExpanded = false
    @State private var takeawaysExpanded = false

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header
                headerSection

                // Sections
                ExpandableSection(title: "Overview", icon: "doc.text", isExpanded: $overviewExpanded) {
                    Text(guide.overview)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                ExpandableSection(title: "Ground Rules", icon: "checkmark.shield", isExpanded: $groundRulesExpanded) {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(guide.groundRules, id: \.self) { rule in
                            HStack(alignment: .top, spacing: 10) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.popGold)
                                    .font(.caption)
                                Text(rule)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }

                ExpandableSection(title: "Opening Questions", icon: "bubble.left", isExpanded: $openingExpanded) {
                    questionsList(guide.openingQuestions)
                }

                ExpandableSection(title: "Deeper Questions", icon: "bubble.left.and.bubble.right", isExpanded: $deeperExpanded) {
                    questionsList(guide.deeperQuestions)
                }

                ExpandableSection(title: "Closing Questions", icon: "bubble.right", isExpanded: $closingExpanded) {
                    questionsList(guide.closingQuestions)
                }

                ExpandableSection(title: "Facilitator Tips", icon: "lightbulb", isExpanded: $tipsExpanded) {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(guide.facilitatorTips, id: \.self) { tip in
                            TipRow(icon: "lightbulb.fill", text: tip, iconColor: .orange)
                        }
                    }
                }

                ExpandableSection(title: "Key Takeaways", icon: "star", isExpanded: $takeawaysExpanded) {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(guide.takeaways, id: \.self) { takeaway in
                            HStack(alignment: .top, spacing: 10) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.popGold)
                                    .font(.caption)
                                Text(takeaway)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color.popLightBackground)
        .navigationTitle(guide.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Header Section

    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: guide.icon)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(Color.popBlue)
                .cornerRadius(20)

            Text(guide.subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            HStack(spacing: 20) {
                Label(guide.duration, systemImage: "clock")
                Label(guide.groupSize, systemImage: "person.2")
            }
            .font(.caption)
            .foregroundColor(.popGold)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
    }

    // MARK: - Questions List

    private func questionsList(_ questions: [String]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(Array(questions.enumerated()), id: \.offset) { index, question in
                HStack(alignment: .top, spacing: 10) {
                    Text("\(index + 1).")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.popBlue)
                        .frame(width: 24, alignment: .leading)
                    Text(question)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DiscussionGuideDetailView(guide: DiscussionGuidesData.guides[0])
    }
}
