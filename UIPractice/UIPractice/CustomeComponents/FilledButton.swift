import UIKit

class FilledButton: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        self.layer.cornerRadius = self.frame.height * 0.18
        self.backgroundColor = UIColor.primaryColor
        self.tintColor = UIColor.white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
}
