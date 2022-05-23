//
//  MapView.swift
//  Travels
//
//  Created by Chiara Ceccarini on 22/04/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    var locationCoordinates: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion ()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(locationCoordinates)
            }
    }
    
    func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate,
                                    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}
