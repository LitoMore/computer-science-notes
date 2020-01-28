// Basic function
func greet1(person: String, day: String) -> String {
  return "Hello \(person), today is \(day)."
}
let greeting1 = greet1(person: "Bob", day: "Tuesday")
print(greeting1)

// No argument label and custom argument label
func greet2(_ person: String, on day: String) -> String {
  return "Hello \(person), today is \(day)."
}
let greeting2 = greet2("John", on: "Wednesday")
print(greeting2)

// Use tuple to make a compound value
func calcStat(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
  var min = scores[0]
  var max = scores[0]
  var sum = 0

  for score in scores {
    if score > max {
      max = score
    } else if score < min {
      min = score
    }
    sum += score
  }
  
  return (min, max, sum)
}
let stats = calcStat(scores: [5, 3, 100, 3, 9])
print(stats.sum)
print(stats.2)

// Nested functions
func returnFifteen() -> Int {
  var y = 10
  func add() {
    y += 5
  }
  add()
  return y
}
print(returnFifteen())

// Functions are a first-class type
func makeIncrementer() -> ((Int) -> Int) {
  func addOne(number: Int) -> Int {
    return 1 + number
  }
  return addOne
}
var increment = makeIncrementer()
print(increment(7))

// A function can take another function as one of its arguments
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
  for item in list {
    if condition(item) {
      return true
    }
  }
  return false
}
func lessThanTen(number: Int) -> Bool {
  return number < 10
}
var numbers = [20, 19, 7, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))

// Functions are actually a special case of closures
print(numbers.map({ (number: Int) -> Int in
  let result = 3 * number
  return result
}))
print(numbers.map({ number in 3 * number }))
print(numbers.sorted { $0 > $1 })
