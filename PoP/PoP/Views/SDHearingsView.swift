//
//  SDHearingsView.swift
//  PoP
//
//  SD Legislature Committee Hearings & Public Testimony
//  Source: https://sdlegislature.gov/
//

import SwiftUI
import WebKit

struct SDHearingsView: View {
    @State private var showCommitteeSchedule = false
    @State private var showHowToTestify = false

    // Legislature URLs
    static let committeesURL = URL(string: "https://sdlegislature.gov/Session/Committees/71")!
    static let calendarURL = URL(string: "https://sdlegislature.gov/Session/Calendar/71")!
    static let testimonyInfoURL = URL(string: "https://sdlegislature.gov/")!

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Image(systemName: "mic.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.popBlue)

                    Text("Committee Hearings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.popDarkBlue)

                    Text("Your voice matters in the legislative process")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)

                // Alert Banner
                HStack(spacing: 12) {
                    Image(systemName: "exclamationmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.orange)

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Registration Required")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.popDarkBlue)
                        Text("Sign up before testifying at committees")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()
                }
                .padding()
                .background(Color.orange.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)

                // Main Actions
                VStack(spacing: 16) {
                    // View Committee Schedule
                    Button {
                        showCommitteeSchedule = true
                    } label: {
                        HearingActionCard(
                            icon: "calendar.badge.clock",
                            title: "Committee Schedule",
                            subtitle: "See upcoming hearings and agendas",
                            color: .popBlue
                        )
                    }

                    // How to Testify
                    Button {
                        showHowToTestify = true
                    } label: {
                        HearingActionCard(
                            icon: "person.wave.2.fill",
                            title: "How to Testify",
                            subtitle: "Steps to share your voice on legislation",
                            color: .popGold
                        )
                    }

                    // Session Calendar
                    Link(destination: SDHearingsView.calendarURL) {
                        HearingActionCard(
                            icon: "calendar",
                            title: "Session Calendar",
                            subtitle: "Key dates and deadlines",
                            color: .green,
                            isExternal: true
                        )
                    }
                }
                .padding(.horizontal)

                // How to Testify Summary
                VStack(alignment: .leading, spacing: 16) {
                    Text("Testifying at a Hearing")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    VStack(alignment: .leading, spacing: 12) {
                        TestifyStep(number: 1, title: "Find the Hearing", description: "Check committee agendas for the bill you care about")

                        TestifyStep(number: 2, title: "Register Online", description: "Use the QR code or link on the agenda to sign up")

                        TestifyStep(number: 3, title: "Prepare Your Statement", description: "Keep it brief (2-3 minutes) and focused on the bill")

                        TestifyStep(number: 4, title: "Arrive Early", description: "Come to the hearing room before it starts")

                        TestifyStep(number: 5, title: "Speak When Called", description: "State your name and position on the bill")
                    }

                    Divider()

                    Text("You can testify in person in Pierre, or check if remote testimony is available for your hearing.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.popLightBackground)
                .cornerRadius(16)
                .padding(.horizontal)

                // Standing Committees
                VStack(alignment: .leading, spacing: 12) {
                    Text("Standing Committees")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    Text("Each chamber has 14 standing committees that review bills:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                        CommitteeChip(name: "Agriculture")
                        CommitteeChip(name: "Appropriations")
                        CommitteeChip(name: "Commerce")
                        CommitteeChip(name: "Education")
                        CommitteeChip(name: "Health")
                        CommitteeChip(name: "Judiciary")
                        CommitteeChip(name: "Local Government")
                        CommitteeChip(name: "State Affairs")
                        CommitteeChip(name: "Taxation")
                        CommitteeChip(name: "Transportation")
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
                .padding(.horizontal)

                // Contact LRC
                VStack(alignment: .leading, spacing: 12) {
                    Text("Need Help?")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    Text("Contact the Legislative Research Council:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    HStack {
                        Link(destination: URL(string: "tel:6057733251")!) {
                            HStack {
                                Image(systemName: "phone.fill")
                                Text("(605) 773-3251")
                            }
                            .font(.subheadline)
                            .foregroundColor(.popBlue)
                        }

                        Spacer()

                        Link(destination: URL(string: "mailto:LRC@sdlegislature.gov")!) {
                            HStack {
                                Image(systemName: "envelope.fill")
                                Text("Email LRC")
                            }
                            .font(.subheadline)
                            .foregroundColor(.popBlue)
                        }
                    }
                }
                .padding()
                .background(Color.popBlue.opacity(0.05))
                .cornerRadius(12)
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
        }
        .navigationTitle("Hearings")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showCommitteeSchedule) {
            NavigationStack {
                HearingWebView(url: SDHearingsView.committeesURL)
                    .navigationTitle("Committees")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done") {
                                showCommitteeSchedule = false
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: $showHowToTestify) {
            NavigationStack {
                HowToTestifyView()
            }
        }
    }
}

// MARK: - Hearing Action Card
struct HearingActionCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    var isExternal: Bool = false

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

            Image(systemName: isExternal ? "arrow.up.right" : "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
}

// MARK: - Testify Step
struct TestifyStep: View {
    let number: Int
    let title: String
    let description: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(number)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 22, height: 22)
                .background(Color.popBlue)
                .cornerRadius(11)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.popDarkBlue)

                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

// MARK: - Committee Chip
struct CommitteeChip: View {
    let name: String

    var body: some View {
        Text(name)
            .font(.caption)
            .foregroundColor(.popDarkBlue)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Color.popLightBackground)
            .cornerRadius(8)
    }
}

// MARK: - Hearing WebView
struct HearingWebView: UIViewRepresentable {
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

// MARK: - How to Testify View
struct HowToTestifyView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Image(systemName: "person.wave.2.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.popDarkBlue)

                    Text("How to Testify")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.popDarkBlue)

                    Text("Make your voice heard on legislation")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 20)

                // Detailed Steps
                VStack(alignment: .leading, spacing: 20) {
                    DetailedStep(
                        number: 1,
                        title: "Find the Right Committee",
                        details: [
                            "Bills are assigned to committees based on topic",
                            "Check sdlegislature.gov for committee assignments",
                            "Each bill page shows its assigned committee"
                        ]
                    )

                    DetailedStep(
                        number: 2,
                        title: "Check the Agenda",
                        details: [
                            "Committees post agendas before hearings",
                            "Find the date and time of the hearing",
                            "Note the hearing room location"
                        ]
                    )

                    DetailedStep(
                        number: 3,
                        title: "Register to Testify",
                        details: [
                            "Registration is required before testifying",
                            "Scan the QR code on the agenda, or",
                            "Click the registration link at the top of the agenda"
                        ]
                    )

                    DetailedStep(
                        number: 4,
                        title: "Prepare Your Testimony",
                        details: [
                            "Keep it brief: 2-3 minutes maximum",
                            "State your position clearly (support/oppose)",
                            "Focus on facts and personal experience",
                            "Be respectful of committee members"
                        ]
                    )

                    DetailedStep(
                        number: 5,
                        title: "At the Hearing",
                        details: [
                            "Arrive early and check in",
                            "Wait to be called by the chair",
                            "State your name and who you represent",
                            "Answer questions from committee members"
                        ]
                    )
                }
                .padding(.horizontal)

                // Tips
                VStack(alignment: .leading, spacing: 12) {
                    Text("Tips for Effective Testimony")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    TipRow(icon: "checkmark.circle.fill", text: "Be concise and stay on topic")
                    TipRow(icon: "checkmark.circle.fill", text: "Share personal stories when relevant")
                    TipRow(icon: "checkmark.circle.fill", text: "Bring written copies of your testimony")
                    TipRow(icon: "checkmark.circle.fill", text: "Thank the committee for their time")
                    TipRow(icon: "xmark.circle.fill", text: "Don't repeat what others have said", isNegative: true)
                    TipRow(icon: "xmark.circle.fill", text: "Avoid personal attacks or disrespect", isNegative: true)
                }
                .padding()
                .background(Color.popLightBackground)
                .cornerRadius(16)
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
        }
        .navigationTitle("Testify")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") { dismiss() }
            }
        }
    }
}

// MARK: - Detailed Step
struct DetailedStep: View {
    let number: Int
    let title: String
    let details: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 10) {
                Text("\(number)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 28, height: 28)
                    .background(Color.popBlue)
                    .cornerRadius(14)

                Text(title)
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
            }

            VStack(alignment: .leading, spacing: 4) {
                ForEach(details, id: \.self) { detail in
                    HStack(alignment: .top, spacing: 8) {
                        Text("•")
                            .foregroundColor(.popDarkBlue)
                        Text(detail)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.leading, 38)
        }
    }
}

// MARK: - Tip Row
struct TipRow: View {
    let icon: String
    let text: String
    var isNegative: Bool = false

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundColor(isNegative ? .red : .green)
                .font(.subheadline)

            Text(text)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    NavigationStack {
        SDHearingsView()
    }
}
