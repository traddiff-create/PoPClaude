//
//  EventHostingGuideView.swift
//  PoP
//
//  Guide for hosting civic engagement events.
//

import SwiftUI

struct EventHostingGuideView: View {
    let guide = CivicEventHostingData.completeGuide
    let quickCards = CivicEventHostingData.quickReferenceCards

    @State private var expandedSections: Set<UUID> = []

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                headerSection

                // Quick Reference Cards (horizontal scroll)
                quickReferenceSection

                // Main Sections (expandable)
                sectionsView

                // Event Types
                eventTypesSection
            }
            .padding()
        }
        .background(Color.popLightBackground)
        .navigationTitle("Host an Event")
        .navigationBarTitleDisplayMode(.large)
    }

    // MARK: - Header Section

    private var headerSection: some View {
        VStack(spacing: 12) {
            Image(systemName: guide.icon)
                .font(.system(size: 48))
                .foregroundColor(.popDarkBlue)

            Text(guide.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.popDarkBlue)
                .multilineTextAlignment(.center)

            Text("A complete guide from planning to follow-up for hosting productive civic events in your community.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
    }

    // MARK: - Quick Reference Section

    private var quickReferenceSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Quick Reference")
                .font(.headline)
                .foregroundColor(.popDarkBlue)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(quickCards) { card in
                        QuickReferenceCardView(card: card)
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    // MARK: - Sections View

    private var sectionsView: some View {
        VStack(spacing: 12) {
            ForEach(guide.sections) { section in
                sectionCard(section)
            }
        }
    }

    private func sectionCard(_ section: HostingSection) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header button
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    if expandedSections.contains(section.id) {
                        expandedSections.remove(section.id)
                    } else {
                        expandedSections.insert(section.id)
                    }
                }
            } label: {
                HStack {
                    Text(section.title)
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)
                    Spacer()
                    Image(systemName: expandedSections.contains(section.id) ? "chevron.up" : "chevron.down")
                        .foregroundColor(.secondary)
                        .font(.caption)
                }
                .padding()
                .background(Color.white)
            }
            .buttonStyle(PlainButtonStyle())

            // Expanded content
            if expandedSections.contains(section.id) {
                VStack(alignment: .leading, spacing: 16) {
                    // Content
                    Text(section.content)
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    // Checklist
                    if let checklist = section.checklist, !checklist.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Checklist")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.popBlue)

                            ForEach(checklist) { item in
                                HStack(alignment: .top, spacing: 10) {
                                    Image(systemName: "square")
                                        .foregroundColor(.popDarkBlue)
                                        .font(.caption)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(item.text)
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                        if let category = item.category {
                                            Text(category)
                                                .font(.caption2)
                                                .foregroundColor(.popBlue)
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // Tips
                    if let tips = section.tips, !tips.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Tips")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.orange)

                            ForEach(tips, id: \.self) { tip in
                                HStack(alignment: .top, spacing: 10) {
                                    Image(systemName: "lightbulb.fill")
                                        .foregroundColor(.orange)
                                        .font(.caption)
                                    Text(tip.replacingOccurrences(of: "**", with: ""))
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                .background(Color.white)
            }
        }
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }

    // MARK: - Event Types Section

    private var eventTypesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Event Types")
                .font(.headline)
                .foregroundColor(.popDarkBlue)

            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 12) {
                ForEach(CivicEventType.allCases, id: \.self) { eventType in
                    EventTypeCard(eventType: eventType)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EventHostingGuideView()
    }
}
