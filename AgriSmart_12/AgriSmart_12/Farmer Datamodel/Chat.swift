//
//  Chat.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//
import UIKit

struct Chat {
    let id: String              // Unique identifier for the chat
    let consumerId: String      // Reference to the consumer
    let profileImageURL: String // URL for the consumer's profile image
    let username: String        // Consumer's name
    let lastMessage: String     // Last message in the chat
    let timestamp: Date         // Time of the last message
    let isUnread: Bool          // Flag to indicate unread messages
}
