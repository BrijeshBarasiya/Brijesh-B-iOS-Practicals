import UIKit
class AuthenticationViewModel: BaseViewModel {
    
    // MARK: -  Variables
    var userData = Dynamic<RegisterSuccessful?>(nil)
    var userDataCore = Dynamic<UsersData?>(nil)
    
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
    
    func isUserExistCore(email: String, password: String) {
        isLoading.value = true
        CoreHelper.shared.getUserData(username: email, completion: {[weak self] data in
            (data.password == password) ? (self?.userDataCore.value = data) : (self?.failureMessage.value = "Password Not Matched")
            self?.isLoading.value = false
        }, error: {[weak self] error in
            self?.failureMessage.value = error
            self?.isLoading.value = false
        })
    }
    
    func updateUserInfo(username: String, email: String, password: String) {
        isLoading.value = true
        CoreHelper.shared.updateUserData(username: "brijeshbarasiya", email: "brijeshbarasiya", password: "456", completion: {[weak self] isCompleted in
            print(isCompleted)
            self?.isLoading.value = false
        }, error: {[weak self] error in
            self?.failureMessage.value = error
            self?.isLoading.value = false
        })
    }
       
}
