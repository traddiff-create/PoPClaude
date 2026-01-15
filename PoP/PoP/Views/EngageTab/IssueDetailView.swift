//
//  IssueDetailView.swift
//  PoP
//
//  Detail view for a single political issue with tabbed content.
//

import SwiftUI

struct IssueDetailView: View {
    let issue: PoliticalIssue

    @State private var selectedTab = 0

    var body: some View {
        VStack(spacing: 0) {
            // Tab Picker
            Picker("Section", selection: $selectedTab) {
                Text("Overview").tag(0)
                Text("Views").tag(1)
                Text("Terms").tag(2)
                Text("Learn More").tag(3)
            }
            .pickerStyle(.segmented)
            .padding()

            // Tab Content
            TabView(selection: $selectedTab) {
                overviewTab.tag(0)
                perspectivesTab.tag(1)
                termsTab.tag(2)
                resourcesTab.tag(3)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .background(Color.popLightBackground)
        .navigationTitle(issue.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Overview Tab

    private var overviewTab: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(spacing: 12) {
                    Image(systemName: issue.icon)
                        .font(.system(size: 48))
                        .foregroundColor(.popBlue)

                    Text(issue.summary)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding()

                // Key Questions
                VStack(alignment: .leading, spacing: 12) {
                    Text("Key Questions")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    ForEach(Array(issue.keyQuestions.enumerated()), id: \.offset) { index, question in
                        HStack(alignment: .top, spacing: 12) {
                            Text("\(index + 1).")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.popDarkBlue)
                                .frame(width: 24)
                            Text(question)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)

                // Common Ground
                if let commonGround = issue.commonGround {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            Image(systemName: "hands.clap.fill")
                                .foregroundColor(.popDarkBlue)
                            Text("Where Most Agree")
                                .font(.headline)
                                .foregroundColor(.popDarkBlue)
                        }

                        Text(commonGround)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                }
            }
            .padding()
        }
    }

    // MARK: - Perspectives Tab

    private var perspectivesTab: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Understanding Different Views")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top)

                ForEach(issue.perspectives) { perspective in
                    PerspectiveCard(perspective: perspective)
                }
            }
            .padding()
        }
    }

    // MARK: - Terms Tab

    private var termsTab: some View {
        ScrollView {
            VStack(spacing: 12) {
                Text("Language Matters")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top)

                Text("Different groups often use different terms for the same concepts. Understanding this helps you communicate across differences.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                ForEach(issue.keyTerms) { term in
                    KeyTermRow(term: term)
                }
            }
            .padding()
        }
    }

    // MARK: - Resources Tab

    private var resourcesTab: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Further Reading")
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)

                Text("Explore multiple sources with different perspectives to form your own views.")
                    .font(.caption)
                    .foregroundColor(.secondary)

                ForEach(issue.furtherReading) { resource in
                    resourceRow(resource)
                }
            }
            .padding()
        }
    }

    private func resourceRow(_ resource: IssueResource) -> some View {
        Link(destination: URL(string: resource.url)!) {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(resource.title)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.popDarkBlue)

                    if let perspective = resource.perspective {
                        Text(perspective)
                            .font(.caption2)
                            .foregroundColor(perspectiveColor(perspective))
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(perspectiveColor(perspective).opacity(0.1))
                            .cornerRadius(4)
                    }
                }

                Spacer()

                Image(systemName: "arrow.up.right")
                    .foregroundColor(.popBlue)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
        }
    }

    private func perspectiveColor(_ perspective: String) -> Color {
        switch perspective {
        case "Left-leaning":
            return .blue
        case "Right-leaning":
            return .red
        case "Nonpartisan", "Scientific consensus":
            return .popDarkBlue
        default:
            return .secondary
        }
    }
}

#Preview {
    NavigationStack {
        IssueDetailView(issue: IssueExplorerData.immigration)
    }
}
