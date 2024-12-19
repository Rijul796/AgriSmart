//
//  CropDetails.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 19/12/24.
//


import Foundation

// MARK: - Crop Detail Screen Model
struct CropDetails {
    let id: Int
    let name: String
    let imageUrl: String
    let stockLeft: Double
    let stockSold: Double
    let pricePerKg: Double
    let expirationDate: Date
    let isLowStock: Bool
}

class CropDetailManager {
    static let shared = CropDetailManager()
    private var crops: [CropDetails] = []
    
    private init() {
        // Initialize with sample data if needed
    }
    
    func getCropDetails(by id: Int) -> CropDetails? {
        return crops.first { $0.id == id }
    }
    
    func updateCropStock(cropId: Int, newStockLeft: Double, newStockSold: Double) {
        if let index = crops.firstIndex(where: { $0.id == cropId }) {
            let crop = crops[index]
            crops[index] = CropDetails(
                id: crop.id,
                name: crop.name,
                imageUrl: crop.imageUrl,
                stockLeft: newStockLeft,
                stockSold: newStockSold,
                pricePerKg: crop.pricePerKg,
                expirationDate: crop.expirationDate,
                isLowStock: newStockLeft < 500 // Example threshold
            )
        }
    }
    
    func updateCropPrice(cropId: Int, newPrice: Double) {
        if let index = crops.firstIndex(where: { $0.id == cropId }) {
            let crop = crops[index]
            crops[index] = CropDetails(
                id: crop.id,
                name: crop.name,
                imageUrl: crop.imageUrl,
                stockLeft: crop.stockLeft,
                stockSold: crop.stockSold,
                pricePerKg: newPrice,
                expirationDate: crop.expirationDate,
                isLowStock: crop.isLowStock
            )
        }
    }
}

