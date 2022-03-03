import UIKit

class TableViewClass: ViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var countryNames: UITableView!
    

    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        countryNames.delegate = self
        countryNames.dataSource = self
        countryNames.rowHeight = view.frame.height * 0.1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? MapClass, let details = sender as? CountryData else { return }
        destinationVC.details = details
    }
    
}

// MARK: extension UITableViewDelegate
extension TableViewClass: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = UIColor.red
            header.textLabel?.font = UIFont(name: "Futura", size: 22)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = DataClass.countryData[indexPath.section].countryNames[indexPath.row]
        performSegue(withIdentifier: "pinInMap", sender: details)
    }

}

// MARK: extension UITableViewDataSource
extension TableViewClass: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.height * 0.04
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return DataClass.countryData[section].continent
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DataClass.countryData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataClass.countryData[section].countryNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
                countryNames.dequeueReusableCell(withIdentifier: "singleCell", for: indexPath) as? TableCell else {
            return UITableViewCell()
        }
        let data = DataClass.countryData[indexPath.section].countryNames[indexPath.row]
        cell.configureCellValue(
            name: data.countryName,
            imageName: data.countryFlag
        )
        return cell
    }
    
}
