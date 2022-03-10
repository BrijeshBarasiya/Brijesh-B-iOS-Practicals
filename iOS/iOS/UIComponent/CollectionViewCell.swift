import UIKit
class CollectionViewCell: UICollectionViewCell {

    // MARK: IBOutlet of CollectionViewCell
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var countryName: UILabel!
    
    // MARK: override Methodes of CollectionViewCell
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Functions of CollectionViewCell
    func configureCellValue(name: String, row: Int, section: Int, imageName: String){
        self.countryName.text = name.uppercased()
        self.countryFlag.image = UIImage(named: imageName)
        self.deleteButton.tag = row
        self.deleteButton.titleLabel?.text = String(section)
    }
    
}
