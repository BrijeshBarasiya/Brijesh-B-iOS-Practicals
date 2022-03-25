import UIKit
import Alamofire

class SingleUser: UIViewController, Storyboarded {

    // MARK: Variables
    var navCoordinator: WebServicesCoordinator?
    var method: UsingWhichMethod?
    var userIndex: Int = 1
    
    // MARK: IBOutlet
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    // MARK: override Function
    override func viewDidLoad() {
        super.viewDidLoad()
        switch method {
        case .alamofire:
            AlamofireWebServices.getUserDetail(pathComponent: userIndex, name: userName, email: userEmail, image: userImage)
            break
        case .urlSession:
            getUserdata()
            break
        case .none:
            break
        }
    }
    
    // MARK: IBActions
    @IBAction func onCreateUserClicked(_ sender: UIButton) {
        switch method {
        case .alamofire:
            let data  = ["name": "Harry", "job": "Mobile"]
            AlamofireWebServices.createUser(perameterData: data, completion: { [weak self] in
                self?.showAlertBox(message: "Response Code: 200 User Created")
            })
            break
        case .urlSession:
            urlSessionCalling(user: User(name: "Harry", job: "Android"), method: "POST", className: PostResponseData.self)
            break
        case .none:
            break
        }
    }
    
    @IBAction func onUpdateClicked(_ sender: UIButton) {
        switch method {
        case .alamofire:
            let data  = ["name": "Harry", "job": "Mobile"]
            AlamofireWebServices.updateUser(pathComponent: 2, perameterData: data, completion: {
                self.showAlertBox(message: "Response Code: 201 User Updated")
            })
            break
        case .urlSession:
            urlSessionCalling(user: User(name: "Harry", job: "Android"), method: "PUT", pathComponents: "2", className: UpdateUserData.self)
            break
        case .none:
            break
        }
    }
    
    @IBAction func onDeleteClick(_ sender: UIButton) {
        switch method {
        case .alamofire:
            let data  = ["name": "Harry", "job": "Mobile"]
            AlamofireWebServices.deleteUser(pathComponent: 2, perameterData: data, completion: {
                self.showAlertBox(message: "Response Code: 204 User Deleted")
            })
            break
        case .urlSession:
            urlSessionCalling(user: User(name: "Harry", job: "Android"), method: "DELETE", pathComponents: "2", className: DeleteUserData.self)
            break
        case .none:
            break
        }
    }
    
    // MARK: Functions
    private func showAlertBox(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func getUserdata() {
        guard let url = URL(string: "https://reqres.in/api/users/\(userIndex)") else {
            print("Error: Cannot create URL")
            return
        }
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let datatask = session.dataTask(with: request) {data, response, error in
            guard let responseCode = (response as? HTTPURLResponse)?.statusCode else {
                return
            }
            if (responseCode == 200 ) {
                do {
                    guard let data = data else {
                        return
                    }
                    let fetchData = try JSONDecoder().decode(SingleUserData.self, from: data)
                    DispatchQueue.main.async {[weak self] in
                        let name = "\(fetchData.data.firstName) \(fetchData.data.lastName)"
                        self?.userName.text = name
                        self?.userEmail.text = fetchData.data.email
                        if let image = URL(string: fetchData.data.avatar) {
                            let imageData = try? Data(contentsOf: image)
                            DispatchQueue.main.async { self?.userImage.image = UIImage(data: imageData!)}
                        }
                    }
                }
                catch {
                    print("Error: Not Able to Fetch Data")
                }
            } else {
                print("Error: User Data Not Found.")
            }
        }
        datatask.resume()
    }
    
    func urlSessionCalling<T: Decodable>(user: User, method: String, pathComponents: String = "", className: T.Type) {
        if let url = URL(string: "https://reqres.in/api/users/\(pathComponents)") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method
            urlRequest.httpBody = try? JSONEncoder().encode(user)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let responseCode = (response as? HTTPURLResponse)?.statusCode {
                    DispatchQueue.main.async {
                        switch responseCode {
                        case 200:
                            self.showAlertBox(message: "Response Code: 200 User Created")
                            break
                        case 201:
                            self.showAlertBox(message: "Response Code: 201 User Updated")
                            break
                        case 204:
                            self.showAlertBox(message: "Response Code: 204 User Deleted")
                            break
                        default:
                            self.showAlertBox(message: "Wrong Response Code")
                            break
                        }
                    }
                }
            }
            dataTask.resume()
        }
    }
    
}

