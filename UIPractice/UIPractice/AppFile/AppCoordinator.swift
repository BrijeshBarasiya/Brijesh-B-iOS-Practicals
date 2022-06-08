import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    
    var navController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        let navVC = navController
        let firstScreen = NavigationCoordinator(navVC)
        firstScreen.start()
    }
    
}
