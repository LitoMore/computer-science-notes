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
