import UIKit

class NavigationController: UIViewController, Storyboarded {

    var navCoordinator: NavigationControllerCoordinator?
    
    // MARK: override Function
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.title = "Navigation Controller"
        navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextBarButton))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navCoordinator?.openSecondViewController()
    }
    
    // MARK: objc Functions
    @objc func nextBarButton() {
        navigationController?.popViewController(animated: false)
    }
    
}
