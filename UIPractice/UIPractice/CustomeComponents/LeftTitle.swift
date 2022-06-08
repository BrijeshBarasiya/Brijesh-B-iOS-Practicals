import UIKit

class LeftTitle: CustomTitle {
    
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
        let horizontalConstraint = NSLayoutConstraint(item: strip, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: strip, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: strip, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 115)
        let heightConstraint = NSLayoutConstraint(item: strip, attribute: .height, relatedBy: .equal, toItem: label, attribute: .height, multiplier: 0.5, constant: 0)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    private func loadLabel() {
        label.font = R.font.poppinsBold(size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        let labelLeading = NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: strip, attribute: .leading, multiplier: 1, constant: 19)
        let labelTop = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: strip, attribute: .top, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([labelTop, labelLeading])
    }
    
}
