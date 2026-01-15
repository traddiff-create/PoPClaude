//
//  EngageView.swift
//  PoP
//
//  Hub view for civic engagement features.
//

import SwiftUI

struct EngageView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    headerSection

                    // Feature Cards
                    featureCardsSection

                    // Info Section
                    infoSection
                }
                .padding()
            }
            .background(Color.popLightBackground)
            .navigationTitle("Engage")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    // MARK: - Header Section

    private var headerSection: some View {
        VStack(spacing: 12) {
            Image(systemName: "lightbulb.fill")
                .font(.system(size: 48))
                .foregroundColor(.popGold)

            Text("Civic Engagement Hub")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.popDarkBlue)

            Text("Tools to help you become a more informed and engaged citizen")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }

    // MARK: - Feature Cards Section

    private var featureCardsSection: some View {
        VStack(spacing: 16) {
            // Discussion Guides
            NavigationLink(destination: DiscussionGuidesView()) {
                EngageFeatureCard(
                    icon: "bubble.left.and.bubble.right.fill",
                    title: "Discussion Guides",
                    subtitle: "Structured guides for productive political conversations",
                    color: .popBlue
                )
            }
            .buttonStyle(PlainButtonStyle())

            // Event Hosting Guide
            NavigationLink(destination: EventHostingGuideView()) {
                EngageFeatureCard(
                    icon: "calendar.badge.plus",
                    title: "Host an Event",
                    subtitle: "Resources for organizing civic events in your community",
                    color: .popGold
                )
            }
            .buttonStyle(PlainButtonStyle())

            // Common Ground Finder
            NavigationLink(destination: CommonGroundQuizView()) {
                EngageFeatureCard(
                    icon: "heart.circle.fill",
                    title: "Common Ground Finder",
                    subtitle: "Discover your core values and find shared ground with others",
                    color: .purple
                )
            }
            .buttonStyle(PlainButtonStyle())

            // Issue Explorer
            NavigationLink(destination: IssueExplorerView()) {
                EngageFeatureCard(
                    icon: "doc.text.magnifyingglass",
                    title: "Issue Explorer",
                    subtitle: "Understand political issues from multiple perspectives",
                    color: .orange
                )
            }
            .buttonStyle(PlainButtonStyle())

            // Candidate Research
            NavigationLink(destination: CandidateResearchView()) {
                EngageFeatureCard(
                    icon: "person.fill.questionmark",
                    title: "Research Candidates",
                    subtitle: "Your voter's self-defense guide to evaluating candidates",
                    color: .teal
                )
            }
            .buttonStyle(PlainButtonStyle())

            // Recommended Reading
            NavigationLink(destination: ReadingListView()) {
                EngageFeatureCard(
                    icon: "books.vertical.fill",
                    title: "Recommended Reading",
                    subtitle: "Curated books, podcasts, and resources for civic learning",
                    color: .indigo
                )
            }
            .buttonStyle(PlainButtonStyle())
        }
    }

    // MARK: - Info Section

    private var infoSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.popBlue)
                Text("About These Resources")
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
            }

            Text("These tools are designed to help you engage with civic issues thoughtfully and respectfully. We present multiple perspectives without telling you what to think.")
                .font(.caption)
                .foregroundColor(.secondary)

            Text("Our goal is informed citizenship, not partisan conversion.")
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.popGold)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    EngageView()
}
