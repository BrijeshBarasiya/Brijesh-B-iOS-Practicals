import UIKit

class UserProfileCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    
    // MARK: - Function
    func configureCellValue(headerText: String, infoText: String){
        self.lblHeader.text = headerText
        self.lblInfo.text = infoText
    }
    

}
