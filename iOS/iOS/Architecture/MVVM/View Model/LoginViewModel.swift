import UIKit

// MARK: - Enum Class getEnum
enum getEnum {
    case loginSuccess, invalidLogin, emptyPassword, emptyUsername
}

// MARK: - LoginViewModel Class
class LoginViewModel {
    
    // MARK: - Variables
    var userData = LoginModel(username: "admin", password: "admin")
    var userResult = Dynamic<getEnum>(.invalidLogin)
    
    // MARK: - Function
    func checkAuthentication(username: String, password: String) {
        if(isValidUsername(username: username)) {
            if (isValidPassword(password: password)) {
                (userData.username == username && userData.password == password) ? (userResult.value = .loginSuccess) : (userResult.value = .invalidLogin)
            } else {
                userResult.value =  .emptyPassword
            }
        } else {
            userResult.value = .emptyUsername
        }
    }
    
    private func isValidUsername(username: String) -> Bool {
        return (username.isEmpty) ? false : true
    }
    
    private func isValidPassword(password: String) -> Bool {
        return (password.isEmpty) ? false : true
    }
    
}
