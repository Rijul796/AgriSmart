//
//  CartItem.swift
//  AgriSmart_12
//
//  Created by student-2 on 21/01/25.
//


import Foundation

// Conforming CartItem to Codable
struct CartItem: Codable {
    let id: UUID
    let name: String
    let details: String
    let pricePerUnit: Int
    var quantity: Int
    let imageName: String? // Name of the image asset
    
    // Initializer to convert Product to CartItem
    init(product: Product) {
        self.id = product.id
        self.name = product.name
        self.details = product.description
        self.pricePerUnit = Int(product.pricePerKg)
        self.quantity = 1
        self.imageName = product.imageNames.first
    }
}
