//
//  CheckInManager.swift
//  PoP
//
//  Manages event check-ins with Core Data persistence
//

import Foundation
import CoreData
import Combine

@MainActor
class CheckInManager: ObservableObject {
    static let shared = CheckInManager()

    @Published var recentCheckIns: [EventCheckIn] = []
    @Published var allCheckIns: [EventCheckIn] = []

    private let viewContext: NSManagedObjectContext

    private init() {
        viewContext = PersistenceController.shared.container.viewContext
        loadCheckIns()
    }

    // MARK: - Public Methods

    func checkIn(eventCode: String, eventName: String, volunteerName: String) {
        let checkIn = EventCheckIn(context: viewContext)
        checkIn.id = UUID()
        checkIn.eventCode = eventCode
        checkIn.eventName = eventName
        checkIn.volunteerName = volunteerName
        checkIn.checkInTime = Date()

        saveContext()
        loadCheckIns()
    }

    func loadCheckIns() {
        let request: NSFetchRequest<EventCheckIn> = EventCheckIn.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \EventCheckIn.checkInTime, ascending: false)]

        do {
            allCheckIns = try viewContext.fetch(request)
            recentCheckIns = Array(allCheckIns.prefix(10))
        } catch {
            print("Error fetching check-ins: \(error)")
            allCheckIns = []
            recentCheckIns = []
        }
    }

    func deleteCheckIn(_ checkIn: EventCheckIn) {
        viewContext.delete(checkIn)
        saveContext()
        loadCheckIns()
    }

    func clearAllCheckIns() {
        for checkIn in allCheckIns {
            viewContext.delete(checkIn)
        }
        saveContext()
        loadCheckIns()
    }

    // MARK: - CSV Export

    func exportToCSV() -> String {
        var csv = "Event Name,Event Code,Volunteer Name,Check-In Time\n"

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short

        for checkIn in allCheckIns {
            let eventName = checkIn.eventName ?? ""
            let eventCode = checkIn.eventCode ?? ""
            let volunteerName = checkIn.volunteerName ?? ""
            let checkInTime = checkIn.checkInTime.map { dateFormatter.string(from: $0) } ?? ""

            // Escape commas in fields
            let escapedName = volunteerName.contains(",") ? "\"\(volunteerName)\"" : volunteerName
            let escapedEventName = eventName.contains(",") ? "\"\(eventName)\"" : eventName

            csv += "\(escapedEventName),\(eventCode),\(escapedName),\(checkInTime)\n"
        }

        return csv
    }

    // MARK: - Private Methods

    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving check-in: \(error)")
        }
    }
}

// MARK: - EventCheckIn Extension
extension EventCheckIn {
    var formattedDate: String {
        guard let date = checkInTime else { return "" }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
