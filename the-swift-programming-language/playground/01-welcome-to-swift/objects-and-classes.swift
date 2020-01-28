// Basic class
class Shape {
  var numberOfSides = 0
  let name: String

  init(name: String) {
    self.name = name
  }

  func simpleDescription() -> String {
    return "A shape with \(numberOfSides) sides."
  }

  func sayMyName() {
    print(name)
  }
}
var shape = Shape(name: "Walter White")
shape.numberOfSides = 7
print(shape.simpleDescription())
shape.sayMyName()

// Override
class Square: Shape {
  override func sayMyName() {
    print("I'm \(self.name)")
  }
}
let square = Square(name: "Pink")
square.sayMyName()

// Getter and Setter
class TestGetterSetter {
  var base = "UNTITLED"
  var name: String {
    get {
      return base
    }
    set {
      base = newValue.uppercased()
    }
  }
}
let test = TestGetterSetter()
print(test.name)
test.name = "test"
print(test.name)
