//
//  NewsletterManager.swift
//  PoP
//
//  Manages newsletter signups with Core Data persistence and CSV export
//

import Foundation
import CoreData
import Combine

@MainActor
class NewsletterManager: ObservableObject {
    static let shared = NewsletterManager()

    private let viewContext: NSManagedObjectContext

    @Published private(set) var signupCount: Int = 0

    private init() {
        self.viewContext = PersistenceController.shared.container.viewContext
        updateCount()
    }

    // For previews
    init(inMemory: Bool) {
        self.viewContext = PersistenceController.preview.container.viewContext
    }

    private func updateCount() {
        let request: NSFetchRequest<NewsletterSignup> = NewsletterSignup.fetchRequest()
        do {
            signupCount = try viewContext.count(for: request)
        } catch {
            print("Failed to count signups: \(error)")
            signupCount = 0
        }
    }

    func addSignup(name: String, email: String) {
        let signup = NewsletterSignup(context: viewContext)
        signup.id = UUID()
        signup.name = name
        signup.email = email
        signup.signupDate = Date()
        signup.syncedToServer = false

        saveContext()
        updateCount()
    }

    func getAllSignups() -> [NewsletterSignup] {
        let request: NSFetchRequest<NewsletterSignup> = NewsletterSignup.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \NewsletterSignup.signupDate, ascending: false)]

        do {
            return try viewContext.fetch(request)
        } catch {
            print("Failed to fetch signups: \(error)")
            return []
        }
    }

    func exportToCSV() -> String {
        let signups = getAllSignups()
        var csv = "Name,Email,Signup Date\n"

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short

        for signup in signups {
            let name = (signup.name ?? "").replacingOccurrences(of: ",", with: " ")
            let email = signup.email ?? ""
            let date = signup.signupDate.map { dateFormatter.string(from: $0) } ?? ""
            csv += "\"\(name)\",\"\(email)\",\"\(date)\"\n"
        }

        return csv
    }

    func exportToFileURL() -> URL? {
        let csv = exportToCSV()
        let fileName = "pop_newsletter_signups.csv"

        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }

        let fileURL = documentDirectory.appendingPathComponent(fileName)

        do {
            try csv.write(to: fileURL, atomically: true, encoding: .utf8)
            return fileURL
        } catch {
            print("Failed to write CSV: \(error)")
            return nil
        }
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
