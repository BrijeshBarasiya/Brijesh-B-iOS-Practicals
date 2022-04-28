import UIKit

class ProfilePicture: UIView {

    private let profilePicture = UIImageView()
    private let userName = UILabel()
    
    @IBInspectable public var name: String = "Button" {
        didSet {
            self.userName.text = name
        }
    }
    
    @IBInspectable public var profileImage: UIImage = UIImage() {
        didSet {
            self.profilePicture.image = profileImage
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.addSubview(profilePicture)
        self.addSubview(userName)
        loadImageView()
        loadUserName()
    }
    
    private func loadImageView() {
        profilePicture.layer.cornerRadius = 80
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        let profileX = NSLayoutConstraint(item: profilePicture, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let profileY = NSLayoutConstraint(item: profilePicture, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 18)
        let profileWidth = NSLayoutConstraint(item: profilePicture, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 160)
        let profileHeight = NSLayoutConstraint(item: profilePicture, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([profileX, profileY, profileWidth, profileHeight])
    }
    
    private func loadUserName() {
        userName.font = R.font.poppinsMedium(size: 20)
        userName.translatesAutoresizingMaskIntoConstraints = false
        let labelX = NSLayoutConstraint(item: profilePicture, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let labelY = NSLayoutConstraint(item: profilePicture, attribute: .top, relatedBy: .equal, toItem: profilePicture, attribute: .bottom, multiplier: 1, constant: 5)
        NSLayoutConstraint.activate([labelX, labelY])
    }
    
}
