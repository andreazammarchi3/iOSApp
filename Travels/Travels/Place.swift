//
//  Place.swift
//  Travels
//
//  Created by Chiara Ceccarini on 09/05/22.
//

import Foundation
import CoreLocation


/// Model for our application
struct Place: Identifiable, Decodable {
    var id: Int
    var name: String
    var city: String
    var description: String
    
    private var image: String
    var imageUrl: URL {
        URL(string: image)!
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}

struct Coordinates: Decodable {
    var latitude: Double
    var longitude: Double
}
