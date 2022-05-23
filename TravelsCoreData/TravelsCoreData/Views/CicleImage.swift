//
//  CicleImage.swift
//  Travels
//
//  Created by Chiara Ceccarini on 22/04/22.
//

import SwiftUI

struct CircleImage: View {
    @ObservedObject var viewModel : DataLoader
    let place: Place
    //var image: URL
    
    var body: some View {
        ZStack {
            Image (uiImage: viewModel.images[place.id] ?? viewModel.notFoundImage!)
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
                .onAppear {
                    //imageLoader.loadImage(imageName: "campus")
                    viewModel.loadImage(url: place.imageUrl, id: place.id)
                }
            CircleProgressView(isLoading: $viewModel.isLoading)
        }
    }
}

/// Struct representing the circle progressView, visible when the image is not loaded yet
struct CircleProgressView: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        if isLoading {
            ProgressView()
        }
    }
}

