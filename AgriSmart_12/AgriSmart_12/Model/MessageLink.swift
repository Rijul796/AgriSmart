//
//  MessageLink.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 12/12/24.
//

import Foundation

import Foundation

// MARK: - Message Model
struct Message {
    let senderName: String
    let senderImageURL: String // URL or path for sender's image
    let messageText: String
    let timestamp: Date
}

// MARK: - MessageManager
final class MessageManager {
    private(set) var messages: [Message] = []
    
    private init() {}
    static let shared = MessageManager() // Singleton instance to avoid redeclaration
    
    // Add a new message
    func addMessage(senderName: String, senderImageURL: String, messageText: String, timestamp: Date) {
        let newMessage = Message(senderName: senderName, senderImageURL: senderImageURL, messageText: messageText, timestamp: timestamp)
        messages.append(newMessage)
    }
    
    // Fetch all messages
    func fetchMessages() -> [Message] {
        return messages
    }
    
    // Filter messages by sender name (for search functionality)
    func filterMessages(by senderName: String) -> [Message] {
        return messages.filter { $0.senderName.lowercased().contains(senderName.lowercased()) }
    }
}


//import UIKit
//
//class MessageViewController: UIViewController {
//    @IBOutlet weak var tableView: UITableView!
//
//    var messages = sampleMessages // Message data
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
//    }
//}
//
//// MARK: - UITableViewDataSource
//extension MessageViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return messages.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageTableViewCell
//        let message = messages[indexPath.row]
//        cell.configure(with: message)
//        return cell
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension MessageViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let message = messages[indexPath.row]
//        print("Selected message from: \(message.senderName)")
//    }
//}
//


//import UIKit
//
//class MessageTableViewCell: UITableViewCell {
//    @IBOutlet weak var senderImageView: UIImageView!
//    @IBOutlet weak var senderNameLabel: UILabel!
//    @IBOutlet weak var messageTextLabel: UILabel!
//    @IBOutlet weak var sentTimeLabel: UILabel!
//
//    func configure(with message: Message) {
//        senderImageView.image = UIImage(named: message.senderImage) // Replace with actual image loading logic
//        senderNameLabel.text = message.senderName
//        messageTextLabel.text = message.messageText
//
//        // Format the sent time
//        let formatter = DateFormatter()
//        formatter.dateFormat = "hh:mm a" // e.g., "03:45 PM"
//        sentTimeLabel.text = formatter.string(from: message.sentTime)
//    }
//}

//tableView.estimatedRowHeight = 100
//tableView.rowHeight = UITableView.automaticDimension
