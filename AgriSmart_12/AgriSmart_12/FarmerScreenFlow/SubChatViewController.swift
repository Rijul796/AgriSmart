import UIKit

class SubChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!

    var username: String?
    var imageName: String?
    var messages: [String] = ["Hi there!", "How can I assist you?"]

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
        if let text = messageTextField.text, !text.isEmpty {
            messages.append(text)
            messageTextField.text = ""
            tableView.reloadData()
            scrollToBottom()
        }
    }

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
        cell.textLabel?.text = messages[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
