//
//  PostDetails.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//

import UIKit
struct PostDetails {
    let id: String              // Unique identifier for the post
    let title: String           // The title or main content of the post
    let farmerName: String      // Name of the farmer who created the post
    let farmerProfileImage: String // Profile image of the farmer
    let description: String     // Detailed description of the post
    let images: [String]        // List of image URLs or file paths associated with the post
    var likes: Int              // Number of likes on the post
    var comments: [Comment]     // List of comments on the post
}

struct Comment {
    let username: String        // Name of the person commenting
    let profileImage: String    // Profile image of the commenter
    let text: String            // The comment content
    let timestamp: Date         // The time the comment was posted
}
/*
 import SwiftUI

 struct PostDetailsScreen: View {
     var post: PostDetails
     @State private var newComment: String = ""

     var body: some View {
         ScrollView {
             VStack(alignment: .leading, spacing: 16) {
                 // Farmer Profile & Post Title
                 HStack {
                     if let profileImage = post.farmerProfileImage {
                         Image(profileImage)
                             .resizable()
                             .scaledToFill()
                             .frame(width: 40, height: 40)
                             .clipShape(Circle())
                             .padding(.trailing, 8)
                     }
                     VStack(alignment: .leading) {
                         Text(post.farmerName)
                             .font(.headline)
                         Text(post.title)
                             .font(.title2)
                             .fontWeight(.bold)
                     }
                     Spacer()
                 }
                 .padding(.horizontal)

                 // Post Description
                 Text(post.description)
                     .padding(.horizontal)

                 // Post Images
                 ForEach(post.images, id: \.self) { image in
                     Image(image)
                         .resizable()
                         .scaledToFill()
                         .frame(height: 250)
                         .clipped()
                         .cornerRadius(10)
                         .padding(.horizontal)
                 }

                 // Likes & Comments Section
                 HStack {
                     Text("Likes: \(post.likes)")
                         .font(.subheadline)
                     Spacer()
                     Text("Comments: \(post.comments.count)")
                         .font(.subheadline)
                 }
                 .padding(.horizontal)

                 // Comment List
                 VStack(alignment: .leading) {
                     ForEach(post.comments, id: \.timestamp) { comment in
                         HStack {
                             if let profileImage = comment.profileImage {
                                 Image(profileImage)
                                     .resizable()
                                     .scaledToFill()
                                     .frame(width: 30, height: 30)
                                     .clipShape(Circle())
                                     .padding(.trailing, 8)
                             }
                             VStack(alignment: .leading) {
                                 Text(comment.username)
                                     .font(.subheadline)
                                     .fontWeight(.bold)
                                 Text(comment.text)
                                     .font(.body)
                                     .foregroundColor(.gray)
                                 Text(comment.timestamp, style: .time)
                                     .font(.caption)
                                     .foregroundColor(.gray)
                             }
                         }
                         .padding(.horizontal)
                         .padding(.bottom, 8)
                     }
                 }

                 // Add Comment Text Field
                 VStack {
                     TextField("Add a comment...", text: $newComment)
                         .padding()
                         .background(Color(.systemGray6))
                         .cornerRadius(10)
                         .padding(.horizontal)

                     Button(action: {
                         // Handle comment submission
                         print("New Comment: \(newComment)")
                         // Add the new comment to the post
                         // Here, you would typically send the comment to your backend
                         self.newComment = "" // Clear the text field
                     }) {
                         Text("Post Comment")
                             .frame(maxWidth: .infinity)
                             .padding()
                             .background(newComment.isEmpty ? Color.gray : Color.blue)
                             .foregroundColor(.white)
                             .cornerRadius(10)
                             .padding(.horizontal)
                     }
                     .disabled(newComment.isEmpty)
                 }
                 .padding(.bottom)
             }
         }
         .navigationTitle("Post Details")
     }
 }

 */
