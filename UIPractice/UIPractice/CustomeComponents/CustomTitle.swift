import UIKit

class CustomTitle: UIView {
    
    let strip = UIView()
    let label = UILabel()
    
    @IBInspectable public var labelText: String = "Button" {
        didSet {
            label.text = labelText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    private func setUp() {
        self.addSubview(strip)
        self.addSubview(label)
    }
    
}
