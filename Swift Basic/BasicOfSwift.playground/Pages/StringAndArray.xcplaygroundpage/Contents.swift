//String
//1.
print("============= Welocome to String Practical =============")
var inputString = "Simform"

//2.
print(inputString.prefix(2))

//3.
print(inputString.dropFirst().dropLast())

//4.
var inputString2: String = "Swift"
var inputString3: String = "Example"
print(inputString2.dropFirst() + inputString3.dropFirst())

//5.
let fLetter = inputString2.removeFirst()
let sLetter = inputString2.removeFirst()
inputString2.append(fLetter)
inputString2.append(sLetter)
print(inputString2)

//6.
inputString2 = "Swift"
print(inputString2.starts(with: "Sw"))

//7.
var inputName: String = "Simform Solutions"
var stringIndex = inputName.firstIndex(of: " ") ?? inputName.endIndex
var result = inputName[..<stringIndex]
result.remove(at: inputName.index(inputName.startIndex, offsetBy: 3))
print(result)

//Array
//1.
print("\n============= Welocome to Array Practical =============")
var firstPractical: [Int] = [1, 2, 3, 1]
print(firstPractical.first == firstPractical.last)

//2.
var secondPractical: [Int] = [1, 2, 3, 4]
var secondArray = Array(repeating: 0, count: secondPractical.count * 2)
secondArray[secondArray.count - 1] = secondPractical.last ?? 0
print(secondArray)

//3.
var thirdPractical = secondPractical[..<2]
print(thirdPractical)

//4.
var fourMaxvalue: Int = secondPractical.max() ?? 0
print(fourMaxvalue)

//5.
var fivePractical: [Int] = [52, 33, 65, 70, 12, 90]
print(Array(fivePractical.sorted().reversed()))


//6.
var sixPractical: [Int] = [2, 5]
var resultSix: [Int] = []
fivePractical.forEach { value in
    for divisor in sixPractical {
        if (value % divisor) == 0 {
            resultSix.append(value)
            break
        }
    }
}
print(resultSix)
