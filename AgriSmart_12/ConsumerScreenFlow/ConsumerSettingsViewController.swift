import UIKit

class ConsumerSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let sections = ["Account Settings", "More"]
    let accountSettings = ["Edit profile", "Change password", "Push notifications", "Dark mode"]
    let moreOptions = ["About us", "Privacy policy", "Terms and conditions", "Help Desk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView setup
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Add Header for Profile Section
        addHeaderForProfile()
        
        // Add Logout Button to Footer
        addFooterWithLogoutButton()
    }
    
    // MARK: - TableView DataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return accountSettings.count
        } else {
            return moreOptions.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = accountSettings[indexPath.row]
            if indexPath.row == 2 || indexPath.row == 3 {
                let toggleSwitch = UISwitch()
                toggleSwitch.isOn = indexPath.row == 2
                toggleSwitch.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
                toggleSwitch.tag = indexPath.row
                cell.accessoryView = toggleSwitch
            }
        } else {
            cell.textLabel?.text = moreOptions[indexPath.row]
        }
        return cell
    }
    
    // MARK: - Switch Actions
    
    @objc func switchToggled(_ sender: UISwitch) {
        if sender.tag == 2 {
            print("Push notifications toggled: \(sender.isOn)")
        } else if sender.tag == 3 {
            print("Dark mode toggled: \(sender.isOn)")
        }
    }
    
    // MARK: - Header with Profile
    
    private func addHeaderForProfile() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        headerView.backgroundColor = .white
        
        // Profile Image View
        let profileImageView = UIImageView(frame: CGRect(x: (view.frame.width - 80) / 2, y: 20, width: 80, height: 80))
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 40
        profileImageView.layer.masksToBounds = true
        
        // Load the profile image from UserDefaults
        if let imageData = UserDefaults.standard.data(forKey: "userProfileImage"), let image = UIImage(data: imageData) {
            profileImageView.image = image
        } else {
            // Fallback to default system image if no image is saved
            profileImageView.image = UIImage(systemName: "person.circle")
        }
        
        profileImageView.tintColor = nil
        
        // Name Label
        let nameLabel = UILabel(frame: CGRect(x: 20, y: 110, width: view.frame.width - 40, height: 20))
        nameLabel.text = UserDefaults.standard.string(forKey: "userName") ?? "John Doe"
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.textColor = .label
        
        // Add profile image and name label to the header view
        headerView.addSubview(profileImageView)
        headerView.addSubview(nameLabel)
        
        tableView.tableHeaderView = headerView
    }
    
    // MARK: - Footer with Logout Button
    
    private func addFooterWithLogoutButton() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        footerView.backgroundColor = .clear
        
        let logoutButton = UIButton(type: .system)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.backgroundColor = .systemRed
        logoutButton.layer.cornerRadius = 10
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        footerView.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            logoutButton.widthAnchor.constraint(equalTo: footerView.widthAnchor, multiplier: 0.8),
            logoutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        tableView.tableFooterView = footerView
    }
    
    @objc private func logoutButtonTapped() {
        let alertController = UIAlertController(
            title: "Logout",
            message: "Are you sure you want to logout?",
            preferredStyle: .alert
        )
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) { _ in
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let startViewController = mainStoryboard.instantiateViewController(withIdentifier: "start")
            let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
            sceneDelegate?.window?.rootViewController = startViewController
            sceneDelegate?.window?.makeKeyAndVisible()
        }
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
