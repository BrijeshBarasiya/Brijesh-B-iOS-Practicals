//1. Create a password validation program. If length of password is less than 8 characters, it throws “Password too short” exception and if password is empty, throw “Empty password” exception.
enum Errors: String, Error {
    
    case emptyPassword = "Empty Password"
    case noAnyItem = "Sorry!! You have Entered Wrong item"
    
}

enum Err: Error {
    
    case smallPassword(neededChar: Int)
    case outOfStock(requiredStock: Int, inStock: Int)
    
}

func checkLength(password: String) throws {
    guard password.count > 0 else {
        throw Errors.emptyPassword
    }
    guard password.count > 8 else {
        throw Err.smallPassword(neededChar: 8)
    }
}

do {
    try checkLength(password: "")
} catch Errors.emptyPassword {
    print(Errors.emptyPassword.rawValue)
} catch Err.smallPassword(let neededChar) {
    print("Character Password \(neededChar) Needed")
} catch {
    print("Unexpected error: \(error).")
}

//2. Create a program for shopping cart. If desired quantity for an item is not available, throw exception.
func shoppingCart(name: String, qty: Int) throws {
    
    let itemList = ["mouse": 5, "keyboard": 10, "monitor": 1, "cpu": 3]
    
    if itemList.keys.contains(name) {
        if qty <= itemList[name] ?? 0 {
            print("\(itemList[name] ?? 0) item added to cart.")
        } else {
            throw Err.outOfStock(requiredStock: qty, inStock: itemList[name] ?? 0)
        }
    } else {
        throw Errors.noAnyItem
    }
    
}

do {
    try shoppingCart(name: "mouse", qty: 5)
} catch Errors.noAnyItem {
    print(Errors.noAnyItem.rawValue)
} catch Err.outOfStock(let requiredeStock, let inStock) {
    print("Sorry!! \(requiredeStock) Item are not Available in Stock. \(inStock) items in Stock.")
} catch {
    print("Unexpected error: \(error).")
}
