//
//  CicleImage.swift
//  Travels
//
//  Created by Chiara Ceccarini on 22/04/22.
//

import SwiftUI

struct CircleImage: View {
    
    @ObservedObject var viewModel = DataLoader()
    var image: URL
    
    var body: some View {
        ZStack {
            Image (uiImage: viewModel.image)
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
                .onAppear {
                    //imageLoader.loadImage(imageName: "campus")
                    viewModel.loadImage(url: image)
                }
            CircleProgressView(isLoading: $viewModel.isLoading)
               
        }
        
       
    }
}

struct CircleProgressView: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        if isLoading {
            ProgressView()
        }
    }
}

