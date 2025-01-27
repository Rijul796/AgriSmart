import UIKit

// MARK: - NotificationViewController
class NotificationViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var notifications: [NotificationModel] = [] // Data source for the table view
    private let noNotificationsLabel: UILabel = {
        let label = UILabel()
        label.text = "No new notifications"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.isHidden = true // Initially hidden
        return label
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        populateNotifications() // Populate data
        updateNoNotificationsLabel() // Update the empty state UI
    }

    // MARK: - Setup Methods
    private func setupUI() {
        title = "Notifications"
        view.addSubview(noNotificationsLabel)

        // Constraints for the label
        noNotificationsLabel.translatesAutoresizingMaskIntoConstraints = false
        noNotificationsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noNotificationsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NotificationCell.self, forCellReuseIdentifier: NotificationCell.identifier)
    }

    // MARK: - Data Population
    private func populateNotifications() {
        // Example notifications
        notifications = [
            NotificationModel(title: "New Offer!", subtitle: "20% off on fresh vegetables"),
            NotificationModel(title: "Order Update", subtitle: "Your order has been shipped"),
            NotificationModel(title: "Welcome!", subtitle: "Thank you for joining AgriSmart")
        ]
        tableView.reloadData() // Reload the table view after populating
    }

    // MARK: - Empty State Update
    private func updateNoNotificationsLabel() {
        noNotificationsLabel.isHidden = !notifications.isEmpty
        tableView.isHidden = notifications.isEmpty
    }
}

// MARK: - UITableViewDataSource
extension NotificationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationCell.identifier, for: indexPath) as? NotificationCell else {
            return UITableViewCell()
        }
        let notification = notifications[indexPath.row]
        cell.configure(with: notification) // Configure cell
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove notification from the data source
            self.notifications.remove(at: indexPath.row)

            // Delete the row with animation
            tableView.deleteRows(at: [indexPath], with: .automatic)

            // Update empty state UI
            self.updateNoNotificationsLabel()
        }
    }
}

// MARK: - UITableViewDelegate
extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Handle notification selection if needed
    }
}

// MARK: - Notification Model
struct NotificationModel {
    let title: String
    let subtitle: String
}

// MARK: - NotificationCell
class NotificationCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "NotificationCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()

    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Views
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)

        // Constraints for Title Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        // Constraints for Subtitle Label
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }

    // MARK: - Configure Method
    func configure(with model: NotificationModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
}
