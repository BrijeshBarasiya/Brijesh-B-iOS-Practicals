import UIKit

class UserListTableCell: UITableViewCell {

    // MARK: variables
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    // MARK: Override Function
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Functions of TableViewCell
    func configureCellValue(name: String, email: String, imageName: URL){
        self.userName.text = name
        self.userEmail.text = email
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: imageName)
            DispatchQueue.main.async { self.userImage.image = UIImage(data: imageData!)}
        }
    }

}
