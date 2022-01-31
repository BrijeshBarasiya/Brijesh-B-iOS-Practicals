//Declaring Variables and Printing It
var stringVariable: String! = "Hello World" //Created String Variable
var nullVariable: String? //by Default it is Nil also we can write (var nullVariable: String) for null variable
var defaultValue: String = nullVariable ?? "Sorry!!" //if nullVariable null then is Store Default value ("Sorry!!)
nullVariable = "Hello" //Assigning new value to nullVariable
let floatValue: Float = 3.14159 //Final Float Variable. Value Can not be changed once Assigned
var boolVariable = true //Created a Boolean Variable
var tupleVariable = (1, "Swift", "Android") //Multiple Value in single compound
let tupleVariableWithIndexCode = (name:"Brijesh", address: "Rajkot", contact: 8460144726)
//Semicolon Used for complete the Statement when we write more then one statement in single line.
var intVariable: Int = 25; var nagativeValue = -intVariable //Unary Operator
var doubleVariable: Double = 65253.3562


print("Current String of stringVariable is: \(stringVariable)") //Printing Variable in Print
print("Current Float of floatValue is: \(floatValue)")
print("Current Boolean of boolVariable is: \(boolVariable)")
print("Current Integer of intVariable is: \(intVariable)")
print("Current Double of doubleVariable is: \(doubleVariable)")
print("Current Tuple of tupleVariable is: \(tupleVariable)")
print("Current Tuple of tupleVariableWithIndexCode Name is: \(tupleVariableWithIndexCode.name), Name is: \(tupleVariableWithIndexCode.address), Name is: \(tupleVariableWithIndexCode.contact)") //Printing Individual value of Tuple

//Basic Operators
var (value1, value2) = (20, 5)
if value1 == value2 {
    print("Both Value Are Equal") //Cheacking for Equal
}
else if value1 > value2 {
    print("value1 is Greater Than value2") //Cheacking for Greater Than
}
else if value1 < value2 {
    print("value2 is Greater Than value1") //Cheacking Lower Than
}

print("Addition of value1 + value2: \(value1 + value2)") //Performing Addition
print("Subtraction of value1 - value2: \(value1 - value2)") //Performing Subtraction
print("Multipication of value1 * value2: \(value1 * value2)") //Performing Multipication
print("Division of value1 / value2: \(value1 / value2)") //Performing Division
print("Mod of value1 % value2: \(value1 % value2)") //Performing Mod
print("We have Performed " + "Arithmetic Oparation") //Concate 2 String

print("Printing Addition of 1 to 10")
var count = 0, result = 0
while count <= 10 {
    result += count //Compound Assignment Operators
    count += 1
}
print("Addition of 1 to 10 is: \(result)")

//Comparison Operators
print(1 == 1) //true because both are Equal
print(2 != 1) //true because 2 is not qual to 1
print(2 > 1) //true because 2 is greater than 1
print(1 < 2) //true because 1 is less than 2
print(1 >= 1) //true because 1 is greater than or equal to 1
print(2 <= 1) //false because 2 not less than or equal to 1

//Range Operator
//Closed Range 1...10 it include 1 and 10
for count in 1...10 {
    print("Count is: \(count)")
}

//Half-Open Range and Range will (1 to value1-1)
for count in 1..<value1 {
    print("Count is: \(count)")
}

let range = ...5
print(range.contains(6)) //Checking Range Contain 6 or Not
print(range.contains(4)) //Checking Range Contain 4 or Not
print(range.contains(-2)) //Checking Range Contain -2 or Not

//Logical Operator

if !false {
    print("Logical Not")
}

if true && true {
    print("Logical And") //if Both Condition are true than only it comes in if block
}

if true || false {
    print("Logical or") //if any one Condition will true than it comes in if block
}
