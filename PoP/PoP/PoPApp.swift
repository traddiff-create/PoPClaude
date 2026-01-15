//
//  PoPApp.swift
//  PoP
//
//  Created by Rory Stone on 1/14/26.
//

import SwiftUI
import CoreData

@main
struct PoPApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
