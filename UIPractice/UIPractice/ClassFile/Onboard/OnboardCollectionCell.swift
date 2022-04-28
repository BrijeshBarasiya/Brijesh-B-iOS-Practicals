import UIKit

class OnboardCollectionCell: UICollectionViewCell {
    
    // MARK: IBOutlet of CollectionViewCell
    @IBOutlet weak var onboardImage: UIImageView!
    @IBOutlet weak var onboardTitle: UILabel!
    @IBOutlet weak var onboardDescription: UILabel!
    
    // MARK: Functions of CollectionViewCell
    func configureCellValue(imageName: String, title: String, decription: String){
        self.onboardImage.image = UIImage(named: imageName)
        self.onboardTitle.text = title
        self.onboardDescription.text = decription
    }
    
}
