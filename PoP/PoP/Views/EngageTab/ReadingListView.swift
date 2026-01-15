//
//  ReadingListView.swift
//  PoP
//
//  Curated reading list with books, podcasts, and organizations.
//

import SwiftUI

struct ReadingListView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack(spacing: 0) {
            // Tab Picker
            Picker("Content", selection: $selectedTab) {
                Text("Books").tag(0)
                Text("Podcasts").tag(1)
                Text("Organizations").tag(2)
            }
            .pickerStyle(.segmented)
            .padding()

            // Tab Content
            TabView(selection: $selectedTab) {
                booksTab.tag(0)
                podcastsTab.tag(1)
                organizationsTab.tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .background(Color.popLightBackground)
        .navigationTitle("Recommended Reading")
        .navigationBarTitleDisplayMode(.large)
    }

    // MARK: - Books Tab

    private var booksTab: some View {
        ScrollView {
            VStack(spacing: 20) {
                introSection

                ForEach(RecommendedReadingData.allCategories) { category in
                    categorySection(category)
                }
            }
            .padding()
        }
    }

    private var introSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "books.vertical.fill")
                    .foregroundColor(.popBlue)
                Text("Curated for Understanding")
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
            }

            Text("These books offer diverse perspectives on democracy, civic life, and bridging divides. We've included voices from across the political spectrum.")
                .font(.caption)
                .foregroundColor(.secondary)

            HStack(spacing: 16) {
                Label("All available at libraries", systemImage: "building.columns")
                    .font(.caption2)
                    .foregroundColor(.popGold)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }

    private func categorySection(_ category: ReadingCategory) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: category.icon)
                    .foregroundColor(.popGold)
                Text(category.name)
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
            }

            Text(category.description)
                .font(.caption)
                .foregroundColor(.secondary)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach(category.books) { book in
                    BookCard(book: book)
                }
            }
        }
    }

    // MARK: - Podcasts Tab

    private var podcastsTab: some View {
        ScrollView {
            VStack(spacing: 16) {
                podcastIntroSection

                ForEach(RecommendedReadingData.podcasts) { podcast in
                    PodcastCard(podcast: podcast)
                }
            }
            .padding()
        }
    }

    private var podcastIntroSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "mic.fill")
                    .foregroundColor(.popBlue)
                Text("Listen & Learn")
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
            }

            Text("Podcasts that explore ideas from multiple perspectives and encourage thoughtful civic engagement.")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }

    // MARK: - Organizations Tab

    private var organizationsTab: some View {
        ScrollView {
            VStack(spacing: 16) {
                orgIntroSection

                ForEach(RecommendedReadingData.organizations) { org in
                    organizationCard(org)
                }
            }
            .padding()
        }
    }

    private var orgIntroSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "person.3.fill")
                    .foregroundColor(.popBlue)
                Text("Get Involved")
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
            }

            Text("Nonpartisan organizations working to strengthen democracy and civic engagement.")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }

    private func organizationCard(_ org: OrganizationResource) -> some View {
        Link(destination: URL(string: org.url)!) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(org.name)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.popDarkBlue)

                    Spacer()

                    Image(systemName: "arrow.up.right")
                        .foregroundColor(.popBlue)
                }

                Text(org.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(3)

                Text(org.focus)
                    .font(.caption2)
                    .foregroundColor(.popGold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.popGold.opacity(0.1))
                    .cornerRadius(4)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
        }
    }
}

#Preview {
    NavigationStack {
        ReadingListView()
    }
}
