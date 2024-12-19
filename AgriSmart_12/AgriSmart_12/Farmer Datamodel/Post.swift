//
//  Post.swift
//  AgriSmart_12
//
//  Created by student-2 on 19/12/24.
//


import Foundation

// MARK: - Post Models

struct Post {
    let id: UUID
    let title: String
    let content: String
    let author: User
    let timestamp: Date
    var images: [String]  // Array of image URLs/paths
    var likes: Int
    var commentCount: Int
    var comments: [Comment]
}

struct Comment {
    let id: UUID
    let content: String
    let author: User
    let timestamp: Date
    var likes: Int
    var replies: Int
}

struct User {
    let id: UUID
    let name: String
    let profileImage: String
    var isTopContributor: Bool
    var postCount: Int
    var commentCount: Int
}

// MARK: - Community Stats

struct CommunityStats {
    var topContributors: [User]
    var activeFarmers: Int
    var totalPosts: Int
    var totalComments: Int
}

// MARK: - Data Management

class FarmerCommunityDataModel {
    static let shared = FarmerCommunityDataModel()
    
    private var posts: [Post] = []
    private var users: [User] = []
    private var communityStats: CommunityStats
    
    private init() {
        // Initialize with empty community stats
        self.communityStats = CommunityStats(
            topContributors: [],
            activeFarmers: 0,
            totalPosts: 0,
            totalComments: 0
        )
    }
    
    // MARK: - Post Management
    
    func createPost(title: String, content: String, author: User, images: [String]) -> Post {
        let newPost = Post(
            id: UUID(),
            title: title,
            content: content,
            author: author,
            timestamp: Date(),
            images: images,
            likes: 0,
            commentCount: 0,
            comments: []
        )
        posts.insert(newPost, at: 0)  // Add to beginning of feed
        updateCommunityStats()
        return newPost
    }
    
    func getAllPosts() -> [Post] {
        return posts.sorted { $0.timestamp > $1.timestamp }
    }
    
    func searchPosts(query: String) -> [Post] {
        return posts.filter { post in
            post.title.lowercased().contains(query.lowercased()) ||
            post.content.lowercased().contains(query.lowercased())
        }
    }
    
    // MARK: - Comment Management
    
    func addComment(to postId: UUID, content: String, author: User) -> Comment? {
        guard let postIndex = posts.firstIndex(where: { $0.id == postId }) else {
            return nil
        }
        
        let newComment = Comment(
            id: UUID(),
            content: content,
            author: author,
            timestamp: Date(),
            likes: 0,
            replies: 0
        )
        
        posts[postIndex].comments.append(newComment)
        posts[postIndex].commentCount += 1
        updateCommunityStats()
        
        return newComment
    }
    
    // MARK: - Like Management
    
    func likePost(postId: UUID) {
        guard let postIndex = posts.firstIndex(where: { $0.id == postId }) else {
            return
        }
        posts[postIndex].likes += 1
    }
    
    func likeComment(postId: UUID, commentId: UUID) {
        guard let postIndex = posts.firstIndex(where: { $0.id == postId }),
              let commentIndex = posts[postIndex].comments.firstIndex(where: { $0.id == commentId }) else {
            return
        }
        posts[postIndex].comments[commentIndex].likes += 1
    }
    
    // MARK: - Community Stats Management
    
    private func updateCommunityStats() {
        let activeUsers = Set(posts.map { $0.author.id })
        communityStats.activeFarmers = activeUsers.count
        communityStats.totalPosts = posts.count
        communityStats.totalComments = posts.reduce(0) { $0 + $1.commentCount }
        
        // Update top contributors
        let userPostCounts = Dictionary(grouping: posts, by: { $0.author })
            .mapValues { $0.count }
            .sorted { $0.value > $1.value }
            .prefix(10)
            .map { $0.key }
        
        communityStats.topContributors = Array(userPostCounts)
    }
    
    func getCommunityStats() -> CommunityStats {
        return communityStats
    }
}

// MARK: - View Controller Extensions

extension FarmerCommunityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FarmerCommunityDataModel.shared.getAllPosts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        let posts = FarmerCommunityDataModel.shared.getAllPosts()
        let post = posts[indexPath.row]
        
        cell.titleLabel.text = post.title
        cell.contentLabel.text = post.content
        cell.authorNameLabel.text = "Posted by \(post.author.name)"
        cell.timeLabel.text = formatTimeAgo(post.timestamp)
        cell.likesLabel.text = "\(post.likes)"
        cell.commentsLabel.text = "\(post.commentCount) replies"
        
        if !post.images.isEmpty {
            cell.postImageView.image = UIImage(named: post.images[0])
        }
        
        return cell
    }
    
    private func formatTimeAgo(_ date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.hour, .minute], from: date, to: now)
        
        if let hours = components.hour, hours > 0 {
            return "\(hours) hours ago"
        } else if let minutes = components.minute {
            return "\(minutes) minutes ago"
        } else {
            return "Just now"
        }
    }
}