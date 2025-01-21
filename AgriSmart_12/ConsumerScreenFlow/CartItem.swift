//
//  CartItem.swift
//  AgriSmart_12
//
//  Created by student-2 on 15/01/25.
//


import Foundation

struct CartItem {
    let id: UUID
    let name: String
    let details: String
    let pricePerUnit: Int
    var quantity: Int
    let imageName: String? // Name of the image asset
    
    init(product: Product) {
        self.id = product.id
        self.name = product.name
        self.details = product.description
        self.pricePerUnit = Int(product.pricePerKg)
        self.quantity = 1
        self.imageName = product.imageNames.first
    }
}
