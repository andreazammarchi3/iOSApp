//
//  AddPlaceView.swift
//  TravelsCoreData
//
//  Created by Chiara Ceccarini on 17/05/22.
//

import SwiftUI

struct AddPlaceView: View {
    @State var placeName = ""
    @State var placeCity = ""
    @State var placeDescription = ""
    @State var latitude = ""
    @State var longitude = ""
    @State var image = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewModel: DataLoader
    
    @ObservedObject var locationViewModel = LocationViewModel()

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Place Details")) {
                    TextField("Name", text: $placeName)
                    TextField("City", text: $placeCity)
                    TextField("Description", text: $placeDescription)
                }
                Section(header: Text("Coordinates")) {
                    TextField("Latitude", text: $latitude)
                        .keyboardType(.numberPad)
                        .onChange(of: locationViewModel.latitude) { value in
                                    latitude = String(format: "%1f", value)
                        }
                    TextField("Longitude", text: $longitude)
                        .keyboardType(.numberPad)
                        .onChange(of: locationViewModel.longitude) { value in
                                    longitude = String(format: "%1f", value)
                        }
                    Button {
                        locationViewModel.startMySignificantLocationChanges()
                        latitude = String(format: "%1f", locationViewModel.latitude)
                        longitude = String(format: "%1f", locationViewModel.longitude)
                    } label: {
                        Text("Get GPS")
                    }

                }
                Section(header: Text("Image")) {
                    TextField("Image URL", text: $image)
                }
                Button {
                    viewModel.addItem(placeName: placeName, placeDescription: placeDescription, image: image, city: placeCity, latitude: latitude, longitude: longitude, viewContext: viewContext)
                    
                    dismiss()
                } label: {
                    Text("Add Place")
                }

            }.navigationTitle("Add Place")
        }
    }
}

