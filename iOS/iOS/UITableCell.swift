import UIKit
class TableCell: UITableViewCell {

    // MARK: IBOutlet
    @IBOutlet var countryName: UILabel!
    @IBOutlet var countryFlag: UIImageView!
    
    // MARK: override Methodes
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Functions
    func configureCellValue(name: String, imageName: String){
        countryName.text = name
        countryFlag.image = UIImage(named: imageName)
    }
    
}
