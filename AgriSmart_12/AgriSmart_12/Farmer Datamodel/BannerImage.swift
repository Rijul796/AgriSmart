//
//  BannerImage.swift
//  AgriSmart_12
//
//  Created by student-2 on 19/12/24.
//


import Foundation

// Currency formatter for Indian Rupees
extension NumberFormatter {
    static let indianCurrency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_IN")
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }()
}

// Structure to represent banner/slider images
struct BannerImage {
    var id: Int
    var imageUrl: String
    var title: String
    var subtitle: String?
}

// Structure to represent produce listing status
struct ProduceStatus {
    var percentageLeft: Int
    var totalQuantity: Double
    var unit: String // e.g., "kg", "quintal", "ton"
}

// Structure to represent a produce listing
struct ProduceListing {
    var id: Int
    var farmerId: Int
    var title: String
    var description: String
    var category: String // e.g., "Organic", "Traditional"
    var type: String // e.g., "Wheat", "Corn"
    var pricePerUnit: Double // Price in INR
    var imageUrl: String
    var status: ProduceStatus
    var createdAt: Date
    var location: String
    var isOrganic: Bool
    
    // Formatted price string with ₹ symbol
    var formattedPrice: String {
        return NumberFormatter.indianCurrency.string(from: NSNumber(value: pricePerUnit)) ?? "₹\(pricePerUnit)"
    }
    
    // Price with unit
    var priceWithUnit: String {
        return "\(formattedPrice)/\(status.unit)"
    }
}

// Structure to represent an order
struct Order {
    var id: Int
    var produceListing: ProduceListing
    var buyerId: Int
    var quantity: Double
    var status: OrderStatus
    var createdAt: Date
    var updatedAt: Date
    
    // Calculate total price in INR
    var totalPrice: Double {
        return produceListing.pricePerUnit * quantity
    }
    
    // Formatted total price string with ₹ symbol
    var formattedTotalPrice: String {
        return NumberFormatter.indianCurrency.string(from: NSNumber(value: totalPrice)) ?? "₹\(totalPrice)"
    }
}

// Enum to represent order status
enum OrderStatus {
    case pending
    case accepted
    case inTransit
    case completed
    case cancelled
}

// Class to manage all data operations
class AgriSmartDataModel {
    private var bannerImages: [BannerImage] = []
    private var produceListings: [ProduceListing] = []
    private var orders: [Order] = []
    
    static let shared = AgriSmartDataModel()
    
    private init() {
        setupSampleData()
    }
    
    private func setupSampleData() {
        // Sample Banner Images
        bannerImages = [
            BannerImage(
                id: 1,
                imageUrl: "banner_welcome",
                title: "Welcome Farmers",
                subtitle: "Manage Your Produce"
            ),
            BannerImage(
                id: 2,
                imageUrl: "banner_organic",
                title: "Go Organic",
                subtitle: "Better prices for organic produce"
            )
        ]
        
        // Sample Produce Listings
        produceListings = [
            ProduceListing(
                id: 1,
                farmerId: 101,
                title: "Organic Wheat",
                description: "Fresh organic wheat harvested from sustainable farms",
                category: "Organic",
                type: "Wheat",
                pricePerUnit: 3500.00, // ₹3,500 per quintal
                imageUrl: "wheat_image",
                status: ProduceStatus(
                    percentageLeft: 50,
                    totalQuantity: 100.0,
                    unit: "quintal"
                ),
                createdAt: Date(),
                location: "Punjab",
                isOrganic: true
            ),
            ProduceListing(
                id: 2,
                farmerId: 101,
                title: "Organic Corn",
                description: "Premium quality organic corn",
                category: "Organic",
                type: "Corn",
                pricePerUnit: 2800.00, // ₹2,800 per quintal
                imageUrl: "corn_image",
                status: ProduceStatus(
                    percentageLeft: 40,
                    totalQuantity: 50.0,
                    unit: "quintal"
                ),
                createdAt: Date(),
                location: "Haryana",
                isOrganic: true
            )
        ]
    }
    
    // MARK: - Banner Images Methods
    func getAllBannerImages() -> [BannerImage] {
        return bannerImages
    }
    
    // MARK: - Produce Listing Methods
    func getAllProduceListings() -> [ProduceListing] {
        return produceListings
    }
    
    func getProduceListing(by id: Int) -> ProduceListing? {
        return produceListings.first { $0.id == id }
    }
    
    func getProduceListings(by category: String) -> [ProduceListing] {
        return produceListings.filter { $0.category == category }
    }
    
    func getProduceListings(priceRange: ClosedRange<Double>) -> [ProduceListing] {
        return produceListings.filter { priceRange.contains($0.pricePerUnit) }
    }
    
    func getOrganicProduceListings() -> [ProduceListing] {
        return produceListings.filter { $0.isOrganic }
    }
    
    func addProduceListing(_ listing: ProduceListing) {
        produceListings.append(listing)
    }
    
    func updateProduceListing(_ listing: ProduceListing) {
        if let index = produceListings.firstIndex(where: { $0.id == listing.id }) {
            produceListings[index] = listing
        }
    }
    
    // MARK: - Order Methods
    func getOrders(for farmerId: Int) -> [Order] {
        return orders.filter { $0.produceListing.farmerId == farmerId }
    }
    
    func updateOrderStatus(_ orderId: Int, status: OrderStatus) {
        if let index = orders.firstIndex(where: { $0.id == orderId }) {
            var updatedOrder = orders[index]
            updatedOrder.status = status
            updatedOrder.updatedAt = Date()
            orders[index] = updatedOrder
        }
    }
    
    // Get total sales value for a farmer
    func getTotalSales(for farmerId: Int) -> Double {
        return orders
            .filter { $0.produceListing.farmerId == farmerId && $0.status == .completed }
            .reduce(0) { $0 + $1.totalPrice }
    }
    
    // Get formatted total sales string
    func getFormattedTotalSales(for farmerId: Int) -> String {
        let total = getTotalSales(for: farmerId)
        return NumberFormatter.indianCurrency.string(from: NSNumber(value: total)) ?? "₹\(total)"
    }
}