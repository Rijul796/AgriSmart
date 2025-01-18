//
//  LandingPageDataModel.swift
//  AgriSmart_12
//
//  Created by student-2 on 19/12/24.
//


struct LandingPageDataModel {
    let welcomeText: String
    let subtitleText: String
    let backgroundImageURL: String
    let roles: [RoleOption]
    let signInText: String
    
    struct RoleOption {
        let title: String
        let action: () -> Void // Closure for navigation action
    }
}
let landingPageData = LandingPageDataModel(
    welcomeText: "Welcome",
    subtitleText: "Connecting Farmers Directly to Consumers\nFresh, farm-to-table produce, no middlemen—just pure, straight from the source.",
    backgroundImageURL: "farmer_field_image.jpg", // Replace with your asset name
    roles: [
        LandingPageDataModel.RoleOption(title: "Farmer", action: {
            // Navigate to Farmer screen
        }),
        LandingPageDataModel.RoleOption(title: "Buyer", action: {
            // Navigate to Buyer screen
        })
    ],
    signInText: "Already have an account? Sign in"
)
