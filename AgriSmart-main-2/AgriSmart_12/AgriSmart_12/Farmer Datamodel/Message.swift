//
//  Message.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//

import UIKit
import Foundation
struct Messages {
    let id: String            // Unique identifier for the message
    let chatId: String        // Reference to the chat
    let senderId: String      // ID of the sender (farmer or consumer)
    let recipientId: String   // ID of the recipient
    let content: String       // The actual message content
    let timestamp: Date       // Time the message was sent
    let isRead: Bool          // Flag to indicate if the message is read
    let type: MessageType     // Type of message (text, image, etc.)
}

enum MessageType {
    case text
    case image
    case video
    case file
}
