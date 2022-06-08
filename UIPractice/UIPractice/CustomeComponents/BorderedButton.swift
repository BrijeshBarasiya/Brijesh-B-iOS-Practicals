import UIKit

class BorderedButton: UIButton {
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.primaryColor.cgColor
        self.layer.cornerRadius = self.frame.height * 0.18
        self.tintColor = UIColor.black
        self.configuration?.imagePadding = 10
        self.backgroundColor = UIColor.white
        self.titleLabel?.font = R.font.poppinsMedium(size: 29)
    }
    
    override func titleColor(for state: UIControl.State) -> UIColor? {
        return UIColor.black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
}
