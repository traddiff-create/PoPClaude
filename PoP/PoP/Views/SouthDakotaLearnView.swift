//
//  SouthDakotaLearnView.swift
//  PoP
//
//  South Dakota civics flashcards - State, County, and Municipal government
//

import SwiftUI

enum SDLearnFilter: String, CaseIterable {
    case all = "All"
    case notLearned = "Not Learned"
    case learned = "Learned"
}

struct SouthDakotaLearnView: View {
    @StateObject private var progressManager = SDProgressManager.shared
    @State private var currentQuestions: [SDQuestion] = SouthDakotaData.shuffledQuestions()
    @State private var currentIndex = 0
    @State private var showAnswer = false
    @State private var selectedCategory: SDCategory?
    @State private var selectedFilter: SDLearnFilter = .all

    var filteredQuestions: [SDQuestion] {
        var questions = currentQuestions

        // Filter by category
        if let category = selectedCategory {
            questions = questions.filter { $0.category == category }
        }

        // Filter by learning status
        switch selectedFilter {
        case .all:
            break
        case .notLearned:
            questions = questions.filter { !progressManager.isKnown(questionId: $0.id) }
        case .learned:
            questions = questions.filter { progressManager.isKnown(questionId: $0.id) }
        }

        return questions
    }

    var currentQuestion: SDQuestion? {
        guard currentIndex < filteredQuestions.count else { return nil }
        return filteredQuestions[currentIndex]
    }

    var emptyStateMessage: String {
        switch selectedFilter {
        case .all:
            return "You've reviewed all the cards!"
        case .notLearned:
            return "Great job! You've learned all the cards."
        case .learned:
            return "No cards marked as learned yet.\nTap cards and mark them as learned!"
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header with SD branding
                HStack {
                    Image(systemName: "building.columns.fill")
                        .foregroundColor(.popGold)
                    Text("South Dakota Civics")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)
                }
                .padding(.vertical, 8)

                // Category Filter
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        SDCategoryButton(
                            title: "All",
                            icon: "square.grid.2x2",
                            isSelected: selectedCategory == nil
                        ) {
                            selectedCategory = nil
                            resetCards()
                        }

                        ForEach(SDCategory.allCases, id: \.self) { category in
                            SDCategoryButton(
                                title: category.rawValue,
                                icon: category.icon,
                                isSelected: selectedCategory == category
                            ) {
                                selectedCategory = category
                                resetCards()
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 12)
                .background(Color.popLightBackground)

                // Learning filter
                Picker("Filter", selection: $selectedFilter) {
                    ForEach(SDLearnFilter.allCases, id: \.self) { filter in
                        Text(filter.rawValue).tag(filter)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.bottom, 8)
                .onChange(of: selectedFilter) {
                    resetCards()
                }

                // Progress indicator
                HStack {
                    Text("Card \(min(currentIndex + 1, filteredQuestions.count)) of \(filteredQuestions.count)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Spacer()

                    Text("\(progressManager.knownCount) of \(progressManager.totalCount) learned")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.popGold)
                }
                .padding(.horizontal)
                .padding(.vertical, 8)

                Spacer()

                // Flashcard
                if let question = currentQuestion {
                    SDFlashcardView(
                        question: question,
                        showAnswer: showAnswer,
                        isKnown: progressManager.isKnown(questionId: question.id)
                    )
                    .onTapGesture {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            showAnswer.toggle()
                            if showAnswer {
                                progressManager.markViewed(questionId: question.id)
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Mark as Known button
                    Button {
                        progressManager.toggleKnown(questionId: question.id)
                    } label: {
                        HStack {
                            Image(systemName: progressManager.isKnown(questionId: question.id) ? "checkmark.circle.fill" : "circle")
                            Text(progressManager.isKnown(questionId: question.id) ? "Learned" : "Mark as Learned")
                        }
                        .font(.headline)
                        .foregroundColor(progressManager.isKnown(questionId: question.id) ? .popGold : .popBlue)
                    }
                    .padding(.top, 16)
                } else {
                    VStack(spacing: 16) {
                        Image(systemName: selectedFilter == .learned ? "star.circle.fill" : "checkmark.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.popGold)
                        Text(emptyStateMessage)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        if selectedFilter != .all {
                            Button("Show All Cards") {
                                selectedFilter = .all
                                resetCards()
                            }
                            .buttonStyle(PrimaryButtonStyle())
                        } else {
                            Button("Start Over") {
                                resetCards()
                            }
                            .buttonStyle(PrimaryButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()

                // Navigation controls
                if currentQuestion != nil {
                    HStack(spacing: 40) {
                        Button {
                            previousCard()
                        } label: {
                            Image(systemName: "chevron.left.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(currentIndex > 0 ? .popBlue : .gray.opacity(0.3))
                        }
                        .disabled(currentIndex == 0)

                        Button {
                            shuffleCards()
                        } label: {
                            Image(systemName: "shuffle.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.popGold)
                        }

                        Button {
                            nextCard()
                        } label: {
                            Image(systemName: "chevron.right.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(currentIndex < filteredQuestions.count - 1 ? .popBlue : .gray.opacity(0.3))
                        }
                        .disabled(currentIndex >= filteredQuestions.count - 1)
                    }
                    .padding(.bottom, 30)
                }
            }
            .navigationTitle("SD Civics")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        shuffleCards()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
        }
    }

    private func nextCard() {
        showAnswer = false
        if currentIndex < filteredQuestions.count - 1 {
            currentIndex += 1
        }
    }

    private func previousCard() {
        showAnswer = false
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }

    private func shuffleCards() {
        showAnswer = false
        currentQuestions = SouthDakotaData.shuffledQuestions()
        currentIndex = 0
    }

    private func resetCards() {
        showAnswer = false
        currentIndex = 0
    }
}

// MARK: - SD Category Button
struct SDCategoryButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.caption)
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(isSelected ? Color.popBlue : Color.white)
            .foregroundColor(isSelected ? .white : .popDarkBlue)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        }
    }
}

// MARK: - SD Flashcard View
struct SDFlashcardView: View {
    let question: SDQuestion
    let showAnswer: Bool
    var isKnown: Bool = false

    var categoryColor: Color {
        switch question.category {
        case .state: return .popBlue
        case .county: return .popGold
        case .municipal: return .popDarkBlue
        }
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(showAnswer ? categoryColor.opacity(0.1) : Color.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)

            VStack(spacing: 20) {
                // Top row: Category badge + Learned indicator
                HStack {
                    HStack {
                        Image(systemName: question.category.icon)
                            .font(.caption)
                        Text(question.category.rawValue)
                            .font(.caption)
                            .fontWeight(.medium)
                    }
                    .foregroundColor(categoryColor)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(categoryColor.opacity(0.1))
                    .cornerRadius(12)

                    Spacer()

                    if isKnown {
                        HStack(spacing: 4) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.caption)
                            Text("Learned")
                                .font(.caption)
                                .fontWeight(.medium)
                        }
                        .foregroundColor(.popGold)
                    }
                }

                Spacer()

                if showAnswer {
                    Text("Answer")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(categoryColor)

                    Text(question.answer)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.popDarkBlue)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                } else {
                    Text("Question #\(question.id)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text(question.question)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.popDarkBlue)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }

                Spacer()

                Text(showAnswer ? "Tap to see question" : "Tap to reveal answer")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(24)
        }
        .frame(height: 350)
    }
}

#Preview {
    SouthDakotaLearnView()
}
