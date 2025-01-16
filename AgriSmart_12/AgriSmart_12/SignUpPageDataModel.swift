//
//  SignUpPageDataModel.swift
//  AgriSmart_12
//
//  Created by student-2 on 19/12/24.
//


struct SignUpPageDataModel {
    let titleText: String
    let subtitleText: String
    let namePlaceholder: String
    let emailPlaceholder: String
    let passwordPlaceholder: String
    let confirmPasswordPlaceholder: String
    let firmOrFarmNamePlaceholder: String
    let addressPlaceholder: String
    let regionPlaceholder: String
    let uploadSectionVisible: Bool // Determines if the upload section is visible (only for farmers)
    let termsAndConditionsText: String
    let signUpButtonText: String
    let signInPromptText: String
    let isFarmer: Bool // Indicates the user type
}
let farmerSignUpData = SignUpPageDataModel(
    titleText: "Sign Up",
    subtitleText: "Create an account here",
    namePlaceholder: "Name",
    emailPlaceholder: "Email Address",
    passwordPlaceholder: "Create a password",
    confirmPasswordPlaceholder: "Confirm password",
    firmOrFarmNamePlaceholder: "Farm Name",
    addressPlaceholder: "Farm Address",
    regionPlaceholder: "Select your region/city",
    uploadSectionVisible: true,
    termsAndConditionsText: "I've read and agree with the Terms and Conditions and the Privacy Policy.",
    signUpButtonText: "Sign Up",
    signInPromptText: "Already a member? Sign in",
    isFarmer: true
)
let consumerSignUpData = SignUpPageDataModel(
    titleText: "Sign Up",
    subtitleText: "Create an account here",
    namePlaceholder: "Name",
    emailPlaceholder: "Email Address",
    passwordPlaceholder: "Create a password",
    confirmPasswordPlaceholder: "Confirm password",
    firmOrFarmNamePlaceholder: "Firm Name",
    addressPlaceholder: "Firm Address",
    regionPlaceholder: "Select your region/city",
    uploadSectionVisible: false, // No image upload for consumers
    termsAndConditionsText: "I've read and agree with the Terms and Conditions and the Privacy Policy.",
    signUpButtonText: "Sign Up",
    signInPromptText: "Already a member? Sign in",
    isFarmer: false
)
