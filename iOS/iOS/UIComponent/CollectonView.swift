import UIKit

class CollectionView: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var enterCountryName: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var serachBarForCountry: UISearchBar!
    
    // MARK: Variables
    var refreshData = DataClass.countryNames
    var rawData: [String] = []
    
    // MARK: override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        rawData = refreshData
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
    
    @objc func pullIt() {
        self.tableView.reloadData()
        self.collectionView.reloadData()
        tableView.refreshControl?.endRefreshing()
        collectionView.refreshControl?.endRefreshing()
    }
        
    // MARK: IBActions
    @IBAction func onDeleteClicked(_ sender: UIButton) {
        refreshData.remove(at: sender.tag)
        rawData = refreshData
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
        refreshData.append(enterCountryName.text ?? "nil")
        rawData = refreshData
        enterCountryName.text = ""
    }
    
}

// MARK: extension UITableViewDelegate
extension CollectionView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            refreshData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            rawData = refreshData
            pullIt()
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
}

// MARK: extension UITableViewDataSource
extension CollectionView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refreshData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "refreshCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .systemTeal
        } else {
            cell.backgroundColor = .white
        }
        cell.configureCellValue(name: refreshData[indexPath.row])
        return cell
    }
    
}

// MARK: extension UICollectionViewDelegateFlowLayout
extension CollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.width * 0.28
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}

// MARK: extension UICollectionViewDataSource
extension CollectionView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return refreshData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCellValue(name: refreshData[indexPath.row], tag: indexPath.row)
        return cell
    }
    
}

// MARK: UISearchBarDelegate
extension CollectionView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        refreshData = rawData
        print("refreshdata \(refreshData)")
        if searchText != "" {
            refreshData = refreshData.filter{($0.contains(searchText))}
            pullIt()
        } else {
            pullIt()
        }
    }
    
}
