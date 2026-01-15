//
//  BookmarkManager.swift
//  PoP
//
//  Manages document bookmarks with Core Data persistence
//

import Foundation
import CoreData
import Combine

@MainActor
class BookmarkManager: ObservableObject {
    static let shared = BookmarkManager()

    private let viewContext: NSManagedObjectContext

    @Published private(set) var bookmarkedDocumentIds: Set<UUID> = []

    private init() {
        self.viewContext = PersistenceController.shared.container.viewContext
        loadBookmarks()
    }

    // For previews
    init(inMemory: Bool) {
        self.viewContext = PersistenceController.preview.container.viewContext
    }

    private func loadBookmarks() {
        let request: NSFetchRequest<SavedDocument> = SavedDocument.fetchRequest()
        request.predicate = NSPredicate(format: "isBookmarked == YES")

        do {
            let results = try viewContext.fetch(request)
            bookmarkedDocumentIds = Set(results.compactMap { $0.id })
        } catch {
            print("Failed to load bookmarks: \(error)")
        }
    }

    func isBookmarked(_ documentId: UUID) -> Bool {
        bookmarkedDocumentIds.contains(documentId)
    }

    func toggleBookmark(for document: FoundingDocument) {
        let savedDoc = fetchOrCreateSavedDocument(for: document)
        savedDoc.isBookmarked.toggle()

        if savedDoc.isBookmarked {
            bookmarkedDocumentIds.insert(document.id)
        } else {
            bookmarkedDocumentIds.remove(document.id)
        }

        saveContext()
    }

    func getBookmarkedDocuments() -> [FoundingDocument] {
        FoundingDocuments.all.filter { bookmarkedDocumentIds.contains($0.id) }
    }

    private func fetchOrCreateSavedDocument(for document: FoundingDocument) -> SavedDocument {
        let request: NSFetchRequest<SavedDocument> = SavedDocument.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", document.id as CVarArg)
        request.fetchLimit = 1

        if let existing = try? viewContext.fetch(request).first {
            return existing
        }

        let savedDoc = SavedDocument(context: viewContext)
        savedDoc.id = document.id
        savedDoc.title = document.title
        savedDoc.category = document.category
        savedDoc.content = document.content
        savedDoc.isBookmarked = false
        savedDoc.lastAccessed = Date()

        return savedDoc
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
