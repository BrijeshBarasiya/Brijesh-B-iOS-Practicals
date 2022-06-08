import UIKit

class NavigationCoordinator: Coordinator {
    
    var navController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        let spalshScreen = SpalshScreen.instantiate(from: .onboard)
        spalshScreen.coordinator = self
        navController.pushViewController(spalshScreen, animated: true)
    }
    
    func openOnboardScreen() {
        let onboardScreen = OnboardScreen.instantiate(from: .onboard)
        onboardScreen.coordinator = self
        navController.popViewController(animated: false)
        navController.pushViewController(onboardScreen, animated: true)
    }
    
    func openSignInScreen() {
        let signInScreen = SignIn.instantiate(from: .authentication)
        signInScreen.coordinator = self
        navController.popViewController(animated: false)
        navController.pushViewController(signInScreen, animated: true)
    }
    
    func openSignUpScreen() {
        let signUpScreen = SignUp.instantiate(from: .authentication)
        signUpScreen.coordinator = self
        navController.pushViewController(signUpScreen, animated: true)
    }
    
    func openProfileScreen() {
        let profileScreen = UserProfile.instantiate(from: .profile)
        profileScreen.coordinator = self
        navController.pushViewController(profileScreen, animated: true)
    }

}
