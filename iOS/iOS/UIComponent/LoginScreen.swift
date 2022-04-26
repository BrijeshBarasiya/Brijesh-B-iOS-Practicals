import UIKit

class LoginScreen: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let keyboardEvent = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(keyboardEvent)
        [username, password].forEach { textField in
            textField?.delegate = self
        }
    }
    
}

// MARK: UITextFieldDelegate
extension LoginScreen: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case username:
            username.resignFirstResponder()
            password.becomeFirstResponder()
        case password:
            password.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
}
