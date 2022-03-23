import UIKit

class ThirdViewController: UIViewController, Storyboarded {

    // MARK: IBOutlet
    @IBOutlet weak var thirdViewControllerText: UITextField!
    
    // MARK: Variables
    var navCoordinator: NavigationControllerCoordinator?
    weak var delegate: UpdateText?
    var text: String?
    
    // MARK: override Function
    override func viewWillAppear(_ animated: Bool) {
        print("ViewController: viewWillAppear")
        navigationItem.title = "Third View Controller"
        thirdViewControllerText.text = text
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewController: viewDidAppear")
    }
    
    override func viewWillLayoutSubviews() {
        print("ViewController: viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        print("ViewController: viewDidLayoutSubviews")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.updatetext(updatedText: thirdViewControllerText.text ?? "Hello")
        print("ViewController: viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewController: viewDidDisappear")
    }
    
    override func viewDidLoad() {
        print("ViewController: viewDidLoad")
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close App", style: .plain, target: self, action: #selector(closeApp))
    }
    
    // MARK: objc Functions
    @objc func closeApp() {
        let refreshAlert = UIAlertController(title: "Close App", message: "Are Sure To Close?", preferredStyle: UIAlertController.Style.alert)
        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak self] (action: UIAlertAction!) in
            self?.navCoordinator?.closeApplication()
        }))
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        present(refreshAlert, animated: true, completion: nil)
    }
    
    // MARK: deinit
    deinit{
        navCoordinator = nil
    }
    
}
