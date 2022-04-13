import UIKit

// MARK: - IPresenter Protocol
protocol IPresenter {
    var view: IView? { get set }
    func getUserData(userIndex: Int)
}

// MARK: - MVPPresentor Class
class MVPPresentor: IPresenter {
    
    // MARK: - Protocol Stubs Variable
    var view: IView?
    
    // MARK: - Protocol Stubs Function
    func getUserData(userIndex: Int) {
        if let url = URL(string: "https://reqres.in/api/users/\(userIndex)") {
            let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let datatask = session.dataTask(with: request) {data, response, error in
                guard let responseCode = (response as? HTTPURLResponse)?.statusCode else {
                    return
                }
                if (responseCode == 200 ) {
                    do {
                        if let data = data {
                            let fetchData = try JSONDecoder().decode(MVPData.self, from: data)
                            self.view?.onSuccess(userData: (fetchData.data as MVPUserData))
                        }
                    } catch {
                        self.view?.onFailure(error: "Error: Not Able to Fetch Data")
                    }
                } else {
                    self.view?.onFailure(error: "Sorry!! Data Not Found.")
                }
            }
            datatask.resume()
        }
    }
    
}
