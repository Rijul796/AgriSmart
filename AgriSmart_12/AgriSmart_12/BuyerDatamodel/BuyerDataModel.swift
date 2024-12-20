//
//  BuyerDataModel.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 20/12/24.
//

import Foundation

// MARK: - BuyerInfo

struct BuyerInfo {
    var id: Int
    var name: String
    var username: String
    var email: String
    var contactNumber: String
    var profileImageUrl: String?
    var defaultAddress: Address?
    var savedAddresses: [Address]
    var orderHistory: [Orders]
    var cart: Cart
    var wishlist: [Crop]
    var notificationsEnabled: Bool
    var accountCreationDate: Date
    var isPremiumMember: Bool
}

// MARK: - Crop
struct Crop {
    var id: Int
    var name: String
    var imageUrl: String
    var pricePerKg: Double?       // Optional: For pricing contexts
    var rating: Double?           // Optional: For rating contexts
    var reviewsCount: Int?        // Optional: For detailed views
    var quantity: Int?            // Optional: For shopping/cart contexts
    var description: String?      // Optional: For additional details
}

// MARK: - Farmer
struct Farmer {
    var id: Int
    var name: String
    var profileImageUrl: String
    var starRating: Double
    var distanceFromBuyer: Double? // Optional: For proximity-based sorting
    var username: String?          // Optional: For profiles
    var isFollowed: Bool?          // Optional: For user-specific interactions
    var crops: [Crop]?             // Optional: Crops provided by the farmer
}

// MARK: - Cart
struct Cart {
    var items: [Crop]
    var subtotal: Double {
        return items.reduce(0) { $0 + ($1.pricePerKg ?? 0.0) * Double($1.quantity ?? 0) }
    }
    var shippingCost: Double {
        return subtotal > 0 ? 200 : 0 // Fixed shipping cost
    }
    var total: Double {
        return subtotal + shippingCost
    }
}

// MARK: - Order
struct Orders {
    var items: [Crop]
    var address: Address?
    var totalPrice: Double {
        return items.reduce(0) { $0 + ($1.pricePerKg ?? 0.0) * Double($1.quantity ?? 0) }
    }
}

// MARK: - Address
struct Address {
    var fullName: String
    var addressLine1: String
    var addressLine2: String?
    var city: String
    var state: String
    var zipCode: String
    var contactNumber: String
}

// MARK: - Message
struct Message {
    var senderName: String
    var senderImageUrl: String
    var messageText: String
    var timestamp: Date
}

// MARK: - Settings Item
struct SettingsItem {
    var title: String
    var subtitle: String?       // Optional for descriptions
    var iconName: String?       // Optional for icons
    var action: (() -> Void)?   // Optional for functionality
}


// MARK: - FarmerManager
final class FarmerManager {
    static let shared = FarmerManager()
    private var farmers: [Farmer] = []

    private init() {}

    func addFarmer(_ farmer: Farmer) {
        farmers.append(farmer)
    }

    func getFarmers() -> [Farmer] {
        return farmers
    }

    func searchFarmers(byName name: String) -> [Farmer] {
        return farmers.filter { $0.name.lowercased().contains(name.lowercased()) }
    }

    func sortFarmersByNearest() -> [Farmer] {
        return farmers.sorted { ($0.distanceFromBuyer ?? .infinity) < ($1.distanceFromBuyer ?? .infinity) }
    }
}

// MARK: - CartManager
final class CartManager {
    static let shared = CartManager()
    private var cart = Cart(items: [])

    private init() {}

    func addItem(_ item: Crop) {
        cart.items.append(item)
    }

    func removeItem(at index: Int) {
        guard index >= 0 && index < cart.items.count else { return }
        cart.items.remove(at: index)
    }

    func updateItemQuantity(at index: Int, quantity: Int) {
        guard index >= 0 && index < cart.items.count else { return }
        cart.items[index].quantity = quantity
    }

    func getCartSummary() -> Cart {
        return cart
    }

    func clearCart() {
        cart.items.removeAll()
    }
}

// MARK: - OrderManager
final class OrderManager {
    static let shared = OrderManager()
    private var orders: [Orders] = []

    private init() {}

    func placeOrder(items: [Crop], address: Address) {
        let newOrder = Orders(items: items, address: address)
        orders.append(newOrder)
    }

    func getOrders() -> [Orders] {
        return orders
    }
}

// MARK: - MessageManager
final class MessageManager {
    static let shared = MessageManager()
    private var messages: [Message] = []

    private init() {}

    func addMessage(_ message: Message) {
        messages.append(message)
    }

    func getMessages() -> [Message] {
        return messages
    }

    func filterMessages(by senderName: String) -> [Message] {
        return messages.filter { $0.senderName.lowercased().contains(senderName.lowercased()) }
    }
}

// MARK: - SettingsManager
final class SettingsManager {
    static let shared = SettingsManager()
    private var sections: [SettingsItem] = []

    private init() {}

    func configureSettings(_ items: [SettingsItem]) {
        sections = items
    }

    func getSettings() -> [SettingsItem] {
        return sections
    }
}
