////
////  ConsumerChatViewController.swift
////  AgriSmart_12
////
////  Created by student-2 on 18/01/25.
////
//
//
//import UIKit
//
//class ConsumerChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    @IBOutlet weak var tableView: UITableView!
//
//    var chats = [
//        (username: "Supplier1", message: "Your order is ready for pickup.", imageName: "supplier-1"),
//        (username: "Supplier2", message: "Do you need 3kg tomatoes?", imageName: "supplier-2"),
//        (username: "Supplier3", message: "Price confirmed: $50 per box.", imageName: "supplier-3")
//    ]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return chats.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ConsumerChatCell", for: indexPath) as! ConsumerChatMessageCell
//        let chat = chats[indexPath.row]
//        cell.usernameLabel.text = chat.username
//        cell.messageLabel.text = chat.message
//        cell.profileImageView.image = UIImage(named: chat.imageName)
//        cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.height / 2
//        cell.profileImageView.clipsToBounds = true
//        cell.heightAnchor.constraint(equalToConstant: 70).isActive = true
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let chat = chats[indexPath.row]
//
//        // Instantiate SubChatViewController using Storyboard ID
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let subChatVC = storyboard.instantiateViewController(withIdentifier: "SubChatViewController") as? SubChatViewController {
//            // Pass data to SubChatViewController
//            subChatVC.username = chat.username
//            subChatVC.imageName = chat.imageName
//
//            // Navigate to SubChatViewController
//            navigationController?.pushViewController(subChatVC, animated: true)
//        }
//    }
//
//    // Add swipe-to-delete functionality
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Remove the chat from the data source
//            chats.remove(at: indexPath.row)
//
//            // Delete the row from the table view with animation
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//}
import UIKit

class ConsumerChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!

    var chats = [
        (username: "Supplier1", message: "Your order is ready for pickup.", imageName: "supplier-1"),
        (username: "Supplier2", message: "Do you need 3kg tomatoes?", imageName: "supplier-2"),
        (username: "Supplier3", message: "Price confirmed: $50 per box.", imageName: "supplier-3")
    ]
    var filteredChats: [(username: String, message: String, imageName: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup search bar
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search Chats"
        searchBar.sizeToFit()
        
        // Add search bar as table header view
        tableView.tableHeaderView = searchBar
        
        // Initialize filteredChats with the full list of chats
        filteredChats = chats
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredChats.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConsumerChatMessageCell2", for: indexPath) as! ConsumerChatMessageCell
        let chat = filteredChats[indexPath.row]
        cell.usernameLabel.text = chat.username
        cell.messageLabel.text = chat.message
        cell.profileImageView.image = UIImage(named: chat.imageName)
        cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.height / 2
        cell.profileImageView.clipsToBounds = true
        cell.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chat = filteredChats[indexPath.row]

        // Instantiate SubChatViewController using Storyboard ID
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let subChatVC = storyboard.instantiateViewController(withIdentifier: "SubChat") as? SubChatViewController {
            // Pass data to SubChatViewController
            subChatVC.username = chat.username
            subChatVC.imageName = chat.imageName

            // Navigate to SubChatViewController
            navigationController?.pushViewController(subChatVC, animated: true)
        }
    }

    // Add swipe-to-delete functionality
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove the chat from the data source
            chats.remove(at: indexPath.row)

            // Delete the row from the table view with animation
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - UISearchBarDelegate Methods

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            // Show all chats if search bar is empty
            filteredChats = chats
        } else {
            // Filter chats based on search text
            filteredChats = chats.filter {
                let fullName = $0.username.lowercased()
                let message = $0.message.lowercased()
                return fullName.contains(searchText.lowercased()) || message.contains(searchText.lowercased())
            }
        }
        tableView.reloadData() // Reload the table with filtered chats
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // Dismiss the keyboard when search is submitted
    }
}
