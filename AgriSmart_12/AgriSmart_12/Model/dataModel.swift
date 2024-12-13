//
//  dataModel.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 12/12/24.
//

// Section 1: Farmer Information
import Foundation
struct FarmersList {
    let id: Int         // Unique identifier
    let name: String    // Farmer's name
    let imageName: String // Name of the image asset or URL
    let rating: Double  // Star rating (e.g., 4.5)
}

// Section 2: Crop Information
struct Crop {
    let id: Int         // Unique identifier
    let name: String    // Crop's name
    let imageName: String // Name of the image asset or URL
}

// Section 3: Map Section
struct MapSection {
    let imageName: String // Name of the map image asset or URL
}

// Home Screen Data Model
struct HomeScreen {
    let farmers: [FarmersList]
    let crops: [Crop]
    let map: MapSection

    // Function to sort farmers by their rating (descending order)
    func sortedFarmersByRating() -> [FarmersList] {
        return farmers.sorted { $0.rating > $1.rating }
    }
}

// Sample Data
let sampleFarmersList = [
    FarmersList(id: 1, name: "John Doe", imageName: "farmer1.jpg", rating: 4.7),
    FarmersList(id: 2, name: "Alice Smith", imageName: "farmer2.jpg", rating: 4.9),
    FarmersList(id: 3, name: "Robert Brown", imageName: "farmer3.jpg", rating: 4.3),
    FarmersList(id: 4, name: "Emily Davis", imageName: "farmer4.jpg", rating: 4.8)
]

let sampleCrops = [
    Crop(id: 1, name: "Tomatoes", imageName: "tomatoes.jpg"),
    Crop(id: 2, name: "Potatoes", imageName: "potatoes.jpg"),
    Crop(id: 3, name: "Carrots", imageName: "carrots.jpg"),
    Crop(id: 4, name: "Cucumbers", imageName: "cucumbers.jpg")
]

let sampleMap = MapSection(imageName: "map.jpg")

let homeScreenData = HomeScreen(farmers: sampleFarmersList, crops: sampleCrops, map: sampleMap)

// Sorted Farmers by Rating
//let sortedFarmersList = homeScreenData.sortedFarmersByRating()
//print("Sorted Farmers by Rating:")
//for farmer in sortedFarmersList {
//    print("\(farmer.name): \(farmer.rating) stars")
//}
