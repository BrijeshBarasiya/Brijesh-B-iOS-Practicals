import UIKit

class UserProfileCellHeader: UIView {
    
    private let editButton = UIButton()
    private let headerText = UILabel()
    
    @IBInspectable public var labelText: String = "Button" {
        didSet {
            self.headerText.text = labelText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadHeaderView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadHeaderView()
    }
    
    private func loadHeaderView() {
        editButton.setImage(UIImage(named: "EditButton"), for: .normal)
        self.addSubview(editButton)
        headerText.textColor = UIColor.black
        headerText.font = R.font.poppinsMedium(size: 20)
        self.addSubview(headerText)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        headerText.translatesAutoresizingMaskIntoConstraints = false
        let editButtonTrailing = NSLayoutConstraint(item: editButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 0.92, constant: 0)
        let editButtonCenterVertical = NSLayoutConstraint(item: editButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        let headerTextLeading = NSLayoutConstraint(item: headerText, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 54)
        let headerTextVerticallyCenter = NSLayoutConstraint(item: headerText, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([headerTextVerticallyCenter, headerTextLeading, editButtonTrailing, editButtonCenterVertical])
    }
    
}
