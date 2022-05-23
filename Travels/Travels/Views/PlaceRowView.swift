//
//  PlaceRowView.swift
//  Travels
//
//  Created by Andrea on 23/05/22.
//

import SwiftUI

struct PlaceRowView: View {
    var place: Place
    
    @ObservedObject var viewModel = DataLoader()
    
    var body: some View {
        HStack {
            Image(uiImage: viewModel.image)
                .resizable()
                .frame(width: 50, height: 50, alignment: .leading)
                .onAppear {
                    viewModel.loadImage(url: place.imageUrl)
                }
            Text(place.name)
        }
    }
}

/*
struct PlaceRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceRowView()
    }
}
*/
