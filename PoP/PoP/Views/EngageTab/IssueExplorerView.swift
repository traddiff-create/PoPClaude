//
//  IssueExplorerView.swift
//  PoP
//
//  List view for exploring political issues.
//

import SwiftUI

struct IssueExplorerView: View {
    let issues = IssueExplorerData.allIssues

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Disclaimer
                disclaimerSection

                // Issue Cards
                ForEach(issues) { issue in
                    NavigationLink(destination: IssueDetailView(issue: issue)) {
                        issueCard(issue)
                    }
                    .buttonStyle(PlainButtonStyle())
                }

                // Coming Soon
                comingSoonSection
            }
            .padding()
        }
        .background(Color.popLightBackground)
        .navigationTitle("Issue Explorer")
        .navigationBarTitleDisplayMode(.large)
    }

    // MARK: - Disclaimer Section

    private var disclaimerSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.popBlue)
                Text("How to Use This")
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
            }

            Text(IssueExplorerData.disclaimer)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }

    // MARK: - Issue Card

    private func issueCard(_ issue: PoliticalIssue) -> some View {
        HStack(spacing: 16) {
            Image(systemName: issue.icon)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 56, height: 56)
                .background(Color.popBlue)
                .cornerRadius(14)

            VStack(alignment: .leading, spacing: 6) {
                Text(issue.name)
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
                Text(issue.summary)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)

                HStack(spacing: 12) {
                    Label("\(issue.perspectives.count) perspectives", systemImage: "person.3")
                    Label("\(issue.keyTerms.count) terms", systemImage: "textformat.abc")
                }
                .font(.caption2)
                .foregroundColor(.popGold)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
    }

    // MARK: - Coming Soon Section

    private var comingSoonSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("More Topics Coming")
                .font(.headline)
                .foregroundColor(.popDarkBlue)

            Text("We're working on balanced explorations of these additional issues:")
                .font(.caption)
                .foregroundColor(.secondary)

            FlowLayout(spacing: 8) {
                ForEach(IssueExplorerData.additionalTopics, id: \.self) { topic in
                    Text(topic)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Flow Layout

struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
        return result.size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.positions[index].x,
                                       y: bounds.minY + result.positions[index].y),
                          proposal: .unspecified)
        }
    }

    struct FlowResult {
        var size: CGSize = .zero
        var positions: [CGPoint] = []

        init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var x: CGFloat = 0
            var y: CGFloat = 0
            var rowHeight: CGFloat = 0

            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                if x + size.width > maxWidth && x > 0 {
                    x = 0
                    y += rowHeight + spacing
                    rowHeight = 0
                }
                positions.append(CGPoint(x: x, y: y))
                rowHeight = max(rowHeight, size.height)
                x += size.width + spacing
            }

            self.size = CGSize(width: maxWidth, height: y + rowHeight)
        }
    }
}

#Preview {
    NavigationStack {
        IssueExplorerView()
    }
}
