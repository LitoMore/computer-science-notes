# Tour of the Dart language

## Important concepts

- Everything you can place in a variable is an *Object*, and every *Object* is an instance of a
  *class*. Even numbers, functions, and `null` are objects. All objects inherit from the
  [Object][0] class
- Although Dart is strongly typed, annotations are optional because Dart can infer types. In the
  code above, `nunber` is inferred to be of type `init`. When you want to explicitly say that no
  type is expected, [use the special type dynamic][1]
- Dart supports generic types, like `List<int>` (a list of integers) or `List<dynamic>` (a list of
  any type)
- Dart supports top-level functions (such as `main()`), as well as functions tied to class or
  object (*static* and *instance methods*, respectively). You can also create functions within
  functions (*nested* or *local functions*)
- Similarly, Dart supports top-level *variables*, as well as variables tied to a class or a object
  (static and instance variables). Instance variables are sometimes known as fields or propeties
- Unlike Java, Dart doesn't have the keywords `public`, `protected`, and `private`. If an
  identifier starts with an underscore (`_`), it's private to its library. For details see
  [Libraries and visibility][2]
- *Identifiers* can start with a letter or underscore (`_`), followed by any combination of those
  characters plus digits
- Dart has both *expressions* (which have runtime values) and *statements* (which don't). For
  example, the [conditional expression][3] `condition ? expr1 : expr2` has a value of `expr1` or
  `expr2`. Compare that to an [if-else statement][4], which has no value. A statement often
  contains one or more expressions, but a expression can't directly contain a statement
- Dart tools can report two kinds of problems: *warnings* and *errors*. Warnings are just
  indications that your code might hot work, but they don't prevent your program from executing.
  Errors can be either compile-time or run-time. A compile-time error prevents the code from
  executing at all; a run-time error results in an [exception][5] being raised while the code
  executes

## Keywords

| | | | |
| :-- | :-- | :-- | :-- |
| [abstract] <sup>2</sup> | [dynamic] <sup>2</sup> | [implements] <sup>2</sup> | [show] <sup>1</sup> |
| [as] <sup>2</sup> | [else] | [import] <sup>2</sup> | [static] <sup>2</sup> |
| [assert] | [enum] | [in] | [super] |
| [async] <sup>1</sup> | [export] <sup>2</sup> | [interface] <sup>2</sup> | [switch] |
| [await] <sup>3</sup> | [extends] | [is] | [sync] <sup>1</sup> |
| [break] | [external] <sup>2</sup> | [library] <sup>2</sup> | [this] |
| [case] | [factory] <sup>2</sup> | [mixin] <sup>2</sup> | [throw] |
| [catch] | [false] | [new] | [true] |
| [class] | [final] | [null] | [try] |
| [const] | [finally] | [on] <sup>1</sup> | [typedef] <sup>2</sup> |
| [continue] | [for] | [operator] <sup>2</sup> | [var] |
| [covariant] <sup>2</sup> | [Function] <sup>2</sup> | [part] <sup>2</sup> | [void] |
| [default] | [get] <sup>2</sup> | [rethrow] | [while] |
| [deferred] <sup>2</sup> | [hide] <sup>1</sup> | [return] | [with] |
| [do] | [if] | [set] <sup>2</sup> | [yield] <sup>3</sup> |

Avoid using these words as identifiers. However, if necessary, the keywords marked with
superscripts can be indentifiers:

- Words with the superscript **1** are **contextual keywords**, which have meaning only in specific
  places. They're valid identifiers everywhere
- Words with the superscript **2** are **built-in identifiers**. To simplify the task of porting
  JavaScript code to Dart, these keywords are valid identifiers in most places, but they can't be
  used as class or type names, or as import prefixes
- Words with the superscript **3** are newer, limited reversed words related to the
  [asynchrony support][6] that was added after Dart's 1.0 release. You can't use `await` or `yield`
  as an identifier in any function body marked with `async`, `async*`, or `sync*`

All other words in the table are **reversed words**, which can't be identifiers.

## Variables

### Default value

Uninitialized variables have an initial value of `null`. Even variables with numeric types are
initially null, because numbers (like everything else in Dart) are objects.

### Final and const

If you never intend to change a variable, use `final` or `const`, either instead of `var` or in
addition to a type. A final variable can be set only once; a const variable is a compile-time
constant. (Const variables are implicitly final.) A final top-level or class variable is
initialized the first time it's used.

The `const` for variables that you want to be **compile-time constants**. If the const variable is
at the class level, mark it `static const`. Where you declare the variable, set the value to a
compile-time constant such as a number or string literal, a const variable, or the result of an
arthmetic operation on constant numbers.

## Built-in types

The Dart language has special support for the following types:

- numbers
- strings
- booleans
- lists (also known as *arrays*)
- sets
- maps
- runes (for expressing Unicode characters in a string)
- symbols

<!-- Links -->
[0]: https://api.dart.dev/stable/dart-core/Object-class.html
[1]: https://dart.dev/guides/language/effective-dart/design#do-annotate-with-object-instead-of-dynamic-to-indicate-any-object-is-allowed
[2]: https://dart.dev/guides/language/language-tour#libraries-and-visibility
[3]: https://dart.dev/guides/language/language-tour#conditional-expressions
[4]: https://dart.dev/guides/language/language-tour#if-and-else
[5]: https://dart.dev/guides/language/language-tour#exceptions
[6]: https://dart.dev/guides/language/language-tour#asynchrony-support

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
[Function]: https://dart.dev/guides/language/language-tour#functions
[get]: https://dart.dev/guides/language/language-tour#getters-and-setters
[hide]: https://dart.dev/guides/language/language-tour#importing-only-part-of-a-library
[if]: https://dart.dev/guides/language/language-tour#if-and-else
[implements]: https://dart.dev/guides/language/language-tour#implicit-interfaces
[import]: https://dart.dev/guides/language/language-tour#using-libraries
[in]: https://dart.dev/guides/language/language-tour#for-loops
[interface]: https://stackoverflow.com/questions/28595501/was-the-interface-keyword-removed-from-dart
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
