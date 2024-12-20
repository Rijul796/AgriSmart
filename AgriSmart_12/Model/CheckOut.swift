////
////  CheckOut.swift
////  AgriSmart_12
////
////  Created by Rohan Jain on 12/12/24.
////
//
//import Foundation
//import Foundation
//
//// MARK: - OrderItem Model
//struct OrderItem {
//    let name: String
//    let quantity: Int
//    let price: Double
//}
//
//// MARK: - Address Model
//struct Address {
//    var fullName: String
//    var addressLine1: String
//    var addressLine2: String?
//    var city: String
//    var state: String
//    var zipCode: String
//    var contactNumber: String
//}
//
//// MARK: - Checkout Model
//final class Checkout {
//    private(set) var orderItems: [OrderItem] = []
//    private(set) var address: Address?
//    
//    private init() {}
//    static let shared = Checkout() // Singleton to avoid redeclaration
//    
//    // MARK: - Methods
//    
//    // Add an order item
//    func addOrderItem(name: String, quantity: Int, price: Double) {
//        let newItem = OrderItem(name: name, quantity: quantity, price: price)
//        orderItems.append(newItem)
//    }
//    
//    // Set the delivery address
//    func setAddress(fullName: String, addressLine1: String, addressLine2: String?, city: String, state: String, zipCode: String, contactNumber: String) {
//        address = Address(
//            fullName: fullName,
//            addressLine1: addressLine1,
//            addressLine2: addressLine2,
//            city: city,
//            state: state,
//            zipCode: zipCode,
//            contactNumber: contactNumber
//        )
//    }
//    
//
//    
//    // Calculate total price of the order
//    func calculateTotalPrice() -> Double {
//        return orderItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
//    }
//    
//    // Confirm order
//    func confirmOrder() -> Bool {
//        guard !orderItems.isEmpty, address != nil else {
//            return false
//        }
//        print("Order Confirmed!")
//        return true
//    }
//}
