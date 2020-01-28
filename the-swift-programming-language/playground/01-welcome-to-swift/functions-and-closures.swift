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
