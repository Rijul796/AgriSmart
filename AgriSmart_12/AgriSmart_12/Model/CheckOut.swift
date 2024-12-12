//
//  CheckOut.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 12/12/24.
//

import Foundation
struct OrderDetail {
    let orderId: Int
    let items: [CartItem]
    let totalAmount: Double
    let shippingCost: Double
    let grandTotal: Double
}

struct Address {
    var fullName: String
    var addressLine1: String
    var addressLine2: String?
    var city: String
    var state: String
    var postalCode: String
    var phoneNumber: String
}

let orderDetail = OrderDetail(
    orderId: 12345,
    items: [
        CartItem(id: 1, name: "Organic Apple", imageName: "apple", pricePerKg: 100.0, quantity: 50, description: "50Kg, Red")
    ],
    totalAmount: 5000.0,
    shippingCost: 200.0,
    grandTotal: 5200.0
)

var address = Address(
    fullName: "",
    addressLine1: "",
    addressLine2: nil,
    city: "",
    state: "",
    postalCode: "",
    phoneNumber: ""
)
