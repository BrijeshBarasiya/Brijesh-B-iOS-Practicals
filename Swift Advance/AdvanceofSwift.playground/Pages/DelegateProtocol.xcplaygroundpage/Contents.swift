protocol DogOwnerProtocol: AnyObject {
    
    func printInfo()
    
}

class Dog {
    
    var name: String
    weak var delegate: DogOwnerProtocol?
    
    init(name: String) {
        self.name = name
    }
    
    func callDog() {
        print("Dog Class \(name)")
        if let delegate = delegate {
            delegate.printInfo()
        }
    }
    
}

class DogOwner: DogOwnerProtocol {
    
    var pet: Dog
    
    init(pet: Dog) {
        self.pet = pet
        self.pet.delegate = self
    }
    
    func printInfo() {
        print("Dog Owner Class \(pet.name)")
    }
    
}

var bob = DogOwner(pet: Dog(name: "Tom"))
bob.pet.callDog()

protocol ResultDelegate: AnyObject {
    
    func result(result: Int)
    
}

class Developer {
    
    weak var manager: ResultDelegate?
    
    func addition(val1: Int, val2: Int) {
        let result = val1 + val2
        manager?.result(result: result)
    }
    
}

class Manager: ResultDelegate {
    
    weak var developer: Developer?
    
    init(developer: Developer) {
        self.developer = developer
        developer.manager = self
    }
    
    func makeAddition(value1: Int, value2: Int) {
        developer?.addition(val1: value1, val2: value2)
    }
    
    func result(result: Int) {
        print(result)
    }
    
}
var obj = Manager(developer: Developer())
obj.makeAddition(value1: 25, value2: 20)
