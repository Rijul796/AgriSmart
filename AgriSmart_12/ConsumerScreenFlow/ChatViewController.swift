import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var SearchBar: UISearchBar!

    var chats = [
        (username: "Pankaj", message: "Thank you! That was very helpful!", imageName: "farmer-1"),
        (username: "Ram", message: "Was it available?", imageName: "Farmer-2"),
        (username: "Shyam", message: "2kg beans are available.", imageName: "farmer-3")
    ]
    
    var filteredChats: [(username: String, message: String, imageName: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        SearchBar.delegate = self
        
        // Initialize the filteredChats array with all chats initially
        filteredChats = chats
    }

    // MARK: - TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredChats.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        let chat = filteredChats[indexPath.row]
        cell.usernameLabel.text = chat.username
        cell.messageLabel.text = chat.message
        cell.profileImageView.image = UIImage(named: chat.imageName)
        cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.height / 2
        cell.profileImageView.clipsToBounds = true
        cell.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return cell
    }

    // MARK: - Search Bar Delegate Methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            // Show all chats if the search text is empty
            filteredChats = chats
        } else {
            // Filter chats based on the search text
            filteredChats = chats.filter { chat in
                chat.username.lowercased().contains(searchText.lowercased()) ||
                chat.message.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Reset the search bar and display all chats
        searchBar.text = ""
        searchBar.resignFirstResponder()
        filteredChats = chats
        tableView.reloadData()
    }

    // MARK: - Navigation and Delete Functionality
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "subChat", sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "subChat", let indexPath = sender as? IndexPath {
            let subChatVC = segue.destination as! DetailChatViewController
            let chat = filteredChats[indexPath.row]
            subChatVC.userName = chat.username
            subChatVC.userImage = UIImage(named: chat.imageName)
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let chatToDelete = filteredChats[indexPath.row]

            // Remove from both filteredChats and chats array
            if let indexInOriginalArray = chats.firstIndex(where: { $0.username == chatToDelete.username && $0.message == chatToDelete.message }) {
                chats.remove(at: indexInOriginalArray)
            }
            filteredChats.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
