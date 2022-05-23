//
//  CircleImageView.swift
//  Travels
//
//  Created by Andrea on 02/05/22.
//

import SwiftUI

struct CircleImageView: View {
    @ObservedObject var viewModel = DataLoader()
    var image: URL
    
    var body: some View {
        ZStack{
            Image(uiImage: viewModel.image)
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .onAppear {
                    // imageLoader.loadImage(imageName: "campus")
                    viewModel.loadImage(url: image)
                }
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
            
            CircleProgressView(isLoading: $viewModel.isLoading)
        }
    }
}

/*
struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
 */

struct CircleProgressView: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        if isLoading {
            ProgressView()
        }
    }
}
