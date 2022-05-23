//
//  PlaceEntity.swift
//  TravelsCoreData
//
//  Created by Chiara Ceccarini on 10/05/22.
//

import Foundation
import CoreData

// Extension to the class inside the CoreData
extension PlaceEntity {
    
    
    /// Function that fetches the request for the CoreData
    /// - Parameter predicate: predicate to add in the request
    /// - Returns: the rquest made
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<PlaceEntity> {
        let request = NSFetchRequest<PlaceEntity>(entityName: "PlaceEntity")
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: false)]
        request.predicate = predicate
        return request
    }
    
    
    
    /// function that convert an element inside the CoreData into a Place element
    /// - Returns: the Place
    func convertToPlace() -> Place {
        Place(id: Int(self.id), name: self.name!, city: self.city!,
              description: self.placeDescription!,
              image: self.image, latitude: self.latitude, longitude: self.longitude)
    }

    //MARK: properties
    var image: String {
        get { (image_ ?? "").isEmpty ? "https://static.thenounproject.com/png/1400397-200.png" : image_! }
        set { image_ = newValue }
    }
}
