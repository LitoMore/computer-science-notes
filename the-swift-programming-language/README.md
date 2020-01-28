# The Swift Programming Language

## Welcome to Swift

### About Swift

Swift defines away large classes of common programming errors by adoping modern programming
patterns:

- Variables are always initialized before use
- Array indices are checked for out-of-bounds errors
- Integers are checked for overflow
- Optionals ensure that `nil` values are handled explicitly
- Memory is managed automatically
- Error handling allows controlled recovery from unexpected failures

### A Swift Tour

Code written at global scope is used as the entry point for the program, so you don't need a
`main()` function. You also don't need to write semicolons at the end of every statement.

#### Simple Values

A constant or variable must have the type as the value you want to assign to it.

If the initial value doesn't provide enough information (or if there is no initial value),
specify the type by writing the variable, separated by a colon.

Values are never implicitly converted to another type If you need to convert a value to a
different type, explicitly make an instance of the desired type.

#### Control Flow

Write a question mark (`?`) after the type of value to mark the value as optional.

If the optional value is `nil`, the conditional is `false` and the code in braces is skipped.

Another way to handle optional values is to provide a default value using the `??` operator.

#### Functions and Closures

Use `->` to separate the parameter names and types from the function's return type.

By default, functions use their paramenter names as labels for their arguments. Write a custom
argument label before the parameter name, or write `_` to use no argument label.

- Use a tuple to make a compounted value
- Functions can be nested
- Functions are a first-class type
- A function can take another function as one of its arguments
- Functions are actually a special case of closures

#### Object and Classes

A property declaration in a class is written the same way as a constant or variable declaration.

Create an instance of class by putting parentheses after the class name.

- Use `init` to create an initializer to set up the class when an instance is created.
- Use `deinit` to create a deinitializer if you need to perform some cleanup before the object is
  deallocated.
- Subclasses include their superclass name after their class name, separated by a colon.
- Methods on a subclass that override the superclass's implementation are marked with `override`.
- Properties can have a getter and as setter. The new value has implicit name `newValue`.
- If you don't need to compute the property but still need to provide code that is run before and
  after setting a new value, use `willSet` and `didSet`.
