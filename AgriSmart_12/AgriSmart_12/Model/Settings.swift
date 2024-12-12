//
//  Settings.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 12/12/24.
//

import Foundation
struct Setting {
    let title: String
    let iconName: String? // Optional: Icon for the setting (if needed)
    let action: (() -> Void)? // Action to be executed when tapped
}

let settings = [
    [
        Setting(title: "Profile", iconName: "person.circle", action: { print("Navigate to Profile") }),
        Setting(title: "Change Password", iconName: "lock.circle", action: { print("Navigate to Change Password") })
    ],
    [
        Setting(title: "Notifications", iconName: "bell.circle", action: { print("Toggle Notifications") })
    ],
    [
        Setting(title: "Language", iconName: "globe", action: { print("Navigate to Language Settings") }),
        Setting(title: "Theme", iconName: "moon.circle", action: { print("Navigate to Theme Settings") })
    ],
    [
        Setting(title: "Help Center", iconName: "questionmark.circle", action: { print("Navigate to Help Center") }),
        Setting(title: "About Us", iconName: "info.circle", action: { print("Navigate to About Us") }),
        Setting(title: "Log Out", iconName: "arrow.right.circle", action: { print("Log Out") })
    ]
]








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



