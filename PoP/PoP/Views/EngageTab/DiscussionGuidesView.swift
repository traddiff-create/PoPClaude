//
//  DiscussionGuidesView.swift
//  PoP
//
//  List view showing all discussion guides.
//

import SwiftUI

struct DiscussionGuidesView: View {
    let guides = DiscussionGuidesData.guides

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Introduction
                introSection

                // Guide Cards
                ForEach(guides) { guide in
                    NavigationLink(destination: DiscussionGuideDetailView(guide: guide)) {
                        DiscussionGuideCard(guide: guide)
                    }
                    .buttonStyle(PlainButtonStyle())
                }

                // King Center Reference
                kingCenterSection
            }
            .padding()
        }
        .background(Color.popLightBackground)
        .navigationTitle("Discussion Guides")
        .navigationBarTitleDisplayMode(.large)
    }

    // MARK: - Introduction Section

    private var introSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .foregroundColor(.popBlue)
                Text("Structured Conversations")
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
            }

            Text("These guides provide frameworks for having productive political conversations. Each includes ground rules, questions, and facilitator tips.")
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack(spacing: 16) {
                Label("\(guides.count) guides", systemImage: "doc.text")
                Label("All skill levels", systemImage: "person.2")
            }
            .font(.caption)
            .foregroundColor(.popDarkBlue)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }

    // MARK: - King Center Section

    private var kingCenterSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.popDarkBlue)
                Text("Inspired by Dr. King")
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
            }

            Text("These guides are inspired by the King Center's Six Principles of Nonviolence, which teach us to seek understanding and build community even in disagreement.")
                .font(.caption)
                .foregroundColor(.secondary)

            Link(destination: URL(string: "https://thekingcenter.org/about-tkc/the-king-philosophy/")!) {
                HStack {
                    Text("Learn more at The King Center")
                        .font(.caption)
                        .fontWeight(.medium)
                    Image(systemName: "arrow.up.right")
                        .font(.caption)
                }
                .foregroundColor(.popBlue)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    NavigationStack {
        DiscussionGuidesView()
    }
}
