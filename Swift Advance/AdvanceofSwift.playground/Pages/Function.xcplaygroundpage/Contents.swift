//Function Declaration
func greeting() {
    print("Hello!!")
}
greeting()

//String Function that return String Value
func greeting(name: String) -> String {
    return "Hello " + name + "!!"
}
print(greeting(name: "Brijesh"))

//String Perameter that return Int Value
func stringCount(stringvalue: String) -> Int {
    return stringvalue.count //Implicit Return (function have only single line expression)
}
print(stringCount(stringvalue: "Hello World!!"))

//Multiple Perameter void Function
func addition(value1: Int, value2: Int) {
    print(value1 + value2)
}
addition(value1: 20, value2: 25) //Perameter label when calling function

//Multiple Perameter Int Function that return Int value
//Use underscore (_) instead of an explicit argument label
func subtraction(_ value1: Int, value2: Int) -> Int {
    return (value1 - value2)
}
print(subtraction(25, value2: 5))//Perameter label not required when we use (_) in function perameter

//Multiple return Function
func minMax(valArray: [Int]) -> (min: Int, max: Int) {
    return (valArray.min() ?? 0 , valArray.max() ?? 0)
}
print(minMax(valArray: [1, 25, -45, 85, 65, 10, 55]))


//Default Parameter Value
func tipping(cost: Float, tip: Int = 20) -> Float {
    return ((cost * Float(tip)) / 100) + cost
}
print(tipping(cost: 50)) //if we not pass tip then it take default value
print(tipping(cost: 50, tip: 25)) // if we pass tip then it take that value

//inout Parameters
func division(value: inout Int, divisor: Int) {
    value = value / divisor
}
//We not able to pass arugument in inout and (&) indicate that it can be modified by the function
var value = 25
division(value: &value, divisor: 5)
print(value)

//similar way for calling function
var div = division
div(&value, 2)
print(value)
