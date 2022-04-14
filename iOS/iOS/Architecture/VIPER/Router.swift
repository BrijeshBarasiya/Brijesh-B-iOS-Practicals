import UIKit

// MARK: - IViperRouter Protocol
protocol IViperRouter {
    
    var navController: UINavigationController {get set}
    func start()
    
}

// MARK: - Router Class
class Router: IViperRouter {

    // MARK: - Variables
    var navController: UINavigationController
    
    // MARK: - Init Function
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    // MARK: - Protocol Stubs Function
    func start() {
        let vc = VIPERDemo.instantiate(from: .viperDemo)
        vc.navCoordinator = self
        navController.pushViewController(vc, animated: false)
    }
   
}
