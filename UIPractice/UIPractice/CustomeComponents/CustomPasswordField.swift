import UIKit

class CustomPasswordField: CustomInputField {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addPasswordButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addPasswordButton()
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var eyRect = super.rightViewRect(forBounds: bounds)
        eyRect.origin.x -= 20
        return eyRect
    }
    
    private func addPasswordButton() {
        self.isSecureTextEntry = true
        let eyeButton = UIButton()
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        eyeButton.addTarget(self, action: #selector(onEyeButtonClicked), for: .touchUpInside)
        eyeButton.isSelected = true
        eyeButton.frame = CGRect(x: 0, y: 0, width: 15, height: 12)
        eyeButton.tintColor = UIColor.black
        self.rightView = eyeButton
        self.rightViewMode = .always
    }
    
    @objc func onEyeButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.isSecureTextEntry = sender.isSelected
    }
    
}
