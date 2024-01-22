//
//  iDevFanApp.swift
//  iDevFan
//
//  Created by Abdusamad Mamasoliyev on 22/01/24.
//

import SwiftUI

@main
struct iDevFanApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
