//
//  SettingsViewController.swift
//  home_page_apex
//
//  Created by student-2 on 19/12/24.
//
//


import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
            
            // Add switches for toggle items
            if indexPath.row == 2 || indexPath.row == 3 {
                let toggleSwitch = UISwitch()
                toggleSwitch.isOn = indexPath.row == 2 // Push notifications default ON
                toggleSwitch.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
                toggleSwitch.tag = indexPath.row // Identify which switch
                cell.accessoryView = toggleSwitch
            }
        } else {
            cell.textLabel?.text = moreOptions[indexPath.row]
        }
        
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 1, indexPath.row == 3 {
            performSegue(withIdentifier: "HelpDesk", sender: self)
        }
    }
    
    
    @IBSegueAction func goToHelpDesk(_ coder: NSCoder) -> HelpDeskViewController? {
        return HelpDeskViewController(coder: coder)
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
        
        let profileImageView = UIImageView(frame: CGRect(x: (view.frame.width - 80) / 2, y: 20, width: 80, height: 80))
        profileImageView.image = UIImage(systemName: "person.circle")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 40
        profileImageView.layer.masksToBounds = true
        profileImageView.tintColor = .gray
        
        let nameLabel = UILabel(frame: CGRect(x: 20, y: 110, width: view.frame.width - 40, height: 20))
        nameLabel.text = "John Doe"
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.textColor = .label
        
        headerView.addSubview(profileImageView)
        headerView.addSubview(nameLabel)
        
        tableView.tableHeaderView = headerView
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
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
        // Create an alert controller
        let alertController = UIAlertController(
            title: "Logout",
            message: "Are you sure you want to logout?",
            preferredStyle: .alert
        )
        
        // Add "Yes" action
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) { _ in
            // Navigate to the "Main" storyboard and "start" view controller
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let startViewController = mainStoryboard.instantiateViewController(withIdentifier: "start")
            
            // Set as root view controller
            let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
            sceneDelegate?.window?.rootViewController = startViewController
            sceneDelegate?.window?.makeKeyAndVisible()
        }
        
        // Add "No" action
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        // Add actions to the alert
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        // Present the alert
        self.present(alertController, animated: true, completion: nil)
    }
}
