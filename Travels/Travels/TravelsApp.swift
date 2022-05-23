//
//  TravelsApp.swift
//  Travels
//
//  Created by Andrea on 02/05/22.
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
