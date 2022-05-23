//
//  TravelsCoreDataApp.swift
//  TravelsCoreData
//
//  Created by Chiara Ceccarini on 09/05/22.
//

import SwiftUI

@main
struct TravelsCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            PlaceListView(viewModel: DataLoader())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
