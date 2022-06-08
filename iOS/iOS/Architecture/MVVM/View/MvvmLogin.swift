import UIKit

class MvvmLogin: UIViewController, Storyboarded {

    // MARK: - variables
    weak var navCoordinator: ArchitectureCoordinator?
    var loginViewModel = LoginViewModel()
    
    // MARK: - IBOutlet
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    // MARK: - Override Function
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        let keyboardEvent = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(keyboardEvent)
        [username, password].forEach { textField in
            textField?.delegate = self
        }
    }
    
    // MARK: - IBAction
    @IBAction func onLoginClicked(_ sender: UIButton) {
        loginViewModel.checkAuthentication(username: String(username.text ?? ""), password: String(password.text ?? ""))
    }
    
    // MARK: - Function
    private func bindData() {
        loginViewModel.userResult.bind { [weak self] result in
            switch(result) {
            case .invalidLogin:
                print("Invalid Login")
            case .loginSuccess:
                self?.navCoordinator?.openMVVM()
            case .emptyUsername:
                print("Username is Empty")
            case .emptyPassword:
                print("Password is Empty")
            }
        }
    }
    
}

// MARK: UITextFieldDelegate
extension MvvmLogin: UITextFieldDelegate {
    
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
