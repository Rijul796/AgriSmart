//
//  OrderItem.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//
import UIKit

struct OrderItem {
    let cropName: String         // Name of the crop
    let quantity: Int            // Quantity ordered
    let pricePerUnit: Double     // Price per unit
    let totalPrice: Double       // Total price for this order item
}

struct Orders {
    let orderId: String          // Unique order ID
    let orderItems: [OrderItem]  // List of order items
    let customerName: String     // Name of the customer
    let customerProfileImage: String  // Profile image of the customer (optional)
    let orderDate: Date          // Date the order was placed
    let deliveryAddress: String  // Delivery address
    var status: String           // Status of the order (e.g., "Pending", "Accepted", "Shipped")
}
struct ChatMessage {
    let senderId: String         // ID of the sender (farmer or consumer)
    let message: String          // The actual text message
    let timestamp: Date          // The time when the message was sent
}
/*
 import SwiftUI

 struct ChatScreen: View {
     var order: Order             // The order details
     @State private var message: String = ""
     @State private var chatMessages: [ChatMessage] = [] // List of chat messages

     var body: some View {
         VStack {
             // Order Items List
             List(order.orderItems, id: \.cropName) { item in
                 VStack(alignment: .leading) {
                     Text(item.cropName)
                         .font(.headline)
                     HStack {
                         Text("Quantity: \(item.quantity)")
                         Spacer()
                         Text("Total: $\(item.totalPrice, specifier: "%.2f")")
                     }
                     .font(.subheadline)
                     .foregroundColor(.gray)
                 }
             }
             
             Divider()

             // Chat Messages List
             ScrollView {
                 VStack(alignment: .leading) {
                     ForEach(chatMessages, id: \.timestamp) { msg in
                         HStack {
                             if msg.senderId == "farmer" {
                                 Spacer()
                                 Text(msg.message)
                                     .padding()
                                     .background(Color.blue)
                                     .cornerRadius(10)
                                     .foregroundColor(.white)
                                     .frame(maxWidth: .infinity, alignment: .trailing)
                             } else {
                                 Text(msg.message)
                                     .padding()
                                     .background(Color.gray.opacity(0.2))
                                     .cornerRadius(10)
                                     .foregroundColor(.black)
                                     .frame(maxWidth: .infinity, alignment: .leading)
                                 Spacer()
                             }
                         }
                         .padding(.horizontal)
                         .padding(.vertical, 5)
                     }
                 }
             }

             // Message Input Field
             HStack {
                 TextField("Type a message...", text: $message)
                     .padding()
                     .background(Color.gray.opacity(0.1))
                     .cornerRadius(10)
                 
                 Button(action: sendMessage) {
                     Text("Send")
                         .font(.headline)
                         .foregroundColor(.blue)
                         .padding(.horizontal)
                 }
                 .disabled(message.isEmpty)
             }
             .padding()
         }
         .navigationTitle("Order \(order.orderId)")
         .onAppear {
             // Load initial chat messages
             loadChatMessages()
         }
     }
     
     // Send Message Function
     func sendMessage() {
         let newMessage = ChatMessage(senderId: "farmer", message: message, timestamp: Date())
         chatMessages.append(newMessage) // Append message to the list

         // Here, you'd want to call an API to send the message to the server.
         
         message = "" // Clear the message input field
     }

     // Simulate Loading Initial Messages (usually from an API)
     func loadChatMessages() {
         // Example of initial messages loaded from the server
         chatMessages = [
             ChatMessage(senderId: "consumer", message: "Hi, I would like to confirm my order!", timestamp: Date().addingTimeInterval(-600)),
             ChatMessage(senderId: "farmer", message: "Hello! Your order is confirmed. We will prepare it for delivery.", timestamp: Date().addingTimeInterval(-500))
         ]
     }
 }

 */
