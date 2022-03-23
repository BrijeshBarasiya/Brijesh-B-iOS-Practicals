import UIKit
class TableViewCell: UITableViewCell {

    // MARK: IBOutlet of TableViewCell
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    // MARK: override Methodes of TableViewCell
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Functions of TableViewCell
    func configureCellValue(name: String, imageName: String){
        self.countryName.text = name.uppercased()
        self.countryFlag.image = UIImage(named: imageName)
    }
    
}
