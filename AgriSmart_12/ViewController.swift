//
//  ViewController.swift
//  AgriSmart_12
//
//  Created by student-2 on 02/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var IntroText: UILabel!
    @IBOutlet weak var farmerButton: UIButton!
    @IBOutlet weak var buyerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonTintColors()
        IntroText.text = "Fresh, farm to table produce, no middlemen Just pure, straight from the source"
 
        IntroText.textColor = UIColor(red: 32/255.0, green: 41/255.0, blue: 7/255.0, alpha: 1)
        IntroText.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        IntroText.textAlignment = .center
        IntroText.numberOfLines = 0 // Allow multiple lines
        
        func setButtonTintColors() {
            buyerButton.tintColor = UIColor(hex: "#3F2B29")
 
            farmerButton.tintColor = UIColor(red: 32/255.0, green: 41/255.0, blue: 7/255.0, alpha: 1)
        }
    }
    @IBAction func navigateToOtherStoryboard(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "FarmerSignUp", bundle: nil)
        if let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController {
            if let targetViewController = navigationController.viewControllers.first {
                targetViewController.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(targetViewController, animated: true)
            }
        } else {
            let targetViewController = storyboard.instantiateViewController(withIdentifier: "farmer")
            targetViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(targetViewController, animated: true)
        }
    }
 
    @IBAction func consumerButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Consumer", bundle: nil)
        let targetViewController = storyboard.instantiateViewController(withIdentifier: "buyer")
        targetViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(targetViewController, animated: true)
    }
    
}
extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
