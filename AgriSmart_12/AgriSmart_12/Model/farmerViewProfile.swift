//
//  farmerViewProfile.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 12/12/24.
//

import Foundation
// MARK: - CropProfile Model
struct CropProfile {
    let id: Int // Changed from String to Int
    let name: String
    let imageUrl: String
    let pricePerKg: Double
    let rating: Double
    let reviewsCount: Int
}

// MARK: - FarmerProfileView Model
final class FarmerProfileView {
    let id: Int // Changed from String to Int
    let name: String
    let username: String
    let profilePictureURL: String
    let rating: Double
    var crops: [CropProfile] // CropProfile array
    var isFollowed: Bool
    
    // MARK: - Private Initializer
    private init(id: Int, name: String, username: String, profilePictureURL: String, rating: Double, crops: [CropProfile], isFollowed: Bool) {
        self.id = id
        self.name = name
        self.username = username
        self.profilePictureURL = profilePictureURL
        self.rating = rating
        self.crops = crops
        self.isFollowed = isFollowed
    }
    
    // MARK: - Public Method to Create a Farmer Profile View
    static func createFarmerProfileView(id: Int, name: String, username: String, profilePictureURL: String, rating: Double, crops: [CropProfile], isFollowed: Bool) -> FarmerProfileView {
        return FarmerProfileView(id: id, name: name, username: username, profilePictureURL: profilePictureURL, rating: rating, crops: crops, isFollowed: isFollowed)
    }
}

let crop1 = CropProfile(id: 1, name: "Tomatoes", imageUrl: "tomatoes.jpg", pricePerKg: 10.0, rating: 4.5, reviewsCount: 120)
let crop2 = CropProfile(id: 2, name: "Carrots", imageUrl: "carrots.jpg", pricePerKg: 20.0, rating: 4.7, reviewsCount: 98)

let farmerProfileView = FarmerProfileView.createFarmerProfileView(id: 101, name: "John Smith", username: "farmerjohn", profilePictureURL: "john.jpg", rating: 4.6, crops: [crop1, crop2], isFollowed: false)
