//
//  SouthDakotaView.swift
//  PoP
//
//  Main hub for all South Dakota-specific content
//  - SD Civics Flashcards (State, County, Municipal)
//  - Contact Representatives
//  - Civic Events (protests, rallies, town halls)
//  - SD Legislature (Statutes, Bills, Hearings)
//

import SwiftUI

struct SouthDakotaView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 8) {
                        Image(systemName: "building.columns.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.popDarkBlue)

                        Text("South Dakota")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.popDarkBlue)

                        Text("State, County & Municipal Resources")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 20)

                    // Feature Cards
                    VStack(spacing: 16) {
                        // SD Civics Flashcards
                        NavigationLink {
                            SouthDakotaLearnView()
                        } label: {
                            SDFeatureCard(
                                icon: "rectangle.stack",
                                title: "SD Civics Flashcards",
                                subtitle: "Learn about state, county & city government",
                                questionCount: SouthDakotaData.questions.count,
                                color: .popBlue
                            )
                        }

                        // Contact Representatives
                        NavigationLink {
                            ContactRepsView()
                        } label: {
                            SDFeatureCard(
                                icon: "envelope.badge.person.crop",
                                title: "Contact Representatives",
                                subtitle: "Email or call your elected officials",
                                questionCount: nil,
                                color: .green
                            )
                        }

                        // Civic Events
                        NavigationLink {
                            CivicEventsView()
                        } label: {
                            SDFeatureCard(
                                icon: "person.3.fill",
                                title: "Civic Events",
                                subtitle: "Find rallies, town halls & community action",
                                questionCount: nil,
                                color: .purple
                            )
                        }

                        // Committee Hearings
                        NavigationLink {
                            SDHearingsView()
                        } label: {
                            SDFeatureCard(
                                icon: "mic.fill",
                                title: "Committee Hearings",
                                subtitle: "Testify on legislation at the Capitol",
                                questionCount: nil,
                                color: .orange
                            )
                        }

                        // SD Legislature
                        NavigationLink {
                            SDLegislatureView()
                        } label: {
                            SDFeatureCard(
                                icon: "scroll",
                                title: "SD Legislature",
                                subtitle: "Statutes, bills & legislative resources",
                                questionCount: nil,
                                color: .popGold
                            )
                        }
                    }
                    .padding(.horizontal)

                    // Quick Stats
                    VStack(alignment: .leading, spacing: 12) {
                        Text("About South Dakota")
                            .font(.headline)
                            .foregroundColor(.popDarkBlue)

                        HStack(spacing: 20) {
                            StatBox(label: "Statehood", value: "1889")
                            StatBox(label: "Capital", value: "Pierre")
                            StatBox(label: "Counties", value: "66")
                        }
                    }
                    .padding()
                    .background(Color.popLightBackground)
                    .cornerRadius(16)
                    .padding(.horizontal)

                    Spacer(minLength: 40)
                }
            }
            .navigationTitle("South Dakota")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Feature Card
struct SDFeatureCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let questionCount: Int?
    let color: Color

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(color)
                .cornerRadius(14)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                if let count = questionCount {
                    Text("\(count) questions")
                        .font(.caption)
                        .foregroundColor(color)
                        .fontWeight(.medium)
                }
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
}

// MARK: - Stat Box
struct StatBox: View {
    let label: String
    let value: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.popBlue)
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SouthDakotaView()
}
