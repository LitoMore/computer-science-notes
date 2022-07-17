# The Swift Programming Language

Excerpt From The Swift Programming Language Apple Inc.

https://books.apple.com/us/book/id881256329

This material may be protected by copyright.

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

If the initial value doesn't provide enough information (or if there is no initial value), specify
the type by writing the variable, separated by a colon.

Values are never implicitly converted to another type If you need to convert a value to a different
type, explicitly make an instance of the desired type.

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

#### Enumerations and Structures

By default, Swift assigns the raw values starting at zero and incrementing by one each time, but you
can change this behavior by explicitly specifying values.

Use the `init?(rawValue:)` initializer to make an instance of an enumeration from a raw value.

If an enumeration has raw values, those values are determined as part of the declaration, which
means every instance of a particular enumeration case always has the same raw value.

Use `struct` to create a strucure. Structures support many of the same behaviors as classes,
including methods and initializers.

#### Protocols and Extensions

Classes, enumerations, and structs can all adopts protocols.

The declaration of `SimpleClass` doesn't need any of its methods marked as mutating because methods
on a class can always modify the class.

Use `extension` to add functionality to an existing type, such as new methods and computed
properties.

You can use a protocol name just like any other named type.

#### Error Handling

Use `throw` to throw an error and `throws` to mark a function that can throw an error.

You can provide multiple `catch` blocks that handle specific errors.

Another way to handle errors is to use `try?` to convert the result to an optional.

Use `defer` to write a block of code that is executed after all other code in the function, just
before the function returns.

#### Generics

You can make generic forms of functions and methods, as well as classes, enumerations, and
structures.

Use `where` right before the body to specify a list of requirements.

## Language Guide

### The Basics

Swift provides its own versions of all fundamental C and Objective-C types, including `Int` for
integers, `Double` and `Float` for floating-point values, `Bool` for Boolean values, and `String`
for textual data. Swift also provides powerful versions of the three primary collection type,
`Array`, `Set`, and `Dictionary`, as decribed in `Collection Types`.

Swift also introduces optional types, which handle the absence of a value. Optionals say either
"there is a value, and it equals x" or "there isn't a value at all". Using optionals is similar to
using `nil` with pointers in Objective-C, but they work for any type, not just classes. Not only are
optionals safer and more expressive than `nil` pointers in Objective-C, they’re at the heart of many
of Swift’s most powerful features.

Swift is a type-safe language, which means the language helps you to be clear about the types of
values your code can work with. If part of your code requires a `String`, type safety prevents you
from passing it an `Int` by mistake. Likewise, type safety prevents you from accidentally passing an
optional `String` to a piece of code that requires a non-optional `String`. Type safety helps you
catch and fix errors as early as possible in the development process.

#### Constants and Variables

Constants and variables associate a name (such as `maximumNumberOfLoginAttempts` or
`welcomeMessage`) with a value of particular type (such as the number `10` or the string `"Hello"`).
The value of a _constant_ can't be chagned once it's set, whereas a _variable_ can be set to a
different value in the future.

##### Declaring Constants and Variables

Constants and variabes msut be declared before they're used. You declare constants with the `let`
keyword and variables with the `var` keyword.

If a stored value in your code won't change, always declare it as a constant with the `let` keyword.
Use variables only for storing values that need to be able to change.

##### Type Annotations

You can provide a _type annotation_ when you declare a constant or variable, to be clear about the
kind of values the constant or variable can store. Write a type annotation by placing a colon after
the constant or variable name, followed by a space, followed by the name of the type to use.

It's rare that you need to write type annotations in practice. If you provide an initial value for a
constant or variable at the point that it's defined, Swift can almost always infer the type to be
used for that constant or variable, as described in **Type Safety and Type Inference**. In the
`welcomeMessage` example above, no initial value is provided, and so the type of the
`welcomeMessage` variable is specified with a type annotation rather than being inferred from an
initial value.

##### Naming Constants and Variables

If you need to give a constant or variable the same name as a reserved Swift keyword, surround the
keyword with backticks (`` ` ``) when using it as a name. However, avoid using keywords as names
unless you have absolutely no choice.
