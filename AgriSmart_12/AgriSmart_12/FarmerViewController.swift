//
//  FarmerViewController.swift
//  AgriSmart_12
//
//  Created by student-2 on 10/12/24.
//

import UIKit

class FarmerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Farmer", bundle: nil) // Replace "Main" with the storyboard name
        if let tabBarController = storyboard.instantiateViewController(withIdentifier: "farm") as? UITabBarController {
            let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
            sceneDelegate?.window?.rootViewController = tabBarController
            sceneDelegate?.window?.makeKeyAndVisible()
        }
    }
    
    
    @IBAction func signupbtnTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Farmer", bundle: nil)
        storyboard.instantiateViewController(withIdentifier: "homeSc") as! HomeScreenViewController
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
