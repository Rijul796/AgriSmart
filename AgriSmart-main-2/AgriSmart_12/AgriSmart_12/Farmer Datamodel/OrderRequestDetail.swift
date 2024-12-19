//
//  OrderRequestDetail.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//

import UIKit
struct OrderRequestDetail {
    let id: String             // Unique order identifier
    let cropImage: String      // Image URL or file path for the crop
    let cropName: String       // Name of the crop
    let quantity: Int          // Quantity ordered
    let price: Double          // Price per unit of the crop
    let totalPrice: Double     // Total price (quantity * price)
    let customerName: String   // Name of the customer who placed the order
    let customerAddress: String // Delivery address of the customer
    let customerPhone: String   // Customer's phone number
    let orderDate: Date        // Date the order was placed
    let deliveryDate: Date     // Expected delivery date
    let status: String         // Order status (e.g., "Pending", "Approved", "Cancelled")
}
/*
 import SwiftUI

 struct OrderRequestDetailScreen: View {
     var order: OrderRequestDetail

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
                         .padding(.bottom, 16)
                 }

                 // Crop Information
                 Text(order.cropName)
                     .font(.title)
                     .fontWeight(.bold)
                 Text("Quantity: \(order.quantity)")
                     .font(.subheadline)
                 Text("Price per Unit: $\(order.price, specifier: "%.2f")")
                     .font(.subheadline)
                 Text("Total Price: $\(order.totalPrice, specifier: "%.2f")")
                     .font(.subheadline)
                     .padding(.bottom, 16)

                 // Customer Information
                 Text("Customer: \(order.customerName)")
                     .font(.subheadline)
                 Text("Order Date: \(order.orderDate, style: .date)")
                     .font(.subheadline)
                 Text("Delivery Date: \(order.deliveryDate, style: .date)")
                     .font(.subheadline)

                 // Delivery Address
                 Text("Delivery Address:")
                     .font(.headline)
                     .padding(.top, 16)
                 Text(order.customerAddress)
                     .font(.subheadline)
                     .padding(.bottom, 8)

                 // Customer Phone
                 Text("Customer Phone: \(order.customerPhone)")
                     .font(.subheadline)

                 // Order Status
                 Text("Order Status: \(order.status)")
                     .font(.subheadline)
                     .foregroundColor(order.status == "Approved" ? .green : order.status == "Cancelled" ? .red : .orange)
                     .padding(.top, 16)

                 // Action Buttons
                 HStack {
                     Button(action: {
                         // Handle approval logic (update backend or status)
                         print("Order Approved")
                     }) {
                         Text("Approve")
                             .frame(maxWidth: .infinity)
                             .padding()
                             .background(Color.green)
                             .foregroundColor(.white)
                             .cornerRadius(10)
                     }

                     Button(action: {
                         // Handle cancellation logic (update backend or status)
                         print("Order Cancelled")
                     }) {
                         Text("Cancel")
                             .frame(maxWidth: .infinity)
                             .padding()
                             .background(Color.red)
                             .foregroundColor(.white)
                             .cornerRadius(10)
                     }
                 }
                 .padding(.top, 16)
             }
             .padding()
         }
         .navigationTitle("Order Details")
     }
 }

 */
