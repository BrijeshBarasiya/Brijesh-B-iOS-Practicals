import UIKit

class UserProfile: UIViewController, Storyboarded {

    // MARK: - IBOutlet
    @IBOutlet weak var tbvUserInformations: UITableView!
    
    // MARK: - Variable
    var coordinator: NavigationCoordinator?
    
    // MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        var image = UIImage(named: "back")
        let backItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(onBackButtonClicked))
        navigationItem.leftBarButtonItem = backItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        image = UIImage(named: "threeDot")
        let dotButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(onBackButtonClicked))
        navigationItem.rightBarButtonItem = dotButton
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        navigationItem.title = "Profile"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: R.font.poppinsMedium(size: 20) ?? UIFont.systemFont(ofSize: 25)]
        tbvUserInformations.rowHeight = 36
    }
    
    // MARK: - Obeject Function
    @objc func onBackButtonClicked() {
        navigationController?.popViewController(animated: true)
    }

}

// MARK: - extension UITableViewDataSource
extension UserProfile: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return userProfileValues.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userProfileValues[section].userInformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tbvUserInformations.dequeueReusableCell(withIdentifier: "userInformation", for: indexPath) as? UserProfileCell else {
            return UITableViewCell()
        }
        let data = userProfileValues[indexPath.section].userInformations[indexPath.row]
        cell.configureCellValue(headerText: data.header, infoText: data.info)
        return cell
    }
    
}

// MARK: - extension UITableViewDelegate
extension UserProfile: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UserProfileCellHeader()
        view.labelText = userProfileValues[section].headerName
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if(userProfileValues.count-1 > section) {
            let view = UIView()
            let line = UIImageView()
            line.image = UIImage(named: "line")
            view.addSubview(line)
            line.translatesAutoresizingMaskIntoConstraints = false
            let lineLeading = NSLayoutConstraint(item: line, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 54)
            let linetrailing = NSLayoutConstraint(item: line, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 0.90, constant: 0)
            let lineBottom = NSLayoutConstraint(item: line, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
            let lineHeight = NSLayoutConstraint(item: line, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 2)
            NSLayoutConstraint.activate([lineLeading, lineBottom, lineHeight, linetrailing])
            return view
        }
        return UIView()
    }
    
}
