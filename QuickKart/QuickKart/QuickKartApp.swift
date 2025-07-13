//
//  QuickKartApp.swift
//  QuickKart
//
//  Created by Sumanth Maddela on 26/06/25.
//

import SwiftUI

@main
struct QuickKartApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ProductListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
