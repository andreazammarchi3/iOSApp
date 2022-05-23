//
//  MapView.swift
//  Travels
//
//  Created by Andrea on 02/05/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    var locationCoordinates: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate: locationCoordinates)
            }
    }
    
    func setRegion(coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

/*
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
 */
