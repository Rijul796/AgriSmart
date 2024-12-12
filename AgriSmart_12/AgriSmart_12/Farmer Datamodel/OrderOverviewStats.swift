//
//  OrderOverviewStats.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//
import UIKit

struct OrderOverviewStats {
    let totalOrders: Int          // Total number of orders
    let pendingOrders: Int        // Number of pending orders
    let completedOrders: Int      // Number of completed orders
    let revenueGenerated: Double  // Total revenue generated
}
/*
 import SwiftUI

 struct OrderOverviewScreen: View {
     @State private var orderStats: OrderOverviewStats = OrderOverviewStats(totalOrders: 0, pendingOrders: 0, completedOrders: 0, revenueGenerated: 0.0)

     var body: some View {
         VStack {
             // Stats Section
             VStack(alignment: .leading) {
                 Text("Order Overview")
                     .font(.largeTitle)
                     .bold()
                     .padding(.bottom, 20)

                 HStack {
                     StatCard(title: "Total Orders", value: "\(orderStats.totalOrders)")
                     StatCard(title: "Pending Orders", value: "\(orderStats.pendingOrders)")
                 }
                 .padding(.bottom, 20)

                 HStack {
                     StatCard(title: "Completed Orders", value: "\(orderStats.completedOrders)")
                     StatCard(title: "Revenue Generated", value: "$\(orderStats.revenueGenerated, specifier: "%.2f")")
                 }
             }
             .padding()

             Spacer()

             // Load Stats Button (for simulation purposes)
             Button(action: loadOrderStats) {
                 Text("Load Stats")
                     .foregroundColor(.white)
                     .padding()
                     .background(Color.blue)
                     .cornerRadius(10)
             }
             .padding(.bottom, 20)
         }
         .navigationTitle("Order Overview")
         .onAppear {
             // Automatically load stats when the screen appears
             loadOrderStats()
         }
     }

     // Function to simulate loading the order stats (this would usually come from a server/API)
     func loadOrderStats() {
         // Simulated data
         orderStats = OrderOverviewStats(
             totalOrders: 150,
             pendingOrders: 40,
             completedOrders: 110,
             revenueGenerated: 2500.75
         )
     }
 }

 // Helper view for displaying each stat
 struct StatCard: View {
     var title: String
     var value: String

     var body: some View {
         VStack {
             Text(title)
                 .font(.subheadline)
                 .foregroundColor(.gray)
             Text(value)
                 .font(.headline)
                 .bold()
                 .padding()
                 .background(Color.white)
                 .cornerRadius(10)
                 .shadow(radius: 5)
         }
         .frame(maxWidth: .infinity)
         .padding()
         .background(Color.blue.opacity(0.1))
         .cornerRadius(15)
     }
 }
 func fetchOrderStats() {
     let url = URL(string: "https://yourapi.com/order-stats")!
     let task = URLSession.shared.dataTask(with: url) { data, response, error in
         if let data = data, error == nil {
             // Parse the JSON response
             if let stats = try? JSONDecoder().decode(OrderOverviewStats.self, from: data) {
                 DispatchQueue.main.async {
                     self.orderStats = stats // Update the UI with fetched data
                 }
             }
         }
     }
     task.resume()
 }

 */
