# The Rust Programming Language

Excerpt From The Rust Programming Language

https://doc.rust-lang.org/book/

This material may be protected by copyright.

## Introduction

### How to Use This Book

There is no wrong way to read this book: if you want to skip ahead, go for it! You might have to
jump back to earlier chapters if you experience any confusion. But do whatever works for you.

## Getting Started

### Hello, World!

#### Anatomy of a Rust Program

1. Fisrt, Rust style is to indent with four spaces, not a tab
2. Second, `println!` calls a Rust macro. Using a `!` means that you're calling a macro instead of a
   normal function
3. Third, we pass this string as an argument to `println!`
4. Fourth, we end the line with a semicolon (`;`)

#### Compiling and Running Are Separate Steps

When using Windows, a file containing debugging information with the _.pdb_ extension.

Rust is an _ahead-of-time compiled_ language.

### Hello Cargo!

Cargo comes installed with Rust if you used the official installers discussed in the "Installation"
section.

#### Creating a Project with Cargo

It has also initialized a new Git respository along with a _.gitignore_ file. (Git files will not be
generated if they are already in a Git repository.)

Cargo expects your source file to live inside the _src_ directory. The top-level project directory
is just for README files, license information, configuration files, and anything else not related to
your code.

#### Building and Running a Cargo Project

_Cargo.lock_ keeps track of the exact versions of dependencies in your project.

We can also use `cargo run` to compile the code and then run the resulting executable all in one
command.

Cargo figured out that the files hadn't changed, so it just ran the binary.

Cargo also provides a command called `cargo check`. This command quickly checks your code to make
sure it compiles but doesn't produce an executable.

- We can build a project using `cargo build` or `cargo check`
- We can build and run a project in one step using `cargo run`
- Instead of saving the result of the build in the same directory as our code, Cargo stores it in
  the _target/debug_ directory

#### Building for Release

You can use `cargo build --release` to compile it with optimizations.

### Summary

- Install the latest stable version of Rust using `rustup`
- Update to a newer Rust version
- Open locally installed documentation
- Write and run a "Hello, world!" program using `rustc` directly
- Create and run a new project using the conventions of Cargo

## Programming a Guessing Game

### Processing a Guess

#### Storing Values with Variables

Some languages call this a _static method_.

This `&` indicates that this arguments is a _reference_, which gives you a way to let multiple parts
of your code access one piece of data without needing to copy that data into memory multiple times.

#### Handling Potential Failure with the `Reuslt` Type

Rust warns that you haven't used the `Result` value returned from `read_line`, indicating that the
program hasn't handled a possible error.

### Generating a Secret Number

#### Using a Crate to Get More Functionality

Ensuring reproducible builds with the _Cargo.lock_ file.

## Common Programming Concepts

### Variables and Mutability

Even though compiler errors can be frustrating, they only mean your program isn't safely doing what
you want it to do yet; they do not mean that you're not a good programmer! Experienced Rustaceans
still get compiler errors.

You can make them mutable by adding `mut` in front of the variable name.

#### Differences Between Variables and Constants

First, you aren't allowed to use `mut` with constants. Constants aren't just immutable by default --
they're always immutable.

YOu declare constants using the `const` keyword instead of the `let` keyword, and the type of the
value _must_ be annotated.

Constants can be declared in any scope, including the global scope, which make them useful for
values that many parts of code need to know about.

Constants may be set only to a constant expression, not the result of a function call or any other
value that could only be computed at runtime.

#### Shadowing

We'll get a compile-time error if we accidentally try to reassign to this variable without using the
`let` keyword.

We can change the type of the value but reuse the same name.

### Data Types

Keep in mind that Rust is a _statically typed_ language, which means that it must know the types of
all variables at compile time.

#### Scalar Types

Rust has four primary scalar types: integers, floating-point number, Booleans, and characters.

##### Integer Types

Signed integer types start with `i`, instead of `u`.

Integer types default to `i32`.

When you're compiling in debug mode, Rust includes checks for integer overflow that cause your
program to _panic_ at runtime if this behavior occurs.

When you're compiling in release mode with the `--release` flag, Rust does _not_ include checks for
integer overflow that cause panics.

##### Floating-Point Types

Rust's floating-point types are `f32` and `f64`.

The default type if `f64` because on modern CPUs it's roughly the same speed as `f32` but is capable
of more precision.

##### The Character Type

Accented letters; Chinese, Japanese, and Korean characters; emoji; and zero-width spaces are all
valid `char` values in Rust.

#### Compound Types

##### The Tuple Type

Tuples have a fixed length: once declared, they cannot grow or shrink in size.

We can use pattern matching to destructure a tuple value.

We can access a tuple element directly by using a period (`.`) followed by the index of the value we
want to access.

##### The Array Type

Arrays is Rust are different from arrays in some other languages because arrays in Rust have a fixed
length, like tuples.

The compilation didn't produce any errors, but the program resulted in a _runtime_ error and didn't
exit successfully.

In many low-level languages, this kind of check is not done, and when you provide an incorrect
index, invalid memory can be accessed.

### Functions

Rust doesn't care where you define your functions, only that they're defined somewhere.

#### Function Parameters

Requiring type annotations in function definitions means the compiler almost never needs you to use
them elsewhere in the code figure out what you mean.

#### Function Bodies Contain Statements and Expressions

Calling a function is an expression. Calling a macro is an expression.

### Control Flow

#### `if` Expressions

It's also worth nothing that the condition in this code _must_ be a `bool`.

Rust will not automatically try to convert non-Boolean types to a Boolean.

##### Using `if` in a `let` Statement

This means the values that have the potential to be results from each arm of the `if` must be the
same type.

Rust needs to know at compile time what type the `number` variable is, definitively, so it can
verify at compile time that its type is valid everywhere we use `nubmer`. Rust wouldn't be able to
do that if the type of `number` was only determined at runtime; the compiler would be more complex
and would make fewer guarantees about the code if it had to keep track of multiple hypothetical
types for any variable.

#### Repetition with Loops

Rust has three kinds of loops: `loop`, `while`, and `for`.

##### Returning Values from Loops

After the loop, we use a semicolon to end the statement that assigns the value to `result`.

## Understanding Ownership

### What Is Ownership?

Rust's central feature is _ownership_.

Rust uses a third approach: memory is managed through a system of ownership with a set of rules that
the compiler checks at compile time.

#### The Stack and the Heap

Pushing values onto the stack is not considered allocating. Because the pointer is a known, fixed
size, you can strore the pointer on the stack, but when you want the actual data, you must follow
the pointer.

Pushing to the stack is faster then allocating on the heap because the operating system never has to
search for a place to store new data; that location is always at the top of the stack.

Accessing data in help is slower than accessing data on the stack because you have to follow a
pointer to get there.

When your code calls a function, the values passed into the function (including, potentially,
pointers to data on the heap) and the function's local variables get pushed on the stack. When the
function is over, those values get popped off the stack.

#### Ownership Rules

- Each value in Rust has a variable that's called its owner
- There can only be one owner at a time
- When the owner goes out of scope, the value will be dropped

#### Variable Scope

The variable is valid from the point at which it's declared until the end of the current _scope_.

#### The `String` Type

One reason is that String literals are immutable. Another is that not every string value can be
known when we write out code.

#### Memory and Allocation

That first part is done by us: when we call `String::from`, its implementation requests the memory
it needs.

The memory is automatically returned once the variable that owns it goes out of scope.

Rust calls `drop` automatically at the closing curly bracket.

##### Ways Variables and Data Interact: Move

The length is how much memory, in bytes, the contents of the `String` in currently using. The
capacity is the total amount of memory, in bytes, that the `String` has received from the operating
system.

Rust also invalidates the first variable, instead of being called a shallow copy, it's known as a
_move_.

Rust will never automatically create "deep" copies of your data.

##### Stack-Only Data: Copy

Rust won't let us annotate a type with the `Copy` trait if the type, or any of its parts, has
implemented the `Drop` trait.

Here are some of the types that are `Copy`:

- All the integer types, such as `u32`
- The Boolean type, `bool`, with values `true` and `false`
- All the floating point types, such as `f64`
- The character type, `char`
- Tuples, if they only contain types that are also `Copy` (`(i32, i32)` is copy, but `(i32, String)`
  is not)

#### Ownership and Functions

Passing a variable to a function will move or copy, just as assignment does.

#### Return Values and Scope

The ownership of a variable follows the same pattern every time: assigning a value to another
variable moves it. When a variable that includes data on the heap goes out of scope, the value will
be cleaned up by `drop` unless the data has been moved to be owned by another variable.

### References and Borrowing

_References_ allow you to refer to some value without taking ownership of it.

The opposite of referencing by using `&` is _dereferencing_, which is a accomplished with the
dereference operator, `*`.

When functions have references as parameters instead of the actual values, we won't need to return
the values in order to give back ownership, because we never had ownership.

We call having references as function parameters _borrowing_.

Just as variables are immutable by default, so are references. We're not allowed to modify something
we have a reference to.

#### Mutable References

But mutable references have one big restriction: you can have only one mutable reference to a
particular piece of data in a particular scope.

A _data race_ is similar to a race condition and happens when these three behaviors occur:

- Two or more pointer access the same data at the same time
- At least one of the pointers is being used to write to the data
- There's no mechanism being used to synchronize access to the data

We _also_ cannot have a mutable reference while we have an immutable one.

Note that a reference's scope starts from where it is introduced and continues through the last time
that reference is used.

#### Dangling References

In Rust, by contrast, the compiler guarantees that references will never be dangling references.

#### The Rules of References

- At any given time, you can have _either_ one mutable reference _or_ any number of imuutable
  references
- References must always be valid

### The Slice Type

Another data type that not have ownership is the _slice_. Slices let you reference a contiguous
sequence of elements in a collection rather than the whole collection.

#### String Slices

Note: String slice range indices must occur at valid UTF-8 character boundarias. If you attempt to
to create a string slice in the middle of a multibyte character, your program will exit with an
error. For the purposes of introducing string slices, we are assuming ASCII only in this section; a
more thorough discussion of UTF-8 handling is in the "Storing UTF-8 Encoded Text with Strings"
section of Chapter 8.

### Summary

The concepts of ownership, borrowing, and slices ensure memory safety in Rust programs at compile
time. The Rust language gives you control over your memory usage in the same way as other systems
programming languages, but having the owner of data automatically clean up that data when the owner
goes out of scope means you don't have to write and debug extra code to get this control.

## Using Structs to Structure Related Data

### Defining and Instantiating Structs

The define a struct, we enter the keyword `struct` and name the entire struct. A struct's name
should describe the significance of the pieces of data being grouped together. Then, inside curly
brackets, we define the names and types of the pieces of data, which we call _fields_.

```rust
struct User {
    username: String,
    email: String,
    sign_in_count: u64,
    active: bool,
}
```

To use a struct after we've defined it, we create an _instance_ of that struct by specifying
concrete values for each of fields. We create an instance by stating the name of the struct and then
add curly brackets containing `key: value` pairs, where the keys are the names of the fields and the
values are the data we want to store in those fields. We don't have to specify the fields in the
same order in which we declared them in the struct.

```rust
let user1 = User {
    email: String::from("someone@example.com"),
    username: String:from("someusername123"),
    active: true,
    sign_in_count: 1,
};
```
