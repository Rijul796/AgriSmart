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
    
    private func addTapGesture(to imageView: UIImageView?, action: Selector) {
        guard let imageView = imageView else { return }
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func openGoogleSignIn() {
        openURL("https://accounts.google.com/signin")
    }
    
    @objc private func openAppleSignIn() {
        openURL("https://appleid.apple.com/")
    }
    
    @objc private func openFacebookSignIn() {
        openURL("https://www.facebook.com/login/")
    }
    
    private func openURL(_ urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("Invalid URL: \(urlString)")
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        let enteredEmail = emailaddresbutton.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let enteredPassword = Passwordbutton.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        if validateCredentials(email: enteredEmail, password: enteredPassword) {
            navigateToHomeScreen()
        } else {
            showLoginFailedAlert()
        }
    }
    
    private func validateCredentials(email: String, password: String) -> Bool {
        if let users = UserDefaults.standard.array(forKey: "users") as? [[String: Data]] {
            return users.contains { $0["email"] == Data(email.utf8) &&
                                    $0["password"] == Data(password.utf8) }
        }
        return false
    }

    private func navigateToHomeScreen() {
        let storyboard = UIStoryboard(name: "Consumer", bundle: nil)
        if let tabBarController = storyboard.instantiateViewController(withIdentifier: "consum") as? UITabBarController {
            let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
            sceneDelegate?.window?.rootViewController = tabBarController
            sceneDelegate?.window?.makeKeyAndVisible()
        }
    }
    
    private func showLoginFailedAlert() {
        let alert = UIAlertController(title: "Login Failed",
                                      message: "Invalid email or password. Please try again.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
