import UIKit

class BaseViewController<T, U: BaseViewModel>: UIViewController, Storyboarded {

    // MARK: - Variable
    var coordinator: T?
    var viewModel: U = ViewModelFactory.getViewModel(modelClass: U.self) as! U
    
}
