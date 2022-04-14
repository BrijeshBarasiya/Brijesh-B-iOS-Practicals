import UIKit

// MARK: - IPresenter Protocol
protocol IViperPresenter {
    
    var view: IViperView? { get set }
    var intractor: IViperIntractor { get set }
    func getUserData()
    func onSuccess(resultData: ViperUsersData)
    func onFailure(error: String)
    
}

// MARK: - MVPPresentor Class
class ViperPresenter: IViperPresenter {
    
    // MARK: - Protocol Stubs Variable
    var view: IViperView?
    var intractor: IViperIntractor = ViperIntractor()
    
    // MARK: - Init
    init() {
        intractor.presenter = self
    }
    
    // MARK: - Protocol Stubs Function
    func getUserData() {
        intractor.getUserData()
    }
    
    func onSuccess(resultData: ViperUsersData) {
        self.view?.onSuccess(resultData: resultData)
    }
    
    func onFailure(error: String) {
        self.view?.onFailure(error: error)
    }
    
}
