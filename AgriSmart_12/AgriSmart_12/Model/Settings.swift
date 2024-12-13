//
//  Settings.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 12/12/24.
//

import Foundation
import Foundation

// MARK: - SettingsItem Model
struct SettingsItem {
    let title: String
    let subtitle: String? // Optional for items with descriptions
    let iconName: String? // Optional for items with icons
    let action: (() -> Void)? // Optional action closure
}

// MARK: - SettingsSection Model
struct SettingsSection {
    let headerTitle: String
    let items: [SettingsItem]
}

// MARK: - SettingsManager
final class SettingsManager {
    private(set) var sections: [SettingsSection] = []
    
    private init() {}
    static let shared = SettingsManager() // Singleton instance to avoid redeclaration
    
    // Initialize sections
    func configureSettings() {
        sections = [
            SettingsSection(headerTitle: "Profile", items: [
                SettingsItem(title: "Edit Profile", subtitle: nil, iconName: "edit_icon", action: {
                    print("Edit Profile tapped")
                }),
                SettingsItem(title: "Change Password", subtitle: nil, iconName: "password_icon", action: {
                    print("Change Password tapped")
                })
            ]),
            SettingsSection(headerTitle: "Notifications", items: [
                SettingsItem(title: "Notification Settings", subtitle: nil, iconName: "notification_icon", action: {
                    print("Notification Settings tapped")
                })
            ]),
            SettingsSection(headerTitle: "Preferences", items: [
                SettingsItem(title: "Language", subtitle: "English", iconName: "language_icon", action: {
                    print("Language tapped")
                }),
                SettingsItem(title: "Theme", subtitle: "Light", iconName: "theme_icon", action: {
                    print("Theme tapped")
                })
            ]),
            SettingsSection(headerTitle: "About", items: [
                SettingsItem(title: "Privacy Policy", subtitle: nil, iconName: "privacy_icon", action: {
                    print("Privacy Policy tapped")
                }),
                SettingsItem(title: "Terms & Conditions", subtitle: nil, iconName: "terms_icon", action: {
                    print("Terms & Conditions tapped")
                })
            ])
        ]
    }
    
    // Fetch all sections
    func fetchSettingsSections() -> [SettingsSection] {
        return sections
    }
}









// view controller

//import UIKit
//
//class SettingsViewController: UIViewController {
//    @IBOutlet weak var tableView: UITableView!
//
//    let settingsSections = settings // Data source
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
//    }
//}
//
//// MARK: - UITableViewDataSource
//extension SettingsViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return settingsSections.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return settingsSections[section].count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
//        let setting = settingsSections[indexPath.section][indexPath.row]
//
//        cell.textLabel?.text = setting.title
//        if let iconName = setting.iconName {
//            cell.imageView?.image = UIImage(systemName: iconName)
//        }
//        return cell
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension SettingsViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let setting = settingsSections[indexPath.section][indexPath.row]
//        setting.action?()
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0: return "Account Settings"
//        case 1: return "Notifications"
//        case 2: return "Preferences"
//        case 3: return "Support"
//        default: return nil
//        }
//    }
//}



