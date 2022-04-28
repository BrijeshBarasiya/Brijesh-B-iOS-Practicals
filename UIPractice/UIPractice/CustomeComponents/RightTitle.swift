import UIKit

class RightTitle: CustomTitle {
    
    var clickEvent: (() -> ())? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    private func setUp() {
        loadStrip()
        loadLabel()
        label.isUserInteractionEnabled = true
        let clickEvent = UITapGestureRecognizer(target: self, action: #selector(onLabelClicked))
        label.addGestureRecognizer(clickEvent)
    }
    
    @objc func onLabelClicked() {
        clickEvent?()
    }
    
    private func loadStrip() {
        strip.backgroundColor = UIColor.systemYellow
        strip.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: strip, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 0.95, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: strip, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: strip, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        let heightConstraint = NSLayoutConstraint(item: strip, attribute: .height, relatedBy: .equal, toItem: label, attribute: .height, multiplier: 0.5, constant: 0)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    private func loadLabel() {
        label.font = R.font.poppinsRegular(size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        let labelLeading = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: strip, attribute: .centerX, multiplier: 1, constant: 0)
        let labelTop = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: strip, attribute: .top, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([labelTop, labelLeading])
    }
    
}
