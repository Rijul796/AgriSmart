//
//  SignUpPageDataModel.swift
//  AgriSmart_12
//
//  Created by student-2 on 19/12/24.
//


//struct SignUpPageDataModel {
//    let titleText: String
//    let subtitleText: String
//    let namePlaceholder: String
//    let emailPlaceholder: String
//    let passwordPlaceholder: String
//    let confirmPasswordPlaceholder: String
//    let firmOrFarmNamePlaceholder: String
//    let addressPlaceholder: String
//    let regionPlaceholder: String
//    let uploadSectionVisible: Bool // Determines if the upload section is visible (only for farmers)
//    let termsAndConditionsText: String
//    let signUpButtonText: String
//    let signInPromptText: String
//    let isFarmer: Bool // Indicates the user type
//}
//let farmerSignUpData = SignUpPageDataModel(
//    titleText: "Sign Up",
//    subtitleText: "Create an account here",
//    namePlaceholder: "Name",
//    emailPlaceholder: "Email Address",
//    passwordPlaceholder: "Create a password",
//    confirmPasswordPlaceholder: "Confirm password",
//    firmOrFarmNamePlaceholder: "Farm Name",
//    addressPlaceholder: "Farm Address",
//    regionPlaceholder: "Select your region/city",
//    uploadSectionVisible: true,
//    termsAndConditionsText: "I've read and agree with the Terms and Conditions and the Privacy Policy.",
//    signUpButtonText: "Sign Up",
//    signInPromptText: "Already a member? Sign in",
//    isFarmer: true
//)
//let consumerSignUpData = SignUpPageDataModel(
//    titleText: "Sign Up",
//    subtitleText: "Create an account here",
//    namePlaceholder: "Name",
//    emailPlaceholder: "Email Address",
//    passwordPlaceholder: "Create a password",
//    confirmPasswordPlaceholder: "Confirm password",
//    firmOrFarmNamePlaceholder: "Firm Name",
//    addressPlaceholder: "Firm Address",
//    regionPlaceholder: "Select your region/city",
//    uploadSectionVisible: false, // No image upload for consumers
//    termsAndConditionsText: "I've read and agree with the Terms and Conditions and the Privacy Policy.",
//    signUpButtonText: "Sign Up",
//    signInPromptText: "Already a member? Sign in",
//    isFarmer: false
//)
//
//
//@IBAction func signUpButtonTapped(_ sender: UIButton) {
//    let storyboard = UIStoryboard(name: "Farmer", bundle: nil) // Replace "Main" with the storyboard name
//    if let tabBarController = storyboard.instantiateViewController(withIdentifier: "farm") as? UITabBarController {
//        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
//        sceneDelegate?.window?.rootViewController = tabBarController
//        sceneDelegate?.window?.makeKeyAndVisible()
//    }
//}




//import UIKit
//
//class BuyerViewController: UIViewController {
//
//    // Outlets for the input fields
//    @IBOutlet weak var nameTextField: UITextField!
//    @IBOutlet weak var emailTextField: UITextField!
//    @IBOutlet weak var passwordTextField: UITextField!
//    @IBOutlet weak var confirmPasswordTextField: UITextField!
//    @IBOutlet weak var firmAddressTextField: UITextField!
//    @IBOutlet weak var firmNameTextField: UITextField!
//    @IBOutlet weak var regionCityTextField: UITextField!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    // Action for the sign-up button
//    @IBAction func signUpButtonTapped(_ sender: UIButton) {
//        guard let name = nameTextField.text, !name.isEmpty,
//              let email = emailTextField.text, !email.isEmpty,
//              let password = passwordTextField.text, !password.isEmpty,
//              let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty,
//              let firmAddress = firmAddressTextField.text, !firmAddress.isEmpty,
//              let firmName = firmNameTextField.text, !firmName.isEmpty,
//              let regionCity = regionCityTextField.text, !regionCity.isEmpty else {
//            showAlert(title: "Error", message: "Please fill out all fields.")
//            return
//        }
//
//        guard password == confirmPassword else {
//            showAlert(title: "Error", message: "Passwords do not match.")
//            return
//        }
//
//        // Save input data or pass it on to another controller
//        let userData = [
//            "name": name,
//            "email": email,
//            "password": password,
//            "firmAddress": firmAddress,
//            "firmName": firmName,
//            "regionCity": regionCity
//        ]
//
//        // Pass the data or handle as needed
//        print("User Data: \(userData)")
//        
//        // Navigate to the next screen (if applicable)
//        // Example: performSegue(withIdentifier: "toNextViewController", sender: self)
//    }
//
//    // Helper function to display an alert
//    private func showAlert(title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
//}
