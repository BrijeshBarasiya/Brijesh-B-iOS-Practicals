import UIKit

class SignUpScreen: UIViewController {
 
    // MARK: IBOutlet
    @IBOutlet weak var ageLabal: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var femaleRadioButton: UIView!
    @IBOutlet weak var maleRadioButton: UIView!
    @IBOutlet weak var femaleRadioImage: UIImageView!
    @IBOutlet weak var maleRadioImage: UIImageView!
    @IBOutlet weak var formProgressBar: UIProgressView!
    @IBOutlet weak var signingUpProgressBar: UIProgressView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var errorMessage: UILabel!
    
    // MARK: Variables
    var isPasswordProgressed: Bool = false
    var isEmailProgressed: Bool = false
    var isGenderProgressed: Bool = false
    var isImageProgressed: Bool = false
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        profileImage.layer.cornerRadius = (profileImage.frame.height / 2)
        let male = UITapGestureRecognizer(target: self, action: #selector(self.maleRadioButtonChecked))
        maleRadioButton.addGestureRecognizer(male)
        let female = UITapGestureRecognizer(target: self, action: #selector(self.femaleRadioButtonChecked))
        femaleRadioButton.addGestureRecognizer(female)
        let keyboardEvent = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(keyboardEvent)
        [emailTextField, passwordTextField].forEach { textField in
            textField?.delegate = self
        }
    }
    
    // MARK: objc Function
    @objc func maleRadioButtonChecked(sender:UITapGestureRecognizer) {
        maleRadioImage.image = UIImage(named: "CheckedRadioButton")
        femaleRadioImage.image = UIImage(named: "UnCheckedRadioButton")
        if(isGenderProgressed == false) {
            isGenderProgressed = setProgressBar(sender: genderView)
        }
    }
    
    @objc func femaleRadioButtonChecked(sender:UITapGestureRecognizer) {
        maleRadioImage.image = UIImage(named: "UnCheckedRadioButton")
        femaleRadioImage.image = UIImage(named: "CheckedRadioButton")
        if(isGenderProgressed == false) {
            isGenderProgressed = setProgressBar(sender: genderView)
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: IBActions
    @IBAction func getSliderValue(sender: UISlider) {
        let sliderValue: Int = Int(sender.value)
        ageLabal.text = "Age: \(sliderValue)"
    }

    @IBAction func emailOnExit(_ sender: UITextField) {
        isEmailProgressed = checkForEmpty(setBool: isEmailProgressed,
                                          sender: sender)
    }
    
    @IBAction func passwordOnExit(_ sender: UITextField) {
        isPasswordProgressed = checkForEmpty(setBool: isPasswordProgressed,
                                             sender: sender)
    }
    
    @IBAction func addImageClick(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if(formProgressBar.progress == 1) {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self]timer in
                self.signingUpProgressBar.progress = self.signingUpProgressBar.progress + 0.1
                if self.signingUpProgressBar.progress == 1.0 {
                    timer.invalidate()
                    self.errorMessage.text = "Thank You For SignUp"
                    self.errorMessage.textColor = UIColor.green
                }
            })
        } else {
            if(isEmailProgressed == false) {
                showEmptyError(sender: emailTextField)
            }
            if(isPasswordProgressed == false) {
                showEmptyError(sender: passwordTextField)
            }
            if(isGenderProgressed == false) {
                showEmptyError(sender: genderView)
            }
            if(isImageProgressed == false) {
                showEmptyError(sender: profileImage)
            }
            errorMessage.textColor = UIColor.red
            errorMessage.text = "Incomplete Information"
        }
    }
    
    // MARK: Other Function
        
    func showEmptyError(sender: AnyObject) {
        sender.layer.borderWidth = 2
        sender.layer.borderColor = UIColor.red.cgColor
    }
    
    func setProgressBar(sender: AnyObject) -> Bool {
        formProgressBar.progress += 0.2
        sender.layer.borderWidth = 0
        return true
    }

    func checkForEmpty(setBool: Bool, sender: AnyObject) -> Bool {
        var result = setBool
        if(setBool == false) {
            if(sender.text != "") {
                result = setProgressBar(sender: sender)
            }
        } else if(sender.text == "") {
                result = false
                formProgressBar.progress -= 0.2
        }
        return result
    }
    
}

// MARK: UINavigationControllerDelegate Extension
extension SignUpScreen: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profileImage.image = image
            addImageButton.setTitle("Edit Image", for: .normal)
            isImageProgressed = setProgressBar(sender: profileImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: UITextFieldDelegate
extension SignUpScreen: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
}
