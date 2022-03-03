import UIKit
class CollectionViewCell: UICollectionViewCell {

    // MARK: IBOutlet
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var countryName: UILabel!
    
    // MARK: override Methodes
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Functions
    func configureCellValue(name: String, tag: Int){
        self.countryName.text = name
        self.deleteButton.tag = tag
    }
    
}

class TableViewCell: UITableViewCell {

    // MARK: IBOutlet
    @IBOutlet weak var countryName: UILabel!
    
    // MARK: override Methodes
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Functions
    func configureCellValue(name: String){
        self.countryName.text = name
    }
    
}
