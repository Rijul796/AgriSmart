//
//  CropDetail.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//

import UIKit
struct CropDetail {
    var image: String            // URL or path to crop image
    var name: String             // Crop name
    var totalStockLeft: Int      // Total stock remaining
    var pricePerUnit: Double     // Current price per unit
    var expirationDate: Date     // Expiration date of the crop
    var lowStockWarning: Bool    // Flag for low stock warning (e.g., if stock falls below a certain threshold)
    var cropId: String           // Unique crop identifier
}
/*
 import SwiftUI

 struct CropDetailsScreen: View {
     @State var crop: CropDetail  // Crop data passed from Home Screen
     @State private var isEditing = false
     @State private var isRestocking = false

     var body: some View {
         VStack {
             // Crop Image and Information
             AsyncImage(url: URL(string: crop.image)) { image in
                 image.resizable()
                      .scaledToFit()
                      .frame(width: 250, height: 250)
                      .cornerRadius(10)
             } placeholder: {
                 ProgressView()
                     .frame(width: 250, height: 250)
             }
             .padding()

             Text(crop.name)
                 .font(.title)
                 .bold()
                 .padding(.bottom, 5)

             HStack {
                 Text("Stock Left: \(crop.totalStockLeft) units")
                 Spacer()
                 if crop.lowStockWarning {
                     Text("Low Stock!")
                         .foregroundColor(.red)
                         .fontWeight(.bold)
                 }
             }

             HStack {
                 Text("Price: $\(crop.pricePerUnit, specifier: "%.2f") per unit")
                     .font(.subheadline)
                     .foregroundColor(.gray)
                 Spacer()
             }
             .padding(.bottom, 10)

             HStack {
                 Text("Expiration Date: \(formatDate(crop.expirationDate))")
                     .font(.subheadline)
                     .foregroundColor(.gray)
                 Spacer()
             }
             .padding(.bottom, 20)

             // Edit and Restock Buttons
             HStack {
                 Button(action: {
                     // Action for editing crop details
                     isEditing.toggle()
                 }) {
                     Text("Edit Details")
                         .foregroundColor(.white)
                         .padding()
                         .background(Color.blue)
                         .cornerRadius(10)
                 }

                 Button(action: {
                     // Action for restocking the crop
                     isRestocking.toggle()
                 }) {
                     Text("Restock")
                         .foregroundColor(.white)
                         .padding()
                         .background(Color.green)
                         .cornerRadius(10)
                 }
             }

             Spacer()
         }
         .padding()
         .navigationTitle("Crop Details")
         .sheet(isPresented: $isEditing) {
             // Edit Details Screen
             EditCropDetailsScreen(crop: $crop)
         }
         .alert(isPresented: $isRestocking) {
             // Restock confirmation
             Alert(
                 title: Text("Restock Crop"),
                 message: Text("Are you sure you want to restock this crop?"),
                 primaryButton: .default(Text("Confirm")) {
                     // Action for confirming restock (e.g., increase stock)
                     restockCrop()
                 },
                 secondaryButton: .cancel()
             )
         }
     }

     // Format the date to a more readable format
     func formatDate(_ date: Date) -> String {
         let formatter = DateFormatter()
         formatter.dateStyle = .medium
         return formatter.string(from: date)
     }

     // Function to simulate restocking action
     func restockCrop() {
         crop.totalStockLeft += 50 // Example: Restocking by 50 units
     }
 }
 struct EditCropDetailsScreen: View {
     @Binding var crop: CropDetail  // Binding to the crop object to update details

     @State private var newPrice: String
     @State private var newStock: String
     @State private var newExpirationDate: Date

     init(crop: Binding<CropDetail>) {
         self._crop = crop
         _newPrice = State(initialValue: String(crop.wrappedValue.pricePerUnit))
         _newStock = State(initialValue: String(crop.wrappedValue.totalStockLeft))
         _newExpirationDate = State(initialValue: crop.wrappedValue.expirationDate)
     }

     var body: some View {
         VStack {
             Text("Edit Crop Details")
                 .font(.largeTitle)
                 .bold()
                 .padding()

             TextField("Price per unit", text: $newPrice)
                 .keyboardType(.decimalPad)
                 .padding()
                 .textFieldStyle(RoundedBorderTextFieldStyle())
             
             TextField("Total stock", text: $newStock)
                 .keyboardType(.numberPad)
                 .padding()
                 .textFieldStyle(RoundedBorderTextFieldStyle())
             
             DatePicker("Expiration Date", selection: $newExpirationDate, displayedComponents: .date)
                 .padding()

             Button(action: saveChanges) {
                 Text("Save Changes")
                     .foregroundColor(.white)
                     .padding()
                     .background(Color.blue)
                     .cornerRadius(10)
             }

             Spacer()
         }
         .padding()
     }

     func saveChanges() {
         // Save the changes to the crop data
         if let price = Double(newPrice), let stock = Int(newStock) {
             crop.pricePerUnit = price
             crop.totalStockLeft = stock
             crop.expirationDate = newExpirationDate
         }
     }
 }
 func updateCropDetails() {
     let url = URL(string: "https://yourapi.com/update-crop")!
     var request = URLRequest(url: url)
     request.httpMethod = "POST"
     request.setValue("application/json", forHTTPHeaderField: "Content-Type")

     let updatedCropData = [
         "cropId": crop.cropId,
         "pricePerUnit": crop.pricePerUnit,
         "totalStockLeft": crop.totalStockLeft,
         "expirationDate": crop.expirationDate
     ]

     do {
         let data = try JSONSerialization.data(withJSONObject: updatedCropData, options: [])
         request.httpBody = data
     } catch {
         print("Error serializing JSON: \(error)")
     }

     let task = URLSession.shared.dataTask(with: request) { data, response, error in
         if let error = error {
             print("Failed to update crop: \(error)")
             return
         }
         // Handle success (update UI or notify the user)
     }

     task.resume()
 }

 */
