import Foundation
//1. Create an example using swift to demonstrate use of get only properties. Create a class with a property which value cannot be set outside of class.
//4. Create a swift program which has private properties which cannot directly be accessed. Means we cannot directly read or write it.
class ClassProperties {
    
    private var name = " "
    var nameString = "Brijesh Barasiya"
    
    func getOnly(range: ClosedRange<Int>) {
        let sIndex = nameString.index(nameString.startIndex, offsetBy: range.first ?? 0)
        let eIndex = nameString.index(nameString.startIndex, offsetBy: range.last ?? 0)
        print(nameString[sIndex...eIndex])
    }
    
    func setName(name: String) {
        self.name =  name
    }
    
    func printName() -> String {
        return name
    }
    
}

var classProperties = ClassProperties()
classProperties.setName(name: "Brijesh")
print(classProperties.printName())
classProperties.getOnly(range: 0...6)

//2. Create a swift program to demonstrate usage of computed properties using getter and setter.
class GetterSetter {
    
    var squar = 0
    var power: Int  {
        get {
            return squar
        }
        set(value) {
            squar = value * value
        }
    }
    
}
var getterSetter = GetterSetter()
getterSetter.power = 8
print(getterSetter.power)

//3. Create a swift program to show usage of stored properties.
//7. Create one lazy stored property in a class and show usage of it.

struct StoredProperty {
    
    var value: Int //by default property known as Stored Property
    var power: Int {
        return value * value
    }
    static func makeCount() -> Int {
        var addition = 0
        for count in 0..<1000 {
            addition += count
        }
        return addition
    }
    
}
struct LazyProperty {
    
    lazy var count = StoredProperty.makeCount()
    
}

var lazyProperty = LazyProperty()
var storedProperty = StoredProperty(value: 5)
storedProperty.value = 6
print(storedProperty.power)
print(lazyProperty.count)

//5. Create one swift class which have two properties name and id, the class must have one initializer to set that properties. And create one array of that class types.
class Parson {
    
    var name: String
    var id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
}

var parson: [Parson] = [Parson(name: "Brijesh", id: 1), Parson(name: "Jay", id: 2)]
parson.forEach { object in
    print("Name: \(object.name) and ID: \(object.id)")
}

//6. Create one example of usage of willSet and didSet.
var WillDid: Int = 0 {
    willSet {
        print("I am in willSet Old value is: \(WillDid) and new value is \(newValue)")
    }
    didSet {
        print("I am in didSet Old value is: \(oldValue) and new value is \(WillDid)")
    }
}
WillDid = 5

//8. Create one class as Base type Person which has common properties like name, occupation, etc. Create two child classes from the person which are Student, Employee and this two-child classes must have base properties and some other properties also. Example, student have college, but Employee have company. And demonstrate the usage of inheritance.

class ParsonE {
    
    var name = " "
    var occupation: String = " "
    
    init(name: String, occupation: String) {
        self.name = name
        self.occupation = occupation
    }
    
}

class Student: ParsonE {
    
    var collage: String
    var rollno: Int
    
    init(name: String, occupation:String, collage: String, rollno: Int) {
        self.collage = collage
        self.rollno = rollno
        super.init(name: name, occupation: occupation)
    }
    
}

class Employee: ParsonE {
    
    var company: String
    var empID: Int
    
    init(name: String, occupation:String, company: String, empID: Int) {
        self.company = company
        self.empID = empID
        super.init(name: name, occupation: occupation)
    }
    
}

var emp = Employee(name: "Brijesh", occupation: "none", company: "Simform", empID: 1)
print("Name: \(emp.name), Occupation: \(emp.occupation), Company: \(emp.company) and EmpId: \(emp.empID)")
var stud = Student(name: "Brijesh", occupation: "none", collage: "Marwadi", rollno: 21)
print("Name: \(stud.name), Occupation: \(stud.occupation), Collage: \(stud.collage) and Roll No.: \(stud.rollno)")

//9. Create one structure to show usage of mutating function in swift.
struct MutatingFunction {
    
    var greeting = "Hello "
    
    mutating func printGreeting(greet: String) {
        greeting += greet + "!!"
    }
    
}
var mutatingFunction = MutatingFunction()
mutatingFunction.printGreeting(greet: "Brijesh")
print(mutatingFunction.greeting)

//10. Create one class inheritance demo to show usage of method overriding.
class Addition {
    
    func operation(value1: Int, value2:Int) -> Int {
        return value1 + value2
    }
    
}

class Calculate: Addition {
    
    override func operation(value1: Int, value2:Int) -> Int {
        return value1 - value2
    }
    
    func calculate(value1: Int, value2:Int) {
        print("Child Class Function: \(super.operation(value1: value1, value2: value2))")
        print("Child Class Function: \(operation(value1: value1, value2: value2))")
    }
    
}

var calculate = Calculate()
calculate.calculate(value1: 20, value2: 32)

//11. Create one swift class to show usage of type methods.
class TypeClass {
    
    class func classFunc() {
        print("This is Example of Type Methods. To Class Method we use (ClassName.FunctionName). not able to call using object")
    }
    
    static func staticFunction() {
        print("This is Example of Static Function. We Can't override or create same name function in inheritance")
    }
    
}

TypeClass.classFunc()

//12. Create one swift class which is having class method and static method. Then in one child class try to override that methods and check the output/ error. (you will learn difference between class and static)

class StaticClass: TypeClass {
    
    override class func classFunc() {
        print("We can Override Class Function in inheritance")
        super.classFunc()
        super.staticFunction()
    }
    //override static func staticFunction() //-----Will Genrate error cannot override static method
}

StaticClass.classFunc()

//13. Create one example of subscript using array. Create one array of weekdays and one subscript func which takes int as argument and returns day of week.
struct WeekDays {
    
    var weekDays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thrusday", "Friday", "Satursday"]
    subscript(day: Int) -> String {
        return weekDays[day - 1]
    }
    
}

let weekDay = WeekDays()
print(weekDay[2])

//14. Create a swift program to show usage of subscript in string. I pass int argument and it returns the character at given position.
struct GetCharecter {
    
    var stringMsg = "Welcome to Subscript"
    subscript(index: Int) -> Character {
        return stringMsg[stringMsg.index(stringMsg.startIndex, offsetBy: index)]
    }
    
}

var getCharecter = GetCharecter()
print(getCharecter[10])

//15. Create one swift subscript program which takes range as input and returns the string between the ranges.
struct GetSubString {
    
    var stringMsg = "Welcome to Subscript"
    subscript(range: ClosedRange<Int>) -> String {
        let sIndex = stringMsg.index(stringMsg.startIndex, offsetBy: range.first ?? 0)
        let eIndex = stringMsg.index(stringMsg.startIndex, offsetBy: range.last ?? 0)
        return String(stringMsg[sIndex...eIndex])
    }
    
}

var getSubString = GetSubString()
print(getSubString[2...8])

//16. I have one integer array and create one function which takes range as input and returns all elements between the range.
func getRangeElement(range: ClosedRange<Int>) -> [Int] {
    
    let intArray = [1, 25, 85, 63, 74, 10, 12, 147, 523, 45, 74, 67, 79]
    return Array(intArray[range])
    
}

print(getRangeElement(range: 0...5))

//17. I have one key value pair array. Create one function using subscript which takes key as input and returns it’s value.
class GetValue {
    
    var result = " "
    var keyValue = [[1: "Hello"], [2: "Hiii"]]
    
    subscript(key: Int) -> String {
        keyValue.forEach { value in
            if value.keys.contains(key) {
                result = value[key] ?? " "
            }
        }
        return result
    }
    
}
var getValue = GetValue()
print(getValue[1])

//18. Create one array of type Person and create one subscript function which takes person name as input and returns person info like name, age, birthdate etc.
class PersonDetail {
    
    var details =   [
                        [
                            "name": "Abc",
                            "birthDate": "1 Jan",
                            "age": 22,
                        ],
                        [
                            "name": "Def",
                            "birthDate": "31 Aug",
                            "age": 26,
                        ]
                    ]
    var detailArray: [String: Any] = [:]
    
    subscript(name: String) -> [String: Any] {
        for detail in details {
            if detail["name"] as! String == name {
                detailArray = detail
                break
            }
        }
        return detailArray
    }
    
}

var personDetail = PersonDetail()
print(personDetail["Abc"])

//19. Create one base class of type Song and create subclasses of music types (Hip-Hop, classical) and show usage of inheritance. Here Music class have property singer, composer
class Song {
    
    var songName: String
    init(songName: String) {
        self.songName = songName
    }
    
    func printSongDetail() {
        print("Song is: \(songName)")
    }
    
    func printHello() {
        print("Song is: \(songName)")
    }
    
}
class HipHop: Song {
    
    var singer: String
    var composer: String
    
    init(songName: String, singer: String, composer: String) {
        self.singer = singer
        self.composer = composer
        super.init(songName: songName)
    }
    
    override func printSongDetail() {
        print("Song Name: \(songName)\nSinger: \(singer)\nComposor: \(composer)")
    }
    
}
class Classical: Song {
    
    var singer: String
    var composer: String
    
    init(songName: String, singer: String, composer: String) {
        self.singer = singer
        self.composer = composer
        super.init(songName: songName)
    }
    
    override func printSongDetail() {
        print("Song Name: \(songName)\nSinger: \(singer)\nComposor: \(composer)")
    }
    
}

var upCasting: Song = HipHop(songName: "HipHop Song", singer: "Xyz", composer: "Jk")
upCasting.printSongDetail()

var classicalSong: Song = Classical(songName: "Classical Song", singer: "Xyz", composer: "Jk")
classicalSong.printHello()

var downCating: Classical = classicalSong as! Classical
downCating.printSongDetail()

//20. Create a swift class with properties which can be read-write outside of class.
class PublicProperties {
    
    var name: String
    var hobbies: [String]
    
    init(name: String, hobbies: [String]) {
        self.name = name
        self.hobbies = hobbies
    }
    
}

var publicProperties = PublicProperties(name: "Brijesh", hobbies: ["Travelling"])
print(publicProperties.name)
print(publicProperties.hobbies)
publicProperties.name = "Brijesh Barasiya"
publicProperties.hobbies.append("Designing")
print(publicProperties.name)
print(publicProperties.hobbies)
