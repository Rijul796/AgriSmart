//
//  consumerSignupViewController.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 18/01/25.
//
import UIKit

class consumerSignupViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var firmAddressTextField: UITextField!
    @IBOutlet weak var firmNameTextField: UITextField!
    @IBOutlet weak var regionCityTextField: UITextField!
    
    // Temporary storage for user data
    var userDatabase: [[String: String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        // Validate input fields
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !name.isEmpty,
              let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty,
              let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !password.isEmpty,
              let confirmPassword = confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !confirmPassword.isEmpty,
              let firmAddress = firmAddressTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !firmAddress.isEmpty,
              let firmName = firmNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !firmName.isEmpty,
              let regionCity = regionCityTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !regionCity.isEmpty else {
            showAlert(title: "Error", message: "Please fill in all fields.")
            return
        }
        
        // Check if passwords match
        if password != confirmPassword {
            showAlert(title: "Error", message: "Passwords do not match.")
            return
        }
        
        // Validate email format
        if !isValidEmail(email) {
            showAlert(title: "Error", message: "Please enter a valid email address.")
            return
        }
        
        // Check for existing user
        if UserDefaults.standard.dictionary(forKey: email) != nil {
            showAlert(title: "Error", message: "An account with this email already exists.")
            return
        }
        
        // Save user data to UserDefaults
        let userData: [String: String] = [
            "name": name,
            "email": email,
            "password": password,
            "firmAddress": firmAddress,
            "firmName": firmName,
            "regionCity": regionCity
        ]
        UserDefaults.standard.set(userData, forKey: email)
        UserDefaults.standard.set(userData, forKey: name)
        UserDefaults.standard.set(email, forKey: "userName")


        
        // Save the email to UserDefaults for easier retrieval during login
        UserDefaults.standard.set(email, forKey: "userEmail")
        
        // Display success alert and navigate to the home screen
        showAlert(title: "Success", message: "Signup successful!") { [weak self] in
            guard self != nil else { return }
            let storyboard = UIStoryboard(name: "Consumer", bundle: nil)
            if let tabBarController = storyboard.instantiateViewController(withIdentifier: "consum") as? UITabBarController {
                let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
                sceneDelegate?.window?.rootViewController = tabBarController
                sceneDelegate?.window?.makeKeyAndVisible()
            }
        }
    }
    
    // MARK: - Helper Methods
    
    // Function to show alerts
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        })
        present(alert, animated: true, completion: nil)
    }
    
    // Function to validate email format
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailPredicate.evaluate(with: email)
    }
}
