//1.Create a swift program to demonstrate swift class. Which has two variables inside class body. Access (Set its values and get its value.) these variables by creating one instance of class.
class ClassFirst {
    
    var variable1 = 0
    var variable2 = " "
    
}
var demoObject = ClassFirst()
demoObject.variable1 = 2022
demoObject.variable2 = "Hello"
print(demoObject.variable1)
print(demoObject.variable2)

//2.Create a swift program to demonstrate usage of swift class for usage of multiple initializers. Create one initializer with two parameters your name and college and another initializer with your name and department. You can be able to access these properties using instance of class.
class ClassSecond {
    
    var name = ""
    var collage = ""
    var department = ""
    
    init(name: String, collage: String) {
        self.name = name
        self.collage = collage
    }
    
    init(name: String, department: String) {
        self.name = name
        self.department = department
    }
    
    func printValue() {
        print("Name: \(name), Collage: \(collage), Department: \(department)")
    }
    
}
var sObeject1 = ClassSecond(name: "Brijesh", collage: "Marwadi")
sObeject1.printValue()
var sObeject2 = ClassSecond(name: "Brijesh", department: "Computer")
sObeject2.printValue()

//3. Create a swift class without initializers and access (write, read) its properties using instance of class.
class PrivateProperties {
    
    private var name: String
    private var hobbies: [String]
    
    init(name: String, hobbies: [String]) {
        self.name = name
        self.hobbies = hobbies
    }
    
    func updatePrivate(name: String, hobbies: [String]) {
        self.name = name
        self.hobbies = hobbies
    }
    
    func printPrivate() {
        print("Name: \(name)")
        print("Hobbies are: \(hobbies)")
    }
    
}

var privateProperties = PrivateProperties(name: "Brijesh", hobbies: ["Travelling"])
privateProperties.printPrivate()
//print("Name: \(privateProperties.name)") //Because property is private. not able access outside of body
//privateProperties.name = "Brijesh Barasiya" //Because property is private. not able access outside of body
//privateProperties.hobbies.append("Cycling") //Because property is private. not able append outside of body
privateProperties.updatePrivate(name: "Brijesh Barasiya", hobbies: ["Travelling", "Cycling"])
privateProperties.printPrivate()

//4. Create a swift class which is having code to return square of given number and access this code using class instance.
class GetSquare {
    
    func findSquar(number: Int) -> Int {
        return (number * number)
    }
    
}
var getSquar = GetSquare()
print("Squar of 4 is: \(getSquar.findSquar(number: 4))")

//5.Create a swift class example to show use of swift inheritance. Your base class has some property access this property. In two different child classes and show its usage using the instances of both child classes.
class Addition {
    
    func addition(value1: Int, value2: Int) -> Int {
        return value1 + value2
    }
    
}

class Subtraction: Addition {
    
    func subtraction(value1: Int, value2: Int) -> Int {
        return value1 - value2
    }
    
}

class Multipication: Subtraction {
    
    func multiplication(value1: Int, value2: Int) -> Int {
        return value1 * value2
    }
    
}

class Division: Multipication {
    
    func division(value1: Int, value2: Int) -> Int {
        return value1 / value2
    }
    
}

class BasicOperation: Division {
    
    func calculate(value1: Int, value2: Int) {
        print("Addition of \(value1) and \(value2) is: \(addition(value1: value1, value2: value2))")
        print("Subtraction of \(value1) and \(value2) is: \(subtraction(value1: value1, value2: value2))")
        print("Multipication of \(value1) and \(value2) is: \(multiplication(value1: value1, value2: value2))")
        print("Division of \(value1) and \(value2) is: \(division(value1: value1, value2: value2))")
    }
    
}
var basicOperation = BasicOperation()
basicOperation.calculate(value1: 60, value2: 30)

//6. Create a swift class example to show use of swift base class which have some implementation inside any method. Now demonstrate usage of overriding that method implementation.
class SuperClass {
    
    func printMe() {
        print("Hello I Am Super Class PrintMe() Method")
    }
    
}

class ChildClass: SuperClass {
    
    override func printMe() {
        super.printMe()
        print("Hello I Am Child Class PrintMe() Method")
    }
    
}

var childClass = ChildClass()
childClass.printMe()

//7. Create a swift class with an initializer in a manner that you can create this class using initializing value. And one function which takes int input and returns the power of class instance.
class ClassSeven {
    
    var value: Int
    init(value: Int) {
        self.value = value
    }
    
    func poerFunc(pow: Int) -> Int {
        var result: Int = 1
        for _ in 1...pow {
            result = result * value
        }
        return result
    }
    
}
var objectSeven = ClassSeven(value: 5)
print("Power of 5's 3 is: \(objectSeven.poerFunc(pow: 3))")

//8.Create a swift class example which has a parent class for vehicles, and child classes for two different vehicles e.g. (bike & car). You need to use common properties and method in the parent class and inside child class, there will be some different property which is not common.
class Vehicles {
    
    var capacity = 0
    
    func vehicleStart(vehicle: String) {
        print("\(vehicle) has Started with Capacity of \(capacity)")
    }
    
    func vehicleStop(vehicle: String) {
        print("\(vehicle) has Stopped")
    }
    
}
class Bike: Vehicles {
    
    func start() {
        vehicleStart(vehicle: "Bike")
    }
    
    func stop() {
        vehicleStop(vehicle: "Bike")
    }
    
}
class Car: Vehicles {
    
    func start() {
        vehicleStart(vehicle: "Car")
    }
    
    func stop() {
        vehicleStop(vehicle: "Car")
    }
    
}
var objectBike = Bike()
var objectCar = Car()
objectBike.capacity = 2
objectCar.capacity = 5
objectBike.start()
objectCar.start()
objectBike.stop()
objectCar.stop()

//9. Create a person swift class with person name initializer and create one function to greet that person.
class Parson {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func greeting() {
        print("Hello \(name)!!")
    }
    
}
var objectParson = Parson(name: "Brijesh")
objectParson.greeting()

//10. Create a swift class with some property. And then set its value using initializer of class, then perform below actions.
class ClassTen {

    var greet: String
    
    init(greet: String = "") {
        self.greet = greet
    }
    
}
let objectTen = ClassTen()
objectTen.greet = "Hello"
let copyObjTen = objectTen
copyObjTen.greet = "Hii" //Both object value will chnage because address is copied to another object if we change in will it change in both because of pointer adrress
print(objectTen.greet)
print(copyObjTen.greet)
