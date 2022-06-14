import UIKit
class SignIn: BaseViewController<NavigationCoordinator, AuthenticationViewModel> {

    // MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtUsername: InputField!
    @IBOutlet weak var txtPassword: PasswordField!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnSignIn: FilledButton!
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
            print(error ?? "Error")
        }
        viewModel.isLoading.bind{[weak self] visibility in
            self?.activityIndicator.isHidden = !visibility
            self?.btnSignIn.isUserInteractionEnabled = !visibility
            visibility ? self?.activityIndicator.startAnimating() : self?.activityIndicator.stopAnimating()
        }
        viewModel.userDataCore.bind{[weak self] data in         
            self?.coordinator?.openProfileScreen()
        }
    }

    // MARK: - IBAction
    @IBAction func onSignInButtonClicked(_ sender: FilledButton) {
        guard let email = txtUsername.text else { return }
        guard let password = txtPassword.text else { return }
        //viewModel.isUserExist(email: email, password: password)
        viewModel.isUserExistCore(email: email, password: password)
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
