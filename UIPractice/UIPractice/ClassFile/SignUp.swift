import UIKit
class SignUp: UIViewController, Storyboarded {

    // MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtUsername: InputField!
    @IBOutlet weak var txtEmail: InputField!
    @IBOutlet weak var txtPassword: PasswordField!
    @IBOutlet weak var txtConfirmPassword: PasswordField!
    
    // MARK: - Variable
    var coordinator: NavigationCoordinator?
    
    // MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.integrateWithKeyboard()
        let keyboardEvent = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(keyboardEvent)
        [txtUsername, txtEmail, txtPassword, txtConfirmPassword].forEach { textField in
            textField?.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Obejct Function
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    // MARK: - IBAction
    @IBAction func onSigninButtonClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func OnSignUpClicked(_ sender: UIButton) {
        coordinator?.openLocalNotification()
    }
}

// MARK: UITextFieldDelegate
extension SignUp: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtUsername:
            txtUsername.resignFirstResponder()
            txtEmail.becomeFirstResponder()
        case txtEmail:
            txtEmail.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        case txtPassword:
            txtPassword.resignFirstResponder()
            txtConfirmPassword.becomeFirstResponder()
        case txtConfirmPassword:
            txtConfirmPassword.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
}
