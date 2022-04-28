import UIKit
class AuthenticationViewModel: BaseViewModel {
    
    // MARK: -  Variables
    var userData = Dynamic<RegisterSuccessful?>(nil)
    
    func isUserExist(email: String, password: String) {
        isLoading.value = true
        let perameter: [String: Any] = ["email": email, "password": password]
        RoomFinderWebServices.checkUser(perameterData: perameter, completion: {[weak self] responseData in
            self?.userData.value = responseData
            self?.isLoading.value = false
        }, error: {[weak self] error in
            self?.failureMessage.value = error
            self?.isLoading.value = false
        })
    }
       
}
