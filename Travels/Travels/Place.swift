//
//  Place.swift
//  Travels
//
//  Created by Andrea on 23/05/22.
//

import Foundation
import CoreLocation

struct Place: Identifiable, Decodable {
    var id: Int
    var name: String
    var description: String
    var city: String
    
    private var image: String
    var imageUrl: URL {
        URL(string: image)!
    }
    
    private var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}

struct Coordinates: Decodable {
    var latitude: Double
    var longitude: Double
}
