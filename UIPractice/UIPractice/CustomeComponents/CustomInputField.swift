import UIKit

class CustomInputField: UITextField {
    
    let textPadding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        designTextField()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        designTextField()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    private func designTextField() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.primaryColor.cgColor
        self.layer.cornerRadius = self.frame.height * 0.18
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        self.font = R.font.poppinsRegular(size: 12)
    }
    
}
