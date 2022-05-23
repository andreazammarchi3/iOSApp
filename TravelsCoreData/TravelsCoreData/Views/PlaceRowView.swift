//
//  PlaceRowView.swift
//  Travels
//
//  Created by Chiara Ceccarini on 09/05/22.
//

import SwiftUI


/// View for the NavigationLink
struct PlaceRowView: View {
    @ObservedObject var viewModel: DataLoader
    var place: Place
    
    var body: some View {
        HStack {
            Image (uiImage: viewModel.images[place.id] ?? viewModel.notFoundImage!)
                .resizable()
                .frame(width: 50, height: 50)
                .onAppear {
                    viewModel.loadImage(url: place.imageUrl, id: place.id)
                }
            Text(place.name)
        }
    }
}
