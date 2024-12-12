//
//  MessageLink.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 12/12/24.
//

import Foundation

struct Message {
    let id: Int
    let senderName: String
    let senderImage: String
    let messageText: String
    let sentTime: Date
}

let farmerMessages = [
    Message(id: 1, senderName: "Farmer John", senderImage: "farmerJohn", messageText: "Fresh organic tomatoes are available for sale!", sentTime: Date()),
    Message(id: 2, senderName: "Farmer Lisa", senderImage: "farmerLisa", messageText: "New batch of golden wheat is ready. Check it out!", sentTime: Date().addingTimeInterval(-3600)),
    Message(id: 3, senderName: "Farmer Raj", senderImage: "farmerRaj", messageText: "Get your fresh carrots before they run out!", sentTime: Date().addingTimeInterval(-7200))
]

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
