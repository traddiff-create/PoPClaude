//
//  VolunteerHubView.swift
//  PoP
//
//  Volunteer hub - signup, opportunities, and resources
//

import SwiftUI
import WebKit

struct VolunteerHubView: View {
    @State private var showSignup = false
    @State private var showOpportunities = false

    // Squarespace URLs - Update these when pages are created
    static let signupURL = URL(string: "https://www.peopleoverpartysd.com/volunteer")!
    static let opportunitiesURL = URL(string: "https://www.peopleoverpartysd.com/volunteer/opportunities")!

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Image(systemName: "person.3.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.popBlue)

                    Text("Volunteer")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.popDarkBlue)

                    Text("We always need help!")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    Text("Join our team of dedicated volunteers making a difference in South Dakota")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top, 20)

                // Main Actions
                VStack(spacing: 16) {
                    // Sign Up to Volunteer
                    Button {
                        showSignup = true
                    } label: {
                        VolunteerActionCard(
                            icon: "person.badge.plus",
                            title: "Sign Up to Volunteer",
                            subtitle: "Join our team and make a difference",
                            color: .popBlue
                        )
                    }

                    // View Opportunities
                    Button {
                        showOpportunities = true
                    } label: {
                        VolunteerActionCard(
                            icon: "list.clipboard.fill",
                            title: "View Opportunities",
                            subtitle: "See current volunteer needs",
                            color: .popGold
                        )
                    }

                    // Check In (link to EventCheckInView)
                    NavigationLink {
                        EventCheckInView()
                    } label: {
                        VolunteerActionCard(
                            icon: "checkmark.circle.fill",
                            title: "Event Check-In",
                            subtitle: "Already volunteering? Check in here",
                            color: .green
                        )
                    }
                }
                .padding(.horizontal)

                // Volunteer Roles
                VStack(alignment: .leading, spacing: 16) {
                    Text("Ways to Help")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        VolunteerRoleChip(icon: "megaphone.fill", label: "Event Staff")
                        VolunteerRoleChip(icon: "doc.text.fill", label: "Registration")
                        VolunteerRoleChip(icon: "camera.fill", label: "Photography")
                        VolunteerRoleChip(icon: "car.fill", label: "Transportation")
                        VolunteerRoleChip(icon: "phone.fill", label: "Phone Bank")
                        VolunteerRoleChip(icon: "envelope.fill", label: "Outreach")
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
                .padding(.horizontal)

                // Contact
                VStack(alignment: .leading, spacing: 12) {
                    Text("Questions?")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    Text("Contact our volunteer coordinator:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Link(destination: URL(string: "mailto:hello@peopleoverpartysd.com?subject=Volunteer%20Inquiry")!) {
                        HStack {
                            Image(systemName: "envelope.fill")
                            Text("hello@peopleoverpartysd.com")
                        }
                        .font(.subheadline)
                        .foregroundColor(.popBlue)
                    }
                }
                .padding()
                .background(Color.popBlue.opacity(0.05))
                .cornerRadius(12)
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
        }
        .navigationTitle("Volunteer")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showSignup) {
            NavigationStack {
                VolunteerWebView(url: VolunteerHubView.signupURL)
                    .navigationTitle("Sign Up")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done") {
                                showSignup = false
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: $showOpportunities) {
            NavigationStack {
                VolunteerWebView(url: VolunteerHubView.opportunitiesURL)
                    .navigationTitle("Opportunities")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done") {
                                showOpportunities = false
                            }
                        }
                    }
            }
        }
    }
}

// MARK: - Volunteer Action Card
struct VolunteerActionCard: View {
    let icon: String
    let title: String
    let subtitle: String
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
                    .lineLimit(2)
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

// MARK: - Volunteer Role Chip
struct VolunteerRoleChip: View {
    let icon: String
    let label: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundColor(.popBlue)

            Text(label)
                .font(.subheadline)
                .foregroundColor(.popDarkBlue)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(Color.popLightBackground)
        .cornerRadius(10)
    }
}

// MARK: - Volunteer WebView
struct VolunteerWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.allowsBackForwardNavigationGestures = true
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

#Preview {
    NavigationStack {
        VolunteerHubView()
    }
}
