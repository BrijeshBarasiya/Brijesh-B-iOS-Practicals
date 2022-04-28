import UIKit

class NotifiationCreator: UNMutableNotificationContent{
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    init(title: String, message: String, subTitle: String) {
        super.init()
        self.title = title
        self.body = message
        self.subtitle = subTitle
        self.sound = UNNotificationSound.default
        self.categoryIdentifier = "CategoryIdentifier"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createNotification() {
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: self, trigger: notificationTrigger)
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(notificationRequest, withCompletionHandler: nil)
    }
    
    func addAction(actions: [UNNotificationAction]) -> Self {
        let notificationCategory = UNNotificationCategory.init(identifier: self.categoryIdentifier, actions: actions, intentIdentifiers: [], options: [])
        userNotificationCenter.setNotificationCategories([notificationCategory])
        return self
    }
    
    static func createAction(identifier: String, title: String, option: UNNotificationActionOptions) -> UNNotificationAction {
        return UNNotificationAction.init(identifier: identifier, title: title, options: option)
    }
    
}

//MARK: - UNUserNotificationCenterDelegate
extension NotifiationCreator: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case "Allow":
            print("Accept")
        case "Decline":
            print("Decline")
        default:
            print("Unknown action")
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .list, .sound])
    }
    
}
