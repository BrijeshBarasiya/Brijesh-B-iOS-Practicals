import UIKit

class CollectionView: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var enterCountryName: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var contintentIndex: UITextField!
    @IBOutlet weak var serachBarForCountry: UISearchBar!
    
    // MARK: Variables
    var rawData: [Continents] = DataClass.countryData

    
    // MARK: override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(pullIt), for: .valueChanged)
        tableView.rowHeight = view.frame.height * 0.08
        tableView.isHidden = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isHidden = true
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(pullIt), for: .valueChanged)
        serachBarForCountry.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? MapClass, let details = sender as? CountryData else { return }
        destinationVC.details = details
    }
    
    // MARK: objc Function
    @objc func pullIt() {
        self.tableView.reloadData()
        self.collectionView.reloadData()
        tableView.refreshControl?.endRefreshing()
        collectionView.refreshControl?.endRefreshing()
    }

    // MARK: IBActions
    @IBAction func onDeleteClicked(_ sender: UIButton) {
        let section = Int(sender.titleLabel?.text ?? "0") ?? 0
        rawData[section].countryNames.remove(at: sender.tag)
        DataClass.countryData = rawData
        pullIt()
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tableView.isHidden = false
            collectionView.isHidden = true
            break
        case 1:
            tableView.isHidden = true
            collectionView.isHidden = false
            break
        default:
            break
        }
    }
    
    @IBAction func addOnClicked(_ sender: UIButton) {
        let name = String(enterCountryName.text ?? "India")
        let index = Int(String(contintentIndex.text ?? "0")) ?? 0
        let newData = CountryData(countryName: name, countryFlag: "indiaFlag", latitude: 28.6139, longitude: 77.2090)
        rawData[index].countryNames.append(newData)
        DataClass.countryData = rawData
        enterCountryName.text = ""
        contintentIndex.text = ""
    }
    
}

// MARK: extension UITableViewDelegate
extension CollectionView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            rawData[indexPath.section].countryNames.remove(at: indexPath.row)
            DataClass.countryData = rawData
            tableView.deleteRows(at: [indexPath], with: .fade)
            pullIt()
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = UIColor.red
            header.textLabel?.font = UIFont(name: "Futura", size: 22)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = rawData[indexPath.section].countryNames[indexPath.row]
        performSegue(withIdentifier: "pinInMap", sender: details)
    }
    
}

// MARK: extension UITableViewDataSource
extension CollectionView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.height * 0.04
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return rawData[section].continent
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return rawData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rawData[section].countryNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "refreshCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let data = rawData[indexPath.section].countryNames[indexPath.row]
        cell.configureCellValue(name: data.countryName, imageName: data.countryFlag)
        return cell
    }
    
}

// MARK: extension UICollectionViewDelegateFlowLayout
extension CollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.width * 0.28
        return CGSize(width: size, height: size * 1.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}

// MARK: extension UICollectionViewDataSource
extension CollectionView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "collectionViewHeader", for: indexPath) as? CollectionViewHeaderCell else {
            return UICollectionReusableView()
        }
        header.configureCellValue(name: rawData[indexPath.section].continent, tag: indexPath.section)
        return header
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return rawData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rawData[section].countryNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        let data = rawData[indexPath.section].countryNames[indexPath.row]
        cell.configureCellValue(name: data.countryName, row: indexPath.row, section: indexPath.section, imageName: data.countryFlag)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let details = rawData[indexPath.section].countryNames[indexPath.row]
        performSegue(withIdentifier: "pinInMap", sender: details)
    }
    
}

// MARK: UISearchBarDelegate
extension CollectionView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        rawData = DataClass.countryData
        var indexToDelete: [Int] = []
        if searchText != "" {
            for index in 0..<rawData.count {
                rawData[index].countryNames = rawData[index].countryNames.filter{($0.countryName.uppercased().contains(searchText.uppercased()))}
                if rawData[index].countryNames.isEmpty {
                    indexToDelete.append(index)
                }
            }
            for index in stride(from: indexToDelete.count, to: 0, by: -1) {
                rawData.remove(at: indexToDelete[index - 1])
            }
            pullIt()
        } else {
            pullIt()
        }
    }
    
}
