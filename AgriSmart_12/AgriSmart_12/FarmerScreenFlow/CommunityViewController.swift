//
//  CommunityViewController.swift
//  home_page_apex
//
//  Created by Chetan Puri on 15/01/25.
//

import UIKit

class CommunityViewController: UIViewController {
    @IBOutlet var creatpostbutton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Farmer Community"
    }
    @IBSegueAction func goToCreatePost(_ coder: NSCoder) -> createpostViewController? {
        return createpostViewController(coder: coder)
    }
    
    @IBAction func createbuttontapped(_ sender: Any) {
       
        print("Button tapped!")

           let storyboard = UIStoryboard(name: "Farmer", bundle: nil)
           if let newVC = storyboard.instantiateViewController(withIdentifier: "createpost") as? createpostViewController {
               print("Successfully instantiated createpostViewController")
               navigationController?.pushViewController(newVC, animated: true)
           } else {
               print("Error: Could not instantiate createpostViewController")
           }

    }
    
    
}
