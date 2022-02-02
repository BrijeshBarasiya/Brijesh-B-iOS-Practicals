//1. Write swift program using enumerations to check week day from given number. Consider Monday as 1 and Sunday as 7. We can be able to get day name as string in short form (sun, mon,...) and same full name (Sunday, Monday...) by given number of the day.
//3. Write a swift program using enumerations to demonstrate Int enums.
enum WeekDay: Int {
    
    case Monday = 1
    case Tuesday 
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday

}
var perameter = 5
print(WeekDay(rawValue: perameter) ?? "Sorry Wrong Input")

//2. Create one enumeration program to return number of days in a month.
enum MonthDays: String {
    
    case January
    case Febuary
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
    
}

switch MonthDays.January {
    case .January, .March, .May, .July, .August, .October, .December:
        print("31")
    case .April, .June, .September, .November:
        print("30")
    case .Febuary:
        print("28")
}

//4. Write a swift program to demonstrate string type enum.
//5. Write a swift program for enum with raw values.
enum Operation: String, CaseIterable {
    
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
    case mod = "%"
    
    static var allOparation: [Operation] {
        return [.addition, .subtraction, .multiplication, .division, .mod]
    }
    
    var description: String {
        switch self {
        case .addition:
            return "Addition"
        case .subtraction:
            return "Subtraction"
        case .multiplication:
            return "Multiplication"
        case .division:
            return "Division"
        case .mod:
            return "Mod"
        }
    }
    
}

Operation.allCases.forEach { opt in
    print(opt.rawValue)
}

//6. Write a swift program using enumerations to get all cases as an array with use of CaseIterable(Optional) and without use of CaseIterable(Mandatory).
var five1 = Operation.allCases.map { val in val.description }
print(five1)
print(Operation.allOparation)

//7. Write a swift program using enumerations for learn and demonsrate enum cases with parameters (Enum with associated values).
enum SevenEnum {
    
    case name(String)
    case address(String)
    case phone(Int)
    
}

var enumName = SevenEnum.name("Brijesh")
var enumAddress = SevenEnum.address("Rajkot")
var enumPhone = SevenEnum.phone(8547455)

switch enumName {
    case .name(let name):
        print(name)
    case .address(let address):
        print(address)
    case .phone(let phone):
        print(phone)
}

//8. Create an enum with its rawValues of type String and show usage of case to print value of case.
Operation.allCases.forEach { value in
    print(Operation(rawValue: value.rawValue) ?? " ")
}
