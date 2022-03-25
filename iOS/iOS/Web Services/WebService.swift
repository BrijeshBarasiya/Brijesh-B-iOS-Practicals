import UIKit

class WebService: UIViewController, Storyboarded {

    // MARK: Variables
    var navCoordinator: WebServicesCoordinator?
    
    // MARK: override method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBAction
    @IBAction func onURLSessionClicked(_ sender: UIButton) {
        navCoordinator?.userList(method: .urlSession)
    }
    
    @IBAction func onAlamofireClicked(_ sender: UIButton) {
        navCoordinator?.userList(method: .alamofire)
    }
    
}
