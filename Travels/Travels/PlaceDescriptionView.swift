//
//  ContentView.swift
//  Travels
//
//  Created by Andrea on 02/05/22.
//

import SwiftUI

struct PlaceDescriptionView: View {
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                MapView().frame(height: 300)
                
                CircleImageView()
                    .frame(width: UIScreen.main.bounds.width)
                    .offset(y: -130)
                    .padding(.bottom, -130)
            }
            
            VStack(alignment: .leading) {
                Text("Campus Cesena").font(.title)
                
                HStack {
                    Spacer()
                    Text("Cesena").font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                Text("Description").font(.title2)
                Text("Lorem Ipsum")
            }.padding()
        }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
            .ignoresSafeArea(edges: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDescriptionView()
    }
}
