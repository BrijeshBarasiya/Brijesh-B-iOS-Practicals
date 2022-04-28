import UIKit
class SignIn: BaseViewController<NavigationCoordinator, AuthenticationViewModel> {

    // MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtUsername: InputField!
    @IBOutlet weak var txtPassword: PasswordField!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.integrateWithKeyboard()
        view.integrateTapGesture()
        [txtUsername, txtPassword].forEach { textField in
            textField?.delegate = self
        }
        activityIndicator.isHidden = true
        bindData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Function
    func bindData() {
        viewModel.userData.bind {[weak self]data in
            self?.coordinator?.openProfileScreen()
        }
        viewModel.failureMessage.bind{error in
            print(error ?? "Sorry123")
        }
        viewModel.isLoading.bind{[weak self]visibility in
            self?.activityIndicator.isHidden = !visibility
            visibility ? self?.activityIndicator.startAnimating() : self?.activityIndicator.stopAnimating()
        }
    }

    // MARK: - IBAction
    @IBAction func onSignInButtonClicked(_ sender: FilledButton) {
        viewModel.isUserExist(email: txtUsername.text ?? "email", password: txtPassword.text ?? "password")
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
