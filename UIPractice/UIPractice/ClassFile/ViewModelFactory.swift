import UIKit

class ViewModelFactory {
    
    static func getViewModel<T> (modelClass: T) -> AnyObject {
        switch (modelClass) {
        case is AuthenticationViewModel: return AuthenticationViewModel()
        default:
            return AuthenticationViewModel()
        }
    }
    
}
