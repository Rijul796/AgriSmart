//
//  ViewController.swift
//  AgriSmart_12
//
//  Created by student-2 on 02/12/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func navigateToOtherStoryboard(_ sender: UIButton) {
        // Instantiate the storyboard by its name
        let storyboard = UIStoryboard(name: "FarmerSignUp", bundle: nil)
        
        // Instantiate the view controller by its identifier
        let targetViewController = storyboard.instantiateViewController(withIdentifier: "farmer")
        
        // Present the target view controller
        self.present(targetViewController, animated: true, completion: nil)
    }
    @IBAction func consumerButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Consumer", bundle: nil)
        
        // Instantiate the view controller by its identifier
        let targetViewController = storyboard.instantiateViewController(withIdentifier: "buyer")
        
        // Present the target view controller
        self.present(targetViewController, animated: true, completion: nil)
    }
}

//@IBAction func signUpButtonTapped(_ sender: UIButton) {
//    let storyboard = UIStoryboard(name: "Farmer", bundle: nil) // Replace "Main" with the storyboard name
//    if let tabBarController = storyboard.instantiateViewController(withIdentifier: "farm") as? UITabBarController {
//        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
//        sceneDelegate?.window?.rootViewController = tabBarController
//        sceneDelegate?.window?.makeKeyAndVisible()
//    }
//}

