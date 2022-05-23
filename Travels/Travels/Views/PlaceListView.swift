//
//  PlaceListView.swift
//  Travels
//
//  Created by Chiara Ceccarini on 09/05/22.
//

import SwiftUI

/// View for the HomePage, showing the list of item
struct PlaceListView: View {
    @ObservedObject var viewModel: DataLoader
    
    var body: some View {
        NavigationView {
            List(viewModel.places) { place in
                NavigationLink(destination: PlaceDetailsView(place: place)) {
                    PlaceRowView(place: place)
                }
            }.navigationTitle("Places")
        }
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(viewModel: DataLoader())
    }
}
