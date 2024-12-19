//
//  Product.swift
//  AgriSmart_12
//
//  Created by student-2 on 19/12/24.
//


import Foundation

// MARK: - ProductItem Model
struct ProductItem: Identifiable {
    let id: Int
    let name: String
    let quantity: String
    let price: Double
    let imageUrl: String
    
    var formattedPrice: String {
        return "₹\(Int(price))"
    }
}

// MARK: - PurchaseOrder Model
struct PurchaseOrder: Identifiable {
    let id: String
    let products: [ProductItem]
    let deliveryAddress: ShippingAddress
    var status: PurchaseStatus
    let createdAt: Date
    
    var totalAmount: Double {
        return products.reduce(0) { $0 + $1.price }
    }
}

// MARK: - Shipping Address Model
struct ShippingAddress {
    let street: String
    let city: String
    let state: String
    
    var formattedAddress: String {
        return "\(street), \(city)"
    }
}

// MARK: - Purchase Status
enum PurchaseStatus {
    case pending
    case approved
    case rejected
}

// MARK: - Purchase Data Manager
class PurchaseDataManager {
    static let shared = PurchaseDataManager()
    private var purchaseOrders: [PurchaseOrder] = []
    
    private init() {
        // Sample products
        let products = [
            ProductItem(id: 1, name: "Organic Potatoes", quantity: "50 kg", price: 2500, imageUrl: "potatoes"),
            ProductItem(id: 2, name: "Fresh Tomatoes", quantity: "30 kg", price: 1800, imageUrl: "tomatoes")
        ]
        
        // Initialize with sample data
        setupSampleData(products: products)
    }
    
    private func setupSampleData(products: [ProductItem]) {
        let sampleAddress = ShippingAddress(
            street: "123 Mall Road",
            city: "Shimla",
            state: "Himachal Pradesh"
        )
        
        let sampleOrder = PurchaseOrder(
            id: UUID().uuidString,
            products: products,
            deliveryAddress: sampleAddress,
            status: .pending,
            createdAt: Date()
        )
        
        purchaseOrders.append(sampleOrder)
    }
    
    // MARK: - Public Methods
    func getAllOrders() -> [PurchaseOrder] {
        return purchaseOrders
    }
    
    func getOrder(by id: String) -> PurchaseOrder? {
        return purchaseOrders.first { $0.id == id }
    }
    
    func updateOrderStatus(orderId: String, status: PurchaseStatus) -> Bool {
        guard let index = purchaseOrders.firstIndex(where: { $0.id == orderId }) else {
            return false
        }
        purchaseOrders[index].status = status
        return true
    }
    
    func addOrder(products: [ProductItem], deliveryAddress: ShippingAddress) -> PurchaseOrder {
        let newOrder = PurchaseOrder(
            id: UUID().uuidString,
            products: products,
            deliveryAddress: deliveryAddress,
            status: .pending,
            createdAt: Date()
        )
        purchaseOrders.append(newOrder)
        return newOrder
    }
}
