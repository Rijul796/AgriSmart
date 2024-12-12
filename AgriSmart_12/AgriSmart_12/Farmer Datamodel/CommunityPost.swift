//
//  CommunityPost.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//
import UIKit

struct CommunityPost {
    let id: String              // Unique identifier for the post
    let author: String          // Name of the post author
    let authorProfileImage: String? // URL or path to the author's profile image
    let content: String         // Text content of the post
    let image: String?          // Optional image URL or path associated with the post
    let timestamp: Date         // Time the post was created
    let likes: Int              // Number of likes
    let comments: Int           // Number of comments
}
struct CommunityStats {
    let totalPosts: Int         // Total number of posts in the community
    let topContributors: [Contributor] // List of top contributors
    let activeFarmers: Int      // Count of active farmers
}

struct Contributor {
    let name: String            // Name of the contributor
    let profileImage: String?   // Profile image of the contributor
    let postCount: Int          // Number of posts contributed by the user
}
/*
 struct FarmerCommunityScreen: View {
     @State private var searchText: String = ""
     @State private var posts: [CommunityPost] = [
         CommunityPost(
             id: "1",
             author: "Farmer John",
             authorProfileImage: "john_profile",
             content: "Harvested my first batch of organic apples!",
             image: "apples_image",
             timestamp: Date(),
             likes: 25,
             comments: 10
         ),
         CommunityPost(
             id: "2",
             author: "Farmer Jane",
             authorProfileImage: "jane_profile",
             content: "Looking for buyers for fresh wheat harvest. DM me!",
             image: nil,
             timestamp: Date(),
             likes: 15,
             comments: 5
         )
     ]
     @State private var stats: CommunityStats = CommunityStats(
         totalPosts: 120,
         topContributors: [
             Contributor(name: "Farmer Mike", profileImage: "mike_profile", postCount: 35),
             Contributor(name: "Farmer Lisa", profileImage: "lisa_profile", postCount: 30)
         ],
         activeFarmers: 56
     )

     var filteredPosts: [CommunityPost] {
         if searchText.isEmpty {
             return posts
         } else {
             return posts.filter { $0.content.lowercased().contains(searchText.lowercased()) }
         }
     }

     var body: some View {
         NavigationView {
             ScrollView {
                 VStack {
                     // Add New Post Button
                     HStack {
                         Spacer()
                         Button(action: {
                             print("Navigate to create post screen")
                         }) {
                             Image(systemName: "plus.circle.fill")
                                 .font(.largeTitle)
                                 .foregroundColor(.blue)
                         }
                         .padding()
                     }

                     // Search Bar
                     TextField("Search Community Posts...", text: $searchText)
                         .padding()
                         .background(Color(.systemGray6))
                         .cornerRadius(10)
                         .padding(.horizontal)

                     // Recent Posts
                     VStack(alignment: .leading) {
                         Text("Recent Posts")
                             .font(.headline)
                             .padding(.horizontal)
                         ForEach(filteredPosts, id: \.id) { post in
                             CommunityPostRow(post: post)
                         }
                     }

                     // Community Stats
                     VStack(alignment: .leading) {
                         Text("Community Stats & Highlights")
                             .font(.headline)
                             .padding(.horizontal)

                         Text("Total Posts: \(stats.totalPosts)")
                             .padding(.horizontal)
                         Text("Active Farmers: \(stats.activeFarmers)")
                             .padding(.horizontal)

                         VStack(alignment: .leading) {
                             Text("Top Contributors")
                                 .font(.subheadline)
                                 .padding(.horizontal)
                             ForEach(stats.topContributors, id: \.name) { contributor in
                                 HStack {
                                     if let image = contributor.profileImage {
                                         Image(image)
                                             .resizable()
                                             .frame(width: 40, height: 40)
                                             .clipShape(Circle())
                                     }
                                     Text(contributor.name)
                                     Spacer()
                                     Text("\(contributor.postCount) Posts")
                                 }
                                 .padding(.horizontal)
                             }
                         }
                     }
                 }
                 .navigationTitle("Farmer Community")
             }
         }
     }
 }

 struct CommunityPostRow: View {
     let post: CommunityPost

     var body: some View {
         VStack(alignment: .leading) {
             HStack {
                 if let profileImage = post.authorProfileImage {
                     Image(profileImage)
                         .resizable()
                         .frame(width: 40, height: 40)
                         .clipShape(Circle())
                 }
                 VStack(alignment: .leading) {
                     Text(post.author).font(.headline)
                     Text(post.timestamp, style: .time).font(.caption).foregroundColor(.gray)
                 }
                 Spacer()
             }
             .padding(.horizontal)

             Text(post.content)
                 .padding(.horizontal)

             if let image = post.image {
                 Image(image)
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(height: 200)
                     .clipped()
                     .cornerRadius(10)
                     .padding(.horizontal)
             }

             HStack {
                 Text("Likes: \(post.likes)")
                 Spacer()
                 Text("Comments: \(post.comments)")
             }
             .padding(.horizontal)
             .font(.caption)
             .foregroundColor(.gray)

             Divider()
         }
         .padding(.vertical)
     }
 }

 */
