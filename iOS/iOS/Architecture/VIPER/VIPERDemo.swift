import UIKit

// MARK: - IViperView Protocol
protocol IViperView: AnyObject {
    
    var viperPresentor: IViperPresenter {get set}
    func onSuccess(resultData: ViperUsersData)
    func onFailure(error: String)
    
}

// MARK: - VIPERDemo Class
class VIPERDemo: UIViewController, Storyboarded {
    
    // MARK: - Protocol Stubs Variables
    var viperPresentor: IViperPresenter = ViperPresenter()
    
    // MARK: - Variables
    var navCoordinator: Router?
    var usersData: ViperUsersData?
    
    // MARK: - IBoutlet
    @IBOutlet weak var usersNameList: UITableView!
    
    // MARK: - Override Function
    override func viewDidLoad() {
        super.viewDidLoad()
        viperPresentor.view = self
        usersNameList.dataSource = self
        viperPresentor.getUserData()
    }
    
}

// MARK: - extension UITableViewDataSource
extension VIPERDemo: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersData?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usersNameList.dequeueReusableCell(withIdentifier: "userNameCell", for: indexPath)
        let name = "\((usersData?.data[indexPath.row].firstName ?? "")) \(usersData?.data[indexPath.row].lastName ?? "")"
        cell.textLabel?.text = name
        return cell
    }
    
}

// MARK: - extension IView
extension VIPERDemo: IViperView {
    
    func onSuccess(resultData: ViperUsersData) {
        usersData = resultData
        usersNameList.reloadData()
    }
    
    func onFailure(error: String) {
        print("Error: \(error)")
    }
    
}
