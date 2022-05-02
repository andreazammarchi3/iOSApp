//
//  CircleImageView.swift
//  Travels
//
//  Created by Andrea on 02/05/22.
//

import SwiftUI

struct CircleImageView: View {
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        ZStack{
            Image(uiImage: imageLoader.image)
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .onAppear {
                    // imageLoader.loadImage(imageName: "campus")
                    imageLoader.loadImage(url: URL(string: "https://magazine.unibo.it/archivio/2018/inaugurato-il-nuovo-campus-di-cesena-allex-zuccherificio/cesena2.jpeg")!)
                }
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
            
            CircleProgressView(isLoading: $imageLoader.isLoading)
        }
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
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
