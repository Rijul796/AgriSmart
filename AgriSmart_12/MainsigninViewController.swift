//
//  MainsigninViewController.swift
//  AgriSmart_12
//
//  Created by Rohan Jain on 21/01/25.
//

import UIKit

class MainsigninViewController: UIViewController {
    
    @IBOutlet var googleimagetapped: UIImageView!
    @IBOutlet var appleimagetapped: UIImageView!
    @IBOutlet var facebookimagetapped: UIImageView!
    @IBOutlet var emailaddresbutton: UITextField!
    @IBOutlet var Passwordbutton: UITextField!
    @IBOutlet var loginbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add tap gestures to the image views
        addTapGesture(to: googleimagetapped, action: #selector(openGoogleSignIn))
        addTapGesture(to: appleimagetapped, action: #selector(openAppleSignIn))
        addTapGesture(to: facebookimagetapped, action: #selector(openFacebookSignIn))
    }
    
    // Add tap gesture recognizer to an image view
    private func addTapGesture(to imageView: UIImageView?, action: Selector) {
        guard let imageView = imageView else { return }
        imageView.isUserInteractionEnabled = true // Enable user interaction
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        imageView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Actions
    
    @objc private func openGoogleSignIn() {
        openURL("https://accounts.google.com/signin")
    }
    
    @objc private func openAppleSignIn() {
        openURL("https://appleid.apple.com/")
    }
    
    @objc private func openFacebookSignIn() {
        openURL("https://www.facebook.com/login/")
    }
    
    // Function to open URL in Safari
    private func openURL(_ urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("Invalid URL: \(urlString)")
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        // Get the entered email and password
        let enteredEmail = emailaddresbutton.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let enteredPassword = Passwordbutton.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        print("Entered Email: \(enteredEmail), Entered Password: \(enteredPassword)")
        
        // Validate email and password
        if validateCredentials(email: enteredEmail, password: enteredPassword) {
            print("Login successful. Navigating to the home screen.")
            navigateToHomeScreen() // Navigate to the consumer screen
        } else {
            print("Login failed. Showing alert.")
            showLoginFailedAlert()
        }
    }
    
    // Function to validate user credentials from UserDefaults
    private func validateCredentials(email: String, password: String) -> Bool {
        if let userData = UserDefaults.standard.dictionary(forKey: email) as? [String: String],
           userData["password"] == password {
            return true
        }
        return false
    }
    
    // Function to navigate to the home screen (consumer screen)
    private func navigateToHomeScreen() {
        let storyboard = UIStoryboard(name: "Consumer", bundle: nil)
        if let tabBarController = storyboard.instantiateViewController(withIdentifier: "consum") as? UITabBarController {
            let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
            sceneDelegate?.window?.rootViewController = tabBarController
            sceneDelegate?.window?.makeKeyAndVisible()
        }
    }
    
    // Function to show alert for login failure
    private func showLoginFailedAlert() {
        let alert = UIAlertController(title: "Login Failed",
                                      message: "Invalid email or password. Please try again.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
