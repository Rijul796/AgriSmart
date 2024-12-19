//
//  NewCommunityPost.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//

import UIKit
struct NewCommunityPost {
    var content: String      // Short content or title of the post
    var description: String  // Detailed description of the post
    var images: [String]     // List of image file paths or URLs
}
/*
 import SwiftUI

 struct AddCommunityPostScreen: View {
     @State private var content: String = ""
     @State private var description: String = ""
     @State private var selectedImages: [UIImage] = []

     var body: some View {
         NavigationView {
             ScrollView {
                 VStack(alignment: .leading, spacing: 16) {
                     // Post Content Field
                     TextField("Enter post content...", text: $content)
                         .padding()
                         .background(Color(.systemGray6))
                         .cornerRadius(10)
                         .padding(.horizontal)

                     // Description Field
                     TextEditor(text: $description)
                         .frame(height: 150)
                         .padding()
                         .background(Color(.systemGray6))
                         .cornerRadius(10)
                         .padding(.horizontal)
                         .overlay(
                             Text(description.isEmpty ? "Enter description..." : "")
                                 .foregroundColor(.gray)
                                 .padding(.horizontal, 12)
                                 .padding(.vertical, 8),
                             alignment: .topLeading
                         )

                     // Add Images Section
                     VStack(alignment: .leading, spacing: 8) {
                         Text("Add Images")
                             .font(.headline)
                             .padding(.horizontal)

                         ScrollView(.horizontal, showsIndicators: false) {
                             HStack {
                                 ForEach(selectedImages, id: \.self) { image in
                                     Image(uiImage: image)
                                         .resizable()
                                         .aspectRatio(contentMode: .fill)
                                         .frame(width: 100, height: 100)
                                         .cornerRadius(10)
                                         .clipped()
                                 }

                                 // Add Image Button
                                 Button(action: {
                                     // Open image picker
                                     print("Add Image Tapped")
                                 }) {
                                     VStack {
                                         Image(systemName: "plus")
                                             .font(.largeTitle)
                                             .foregroundColor(.blue)
                                         Text("Add")
                                             .font(.caption)
                                             .foregroundColor(.blue)
                                     }
                                     .frame(width: 100, height: 100)
                                     .background(Color(.systemGray6))
                                     .cornerRadius(10)
                                 }
                             }
                             .padding(.horizontal)
                         }
                     }

                     // Post Button
                     Button(action: {
                         // Handle post submission
                         print("Post Content: \(content)")
                         print("Description: \(description)")
                         print("Images: \(selectedImages.count) selected")
                     }) {
                         Text("Post")
                             .frame(maxWidth: .infinity)
                             .padding()
                             .background(content.isEmpty || description.isEmpty ? Color.gray : Color.blue)
                             .foregroundColor(.white)
                             .cornerRadius(10)
                             .padding(.horizontal)
                     }
                     .disabled(content.isEmpty || description.isEmpty)
                 }
                 .padding(.vertical)
             }
             .navigationTitle("Add New Post")
         }
     }
 }

 */
