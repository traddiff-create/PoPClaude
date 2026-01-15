//
//  CommonGroundResultsView.swift
//  PoP
//
//  Shows quiz results and top values.
//

import SwiftUI

struct CommonGroundResultsView: View {
    let answers: [(questionIndex: Int, optionIndex: Int)]

    @State private var topValues: [CoreValue] = []
    @State private var showShareSheet = false

    private var shareableProfile: ShareableValuesProfile {
        ShareableValuesProfile(topValues: topValues, createdAt: Date())
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection

                // Top Values
                topValuesSection

                // Insight
                insightSection

                // Share Card Preview
                shareCardSection

                // What This Means
                whatThisMeansSection

                // Share Button
                shareButton
            }
            .padding()
        }
        .background(Color.popLightBackground)
        .navigationTitle("Your Values")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            topValues = CommonGroundFinder.calculateTopValues(from: answers)
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(activityItems: [shareableProfile.shareText])
        }
    }

    // MARK: - Header Section

    private var headerSection: some View {
        VStack(spacing: 12) {
            Image(systemName: "sparkles")
                .font(.system(size: 48))
                .foregroundColor(.popGold)

            Text("Your Core Values")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.popDarkBlue)

            Text("Based on your answers, these are the values you prioritize most")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }

    // MARK: - Top Values Section

    private var topValuesSection: some View {
        VStack(spacing: 12) {
            ForEach(Array(topValues.prefix(5).enumerated()), id: \.element.id) { index, value in
                ValueResultRow(value: value, rank: index + 1)
            }
        }
    }

    // MARK: - Insight Section

    private var insightSection: some View {
        Group {
            if let insight = shareableProfile.bridgingStatement {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 8) {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(.orange)
                        Text("Common Ground Insight")
                            .font(.headline)
                            .foregroundColor(.popDarkBlue)
                    }

                    Text(insight)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
            }
        }
    }

    // MARK: - Share Card Section

    private var shareCardSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Share Your Values")
                .font(.headline)
                .foregroundColor(.popDarkBlue)

            ShareableResultsCard(
                topValues: topValues,
                insight: shareableProfile.summaryText
            )
        }
    }

    // MARK: - What This Means Section

    private var whatThisMeansSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("What This Means")
                .font(.headline)
                .foregroundColor(.popDarkBlue)

            VStack(alignment: .leading, spacing: 8) {
                meaningRow(icon: "person.2.fill", text: "You share these values with millions of Americans across the political spectrum")
                meaningRow(icon: "arrow.triangle.branch", text: "People who share your values may still support different policies—that's normal")
                meaningRow(icon: "bubble.left.and.bubble.right", text: "Use your values as starting points for conversations across differences")
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }

    private func meaningRow(icon: String, text: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.popBlue)
                .frame(width: 24)
            Text(text)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }

    // MARK: - Share Button

    private var shareButton: some View {
        Button {
            showShareSheet = true
        } label: {
            HStack {
                Image(systemName: "square.and.arrow.up")
                Text("Share My Values")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.popBlue)
            .cornerRadius(12)
        }
    }
}

// MARK: - Share Sheet
// Note: Uses ShareSheet defined in ConnectView.swift

#Preview {
    NavigationStack {
        CommonGroundResultsView(answers: [
            (questionIndex: 0, optionIndex: 0),
            (questionIndex: 1, optionIndex: 1),
            (questionIndex: 2, optionIndex: 2),
            (questionIndex: 3, optionIndex: 0),
            (questionIndex: 4, optionIndex: 1)
        ])
    }
}
