//
//  Profile.swift
//  AgriSmart_12
//
//  Created by student-2 on 19/12/24.
//


import Foundation

// Structure to represent a user profile
struct Profile {
    var name: String
    var emailAddress: String
    var dateOfBirth: Date
    var countryRegion: String
    var joinedDate: Date
    var profileImage: String?  // Optional, for storing image name/path
}

// Class to manage profile data
class ProfileDataModel {
    static let shared = ProfileDataModel()
    private var userProfile: Profile?
    
    private init() {
        // Initialize with empty profile
    }
    
    // Method to create/update profile
    func updateProfile(name: String, email: String, dob: Date, country: String, joinedDate: Date, image: String? = nil) {
        userProfile = Profile(
            name: name,
            emailAddress: email,
            dateOfBirth: dob,
            countryRegion: country,
            joinedDate: joinedDate,
            profileImage: image
        )
    }
    
    // Method to get profile
    func getProfile() -> Profile? {
        return userProfile
    }
    
    // Method to validate email format
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    // Method to format date for display
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

// Example view controller extension to handle profile data
//extension ProfileViewController {
//    func saveProfile() {
//        guard let name = nameTextField.text,
//              let email = emailTextField.text,
//              let country = countryTextField.text,
//              !name.isEmpty,
//              !email.isEmpty,
//              !country.isEmpty,
//              let dob = dobDatePicker.date,
//              let joinedDate = joinedDatePicker.date else {
//            // Handle validation error
//            return
//        }
//        
//        // Validate email format
//        guard ProfileDataModel.shared.isValidEmail(email) else {
//            // Handle invalid email error
//            return
//        }
//        
//        // Save profile
//        ProfileDataModel.shared.updateProfile(
//            name: name,
//            email: email,
//            dob: dob,
//            country: country,
//            joinedDate: joinedDate
//        )
//    }
//    
//    func loadProfile() {
//        if let profile = ProfileDataModel.shared.getProfile() {
//            nameTextField.text = profile.name
//            emailTextField.text = profile.emailAddress
//            countryTextField.text = profile.countryRegion
//            dobDatePicker.date = profile.dateOfBirth
//            joinedDatePicker.date = profile.joinedDate
//            
//            if let imageName = profile.profileImage {
//                profileImageView.image = UIImage(named: imageName)
//            }
//        }
//    }
//}
