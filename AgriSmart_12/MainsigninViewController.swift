
import UIKit

class MainsigninViewController: UIViewController {
    
    @IBOutlet var googleimagetapped: UIImageView!
    @IBOutlet var appleimagetapped: UIImageView!
    @IBOutlet var facebookimagetapped: UIImageView!
   
    @IBOutlet var emailaddresbutton: UITextField!
    @IBOutlet var Passwordbutton: UITextField!  
    @IBOutlet var loginbutton: UIButton!
    
    
       private let predefinedEmail = "chetanpurio89@gmail.com"
       private let predefinedPassword = "12345678"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Add tap gestures to the image views
                      addTapGesture(to: googleimagetapped, action: #selector(openGoogleSignIn))
                      addTapGesture(to: appleimagetapped, action: #selector(openAppleSignIn))
                      addTapGesture(to: facebookimagetapped, action: #selector(openFacebookSignIn))
        // Do any additional setup after loading the view.
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
                       let enteredEmail = emailaddresbutton.text ?? ""
                       let enteredPassword = Passwordbutton.text ?? ""
                       
                       print("Entered Email: \(enteredEmail), Entered Password: \(enteredPassword)")
                       
                       // Validate email and password
                       if enteredEmail == predefinedEmail && enteredPassword == predefinedPassword {
                           print("Login successful. Attempting to perform segue.")
                           performSegue(withIdentifier: "homeSc", sender: self)
                       } else {
                           print("Login failed. Showing alert.")
                           showLoginFailedAlert()
                       }
               }
               
               // Display alert for login failure
               private func showLoginFailedAlert() {
                   let alert = UIAlertController(title: "Login Failed",
                                                 message: "Invalid email or password. Please try again.",
                                                 preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                   present(alert, animated: true, completion: nil)
               }



}
