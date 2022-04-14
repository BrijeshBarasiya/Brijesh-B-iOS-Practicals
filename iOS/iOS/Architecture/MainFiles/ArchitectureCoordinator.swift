import UIKit
class ArchitectureCoordinator: Coordinator {
    
    // MARK: - Variables
    var navController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    // MARK: - Functions
    func start() {
        let vc = Architecture.instantiate(from: .architecture)
        vc.navCoordinator = self
        navController.pushViewController(vc, animated: false)
    }
    
    // MARK: - openMVC Functions
    func openMVC() {
        let mvc = MVCController.instantiate(from: .mvcArchitecture)
        mvc.navCoordinator = self
        navController.pushViewController(mvc, animated: false)
    }
    
    // MARK: - openMVP Functions
    func openMVP() {
        let mvp = MVPArchitecture.instantiate(from: .mvpArchitecture)
        mvp.navCoordinator = self
        navController.pushViewController(mvp, animated: false)
    }
    
    // MARK: - openMVP Functions
    func openLogin() {
        let mvvmLogin = MvvmLogin.instantiate(from: .mvvmArchitecture)
        mvvmLogin.navCoordinator = self
        navController.pushViewController(mvvmLogin, animated: false)
    }
    
    // MARK: - openMVP Functions
    func openMVVM() {
        let mvvm = MvvmArchitecture.instantiate(from: .mvvmArchitecture)
        mvvm.navCoordinator = self
        navController.pushViewController(mvvm, animated: false)
    }
    
    // MARK: - openVIPER Functions
    func openVIPER() {
        let viperDemo = Router(navController)
        viperDemo.start()
    }
    
}
