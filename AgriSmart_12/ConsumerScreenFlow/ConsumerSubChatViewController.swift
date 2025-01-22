//
//  ConsumerSubChatViewController.swift
//  AgriSmart_12
//
//  Created by student-2 on 22/01/25.
//


import UIKit

class ConsumerSubChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!

    var username: String?
    var imageName: String?
    var messages: [String] = ["Hello!", "How can I help you today?"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set profile image and username
        if let username = username {
            usernameLabel.text = username
        }
        if let imageName = imageName {
            profileImageView.image = UIImage(named: imageName)
            profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
            profileImageView.clipsToBounds = true
        }

        // Set tableView delegates
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func sendMessage(_ sender: UIButton) {
        // Get the text from the messageTextField and send it as a new message
        if let text = messageTextField.text, !text.isEmpty {
            messages.append(text)  // Add new message to the array
            messageTextField.text = ""  // Clear the text field
            tableView.reloadData()  // Reload the table view with new messages
            scrollToBottom()  // Scroll to the bottom of the table view
        }
    }

    // Method to automatically scroll to the most recent message
    func scrollToBottom() {
        let indexPath = IndexPath(row: messages.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }

    // TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        cell.textLabel?.text = messages[indexPath.row]  // Display message in the cell
        cell.textLabel?.numberOfLines = 0  // Allow the message to wrap into multiple lines
        return cell
    }

    // Method to set dynamic row height based on message content
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
