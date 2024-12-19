//
//  homescreen.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//
import UIKit
import Foundation
struct Farmer {
    let id: String
    let name: String
    let profileImageURL: String
    let notificationCount: Int
}

struct Post {
    let id: String
    let farmerId: String
    let imageURLs: [String]
    let description: String?
    let timestamp: Date
}

struct Listing {
    let id: String
    let farmerId: String
    let cropName: String
    let imageURL: String
    let stockPercentage: Double
    let totalStock: Int?
    let unitPrice: Double
    let isPublished: Bool
}

struct OrderOverview {
    let totalOrders: Int
    let totalSales: Double
    let pendingOrders: Int
    let completedOrders: Int
}
