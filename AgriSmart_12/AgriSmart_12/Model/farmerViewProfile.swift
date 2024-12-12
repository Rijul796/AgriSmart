//
//  farmerViewProfile.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 12/12/24.
//

import Foundation
struct FarmerProfileView {
    let id: String
    let name: String
    let username: String
    let profilePictureURL: String
    let rating: Double
    let crops: [Crop]
    var isFollowed: Bool
}

struct CropProfile {
    let id: String
    let name: String
    let imageUrl: String
    let pricePerKg: Double
    let rating: Double
    let reviewsCount: Int
}

