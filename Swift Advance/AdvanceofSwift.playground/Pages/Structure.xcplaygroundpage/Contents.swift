//1. Create one structure of type Work, which have some properties like work location, work hours and one string array of project names. And create a function inside structure which returns all project names for the person.
struct Work {
    
    var workLocation = "Home"
    var workHour = 8
    var projectName = ["Android", "iOS", "Flutter"]
    
    func projects() -> [String]{
        return projectName
    }
    
}

var work = Work()
print("Projects are: \(work.projects())")

//2. Create a structure example which demonstrates use of initializer in structures.
struct StructSecond {
    
    var workLocation: String
    var workHour: Int
    var projectName: [String]
    
    init(workLocation: String, workHour: Int, projectName: [String]) {
        self.workLocation = workLocation
        self.workHour = workHour
        self.projectName = projectName
    }
    
    func projects() -> [String] {
        return projectName
    }
    
}

var objectSecond = StructSecond(workLocation: "Home", workHour: 8, projectName: ["Android", "iOS", "Flutter"])
print("Work Location: \(objectSecond.workLocation)")
print("Work Hour: \(objectSecond.workHour)")
print("Projects are: \(objectSecond.projects())")

//3. Create a structure program which can be initialized with parameters and it also should be able to initialized without parameters
struct StructThird {
    
    var name: String
    var contact: Int
    
    init (name: String = "Android", contact: Int = 987456) {
        self.name = name
        self.contact = contact
    }
    
}

var objectThird = StructThird()
print(objectThird)
var objectThirdP = StructThird(name: "Brijesh", contact: 8521456)
print(objectThirdP)

//4. Create one structure which have initializer which takes array of int as input returns  two arrays one of all even numbers and another is all odd numbers.
struct StructFour {
    
    var numberArray: [Int]
    
    init(numberArray: [Int]) {
        self.numberArray = numberArray
    }
    
    mutating func sortedArray() -> ([Int], [Int]) {
        var evenArray: [Int] = []
        var oddArray: [Int] = []
        numberArray.forEach { element in
            element % 2 == 0 ? evenArray.append(element) : oddArray.append(element)
        }
        return (evenArray, oddArray)
    }
    
}

var objectFour = StructFour(numberArray: [1, 3, 5, 6, 8, 10, 9, 7, 8, 12])
var (evenArray, oddArray) = objectFour.sortedArray()
print("Even Number are: \(evenArray)")
print("Odd Number are: \(oddArray)")

//5. Create one swift structure program for person that contains basic details like name, age, gender. Then create one array of person with all details. Print all details of that array. 
struct Person {
    
    var name: String
    var gender: String
    var age: Int
    
    init(name: String = "Harry", gender: String = "Male", age: Int = 21) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
}

var objectPerson = [Person(name: "Joe", gender: "Male", age: 27)]
objectPerson.append(Person())
objectPerson.forEach{ element in
    print("Name: \(element.name), Gender: \(element.gender), Age: \(element.age)")
}

//6.Perform same example given in class question no 10 and check output using structure. Try to find difference between these two outputs and try to figure out the reason for that output. 
struct StructSix {
    
    var greet = ""
    
}

var objectSix = StructSix()
objectSix.greet = "Hello"
var obejectSicCopy = objectSix
obejectSicCopy.greet = "Hii"
print(objectSix.greet)
print(obejectSicCopy.greet)
