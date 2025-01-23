import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class NewChatViewController: UIViewController, UIDocumentPickerDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var chatTableView: UITableView!

    var recipient: User? // The user to whom the message will be sent
    var selectedDocumentURL: URL?
    var messages: [String] = [] // Array to store messages

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }

    private func setupUI() {
        // User Image
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        userImageView.layer.masksToBounds = true
        userImageView.layer.borderWidth = 2.0
        userImageView.layer.borderColor = UIColor.systemBlue.cgColor
        userImageView.contentMode = .scaleAspectFill

        // Display user details
        if let recipient = recipient {
            nameLabel.text = recipient.profile.name
            if let profileImageUrl = recipient.profile.profileImageUrl {
                userImageView.image = UIImage(named: profileImageUrl) // Load user image
            } else {
                userImageView.image = UIImage(systemName: "person.circle") // Placeholder image
            }
        } else {
            nameLabel.text = "Unknown User"
            userImageView.image = UIImage(systemName: "person.circle")
        }

        sendButton.layer.cornerRadius = 8
        sendButton.setTitleColor(.white, for: .normal)
    }

    private func setupTableView() {
        // Set tableView dataSource and delegate
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MessageCell") // Register a default cell
    }

    // Action for Add Document Button
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [
            UTType.pdf,        // For PDF files
            UTType.image,      // For image files
            UTType.plainText   // For plain text files
        ])
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        present(documentPicker, animated: true, completion: nil)
    }

    // Handle Document Picker Selection
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let url = urls.first {
            selectedDocumentURL = url
            print("Selected document URL: \(url)")
        }
    }

    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("Document picker cancelled.")
    }

    // Action for Send Button
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        guard let message = messageTextField.text, !message.isEmpty else {
            print("Message text is empty")
            return
        }

        // Simulate sending the message
        print("Message sent: \(message)")
        messages.append(message) // Add message to array
        messageTextField.text = "" // Clear the message text field

        // Reload the table view to display the new message
        chatTableView.reloadData()

        if let documentURL = selectedDocumentURL {
            print("Document sent: \(documentURL.lastPathComponent)")
        }
    }

    // UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count // Return the number of messages
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        cell.textLabel?.text = messages[indexPath.row] // Display message in the cell
        return cell
    }

    // UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 // Set height for each message cell
    }
}
