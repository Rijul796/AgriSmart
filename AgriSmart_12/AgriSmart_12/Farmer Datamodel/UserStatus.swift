import Foundation

// MARK: - User Online Status
enum UserStatus {
    case online
    case offline
    case lastSeen(Date)
    
    var displayText: String {
        switch self {
        case .online:
            return "Online Now"
        case .offline:
            return "Offline"
        case .lastSeen(let date):
            let formatter = RelativeDateTimeFormatter()
            return "Last seen " + formatter.localizedString(for: date, relativeTo: Date())
        }
    }
}

// MARK: - Chat Message
struct ChatMessage: Identifiable {
    let id: String
    let senderId: Int
    let receiverId: Int
    let content: String
    let timestamp: Date
    var isRead: Bool
    
    // Optional attachment properties
    var attachedProductId: Int?
    var attachedImage: String?
    
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: timestamp)
    }
}

// MARK: - Chat User
struct ChatUser {
    let id: Int
    let name: String
    let profileImage: String
    var status: UserStatus
    var unreadCount: Int
    
    // Last message preview for chat list
    var lastMessage: ChatMessage?
    
    var statusDisplay: String {
        return status.displayText
    }
}

// MARK: - Chat Manager
class ChatManager {
    static let shared = ChatManager()
    private var activeChats: [Int: [ChatMessage]] = [:] // receiverId: messages
    private var chatUsers: [Int: ChatUser] = [:]
    
    private init() {
        setupSampleData()
    }
    
    private func setupSampleData() {
        // Sample users
        let users = [
            ChatUser(
                id: 1,
                name: "Pankaj",
                profileImage: "pankaj_profile",
                status: .online,
                unreadCount: 0,
                lastMessage: ChatMessage(
                    id: UUID().uuidString,
                    senderId: 1,
                    receiverId: 0,
                    content: "Hello! i have fresh 5kg tamattoes available",
                    timestamp: Date(),
                    isRead: false
                )
            ),
            ChatUser(
                id: 2,
                name: "Ram",
                profileImage: "ram_profile",
                status: .offline,
                unreadCount: 1,
                lastMessage: ChatMessage(
                    id: UUID().uuidString,
                    senderId: 2,
                    receiverId: 0,
                    content: "was it avialble",
                    timestamp: Date().addingTimeInterval(-3600),
                    isRead: false
                )
            ),
            ChatUser(
                id: 3,
                name: "Shyam",
                profileImage: "shyam_profile",
                status: .online,
                unreadCount: 0,
                lastMessage: ChatMessage(
                    id: UUID().uuidString,
                    senderId: 3,
                    receiverId: 0,
                    content: "2kg beans are avialble.",
                    timestamp: Date().addingTimeInterval(-7200),
                    isRead: true
                )
            )
        ]
        
        for user in users {
            chatUsers[user.id] = user
        }
    }
    
    // MARK: - Chat Methods
    func getAllChats() -> [ChatUser] {
        return Array(chatUsers.values).sorted { $0.lastMessage?.timestamp ?? Date() > $1.lastMessage?.timestamp ?? Date() }
    }
    
    func getMessages(with userId: Int) -> [ChatMessage] {
        return activeChats[userId] ?? []
    }
    
    func sendMessage(_ content: String, to receiverId: Int, currentUserId: Int) -> ChatMessage {
        let newMessage = ChatMessage(
            id: UUID().uuidString,
            senderId: currentUserId,
            receiverId: receiverId,
            content: content,
            timestamp: Date(),
            isRead: false
        )
        
        if activeChats[receiverId] == nil {
            activeChats[receiverId] = []
        }
        activeChats[receiverId]?.append(newMessage)
        
        // Update last message in chat user
        if var user = chatUsers[receiverId] {
            user.lastMessage = newMessage
            chatUsers[receiverId] = user
        }
        
        return newMessage
    }
    
    func markAsRead(userId: Int) {
        if var messages = activeChats[userId] {
            messages = messages.map { var msg = $0; msg.isRead = true; return msg }
            activeChats[userId] = messages
        }
        
        if var user = chatUsers[userId] {
            user.unreadCount = 0
            chatUsers[userId] = user
        }
    }
    
    // MARK: - User Status Methods
    func updateUserStatus(_ userId: Int, status: UserStatus) {
        if var user = chatUsers[userId] {
            user.status = status
            chatUsers[userId] = user
        }
    }
    
    func getUserStatus(_ userId: Int) -> UserStatus? {
        return chatUsers[userId]?.status
    }
}

// MARK: - View Controller Extensions
//extension UITableViewCell {
//    func configureForChat(with user: ChatUser) {
//        // Configure cell for chat list
//        textLabel?.text = user.name
//        detailTextLabel?.text = user.lastMessage?.content
//        if user.unreadCount > 0 {
//            // Add unread badge
//            // Implementation details...
//        }
//    }
//}
