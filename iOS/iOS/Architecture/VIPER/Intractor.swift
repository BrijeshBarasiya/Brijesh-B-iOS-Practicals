import UIKit
import Alamofire

// MARK: - IPresenter Protocol
protocol IViperIntractor {
    var presenter: IViperPresenter? { get set }
    func getUserData()
}

// MARK: - MVPPresentor Class
class ViperIntractor: IViperIntractor {
    
    // MARK: - Protocol Stubs Variable
    var presenter: IViperPresenter?
    
    // MARK: - Protocol Stubs Function
    func getUserData() {
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else {
            return
        }
        AF.request(url, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { response in
            switch response.result {
            case .success(let data):
                if(response.response?.statusCode == 200) {
                    if let responseData = data {
                        do {
                            guard let jsonData = try JSONDecoder().decode(ViperUsersData?.self, from: responseData) else { return }
                            self.presenter?.onSuccess(resultData: jsonData)
                        } catch (let errorMessage) {
                            self.presenter?.onFailure(error: "Not Able to Convert JSON Data \(errorMessage).")
                        }
                    } else {
                        self.presenter?.onFailure(error: "No Data Found.")
                    }
                } else {
                    self.presenter?.onFailure(error: "\(response.response?.statusCode ?? 0) Data Not Found.")
                }
                break
            case .failure(let errorMessage):
                self.presenter?.onFailure(error: "Request Failure \(errorMessage).")
            }
        }
    }
    
}
