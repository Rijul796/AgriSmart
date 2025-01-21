//
//  SignInPageDataModel.swift
//  AgriSmart_12
//
//  Created by student-2 on 19/12/24.
//


struct SignInPageDataModel {
    let titleText: String
    let subtitleText: String
    let logoImageURL: String
    let emailPlaceholder: String
    let passwordPlaceholder: String
    let forgotPasswordText: String
    let loginButtonText: String
    let signUpPromptText: String
    let socialLoginOptions: [SocialLoginOption]

    struct SocialLoginOption {
        let iconImageURL: String
        let action: () -> Void // Closure for handling social login action
    }
}
let signInPageData = SignInPageDataModel(
    titleText: "Sign In",
    subtitleText: "Welcome back",
    logoImageURL: "handshake_logo.png", // Replace with your asset name
    emailPlaceholder: "Email Address",
    passwordPlaceholder: "Password",
    forgotPasswordText: "Forgot Password?",
    loginButtonText: "Login",
    signUpPromptText: "New member? Sign up",
    socialLoginOptions: [
        SignInPageDataModel.SocialLoginOption(iconImageURL: "google_icon.png", action: {
            // Handle Google login
        }),
        SignInPageDataModel.SocialLoginOption(iconImageURL: "apple_icon.png", action: {
            // Handle Apple login
        }),
        SignInPageDataModel.SocialLoginOption(iconImageURL: "facebook_icon.png", action: {
            // Handle Facebook login
        })
    ]
)
