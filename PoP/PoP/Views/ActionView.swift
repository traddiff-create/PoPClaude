//
//  ActionView.swift
//  PoP
//
//  Take Action hub - Rally Radio, Volunteer, Check-In
//

import SwiftUI

struct ActionView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 8) {
                        Image(systemName: "bolt.circle.fill")
                            .font(.system(size: 50))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.popBlue, .popGold],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )

                        Text("Take Action")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.popDarkBlue)

                        Text("Get involved in your community")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 20)

                    // Feature Cards
                    VStack(spacing: 16) {
                        // Rally Radio (Coming Soon)
                        ActionFeatureCard(
                            icon: "antenna.radiowaves.left.and.right",
                            title: "Rally Radio",
                            subtitle: "Live updates during civic events",
                            color: .orange,
                            badge: "Coming Soon"
                        ) {
                            // Future: Navigate to RallyRadioView
                        }

                        // Volunteer Hub
                        NavigationLink {
                            VolunteerHubView()
                        } label: {
                            ActionFeatureCard(
                                icon: "person.3.fill",
                                title: "Volunteer",
                                subtitle: "Sign up to help at events",
                                color: .popBlue,
                                badge: nil
                            )
                        }

                        // Event Check-In
                        NavigationLink {
                            EventCheckInView()
                        } label: {
                            ActionFeatureCard(
                                icon: "checkmark.circle.fill",
                                title: "Event Check-In",
                                subtitle: "Mark your attendance at events",
                                color: .green,
                                badge: nil
                            )
                        }
                    }
                    .padding(.horizontal)

                    // Info Banner
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.popDarkBlue)
                            Text("Why Volunteer?")
                                .font(.headline)
                                .foregroundColor(.popDarkBlue)
                        }

                        Text("People Over Party relies on volunteers to make our mission possible. Whether you can give an hour or a day, your help makes a difference in building a more engaged community.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color.popGold.opacity(0.1))
                    .cornerRadius(16)
                    .padding(.horizontal)

                    Spacer(minLength: 40)
                }
            }
            .background(Color.popLightBackground)
            .navigationTitle("Action")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Action Feature Card
struct ActionFeatureCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    let badge: String?
    var action: (() -> Void)? = nil

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(color)
                .cornerRadius(14)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    if let badge = badge {
                        Text(badge)
                            .font(.caption2)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                }

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }

            Spacer()

            if badge == nil {
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
        .onTapGesture {
            action?()
        }
    }
}

#Preview {
    ActionView()
}
