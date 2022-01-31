//Declaration of Array
var intArray: [Int] = []
print("Size if intArray is: \(intArray.count)")

var stringArray: [String] = ["Android", "Flutter", "iOS", "C#", ".net", "Php", "HTML"]
print("Size if stringArray is: \(stringArray.count)") //Count all Element of Array

intArray.append(10) //Insert new element in Array
print("Size if intArray is: \(intArray.count)")

intArray += Array(repeating: 1, count: 10) //Adding new same value(1) 10 times
print(intArray)

if intArray.isEmpty {
    print("Array is Empty")
} else {
    print("Array is not Empty")
}

print("Printing stringArray")
stringArray.forEach{ val in
    print(val)
}

print("Printing stringArray value of index 1-3")
for index in 1...3 {
    print(stringArray[index])
}

stringArray.insert("CSS", at: 7) //Inserting new Element at Given Index
print("Removing: \(stringArray.remove(at: 7))") //Removing Element at Given Index
print("Removing Last: \(stringArray.removeLast())") //Removing Last Value

for (index, value) in stringArray.enumerated() {
    print("\(index): \(value)")
}

//Declaration of Set
var setCity = Set<String>() //Creating New Empty Set
print("Element in setCity is: \(setCity.count)")
setCity.insert("Ahmdabad") //Inserting New Element in Set
setCity.insert("Rajkot")
setCity.insert("Gandhinagar")
setCity.insert("Baroda")
setCity.insert("Kuch")
setCity.remove("Kuch") //Removing Element from set
print("Checking Set Contain Kuch? \(setCity.contains("Kuch"))")

for cityName in setCity.sorted() {
    print(cityName)
}

//Declaration of Dictionary
var alphabet: [Int: String] = [1: "A", 2: "B", 3:"C", 4: "D", 5: "F"]
print("Element in alphabet is: \(alphabet.count)")
print("isEmpty: \(alphabet.isEmpty)")
alphabet[5] = "E"

for (key, value) in alphabet.shuffled() {
    print("\(key): \(value)")
}

let alphabetKey = [Int] (alphabet.keys)
let alphabetvalue = [String] (alphabet.values)
print ("Key: \(alphabetKey) and Value: \(alphabetvalue)")
alphabet.removeValue(forKey: 5)
