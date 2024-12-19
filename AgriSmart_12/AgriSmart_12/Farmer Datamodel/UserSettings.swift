//
//  UserSettings.swift
//  AgriSmart_12
//
//  Created by student-2 on 19/12/24.
//


import Foundation

// MARK: - Settings Models

struct UserSettings {
    var pushNotificationsEnabled: Bool
    var darkModeEnabled: Bool
}

class SettingsDataModel {
    static let shared = SettingsDataModel()
    private var settings: UserSettings
    
    private init() {
        // Initialize with default settings
        self.settings = UserSettings(
            pushNotificationsEnabled: true,
            darkModeEnabled: false
        )
    }
    
    func updateSettings(pushNotifications: Bool, darkMode: Bool) {
        settings = UserSettings(
            pushNotificationsEnabled: pushNotifications,
            darkModeEnabled: darkMode
        )
        saveSettings()
    }
    
    func getSettings() -> UserSettings {
        return settings
    }
    
    private func saveSettings() {
        // Implementation for persisting settings to UserDefaults
        let defaults = UserDefaults.standard
        defaults.set(settings.pushNotificationsEnabled, forKey: "pushNotificationsEnabled")
        defaults.set(settings.darkModeEnabled, forKey: "darkModeEnabled")
    }
    
    func loadSettings() {
        let defaults = UserDefaults.standard
        settings = UserSettings(
            pushNotificationsEnabled: defaults.bool(forKey: "pushNotificationsEnabled"),
            darkModeEnabled: defaults.bool(forKey: "darkModeEnabled")
        )
    }
}

// MARK: - Help Desk Models

struct FAQItem {
    let question: String
    let answer: String
    var isExpanded: Bool
}

class HelpDeskDataModel {
    static let shared = HelpDeskDataModel()
    private var faqItems: [FAQItem]
    
    private init() {
        // Initialize with default FAQ items
        self.faqItems = [
            FAQItem(
                question: "How do I manage my notifications?",
                answer: "You can manage your notifications in Settings > Push notifications. Toggle the switch to enable or disable notifications.",
                isExpanded: false
            ),
            FAQItem(
                question: "How do I update my profile information?",
                answer: "Go to Settings > Edit profile to update your personal information including name, email, and other details.",
                isExpanded: false
            ),
            FAQItem(
                question: "How do I add or update my products in the inventory?",
                answer: "Navigate to the Inventory section and use the + button to add new products or tap existing ones to update.",
                isExpanded: false
            )
        ]
    }
    
    func getAllFAQs() -> [FAQItem] {
        return faqItems
    }
    
    func searchFAQs(query: String) -> [FAQItem] {
        guard !query.isEmpty else { return faqItems }
        
        return faqItems.filter { faq in
            faq.question.lowercased().contains(query.lowercased()) ||
            faq.answer.lowercased().contains(query.lowercased())
        }
    }
    
    func toggleFAQ(at index: Int) {
        guard index < faqItems.count else { return }
        faqItems[index].isExpanded.toggle()
    }
}

// MARK: - View Controller Extensions

//extension SettingsViewController {
//    func setupSettings() {
//        let currentSettings = SettingsDataModel.shared.getSettings()
//        pushNotificationsSwitch.isOn = currentSettings.pushNotificationsEnabled
//        darkModeSwitch.isOn = currentSettings.darkModeEnabled
//    }
//    
//    @objc func pushNotificationsSwitchChanged(_ sender: UISwitch) {
//        let currentSettings = SettingsDataModel.shared.getSettings()
//        SettingsDataModel.shared.updateSettings(
//            pushNotifications: sender.isOn,
//            darkMode: currentSettings.darkModeEnabled
//        )
//    }
//    
//    @objc func darkModeSwitchChanged(_ sender: UISwitch) {
//        let currentSettings = SettingsDataModel.shared.getSettings()
//        SettingsDataModel.shared.updateSettings(
//            pushNotifications: currentSettings.pushNotificationsEnabled,
//            darkMode: sender.isOn
//        )
//        updateAppearance()
//    }
//    
//    private func updateAppearance() {
//        if #available(iOS 13.0, *) {
//            let currentSettings = SettingsDataModel.shared.getSettings()
//            window?.overrideUserInterfaceStyle = currentSettings.darkModeEnabled ? .dark : .light
//        }
//    }
//}

//extension HelpDeskViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return HelpDeskDataModel.shared.getAllFAQs().count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQCell", for: indexPath)
//        let faq = HelpDeskDataModel.shared.getAllFAQs()[indexPath.row]
//        
//        cell.textLabel?.text = faq.question
//        cell.detailTextLabel?.text = faq.isExpanded ? faq.answer : nil
//        cell.accessoryType = .disclosureIndicator
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        HelpDeskDataModel.shared.toggleFAQ(at: indexPath.row)
//        tableView.reloadRows(at: [indexPath], with: .automatic)
//    }
//}
