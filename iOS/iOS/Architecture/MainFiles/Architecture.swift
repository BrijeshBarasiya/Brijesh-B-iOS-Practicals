import UIKit

class Architecture: UIViewController, Storyboarded {

    // MARK: - Variables
    var navCoordinator: ArchitectureCoordinator?
    
    // MARK: - Override Function
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func onMVCClicked(_ sender: UIButton) {
        navCoordinator?.openMVC()
    }
    @IBAction func onMVPClicked(_ sender: UIButton) {
        navCoordinator?.openMVP()
    }
    @IBAction func onMVVMClicked(_ sender: UIButton) {
    }
    
}
