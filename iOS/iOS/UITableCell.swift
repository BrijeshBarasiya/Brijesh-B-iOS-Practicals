import UIKit
class TableCell: UITableViewCell {

    @IBOutlet var countryName: UILabel!
    @IBOutlet var countryFlag: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCellValue(name: String, imageName: String){
        countryName.text = name
        countryFlag.image = UIImage(named: imageName)
    }
    
}
