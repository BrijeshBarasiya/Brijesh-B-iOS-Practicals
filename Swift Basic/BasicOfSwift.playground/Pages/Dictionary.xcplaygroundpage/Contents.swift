//1.
var eCode: [String: String] = [
                                "a": "b",
                                "b": "c",
                                "c": "d",
                                "d": "e",
                                "e": "f",
                                "f": "g",
                                "g": "h",
                                "h": "i",
                                "i": "j",
                                "j": "k",
                                "k": "l",
                                "l": "m",
                                "m": "n",
                                "n": "o",
                                "o": "p",
                                "p": "q",
                                "q": "r",
                                "r": "s",
                                "s": "t",
                                "t": "u",
                                "u": "v",
                                "v": "w",
                                "w": "x",
                                "x": "y",
                                "y": "z",
                                "z": "a"
                            ]

var dCode: [String: String] = [:]
var encodedMessage = "uijt nfttbhf jt ibse up sfbe"
var decodedMesaage = ""
for (key, value) in eCode {
    dCode[value] = key
}
for char in encodedMessage {
    decodedMesaage += dCode[String(char)] ?? " "
}
print(decodedMesaage)

//2
var firstName = [String]()
var namingDictionary: [[String: Any]] = [
                                            [
                                                "firstName": "Calvin",
                                                "lastName": "Newton",
                                                "score": 13
                                            ],
                                            [
                                                "firstName": "Garry",
                                                "lastName": "Mckenzie",
                                                "score": 12
                                            ],
                                            [
                                                "firstName": "Leah",
                                                "lastName": "Rivera",
                                                "score": 10
                                            ],
                                            [
                                                "firstName": "Sonja",
                                                "lastName": "Moreno",
                                                "score": 3
                                            ],
                                            [
                                                "firstName": "Noel",
                                                "lastName": "Bowen",
                                                "score": 16
                                            ]
                                        ]

namingDictionary.forEach { dict in
    firstName.append("\(dict["lastName"] ?? " ")")
}
print(firstName)

//3
var fullName = [String]()
namingDictionary.forEach { dict in
    fullName.append("\(dict["firstName"] ?? " ") \( dict["lastName"] ?? " ")")
}
print(fullName)

//4
var smallScore = namingDictionary[0]["score"] as! Int
var fName = namingDictionary[0]["firstName"] as! String
var lName = namingDictionary[0]["lastName"] as! String
namingDictionary.forEach { dict in
    let value = dict["score"] as! Int
    if value < smallScore {
        smallScore = value
        fName = dict["firstName"] as! String
        lName = dict["lastName"] as! String
    }
}
print("Name: \(fName + lName) and Score: \(smallScore)")

//5.
var count = 1
namingDictionary.forEach { dict in
    print("\(count). \(dict["firstName"] ?? "") \(dict["lastname"] ?? "") -\(dict["score"] ?? "")")
    count += 1
}

//6.
var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
var resultDict: [Int: Int] = [:]
for element in numbers {
    resultDict[element] = (resultDict[element] ?? 0) + 1
}
for key in resultDict.keys.sorted() {
    print("\(key): \(String(resultDict[key] ?? 0))")
}
