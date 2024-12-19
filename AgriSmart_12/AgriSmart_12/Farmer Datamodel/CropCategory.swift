//
//  CropCategory.swift
//  AgriSmart_12
//
//  Created by student-2 on 19/12/24.
//


import Foundation

// MARK: - Crop Namespace
enum FarmData {
    // MARK: - Crop Category
    enum CropCategory: String, CaseIterable {
        case vegetables = "Vegetables"
        case fruits = "Fruits"
        case grains = "Grains"
        case pulses = "Pulses"
    }

    // MARK: - Crop Status
    enum CropStatus: String, CaseIterable {
        case available = "Available"
        case soldOut = "Sold Out"
        case expired = "Expired"

        var displayColor: String {
            switch self {
            case .available: return "green"
            case .soldOut: return "gray"
            case .expired: return "red"
            }
        }
    }

    // MARK: - Crop Model
    struct Crop: Identifiable {
        let id: UUID
        var name: String
        var pricePerUnit: Double
        var quantityAvailable: Double
        var originalQuantity: Double
        var category: CropCategory
        var status: CropStatus
        var expiryDate: Date
        var imageUrl: String

        var percentageLeft: Int {
            Int((quantityAvailable / originalQuantity) * 100)
        }

        var formattedPrice: String {
            return "₹\(Int(pricePerUnit)) per kg"
        }

        var formattedExpiryDate: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "d/M/yyyy"
            return "Expiry date: \(formatter.string(from: expiryDate))"
        }
    }

    // MARK: - Crop Manager
    class CropManager {
        static let shared = CropManager()
        private var crops: [Crop] = []

        private init() {
            setupSampleData()
        }

        private func setupSampleData() {
            let sampleCrops = [
                Crop(id: UUID(),
                     name: "Tomatoes",
                     pricePerUnit: 22,
                     quantityAvailable: 60,
                     originalQuantity: 100,
                     category: .vegetables,
                     status: .available,
                     expiryDate: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 2))!,
                     imageUrl: "tomatoes"),
                
                Crop(id: UUID(),
                     name: "Carrots",
                     pricePerUnit: 55,
                     quantityAvailable: 54,
                     originalQuantity: 100,
                     category: .vegetables,
                     status: .available,
                     expiryDate: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 2))!,
                     imageUrl: "carrots"),
                
                Crop(id: UUID(),
                     name: "Lettuce",
                     pricePerUnit: 40,
                     quantityAvailable: 34,
                     originalQuantity: 100,
                     category: .vegetables,
                     status: .available,
                     expiryDate: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 2))!,
                     imageUrl: "lettuce"),
                
                Crop(id: UUID(),
                     name: "Potatoes",
                     pricePerUnit: 24,
                     quantityAvailable: 0,
                     originalQuantity: 100,
                     category: .vegetables,
                     status: .soldOut,
                     expiryDate: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 2))!,
                     imageUrl: "potatoes")
            ]
            
            crops = sampleCrops
        }

        // MARK: - Public Methods
        func getAllCrops() -> [Crop] {
            return crops
        }

        func getCrop(by id: UUID) -> Crop? {
            return crops.first { $0.id == id }
        }

        func addCrop(_ crop: Crop) {
            crops.append(crop)
        }

        func updateCrop(_ updatedCrop: Crop) -> Bool {
            guard let index = crops.firstIndex(where: { $0.id == updatedCrop.id }) else {
                return false
            }
            crops[index] = updatedCrop
            return true
        }

        func deleteCrop(id: UUID) -> Bool {
            guard let index = crops.firstIndex(where: { $0.id == id }) else {
                return false
            }
            crops.remove(at: index)
            return true
        }

        func updateCropStatus(id: UUID, newStatus: CropStatus) -> Bool {
            guard let index = crops.firstIndex(where: { $0.id == id }) else {
                return false
            }
            crops[index].status = newStatus
            return true
        }

        func updateQuantity(id: UUID, newQuantity: Double) -> Bool {
            guard let index = crops.firstIndex(where: { $0.id == id }) else {
                return false
            }
            crops[index].quantityAvailable = newQuantity
            
            // Automatically update status if sold out
            if newQuantity == 0 {
                crops[index].status = .soldOut
            } else if crops[index].status == .soldOut {
                crops[index].status = .available
            }
            
            return true
        }
    }
}
