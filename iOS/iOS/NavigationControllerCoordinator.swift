import UIKit

class NavigationControllerCoordinator: Coordinator {
    
    var navController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "autoLayoutStoryBoard") as? ViewController {
            firstVC.navCoordinator = self
            navController.pushViewController(firstVC, animated: true)
        }
    }
    
    func openNavigationViewController() {
        let vc = NavigationController.instantiate(from: .uiNavigaiton)
        vc.navCoordinator = self
        navController.pushViewController(vc, animated: false)
    }

    func openSecondViewController() {
        let vc = SecondViewController.instantiate(from: .uiNavigaiton)
        vc.navCoordinator = self
        navController.pushViewController(vc, animated: false)
    }
    
    func openThirdViewController(text: String, delegate: UpdateText) {
        let vc = ThirdViewController.instantiate(from: .uiNavigaiton)
        vc.delegate = delegate
        vc.text = text
        vc.navCoordinator = self
        navController.pushViewController(vc, animated: false)
    }
    
    func closeApplication() {
        navController.popToRootViewController(animated: false)
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
    }
    
    func openWebServiceCoordinator() {
        let webService = WebServicesCoordinator(navController)
        webService.start()
    }
    
    func openArchitectureCoordinator() {
        let architecture = ArchitectureCoordinator(navController)
        architecture.start()
    }
    
}
