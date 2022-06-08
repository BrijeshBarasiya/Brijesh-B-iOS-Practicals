import UIKit
class SignUp: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtUsername: CustomInputField!
    @IBOutlet weak var txtEmail: CustomInputField!
    @IBOutlet weak var txtPassword: CustomPasswordField!
    @IBOutlet weak var txtConfirmPassword: CustomPasswordField!
    
    // MARK: - Override Function
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.integrateWithKeyboard()
        let keyboardEvent = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(keyboardEvent)
        [txtUsername, txtEmail, txtPassword, txtConfirmPassword].forEach { textField in
            textField?.delegate = self
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
