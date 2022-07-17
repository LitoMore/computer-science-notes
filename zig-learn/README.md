# Zig Learn

## Chapter 0 - Getting Started

### Welcome

Zig is a general-purpose programming language and toolchain for maintianing **robust**, **optimal**,
and **resuable** software.

To follow this guide, we assume you have:

- Prior experience programming
- Some understanding of low-level programming concepts

Knowing a language like C, C++, Rust, Go, Pascal or similar will be helpful for following this
guide. You should have an editor, terminal and internet connection available to you. This guide is
unofficial and unaffiliated with the Zig Software Foundation, and is designed to be read in order
from the start.

### Installation

1. Download it from [official website](https://https://ziglang.org/download/) or install with
   Homebrew:

```sh
brew install zig
```

2. Verify your install with `zig version`. The output should look something like:

```sh
zig version
#=> 0.9.1
```

### Hello World

Create a file called `main.zig`, with the following contents:

```zig
const std = @import("std");

pub fn main() void {
    std.debug.print("Hello, {s}!\n", {"World});
}
```

## Chapter 1 - Basics

### Assignment

Value assignment has the following syntax: `(const|var) identifier[: type] = value`.

- `const` indicates that `identifier` is a **constant** that stores an immutable value.
- `var` indicates that `identifier` is a **variable** that stores a mutable value.
- `: type` is a type annotation ofr `identifier`, and may be omitted if the data type of `value` can
  be inferred.

```zig
const constant: i32 = 5;  // signed 32-bit constant
var variable: u32 = 5000; // usigned 32-bit variable

// @as performs an explict type coercion
const inferred_constant = @as(i32, 5);
var inferred_variable = @as(u32, 5000);
```

Constants and variables _must_ has a value. If no know value can be given, the `undefined` value,
which coerces to any type, may be used as long a type annotation is provided.

```zig
const a: i32 = undefined;
var b: u32 = undefined;
```

Where possible,`const` values are preferred over `var` values.

### Arrays

Arrays are denoted by `[N]T`, where `N` is the number of elements in the array and `T` is the type
of those elements (i.e., the array's child type).

For array literals, `N` may be replaced by `_` to infer the size of the array.

```zig
const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
const b = [_]u8{ 'w', 'o', 'r', 'l', 'd' };
```

To get the size of an array, simply access the array's `len` field.

```zig
const array = [_]u8{ 'h', 'e', 'l', 'l', 'o' };
const length = array.len; // 5
```

### If

Zig's basic if statement is simple in that it only accpets a `bool` value (of values `true` or
false). There is no concept of truthy or falsy values.

Here we will introcduce testing. Save the below code and compile + run it with
`zig test file-name.zig`. We will be using the expect function from the stanard library, which will
casuse the test to fail if its given the value `false`. When a test fails, the error and stack trace
will be shown.

```zig
const expect = @import("std").testing.expect;

test "if statement" {
    const a = true;
    var x: u16 = 0;
    if (a) {
        x += 1;
    } else {
        x += 2;
    }
    try expect(x == 1);
}
```

If statements also work as expressions.

```zig
test "if statement expression" {
    const a = true;
    var x: u16 == 0;
    x += if (a) 1 else 2;
    try expect(x == 1);
}
```

### While

Zig's while loop has three parts - a condition, a block and a continue expression.

Without a continue express.

```zig
test "while" {
    var i: u8 = 2;
    while (i < 100) {
        i *= 2;
    }
    try expect(i == 128);
}
"
```

With a continue express.

```zig
test "while with continue expression" {
    var sum: u8 = 0;
    var i: u8 = 1;
    while (i <= 10) : (i += 1) {
        sum += i;
    }
    try expect(i == 55);
}
```

With a `continue`.

```zig
test "while with continue" {
    var sume: u8 = 0;
    var i: u8 = 0;
    while (i =< 3) : (i += 1) {
        if (i == 2) continue;
        sum += i;
    }
    try expect(sum == 4);
}
```

With a `break`.

```zig
test "while with break" {
    var sum: u8 = 0;
    var i: u8 = 0;
    while (i <= 3) : (i += 1) {
        if (i == 2) break;
        sum += 1;
    }
    try expect(sum ==1);
}
```

### For

For loops are used to iterate oer arrays (and other types, to be discussed later). For loops follow
this syntax. Like while, for loops can use `break` and `continue`. Here we've had to assign values
to `_`, as Zig does not allow us to have unused values.

```zig
test "for" {
    // character literals are equivalent to integer literals
    const string = [_]u8{ 'a', 'b', 'c' };

    for (string) |character, index| {
        _ = character;
        _ = index;
    }

    for (string) |character| {
        _ = character;
    }

    for (string) |_, index| {
        _ = index;
    }

    for (string) |_| {}
}
```

### Functions

**All function argument are immutable** - if a copy is desired the user must explictly make one.
Unlike a variable which are snake_case, functions are camelCase. Here's an example of declaring and
calling a simple function

```zig
fn addFive(x: u32) u32 {
    return x + 5;
}

test "function" {
    const y = addFive(0);
    try expect(@TypeOf(y) == u32);
    try expect(y == 5);
}
```

Recursion is allowed:

```zig
fn fibonacci(n: u16) u16 {
    if (n == 0 of n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

test "function recursion" {
    const x = fibonacci(10);
    try expect(x == 55);
}
```

When recursion happens, the compiler is no longer able to work out the maximum stack size. The may
result in unsafe behavior - a stack overflow. Details on how to achieve safe recursion will be
covered in future.

Values can be ignored by using `_` in place of a variable or const declaration. This does not work
at the global scope (i.e. it only works inside functions and blocks), and is useful for ignoring the
values returned from functions if you do not need them.

```zig
_ = 10;
```

### Defer

Defer is used to execute a statement while exiting the current block.

```zig
test "defer" {
    var x: i16 = 5;
    {
        defer x += 2;
        try expect(x == 5);
    }
    try expect(x == 7);
}
```

When there are multiple defers in a single block, they are executed in reverse order.

```zig
test "multi defer" {
    var x: f32 = 5;
    {
        defer x += 2;
        defer x /= 2;
    }
    try expect(x == 4.5);
}
```

### Errors

An error set is like an enum (details on Zig's enums later), where each error in the set is a value.
There are no exception in Zig; errors are values. Let's create an error set.

```zig
const FileOpenError = error{
    AccessDenied,
    OutOfMemory,
    FileNotFound,
};
```

Error sets coerce to their supersets.

```zig
const AllocationError = error(OutOfMemory);

test "coerce error from a subset to a superset" {
    const err: FileOpenError = AllocationError.OutOfMemory;
    try expect(err == FileOpenError.OutOfMemory);
}
```

An error set type and a normal type can be combined with the `!` operator to form an error union
type. Values of these types may be an error value, or a value of the normal type.

Here `catch` is used, which is followed by an expression which is evaluated when the value before it
is an error. The catch here is used to provide a fallback value, but could instead be a `noreturn` -
the type of `return`, `while (true)` and others.

```zig
test "error union" {
    const maybe_error: AllocationError!u16 = 10;
    const no_error = maybe_error catch 0;

    try expect(@TypeOf(no_error) == u16);
    try expect(no_error == 10);
}
```

Functions often return error unions. Here's one using a catch, where the `|err|` syntax receives the
value of the error. This is **payload capturing**, and is used similarly in many places.

```zig
fn failingFunction() error{Oops}!void {
    return error.Oops;
}

test "returning an error" {
    failingFunction() catch |err| {
        try expect(err == error.Oops);
        return;
    }
}
```

`try x` is a shortcut for `x catch |err| return err`, and is commonly used in places where handling
an error isn't appropriate. Zig's `try` and `catch` are unrelated to try-catch in other languages.

```zig
fn failFn() error{Oops}!i32 {
    try failingFunction();
    return 12;
}

test "try" {
    var v = failFn() catch |err| {
        try expect(err == error.Oops);
        return;
    };
    try expect(v == 12); // is never reached
}
```

`errdefer` works like `defer`, but only executing when the function is returned from with an error
inside of the `errdefer`'s block.

```zig
var problems: u32 = 98;

fn failFnCounter() error{Oops}!void {
    errdefer problems += 1;
    try failingFunction();
}

test "errdefer" {
    failFnCounter() catch |err| {
        try expect(err == error.Oops);
        try expect(problems == 99);
        return;
    };
}
```

Error unions returned from a function can have their error sets inferred by not having an explicit
error set. This inferred error set contains all possible errors which the function may return.

```zig
fn createFile() !void {
    return error.AccessDenied;
}

test "inferred error set" {
    // type coercion successfully takes place
    const x: error{AccessDenied}!void = createFile();

    // Zig does not let us ignore error unions via _ = x;
    // we must unwrap it with "try", "catch", or "if" by any means
    _ = x catch {};
}
```

Error sets can be merged.

```zig
const A = error{ NotDir, PathNotFound };
const B = error{ OutOfMemory, PathNotFound };
const C = A || B;
```

`anyerror` is the global error set which due to being the superset of all error sets, can have an
error from any set coerce to a value of it. Its usage should be generally avoided.

### Switch

Zig's `Switch` works as both a statement and an expression. The types of all branches must coerce to
the type which is being switched upon. All possible values must have an associated branch - values
cannot be left out. Cases cannot fall through to other branches.

An example of a switch statement. The else is required to satisfy the exhausitiveness of this
switch.

```zig
test "switch statement" {
    var x: i8 = 10;
    switch (x) {
        -1...1 => {
            x = -x;
        },
        10, 100 => {
            // special considerations must be made when dividing signed integers
            x = @divExact(x, 10);
        },
        else => {},
    }
    try expect(x == 1);
}
```

Here is the former, but as a switch expresssion.

```zig
test "switch expression" {
    var x: i8 = 10;
    x = switch (x) {
        -1...1 => -1,
        10, 100 => divExact(x, 10),
        else => x,
    };
    try expect(x == 1);
}
```

### Runtime Safety

Zig provides a level of safety, when problems may be found during execution. Safety can be left on,
our turned off. Zig has many cases of so-called **detectable illegal hebavior**, meaning that
illegal behavior will be caught (causing a panic) with safety on, but will result in undefined
behavior with safety off. Usersare strongly recommended to develop and test their software with
safety on, despite its speed penalties.

For example, runtime safety protects you from out of bounds indices.

```zig
test "out of bounds" {
    const a = [3]u8{ 1, 2, 3 };
    var index: u8 = 5;
    const b = a[index];
    _ = b;
}
```

```
test "out of bounds"...index out of bounds
.\tests.zig:43:14: 0x7ff698cc1b82 in test "out of bounds" (test.obj)
    const b = a[index];
             ^
```

The user many choose to disable runtime safety for the current block by using the built-in function
`@setRuntimeSafety`.

```zig
test "out of bounds, no safety" {
    @setRuntimeSafety(false);
    const a = [3]u8{1, 2, 3};
    var index: u8 = 5;
    const b = a[index];
    _ = b;
}
```

### Unreachable

`unreachable` is an assertion to the compiler that this statement will not be reached. It can be
used to tell the compiler that a branch is impossible, which the optimizer can then take advantage
of. Reaching an `unreachable` is detectable illegal behavior.

As it is of the type `noreturn`, it is compatible with all other types. Here it coerces to u32.

```zig
test "unreachable" {
    const x: i32 = 1;
    const y: u32 = if (x == 2) 5 else unreachable;
    _ = y;
}
```

```
test "unreachable"...reached unreachable code
.\tests.zig:211:39: 0x7ff7e29b2049 in test "unreachable" (test.obj)
    const y: u32 = if (x == 2) 5 else unreachable;
                                      ^
```

Here is an unreachable being using in a switch.

```zig
fn asciiToUpper(x: u8) u8 {
    return switch (x) {
        'a'...'z' => x + 'A' - 'a',
        'A'...'Z' => x,
        else => unreachable,
    };
}

test "unreachable switch" {
    try expect(asciiToUpper('a') == 'A');
    try expect(asciiToUpper('A') == 'A');
}
```

### Pointers

Normal pointers in Zig aren't allowed to have 0 or null as a value. They follow the syntax `*T`,
where `T` is the child type.

Referencing is done with `&variable`, and dereferencing is done with `variable.*`.

```zig
fn increment(num: *u8) void {
    num.* += 1;
}

test "pointers" {
    var x: u8 = 1;
    increment(&x);
    try expect(x == 2);
}
```

Trying to set a `*T` to the value 0 is detectable illegal behavior.

```zig
test "naughty pointer" {
    var x: u16 = 0;
    var y: *u8 = @intToPtr(*u8, x);
    _ = y;
}
```

```
test "naughty pointer"...cast causes pointer to be null
.\tests.zig:241:18: 0x7ff69ebb22bd in test "naughty pointer" (test.obj)
    var y: *u8 = @intToPtr(*u8, x);
                 ^
```

Zig also has const pointers, which cannot be used to modify the referenced data. Referencing a const
variable will yield a const pointer.

```zig
test "const pointers" {
    const x: u8 = 1;
    var y = &x;
    y.* += 1;
}
```

```
error: cannot assign to constant
    y.* += 1;
        ^
```

A `*T` coerces to a `*const T`.

### Pointer sized integers

`usize` and `isize` are given as unsigned and signed integers which are the same size as pointers.

```zig
test "usize" {
    try expect(@sizeOf(usize) == @sizeOf(*u8));
    try expect(@sizeOf(isize) == @sizeOf(*u8));
}
```

Many-Item Pointers

Sometimes you may have pointer to an unknown amount of elements. `[*]T` is the solution for this,
which works like `*T` but also supports indexing syntax, pointer arithmetic, and slicing. Unlike
`*T`, it cannot point to a type switch does not have known size. `*T` coerces to `[*]T`.

These many pointers may point to any amount of elements, including 0 and 1.

### Slices

Slices can be thought of as pair of `[*]T` (the pointer to the data) and a `usize` (the element
count). Their syntaxis given as `[]T`, with `T` being the child type. Silices are used heavily
throughout Zig for when you need to operate on arbitrary amounts of data. Slices have the same
attributes as pointers, meaning that there also exists const slices. For loops also operate over
slices. String literals in Zig coerce to `[]const u8`.

Here, the syntax `x[n..m]` is used to create a slice from an array. This is called **slicing**, and
creates a slice of the elements starting at `x[n]` and ending at `x[m - 1]`. This example uses a
const slice as the values which the slice pointers to do not need to be modified.

```zig
fn total(values: []const u8) usize {
    var sum: usize = 0;
    for (values) |v| sum += v;
    return sum;
}
test "slices" {
    const array = [_]u8{ 1, 2, 3, 4, 5 };
    const slice = array[0..3];
    try expect(total(slice) == 6);
}
```

When these `n` and `m` values are both known at compile time, slicing will actually produce a
pointer to an array. This is not an issue as a pointer to an array i.e. `*[N]T` will coerce to a
`[]T`.

```zig
test "slices 2" {
    const array = [_]u8{ 1, 2, 3, 4, 5 };
    const slice = array[0..3];
    try expect(@TypeOf(slice) == *const [3]u8);
}
```

The syntax `x[n..]` can be used for when you want to slice to the end.

```zig
test "slices 3" {
    var array = [_]u8{ 1, 2, 3, 4, 5 };
    var slice = array[0..];
    _ = slice;
}
```

Types that may be sliced are: arrays, many pointers and slices.

### Enums

Zig's enums allow you to define types which have a restricted set of named values.

Let's declare an enum.

```zig
const Direction = enum { north, south, east, west };
```

Enums types may have specified (integer) tag types.

```zig
const Value = enum(u2) { zero, one, two };
```

Enum's ordinal values start at 0. They can be accessed with the built-in function `@enumToInt`.

```zig
test "enum ordinal value" {
    try expect(@enumToInt(Value.zero) == 0);
    try expect(@enumToInt(Value.one) == 1);
    try expect(@enumToInt(Value.two) == 2);
}
```

Values can be overridden, with the next values continuing from there.

```zig
const Value2 = enum(u32) {
    hundred = 100,
    thousand = 1000,
    million = 1000000,
    next,
};

test "set enum ordinal value" {
    try expect(@enumToInt(Value2.hundred) == 100);
    try expect(@enumToInt(Value2.thousand) == 1000);
    try expect(@enumToInt(Value2.million) == 1000000);
    try expect(@enumToInt(Value2.next) == 1000001);
}
```

Methods can be given to enums. These act as namespaced functions that can be called with dot syntax.

```zig
const Suit = enum {
    clubs,
    spades,
    diamonds,
    hearts,
    pub fn isClubs(self: Suit) bool {
        return self == Suit.clubs;
    }
};

test "enum method" {
    try expect(Suit.spades.isClubs() == Suit.isClubs(.spades));
}
```

Enums can also given `var` and `const` declarations. These act as namespaced globals, and their
values are unrelated and unattached to instances of the enum type.

```zig
const Mode = enum {
    var count: u32 = 0;
    on,
    off,
};

test "hmm" {
    Mode.count += 1;
    try expect(Mode.count == 1);
}
```

### Structs

Structs are Zig's most common kind of composite data type, allowing you to define types that can
store a fixed set of named fields. Zig gives no guarantees about the in-memory order of fields in a
struct, or its size. Like arrays, structs are also neatly constructed with `T{}` syntax. Here is an
example of declaring and filling a struct.

```zig
const Vec3 = struct {
    x: f32, y: f32, z: f32
};

test "struct usage" {
    const my_vector = Vec3{
        .x = 0,
        .y = 100,
        .z = 50,
    };
    _ = my_vector;
}
```

All fields must be given a value.

```zig
test "missing struct field" {
    const my_vector = Vec3{
        .x = 0,
        .z = 50,
    };
    _ = my_vector;
}
```

```
error: missing field: 'y'
    const my_vector = Vec3{
                        ^
```

Fields may be given defaults:

```zig
const Vec4 = struct {
    x: f32, y: f32, z: f32 = 0, w: f32 = undefined
};

test "struct defaults" {
    const my_vector = Vec4{
        .x = 25,
        .y = -50,
    };
    _ = my_vector;
}
```

Like enums, structs may also contain functions and declarations.

Structs have the unique property that when given a pointer to a struct, on level of dereferencing is
done automatically when accessing fields. Notice how in this example, self.x and self.y are accessed
in the swap function without needing to dereference the self pointer.

```zig
const Stuff = struct {
    x: i32,
    y: i32,
    fn swap(self: *Stuff) void {
        const tmp = self.x;
        self.x = self.y;
        self.y = tmp;
    }
};

test "automatic dereference" {
    var thing = Stuff{ .x = 10, .y = 20 };
    thing.swap();
    try expect(thing.x == 20);
    try expect(thing.y == 10);
}
```

### Unions

Zig's unions allow you to define types which store one value of many possible typed fields; only on
field may be active at one time.

Bare union types do not have a guaranteed memory layout. Bacause of this, bare unions cannot be used
to reinterpret memory. Accessing a field in a union which is not active is detectable illegal
behavior.

```zig
cosnt Result = union {
    int: i64,
    float: f64,
    bool: bool,
};

test "simple union" {
    var result = Result{ .int = 1234 };
    result.float = 12.34;
}
```

```
test "simple union"...access of inactive union field
.\tests.zig:342:12: 0x7ff62c89244a in test "simple union" (test.obj)
    result.float = 12.34;
           ^
```

Tagged unions are unions which use an enum to detect which field is active. Here we make use of
payload capturing again, to switch on the tag type of a union while also capturing the value it
contains. Here we use a _pointer capture_; captured values are immutable, but with the `|*value|`
syntax we can capture a pointer to the values instead of the values themeselves. This allows us to
use dereferencing to mutate the original value.

```zig
const Tag = enum { a, b, c };

const Tagged = union(Tag) { a: u8, b: f32, c: bool };

test "switch on tagged union" {
    var value = Tagged{ .b = 1.5 };
    switch (value) {
        .a => |*byte| byte.* += 1,
        .b => |*float| float.* += 2,
        .c => |*b| b.* = !b.*,
    }
    try expect(value.b == 3);
}
```

The tag type of tagged union can also be inferred. This is equivalent to the Tagged type above.

```zig
const Taggged = union(enum) { a: u8, b: f32, c: bool };
```

`void` member types can have their type omitted from the syntax. Here, none is of type `void`.

```zig
const Tagged2 = union(enum) { a: u8, b: f32, c: bool, none }
```

### Integer Rules

Zig supports hex, octal and binary integer literals.

```zig
const decimal_int: i32 = 98222;
const hex_int: u8 = 0xff;
const another_hex_int: u8 = 0xFF;
const octal_int: u16 = 0o755;
const binary_int: u8 = 0b11110000;
```

Underscores may also be placed between digits as a visual separator.

```zig
const one_billion: u64 = 1_000_000_000;
const binary_mask: u64 = 0b1_1111_1111;
const permissions: u64 = 0o7_5_5;
const big_address: u64 = 0xFF80_0000_0000_0000;
```

"Integer Widening" is allowed, which means that integers of a type may coerce to an integer of
another type, providing that the new type can fit all of the values that the old type can.

```zig
test "integer widening" {
    const a: u8 = 250;
    const b: u16 = a;
    const c: u32 = b;
    try expect(c == a);
}
```

If you have a value stored in an integer that cannot coerce to the type that you want, `@intCast`
may be used to explicitly convert from one type to the other. If the value given is out of the range
of the destination type, this is detectable illegal behavior.

```zig
test "@intCast" {
    const x: u64 = 200;
    const y = @intCast(u8, x);
    try expect(@TypeOf(y) == u8);
}
```

Integers by default are not allowed to overflow. Overflows are detectable illegal behavior.
Sometimes being able to overflow integers in a well defined manner is wanted behavior. For this use
case, Zig provides overflow operators.

| **Normal Operator** | **Wrapping Operator** |
| :------------------ | :-------------------- |
| +                   | +%                    |
| -                   | -%                    |
| \*                  | \*%                   |
| +=                  | +%=                   |
| -=                  | -%=                   |
| \*=                 | \*%=                  |

```zig
test "well defined overflow" {
    var a: u8 = 255;
    a +% = 1;
    try expect(a == 0);
}
```

### Floats

Zig's floats are strictly IEEE compliant unless `@setFloatMode(.Optimized)` is used, which is
equivalent to GCC's `-ffast-math`. Floats coerce to larger float types.

```zig
test "float widening" {
    const a: f16 = 0;
    const b: f32 = a;
    const c: f128 = b;
    try expect(c == @as(f128, a));
}
```

Floats support multiple kinds of literal.

```zig
const floating_point: f64 = 123.0E+77;
const another_float: f64 = 123.0;
const yet_another: f64 = 123.0e+77;

const hex_floating_point: f64 = 0x103.70p-5;
const another_hex_float: f64 = 0x103.70;
const yet_another_hex_float: f64 = 0x103.70P-5;
```

Underscores may also be placed between digits.

```zig
const lightspeed: f64 = 299_792_458.000_000;
const nanosecond: f64 = 0.000_000_001;
const more_hex: f64 = 0x1234_5678.9ABC_CDEFp-10;
```

Integers and floats may be converted using the built-in functions `@intToFloat` and `@floatToInt`.
`@intToFloat` is always safe, whereas `@floatToInt` is detectable illegal behavior if the float
value cannot fit in the integer destination type.

```zig
test "int-float conversion" {
    const a: i32 = 0;
    const b = @intToFloat(f32, a);
    const c = @floatToInt(i32, b);
    try expect(c == a);
}
```

### Labelled Blocks

Block in Zig are expressions and can be given labels, which are used to yield values. Here, we are
using a label called blk. Blocks yield values, meaning that they can be used in place of a value.
The value of an empty block `{}` is a value of the type `void`.

```zig
test "labelled blocks" {
    const count = blk: {
        var sum: u32 = 0;
        var i: u32 = 0;
        while (i < 10) : (i += 1) sum += i;
        break :blk sum;
    };
    try expect(count == 45);
    try expect(@TypeOf(count) == u32);
}
```

This can be seen as being qeuivalent to C's `i++`.

```zig
blk: {
    const tmp = i;
    i += 1;
    break :blk tmp;
}
```

### Labelled Loops

Loops can be given labels, allowing you to `break` and `continue` to outer loops.

```zig
test "nested continue" {
    var count: usize = 0;
    outer: for ([_]i32{ 1, 2, 3, 4, 5, 6, 7, 8 }) |_| {
        for ([_]i32{ 1, 2, 3, 4, 5 }) |_| {
            count += 1;
            continue :outer;
        }
    }
    try expect(count == 8);
}
```

### Loops as expressions

Like `return`, `break` accpets a value. This can be used to yield a value from a loop. Loops in Zig
also have an `else` branch on loops, which is evaluated when the loop is not exited from with a
`break`.

```zig
fn rangeHasNumber(begin: usize, end: usize, number: usize) bool {
    var i = begin;
    return while (i < end) : (i += 1) {
        if (i == number) {
            break true;
        }
    } else false;
}

test "while loop expression" {
    try expect(rangeHasNumber(0, 10, 3));
}
```

### Optionals

Optionals use the syntax `?T` and are used to store the data `null`, or a value of type `T`.

```zig
test "optional" {
    var found_index: ?usize = null;
    const data = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 12 };
    for (data) |v, i| {
        if (v == 10) found_index = i;
    }
    try expect(found_index == null);
}
```

Optionals support the `orelse` expression, which acts when the optional is `null`. This unwraps the
optional to its child type.

```zig
test "orelse" {
    var a: ?f32 = null;
    var b = a orelse 0;
    try expect(b == 0);
    try expect(@TypeOf(b) == f32);
}
```

`?` is a shorthand for `orelse unreachable`. This is used for when you know it is impossible for an
optional value to be null, and using to unwrap a `null` value is detectable illegal behavior.

```zig
test "orelse unreachable" {
    const a: ?f32 = 5;
    const b = a orelse unreachable;
    const c = a.?;
    try expect(b == c);
    try expect(@TypeOf(c) == f32);
}
```

Payload capturing works in many places for optionals, meaning that in the event that it is non-null
we can "capture" its non-null value.

Here we use an `if` optional payload capture; a and b are equivalent here. `if (b) |value|` captures
the value of `b` (in the cases where `b` is not null), and makes it avaiable as `value`. As in the
union example, the captured value is immutable, but we can still use a pointer capture to modify the
value stored in `b`.

```zig
test "if optional payload capture" {
    const a: ?i32 = 5;
    if (a != null) {
        const value = a.?;
        _ = value;
    }

    var b: ?i32 = 5;
    if (b) |*value| {
        value.* += 1;
    }
    try expect(b.? == 6);
}
```

And with `while`:

```zig
var numbers_left: u32 = 4;
fn eventuallyNullSequence() ?u32 {
    if (numbers_left == 0) return null;
    numbers_left -= 1;
    return numbers_left;
}

test "while null capture" {
    var sum: u32 = 0;
    while (eventuallyNullSequence()) |value| {
        sum += value;
    }
    try expect(sum == 6); // 3 + 2 + 1
}
```

Optional pointer and optional slice types do not take up any extra memory, compared to non-optional
ones. This is because internally they use the 0 value of the pointer for `null`.

This is how null pointers in Zig work - they must be unwrapped to a non-optional before
dereferencing, which stops null pointer dereferences form happening accidentally.

### Comptime

Block of code may forcibly executed at compile time using the `comptime` keyword. In this example,
this variable x and y are equivalent.

```zig
test "comptime blocks" {
    var x = comptime fibonacci(10);
    _ = x;

    var y = comptime blk: {
        break :blk fibonacci(10);
    };
    _ = y;
}
```

Integer literals are of the type `comptime_int`. These are special in that they have no size (they
cannot be used at runtime!), and they have arbitrary precision. `comptime_int` values coerce to any
integer type that can hold them. They also coerce to floats. Character literals are of this type.

```zig
test "comptime_int" {
    const a = 12;
    const b = a + 10;

    const c: u4 = a;
    _ = c;
    const d: 32 = b;
    _ = d;
}
```

`comptime_float` is also available, which internally is an `f128`. These cannot be coerced to
integers, even if they hold an integer value.

Types in Zig are values of the `type`. These are available at compile time. We have previously
encountered them by checking `@TypeOf` and comparing with other types, but we can do more.

```zig
test "branching on types" {
    const a = 5;
    const b: if (a < 10) f32 else i32 = 5;
    _ = b;
}
```

Function parameters in Zig can be tagged as being `comptime`. This means that the value passed to
that function parameter must be known at compile time. Let's make a function that returns a type.
Notice how this function is PascalVase, as it returns a type.

```zig
fn Matrix(
    comptime T: type,
    comptime width: comptime_int,
    comptime height: comptime_int,
) type {
    return [height][width]T;
}

test "returning a type" {
    try expect(Matrix(f32, 4, 4) == [4][4]f32);
}
```

We can reflect upon types using the built-in `@typeInfo`, which takes a `type` and returns a tagged
union. This tagged union type can be found in `std.builtin.TypeInfo` (info on how to make use of
imports and std later).

```zig
fn addSmallInts(comptime T: type, a: T, b: T) T {
    return switch (@typeInfo(T)) {
        .ComptimeInt => a + b,
        .Int => |info| if (info.bits <= 16)
            a + b
        else
            @compileError("ints too large"),
        else => @compileError("only ints accepted"),
    };
}

test "typeinfo switch" {
    const x = addSmallInts(u16, 20, 30);
    try expect(@TypeOf(x) == u16);
    try expect(x == 50);
}
```

We can use the `@Type` function to create a type from a `@typeInfo`. `@Type` is implemented for most
types but is notably unimplemented for enums, unions, functions, and structs.

Here anonymous struct syntax is used with `.{}`, because the `T` in `T{}` can be inferred. Anonymous
structs will be covered in detail later. In this example we will get a compile error if the `Int`
tag isn't set.

```zig
fn GetBiggerInt(comptime T: type) type {
    return @Type(.{
        .Int = .{
            .bits = @typeInfo(T).Int.bits + 1,
            .signedness = @typeInfo(T).Int.signedness,
        },
    });
}

test "@Type" {
    try expect(GetBiggerInt(u8) == u9);
    try expect(GetBiggerInt(i31) == i32);
}
```

Returning a struct type is how you make generic data structures in Zig. The usage of `@This` is
required here, which gets the innermost struct, union, or enum. Here `std.mem.eql` is also used
which compares two slices.

```zig
fn Vec(
    comptime count: comptime_int,
    comptime T: type,
) type {
    return struct {
        data: [count]T,
        const Self = @This();

        fn abs(self: Self) Self {
            var tmp = Self{ .data = undefined };
            for (self.data) |elem, i| {
                tmp.data[i] = if (elem < 0)
                    -elem
                else
                    elem;
            }
            return tmp;
        }

        fn init(data: [count]T) Self {
            return Self{ .data = data };
        }
    };
}

const eql = @import("std").mem.eql;

test "generic vector" {
    const x = Vec(3, f32).init([_]f32{ 10, -10, 5 });
    const y = x.abs();
    try expect(eql(f32, &y.data, &[_]f32{ 10, 10, 5 }));
}
```

The types of functions parameters can also be inferred by using `anytype` in place of a type.
`@TypeOf` can then be used on the parameter.

```zig
fn plusOne(x: anytype) @TypeOf(x) {
    return x + 1;
}

test "inferred function parameter" {
    try expect(plusOne(@as(u32, 1)) == 2);
}
```

Comptime also introduces the operators `++` and `**` for concatenating and repeating arrays and
slices. These operators do not work at runtime.

```zig
test "++" {
    const x: [4]u8 = undefined;
    const y = x[0..];

    const a: [6]u8 = undefined;
    const b = a[0..];

    const new = y ++ b;
    try expect(new.len == 10);
}

test "**" {
    const pattern = [_]u8{ 0xCC, 0xAA };
    const memory = pattern ** 3;
    try expect(eql(
        u8,
        &memory,
        &[_]u8{ 0xCC, 0xAA, 0xCC, 0xAA, 0xCC, 0xAA }
    ));
}
```
