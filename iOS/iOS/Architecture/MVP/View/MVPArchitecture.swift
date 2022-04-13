import UIKit

// MARK: - IView Protocol
protocol IView: AnyObject {
    var mvpPresentor: IPresenter {get set}
    func onSuccess(userData: MVPUserData)
    func onFailure(error: String)
}

// MARK: - MVPArchitecture Class
class MVPArchitecture: UIViewController, Storyboarded {

    // MARK: - Protocol Stubs Variables
    var mvpPresentor: IPresenter = MVPPresentor()
    
    // MARK: - Variables
    var navCoordinator: ArchitectureCoordinator?
    var userIndex = 0
    
    // MARK: - IBOutlet
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    // MARK: - Override Fuction
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.layer.cornerRadius = userImage.frame.height / 2
        mvpPresentor.view = self
    }

    // MARK: - IBAction
    @IBAction func onGetDataClicked(_ sender: UIButton) {
        userIndex += 1
        mvpPresentor.getUserData(userIndex: userIndex)
    }
    
}

// MARK: - extension IView
extension MVPArchitecture: IView {
    
    // MARK: - Protocol Stubs Function
    func onSuccess(userData: MVPUserData) {
        let name = "\(userData.firstName) \(userData.lastName)"
        userName.text = name
        userEmail.text = userData.email
        if let image = URL(string: userData.avatar) {
            let imageData = try? Data(contentsOf: image)
            DispatchQueue.main.async { self.userImage.image = UIImage(data: imageData!)}
        }
    }
    
    func onFailure(error: String) {
        userName.text = error
        userImage.image = UIImage(named: "errorImage")
        userEmail.text = ""
    }
    
}
