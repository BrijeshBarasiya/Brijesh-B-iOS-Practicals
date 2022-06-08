import UIKit

class LeftTitle: UIView {
    
    private let strip = UIView()
    private let label = UILabel()
    
    @IBInspectable public var labelText: String = "Button" {
        didSet {
            self.label.text = labelText
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
        loadStrip()
        loadLabel()
    }
    
    private func loadStrip() {
        strip.backgroundColor = UIColor.systemYellow
        
        strip.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: strip, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        
        let verticalConstraint = NSLayoutConstraint(item: strip, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: strip, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 115)
        
        let heightConstraint = NSLayoutConstraint(item: strip, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: label, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.5, constant: 0)
        
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    private func loadLabel() {
        label.font = R.font.poppinsBold(size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        let labelLeading = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: strip, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 19)
        
        let labelTop = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: strip, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([labelTop, labelLeading])
    }
    
}
