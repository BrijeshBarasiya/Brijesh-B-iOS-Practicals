//Closures are self-contained blocks of functionality that can be passed around and used in your code.
//Declaration
let greeting = {
    print("Hello!!")
}
greeting()

//Parameters Closure
let additon = { (value1: Int, value2: Int) -> Int in //(in) key word use for compiler can uderstand logic has started
    return (value1 + value2)
}
print(additon(20,15))

//Single Expression Implicit Returns
let number = [1, 2, 3].map { val in return val * 2}
print(number)

//Declaring Closure
var multiplication: (Int, Int) -> Int
multiplication = {
    return ($0 * $1) //Shorthand Argument Names
}
print(multiplication(10, 5))

multiplication = { (value1, value2) in
    return (value1 * value2)
}
print(multiplication(20, 5))
