//
//  consumerSignupViewController.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 18/01/25.
//

import UIKit

class consumerSignupViewController: UIViewController {

    // Outlets for the input fields
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var firmAddressTextField: UITextField!
    @IBOutlet weak var firmNameTextField: UITextField!
    @IBOutlet weak var regionCityTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Action for the sign-up button
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
//        guard let name = nameTextField.text, !name.isEmpty,
//              let email = emailTextField.text, !email.isEmpty,
//              let password = passwordTextField.text, !password.isEmpty,
//              let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty,
//              let firmAddress = firmAddressTextField.text, !firmAddress.isEmpty,
//              let firmName = firmNameTextField.text, !firmName.isEmpty,
//              let regionCity = regionCityTextField.text, !regionCity.isEmpty else {
//            showAlert(title: "Error", message: "Please fill out all fields.")
            
                let storyboard = UIStoryboard(name: "Consumer", bundle: nil) // Replace "Main" with the storyboard name
                if let tabBarController = storyboard.instantiateViewController(withIdentifier: "consum") as? UITabBarController {
                    let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
                    sceneDelegate?.window?.rootViewController = tabBarController
                    sceneDelegate?.window?.makeKeyAndVisible()
                }
            return
        }

//        guard password == confirmPassword else {
//            showAlert(title: "Error", message: "Passwords do not match.")
//            return
//        }

        // Save input data or pass it on to another controller
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
}
//@IBAction func signUpButtonTapped(_ sender: UIButton) {
//    let storyboard = UIStoryboard(name: "Farmer", bundle: nil) // Replace "Main" with the storyboard name
//    if let tabBarController = storyboard.instantiateViewController(withIdentifier: "farm") as? UITabBarController {
//        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
//        sceneDelegate?.window?.rootViewController = tabBarController
//        sceneDelegate?.window?.makeKeyAndVisible()
//    }
//}
