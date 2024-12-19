//
//  dataModel.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 12/12/24.
//

import Foundation

// MARK: - Farmer Struct
struct Farmer {
    var id: Int
    var name: String
    var profileImageUrl: String
    var starRating: Double
}

// MARK: - Crop Struct
struct Crop {
    var id: Int
    var name: String
    var imageUrl: String
}

// MARK: - HomeScreenData Class
class HomeScreenData {
    var farmers: [Farmer]
    var crops: [Crop]
    var mapImageUrl: String // This can be a placeholder URL or dynamically loaded
    
    private init(farmers: [Farmer], crops: [Crop], mapImageUrl: String) {
        self.farmers = farmers
        self.crops = crops
        self.mapImageUrl = mapImageUrl
    }
    
    // MARK: - Static Sample Data
    static func sampleData() -> HomeScreenData {
        let farmers = [
            Farmer(id: 1, name: "John Smith", profileImageUrl: "farmer1.jpg", starRating: 4.5),
            Farmer(id: 2, name: "Emily Brown", profileImageUrl: "farmer2.jpg", starRating: 4.7)
        ]
        
        let crops = [
            Crop(id: 1, name: "Tomatoes", imageUrl: "crop_tomatoes.jpg"),
            Crop(id: 2, name: "Carrots", imageUrl: "crop_carrots.jpg"),
            Crop(id: 3, name: "Potatoes", imageUrl: "crop_potatoes.jpg")
        ]
        
        let mapImageUrl = "map_placeholder.jpg" // Placeholder for map image
        
        return HomeScreenData(farmers: farmers, crops: crops, mapImageUrl: mapImageUrl)
    }
}

//func filterFarmers(byMinimumRating rating: Double) -> [Farmer] {
//    return farmers.filter { $0.starRating >= rating }
//}
//
//func sortCropsByName() -> [Crop] {
//    return crops.sorted { $0.name < $1.name }
//}
//
//func updateMapImage(withUrl newImageUrl: String) {
//    mapImageUrl = newImageUrl
//}
