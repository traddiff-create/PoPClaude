//
//  AboutView.swift
//  PoP
//
//  Organization info and mission
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Logo and tagline
                    VStack(spacing: 16) {
                        Image(systemName: "person.3.sequence.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.popBlue, .popGold],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )

                        Text("Better Together")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.popDarkBlue)

                        Text("People Over Party")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.popDarkBlue)

                        Text("Rapid City, South Dakota")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 20)

                    // Mission
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeader(title: "Our Mission", icon: "star.fill")

                        Text("Better Together: People Over Party is a political action committee dedicated to promoting civic engagement, voter education, and community building in South Dakota.")
                            .font(.body)
                            .foregroundColor(.popDarkBlue)

                        Text("We believe that democracy works best when citizens are informed, engaged, and working together regardless of party affiliation. We don't tell people how to vote; we help them understand how to participate.")
                            .font(.body)
                            .foregroundColor(.popDarkBlue)
                    }
                    .padding()
                    .cardStyle()

                    // Values
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeader(title: "Our Values", icon: "heart.fill")

                        ValueRow(
                            icon: "person.2.fill",
                            title: "Community First",
                            description: "We believe our neighbors are more important than any party label."
                        )

                        ValueRow(
                            icon: "book.fill",
                            title: "Education",
                            description: "Informed citizens make better decisions for themselves and their communities."
                        )

                        ValueRow(
                            icon: "hand.raised.fill",
                            title: "Participation",
                            description: "Democracy requires active engagement from all of us."
                        )

                        ValueRow(
                            icon: "bubble.left.and.bubble.right.fill",
                            title: "Dialogue",
                            description: "Respectful conversation across differences strengthens our community."
                        )
                    }
                    .padding()
                    .cardStyle()

                    // Founder
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeader(title: "Founder", icon: "person.fill")

                        HStack(alignment: .top, spacing: 16) {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.popBlue)

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Nicole Stone")
                                    .font(.headline)
                                    .foregroundColor(.popDarkBlue)

                                Text("Founded Better Together: People Over Party to bring Rapid City residents together around shared civic values and community engagement.")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding()
                    .cardStyle()

                    // Get Involved
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeader(title: "Get Involved", icon: "hand.point.up.fill")

                        Text("There are many ways to support our mission:")
                            .font(.body)
                            .foregroundColor(.popDarkBlue)

                        VStack(alignment: .leading, spacing: 8) {
                            BulletPoint(text: "Attend community events")
                            BulletPoint(text: "Share voter education resources")
                            BulletPoint(text: "Register to vote and help others register")
                            BulletPoint(text: "Join our newsletter for updates")
                            BulletPoint(text: "Follow us on social media")
                        }

                        Link(destination: URL(string: "https://www.peopleoverpartysd.com/")!) {
                            HStack {
                                Text("Visit Our Website")
                                Image(systemName: "arrow.up.right")
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PrimaryButtonStyle())
                    }
                    .padding()
                    .cardStyle()

                    // Open Source
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "heart.circle.fill")
                                .foregroundColor(.popDarkBlue)
                            Text("Open Source Vision")
                                .font(.headline)
                                .foregroundColor(.popDarkBlue)
                        }

                        Text("This app is designed to be adaptable for other civic organizations. We believe every community deserves tools that encourage participation in democracy.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color.popGold.opacity(0.1))
                    .cornerRadius(12)

                    // Version info
                    Text("PoP v1.0")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 20)
                }
                .padding()
            }
            .background(Color.popLightBackground)
            .navigationTitle("About")
        }
    }
}

// MARK: - Section Header
struct SectionHeader: View {
    let title: String
    let icon: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.popDarkBlue)
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.popDarkBlue)
        }
    }
}

// MARK: - Value Row
struct ValueRow: View {
    let icon: String
    let title: String
    let description: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.popBlue)
                .frame(width: 30)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Bullet Point
struct BulletPoint: View {
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "checkmark.circle.fill")
                .font(.caption)
                .foregroundColor(.popDarkBlue)
            Text(text)
                .font(.subheadline)
                .foregroundColor(.popDarkBlue)
        }
    }
}

#Preview {
    AboutView()
}
