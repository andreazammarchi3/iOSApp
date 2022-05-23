//
//  ContentView.swift
//  Travels
//
//  Created by Chiara Ceccarini on 22/04/22.
//

import SwiftUI


/// View for the Details UI, showed when a user click on an item
struct PlaceDetailsView: View {
    var place: Place
    @ObservedObject var viewModel: DataLoader
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                MapView(locationCoordinates: place.locationCoordinate)
                    .frame(height: 300)
                
                CircleImage(viewModel: viewModel, place: place)
                    .frame(width: UIScreen.main.bounds.width,
                            alignment: .center)
                    .offset(y: -130)
                    .padding(.bottom, -130)
            }
            
            VStack (alignment: .leading) {
                Text(place.name)
                    .font(.title)
                
                HStack {
                    Spacer()
                    Text(place.city)
                }.font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("Description")
                    .font(.title2)
                Text(place.description)

            }.padding()
        }.frame(width: UIScreen.main.bounds.width,
                alignment: .leading)
            //.ignoresSafeArea(edges: .top)
            .navigationTitle(place.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}
