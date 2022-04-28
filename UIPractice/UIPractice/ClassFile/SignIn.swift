import UIKit
class SignIn: UIViewController, Storyboarded {

    // MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtUsername: InputField!
    @IBOutlet weak var txtPassword: PasswordField!
    @IBOutlet weak var btnForgotPassword: UIButton!
    
    // MARK: - Variable
    var coordinator: NavigationCoordinator?
    
    // MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.integrateWithKeyboard()
        let keyboardEvent = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(keyboardEvent)
        [txtUsername, txtPassword].forEach { textField in
            textField?.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Object Function
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    // MARK: - IBAction
    @IBAction func onSignInButtonClicked(_ sender: FilledButton) {
        coordinator?.openProfileScreen()
    }
    
    @IBAction func onSignupButtonClicked(_ sender: UIButton) {
        coordinator?.openSignUpScreen()
    }
    
}

// MARK: - UITextFieldDelegate
extension SignIn: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtUsername:
            txtUsername.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        case txtPassword:
            txtPassword.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
}
