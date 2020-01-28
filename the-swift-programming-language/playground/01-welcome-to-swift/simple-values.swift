// Constants and Variables
var myVariable = 42
myVariable = 50
let myConstant = 42

// Specity the type by writing after the variable, separated by a colon
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

// Make an instance of the desired type
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

// Write value in parentheses
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

// Aarry
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "coca"

// Dictionary
var occupations = [
  "Malcolm": "Captain",
  "Kaylee": "Mechanic",
]

// Arrays automatically grow
shoppingList.append("blue paint")
print(shoppingList)

// Create an empty array or dictionary
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
shoppingList = []
occupations = [:]
