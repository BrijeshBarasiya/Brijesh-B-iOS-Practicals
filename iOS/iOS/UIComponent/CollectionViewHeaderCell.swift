import UIKit
class CollectionViewHeaderCell: UICollectionReusableView {
    
    // MARK: IBOutlet of CollectionViewHeaderCell
    @IBOutlet weak var headerText: UILabel!
    
    // MARK: override Methodes of CollectionViewHeaderCell
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Functions of TableViewCell
    func configureCellValue(name: String, tag: Int) {
        self.headerText.text = name
    }
    
}
