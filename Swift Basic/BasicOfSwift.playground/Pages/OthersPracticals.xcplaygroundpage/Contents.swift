//1. Breakfast
var eggsAge = 2
var baconAge = 3
if eggsAge <= 21 && baconAge <= 7 {
    print("You can Cook Bacon and Eggs.")
} else if eggsAge > 21 {
    print("Throw Egg")
} else if baconAge > 7 {
    print("Throw Bacon")
}

//2. Leap Year
var year = 2004
if ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0) {
    print("Leap Year!!")
} else {
    print("Not Leap Year!!")
}

//3. Hitpoints
var hitPoint = 62
if hitPoint <= 0 {
    print("You are Dead")
} else if (1...20).contains(hitPoint) {
    print("Hit Point is: 20")
} else {
    hitPoint /= 10
    hitPoint += 1
    hitPoint *= 10
    print("Hit Point is: \(hitPoint)")
}

//4. Above average
var grade = [7.0, 9.0, 5.0]
var yourGrade = 8.0
var totalMark = 0.0
grade.forEach { grade in
    totalMark += grade
}
print(yourGrade > totalMark / Double(grade.count) ? "Above Avarage" : "Below Avarage")

//5. Tipping
var cost: Double = 3.5
var tip: Int = 20
var totalCost = ((cost * Double(tip)) / 100) + cost
print(totalCost)
