//
//  Order.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//

import UIKit
struct Order {
    let id: String             // Unique order identifier
    let cropImage: String      // Image URL or file path for the crop
    let cropName: String       // Name of the crop
    let quantity: Int          // Quantity ordered
    let price: Double          // Price per unit of the crop
    let totalPrice: Double     // Total price (quantity * price)
    let customerName: String   // Name of the customer who placed the order
    let orderDate: Date        // Date the order was placed
}
/*
 import SwiftUI

 struct OrderRequestScreen: View {
     var orders: [Order] // List of new orders
     @State private var selectedOrder: Order?

     var body: some View {
         NavigationView {
             List(orders, id: \.id) { order in
                 VStack(alignment: .leading) {
                     // Crop Image
                     if let cropImage = order.cropImage {
                         Image(cropImage)
                             .resizable()
                             .scaledToFill()
                             .frame(width: 100, height: 100)
                             .cornerRadius(10)
                             .clipped()
                     }

                     // Crop Name, Quantity, and Price
                     Text(order.cropName)
                         .font(.headline)
                     Text("Quantity: \(order.quantity)")
                         .font(.subheadline)
                     Text("Price: $\(order.price, specifier: "%.2f")")
                         .font(.subheadline)
                     Text("Total: $\(order.totalPrice, specifier: "%.2f")")
                         .font(.subheadline)
                         .padding(.bottom, 8)

                     // View Order Details Button
                     NavigationLink(
                         destination: OrderDetailScreen(order: order),
                         label: {
                             Text("View Order Details")
                                 .font(.subheadline)
                                 .foregroundColor(.blue)
                         }
                     )
                 }
                 .padding()
             }
             .navigationTitle("New Orders")
         }
     }
 }
 struct OrderDetail {
     let id: String
     let cropImage: String
     let cropName: String
     let quantity: Int
     let price: Double
     let totalPrice: Double
     let customerName: String
     let customerAddress: String  // Address of the customer
     let customerPhone: String   // Customer's phone number
     let orderDate: Date
     let deliveryDate: Date     // Expected delivery date
     let status: String         // Order status (e.g., "Pending", "Shipped", etc.)
 }
 import SwiftUI

 struct OrderDetailScreen: View {
     var order: Order

     var body: some View {
         ScrollView {
             VStack(alignment: .leading, spacing: 16) {
                 // Crop Image
                 if let cropImage = order.cropImage {
                     Image(cropImage)
                         .resizable()
                         .scaledToFill()
                         .frame(width: 200, height: 200)
                         .cornerRadius(10)
                         .clipped()
                 }

                 // Crop Name, Quantity, and Price
                 Text(order.cropName)
                     .font(.title)
                     .fontWeight(.bold)
                 Text("Quantity: \(order.quantity)")
                     .font(.subheadline)
                 Text("Price: $\(order.price, specifier: "%.2f")")
                     .font(.subheadline)
                 Text("Total: $\(order.totalPrice, specifier: "%.2f")")
                     .font(.subheadline)
                     .padding(.bottom, 8)

                 // Customer Information
                 Text("Customer: \(order.customerName)")
                     .font(.subheadline)
                 Text("Order Date: \(order.orderDate, style: .date)")
                     .font(.subheadline)
                 Text("Delivery Date: \(order.deliveryDate, style: .date)")
                     .font(.subheadline)

                 // Status
                 Text("Status: \(order.status)")
                     .font(.subheadline)
                     .foregroundColor(order.status == "Shipped" ? .green : .orange)
                     .padding(.top, 8)

                 // Customer Contact Information
                 Text("Address: \(order.customerAddress)")
                     .font(.subheadline)
                 Text("Phone: \(order.customerPhone)")
                     .font(.subheadline)
             }
             .padding()
         }
         .navigationTitle("Order Details")
     }
 }

 */
