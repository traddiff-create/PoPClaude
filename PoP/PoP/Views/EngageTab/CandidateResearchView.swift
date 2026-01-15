//
//  CandidateResearchView.swift
//  PoP
//
//  Hub view for candidate research resources.
//

import SwiftUI

struct CandidateResearchView: View {
    @State private var expandedCategories: Set<UUID> = []
    @State private var showingResources = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Introduction
                introSection

                // Research Categories
                categoriesSection

                // Checklist
                checklistSection

                // Evaluation Tips
                tipsSection

                // All Resources Button
                resourcesButton
            }
            .padding()
        }
        .background(Color.popLightBackground)
        .navigationTitle("Research Candidates")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingResources) {
            ResourcesListView()
        }
    }

    // MARK: - Introduction

    private var introSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "person.fill.questionmark")
                    .foregroundColor(.popBlue)
                Text("Voter's Self-Defense System")
                    .font(.headline)
                    .foregroundColor(.popDarkBlue)
            }

            Text(CandidateResearchData.introduction)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }

    // MARK: - Research Categories

    private var categoriesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Research Categories")
                .font(.headline)
                .foregroundColor(.popDarkBlue)

            ForEach(CandidateResearchData.categories) { category in
                categoryCard(category)
            }
        }
    }

    private func categoryCard(_ category: ResearchCategory) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header button
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    if expandedCategories.contains(category.id) {
                        expandedCategories.remove(category.id)
                    } else {
                        expandedCategories.insert(category.id)
                    }
                }
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: category.icon)
                        .foregroundColor(.popBlue)
                        .frame(width: 24)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(category.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.popDarkBlue)
                        Text(category.description)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    Image(systemName: expandedCategories.contains(category.id) ? "chevron.up" : "chevron.down")
                        .foregroundColor(.secondary)
                        .font(.caption)
                }
                .padding()
                .background(Color.white)
            }
            .buttonStyle(PlainButtonStyle())

            // Expanded content
            if expandedCategories.contains(category.id) {
                VStack(alignment: .leading, spacing: 16) {
                    // Questions
                    ForEach(category.questions) { question in
                        questionCard(question)
                    }

                    // Category Resources
                    if !category.resources.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Resources")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.popDarkBlue)

                            ForEach(category.resources) { resource in
                                EngageResourceLink(
                                    name: resource.name,
                                    url: resource.url,
                                    description: resource.description,
                                    isNonpartisan: resource.isNonpartisan
                                )
                            }
                        }
                    }
                }
                .padding()
                .background(Color.white)
            }
        }
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }

    private func questionCard(_ question: ResearchQuestion) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(question.question)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.popDarkBlue)

            Text(question.whyItMatters)
                .font(.caption)
                .foregroundColor(.secondary)

            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .font(.caption)
                    .foregroundColor(.popBlue)
                Text("Where to find: \(question.howToFind)")
                    .font(.caption)
                    .foregroundColor(.popBlue)
            }

            if let redFlags = question.redFlags, !redFlags.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Red Flags:")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                    ForEach(redFlags, id: \.self) { flag in
                        HStack(alignment: .top, spacing: 6) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.caption2)
                                .foregroundColor(.red)
                            Text(flag)
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.popLightBackground)
        .cornerRadius(8)
    }

    // MARK: - Checklist Section

    private var checklistSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Research Checklist")
                .font(.headline)
                .foregroundColor(.popDarkBlue)

            ForEach(CandidateResearchData.researchChecklist) { section in
                VStack(alignment: .leading, spacing: 8) {
                    Text(section.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.popBlue)

                    ForEach(section.items, id: \.self) { item in
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "square")
                                .foregroundColor(.popGold)
                                .font(.caption)
                            Text(item)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }

    // MARK: - Tips Section

    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Evaluating Information")
                .font(.headline)
                .foregroundColor(.popDarkBlue)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach(CandidateResearchData.evaluationTips) { tip in
                    tipCard(tip)
                }
            }
        }
    }

    private func tipCard(_ tip: EvaluationTip) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: tip.icon)
                    .foregroundColor(.popGold)
                Text(tip.title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.popDarkBlue)
            }

            ForEach(tip.tips.prefix(2), id: \.self) { t in
                Text("• \(t)")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }

    // MARK: - Resources Button

    private var resourcesButton: some View {
        Button {
            showingResources = true
        } label: {
            HStack {
                Image(systemName: "link.circle.fill")
                Text("View All Resources")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.popBlue)
            .cornerRadius(12)
        }
    }
}

// MARK: - Resources List View

struct ResourcesListView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List {
                ForEach(groupedResources, id: \.key) { group in
                    Section(header: Text(group.key)) {
                        ForEach(group.value) { resource in
                            Link(destination: URL(string: resource.url)!) {
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack {
                                        Text(resource.name)
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                            .foregroundColor(.popDarkBlue)
                                        if resource.isNonpartisan {
                                            Text("Nonpartisan")
                                                .font(.caption2)
                                                .foregroundColor(.popDarkBlue)
                                                .padding(.horizontal, 6)
                                                .padding(.vertical, 2)
                                                .background(Color.popGold.opacity(0.1))
                                                .cornerRadius(4)
                                        }
                                    }
                                    Text(resource.description)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Resources")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }

    private var groupedResources: [(key: String, value: [ResearchResource])] {
        let grouped = Dictionary(grouping: CandidateResearchData.allResources) { $0.dataType }
        return grouped.sorted { $0.key < $1.key }.map { (key: $0.key, value: $0.value) }
    }
}

#Preview {
    NavigationStack {
        CandidateResearchView()
    }
}
