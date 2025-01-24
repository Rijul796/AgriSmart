import UIKit

class consumerSignupViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
//    @IBOutlet weak var firmAddressTextField: UITextField!
//    @IBOutlet weak var firmNameTextField: UITextField!
//    @IBOutlet weak var regionCityTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.backgroundColor = UIColor.white
        setupProfileImageView()
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !name.isEmpty,
              let emailText = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !emailText.isEmpty,
              let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !password.isEmpty,
              let confirmPassword = confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !confirmPassword.isEmpty else {
            showAlert(title: "Error", message: "Please fill in all required fields.")
            return
        }

        if !isValidEmail(emailText) {
            showAlert(title: "Error", message: "Invalid email address.")
            return
        }

        if password != confirmPassword {
            showAlert(title: "Error", message: "Passwords do not match.")
            return
        }

        if isEmailRegistered(emailText) {
            showAlert(title: "Error", message: "Email is already registered.")
            return
        }

        // Save user details in UserDefaults
        saveUserDetails(name: name, email: emailText, password: password, image: profileImageView.image)
        
        // Show success message and navigate
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

    private func setupProfileImageView() {
        profileImageView.layer.masksToBounds = true
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectProfileImage)))
    }
    
    @objc private func selectProfileImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }

    private func saveUserDetails(name: String, email: String, password: String, image: UIImage?) {
        let userDict = createUserDetailsDict(name: name, email: email, password: password, image: image)
        UserDefaults.standard.set([userDict], forKey: "users")
        UserDefaults.standard.synchronize()
    }

    private func createUserDetailsDict(name: String, email: String, password: String, image: UIImage?) -> [String: Data] {
        var userDict: [String: Data] = [
            "name": Data(name.utf8),
            "email": Data(email.utf8),
            "password": Data(password.utf8)
        ]
        if let image = image, let imageData = image.jpegData(compressionQuality: 0.8) {
            userDict["image"] = imageData
        }
        return userDict
    }

    private func isEmailRegistered(_ email: String) -> Bool {
        if let users = UserDefaults.standard.array(forKey: "users") as? [[String: Data]] {
            return users.contains { $0["email"] == Data(email.utf8) }
        }
        return false
    }

    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        })
        present(alert, animated: true, completion: nil)
    }

    private func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
}

extension consumerSignupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            profileImageView.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            profileImageView.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
}
