import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    var chats = [
        (username: "Pankaj", message: "Thank you! That was very helpful!", imageName: "farmer-1"),
        (username: "Ram", message: "Was it available?", imageName: "Farmer-2"),
        (username: "Shyam", message: "2kg beans are available.", imageName: "farmer-3")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        let chat = chats[indexPath.row]
        cell.usernameLabel.text = chat.username
        cell.messageLabel.text = chat.message
        cell.profileImageView.image = UIImage(named: chat.imageName)
        cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.height / 2
        cell.profileImageView.clipsToBounds = true
        cell.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chat = chats[indexPath.row]

        // Instantiate SubChatViewController using Storyboard ID
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let subChatVC = storyboard.instantiateViewController(withIdentifier: "SubChatViewController") as? SubChatViewController {
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
}

