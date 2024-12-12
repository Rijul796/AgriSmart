//
//  CropListing.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//
import UIKit

struct CropListing {
    let id: String              // Unique crop identifier
    let cropImage: String       // Image URL or file path for the crop
    let cropName: String        // Name of the crop
    let pricePerKg: Double      // Price per kilogram
    let quantityLeft: Int       // Quantity left in stock
    let expirationDate: Date    // Expiration date of the crop
}
/*
 import SwiftUI

 struct MyListingScreen: View {
     var cropListings: [CropListing] // List of crops published by the farmer
     @State private var selectedCrop: CropListing?

     var body: some View {
         NavigationView {
             VStack {
                 // Add New Crop Button
                 Button(action: {
                     // Handle add new crop action
                     print("Add New Crop")
                 }) {
                     HStack {
                         Image(systemName: "plus.circle.fill")
                             .font(.title)
                         Text("Add New Crop")
                             .font(.headline)
                             .foregroundColor(.blue)
                     }
                     .padding()
                     .background(Color.white)
                     .cornerRadius(10)
                     .shadow(radius: 5)
                 }

                 // Crop Listings List
                 List(cropListings, id: \.id) { crop in
                     VStack(alignment: .leading, spacing: 10) {
                         // Crop Image
                         if let cropImage = crop.cropImage {
                             Image(cropImage)
                                 .resizable()
                                 .scaledToFill()
                                 .frame(width: 100, height: 100)
                                 .cornerRadius(10)
                                 .clipped()
                         }

                         // Crop Details
                         Text(crop.cropName)
                             .font(.headline)
                         Text("Price per kg: $\(crop.pricePerKg, specifier: "%.2f")")
                             .font(.subheadline)
                         Text("Quantity Left: \(crop.quantityLeft)")
                             .font(.subheadline)
                         Text("Expires on: \(crop.expirationDate, style: .date)")
                             .font(.subheadline)

                         // Edit Button
                         NavigationLink(
                             destination: EditCropScreen(crop: crop),
                             label: {
                                 Text("Edit")
                                     .font(.subheadline)
                                     .foregroundColor(.blue)
                             }
                         )
                     }
                     .padding()
                 }
             }
             .navigationTitle("My Listings")
         }
     }
 }
 import SwiftUI

 struct EditCropScreen: View {
     var crop: CropListing
     @State private var cropName: String
     @State private var pricePerKg: String
     @State private var quantityLeft: String
     @State private var expirationDate: Date

     init(crop: CropListing) {
         _cropName = State(initialValue: crop.cropName)
         _pricePerKg = State(initialValue: "\(crop.pricePerKg)")
         _quantityLeft = State(initialValue: "\(crop.quantityLeft)")
         _expirationDate = State(initialValue: crop.expirationDate)
     }

     var body: some View {
         Form {
             Section(header: Text("Crop Details")) {
                 TextField("Crop Name", text: $cropName)
                 TextField("Price per kg", text: $pricePerKg)
                     .keyboardType(.decimalPad)
                 TextField("Quantity Left", text: $quantityLeft)
                     .keyboardType(.numberPad)
                 DatePicker("Expiration Date", selection: $expirationDate, displayedComponents: .date)
             }

             Section {
                 Button(action: {
                     // Handle crop update action (save changes)
                     print("Crop updated with new values")
                 }) {
                     Text("Save Changes")
                         .foregroundColor(.white)
                         .frame(maxWidth: .infinity)
                         .padding()
                         .background(Color.blue)
                         .cornerRadius(10)
                 }
             }
         }
         .navigationTitle("Edit Crop")
         .padding()
     }
 }

 */
//
//  CropListing 2.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//


//struct CropListing {
//    let id: String              // Unique crop identifier
//    var cropImage: String       // Image URL or file path for the crop (updating this during editing)
//    var cropName: String        // Name of the crop
//    var pricePerKg: Double      // Price per kilogram
//    var quantityLeft: Int       // Quantity left in stock
//    var expirationDate: Date    // Expiration date of the crop
//    var category: String        // Category of the crop
//    var status: String          // Status of the crop (e.g., Available, Out of Stock)
//}
/*
 import SwiftUI

 struct EditCropScreen: View {
     @State private var cropName: String
     @State private var pricePerKg: String
     @State private var quantityLeft: String
     @State private var category: String
     @State private var status: String
     @State private var expirationDate: Date
     @State private var cropImage: UIImage? // For storing crop image

     init(crop: CropListing) {
         _cropName = State(initialValue: crop.cropName)
         _pricePerKg = State(initialValue: "\(crop.pricePerKg)")
         _quantityLeft = State(initialValue: "\(crop.quantityLeft)")
         _category = State(initialValue: crop.category)
         _status = State(initialValue: crop.status)
         _expirationDate = State(initialValue: crop.expirationDate)
         _cropImage = State(initialValue: UIImage(named: crop.cropImage)) // Load existing image (if any)
     }

     var body: some View {
         Form {
             Section(header: Text("Crop Details")) {
                 // Crop Name
                 TextField("Crop Name", text: $cropName)
                 
                 // Quantity Left
                 TextField("Quantity Available", text: $quantityLeft)
                     .keyboardType(.numberPad)
                 
                 // Price per Unit
                 TextField("Price per Unit", text: $pricePerKg)
                     .keyboardType(.decimalPad)
                 
                 // Category Dropdown
                 Picker("Category", selection: $category) {
                     Text("Vegetable").tag("Vegetable")
                     Text("Fruit").tag("Fruit")
                     Text("Grain").tag("Grain")
                     Text("Spice").tag("Spice")
                 }
                 .pickerStyle(MenuPickerStyle())

                 // Status Dropdown
                 Picker("Status", selection: $status) {
                     Text("Available").tag("Available")
                     Text("Out of Stock").tag("Out of Stock")
                 }
                 .pickerStyle(MenuPickerStyle())
                 
                 // Expiration Date
                 DatePicker("Expiration Date", selection: $expirationDate, displayedComponents: .date)
             }

             Section(header: Text("Crop Image")) {
                 HStack {
                     if let cropImage = cropImage {
                         Image(uiImage: cropImage)
                             .resizable()
                             .scaledToFit()
                             .frame(width: 100, height: 100)
                             .cornerRadius(10)
                             .padding()
                     } else {
                         Text("No image selected")
                             .padding()
                     }

                     Button(action: {
                         // Show image picker to select crop image
                         showImagePicker()
                     }) {
                         Text("Select Image")
                             .font(.headline)
                             .foregroundColor(.blue)
                             .padding()
                     }
                 }
             }

             Section {
                 Button(action: {
                     // Handle saving the changes
                     saveCropChanges()
                 }) {
                     Text("Save Changes")
                         .foregroundColor(.white)
                         .frame(maxWidth: .infinity)
                         .padding()
                         .background(Color.blue)
                         .cornerRadius(10)
                 }
             }
         }
         .navigationTitle("Edit Crop")
         .padding()
     }
     
     // Image picker action (Example using UIImagePickerController)
     func showImagePicker() {
         // Code to show the image picker (UIImagePickerController)
         // Update cropImage when a new image is selected
     }
     
     // Function to handle saving crop changes
     func saveCropChanges() {
         // Update the crop details with the new information
         let updatedCrop = CropListing(
             id: UUID().uuidString, // Use the crop's ID or pass as necessary
             cropImage: cropImage != nil ? cropImage!.jpegData(compressionQuality: 1.0)?.base64EncodedString() ?? "" : "",
             cropName: cropName,
             pricePerKg: Double(pricePerKg) ?? 0.0,
             quantityLeft: Int(quantityLeft) ?? 0,
             expirationDate: expirationDate,
             category: category,
             status: status
         )

         // Save the updated crop (via API call or database update)
         print("Crop Updated:", updatedCrop)
     }
 }

 */
