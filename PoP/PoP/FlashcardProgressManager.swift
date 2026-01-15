//
//  FlashcardProgressManager.swift
//  PoP
//
//  Manages flashcard learning progress with Core Data persistence
//

import Foundation
import CoreData
import Combine

@MainActor
class FlashcardProgressManager: ObservableObject {
    static let shared = FlashcardProgressManager()

    private let viewContext: NSManagedObjectContext

    @Published private(set) var knownQuestionIds: Set<Int> = []
    @Published private(set) var viewedQuestionIds: Set<Int> = []

    var knownCount: Int { knownQuestionIds.count }
    var viewedCount: Int { viewedQuestionIds.count }
    var totalCount: Int { CivicsData.questions.count }

    private init() {
        self.viewContext = PersistenceController.shared.container.viewContext
        loadProgress()
    }

    // For previews
    init(inMemory: Bool) {
        self.viewContext = PersistenceController.preview.container.viewContext
    }

    private func loadProgress() {
        let request: NSFetchRequest<FlashcardProgress> = FlashcardProgress.fetchRequest()

        do {
            let results = try viewContext.fetch(request)
            for progress in results {
                let questionId = Int(progress.questionId)
                viewedQuestionIds.insert(questionId)
                if progress.isMarkedKnown {
                    knownQuestionIds.insert(questionId)
                }
            }
        } catch {
            print("Failed to load flashcard progress: \(error)")
        }
    }

    func markViewed(questionId: Int) {
        viewedQuestionIds.insert(questionId)

        let progress = fetchOrCreateProgress(for: questionId)
        progress.timesViewed += 1
        progress.lastViewed = Date()

        saveContext()
    }

    func toggleKnown(questionId: Int) {
        let progress = fetchOrCreateProgress(for: questionId)
        progress.isMarkedKnown.toggle()

        if progress.isMarkedKnown {
            knownQuestionIds.insert(questionId)
        } else {
            knownQuestionIds.remove(questionId)
        }

        saveContext()
    }

    func isKnown(questionId: Int) -> Bool {
        knownQuestionIds.contains(questionId)
    }

    func resetAllProgress() {
        let request: NSFetchRequest<NSFetchRequestResult> = FlashcardProgress.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)

        do {
            try viewContext.execute(deleteRequest)
            try viewContext.save()
            knownQuestionIds.removeAll()
            viewedQuestionIds.removeAll()
        } catch {
            print("Failed to reset progress: \(error)")
        }
    }

    private func fetchOrCreateProgress(for questionId: Int) -> FlashcardProgress {
        let request: NSFetchRequest<FlashcardProgress> = FlashcardProgress.fetchRequest()
        request.predicate = NSPredicate(format: "questionId == %d", questionId)
        request.fetchLimit = 1

        if let existing = try? viewContext.fetch(request).first {
            return existing
        }

        let newProgress = FlashcardProgress(context: viewContext)
        newProgress.id = UUID()
        newProgress.questionId = Int32(questionId)
        newProgress.timesViewed = 0
        newProgress.isMarkedKnown = false
        newProgress.lastViewed = nil

        return newProgress
    }

    private func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Failed to save context: \(error)")
            }
        }
    }
}
