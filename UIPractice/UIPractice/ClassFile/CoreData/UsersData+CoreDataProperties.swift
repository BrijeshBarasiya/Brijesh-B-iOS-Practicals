import Foundation
import CoreData

extension UsersData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsersData> {
        return NSFetchRequest<UsersData>(entityName: "UsersData")
    }

    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?

}
