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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signUpButtonTapped(_ sender: UIButton) {
            
                let storyboard = UIStoryboard(name: "Consumer", bundle: nil)
                if let tabBarController = storyboard.instantiateViewController(withIdentifier: "consum") as? UITabBarController {
                    let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
                    sceneDelegate?.window?.rootViewController = tabBarController
                    sceneDelegate?.window?.makeKeyAndVisible()
                }
            return
        }
 
}
