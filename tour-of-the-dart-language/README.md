# Tour of the Dart language

## Important concepts

- Everything you can place in a variable is an _Object_, and every _Object_ is an instance of a
  _class_. Even numbers, functions, and `null` are objects. All objects inherit from the [Object][0]
  class
- Although Dart is strongly typed, annotations are optional because Dart can infer types. In the
  code above, `nunber` is inferred to be of type `init`. When you want to explicitly say that no
  type is expected, [use the special type dynamic][1]
- Dart supports generic types, like `List<int>` (a list of integers) or `List<dynamic>` (a list of
  any type)
- Dart supports top-level functions (such as `main()`), as well as functions tied to class or object
  (_static_ and _instance methods_, respectively). You can also create functions within functions
  (_nested_ or _local functions_)
- Similarly, Dart supports top-level _variables_, as well as variables tied to a class or a object
  (static and instance variables). Instance variables are sometimes known as fields or propeties
- Unlike Java, Dart doesn't have the keywords `public`, `protected`, and `private`. If an identifier
  starts with an underscore (`_`), it's private to its library. For details see [Libraries and
  visibility][2]
- _Identifiers_ can start with a letter or underscore (`_`), followed by any combination of those
  characters plus digits
- Dart has both _expressions_ (which have runtime values) and _statements_ (which don't). For
  example, the [conditional expression][3] `condition ? expr1 : expr2` has a value of `expr1` or
  `expr2`. Compare that to an [if-else statement][4], which has no value. A statement often contains
  one or more expressions, but a expression can't directly contain a statement
- Dart tools can report two kinds of problems: _warnings_ and _errors_. Warnings are just
  indications that your code might hot work, but they don't prevent your program from executing.
  Errors can be either compile-time or run-time. A compile-time error prevents the code from
  executing at all; a run-time error results in an [exception][5] being raised while the code
  executes

## Keywords

|                          |                         |                           |                        |
| :----------------------- | :---------------------- | :------------------------ | :--------------------- |
| [abstract] <sup>2</sup>  | [dynamic] <sup>2</sup>  | [implements] <sup>2</sup> | [show] <sup>1</sup>    |
| [as] <sup>2</sup>        | [else]                  | [import] <sup>2</sup>     | [static] <sup>2</sup>  |
| [assert]                 | [enum]                  | [in]                      | [super]                |
| [async] <sup>1</sup>     | [export] <sup>2</sup>   | [interface] <sup>2</sup>  | [switch]               |
| [await] <sup>3</sup>     | [extends]               | [is]                      | [sync] <sup>1</sup>    |
| [break]                  | [external] <sup>2</sup> | [library] <sup>2</sup>    | [this]                 |
| [case]                   | [factory] <sup>2</sup>  | [mixin] <sup>2</sup>      | [throw]                |
| [catch]                  | [false]                 | [new]                     | [true]                 |
| [class]                  | [final]                 | [null]                    | [try]                  |
| [const]                  | [finally]               | [on] <sup>1</sup>         | [typedef] <sup>2</sup> |
| [continue]               | [for]                   | [operator] <sup>2</sup>   | [var]                  |
| [covariant] <sup>2</sup> | [Function] <sup>2</sup> | [part] <sup>2</sup>       | [void]                 |
| [default]                | [get] <sup>2</sup>      | [rethrow]                 | [while]                |
| [deferred] <sup>2</sup>  | [hide] <sup>1</sup>     | [return]                  | [with]                 |
| [do]                     | [if]                    | [set] <sup>2</sup>        | [yield] <sup>3</sup>   |

Avoid using these words as identifiers. However, if necessary, the keywords marked with superscripts
can be indentifiers:

- Words with the superscript **1** are **contextual keywords**, which have meaning only in specific
  places. They're valid identifiers everywhere
- Words with the superscript **2** are **built-in identifiers**. To simplify the task of porting
  JavaScript code to Dart, these keywords are valid identifiers in most places, but they can't be
  used as class or type names, or as import prefixes
- Words with the superscript **3** are newer, limited reversed words related to the [asynchrony
  support][6] that was added after Dart's 1.0 release. You can't use `await` or `yield` as an
  identifier in any function body marked with `async`, `async*`, or `sync*`

All other words in the table are **reversed words**, which can't be identifiers.

## Variables

### Default value

Uninitialized variables have an initial value of `null`. Even variables with numeric types are
initially null, because numbers (like everything else in Dart) are objects.

### Final and const

If you never intend to change a variable, use `final` or `const`, either instead of `var` or in
addition to a type. A final variable can be set only once; a const variable is a compile-time
constant. (Const variables are implicitly final.) A final top-level or class variable is initialized
the first time it's used.

The `const` for variables that you want to be **compile-time constants**. If the const variable is
at the class level, mark it `static const`. Where you declare the variable, set the value to a
compile-time constant such as a number or string literal, a const variable, or the result of an
arthmetic operation on constant numbers.

## Built-in types

The Dart language has special support for the following types:

- numbers
- strings
- booleans
- lists (also known as _arrays_)
- sets
- maps
- runes (for expressing Unicode characters in a string)
- symbols

### Numbers

#### [int][7]

Integer values no larger than 64 bits, depending on the platform. On the Dart VM, values can be from
-2<sup>63</sup> to 2<sup>63</sup> - 1. Dart that's compiled to JavaScript uses [JavaScript
numbers][8], allowing values from -2<sup>53</sup> to 2<sup>53</sup> - 1.

#### [double][9]

64-bit (double precision) floating-point nubmers, as specified by the [IEEE 754][10] standard.

Both `int` and `double` are subtypes of num[11]. The num type includes basic operators such as `+`,
`-`, `/`, and `*`, and is also where you'll find `abs()`, `ceil()`, and `floor()`, among other
methods. (Bitwise operators, such as `>>`, are defined in the `int` class.) If num and its subtypes
don't have what you're looking for, the [dart:math][12] library might.

### Strings

You can put the value of an expression inside as string by using `${expression}`. If the expression
is an identifier, you can skip the `{}`. To get the string corresponding to an object, Dart calls
the object's `toString()` method.

Literal strings are compile-time constants, as long as any interpolated expression is an
compile-time constant that evaluates to null or a numeric, string, or boolean value.

### Boolean

To represent boolean values, Dart has a type named `bool`. Only two objects have type bool: the
boolean literals `true` and `false`, which are both compile-time constant.

### Lists

The List type has many handy methods for manipulating lists. For more information about lists, see
[Generics][13] and [Collections][14].

### Maps

In general, a map is an object that associates keys and values. Both keys and values can be any type
of object. Each _key_ occurs only once, but you can use the same _value_ multiple times. Dart
support for maps is provided by map literals and the [Map][15] type.

### Runes and grapheme clusters

Unicode defines a unique numeric value for each letter, digit, and symbol used in all of the world's
writing systems. Because a Dart string is a sequence of UTF-16 code units, expressing Unicode code
points within a string requires special syntax. The usual way to express a Unicode code point is
`\uXXXX`, where XXXX is a 4-digit hexadecimal value. For example, the heart character (❤️) is
`\u2665`. To specify more or less than 4 hex digits, place the value in curly brackets. For example,
the laughing emoji (😆) is `\u{1f600}`.

### Symbols

A [Symbol][16] object represents an operator or identifier declared in a Dart program. You might
never need to use symbols, but they're invaluable for APIs that refer to identifiers by name,
because minification changes identifier names but not identifier symbols.

## Functions

Dart is a true object-oriented language, so even functions are objects and have type,
[Function][17]. This means that functions can be assigned to variables or passed as arguments to
other functions. You can also call an instance of a Dart class as if it were a function. For
detials, see [Callable classes][18].

A function can have two types of parameters: _required_ and _optional_. The required parameters are
listed first, followed by any optional parameters. Optional parameters can be _named_ or
_positional_.

### Optional parameters

Optional parameters can be either named or positional, bot not both.

#### Named paramters

Named parameters are a kind of optional parameter, you can annotate them with [@required][19] to
indicate that the parameter is mandatory - that users must provide a value for the parameter.

```dart
enableFlags(bold: true, hidden: false);
```

#### Positional parameters

Wrapping a set of function parameters in `[]` marks them as optional positional parameters.

```dart
String say(String from, String map, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}
```

#### Default parameter values

Your function can use `=` to define default values for both named and positional parameters. The
default values must be compile-time constants. If no default value is provided, the default value is
`null`.

### The `main()` function

Every app must have a top-level `main()` function, which serves as the entrypoint to the app. The
`main()` function returns `void` and has an optional `List<String>` parameter for arguments.

```dart
void main() {
  querySelector('#sample_text_id')
    ..text = 'Click me!'
    ..onClick.listen(reverseText);
}
```

<!-- Links -->

[0]: https://api.dart.dev/stable/dart-core/Object-class.html
[1]:
  https://dart.dev/guides/language/effective-dart/design#do-annotate-with-object-instead-of-dynamic-to-indicate-any-object-is-allowed
[2]: https://dart.dev/guides/language/language-tour#libraries-and-visibility
[3]: https://dart.dev/guides/language/language-tour#conditional-expressions
[4]: https://dart.dev/guides/language/language-tour#if-and-else
[5]: https://dart.dev/guides/language/language-tour#exceptions
[6]: https://dart.dev/guides/language/language-tour#asynchrony-support
[7]: https://api.dart.dev/stable/dart-core/int-class.html
[8]:
  https://stackoverflow.com/questions/2802957/number-of-bits-in-javascript-numbers/2803010#2803010
[9]: https://api.dart.dev/stable/dart-core/double-class.html
[10]: https://en.wikipedia.org/wiki/IEEE_754
[11]: https://api.dart.dev/stable/dart-core/num-class.html
[12]: https://api.dart.dev/stable/dart-math
[13]: https://dart.dev/guides/language/language-tour#generics
[14]: https://dart.dev/guides/libraries/library-tour#collections
[15]: https://api.dart.dev/stable/dart-core/Map-class.html
[16]: https://api.dart.dev/stable/dart-core/Symbol-class.html
[17]: https://api.dart.dev/stable/dart-core/Function-class.html
[18]: https://dart.dev/guides/language/language-tour#callable-classes
[19]: https://pub.dev/documentation/meta/latest/meta/required-constant.html

<!-- Keywords -->

[abstract]: https://dart.dev/guides/language/language-tour#abstract-classes
[as]: https://dart.dev/guides/language/language-tour#type-test-operators
[assert]: https://dart.dev/guides/language/language-tour#assert
[async]: https://dart.dev/guides/language/language-tour#asynchrony-support
[await]: https://dart.dev/guides/language/language-tour#asynchrony-support
[break]: https://dart.dev/guides/language/language-tour#break-and-continue
[case]: https://dart.dev/guides/language/language-tour#switch-and-case
[catch]: https://dart.dev/guides/language/language-tour#catch
[class]: https://dart.dev/guides/language/language-tour#instance-variables
[const]: https://dart.dev/guides/language/language-tour#final-and-const
[continue]: https://dart.dev/guides/language/language-tour#break-and-continue
[covariant]: https://dart.dev/guides/language/sound-problems#the-covariant-keyword
[default]: https://dart.dev/guides/language/language-tour#switch-and-case
[deferred]: https://dart.dev/guides/language/language-tour#lazily-loading-a-library
[do]: https://dart.dev/guides/language/language-tour#while-and-do-while
[dynamic]: https://dart.dev/guides/language/language-tour#important-concepts
[else]: https://dart.dev/guides/language/language-tour#if-and-else
[enum]: https://dart.dev/guides/language/language-tour#enumerated-types
[export]: https://dart.dev/guides/libraries/create-library-packages
[extends]: https://dart.dev/guides/language/language-tour#extending-a-class
[external]: https://stackoverflow.com/questions/24929659/what-does-external-mean-in-dart
[factory]: https://dart.dev/guides/language/language-tour#factory-constructors
[false]: https://dart.dev/guides/language/language-tour#booleans
[final]: https://dart.dev/guides/language/language-tour#final-and-const
[finally]: https://dart.dev/guides/language/language-tour#finally
[for]: https://dart.dev/guides/language/language-tour#for-loops
[function]: https://dart.dev/guides/language/language-tour#functions
[get]: https://dart.dev/guides/language/language-tour#getters-and-setters
[hide]: https://dart.dev/guides/language/language-tour#importing-only-part-of-a-library
[if]: https://dart.dev/guides/language/language-tour#if-and-else
[implements]: https://dart.dev/guides/language/language-tour#implicit-interfaces
[import]: https://dart.dev/guides/language/language-tour#using-libraries
[in]: https://dart.dev/guides/language/language-tour#for-loops
[interface]:
  https://stackoverflow.com/questions/28595501/was-the-interface-keyword-removed-from-dart
[is]: https://dart.dev/guides/language/language-tour#type-test-operators
[library]: https://dart.dev/guides/language/language-tour#libraries-and-visibility
[mixin]: https://dart.dev/guides/language/language-tour#adding-features-to-a-class-mixins
[new]: https://dart.dev/guides/language/language-tour#using-constructors
[null]: https://dart.dev/guides/language/language-tour#default-value
[on]: https://dart.dev/guides/language/language-tour#catch
[operator]: https://dart.dev/guides/language/language-tour#overridable-operators
[part]: https://dart.dev/guides/libraries/create-library-packages#organizing-a-library-package
[rethrow]: https://dart.dev/guides/language/language-tour#catch
[return]: https://dart.dev/guides/language/language-tour#functions
[set]: https://api.dart.dev/stable/dart-core/Set-class.html
[show]: https://dart.dev/guides/language/language-tour#importing-only-part-of-a-library
[static]: https://dart.dev/guides/language/language-tour#class-variables-and-methods
[super]: https://dart.dev/guides/language/language-tour#extending-a-class
[switch]: https://dart.dev/guides/language/language-tour#switch-and-case
[sync]: https://dart.dev/guides/language/language-tour#generators
[this]: https://dart.dev/guides/language/language-tour#constructors
[throw]: https://dart.dev/guides/language/language-tour#throw
[true]: https://dart.dev/guides/language/language-tour#booleans
[try]: https://dart.dev/guides/language/language-tour#catch
[typedef]: https://dart.dev/guides/language/language-tour#typedefs
[var]: https://dart.dev/guides/language/language-tour#variables
[void]: https://medium.com/dartlang/dart-2-legacy-of-the-void-e7afb5f44df0
[while]: https://dart.dev/guides/language/language-tour#while-and-do-while
[with]: https://dart.dev/guides/language/language-tour#adding-features-to-a-class-mixins
[yield]: https://dart.dev/guides/language/language-tour#generators
