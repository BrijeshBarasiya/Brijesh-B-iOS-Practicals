import Foundation
import Darwin
enum days {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thrusday
    case friday
    case satursday
}

enum Months: CaseIterable {
    case Jan , Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
}
print(days.sunday)

var allMonth = Months.allCases.count
print(allMonth)
for month in Months.allCases {
    print(month, terminator: " ")
}

//Implicitly Assigned Raw Values
enum Operation: Character, CaseIterable {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
    case mod = "%"
}

print(" ")
for opr in Operation.allCases {
    print(opr.rawValue, terminator: " ")
}
Operation.allCases.forEach { opt in
    print(opt.rawValue)
}
print(" ")

//Initializing from a Raw Value
print(Operation(rawValue: "+") ?? "")

//Recursive Enumerations
enum StudentEnum {
    case name(String)
    case grade(Int, Int, Int)
}

var name = StudentEnum.name("Brijesh")
var grade = StudentEnum.grade(12, 15, 18)
print(grade)

/*
 Pending with: Recursive Enumerations
 
 */

//Structures
//Declaration
struct InformationStructures {
    var name: String = "Brijesh"
    var nickName: String = "BB"
}
let infoStructures = InformationStructures()
print(infoStructures) //InformationStructures(name: "Brijesh", nickName: "BB")

struct StudentStructures {
    var name: String
    var grade1: Int = 0
    var grade2: Int = 0
    var grade3: Int = 0
    var totalMark: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    //Stucture is immutable thats why we can change value to chnage value we want to make mutating function
    mutating func calculateMark(grade1: Int, grade2: Int, grade3: Int) {
        self.grade1 = grade1
        self.grade2 = grade2
        self.grade3 = grade3
        totalMark = self.grade1 + self.grade2 + self.grade3
    }
}

var studStructures = StudentStructures(name: "Brijesh")
print(studStructures)

studStructures.calculateMark(grade1: 23, grade2: 25, grade3: 24)
print(studStructures)
print(studStructures.totalMark)

//Class
//Declaration
class InformationClass {
    var name: String = "Brijesh"
    var nickName: String = "BB"
}
let infoClass = InformationClass()
print(infoClass) //(__lldb_expr_144.InformationClass)
print(infoClass.nickName)

class StudentClass {
    var name: String
    var grade1: Int = 0
    var grade2: Int = 0
    var grade3: Int = 0
    var totalMark: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    func calculateMark(grade1: Int, grade2: Int, grade3: Int) {
        self.grade1 = grade1
        self.grade2 = grade2
        self.grade3 = grade3
        totalMark = self.grade1 + self.grade2 + self.grade3
    }
}

let studClass = StudentClass(name: "Brijesh")
studClass.calculateMark(grade1: 85, grade2: 96, grade3: 95)
print(studClass.totalMark)

var stud2Class = studClass
stud2Class.name = "BB"
if studClass === stud2Class {
    print("Both Class Are Equal")
} else {
    print("Both Class Are Not Equal")
}

class AdditionSubtraction {
    var add: Int = 0
    var sub: Int = 0
    
    func addition(value1: Int, value2: Int) -> Int{
        add = (value1 + value2)
        return add
    }
    
    func subtraction(value1: Int, value2: Int) -> Int{
        sub = (value1 * value2)
        return sub
    }
    
    func result() {
        print("Addition is: \(add) and Subtraction is: \(sub)")
    }
}

class MulDiv: AdditionSubtraction {
    var mul: Int = 0
    var div: Int = 0
    
    func multiplication(value1: Int, value2: Int) -> Int {
        mul = (value1 * value2)
        return mul
    }
    
    func division(value1: Int, value2: Int) -> Int {
        div = (value1 / value2)
        return div
    }
    
    override func result() {
        super.result()
        print("Multiplication is: \(mul) and Division is: \(div)")
    }
}

let mulDiv = MulDiv()
print(mulDiv.addition(value1: 25, value2: 65))
print(mulDiv.subtraction(value1: 98, value2: 24))
print(mulDiv.multiplication(value1: 31, value2: 3))
print(mulDiv.division(value1: 98, value2: 2))
mulDiv.result()
