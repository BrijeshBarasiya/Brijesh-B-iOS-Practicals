import UIKit

class ViewController: UIViewController {

    // MARK: Variables
    var navCoordinator: NavigationControllerCoordinator?
    
    // MARK: override methods
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Practical List"
    }
    
    // MARK: IBAction
    @IBAction func onNavigationButtonClicked(_ sender: UIButton) {
        navCoordinator?.openNavigationViewController()
    }
    
    @IBAction func onWebServicesClicked(_ sender: UIButton) {
        navCoordinator?.openWebServiceCoordinator()
    }
    
}
