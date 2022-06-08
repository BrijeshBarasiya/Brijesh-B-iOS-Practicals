import UIKit

class SpalshScreen: UIViewController, Storyboarded {

    // MARK: - Variables
    var coordinator: NavigationCoordinator?
    
    // MARK: - Override Methods
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBACtion
    @IBAction func onBtnGetStared(_ sender: UIButton) {
        coordinator?.openOnboardScreen()
    }
}
