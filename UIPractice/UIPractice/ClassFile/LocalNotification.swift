import UIKit
import UserNotifications

class LocalNotification: UIViewController, Storyboarded {
    
    //MARK: - Outlets
    @IBOutlet weak var lblNotificationResponse: UILabel!
    @IBOutlet weak var btnLocalNotification: UIButton!
    
    var notification =  NotifiationCreator(title: "Hello!!", message: "I am Notification", subTitle: "")
    
    //MARK: - Variables
    let userNotificationCenter = UNUserNotificationCenter.current()
    var coordinator: NavigationCoordinator?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func OnButtonClicked(_ sender: UIButton) {
        notification.addAction(actions: [
            NotifiationCreator.createAction(identifier: "Allow", title: "Allow", option: .foreground),
            NotifiationCreator.createAction(identifier: "Decline", title: "Decline", option: .destructive)
        ]).createNotification()
    }
    
}
