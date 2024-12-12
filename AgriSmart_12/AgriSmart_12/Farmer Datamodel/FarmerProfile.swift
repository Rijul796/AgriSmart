//
//  FarmerProfile.swift
//  AgriSmart_12
//
//  Created by student-2 on 12/12/24.
//

import UIKit
struct FarmerProfile {
    let id: String            // Unique identifier for the farmer
    var name: String          // Farmer's name
    var email: String         // Farmer's email address
    var dob: Date?            // Farmer's date of birth (optional)
    var country: String       // Country/Region of the farmer
    let joinedDate: Date      // Date when the farmer joined the platform
}
