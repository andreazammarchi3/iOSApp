//
//  ContentView.swift
//  Travels
//
//  Created by Andrea on 02/05/22.
//

import SwiftUI

struct PlaceDescriptionView: View {
    var place: Place
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                MapView(locationCoordinates: place.locationCoordinates).frame(height: 300)
                
                CircleImageView(image: place.imageUrl)
                    .frame(width: UIScreen.main.bounds.width)
                    .offset(y: -130)
                    .padding(.bottom, -130)
            }
            
            VStack(alignment: .leading) {
                Text(place.name).font(.title)
                
                HStack {
                    Spacer()
                    Text(place.city).font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                Text("Description").font(.title2)
                Text(place.description)
            }.padding()
        }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
            .ignoresSafeArea(edges: .top)
    }
}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDescriptionView()
    }
}
 */
