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
    
    init(id: Int, name: String, city: String, description: String, image: String, latitude: Double, longitude: Double){
        self.id = id
        self.name = name
        self.city = city
        self.image = image
        self.description = description
        self.coordinates = Coordinates(latitude: latitude, longitude: longitude)
    }
}

struct Coordinates: Decodable {
    var latitude: Double
    var longitude: Double
}
