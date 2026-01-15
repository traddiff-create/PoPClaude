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
                    // Ballot Lookup Card
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "doc.text.magnifyingglass")
                                .font(.title2)
                                .foregroundColor(.popGold)
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
                                .foregroundColor(.popGold)
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
                                title: "Register to Vote",
                                icon: "checkmark.circle",
                                url: "https://sdsos.gov/elections-voting/voting/register-to-vote/default.aspx"
                            )

                            ResourceLink(
                                title: "Voter Information Portal",
                                icon: "person.text.rectangle",
                                url: "https://vip.sdsos.gov/VIPLogin.aspx"
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
        }
    }
}

#Preview {
    VoteView()
}
