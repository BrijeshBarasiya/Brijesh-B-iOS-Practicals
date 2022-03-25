import UIKit
class WebServicesCoordinator: Coordinator {
    
    // MARK: Variables
    var navController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    // MARK: Functions
    func start() {
        let vc = WebService.instantiate(from: .webServices)
        vc.navCoordinator = self
        navController.pushViewController(vc, animated: false)
    }
    
    func userList(method: UsingWhichMethod) {
        let vc = UserList.instantiate(from: .webServices)
        vc.navCoordinator = self
        vc.method = method
        navController.pushViewController(vc, animated: false)
    }
 
    func singleUser(userIndex: Int, method: UsingWhichMethod) {
        let vc = SingleUser.instantiate(from: .webServices)
        vc.userIndex = userIndex
        vc.method = method
        vc.navCoordinator = self
        navController.pushViewController(vc, animated: false)
    }
    
}
