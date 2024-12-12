//
//  dataModel.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 12/12/24.
//

import Foundation

// home Screen



// Section 1: Farmer Information
struct Farmer {
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
    let farmers: [Farmer]
    let crops: [Crop]
    let map: MapSection
}

// Home Screen data example

let homeScreenData: HomeScreen = .init(
    farmers: [
        .init(id: 1, name: "Rohan Jain", imageName: "farmer1", rating: 4.5),
        .init(id: 2, name: "Ankit Sharma", imageName: "farmer2", rating: 4.5),
        .init(id: 3, name: "Aniket Sharma", imageName: "farmer3", rating: 4.5),
        ]
    , crops: [
        .init(id: 1, name: "Wheat", imageName: "wheat"),
        .init(id: 2, name: "Maize", imageName: "maize"),
        .init(id: 3, name: "Corn", imageName: "corn"),
    ]
    , map: .init(imageName: "map")
)

