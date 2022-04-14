import UIKit

class MvvmArchitecture: UIViewController, Storyboarded {

    // MARK: - Variable
    var userIndex = 0
    var navCoordinator: ArchitectureCoordinator?
    var mvvmViewModel = MvvmViewModel()
    
    // MARK: - IBOutlet
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    // MARK: - Overirde Function
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.layer.cornerRadius = userImage.frame.height * 0.50
        bindData()
    }

    // MARK: - IBAction
    @IBAction func onGetDataClicked(_ sender: UIButton) {
        userIndex += 1
        mvvmViewModel.getUserData(userIndex: userIndex)
    }
    
    // MARK: - Function
    private func bindData() {
        mvvmViewModel.userData.bind { data in
            if let userData = data?.data {
                let name = "\(userData.firstName) \(userData.lastName)"
                self.userName.text = name
                self.userEmail.text = userData.email
                if let image = URL(string: userData.avatar) {
                    let imageData = try? Data(contentsOf: image)
                    DispatchQueue.main.async { self.userImage.image = UIImage(data: imageData!)}
                }
            } else {
                self.userName.text = "Sorry!! Data Not Found"
                self.userImage.image = UIImage(named: "errorImage")
                self.userEmail.text = ""
            }
        }
    }
    
}
