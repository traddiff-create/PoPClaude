//
//  CommonGroundQuizView.swift
//  PoP
//
//  Interactive quiz to discover core values.
//

import SwiftUI

struct CommonGroundQuizView: View {
    @State private var currentQuestionIndex = 0
    @State private var selectedOptionIndex: Int? = nil
    @State private var answers: [(questionIndex: Int, optionIndex: Int)] = []
    @State private var quizState: QuizState = .intro
    @State private var showingResults = false

    private let questions = CommonGroundData.valueQuestions

    enum QuizState {
        case intro
        case inProgress
        case complete
    }

    var body: some View {
        Group {
            switch quizState {
            case .intro:
                introView
            case .inProgress:
                questionView
            case .complete:
                EmptyView() // Navigation handles this
            }
        }
        .background(Color.popLightBackground)
        .navigationTitle("Common Ground")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $showingResults) {
            CommonGroundResultsView(answers: answers)
        }
    }

    // MARK: - Intro View

    private var introView: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 16) {
                    Image(systemName: "heart.circle.fill")
                        .font(.system(size: 64))
                        .foregroundColor(.purple)

                    Text("Discover Your Core Values")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.popDarkBlue)

                    Text("Answer 10 questions to explore what matters most to you—and discover how much you might share with people who vote differently.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding()

                // What to expect
                VStack(alignment: .leading, spacing: 12) {
                    Text("What to Expect")
                        .font(.headline)
                        .foregroundColor(.popDarkBlue)

                    VStack(alignment: .leading, spacing: 8) {
                        infoRow(icon: "clock", text: "Takes about 3 minutes")
                        infoRow(icon: "questionmark.circle", text: "No right or wrong answers")
                        infoRow(icon: "eye.slash", text: "Your answers stay on your device")
                        infoRow(icon: "person.2", text: "Discover shared values with others")
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)

                // Start Button
                Button {
                    withAnimation {
                        quizState = .inProgress
                    }
                } label: {
                    HStack {
                        Text("Start Quiz")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.popBlue)
                    .cornerRadius(12)
                }
            }
            .padding()
        }
    }

    private func infoRow(icon: String, text: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.popGold)
                .frame(width: 24)
            Text(text)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }

    // MARK: - Question View

    private var questionView: some View {
        VStack(spacing: 0) {
            // Progress
            progressSection

            ScrollView {
                VStack(spacing: 24) {
                    // Question Counter
                    QuestionCounter(current: currentQuestionIndex + 1, total: questions.count)

                    // Question
                    Text(questions[currentQuestionIndex].question)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.popDarkBlue)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    // Options
                    VStack(spacing: 12) {
                        ForEach(Array(questions[currentQuestionIndex].options.enumerated()), id: \.offset) { index, option in
                            QuestionOptionButton(
                                text: option.text,
                                isSelected: selectedOptionIndex == index
                            ) {
                                selectedOptionIndex = index
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Navigation
                    navigationButtons
                }
                .padding(.vertical, 24)
            }
        }
    }

    private var progressSection: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 4)

                Rectangle()
                    .fill(Color.popBlue)
                    .frame(width: geometry.size.width * CGFloat(currentQuestionIndex + 1) / CGFloat(questions.count), height: 4)
            }
        }
        .frame(height: 4)
    }

    private var navigationButtons: some View {
        HStack(spacing: 16) {
            // Back button
            if currentQuestionIndex > 0 {
                Button {
                    withAnimation {
                        currentQuestionIndex -= 1
                        // Restore previous selection
                        if let previous = answers.first(where: { $0.questionIndex == currentQuestionIndex }) {
                            selectedOptionIndex = previous.optionIndex
                        } else {
                            selectedOptionIndex = nil
                        }
                    }
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(.popBlue)
                    .padding()
                    .background(Color.popBlue.opacity(0.1))
                    .cornerRadius(10)
                }
            }

            Spacer()

            // Next/Finish button
            Button {
                if let selected = selectedOptionIndex {
                    // Record answer
                    answers.removeAll { $0.questionIndex == currentQuestionIndex }
                    answers.append((questionIndex: currentQuestionIndex, optionIndex: selected))

                    if currentQuestionIndex < questions.count - 1 {
                        withAnimation {
                            currentQuestionIndex += 1
                            selectedOptionIndex = nil
                        }
                    } else {
                        // Quiz complete
                        showingResults = true
                        quizState = .complete
                    }
                }
            } label: {
                HStack {
                    Text(currentQuestionIndex < questions.count - 1 ? "Next" : "See Results")
                        .fontWeight(.semibold)
                    Image(systemName: currentQuestionIndex < questions.count - 1 ? "chevron.right" : "sparkles")
                }
                .foregroundColor(.white)
                .padding()
                .background(selectedOptionIndex != nil ? Color.popBlue : Color.gray)
                .cornerRadius(10)
            }
            .disabled(selectedOptionIndex == nil)
        }
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        CommonGroundQuizView()
    }
}
