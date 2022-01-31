let emptyString = String() //Similar way to define empty string(let emptyString = ""), (let emptyString: String)
if emptyString.isEmpty {
    print("This is Empty")
}

//1 Double quote for single line String input
var singleLineString = "Hello"
print(singleLineString)

//3 Double quote for multiple lines String input
let multiLineString = """
    Hello
    How are You??
    Many More....
    """
print(multiLineString)


singleLineString += " Brijesh" //String Mutability(Concate String with Brijesh)
print(singleLineString)

//Printing Single Charactar os String
for char in singleLineString {
    print(char)
}

//Characters
var charactarsArray: [Character] = ["A", "B", "C", "D"]
print(charactarsArray)
var charToString = String(charactarsArray)
print(charToString)

print("Charactar in \"\(singleLineString)\" is: \(singleLineString.count)") //Counting Characters in String
print("Start Index: \(singleLineString[singleLineString.startIndex])") //printing first index character
print("End Index: \(singleLineString[singleLineString.index(before: singleLineString.endIndex)])") //printing Last index character

var index = singleLineString.firstIndex(of: " ") ?? singleLineString.endIndex
print(singleLineString[..<index])

var lectures = [
"T: Android",
"P: Android",
"T: iOS",
"P: iOS",
"T: Network"
]
var count = 0
for index in lectures {
    if index.hasPrefix("T") {
        count += 1
    }
}
print("Theory Lectures are: \(count)")

count = 0
for index in lectures {
    if index.hasSuffix("Android") {
        count += 1
    }
}
print("Android Lectures is: \(count)")
