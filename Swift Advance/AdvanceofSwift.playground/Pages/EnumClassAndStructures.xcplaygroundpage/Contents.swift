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

//Structures Declaration
struct InformationStructures {
    
    var name: String = "Brijesh"
    var nickName: String = "BB"
    
}
let infoStructures = InformationStructures()
print(infoStructures) //InformationStructures(name: "Brijesh", nickName: "BB")

struct StudentStructures {
    
    var name: String
    var grade: [Int] = []
    
    init(name: String) {
        self.name = name
    }
    
    //Stucture is immutable thats why we can't change value to chnage value we want to make mutating function
    mutating func calculateMark(grade: [Int]) -> Int {
        self.grade = grade
        var total = 0
        grade.forEach { mark in
            total += mark
        }
        return total
    }
    
}

var studStructures = StudentStructures(name: "Brijesh")
print(studStructures)
print(studStructures.calculateMark(grade: [12,52,35,36]))
print(studStructures)

//Class Declaration
class InformationClass {
    
    var name: String = "Brijesh"
    var nickName: String = "BB"
    
}
let infoClass = InformationClass()
print(infoClass) //(__lldb_expr_144.InformationClass)
print(infoClass.nickName)

class StudentClass {
    
    var name: String
    var grade1 = 0
    var grade2 = 0
    var grade3 = 0
    var totalMark = 0
    
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
    
    var add = 0
    var sub = 0
    
    func addition(value1: Int, value2: Int) -> Int {
        add = (value1 + value2)
        return add
    }
    
    func subtraction(value1: Int, value2: Int) -> Int {
        sub = (value1 * value2)
        return sub
    }
    
    func result() {
        print("Addition is: \(add) and Subtraction is: \(sub)")
    }
    
}

class MulDiv: AdditionSubtraction {
    
    var mul = 0
    var div = 0
    
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
