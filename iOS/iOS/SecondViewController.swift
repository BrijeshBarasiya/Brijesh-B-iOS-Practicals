import UIKit

// MARK: Protocol
protocol UpdateText: AnyObject {
    func updatetext(updatedText: String)
}

class SecondViewController: UIViewController, Storyboarded {

    // MARK: IBOutlet
    @IBOutlet weak var secondViewControllerText: UITextField!
    
    // MARK: Variables
    var navCoordinator: NavigationControllerCoordinator?
        
    // MARK: override Method
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Second View Controller"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextViewController))
    }
    
    // MARK: objc Functions
    @objc func nextViewController() {
        navCoordinator?.openThirdViewController(text: secondViewControllerText.text ?? "Hello", delegate: self)
    }

    // MARK: deinit
    deinit{
        navCoordinator = nil
    }
    
}

// MARK: extension UpdateRawData
extension SecondViewController: UpdateText {
    
    func updatetext(updatedText: String) {
        secondViewControllerText.text = updatedText
    }
        
}
