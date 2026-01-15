//
//  VoteView.swift
//  PoP
//
//  Voting resources and ballot lookup
//

import SwiftUI

struct VoteView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // MARK: - Register to Vote Hero
                    VStack(spacing: 20) {
                        // Icon
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [.popBlue, .popBlue.opacity(0.7)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 100, height: 100)

                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                        }

                        // Title
                        VStack(spacing: 8) {
                            Text("Register to Vote")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                            Text("Your voice matters. Make it count.")
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.9))
                        }

                        // CTA Button
                        Link(destination: URL(string: "https://sdsos.gov/elections-voting/voting/register-to-vote/default.aspx")!) {
                            HStack(spacing: 12) {
                                Image(systemName: "pencil.and.list.clipboard")
                                    .font(.title3)
                                Text("Register Now")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Image(systemName: "arrow.right")
                                    .font(.title3)
                            }
                            .foregroundColor(.popBlue)
                            .padding(.horizontal, 32)
                            .padding(.vertical, 16)
                            .background(Color.white)
                            .cornerRadius(30)
                            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                        }
                        .accessibilityLabel("Register to vote, opens SD Secretary of State website")

                        // Already registered?
                        Link(destination: URL(string: "https://vip.sdsos.gov/VIPLogin.aspx")!) {
                            Text("Already registered? Check your status")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.9))
                                .underline()
                        }
                        .accessibilityLabel("Check voter registration status, opens website")
                    }
                    .padding(.vertical, 40)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            colors: [.popBlue, .popDarkBlue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(24)
                    .shadow(color: .popBlue.opacity(0.3), radius: 15, x: 0, y: 10)
                    .padding(.horizontal)
                    .padding(.top, 8)

                    // Ballot Lookup Card
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "doc.text.magnifyingglass")
                                .font(.title2)
                                .foregroundColor(.popDarkBlue)
                            Text("Find Your Ballot")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.popDarkBlue)
                        }

                        Text("Look up your personalized ballot with candidates and measures for your address.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Link(destination: URL(string: "https://ballotpedia.org/Sample_Ballot_Lookup")!) {
                            HStack {
                                Text("Look Up My Ballot")
                                Image(systemName: "arrow.up.right")
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PrimaryButtonStyle())
                        .accessibilityLabel("Look up your ballot on Ballotpedia, opens website")

                        Text("Powered by Ballotpedia")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .cardStyle()

                    // Pennington County Resources
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "building.2")
                                .font(.title2)
                                .foregroundColor(.popBlue)
                            Text("Pennington County")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.popDarkBlue)
                        }

                        VStack(spacing: 12) {
                            ResourceLink(
                                title: "Voter Registration",
                                icon: "person.badge.plus",
                                url: "https://www.pennco.org/index.asp?SEC=178876A6-5EBF-4727-B9AC-396FA4392859"
                            )

                            ResourceLink(
                                title: "Polling Locations",
                                icon: "mappin.and.ellipse",
                                url: "https://vip.sdsos.gov/VIPLogin.aspx"
                            )

                            ResourceLink(
                                title: "Absentee Voting",
                                icon: "envelope",
                                url: "https://sdsos.gov/elections-voting/voting/absentee-voting.aspx"
                            )

                            ResourceLink(
                                title: "Election Calendar",
                                icon: "calendar",
                                url: "https://sdsos.gov/elections-voting/upcoming-elections/default.aspx"
                            )
                        }

                        Divider()

                        // Contact info
                        VStack(alignment: .leading, spacing: 8) {
                            Label("605-394-2153", systemImage: "phone")
                            Label("PO Box 6160, Rapid City SD 57709", systemImage: "envelope")
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                    .padding()
                    .cardStyle()

                    // South Dakota State Resources
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "flag")
                                .font(.title2)
                                .foregroundColor(.popDarkBlue)
                            Text("South Dakota")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.popDarkBlue)
                        }

                        VStack(spacing: 12) {
                            ResourceLink(
                                title: "SD Secretary of State",
                                icon: "building.columns",
                                url: "https://sdsos.gov/elections-voting/"
                            )

                            ResourceLink(
                                title: "Voter Information Portal",
                                icon: "person.text.rectangle",
                                url: "https://vip.sdsos.gov/VIPLogin.aspx"
                            )

                            ResourceLink(
                                title: "Election Results",
                                icon: "chart.bar.fill",
                                url: "https://electionresults.sd.gov/"
                            )
                        }
                    }
                    .padding()
                    .cardStyle()
                }
                .padding()
            }
            .background(Color.popLightBackground)
            .navigationTitle("Vote")
        }
    }
}

// MARK: - Resource Link
struct ResourceLink: View {
    let title: String
    let icon: String
    let url: String

    var body: some View {
        if let linkURL = URL(string: url) {
            Link(destination: linkURL) {
                HStack {
                    Image(systemName: icon)
                        .font(.body)
                        .foregroundColor(.popBlue)
                        .frame(width: 30)

                    Text(title)
                        .font(.body)
                        .foregroundColor(.popDarkBlue)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(Color.popBlue.opacity(0.05))
                .cornerRadius(10)
            }
            .accessibilityLabel("\(title), opens website")
        }
    }
}

#Preview {
    VoteView()
}
