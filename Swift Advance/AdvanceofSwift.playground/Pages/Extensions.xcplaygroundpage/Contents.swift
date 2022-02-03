import Foundation
extension String {
    
    mutating func insertNewChar(index: Int, newChar: Character) -> String {
        self.insert(newChar, at: self.index(self.startIndex, offsetBy: index))
        return self
    }
    
    mutating func replaceChar(index: Int, newChar: Character) -> String {
        //var charOfString: [Character] = Array(self)
        //charOfString[index] = newChar
        //return String(charOfString)
        let idx = self.index(self.startIndex, offsetBy: index)
        self.remove(at: idx)
        self.insert(newChar, at: idx)
        return self
    }
    
    func removeExtraSpace() -> String {
        let result: String = self.replacingOccurrences(of: "  ", with: " ")
        return result
    }
    
    func countWord() -> Int {
        return self.split(separator: " ").count
    }
    
}

var demoString = "Swiftis  for  Develop  iOS  Application"
print(demoString)

//1. Add a character in a string at 5th position
print(demoString.insertNewChar(index: 5, newChar: " "))
//demoString.insert(" ", at: demoString.index(demoString.startIndex, offsetBy: 5))
//print(demoString)

//2. Replace one character with other in a string
print(demoString.replaceChar(index: 0, newChar: "A"))

//3. Remove white spaces from string
print(demoString.removeExtraSpace())
//print(demoString.replacingOccurrences(of: "  ", with: " "))

//4. Get number of words in a string
print("Their is Total \(demoString.countWord()) Word in String")
//print("Their is Total \(demoString.split(separator: " ").count) Word in String")
