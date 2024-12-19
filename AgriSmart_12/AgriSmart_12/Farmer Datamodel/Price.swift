//
//  Price.swift
//  AgriSmart_12
//
//  Created by student-2 on 19/12/24.
//


import Foundation

// MARK: - Notification Models
struct Notification {
    var id: String
    var type: NotificationType
    var title: String
    var message: String
    var timestamp: Date
    var isRead: Bool
    var relatedId: String?
    var sender: String?
}

enum NotificationType {
    case newRequest
    case chatMessage
    case postLike
    case postComment
    case priceUpdate
    case systemAlert
    case weatherAlert
    case marketPriceUpdate
    case governmentScheme
}
