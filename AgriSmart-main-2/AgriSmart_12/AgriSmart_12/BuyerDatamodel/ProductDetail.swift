//
//  ProductDetail.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//
import UIKit

struct ProductDetail {
    var image: String               // URL or path to product image
    var name: String                // Product name
    var price: Double               // Price of the product
    var quantity: Int               // Available quantity of the product
    var rating: Double              // Overall product rating out of 5
    var qualityRating: Double       // Rating for product quality
    var valueRating: Double         // Rating for product value
    var freshnessRating: Double     // Rating for product freshness
    var description: String         // Product description
    var reviews: [Review]           // List of reviews for the product
    var nearbyFarmers: [Farmer]     // List of nearby farmers selling the product
}

struct Review {
    var reviewerImage: String       // URL or path to reviewer's image
    var rating: Double              // Rating out of 5
    var content: String             // Review content
    var likeCount: Int              // Number of likes on the review
    var dislikeCount: Int           // Number of dislikes on the review
}

struct Farmers {
    var image: String               // Farmer's image URL
    var name: String                // Farmer's name
    var rating: Double              // Farmer's rating
}
/*
 import SwiftUI

 struct ProductDetailsScreen: View {
     @State var product: ProductDetail  // Product data passed to this screen

     var body: some View {
         ScrollView {
             VStack(spacing: 20) {
                 // Product Image and Name
                 AsyncImage(url: URL(string: product.image)) { image in
                     image.resizable()
                          .scaledToFit()
                          .frame(width: 250, height: 250)
                          .cornerRadius(10)
                 } placeholder: {
                     ProgressView()
                         .frame(width: 250, height: 250)
                 }
                 .padding()

                 Text(product.name)
                     .font(.title)
                     .bold()

                 // Price, Quantity, and Rating
                 HStack {
                     Text("Price: $\(product.price, specifier: "%.2f")")
                         .font(.title2)
                         .bold()
                     Spacer()
                     Text("Quantity: \(product.quantity) units")
                         .font(.body)
                 }

                 HStack {
                     Text("Rating: \(product.rating, specifier: "%.1f") / 5")
                     Spacer()
                     RatingView(rating: product.rating) // Custom star rating view
                 }
                 .padding(.vertical)

                 // Add to Cart and Check Delivery Availability
                 HStack {
                     Button(action: addToCart) {
                         Text("Add to Cart")
                             .foregroundColor(.white)
                             .padding()
                             .background(Color.blue)
                             .cornerRadius(10)
                     }

                     Button(action: checkDeliveryAvailability) {
                         Text("Check Delivery Availability")
                             .foregroundColor(.white)
                             .padding()
                             .background(Color.green)
                             .cornerRadius(10)
                     }
                 }

                 // Description Section
                 VStack(alignment: .leading) {
                     Text("Description")
                         .font(.headline)
                     Text(product.description)
                         .font(.body)
                         .foregroundColor(.gray)
                 }

                 // Reviews Section
                 VStack(alignment: .leading) {
                     Text("Reviews")
                         .font(.headline)
                     ForEach(product.reviews, id: \.content) { review in
                         ReviewCard(review: review)
                     }
                 }

                 // Nearby Farmers Selling this Product
                 VStack(alignment: .leading) {
                     Text("Nearby Farmers Selling this Product")
                         .font(.headline)
                     ForEach(product.nearbyFarmers, id: \.name) { farmer in
                         FarmerCard(farmer: farmer)
                     }
                 }

                 Spacer()
             }
             .padding()
         }
         .navigationTitle("Product Details")
     }

     // Add to Cart action
     func addToCart() {
         // Logic to add the product to cart
         print("Product added to cart")
     }

     // Check Delivery Availability action
     func checkDeliveryAvailability() {
         // Logic to check delivery availability
         print("Checking delivery availability")
     }
 }

 // Custom Rating View (Stars)
 struct RatingView: View {
     var rating: Double

     var body: some View {
         HStack {
             ForEach(0..<5, id: \.self) { index in
                 Image(systemName: index < Int(rating) ? "star.fill" : "star")
                     .foregroundColor(index < Int(rating) ? .yellow : .gray)
             }
         }
     }
 }

 // Custom Review Card for displaying reviews
 struct ReviewCard: View {
     var review: Review

     var body: some View {
         VStack(alignment: .leading) {
             HStack {
                 AsyncImage(url: URL(string: review.reviewerImage)) { image in
                     image.resizable()
                          .scaledToFit()
                          .frame(width: 40, height: 40)
                          .clipShape(Circle())
                 } placeholder: {
                     Circle()
                         .fill(Color.gray)
                         .frame(width: 40, height: 40)
                 }
                 Text("Rating: \(review.rating, specifier: "%.1f") / 5")
                     .font(.subheadline)
                     .foregroundColor(.gray)
             }

             Text(review.content)
                 .font(.body)
                 .foregroundColor(.black)
                 .padding(.vertical, 5)

             HStack {
                 Button(action: likeReview) {
                     HStack {
                         Image(systemName: "thumbsup.fill")
                         Text("\(review.likeCount)")
                     }
                 }
                 .padding(5)

                 Button(action: dislikeReview) {
                     HStack {
                         Image(systemName: "thumbsdown.fill")
                         Text("\(review.dislikeCount)")
                     }
                 }
                 .padding(5)
             }
         }
         .padding()
         .background(Color.gray.opacity(0.1))
         .cornerRadius(10)
     }

     // Like Review action
     func likeReview() {
         // Logic to like the review
         print("Liked review")
     }

     // Dislike Review action
     func dislikeReview() {
         // Logic to dislike the review
         print("Disliked review")
     }
 }

 // Custom Farmer Card for displaying nearby farmers
 struct FarmerCard: View {
     var farmer: Farmer

     var body: some View {
         HStack {
             AsyncImage(url: URL(string: farmer.image)) { image in
                 image.resizable()
                      .scaledToFit()
                      .frame(width: 50, height: 50)
                      .clipShape(Circle())
             } placeholder: {
                 Circle()
                     .fill(Color.gray)
                     .frame(width: 50, height: 50)
             }

             VStack(alignment: .leading) {
                 Text(farmer.name)
                     .font(.headline)
                 Text("Rating: \(farmer.rating, specifier: "%.1f") / 5")
                     .font(.subheadline)
                     .foregroundColor(.gray)
             }

             Spacer()

             Button(action: placeOrder) {
                 Text("Place Order")
                     .foregroundColor(.white)
                     .padding(8)
                     .background(Color.blue)
                     .cornerRadius(10)
             }
         }
         .padding()
         .background(Color.gray.opacity(0.1))
         .cornerRadius(10)
     }

     // Place Order action
     func placeOrder() {
         // Logic to place an order with the selected farmer
         print("Order placed with farmer \(farmer.name)")
     }
 }

 */
