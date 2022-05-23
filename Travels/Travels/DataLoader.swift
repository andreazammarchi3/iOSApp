//
//  DataLoader.swift
//  Travels
//
//  Created by Andrea on 23/05/22.
//

import Foundation
import SwiftUI

class DataLoader: ObservableObject {
    @Published var model = ModelData<Place>(fileName: "places")
    
    //MARK: -Access to model
    var places: [Place] {
        model.list
    }
    
    @Published var image = UIImage()
    var isLoading = true
    
    //MARK: -Utilities
    func loadImage(imageName: String) {
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
    }
}
