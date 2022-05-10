import UIKit

class MvvmViewModel {
    
    // MARK: -  Variables
    var userData = Dynamic<MvvmData?>(nil)
    
    // MARK: - Function
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
                            let fetchData = try JSONDecoder().decode(MvvmData.self, from: data)
                            self.updateData(updatedData: fetchData)
                        }
                    } catch {
                        self.updateData(updatedData: nil)
                    }
                } else {
                    self.updateData(updatedData: nil)
                }
            }
            datatask.resume()
        }
    }
    
    private func updateData(updatedData: MvvmData?) {
        userData.value = updatedData
    }
    
}
