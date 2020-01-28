// If and For loop
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
  if score > 50 {
    teamScore += 3
  } else {
    teamScore += 1
  }
}
print(teamScore)

// Question mark
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
  greeting = "Hello, \(name)"
}
print(greeting)

// ?? operator
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
print(informalGreeting)

// Switches
let vegetable = "red pepper"
switch vegetable {
case "celery":
  print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
  print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
  print("Is it a spicy \(x)?")
default: // Switch must be exhustive
  print("Everything tastes good in soup.")
}

// For-in
let interestingNumbers = [
  "Prime": [2, 3, 5, 7, 11, 13],
  "Fibonacci": [1, 1, 2, 3, 5, 8],
  "Square": [1, 4, 9, 16, 25]
]
var largest = 0
for (_, numbers) in interestingNumbers {
  for number in numbers {
    if number > largest {
      largest = number
    }
  }
}
print(largest)

// While and Repeat-while
var n = 2
while n < 100 {
  n *= 2
}
print(n)

var m = 2
repeat {
  m *= 2
} while m < 100
print(m)

// Keep an index in a loop by using ..<
var total = 0
for i in 0..<4 {
  total += i
}
print(total)
