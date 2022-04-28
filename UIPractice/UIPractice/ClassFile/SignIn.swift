import UIKit
class SignIn: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtUsername: CustomInputField!
    @IBOutlet weak var txtPassword: CustomPasswordField!
    @IBOutlet weak var btnForgotPassword: UIButton!
    
    // MARK: - Override Function
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.integrateWithKeyboard()
        let keyboardEvent = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(keyboardEvent)
        [txtUsername, txtPassword].forEach { textField in
            textField?.delegate = self
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

// MARK: UITextFieldDelegate
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
