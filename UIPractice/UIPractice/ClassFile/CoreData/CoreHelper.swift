import Foundation
import UIKit
import CoreData

class CoreHelper {
    
    static var shared = CoreHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

    func saveData(data: [String: String]) {
        guard let context = context else {
            return
        }
        let user = NSEntityDescription.insertNewObject(forEntityName: "UsersData", into: context) as! UsersData
        user.username = data["username"]
        user.email = data["email"]
        user.password = data["password"]
        do {
            try context.save()
        } catch {
            print(error)
            
            
            
            
        }
    }
    
    func getUserData(username: String, completion: @escaping (UsersData) -> Void, error: @escaping (String) -> Void) {
        let fetchRequest = NSFetchRequest<UsersData>(entityName: "UsersData")
        let predicate = NSPredicate(format: "username == %@", username)
        fetchRequest.predicate = predicate
        guard let data = try? context?.fetch(fetchRequest).first else {
            error("Username Not Found")
            return
        }
        completion(data)
    }
    
    func updateUserData(username: String, email: String, password: String, completion: @escaping (Bool) -> Void, error: @escaping (String) -> Void) {
        getUserData(username: username, completion: { data in
            data.setValue(email, forKey: "email")
            data.setValue(password, forKey: "password")
            do {
                try self.context?.save()
                completion(true)
            } catch {
                completion(false)
            }
        }, error: error)
    }
    
}
