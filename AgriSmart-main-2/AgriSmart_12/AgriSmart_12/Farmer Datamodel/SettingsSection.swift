//
//  SettingsSection.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//

import UIKit
struct SettingsSectionFarmer {
    let title: String             // Title of the section (e.g., "Account Settings")
    let items: [SettingsItem]     // List of settings items in the section
}

struct SettingsItemFarmer{
    let title: String             // Title of the setting (e.g., "Edit Profile")
    let icon: String?             // Optional icon name for the setting
    let actionType: SettingsActionType // Defines the action for the item
}

enum SettingsActionType {
    case editProfile
    case changePassword
    case toggleNotifications(Bool)
    case toggleDarkMode(Bool)
    case viewAboutUs
    case viewPrivacyPolicy
    case viewTermsAndConditions
    case helpDesk
    case logout
}
/*
 let settingsData: [SettingsSection] = [
     SettingsSection(
         title: "Profile Overview",
         items: [
             SettingsItem(title: "Edit Profile", icon: "pencil", actionType: .editProfile)
         ]
     ),
     SettingsSection(
         title: "Account Settings",
         items: [
             SettingsItem(title: "Change Password", icon: "lock", actionType: .changePassword),
             SettingsItem(title: "Notifications", icon: "bell", actionType: .toggleNotifications(false)),
             SettingsItem(title: "Dark Mode", icon: "moon", actionType: .toggleDarkMode(false))
         ]
     ),
     SettingsSection(
         title: "More",
         items: [
             SettingsItem(title: "About Us", icon: "info.circle", actionType: .viewAboutUs),
             SettingsItem(title: "Privacy Policy", icon: "shield", actionType: .viewPrivacyPolicy),
             SettingsItem(title: "Terms and Conditions", icon: "doc.text", actionType: .viewTermsAndConditions),
             SettingsItem(title: "Help Desk", icon: "questionmark.circle", actionType: .helpDesk)
         ]
     ),
     SettingsSection(
         title: "",
         items: [
             SettingsItem(title: "Logout", icon: "arrow.backward", actionType: .logout)
         ]
     )
 ]
 struct SettingsScreen: View {
     let sections: [SettingsSection]

     var body: some View {
         NavigationView {
             List {
                 ForEach(sections, id: \.title) { section in
                     Section(header: Text(section.title)) {
                         ForEach(section.items, id: \.title) { item in
                             SettingsRow(item: item)
                         }
                     }
                 }
             }
             .navigationTitle("Settings")
         }
     }
 }

 struct SettingsRow: View {
     let item: SettingsItem

     var body: some View {
         HStack {
             if let icon = item.icon {
                 Image(systemName: icon)
                     .foregroundColor(.blue)
             }
             Text(item.title)
             Spacer()
             if case .toggleNotifications(let isOn) = item.actionType {
                 Toggle("", isOn: .constant(isOn))
                     .labelsHidden()
             } else if case .toggleDarkMode(let isOn) = item.actionType {
                 Toggle("", isOn: .constant(isOn))
                     .labelsHidden()
             }
         }
         .contentShape(Rectangle())
         .onTapGesture {
             handleAction(item.actionType)
         }
     }
 }

 func handleAction(_ action: SettingsActionType) {
     switch action {
     case .editProfile:
         print("Navigate to Edit Profile")
     case .changePassword:
         print("Navigate to Change Password")
     case .toggleNotifications(let isOn):
         print("Notifications toggled to \(isOn)")
     case .toggleDarkMode(let isOn):
         print("Dark Mode toggled to \(isOn)")
     case .viewAboutUs:
         print("Navigate to About Us")
     case .viewPrivacyPolicy:
         print("Navigate to Privacy Policy")
     case .viewTermsAndConditions:
         print("Navigate to Terms and Conditions")
     case .helpDesk:
         print("Open Help Desk")
     case .logout:
         print("Log out of the app")
     }
 }

 */
