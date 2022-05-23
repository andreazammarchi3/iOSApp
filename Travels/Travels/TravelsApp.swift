//
//  TravelsApp.swift
//  Travels
//
//  Created by Chiara Ceccarini on 22/04/22.
//

import SwiftUI

@main
struct TravelsApp: App {
    var body: some Scene {
        WindowGroup {
            PlaceListView(viewModel: DataLoader())
        }
    }
}
