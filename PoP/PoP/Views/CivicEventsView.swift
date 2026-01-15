//
//  CivicEventsView.swift
//  PoP
//
//  Civic Events - Find or submit peaceful protests, rallies, town halls, and voter drives
//  Events hosted on Squarespace (peopleoverpartysd.com/events)
//  Admin-approved, aligned with King Center nonviolent principles
//

import SwiftUI
import WebKit

struct CivicEventsView: View {
    @State private var showBrowseEvents = false
    @State private var showSubmitEvent = false
    @State private var showGuidelines = false

    // Squarespace URLs - Update these with actual URLs when pages are created
    static let eventsURL = URL(string: "https://www.peopleoverpartysd.com/events")!
    static let submitURL = URL(string: "https://www.peopleoverpartysd.com/events/submit")!

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Image(systemName: "person.3.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.popBlue)

                    Text("Civic Events")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.popDarkBlue)

                    Text("Peaceful rallies, town halls & community action")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)

                // Nonviolence Banner
                HStack(spacing: 12) {
                    Image(systemName: "heart.circle.fill")
                        .font(.title2)
                        .foregroundColor(.popDarkBlue)

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Committed to Nonviolence")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.popDarkBlue)
                        Text("All events follow King Center principles")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    Button {
                        showGuidelines = true
                    } label: {
                        Text("Learn")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.popBlue)
                    }
                }
                .padding()
                .background(Color.popGold.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)

                // Main Actions
                VStack(spacing: 16) {
                    // Browse Events
                    Button {
                        showBrowseEvents = true
                    } label: {
                        EventActionCard(
                            icon: "calendar",
                            title: "Find Events",
                            subtitle: "Browse upcoming rallies, town halls & more",
                            color: .popBlue
                        )
                    }

                    // Submit Event
                    Button {
                        showSubmitEvent = true
                    } label: {
                        EventActionCard(
                            icon: "plus.circle.fill",
                            title: "Submit an Event",
                            subtitle: "Organize a peaceful civic gathering",
                            color: .popGold
                        )
                    }
                }
                .padding(.horizontal)

                // Event Types
                VStack(alignment: .leading, spacing: 16) {
                    Text("Event Types")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)
                        .padding(.horizontal)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        EventTypeChip(icon: "megaphone.fill", label: "Rallies")
                        EventTypeChip(icon: "building.2.fill", label: "Town Halls")
                        EventTypeChip(icon: "person.3.sequence.fill", label: "Marches")
                        EventTypeChip(icon: "checkmark.circle.fill", label: "Voter Drives")
                        EventTypeChip(icon: "bubble.left.and.bubble.right.fill", label: "Forums")
                        EventTypeChip(icon: "heart.fill", label: "Community")
                    }
                    .padding(.horizontal)
                }

                // Guidelines Summary
                VStack(alignment: .leading, spacing: 12) {
                    Text("Event Guidelines")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    VStack(alignment: .leading, spacing: 8) {
                        GuidelineRow(icon: "checkmark.circle.fill", text: "Peaceful, nonviolent gatherings only", color: .green)
                        GuidelineRow(icon: "checkmark.circle.fill", text: "Open to all community members", color: .green)
                        GuidelineRow(icon: "checkmark.circle.fill", text: "Focus on civic education & engagement", color: .green)
                        GuidelineRow(icon: "checkmark.circle.fill", text: "Events reviewed within 48 hours", color: .green)
                    }

                    Divider()

                    Text("All submitted events are reviewed by People Over Party to ensure they align with our mission of peaceful civic engagement.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.popLightBackground)
                .cornerRadius(16)
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
        }
        .navigationTitle("Civic Events")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showBrowseEvents) {
            NavigationStack {
                EventsWebView(url: CivicEventsView.eventsURL)
                    .navigationTitle("Events")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done") {
                                showBrowseEvents = false
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: $showSubmitEvent) {
            NavigationStack {
                EventsWebView(url: CivicEventsView.submitURL)
                    .navigationTitle("Submit Event")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done") {
                                showSubmitEvent = false
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: $showGuidelines) {
            NavigationStack {
                NonviolenceGuidelinesView()
            }
        }
    }
}

// MARK: - Event Action Card
struct EventActionCard: View {
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

// MARK: - Event Type Chip
struct EventTypeChip: View {
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
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Guideline Row
struct GuidelineRow: View {
    let icon: String
    let text: String
    let color: Color

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.subheadline)

            Text(text)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
}

// MARK: - Events WebView
struct EventsWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.allowsBackForwardNavigationGestures = true
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No update needed
    }
}

// MARK: - Nonviolence Guidelines View
struct NonviolenceGuidelinesView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Image(systemName: "heart.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.popDarkBlue)

                    Text("Principles of Nonviolence")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.popDarkBlue)

                    Text("Inspired by Dr. Martin Luther King Jr.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 20)

                // Six Principles
                VStack(alignment: .leading, spacing: 16) {
                    Text("Six Principles")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    PrincipleCard(number: 1, title: "Courageous Resistance", description: "Nonviolence is active resistance to evil, not passive acceptance.")

                    PrincipleCard(number: 2, title: "Beloved Community", description: "The goal is reconciliation and creating understanding between all people.")

                    PrincipleCard(number: 3, title: "Attack Evil, Not People", description: "We oppose injustice, not the individuals who perpetuate it.")

                    PrincipleCard(number: 4, title: "Redemptive Suffering", description: "Accepting suffering without retaliation can educate and transform.")

                    PrincipleCard(number: 5, title: "Love Over Hate", description: "Choose understanding and goodwill, even toward opponents.")

                    PrincipleCard(number: 6, title: "Faith in Justice", description: "Trust that the universe bends toward justice.")
                }
                .padding(.horizontal)

                // Source
                Link(destination: URL(string: "https://thekingcenter.org/about-tkc/the-king-philosophy/")!) {
                    HStack {
                        Image(systemName: "link")
                        Text("Learn more at The King Center")
                        Spacer()
                        Image(systemName: "arrow.up.right")
                            .font(.caption)
                    }
                    .foregroundColor(.popBlue)
                    .padding()
                    .background(Color.popBlue.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
        }
        .navigationTitle("Nonviolence")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") { dismiss() }
            }
        }
    }
}

// MARK: - Principle Card
struct PrincipleCard: View {
    let number: Int
    let title: String
    let description: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(number)")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 28, height: 28)
                .background(Color.popGold)
                .cornerRadius(14)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.popDarkBlue)

                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    NavigationStack {
        CivicEventsView()
    }
}
