//
//  Notification.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//
import UIKit

struct Notification {
    let id: String            // Unique identifier for the notification
    let type: NotificationType // Type of notification
    let title: String         // Title or short summary of the notification
    let description: String   // Detailed description of the notification
    let timestamp: Date       // Time the notification was created
    let isRead: Bool          // Flag to indicate if the notification is read
}

enum NotificationType {
    case orderUpdate          // Notifications about order status
    case message              // New message notifications
    case announcement         // App announcements or updates
    case other                // Any other type of notification
}
/*
 struct NotificationRow: View {
     let notification: Notification

     var body: some View {
         HStack {
             VStack(alignment: .leading) {
                 Text(notification.title)
                     .font(.headline)
                     .foregroundColor(notification.isRead ? .gray : .black)
                 Text(notification.description)
                     .font(.subheadline)
                     .foregroundColor(.gray)
                     .lineLimit(1)
                 Text(notification.timestamp, style: .time)
                     .font(.caption)
                     .foregroundColor(.gray)
             }
             Spacer()
             if !notification.isRead {
                 Circle()
                     .fill(Color.red)
                     .frame(width: 10, height: 10)
             }
         }
         .padding()
     }
 }

 struct NotificationScreen: View {
     let notifications: [Notification]

     var body: some View {
         ScrollView {
             VStack {
                 ForEach(notifications, id: \.id) { notification in
                     NotificationRow(notification: notification)
                 }
             }
             .padding()
         }
     }
 }

 */
