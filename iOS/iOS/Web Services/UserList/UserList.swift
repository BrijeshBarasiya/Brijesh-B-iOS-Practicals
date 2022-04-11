import UIKit

class UserList: UIViewController, Storyboarded {
    
    // MARK: Variables
    var userResultArray = [UserData]()
    var navCoordinator: WebServicesCoordinator?
    var method: UsingWhichMethod?
    
    // MARK: IBIOutlet
    @IBOutlet weak var userListTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Users"
        userListTableView.dataSource = self
        userListTableView.delegate = self
        userListTableView.rowHeight = view.frame.height * 0.17
        activityIndicator.startAnimating()
        switch method {
        case .alamofire:
            AlamofireWebServices.getUsersDetails(pathComponent: 3, completion: {data in
                self.userResultArray = data
                self.userListTableView.reloadData()
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            })
            break
        case .urlSession:
            getDataUsingURLSesion()
            break
        case .none:
            break
        }
    }
    
    // MARK: Functions
    func getDataUsingURLSesion() {
        guard let url = URL(string: "https://reqres.in/api/users?delay=0") else {
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
                    let fetchData = try JSONDecoder().decode(UserListData.self, from: data)
                    self.userResultArray = fetchData.data
                    DispatchQueue.main.async {[weak self] in
                        self?.userListTableView.reloadData()
                        self?.activityIndicator.stopAnimating()
                        self?.activityIndicator.isHidden = true
                    }
                }
                catch {
                    print("Error: Trying to convert JSON data to string")
                }
            } else {
                print("Error: User Data Not Found.")
            }
        }
        datatask.resume()
    }
    
}

// MARK: extension UITableViewDataSource
extension UserList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userResultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userListCell", for: indexPath) as? UserListTableCell else {
            return UITableViewCell()
        }
        let element = userResultArray[indexPath.row]
        if let urlImage = URL(string: element.avatar) {
            let name = "\(element.firstName)  \(element.lastName)"
            cell.tag = element.id
            cell.configureCellValue(name: name, email: element.email, imageName: urlImage)
        }
        return cell
    }
    
}

// MARK: extension
extension UserList: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentIndex = tableView.cellForRow(at: indexPath)! as UITableViewCell
        navCoordinator?.singleUser(userIndex: currentIndex.tag, method: method ?? .alamofire)
    }
    
}
