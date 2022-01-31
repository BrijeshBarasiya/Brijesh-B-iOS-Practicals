//1.
var n = 100
var ans = 2
while(ans <= n) {
    print(ans)
    ans *= 2
}

//2.
n = 3
let starLine = String(repeating: "*", count: n)
let pattern = String(repeating: starLine + "\n", count: n)
print(pattern)

//3.
n = 4
for i in 1...n {
    print(String(repeating: "*", count: i))
}

//4.
print("")
n = 3
(0..<n).forEach { count in
    let space = String(repeating: " ", count: n - count - 1)
    print(space + String(repeating: "*", count: 2 * count + 1))
}

//5.
var flage = false
var number = 13
for value in 2...number / 2 {
    if (number % value) == 0 {
        flage = true
        break
    }
}
print(!flage ? "Prime" : "Not Prime")
