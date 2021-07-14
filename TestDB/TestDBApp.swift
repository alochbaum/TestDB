//
//  TestDBApp.swift
//  TestDB
//
//  Created by Andrew Lochbaum on 7/14/21.
//

import SwiftUI

@main
struct TestDBApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
