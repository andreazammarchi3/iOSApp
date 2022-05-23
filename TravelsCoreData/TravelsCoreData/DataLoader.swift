//
//  DataLoader.swift
//  Travels
//
//  Created by Chiara Ceccarini on 09/05/22.
//

import Foundation
import SwiftUI
import CoreData

/// ViewModel
class DataLoader: ObservableObject {
    @Published var model = ModelData<Place>(fileName: "places")
    
    //MARK: -Access to model
    var places: [Place] {
        model.list
    }
    
    //@Published var image = UIImage()
    @Published var images: [Int: UIImage] = [:]
    var isLoading = true
    
    //MARK: -Utilities
    /*func loadImage(imageName: String) {
        image = UIImage(named: imageName)!
        self.isLoading = false
    }
    
    func loadImage(url:URL) {
        DispatchQueue.global(qos: .background).async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                if let imageData = data {
                    self.image = UIImage(data: imageData)!
                    self.isLoading = false
                }
            }
        }
    }*/
    
    let notFoundImage = UIImage(systemName: "multiply.circle")
    
    func loadImage(url:URL, id: Int) {
        self.isLoading = true
        DispatchQueue.global(qos: .background).async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                if let imageData = data {
                    self.images[id] = UIImage(data: imageData)!
                    self.isLoading = false
                }
            }
        }
    }
    
    func addItem(viewContext: NSManagedObjectContext) {
        withAnimation {
            let newItem = PlaceEntity(context: viewContext)
            newItem.id = 3
            newItem.name = "Prova"
        }
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
