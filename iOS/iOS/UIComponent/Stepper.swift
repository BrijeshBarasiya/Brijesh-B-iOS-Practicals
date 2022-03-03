import UIKit

class Stepper: UIViewController {
   
    // MARK: Variables
    @IBOutlet weak var imageView: UIImageView!
    var size: CGFloat = 50
    
    // MARK: override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        imageView.center = view.center
    }
    
    // MARK: IBAction
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let value = sender.value
        imageView.frame = CGRect(x: 0, y: 0,
                                 width: size * CGFloat(value),
                                 height: size * CGFloat(value))
        imageView.center = view.center
    }
    
}
