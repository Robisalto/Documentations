---
title: Certified Entry-Level Python Programmer Certification
author: David DEBRAY
Created By: David Debray
Last Edited: May 20, 2020 9:16 AM
Tags: Knowledge Base, Linux Academy
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---

<link rel="icon" href="favicon.png" type="image/png" />

# Course Introduction


> "This course is designed to teach the fundamentals of Python programming and provide the necessary skills for the Certified Entry-Level Python Programmer Certification Exam."

> -- <cite> By Keith Thompson. </cite>


---

# Environment Setup
## Download and Install Python 3 from Source on CentOS 7
Here are the commands that we'll run to build and install Python 3.7 on CentOS 7:

```bash
$ sudo -i
$ yum groupinstall -y "Development Tools"
$ yum install -y zlib-devel openssl-devel
$ cd /usr/src
$ wget https://python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz
$ tar xf Python-3.7.3.tar.xz
$ cd Python-3.7.3
$ ./configure --enable-optimizations --with-ensurepip=install
$ make altinstall
$ exit
```

*Important:* `make altinstall` causes it to not replace the built-in `python` executable.

## Download and Install Python 3 from Source on Debian
Here are the commands that we'll run to build and install Python 3.7 on a Debian based machine:

```bash
$ sudo -i
$ apt update -y
$ apt install -y \
  wget \
  build-essential \
  libffi-dev \
  libgdbm-dev \
  libc6-dev \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libncurses5-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev$ cd /usr/src
$ wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz
$ tar xf Python-3.7.3.tar.xz
$ cd Python-3.7.3
$ ./configure --enable-optimizations --with-ensurepip=install
$ make altinstall
$ exit
```

*Note:* `make altinstall` causes it to not replace the built-in `python` executable.

### Ensure Python 3 Works with Sudo

Make sure that `secure_path` in `/etc/sudoers` file includes `/usr/local/bin`. The line should look something like this:

```bash
Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin
```

### Upgrade Pip (might not be necesary)

The version of `pip` that we have might be up-to-date, but it's a good practice to try to update it after the installation. We need to use the `pip3.7` executable because we're working with Python 3, and we use `sudo` so that we can write files under the `/usr/local` directory.

```bash
$ sudo pip3.7 install --upgrade pip
```

# Fundamental Concepts

## Compiler & Interpreters

[Certified_Entry-Level_Python_Programmer_Certification/Lecture1-_Compilers_and_Interpreters.pdf](Certified_Entry-Level_Python_Programmer_Certification/Lecture1-_Compilers_and_Interpreters.pdf)

## Lexing, Syntax, and Semantics

[Certified_Entry-Level_Python_Programmer_Certification/Lecture2-_Lexing_Syntax_and_Semantics.pdf](Certified_Entry-Level_Python_Programmer_Certification/Lecture2-_Lexing_Syntax_and_Semantics.pdf)

## Python Specifics: Keywords and Instructions

[Certified_Entry-Level_Python_Programmer_Certification/Lecture3-_Python_Specifics-__Keywords_and_Instructions.pdf](Certified_Entry-Level_Python_Programmer_Certification/Lecture3-_Python_Specifics-__Keywords_and_Instructions.pdf)

---

## Using the REPL

**R**ead **E**valuate **P**rint **L**oop

[2. Using the Python Interpreter - Python 3.8.1 documentation](https://docs.python.org/3/tutorial/interpreter.html)

Useful to test out different commands before implementing.

```python
[cloud_user@didijsaq1c Code]$ python3.7
Python 3.7.3 (default, Jan  6 2020, 09:14:41) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-39)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> 1+1
2
>>> print ("Hello world!")
Hello world!
>>> exit ()
[cloud_user@didijsaq1c Code]$p
```

---

## Creating a Python file

```bash
touch hello.py
```

Then create script:

```python
print ("Hello World !")
```

Add **SheBang (#!)** to make it executable from user.

```python
#! /usr/bin/env python3.7
```

Modify the rights so the user can execute and run: 

```bash
chmod u+x hello.py && ./hello.py
```

*If we'd rather not have a file extension on our script*, we can remove it since we've put a shebang in the file. Running `mv [hello.py](http://hello.py/) hello` then performing `./hello` will still result in the same thing.

---

---

# Literals, Variables, and Comments

## Comments

```python
# This is a comment
print ("Hello world") # comment at end of line

"""
This is not a block comment,
but it will still work when you need
for some lines of code to not execute.
"""
```

---

## Variables and the Assignment Operator

```python
my_string = "This is a simple string" # The type of my_str is NOT STRICT (can use int, char, etc.)
print (my_string)

# KEYWORDS (IS, AND, etc.) cannot be used as variables
```

Example of operator:

```python
>>> my_str += " testing"
>>> my_str
'This is a simple string testing'
```

---

## Strings and String Operators

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str)

Strings also work with some arithmetic operators.

We can combine strings using the `+` operator and multiply a string by a number using the `*` operator:

```python
>>> "pass" + "word"
'password'
>>> "Ha" * 4
'HaHaHaHa'
```

### Objects & Methods (Explained)

A string is a sequence of grouped characters. We do need to cover the concept of an "Object" in object-oriented programming before moving on. An "object" encapsulates two things: state and behavior. For the built-in types, the state makes sense because it's the entire contents of the object. The behavior aspect means that there are functions that we can call on the instances of the objects that we have. A function bound to an object is called a *method*. Here are some example methods that we can call on strings:`find` locates the first instance of a character (or string) in a string. This function returns the index of the character or string.

```python
>>> "double".find('s')
-1
>>> "double".find('u')
2
>>> "double".find('bl')
4
```

`lower` converts all of the characters in a string to their lowercase versions (if they have one).
This function returns a new string without changing the original, and this becomes important later.

```python
>>> "TeStInG".lower() # "testing"
'testing'
>>> "another".lower()
'another'
>>> "PassWord123".lower()
'password123'
```

### Escape Sequences

Lastly, if we need to use quotes or special characters in a string, we can do that using the backslash character `\`:

```python
>>> print("Tab\tDelimited")
Tab     Delimited
>>> print("New\nLine")
New
Line
>>> print("Slash\\Character")
Slash\Character
>>> print("'Single' in Double")
'Single' in Double
>>> print('"Double" in Single')
"Double" in Single
>>> print("\"Double\" in Double")
"Double" in Double
```

---

## Booleans

Booleans represent "truthiness" and Python has two boolean constants: `True` and `False`.

Notice that these both start with capital letters. Later we will
learn about comparisons operations, and those will often return either `True` or `False`.

### Everything has a Boolean Value

We can check the Boolean value for any object in Python by using the `bool` function. For instance, the empty string `""` has the boolean value of `False` where any other string as a boolean value of `True`.

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#truth-value-testing)

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#boolean-values)

---

## Numbers: Integers, Floats, and Scientific Notation

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#numeric-types-int-float-complex)

### Numbers

There are two main types of numbers that we'll use in Python, `int` and `float`. The big difference between an `int` and a `float` being that the `float` class handles decimal point information.

If either of the numbers in a mathematical operation in Python is a
float, then the other will be converted before carrying out the
operation and the result will always be a float.

### Scientific notation

If we happen to be working with really large numbers, and it's easier to use scientific notation, then Python can help us. For the equivalent of a float times 10 to a specified power we're able to use `e` or `E` when specifying the number:

```python
>>> 4.5e9
4500000000.0
>>> 4.5e9 == 4.5 * (10 ** 9) == 4.5E9 == 4.5E+9
True
```

---

---

# Number Systems and Numeric Operators

## Numeric Operators

[operator - Standard operators as functions - Python 3.8.1 documentation](https://docs.python.org/3/library/operator.html#mapping-operators-to-functions)

Examples of Operators:

```python
>>> 2 + 2 # Addition
4
>>> 2 + 2.0 # Addition, always returns float if at least one is float
4.0
>>> 10 - 4 # Subtraction
6
>>> 3 * 9 # Multiplication
27
>>> 5 / 3 # Division, converts the result to a float even when evenly divided.
1.66666666666667
>>> 5 // 3 # Floor division, always returns a number without a remainder as an int
1
>>> 8 % 3 # Modulo division, returns the remainder as an int
2
>>> 2 ** 3 # Exponent
8
```

Notes: `Modulo` can be especially useful when trying to find if a number can be divided evenly :)

```python
# Can 169 be divided evenly by 4 ? 
>>> 169 % 4
1 # Nope, remainder equals "1"

# Can 69 be divided by 3 ?
>>> 69 % 3
0 # Yep, remainder equals "0"
```

---

## Number Systems

[Numeral system](https://en.wikipedia.org/wiki/Numeral_system)

[Bit numbering](https://en.wikipedia.org/wiki/Bit_numbering)

[Certified_Entry-Level_Python_Programmer_Certification/s5-number-systems-and-floating-point-accuracy_1568816995.pdf](Certified_Entry-Level_Python_Programmer_Certification/s5-number-systems-and-floating-point-accuracy_1568816995.pdf)

We normally count using the decimal number system, which means that for each digit in a number we will cycle between the numbers 0-9 before adding another digit. These same numbers can be represented using other numbering systems though, such as binary which only uses the number 0-1.

The decimal number of `15` is equivalent to `1111` in binary notation. To convert from decimal to binary we divide the decimal number (`15`) by the base of the other numbering system, in binary's case that's `2` and then we take the remainder as a digit in the binary number. We then take the part that divided cleanly and divide it by the base again. Here's the process for converting `15` to binary:

```python
15 / 2 => 7 w/ remainder of 1
7 / 2 => 3 w/ remainder of 1
3 / 2 => 1 w/ remainder of 1
1 / 2 => 0 w/ remainder of 1
```

If we do this with the number `12` we'll get something different:

```python
12 / 2 => 6 w/ remainder of 0
6 / 2 => 3 w/ remainder of 0
3 / 2 = 1 w/ remainder of 1
1 / 2 = 0 w/ remainder of 1
```

The bits go from least significant to most, so the remainders at the end of our division will be the most significant digits. `12` as binary is `1100`.

### Common Numeral Systems

The most common numbering systems are decimal (10), binary (2), octal (8), and hexadecimal (16). You might be asking yourself, "How do I
represent a digit with 16 different numbers?". That's a reasonable
question. The answer is to start using letters in addition to numbers.
Hexadecimal digits go from 0-9, then from A-F. The binary number `12` is `C` in Hexadecimal.

### Representing Binary, Octal, and Hexadecimal Numbers in Python

Now that we know how various and common number systems work let's go
about actually using them in Python. To represent a number in a
different number system in Python, we do this by prefixing the number
with a `0` and the number system identifier:

- Binary uses `b`
- Octal uses `o`
- Hexadecimal uses `x`

Here are examples in the REPL:

```python
>>> 0b1001
9
>>> 0o7424
3860
>>> 0xFF012
1044498
```

The result printed out will be the decimal value. If we want to work in decimal values and represent them in a different numbering system we can use the `bin`, `oct`, and `hex` functions like so:

```python
>>> bin(10)
'0b1010'
>>> oct(59)
'073'
>>> hex(1024)
'0x400'
```

The value returned from these functions will always be a string.

---

## Floating-Point Accuracy

[15. Floating Point Arithmetic: Issues and Limitations - Python 3.8.1 documentation](https://docs.python.org/3/tutorial/floatingpoint.html#floating-point-arithmetic-issues-and-limitations)

[Certified_Entry-Level_Python_Programmer_Certification/s5-number-systems-and-floating-point-accuracy_1568816995(2).pdf](Certified_Entry-Level_Python_Programmer_Certification/s5-number-systems-and-floating-point-accuracy_1568816995(2).pdf)

This is for high-precision math only :)

---

# Operators and Bindings

## Unary and Bitwise Operators

[BitwiseOperators - Python Wiki](https://wiki.python.org/moin/BitwiseOperators)

### A Brief Aside About Truth Tables

One tool from logic (from philosophy) that is used at every level of
computer science is the idea of truth tables. Truth tables describe how
various operations in boolean algebra work, and can show us all of the
available options. Bitwise operators are boolean algebra operations
because they deal with 0 and 1, which will equate to false and true. We
won't go too deep into truth tables, but if you'd like to have a better
understanding of boolean logic then I would encourage you to research
them.

[Table de vérité](https://fr.wikipedia.org/wiki/Table_de_v%C3%A9rit%C3%A9)

### What is a Unary Operator?

A unary operator is an operator that only has one operand. Where the `+` operation is a binary operator, because we need to provide an operand
to the right and left of the operator, a unary operator only takes a
right-side operand.

### What are Bitwise Operators?

Bitwise operators are operators that work off of the bit information
(binary notation) for numbers. These aren't used that often, but it's
good to have an understanding of what they do.

Positions in binary numbers are known as "bits" and they can either be `0` or `1`. Bitwise operations do various things based on the values of these bits.

### Operators: Bitwise Complement

The first bitwise operator that we're going to talk about is probably the most confusing one: the bitwise complement operator `~`. This is the only unary operator that we're going to talk about in this lesson. It takes a number that we're going to call `x`, and returns the result of `-x - 1`. To show what this looks like in binary we'll also use the `bin` function to show our integers as binary numbers:

```python
>>> a = 0b010
2
>>> bin(a)
'0b10'
>>> ~a
-3
>>> bin(~a)
'-0b11'
```

### Bitwise OR

The remainder of the bitwise operators make a lot more sense and
require two numbers as the operands. The bitwise **OR** operation will take
two numbers, and if one of them has a `1` in a bit position then it will return a `1` at that position in the final result. To use the bitwise OR we'll use a single pipe characters `|`:

```python
>>> a = 0b1001
>>> b = 0b1100
>>> bin(a | b)
'0b1101'
```

### Bitwise AND

Where bitwise OR will return a `1` for a bit position if that position is a `1` in either number, bitwise **AND** requires that *both* have a `1` at that position, otherwise it will have a `0` at that position in the final result. The bitwise AND operator is a single ampersand `&`:

```python
>>> a = 0b1001
>>> b = 0b1100
>>> bin(a & b)
'0b1000'
```

### Bitwise XOR

Bitwise **XOR (exclusive or)** is an interesting operator where the position in the final result will have a `1` if *exactly one* of the operands has a `1` in that position. The bitwise XOR operator is a carrot `^`:

```python
>>> a = 0b1001
>>> b = 0b1100
>>> bin(a ^ b)
'0b101'
```

### Bitwise Right Shift

The final two operators allow us to shift our bit values directly
sideways by a certain number of positions. To shift our bits to the
right we'll use the bitwise right shift operator which is `>>`. Our initial values are on the left-hand side and the number of positions to shift is on the right:

```python
>>> a = 0b110 # imagine a decimal point 0b110**.**
>>> bin(a >> 2) # moves the 'decimal point' by two
'0b1' # 0b1.10, '.10' is disapeared by the operation 
>>> bin(a >> 4)
'0b0'# nothing left -> 0B0.0110
```

Notice that if we shift beyond the number of bits in our number then we simply get `0` as the result.

### Bitwise Left Shift

Bitwise left shift uses the `<<` operator with the same rules as the right shift operator. For each position that we shift then we'll add a new `0` bit to the right.

```python
>>> a = 0b110
>>> bin(a << 2) # moves the entire number two colums to the left
'0b11000' # 0b110. becomes 0b11000.
>>> bin(a << 4)
'0b1100000''
```

---

## Boolean Operators

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#boolean-operations-and-or-not)

### The `NOT` Operation

Sometimes we want to know the opposite boolean value for something. To do this, we use the unary operators `not`:

```python
>>> not True
False
>>> not False
True
```

### The `OR` Operation

The boolean `or` operator works the same way that the bitwise OR operator did if we are only considering one bit. The bit of `1` is equivalent to `True` and `0` is equivalent to `False`

```python
>>> True or True
True
>>> True or False
True
>>> False or False
False
>>> False or True
True
```

### The `AND` Operation

The `and` operator is the opposite of `or`, and both of the operands need to be true.

```python
>>> True and True
True
>>> True and False
False
>>> False and False
False
>>> False and True
False
```

---

## Comparison Operators

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#comparisons)

[Built-in Functions - Python 3.8.1 documentation](https://docs.python.org/3/library/functions.html#ord)

### The Greater Than and Less Than Operators

We're going to work our way through the comparison operators by starting with the ones that will feel most familiar from mathematics. The four greater than and less than operators work exactly as you'd
expect:

```python
>>> 1 < 2
True
>>> 2 > 1
True
>>> 2 < 1
False
>>> 1 <= 1
True
>>> 2.0 >= 3
False
```

A few things to note are that we can compare numeric types to one other, so it's not hard to compare floats with integers. Another thing to notice is that these comparison operators always return a boolean value. Remember that individual types dictate whether or not they work with specific operands. And strings, for instance, work with these comparison operators too:

```python
>>> 'a' > 'b'
False
>>> 'b' > 'a'
True
>>> 'bb' >= 'ba'
True
>>> 'a' <= 'c'
True
```

When comparing strings, each character is compared with the character at the same index in the other string to determine which one is larger. Behind the scenes, each character as a numeric value that we can find using the [`ord`] function, and these are used to do the comparisons. Once again, if we try to compare types that aren't comparable, then we'll receive an error indicating such:

```python
>>> 'a' <= 1
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '<=' not supported between instances of 'str' and 'int'
```

### The Equals Operators

The equals operators are a little different than you might expect, because we already use a single equals sign for variable assignment operations. Because of this, to see if two things are equal we use a
double equals sign `==`:

```python
>>> 1 == 1
True
>>> 1.0 == 1
True
>>> 2 == 1.0
False
>>> 'a' == 2
False
>>> 'a' == 'a'
True
```

Notice that this checks equivalence, so comparing an equivalent float and integer will return `True`. Additionally, we're able to compare two completely different types without receiving an error because they're not equivalent. If we want to know if two objects *aren't* equivalent, then we can use the not equal operators `!=`. This will return `True` only if the items aren't equivalent:

```python
>>> 1 != 1
False
>>> 1.0 != 1
False
>>> 2 != 1.0
True
>>> 'a' != 2
True
>>> 'a' != 'a'
False
```

### The Identity Operators

If we want to know if two objects are or are not *exactly the same object*, then we can use the identity operators. The identity operator is the keyword `is` and the opposite is `is not` (with a space).

```python
>>> 1 is 1
True
>>> 1 is 1.0
False
>>> 'a' is 'a'
True
>>> 'a' is not 'b'
True
>>> 'a' is not 'a'
False
```

The identity operators work based on the `id` of the object, and most of the basic types in Python are immutable (meaning they cannot be changed), so every time that we reference a specific literal it will point to the same item in memory. We can check the `id` of an object by using the `id` function (your return values will be different):

```python
>>> id('a')
4444195248
>>> id('a')
4444195248
>>> id('a') == id('a')
True
```

We'll discuss immutability later, but not all objects are immutable, so you'll run into situations where you can compare two objects that look the same using `is` and have `False` returned. Here are two `list` literals (which aren't immutable):

```python
>>> [] is []
False
```

---

## Operator Priority (Binding)

[6. Expressions - Python 3.8.1 documentation](https://docs.python.org/3/reference/expressions.html#operator-precedence)

### Operator Precedence

In mathematics, we have the order of operations that tell us how we're going perform our calculations, and in Python, we have [operator precedence](https://docs.python.org/3/reference/expressions.html#operator-precedence). We haven't covered all of the contents of this table just yet, but we can look at how everything that we have used so far will be processed.

For whatever reason, the Python documentation shows the *least* binding operators first, but we'll talk about them from most binding to least. We'll leave the ones that we won't cover in this course out of the list though:

1. Parenthesis and List/Dictionary/Set literals
2. Accessing attributes (subscription, slicing, function/method call, attribute reference)
3. Exponentiation (`**`)
4. Positive, Negative, and bitwise complement
5. Multiplication `*`, Division `/`, Floor Division `//`, Modulo `%`
6. Addition `+`, Subtraction `-`
7. Bitwise Shifts `<<` & `>>`
8. Bitwise AND `&`
9. Bitwise XOR `^`
10. Bitwise OR `|`
11. Comparison operators (`in`, `not in`, `is`, `is not`, `<`, `>`, `<=`, `>=`, `==`, `!=`)
12. Boolean NOT `not`
13. Boolean AND `and`
14. Boolean OR `or`
15. Conditions `if`

Let's look at some examples:

```python
>>> 14 & 3 * 2 + 4
10
>>> 14 & 3 * (2 + 4)
2
>>> (14 & 3) * 2 + 4
8
>>> 14 & (3 * 2) + 4
10
```

---

---

---

# Input and Output Operations

## Typecasting

"Move an object from one type to another".

### Documentations

- [Typecasting: `int`](https://docs.python.org/3/library/functions.html#int)
- [Typecasting: `float`](https://docs.python.org/3/library/functions.html#float)
- [Typecasting: `str`](https://docs.python.org/3/library/functions.html#str)
- [Typecasting: `bool`](https://docs.python.org/3/library/functions.html#bool)
- [Trust Value Testing](https://docs.python.org/3/library/stdtypes.html#truth-value-testing)

### Converting from a Number Type to a Number Type

We've already seen some typecasting happen behind the scenes when we performed some of the  mathematical operations. For instance, performing "true division" (using the `/` operator) will always return a float even if we provide two integer operands. How do we go about converting from an integer to a float ourselves though?

The answer is by using the `[float](https://docs.python.org/3/library/functions.html#float)` initializer.

```python
>>> float(1)
1.0
```

We can do the same thing going from a float to an integer using the `[int](https://docs.python.org/3/library/functions.html#int)` initializer:

```python
>>> int(1.3)
1
>>> int(2.6)
2
```

Notice that the result from converting `2.6` to an integer doesn't round, it truncates. It's as though the decimal point value doesn't exist. Converting between number types is pretty straight forward because they're both numbers, but what happens if we try to convert to and from a string?

### Converting to and from a String

Converting to a string is done by using the `[str](https://docs.python.org/3/library/functions.html#str)` initializer and the results are what you would expect:

```python
>>> str(1)
'1'
>>> str(2.6)
'2.6'
>>> str(False)
'False'
```

As we see, even booleans can be typecast to strings. More interesting than converting to strings is trying to convert strings into other usable types, like integers and floats:

```python
>>> int('1')
1
>>> float('1')
1.0
>>> float('1.2')
1.2
>>> int('1.2')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: invalid literal for int() with base 10: '1.2'
```

If the string contains something that would be a valid int or float if we typed it into the interpreter, then we're able to typecast it. But as soon as the type doesn't match, or we try to convert something that's not a number to a float or int, then we'll run into issues.

### Converting to a Boolean

One of the more important, and subtle type, conversions that we use in programming is casting to a boolean. We can cast *anything* to a boolean in Python by using the `[bool](https://docs.python.org/3/library/functions.html#bool)` function.

```python
>>> bool(1)
True
>>> bool(2.4)
True
>>> bool('Tada')
True
>>> bool('Tada'.lower)
True
>>> bool(0)
False
>>> bool(0.0)
False
>>> bool("")
False
```

There are a select few items that convert into `False`. These are detailed in the Python [truth value testing](https://docs.python.org/3/library/stdtypes.html#truth-value-testing) documentation, but can be summed up as `False`, `None`, any `0` value, and any empty sequence (an empty string for instance).

### Boolean Operators with Non-Boolean Objects

Now that we know that every object has a boolean representation, we're ready to revisit the boolean operators of `and`, `or`, and `not`. These operators will operate on any objects by using their boolean representations automatically.

These operations get a little more complicated as we use non-boolean operands:

```python
>>> 1 and 0
0
>>> 'This' and 'That'
'That'
>>> 'This' and 0 and 'That'
0
>>> 0.0 and 1
0.0
```

Remember that `and` requires both operands to be true in order to return `true`, and this means that it will automatically return the first falsy value that it finds or the rightmost operand if they're both true.

The `or` operator works in the opposite way. It will return the first object that would evaluate to `true`, or the rightmost falsy value.

```python
>>> 1 or 0
1
>>> 0 or 1
1
>>> 0 or ""
""
>>> 0 or 1 or 'This'
1
```

Lastly, the `not` operator will simply return the opposite boolean value for whatever we pass to it:

```python
>>> not ""
True
>>> not 1
False
```

---

## The `input` Function

### Documentation

[Built-in Functions - Python 3.8.1 documentation](https://docs.python.org/3/library/functions.html#input)

### Prompting for user input

Computer programs aren't that interesting until they can be more dynamic. Over the next few short lessons, we'll be learning about how we can receive input from a user who's running our program from the command-line, and then how we can manage to present information back to
the screen.

Before we dig into the `input` function, let's talk a little bit about functions in general. Functions allow us to package up bits of code to be able to run them more than once. Additionally,
functions specify expected inputs and can also return information. If we take a look at a function from mathematics, we can see the same thing:

```python
f(x) = x + 2
```

In this case, the name of the function is `f`, the input is `x`, and the code that will be executed is `x + 2`. We can provide a variety of values for `x` and get a different return value. So `f(1)` would return `3`. In Python, we can reference functions by name, allowing us to pass them around like variables. But a function won't be executed unless we "call it" by using parenthesis. We can see this in the REPL by typing in `input` without any parenthesis:

```python
>>> input
<built-in function input>
```

The `input` function is the easiest way that we can make our programs request user interaction. This function is simple in that it only takes one optional argument to be the prompt that we present the user. Whatever the user types will be returned by the `input` function as a string, and that means we can store it in a variable. Let's try this out in the REPL now:

```python
>>> favorite = input("Favorite Color: ")
Favorite Color:
```

Now we're left in a new prompt and we can type our answer. When we hit Enter/Return it will submit all of what we wrote and store it in the variable `favorite`. Note that the prompt argument is optional, so we can simply run `input()` without an argument and it will leave us at an empty prompt waiting once again for us to hit **Enter**/**Return** before then returning that value.

### Prompting for Multiple Values

Now that we know how the `input` function works, let's create our first real script. In this script, we're going to ask the user to answer a series of questions, and store those answers in variables. In the next lesson, we'll then use these values.

Let's call our script `bio.py`, and in this script, we'll ask for the following:

- The user's name
- The user's favorite color
- The user's age

Create and open `bio.py` in your text editor and call `input` three different times, once for each piece of information that we want:

*~/code/bio.py*

```python
name = input("What is your name? ")
color = input("What is your favorite color? ")
age = input("How old are you today? ")
```

Both `name` and `color` make sense to be strings, but `age` should be a number. Let's cast the value returned from the age prompt to be an `int` before assigning it to the variable. We can do this by placing the parenthesis for the `int` function around the entire `input` function call:

*~/code/bio.py*

```python
name = input("What is your name? ")
color = input("What is your favorite color? ")
age = int(input("How old are you today? "))
```

Now that we've written our script, let's run it:

```python
$ python3.7 bio.py
What is your name? Kevin Bacon
What is your favorite color? Orange
How old are you today? 61
$
```

We didn't do anything with the values that were
returned, but since we were returned to our shell without an error we
know that everything executed properly. If we were to give an invalid
answer for the age question (something that wasn't an `int`) Python will raise an error. We need to keep that in mind.

---

## The `print` Function

### Documentation

[Built-in Functions - Python 3.8.1 documentation](https://docs.python.org/3/library/functions.html#print)

### The print Function

As with most things in programming, there's more than one way for us to achieve our goal of printing the user's information in the proper format. For the exam, we need to understand how to use the `sep` and `end` optional arguments to the `print` function.

Let's take a quick look at how the `print` function works by default and also when we set the `sep` and `end` arguments.

*~/code/bio.py*

```python
name = input("What is your name? ")
color = input("What is your favorite color? ")
age = int(input("How old are you today? "))

print(name)
print("is " + str(age) + " years old")
print("and loves the color " + color + ".")
```

If we run this now we'll see this:

```python
$ python3.7 bio.py
What is your name? Kevin Bacon
What is your favorite color? Orange
How old are you today? 61
Kevin Bacon
is 61 years old
and loves the color Orange.
```

Every time we call `print`, the string will be printed to the screen with a trailing newline, so
the next print will always be on the next line. We can change this by setting the `end` value using a keyword argument. The `end` argument is set to `'\n'` by default, but if we change it to `' '` then it should print the three lines as one. When a function takes multiple arguments, then we separate them using commas. And for keyword arguments, we use the argument's name `=` the value that we want it to use. We'll learn more about how arguments work for functions later, but this is enough for now.

Let's modify our script to set the `end` value:

*~/code/bio.py*

```python
name = input("What is your name? ")
color = input("What is your favorite color? ")
age = int(input("How old are you today? "))

print(name, end=" ")
print("is " + str(age) + " years old", end=" ")
print("and loves the color " + color + ".", end=" ")
```

Running it again shows this:

```python
$ python3.7 bio.py
What is your name? Kevin Bacon
What is your favorite color? Orange
How old are you today? 61
Kevin Bacon is 61 years old and loves the color Orange.
```

We've successfully printed out what we needed to, but it feels a little tedious. The `print` function can take any number of arguments before we use keyword arguments like `sep` and `end`. It will then print each argument separated by the `sep` character which is `''` by default. If we set this to a single space then we should be able to use a single `print` call to print the sentence properly.

Let's see what this looks like:

*~/code/bio.py*

```python
name = input("What is your name? ")
color = input("What is your favorite color? ")
age = int(input("How old are you today? "))

print(name, 'is', age, 'years old and loves the color', color, '.', sep=" ")
```

Running it again shows this:

```python
$ python3.7 bio.py
What is your name? Kevin Bacon
What is your favorite color? Orange
How old are you today? 61
Kevin Bacon is 61 years old and loves the color Orange .
```

We're so close, but there's an extra space between the color and the period. We'll need to combine those into a single string instead.

*~/code/bio.py*

```python
name = input("What is your name? ")
color = input("What is your favorite color? ")
age = int(input("How old are you today? "))

print(name, 'is', age, 'years old and loves the color', color + '.', sep=" ")
```

---

## Making Calculations from User Input with Python - LAB(1)

Convert Fahrenheit into Celsius

```python
#! /usr/bin/env python3.7

# Code starts here

    # First we need the Fahrenheit input from the user
fahrenheit = float(input("What temperature (in Fahrenheit) would you like converted in Celsius? " ))
celsius = (fahrenheit - 32) * 5/9

    # Show result
print(fahrenheit, "°F is", round(celsius, 2), "°C")
```

---

---

---

# Strings, Operations, and Calculations

## Understanding Immutability

### Documentation

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#immutable-sequence-types)

### Why Does Immutability Matter?

Immutability is something that we don't always have to think about, but it does matter in a few very common cases:

1. Understanding why we can't modify a string in-place
2. Using objects as keys for dictionaries (we'll get to this later)

We'll cover dictionaries in a different section, but when it comes to strings, wanting to modify a string variable is fairly common. Strings are an immutable type in Python, so we can't change a string object. We can only create new strings with the modifications that we wanted. This
means that the only way for us to change the string value of a variable is to explicitly reassign it. As we learn about mutable types, we'll see that other types allow us to modify the value of a variable without explicitly reassigning it.

### Immutability of Strings

When looking at [str](https://docs.python.org/3/library/stdtypes.html#str) class there are many methods that *return* a `str` to us, such as `capitalize`:

```python
>>> my_str = 'testing'
>>> my_str.capitalize()
'Testing'
>>> my_str
'testing'
```

We won't find a method that changes the value of `my_str` in this example. Beyond this, each unique string that we can only type will only exist once in memory. In our case, we referenced the literal `'testing'` when we assigned the value to our variable, and if we ever use the literal of `'testing'` again it will point to the same point in memory, because that value can't be modified.

```python
>>> id(my_str)
4522355248
>>> id('testing')
4522355248
```

This feature prevents the same value being allocated more than once and taking up more spots in our computer's memory than we need it to.

---

## The Len Function

### Documentation For This Video

[Built-in Functions - Python 3.8.1 documentation](https://docs.python.org/3/library/functions.html#len)

### The `len` Function

Needing to know the length of a string is very common. Thankfully, the `[len` function](https://docs.python.org/3/library/functions.html#len) will return how many characters are in a string:

```python
>>> len('testing') # len ('string')
7
>>> len('')
0
```

This may seem a little boring, but it will help us to keep from causing too many errors when we start learning about indexing and slicing in the next lesson.

---

## String Indexing and Slicing

Sometimes we need to access a specific item, or a subset of items, in a sequence. To do that in Python, we'll use indexing and slicing.

### Documentation For This Video

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str)

### Indexing

> "Look at invidual items in a string"

When we need to access a single item from a sequence, like a string, we'll use "indexing." Every item in a sequence type has an index that indicates the item's position in the sequence. The first item in a Python sequence has the index of `0`, and each subsequent item's index increases by one. To perform indexing, we'll use square brackets (`[` and `]`) on the right-hand side of our string (or string variable), and within the square brackets we'll put the index number that we'd like to access:

```python
>>> test_str = 'testing'
>>> test_str[0]
't'
```

There isn't a character type in Python, so the return value will be a length one string. When indexing a string, the index *must* exist, otherwise, Python will raise an error:

```python
>>> test_str[10]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: string index out of range
```

This is one of the areas where using `len` can help us avoid using an index that is too high. But since the starting index is `0`, then the final index will always be `len(test_str) - 1`:

```python
>>> test_str[len(test_str) - 1]
'g'
```

If we try to use a negative index, it will actually start giving us items relative to the end of the string:

```python
>>> test_str[-1]
'g'
>>> test_str[-4]
't'
>>> test_str[-8]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: string index out of range
```

### Slicing

If we want to get a subsection of our string then we'll do what is called slicing. Slicing allows us to specify the index of the first element that we would like, followed by the index *just beyond* the last item that we'd like. We separate these indexes by using a colon (`:`)

```python
>>> test_str[0:2] # Returns characters with index 0 & 1
'te'
>>> test_str[3:5] # Returns 3 & 4 
'ti'
```

If we'd like to get all of the items after our starting index then we can use the length of the string as our second index, even though it's technically out of range. Or we can simply put nothing after the colon:

```python
>>> test_str[2:len(test_str)]
'sting'
>>> test_str[2:] # Same command (shorthand)
'sting'
```

The last thing to mention about slicing is that there is a third number that we can use: the "step" value. By default, this value is `1` and just means that we'll go one-by-one through the sequence. But we can change this to grab every other item if we'd like by adding a second colon and the step size that we'd like to use:

```python
>>> test_str
'testing'
>>> test_str[1:5:2] # Where '2' is the number of "steps".
'et'
>>> test_str[1::2]
'etn'
```

One neat thing that we can do with this step option is stepping backward by using a negative step value. We can reverse an entire string by leaving off the start and end indexes and setting the step value to `-1`:

```python
>>> test_str[::-1]
'gnitset'
```

---

## Indexing and Slicing Python Strings - LAB(2)

### Script

```python
#!/usr/bin/env python3.7

message = input ("Enter a message: ")
#message = 'Test message'

print("First character: ", message[0])
print("Last character: ", message[-1])

# Printing the 'Middle character'
print("Middle character: ", message[int(len(message)/2)])

# Printing even index characters
print("Even charcaters: ", message[0::2])
print("Odd characters: ", message[1::2])

# Printing the message in reverse
print("Reversed message: ", message[::-1])
```

### Result

```bash
[cloud_user@didijsaq1c Code]$ ./string-info.py
Enter a message: 0123456789
First character:  0
Last character:  9
Middle character:  5
Even charcaters:  02468
Odd characters:  13579
Reversed message:  9876543210
[cloud_user@didijsaq1c Code]$
```

---

---

---

# Lists

## Lists

### Python Documentation For This Video

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#sequence-types-list-tuple-range)

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#list)

### Lists

We create a list in Python by using the square brackets (`[]`) and separating the values with commas. Here's an example list:

```python
>>> my_list = [1, 2, 3, 4, 5]
```

For standard use, there's not a limit to how long our list can be. Lists are a heterogeneous collection type, so the items within the list do not all need to be of the same type:

```python
>>> other_list = ['a', 1, 1.0, False]
```

### Reading from Lists

To access an individual element of a list, we index it the same way that we would for a character in a string:

```python
>>> my_list[0]
1
>>> my_list[2]
2
```

If we try to access an index that is too high (or too low) then we'll receive an error:

```python
>>> my_list[5]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: list index out of range
```

To make sure that we're not trying to get an index that is out of range, we can test the length using the `len` function (and then subtract 1):

```python
>>> len(my_list)
5
```

Additionally, we can access subsections of a list by "slicing" it. We provide the starting index and the ending index (the object at that index won't be included):

```python
>>> my_list[0:2]
[1, 2]
>>> my_list[1:0]
[2, 3, 4, 5]
>>> my_list[:3]
[1, 2, 3]
>>> my_list[0::1]
[1, 2, 3, 4, 5]
>>> my_list[0::2]
[1, 3, 5]
```

### Modifying a List

Unlike strings, which can't be modified (we can't change a character in a string), we can change a value in a list using the subscript equals operation:

```python
>>> my_list[0] = "a"
>>> my_list
['a', 2, 3, 4, 5]
```

Lists can be added together (concatenated). This operation will return a new list, but we can use the `+=` compound operator to add items to the end of our lists:

```python
>>> my_list + [8, 9, 10]
['a', 2, 3, 4, 5, 6, 7, 8, 9, 10]
>>> my_list += [8, 9, 10]
>>> my_list
['a', 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

Items in lists can be set using slices as well:

```python
>>> my_list[1:3] = ['b', 'c']
>>> my_list
['a', 'b', 'c', 4, 5, 6, 7, 8, 9, 10]
```

Slicing and
assigning can still be used if the slice size is smaller than the list being assigned. This will insert additional elements:

```python
>>> my_list[3:5] = ['d', 'e', 'f']
>>> print(my_list)
['a', 'b', 'c', 'd', 'e', 'f', 6, 7, 8, 9, 10]
```

We can remove a section of a list by assigning an empty list to the slice:

```python
>>> my_list = ['a', 'b', 'c', 'd', 5, 6, 7]
>>> my_list[4:] = []
>>> my_list
['a', 'b', 'c', 'd']
```

### Removing Items from a List

Another way that we can remove an item from a list is by using the `del` statement and the indexing operation:

```python
>>> my_list = ['a', 'b', 'c', 'd']
>>> del my_list[0]
>>> my_list
['b', 'c', 'd']
```

One thing to note about `del` is that it will remove the *entire list variable* if we don't pass it an index:

```python
>>> del my_list
>>> my_list
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'my_list' is not defined
```

---

## List Functions and Methods

### Documentation

[5. Data Structures - Python 3.8.1 documentation](https://docs.python.org/3/tutorial/datastructures.html#more-on-lists)

[Built-in Functions - Python 3.8.1 documentation](https://docs.python.org/3/library/functions.html#sorted)

[Built-in Functions - Python 3.8.1 documentation](https://docs.python.org/3/library/functions.html#reversed)

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#common-sequence-operations)

### List Methods

When it comes to lists, some methods allow us to easily achieve the same things that we previously did using operators, and in an arguably more readable way. Indexing and slicing for the sake of reading objects is easy enough, but when it comes to adding new items to a list, there
are better methods.

If we want to add an object to the end of a list, then we can use the `append` method:

```python
>>> my_list = [1, 2, 3]
>>> my_list.append(4)
>>> my_list
[1, 2, 3, 4]
```

Additionally, if we'd like to insert an item at a particular index, we can use the `insert` method:

```python
>>> my_list.insert(0, 'a')
>>> my_list
['a', 1, 2, 3, 4]
```

Notice that we didn't replace the item that had previously been at the `0` index. We moved all items at or after the desired index, further back in the list.

If we need to know the index of an item in a list (if the item is in the list), then we have the `index` method:

```python
>>> my_list = [1, 2, 3]
>>> my_list.index(2)
1
>>> my_list.index(15)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: 15 is not in list
```

Since `index` raises an error, it's not something that we'll usually want to use by itself. Thankfully, there's an easy way for us to determine if an item is in a list.

### The `in` and `not in` Operators

Sequence types have a few additional operators that make it easy for us to check the contents. The `in` and `not in` operators take a value that we'd like to search the sequence for on the left-hand side and a sequence on the right-hand side:

```python
>>> my_list = [1, 2, 3]
>>> 4 in my_list
False
>>> 4 not in my_list
True
>>> 2 in my_list
True
```

These operators are great to use before employing the `index` method to ensure that we don't get a `ValueError`.

### Helpful Functions

Besides methods, some built-in functions work great with lists. We've already seen the `len` function that will return the length of the list to us, but if we need to sort the contents of a list, then we have the `sorted` and `reversed` functions:

```python
>>> my_list = [1, 3, 4, 8, 2]
>>> sorted(my_list)
[1, 2, 3, 4, 8]
>>> reversed(my_list)
<list_reverseiterator object at 0x110330d90>
```

The `reversed` function doesn't return a list, but typecasting works for the `list` type also, and when we have a list iterator we can turn it back into a list using the `list` function:

```python
>>> reversed(my_list)
<list_reverseiterator object at 0x110330d90>
>>> list(reversed(my_list))
[2, 8, 4, 3, 1]
```

If we want to sort, reverse, and get a list back, we can combine all three of these functions:

```python
>>> list(reversed(sorted(my_list)))
[8, 4, 3, 2, 1]
```

---

## Nested Lists: Matrices and Cubes

Lists are a heterogeneous data structure and can hold onto a variety of data types, this includes other lists. In this lesson, we'll take a look at how we can model matrices in Python by nesting lists.

### Creating a Matrix

Matrices are a structure that has rows and columns. To model a matrix in Python, we need a new list for each row, and we'll need to make sure that each list is the same length so that the columns work properly.

Here's an example matrix not in code:

```
1 2 3
4 5 6
```

To model this matrix in Python, we'll do this:

```python
>>> my_matrix = [[1, 2, 3],
...              [4, 5, 6]]
>>> my_matrix
[[1, 2, 3], [4, 5, 6]]
```

To determine how many rows are in a multi-dimensional list, we need to use the `len` function on the matrix itself. To get the number of columns, we would use `len` on any row in the matrix (assuming that it's a proper matrix with each row having the same number of columns):

```python
>>> row_count = len(my_matrix)
>>> column_count = len(my_matrix[0])
>>> row_count
2
>>> column_count
3
```

Now if we want to interact with an individual item in the matrix, we need to index our variable two times, first with the row, and second with the column:

```python
>>> my_matrix[0][1]
2
```

### Squares and Cubes

Matrixes with specific dimensions have names. If a matrix has the same number of rows as columns, then it can be classified as a "cube", and some cubes have unique names. A square is 2x2, and a cube (like the 3D shape) is 3x3. The matrix that we've already created is a 2x3 matrix, and this doesn't have a special name.

---

## Using Python Lists - LAB (3)

### Exercise

```python
# 1) Set the users variable to be an empty list

assert users == [], f"Expected `users` to be [] but got: {repr(users)}"

# 2) Add 'kevin', 'bob', and 'alice' to the users list in that order without reassigning the variable.

assert users == ['kevin', 'bob', 'alice'], f"Expected `users` to be ['kevin', 'bob', 'alice'] but got: {repr(users)}"

# 3) Remove 'bob' from the users list without reassigning the variable.

assert users == ['kevin', 'alice'], f"Expected `users` to be ['kevin', 'alice'] but got: {repr(users)}"

# 4) Reverse the users list and assign the result to `rev_users`

assert rev_users == ['alice', 'kevin'], f"Expected `rev_users` to be ['alice', 'kevin'] but got: {repr(rev_users)}"

# 5) Add the user 'melody' to users where 'bob' used to be.

assert users == ['kevin', 'melody', 'alice'], f"Expected `users` to be ['kevin', 'melody', 'alice'] but got: {repr(users)}"

# 6) Add the users 'andy', 'wanda', and 'jim' to the users list using a single command

assert users == ['kevin', 'melody', 'alice', 'andy', 'wanda', 'jim'], f"Expected `users` to be ['kevin', 'melody', 'alice', 'andy', 'wanda', 'jim'] but got: {repr(users)}"

# 7) Slice the users lists to return the 3rd and 4th items and assign the result to `center_users`

assert center_users == ['alice', 'andy'], f"Expected `users` to be ['alice', 'andy'] but got: {repr(center_users)}"
```

### Solution

```python
# 1) Set the users variable to be an empty list
users = []
assert users == [], f"Expected `users` to be [] but got: {repr(users)}"

# 2) Add 'kevin', 'bob', and 'alice' to the users list in that order without reassigning the variable.
users.append('kevin')
users.append('bob')
users.append('alice')
assert users == ['kevin', 'bob', 'alice'], f"Expected `users` to be ['kevin', 'bob', 'alice'] but got: {repr(users)}"

# 3) Remove 'bob' from the users list without reassigning the variable.
del users[1]
assert users == ['kevin', 'alice'], f"Expected `users` to be ['kevin', 'alice'] but got: {repr(users)}"

# 4) Reverse the users list and assign the result to `rev_users`
rev_users = list(reversed(users))
assert rev_users == ['alice', 'kevin'], f"Expected `rev_users` to be ['alice', 'kevin'] but got: {repr(rev_users)}"

# 5) Add the user 'melody' to users where 'bob' used to be.
users.insert(1, 'melody')
assert users == ['kevin', 'melody', 'alice'], f"Expected `users` to be ['kevin', 'melody', 'alice'] but got: {repr(users)}"

# 6) Add the users 'andy', 'wanda', and 'jim' to the users list using a single command
users += ['andy', 'wanda', 'jim']
assert users == ['kevin', 'melody', 'alice', 'andy', 'wanda', 'jim'], f"Expected `users` to be ['kevin', 'melody', 'alice', 'andy', 'wanda', 'jim'] but got: {repr(users)}"

# 7) Slice the users lists to return the 3rd and 4th items and assign the result to `center_users`
center_users = users[2:4]
assert center_users == ['alice', 'andy'], f"Expected `users` to be ['alice', 'andy'] but got: {repr(center_users)}"
```

---

---

---

# Tuples

## Tuples

### Documentation

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#sequence-types-list-tuple-range)

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#tuple)

### Tuples

Tuples are a fixed width, immutable sequence type. We create tuples using parenthesis (`()`) and at least one comma (`,`):

```python
>>> point = (2.0, 3.0)
```

Since tuples are immutable, we don't have access to the same methods that we do on a list. We can use tuples in some operations like concatenation, but we can't change the original tuple that we created:

```python
>>> point_3d = point + (4.0,)
>>> point_3d
(2.0, 3.0, 4.0)
```

One interesting characteristic of tuples is that we can unpack them into multiple variables at the same time:

```python
>>> x, y, z = point_3d
>>> x
2.0
>>> y
3.0
>>> z
4.0
```

When we'll most likely to see tuples is while looking at a format string that's compatible with Python 2 (though this will go away soon):

```python
>>> print("My name is: %s %s" % ("Keith", "Thompson"))
```

---

## Tuples Versus Lists

One of the biggest questions that we'll have when working with collections is whether we should use a tuple or a list. In this lesson, we'll take a look at when each is useful.

### Tuples vs Lists

When determining if we should use a list or a tuple, we need to ask ourselves one important question:

> Will we ever not know the exact number of items that we're storing?

If we answer "yes" to this question, then we should use a list. Lists are great for holding onto real collections: users, phone numbers, etc.

Tuples make more sense in two general situations:

1. When we're trying to return more than one piece of information from a function
2. If we want to model something that has a specific number of fields that we can positionally hold in a tuple:
    - This would be something like a point in 2D or 3D space having `x`, `y`, and potentially `z`. Those values should always be in a specific spot.

Another way that this could be used is to quickly model a "person" that has a name, age, and phone number:

```python
>>> person = ('Kevin Bacon', 61, '555-555-5555')
>>> person2 = ('Bob Ross', 76, '')
>>> person[0]
'Kevin Bacon'
>>> person2[0]
'Bob Ross'
```

In this case index, `0` will always return the "name" for a person stored as a tuple.

### Lists in Tuples and Tuples in Lists

To be thorough, we need to understand how having lists within tuples (and tuples within lists) works. Let's start with lists within tuples, followed by tuples within lists:

```python
>>> my_list = [1, 2, 3]
>>> my_tuple = (my_list, 1)
>>> my_tuple
([1, 2, 3], 1)
>>> other_list = [1, 2, my_tuple]
>>> other_list
[1, 2, ([1, 2, 3], 1)]
```

We're able to embed lists in tuples and tuples in lists without issues. It's worth noting that tuples are immutable, but they do not require that the items within the tuple be immutable. We can modify the list that is inside of `my_tuple`:

```python
>>> my_tuple
([1, 2, 3], 1)
>>> my_list.append(1)
>>> my_tuple
([1, 2, 3, 1], 1)
```

---

---

---

# Dictionaries

## Dictionaries

### Documentation

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#mapping-types-dict)

### Dictionaries

Dictionaries are the main mapping type that we'll use in Python. This object is comparable to a Hash or "associative array" in other languages.

Things to note about dictionaries:

1. Unlike Python 2 dictionaries, Python 3.7 keys are ordered in dictionaries. We will need `OrderedDict` if we want this to work on another version of Python.
2. You can set the key to any IMMUTABLE TYPE (no lists).
3. Avoid using things other than simple objects as keys.
4. Each key can only have one value (so we don't have duplicates when creating with `dict`).

We create dictionary literals by using curly braces (`{` and `}`), separating keys from values using colons (`:`), and separating key/value pairs using commas (`,`). Here's an example dictionary:

```python
>>> ages = { 'kevin': 59, 'alex': 29, 'bob': 40 }
>>> ages
{'kevin': 59, 'alex': 29, 'bob': 40}
```

We can read a value from a dictionary by subscripting using the key:

```python
>>> ages['kevin']
59
>>> ages['billy']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'billy'
```

Keys can be added or changed using subscripting and assignment:

```python
>>> ages['kayla'] = 21
>>> ages
{'kevin': 59, 'alex': 29, 'bob': 40, 'kayla': 21}
```

Items can be removed from a dictionary using the `del` statement:

```python
>>> del ages['kevin']
>>> ages
{'alex': 29, 'bob': 40, 'kayla': 21}
>>> del ages
>>> ages
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ages' is not defined
```

### The `in` and `not in` Operators

Just like with lists and tuples, dictionaries have access to the `in` and `not in` operators. Notably, this only considers the keys:

```python
>>> ages = {'kevin': 59, 'bob': 40}
>>> 'kevin' in ages
True
>>> 59 in ages
False
```

### Alternative Ways to Create a `dict` Using Keyword Arguments

There are a few other ways to create dictionaries that we might see, which are those using the `dict` constructor with key/value arguments and a list of tuples:

```python
>>> weights = dict(kevin=160, bob=240, kayla=135)
>>> weights
{'kevin': 160, 'bob': 240, 'kayla': 135}
>>> colors = dict([('kevin', 'blue'), ('bob', 'green'), ('kayla', 'red')])
>>> colors
{'kevin': 'blue', 'bob': 'green', 'kayla': 'red'}
```

---

## Dictionary Methods

The `dict` type has plenty of useful methods that we should know, in order to make them even more useful in our code. This lesson illustrates the main methods that we'll use:

- `keys`
- `values`
- `items`

### Documentation For This Video

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#mapping-types-dict)

### Dictionary Methods

When we're working with dictionaries, we often need to perform actions on all of the keys, all of the values, or each pair (item).
Thankfully the `keys`, `values`, and `items` methods each return something to make this easier. Let's take a look at the `key` method first:

```python
>>> ages = {'kevin': 61, 'bob' 79}
>>> ages.keys()
dict_keys(['kevin', 'bob'])
```

Take notice of the return value, it's a `dict_keys` item. This by itself may not seem useful, but it can be cast to a list if that type makes more sense for what we're doing:

```python
>>> list(ages.keys())
['kevin', 'bob']
```

We'll also follow this pattern for both `values` and `items`:

```python
>>> ages.values()
dict_values([61, 79])
>>> list(ages.values())
[61, 79]
>>> ages.items()
dict_items([('kevin', 61), ('bob', 79)])
>>> list(ages.items())
[('kevin', 61), ('bob', 79)]
```

Because each item in a dictionary is a key and value, the result of `items` (when typecast to a list) is a list of 2-tuples (often called "pairs"). This is a good example of using a tuple, because we know these items will *always* be two items long.

As we learn about iterating, these methods will become incredibly valuable for doing useful things with dictionaries.

---

## Using Python Dictionaries - LAB

### Additional Information and Resources

From within the `using-dictionaries.py` file, we'll be modifying the `users` list so that the assertions throughout the file all succeed eventually. As we're working through the tasks we can run the file. Whenever Python gets to a line that starts with `assert`, it will raise an error and stop executing if we haven't met the criteria. The first error will look like this:

```python
$ python3.7 using-dictionaries.py
Traceback (most recent call last): File "using-dictionaries.py", line 3, in <module> assert users == [], f"Expected `users` to be [] but got: {repr(users)}"
NameError: name 'users' is not defined
```

This process will show us the line where the issue was encountered, and show us the
differences between our expected and actual values.

### Starting Script

```python
# 1) Set the emails variable to be an empty dictionary

assert emails == {}, f"Expected `emails` to be {{}} but got: {repr(emails)}"

# 2) Add 'ashley', 'craig', and 'elizabeth' to the emails dictionary without reassigning the variable.

assert emails == {
    "ashley": "ashley@example.com",
    "craig": "craig@example.com",
    "elizabeth": "elizabeth@example.com",
}, f"Expected `emails` to be {{'ashley': 'ashley@example.com', 'craig': 'craig@example.com', 'elizabeth': 'elizabeth@example.com'}} but got: {repr(emails)}"

# 3) Remove 'craig' from the emails dictionary without reassigning the variable.

assert emails == {
    "ashley": "ashley@example.com",
    "elizabeth": "elizabeth@example.com",
}, f"Expected `emails` to be {{'ashley': 'ashley@example.com', 'elizabeth': 'elizabeth@example.com'}} but got: {repr(emails)}"

# 4) Add 'dalton' to the emails dictionary without reassigning the variable.

assert emails == {
    "ashley": "ashley@example.com",
    "elizabeth": "elizabeth@example.com",
    "dalton": "dalton@example.com",
}, f"Expected `emails` to be {{'ashley': 'ashley@example.com', 'elizabeth': 'elizabeth@example.com', 'dalton': 'dalton@example.com'}} but got: {repr(emails)}"

# 5) Return a list of keys from the emails dictionary as `users`

assert users == [
    "ashley",
    "elizabeth",
    "dalton",
], f"Expected `users` to be ['ashley', 'elizabeth', 'dalton'] but got: {repr(users)}"

# 6) Return a list of values from the emails dictionary as `email_list`

assert email_list == [
    "ashley@example.com",
    "elizabeth@example.com",
    "dalton@example.com",
], f"Expected `email_list` to be ['ashely@example.com', 'elizabeth@example.com', 'dalton@example.com'] but got: {repr(email_list)}"

# 7) Return a list of tuples called `pairs` representing the key/value pairs in `emails`.

assert pairs == [
    ("ashley", "ashley@example.com"),
    ("elizabeth", "elizabeth@example.com"),
    ("dalton", "dalton@example.com"),
], f"Expected `pairs` to be [('ashley', 'ashley@example.com'), ('elizabeth', 'elizabeth@example.com'), ('dalton', 'dalton@example.com')] but got: {repr(pairs)}"
```

### Solution

```python
# 1) Set the emails variable to be an empty dictionary
emails = {}

assert emails == {}, f"Expected `emails` to be {{}} but got: {repr(emails)}"

# 2) Add 'ashley', 'craig', and 'elizabeth' to the emails dictionary without reassigning the variable.

emails['ashley'] = 'ashley@example.com'
emails['craig'] = 'craig@example.com'
emails['elizabeth'] = 'elizabeth@example.com'

assert emails == {
    "ashley": "ashley@example.com",
    "craig": "craig@example.com",
    "elizabeth": "elizabeth@example.com",
}, f"Expected `emails` to be {{'ashley': 'ashley@example.com', 'craig': 'craig@example.com', 'elizabeth': 'elizabeth@example.com'}} but got: {repr(emails)}"

# 3) Remove 'craig' from the emails dictionary without reassigning the variable.
del emails['craig']

assert emails == {
    "ashley": "ashley@example.com",
    "elizabeth": "elizabeth@example.com",
}, f"Expected `emails` to be {{'ashley': 'ashley@example.com', 'elizabeth': 'elizabeth@example.com'}} but got: {repr(emails)}"

# 4) Add 'dalton' to the emails dictionary without reassigning the variable.
emails['dalton'] = 'dalton@example.com'

assert emails == {
    "ashley": "ashley@example.com",
    "elizabeth": "elizabeth@example.com",
    "dalton": "dalton@example.com",
}, f"Expected `emails` to be {{'ashley': 'ashley@example.com', 'elizabeth': 'elizabeth@example.com', 'dalton': 'dalton@example.com'}} but got: {repr(emails)}"

# 5) Return a list of keys from the emails dictionary as `users`
users = list(emails.keys())

assert users == [
    "ashley",
    "elizabeth",
    "dalton",
], f"Expected `users` to be ['ashley', 'elizabeth', 'dalton'] but got: {repr(users)}"

# 6) Return a list of values from the emails dictionary as `email_list`
email_list = list(emails.values())

assert email_list == [
    "ashley@example.com",
    "elizabeth@example.com",
    "dalton@example.com",
], f"Expected `email_list` to be ['ashely@example.com', 'elizabeth@example.com', 'dalton@example.com'] but got: {repr(email_list)}"

# 7) Return a list of tuples called `pairs` representing the key/value pairs in `emails`.
pairs = list(emails.items())

assert pairs == [
    ("ashley", "ashley@example.com"),
    ("elizabeth", "elizabeth@example.com"),
    ("dalton", "dalton@example.com"),
], f"Expected `pairs` to be [('ashley', 'ashley@example.com'), ('elizabeth', 'elizabeth@example.com'), ('dalton', 'dalton@example.com')] but got: {repr(pairs)}"
```

---

---

---

# Strings

## String Encodings and Functions

Strings hold onto characters and those characters don't need to be alphanumeric. Depending on how a string is encoded, some characters might not be valid. Before we can dig into string encodings, we need to take a look at some of the functions that allow us to interact with Unicode code points (the numbers behind characters). In this video, we'll delve into the `ord` and `chr` functions.

### Documentation For This Video

- [The `ord` Function](https://docs.python.org/3/library/functions.html#ord)
- [The `chr` Function](https://docs.python.org/3/library/functions.html#chr)

### What are Unicode Code Points?

In Python 3, strings are Unicode by default (specifically UTF-8 encoded). Behind the scenes, each character is stored as its Unicode code point, but what does that mean? Unicode is an encoding standard that allows all sorts of unique characters across different languages to have consistent, unique numeric values. For instance, the code point for the letter `a` is `97`, but the character that isn't commonly typed out like the trademark symbol `™` has a code point of `8482`. Unicode is a standard, but there are different encodings, one of the most commonly used being UTF-8. UTF-8 stands for "Unicode Transformation Format," with the "8" meaning that values are 8-bits in length. 1,112,064 valid Unicode code points can be encoded with UTF-8.

Up to this point, we've been working with strings that use standard ASCII characters (letters, numbers, and common punctuation). ASCII is an older specification with 256 named characters. Their  corresponding code points and the first 128 are also valid UTF-8 values. The trademark symbol is in the ASCII specification under the extended characters table, so it has an ASCII numeric value between 128 - 255, but a completely different Unicode code point.

To make things even more confusing, Unicode code points are sometimes represented in decimal form and other times by using a 'U+' with the hexadecimal form of the same number. So '™' is `8482`, but if you search the internet, you'll usually see it written as `U+2122`.

### Going from Code Point to String and Vice Versa

Now that we have an idea of what code points are and how encodings work let's see how we can work with them in Python. If we want to see the code point for a character that we know how to type, then we can use the `[ord](https://docs.python.org/3/library/functions.html#ord)` function. This function takes a single character and will return the decimal code point. Let's see what this looks like for the letter `l`:

```python
>>> ord('l')
108
```

If we try to use `ord` with more than one character, then it will raise an error:

```python
>>> ord('la')
Traceback (most recent call last):
  File "<input>", line 1, in <module>
    ord('la')
TypeError: ord() expected a character, but string of length 2 found
```

If we already know the Unicode code point for a character that is more difficult to type, like the trademark symbol, then we can type it out using the hexadecimal notation if we prefix the number with `\u`:

```python
>>> ord('\u2122')
8482
```

Notice that `ord` took a single character as the argument, but didn't give us an error when we escaped the Unicode code point by using the `\u`. This is because a Python string is UTF-8 encoded by default, and although it looks like more than one character to us, that is a single character in UTF-8.

It's also worth noting that when the string `\u2122` is evaluated in Python, it will print the character that we're expecting:

```python
>>> '\u2122'
'™'
>>> '\u2124'
'?'
```

Say we want to take a decimal code point and convert it back into a string. To do that we'll need to use the `[chr](https://docs.python.org/3/library/functions.html#chr)` function:

```python
>>> chr(8482)
'™'
```

Because we can write integers in hexadecimal notation using the `0x` prefix, and those numbers then get converted into the decimal value, we are also able to use that form with the `chr` function:

```python
>>> chr(0x2122)
'™'
```

---

## Useful String Methods, Part 1

As strings are one of the most important and common types that we work with, we're going to dive into some different sets of methods that we have at our disposal when working with strings.
In this lesson, we'll take a look at some capitalization methods and how to evaluate the contents of a string against common patterns.

### Documentation For This Video

- [The `str.lower` Method](https://docs.python.org/3/library/stdtypes.html#str.lower)
- [The `str.upper` Method](https://docs.python.org/3/library/stdtypes.html#str.upper)
- [The `str.capitalize` Method](https://docs.python.org/3/library/stdtypes.html#str.capitalize)
- [The `str.is___` Family of Methods](https://docs.python.org/3/library/stdtypes.html#str.isalnum)

### Changing String Capitalization

When working with strings, it's not uncommon for us to want to change the capitalization of the string. We can make comparisons easier or to improve the way that we display the value. Thankfully, Python provides us with simple methods on the `str` class for just these purposes.

```python
>>> my_str = 'tEsTinG'
>>> my_str.lower()
'testing'
>>> my_str.upper()
'TESTING'
>>> my_str.capitalize()
'Testing'
```

The `[lower](https://docs.python.org/3/library/stdtypes.html#str.lower)` and `[upper](https://docs.python.org/3/library/stdtypes.html#str.capitalize)` methods are great for changing all of the characters in a string to either lowercase or uppercase. This is handy to do when capitalization doesn't matter and we want to compare against a value that we already know. For all intents and purposes, an email address: `Kevin@example.com` is the same as `kevin@example.com`. If we want to compare a user-provided value that could have odd capitalization with a known email address, then we could call `lower` before comparing the two values.

```python
email = input("Your Email: ")
print("Email is test@example.com:", email.lower() == 'test@example.com')
```

The `[capitalize](https://docs.python.org/3/library/stdtypes.html#str.capitalize)` method is a little different, as it will lowercase every character besides the first one. It doesn't take into consideration if that's the right thing to do for the words within the string. Because of this, you might not find yourself using `capitalize` all that often, but in many cases, it will work for single-word strings.

### Checking String Patterns with `.is___` Methods

Since strings are collections of characters, they can hold onto an incredible variety of information. But that doesn't mean that there aren't different patterns that the information could fall into. For instance, the string `'12'` is completely numeric. For these types of patterns, the `str` class provides a whole family of methods that start with `is`, such as `isnumeric`:

```python
>>> "12".isnumeric()
True
```

There are quite a few of these methods. Here's a list:

- `isascii` - Return True if all characters in the string are ASCII, False otherwise.
- `islower` - Return True if the string is a lowercase string, False otherwise.
- `isupper` - Return True if the string is an uppercase string, False otherwise.
- `istitle` - Return True if the string is a title-cased string (all words capitalized), False otherwise.
- `isspace` - Return True if the string is a whitespace string, False otherwise.
- `isdecimal` - Return True if the string is a decimal string (whole number), False otherwise.
- `isdigit` - Return True if the string is a digit string (whole number), False otherwise.
- `isnumeric` - Return True if the string is a numeric string (whole number), False otherwise.
- `isalpha` - Return True if the string is an alphabetic string, False otherwise.
- `isalnum` - Return True if the string is an alphanumeric string, False otherwise.
- `isidentifier` - Return True if the string is a valid Python identifier, False otherwise. String could be used as a variable, function, or class name.
- `isprintable` - Return True if the string is printable, False otherwise. Meaning that if the character can't be printed as-is, then it's not printable. So
escape characters like `\n` are considered not printable even though they change how the string is printed.

---

## Useful String Methods, Part 2

As strings are one of the most important and common data types that we work with, we're going to dive into some different sets of methods that we have at our disposal when working with strings.
In this lesson, we'll take a look at how to split strings apart, build them up from a list, and substitute information into a string using the `format` method.

### Documentation For This Video

- [The `str.split` Method](https://docs.python.org/3/library/stdtypes.html#str.split)
- [The `str.join` Method](https://docs.python.org/3/library/stdtypes.html#str.join)
- [The `str.format` Method](https://docs.python.org/3/library/stdtypes.html#str.format)
- [Python Format String Syntax](https://docs.python.org/3/library/string.html#formatstrings)

### Splitting and Joining Strings

Sometimes we have strings that we want to break into smaller pieces to work with. If we have a delimiter that we'd like to use to separate the string into smaller strings, then we're able to use the `[split](https://docs.python.org/3/library/stdtypes.html#str.split)` method to get a list of substrings. A simple example of this would be getting the individual words in a string by splitting on a single space (the default separator):

```python
>>> phrase = "This is a simple phrase"
>>> words = phrase.split()
>>> words
['This', 'is', 'a', 'simple', 'phrase']
```

Another way I've personally used this is to get the final segment of a URL by splitting on slashes and then selecting the last item in the list:

```python
>>> url = 'https://example.com/users/jimmy
>>> user = url.split('/')[-1]
>>> user
'jimmy'
```

Being able to split a string is useful, but we might also want to create a single string from a list of strings that we already have. To do this we can use the `[join](https://docs.python.org/3/library/stdtypes.html#str.join)` method. It's interesting because the string we start with will be the separator that we want inserted between the strings in the list. Let's take our `words` list and insert commas between the words instead of spaces:

```python
>>> phrase = "This is a simple phrase"
>>> words = phrase.split()
>>> ", ".join(words)
'This, is, a, simple, phrase'
```

A common way that `join` is used is by taking a list of lines forming them into a single string with new lines between the lines:

```python
>>> lines = ['First line', 'Second line', 'Third line']
>>> output = '\n'.join(lines)
>>> print(output)
First line
Second line
Third line
```

### Formatting Strings with `format`

The last method that we're going to talk about is the `[format](https://docs.python.org/3/library/stdtypes.html#str.format)` method. We often have a good idea of what a message needs to look like, but we want to have some dynamic information inserted into the middle of a string. Up to this point, we've been using the multiple arguments available to the `print` function, but sometimes we don't want to print the formatted string out.

The `[format](https://docs.python.org/3/library/stdtypes.html#str.format)` method allows us to place `{}` segments into a string and then have values added into those positions:

```python
>>> template = "Hello, my name is {}, and I really enjoy {}. Have a nice day!"
>>> template.format('Keith', 'Python')
'Hello, my name is Keith, and I really enjoy Python. Have a nice day!'
```

If we want to use the same value multiple times within the string, then we can place the item index within the `{}` values:

```python
>>>template = "Hello, my name is {0}, and I really enjoy {1}. Have a nice day! - {0}"
>>>template.format('Keith', 'Python')
'Hello, my name is Keith, and I really enjoy Python. Have a nice day! - Keith'
```

---

## Using Python String Methods - LAB

### Additional Information and Resources

Our script `variations.py` will allow us to provide a string and then it will present us with some permutations (all lowercase, all uppercase, etc), of that string. The script will also tell us the string's first and last words, when they are sorted alphabetically. We'll need to utilize numerous methods on the `str` class and some of the functions used to sort lists to make all of this this happen. Here's how we want the script to be used:

```python
$ ./variations.py
Enter a message: This is my message
Lowercase: this is my message
Uppercase: THIS IS MY MESSAGE
Capitalized: This is my message
Title Case: This Is My Message
Words: ['This', 'is', 'my', 'message']
Alphabetic First Word: is
Alphabetic Last Word: This
```

### Script

```python
#!/usr/bin/env python3.7

# Python implementation here
message = input("Enter a message: ")
print("lowercase: ", message.lower())
print("uppercase: ", message.upper())
print("Capitalize: ", message.capitalize())
print("Title: ", message.title())

	# Split into words
words = message.split()
print("Words: ", words)

	# Words that come first and last
sorted_words = sorted(words)
print("Alphabeticly Sorted Words: ", sorted_words)
print("Alphabetic First Word: ", sorted_words[0])
print("Alphabetic Last Word: ", sorted_words[-1])
```

### Result

```python
[cloud_user@didijsaq1c Code]$ ./variation.py 
Enter a message: This is a test message
lowercase:  this is a test message
uppercase:  THIS IS A TEST MESSAGE
Capitalize:  This is a test message
Title:  This Is A Test Message
Words:  ['This', 'is', 'a', 'test', 'message']
Alphabeticly Sorted Words:  ['This', 'a', 'is', 'message', 'test']
Alphabetic First Word:  This # Because of Capitalization, could have used .lower()
Alphabetic Last Word:  test
[cloud_user@didijsaq1c Code]$
```

---

---

---

# Conditionals

## The `if` and `else` Statements

Up to this point, all of the code that we've written will always execute sequentially regardless of the inputs that we provide (assuming that we don't cause an error). In this lesson, we're going to learn
about conditionals. Conditionals allow us to add branching logic to our code, and take different actions based on conditions.

### Documentation For This Video

- [The `if` and `else` Statements](https://docs.python.org/3/tutorial/controlflow.html#if-statements)

### The `if` and `else` Statements

With a grasp on comparisons, we can now look at how to use
conditionals to run different pieces of logic based on values. The main keywords for conditionals in Python are `if` and `else`. Conditionals are the first language feature we're using that require us to utilize whitespace to separate our code blocks. We will always use 4 spaces as indentation. The basic shape of an `if` statement is this:

```python
if CONDITION:
    print("CONDITION was True")
```

The `CONDITION` portion can be anything that evaluates to `True` or `False`, and if the value isn't explicitly a boolean then it will be implicitly converted to determine how to proceed past the conditional (essentially wrapping the `CONDITION` with the `bool` constructor):

```python
>>> if True:
...     print("Was True")
...
Was True
>>> if False:
...     print("Was True")
...
>>>
```

To add an alternative code path, we'll use the `else` keyword, followed by a colon (`:`), and indent the code underneath:

```python
>>> if False:
...     print("Was True")
... else:
...     print("Was False")
...
Was False
```

---

## Handling Multiple Cases with `elif`

Being able to perform one thing or another based on a condition is useful. But there are many situations where we want to check multiple possible conditions, and have more than two possible branches. In this lesson, we'll learn about how we can use the `elif` statement to have multiple branching paths in our conditionals.

### Documentation For This Video

[4. More Control Flow Tools - Python 3.8.1 documentation](https://docs.python.org/3/tutorial/controlflow.html#if-statements)

### The `elif` Statement

When we want our programs to have more than two possible outputs, then the `elif` statement will work perfectly for us. The `elif` statement looks a lot like the `if` statement:

```python
if CONDITION:
   # do something
elif CONDITION_2:
   # do a different thing
else:
   # do something if all conditions are False
```

We can chain as many `elif` statements together as we need, so the number of cases that we can handle is effectively limitless. Let's put `elif` to use by creating a script to evaluate the length of a name provided when we run the script:

*learning-conditionals.py*

```python
name = input("What is your name? ")
if len(name) >= 6:
   print("Your name is long.")
elif len(name) == 5:
   print("Your name is 5 characters.")
elif len(name) >= 4:
   print("Your name is 4 or more characters.")
else:
   print("Your name is short.")
```

When we run this, we can see the various results:

```python
$ python3.7 learning-conditionals.py
What is your name? Keith
Your name is 5 characters.
$ python3.7 learning-conditionals.py
What is your name? Alex
Your name is 4 or more characters.
$ python3.7 learning-conditionals.py
What is your name? Alex
Your name is 4 or more characters.
$ python3.7 learning-conditionals.py
What is your name? Bob
Your name is short.
$ python3.7 learning-conditionals.py
What is your name? Cynthia
Your name is long.
```

Notice that we fell into the first `elif` statement's block, and then the second `elif` block was never executed even though it was true. We can only exercise one branch in an `if` statement.

---

## Utilizing `pass`

Occasionally, we want to add a branch or other code block without providing any useful code in the block. This is a useful approach if we're outlining some code. In this lesson, we'll learn how to achieve
this by using the `[pass](https://docs.python.org/3/reference/simple_stmts.html?highlight=pass#the-pass-statement)` statement.

### Documentation For This Video

[7. Simple statements - Python 3.8.1 documentation](https://docs.python.org/3/reference/simple_stmts.html?highlight=pass#the-pass-statement)

### The `pass` Statement

When we're first working through a conditional, it's good to handle all cases, even if we don't have an `else` case that we'd like to run. This is good practice, just to ensure that we're thinking about the whole problem. We can remove it later.

To add an `else` statement without a body, we'll place a `pass` statement within. The `pass` statement is what is known as a null operation. Absolutely nothing happens when we execute a `pass` statement, but they are useful as a code placeholder:

```python
>>> name = "Keith"
>>> if name == "Kevin":
...     print("Hello Kevin")
... else:
...     pass
...
>>>
```

There are other types of code contexts with Python such as functions, classes, and loops. In all of these, we're able to leverage `pass` if we want to create the context and not do anything.

---

## Using Python Conditionals - LAB

### Additional Information and Resources

A typical Fizz-Buzz problem goes like this:Write a program that prints the numbers from 1 - 100. For  each multiple of three print "Fizz" instead of the number. For multiples of five print "Buzz" instead of the number. If a number is a multiple of three and five then print "FizzBuzz".Solving this problem requires 2 key components: looping and conditionals. We're going to write a simplified program only using the conditional portion that will take any given number that we provide and
print the Fizz-Buzz value. 

### Script

```python
#!/usr/bin/env python3.7

# Code begins here
value = int(input("Enter an integer value: "))

if value % 5 == 0 and value % 3 == 0:
    print("FizzBuzz")
elif value % 3 == 0:
    print("Fizz")
elif value % 5 ==0:
    print("Buzz")
else:
    print(value)
```

### Result

```bash
heimdall-1:Scripts daviddebray$ ./fizz-buzz-item.py 
Enter an integer value: 15
FizzBuzz
heimdall-1:Scripts daviddebray$ ./fizz-buzz-item.py 
Enter an integer value: 25
Buzz
heimdall-1:Scripts daviddebray$ ./fizz-buzz-item.py 
Enter an integer value: 9
Fizz
heimdall-1:Scripts daviddebray$ ./fizz-buzz-item.py 
Enter an integer value: 4
4
```

---

---

---

# Looping

## The `while` Loop

We work with collections of data and sequence a lot in programming, and it is common for us to want to perform the same action on each item or a subset of items in the content. To handle this, we need iteration and looping. In this lesson, we'll learn about one type of loop that we can use: the `while` loop.

### Documentation For This Video

[3. An Informal Introduction to Python - Python 3.8.1 documentation](https://docs.python.org/3/tutorial/introduction.html#first-steps-towards-programming)

### The `while` Loop

The most basic type of loop that we have at our disposal is the `while` loop. This type of loop repeats itself based on a condition that we pass to it. Here's the general structure of a `while` loop:

```python
while CONDITION:
    pass
```

The `CONDITION` in this statement works the same way that it does for an `if` statement. When we demonstrated the `if` statement, we first tried it by simply passing in `True` as the condition. Let's see when we try that same condition with a `while` loop:

```python
>>> while True:
...     print("looping")
...
looping
looping
looping
looping
```

That loop will continue forever, we've created an infinite loop. To stop the loop, press `Ctrl-C`. Infinite loops are one of the potential problems with `while` loops. If we don't use a condition that we can change from within the loop, then it will continue forever if it's initially true. Here's how we'll normally approach using a while loop, where we modify something about the condition on each iteration:

```python
>>> count = 1
>>> while count <= 4:
...     print("looping")
...     count += 1
...
looping
looping
looping
looping
>>>
```

---

## The `for` Loop

We work with collections of data and sequence a lot in programming, and it is common for us to want to perform the same action on each item or a subset of items in the content. To handle this we need iteration and looping. In this lesson, we'll learn about the most common type of
loop that we will use: the `for` loop.

### Documentation For This Video

[4. More Control Flow Tools - Python 3.8.1 documentation](https://docs.python.org/3/tutorial/controlflow.html#for-statements)

### The `for` Loop

The most common use we have for looping is when we want to execute some code for each item in a sequence. For this type of looping or iteration, we'll use the `for` loop. The general structure for a `for` loop is:

```python
for TEMP_VAR in SEQUENCE:
    pass
```

The `TEMP_VAR` will be populated with each item as we iterate through the `SEQUENCE`, and it will be available to us in the context of the loop. After the loop finishes one iteration, then the `TEMP_VAR` will be populated with the next item in the `SEQUENCE`, and the loop's body will execute again. This process continues until we either hit a `break` statement or we've iterated over every item in the `SEQUENCE`. Here's an example that loops over a list of colors:

```python
>>> colors = ['blue', 'green', 'red', 'purple']
>>> for color in colors:
...     print(color)
...
blue
green
red
purple
>>> color
'purple'
```

### Other Iterable Types

Lists will be the most common type that we iterate over using a `for` loop, but we can also iterate over other sequence types. Of the types we already know, we can iterate over strings, dictionaries, and tuples.

Here's a tuple example:

```python
>>> point = (2.1, 3.2, 7.6)
>>> for value in point:
...     print(value)
...
2.1
3.2
7.6
>>>
```

In this dictionary example, by default, will first unpack each key:

```python
>>> ages = {'kevin': 59, 'bob': 40, 'kayla': 21}
>>> for key in ages:
...     print(key)
...
kevin
bob
kayla
```

If we leverage what we've learned about dictionaries, we can actually get the key and value on each iteration by using `dict.items` and unpacking the tuple in each iteration:

```python
>>> for key, value in ages.items():
...     print(key, value)
...
kevin 59
bob 40
kayla 21
```

A string example:

```python
>>> for letter in "my_string":
...     print(letter)
...
m
y
_
s
t
r
i
n
g
>>>
```

---

## Nesting Loops and Conditionals

Now that we've learned how to use loops and conditionals, we can do a lot more with our programs. We can do even more when we combine them by nesting loops within conditionals or conditionals within loops.

### Nesting Conditionals within Loops

We've seen two of the most common types of code contexts in Python: the body of a conditional and the body of a loop. To signify code contexts in Python, we use indentation. If we need to nest contexts,
like conditionals or loops, then we can add *more* indentation. Let's say we're looping through a list of numbers, and we only want to print the number if it's a multiple of 4. In this case, we can add a
conditional check within our loop:

```python
>>> counter = 1
>>> while counter <= 25:
...     if counter % 4 == 0:
...         print(counter)
...     counter += 1
...
4
8
12
16
20
24
```

For each nested context, we'll need to indent an extra 4 spaces. When we're done doing what we need to do in a nested context, then we go back to the previous indentation level to continue at that level. This is how we're able to continue past the `if` statement to increment the counter, all still within the `while` loop.

---

## Controlling Loop Execution with `break` and `continue`

There are times while working with loops, that we want to skip a single iteration, or even completely stop a loop before it is finished.
We can accomplish these two things by using the `continue` and `break` statements.

### Documentation For This Video

[4. More Control Flow Tools - Python 3.8.1 documentation](https://docs.python.org/3/tutorial/controlflow.html#break-and-continue-statements-and-else-clauses-on-loops)

### The `continue` and `break` Statements

If we want to continue to the next iteration in a nested context or stop the loop entirely, we have access to the `continue` and `break` keywords:

```python
>>> count = 0
>>> while count < 10:
...     if count % 2 == 0:
...         count += 1
...         continue
...     print(f"We're counting odd numbers: {count}")
...     count += 1
...
We're counting odd numbers: 1
We're counting odd numbers: 3
We're counting odd numbers: 5
We're counting odd numbers: 7
We're counting odd numbers: 9
>>>
```

The `continue` statement will cause the nearest loop (if we have nested loops) to go directly to the
next iteration. This means that we will not execute any of the remaining lines of the loop for the current iteration. This can be an issue if we continue without incrementing the `count` value in our example loop's conditional.

We're demonstrating "string interpolation" in Python 3 by prefixing a string literal with an `f` and then using curly braces to substitute in variables or expressions (in this case, the `count` value).

The `break` statement works similarly to the `continue` statement in that it keeps our current iteration from executing the remaining lines in the loop, but it also causes the entire loop to stop.

Here's an example using the `break` statement:

```python
>>> count = 1
>>> while count < 10:
...     if count % 2 == 0:
...         break
...     print(f"We're counting odd numbers: {count}")
...     count += 1
...
We're counting odd numbers: 1
```

### Using `break` and `continue` with a `for` Loop

The `break` and `continue` statements work with `for` loops as well. If we didn't want to print out certain colors, we could utilize the `continue` or `break` statements again. Let's say we want to skip the string `'blue'` and terminate the loop if we see the string `'red'`:

```python
>>> colors = ['blue', 'green', 'red', 'purple']
>>> for color in colors:
...     if color == 'blue':
...         continue
...     elif color == 'red':
...         break
...     print(color)
...
green
>>>
```

---

## Integrating `else` with Loops

Unlike many languages, loops in Python have an additional clause that we can use: the `else` clause. In this lesson, we'll take a look at why and when we might want to use this additional Python feature.

### Documentation For This Video

[4. More Control Flow Tools - Python 3.8.1 documentation](https://docs.python.org/3/tutorial/controlflow.html#break-and-continue-statements-and-else-clauses-on-loops)

### The `else` Clause

The `else` clause for loops in Python allows us to define an additional code context that will execute when the loop has naturally finished its iteration. In a `for` loop, this means that we've reached the end of our iteration, and in a `while` loop it means the conditional has evaluated to `False`. Here's an example for each of these:

```python
>>> counter = 1
>>> while counter <= 4:
...     print(counter)
...     counter += 1
... else:
...     print("While loop completed")
...
1
2
3
4
While loop completed
>>> for i in [1, 2, 3, 4, 5]:
...     print(i)
... else:
...     print("For loop completed")
...
1
2
3
4
5
For loop completed
>>>
```

This might seem a little useless because we could have just as easily written these additional print statements on the line directly following the loop and achieved the same result.
That's true. The `else` clause isn't that valuable unless we utilize it in conjunction with the `break` statement. The `else` clause's body will execute if the `break` statement is not hit. We can leverage this when we're iterating through a list:

```python
>>> colors = ['red', 'pink', 'blue', 'orange', 'green']
>>> for color in colors:
...     if color == 'orange':
...         print("Orange is in the list")
...         break
... else:
...     print("Orange is not in the list")
Orange is in the list
```

This is not the most efficient way to search through a list, but it's a good example of when the `else` clause of a loop has an effect besides just being the expression run after the loop.

---

## Using `range`

Sometimes we want to iterate a set number of times, but we don't necessarily have a collection to work with. An easy way to achieve this is by creating a `range` object and iterating over it.

### Python Documentation For This Video

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#sequence-types-list-tuple-range)

[Built-in Types - Python 3.8.1 documentation](https://docs.python.org/3/library/stdtypes.html#range)

### Ranges

A range is an immutable sequence type that defines a start, a stop, and a step value. The values within the range start with the beginning value and are incremented until the last value in the range is reached. This allows for ranges to be used in place of sequential lists while taking less memory and including more items.

```python
>>> my_range = range(10)
>>> my_range
range(0, 10)
>>> list(my_range)
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
>>> list(range(1, 14, 2))
[1, 3, 5, 7, 9, 11, 13]
```

Notice that the "stop" value (in this example, 10) is not included in the range.

By using a range with a `for` loop, we can specify the number of times we would like to iterate without needing to manually worry about incrementing a counter like we had to do with a `while` loop. Here's a previous example where we printed "looping" four times using a `while` loop:

```python
>>> count = 1
>>> while count <= 4:
...     print("looping")
...     count += 1
looping
looping
looping
looping
>>>
```

We could achieve this same thing using `for` and `range` like this:

```python
>>> for _ in range(1, 5):
...     print("looping")
...
looping
looping
looping
looping
>>>
```

---

## List Comprehensions

Iterating over a sequence is great, but needing to transform a list into a different list is fairly common. Python has a special feature to make doing this concise, called "list comprehensions".

### Documentation For This Video

[5. Data Structures - Python 3.8.1 documentation](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions)

### List Comprehensions

If we want to loop through a list, modify each item, and have a new list with the modified items, then we could do something like this:

```python
>>> colors = ['red', 'blue', 'orange', 'green', 'yellow']
>>> uppercase_colors = []
>>> for color in colors:
...     uppercase_colors.append(color.upper())
...
>>> uppercase_colors
['RED', 'BLUE', 'ORANGE', 'GREEN', 'YELLOW']
```

This procedure is common enough that Python provides a shorthand method for doing it in the form of "list comprehensions." These have a unique syntax where we essentially put the `for` loop within square brackets (`[]`). Here's the equivalent for the above, using a list comprehension:

```python
>>> colors = ['red', 'blue', 'orange', 'green', 'yellow']
>>> uppercase_colors = [color.upper() for color in colors]
>>> uppercase_colors
['RED', 'BLUE', 'ORANGE', 'GREEN', 'YELLOW']
```

The biggest difference here is that we don't need to create an empty list and append to it. Whatever we place to the left of the `for` statement within the comprehension will be returned as part of the final list.

### List Comprehensions for Filtering

List comprehensions also have another feature that allows for filtering while iterating through the initial list by adding a trailing `if` statement within the square brackets (`[]`). If we wanted to iterate through our colors and only return "warm" colors (red, orange, yellow) then we could write this loop to achieve
these results:

```python
>>> colors = ['red', 'blue', 'orange', 'green', 'yellow']
>>> warm_colors = []
>>> for color in colors:
...     if color in ['red', 'orange', 'yellow']:
...         warm_colors.append(color.upper())
...
>>> warm_colors
['RED', 'ORANGE', 'YELLOW']
```

If we remove the concept of `warm_colors` being used within the loop, we can write it as a list comprehension:

```python
>>> colors = ['red', 'blue', 'orange', 'green', 'yellow']
>>> warm_colors = [color.upper() for color in colors if color in ['red', 'orange', 'yellow']]
>>> warm_colors
['RED', 'ORANGE', 'YELLOW']
```

The syntax for list comprehensions are a little odd to get started with. But if you read it as a sentence, then it will start to make more sense and feel more useful. The sentence would read something like this: Uppercase each `color` in the `colors` variable if the colors are red, orange, and yellow.

---

## Utilizing Python Loops

### Additional Information and Resources

A typical Fizz-Buzz problem goes like this:Write a program that prints the numbers from 1 - 100. For each multiple of three print "Fizz" instead of the number. For multiples of five print "Buzz" instead of the number. If a number is a multiple of three and five then print "FizzBuzz". Solving this problem requires 2 key components: looping and conditionals.We're going to write a script that prompts the user for the number of items to process (starting with `1`). 

- For each number, we'll print either "Fizz", "Buzz", "FizzBuzz", or the number.
- The criteria for what to print is: Print "FizzBuzz" if the number is divisible by 3 and 5.
- Print "Fizz" if the number is divisible by 3.
- Print "Buzz" if the number is divisible by 5 otherwise print the number.

Here's how the final script should work:

```python
$ ./fizz-buzz.py
How many values should we process: 20
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
```

### Script implementation (Solution)

```python
#! /usr/bin/pythonw

# Utilizing Python Loops - LAB
upper_number = int(input("How many values should we process ?: "))
# print(upper_number)

for number in range(1, upper_number + 1):
    if number % 3 == 0 and number % 5 == 0:
        print("FizzBuzz(%3&5)")
    elif number % 3 == 0:
        print("Fizz(%3)")
    elif number % 5 == 0:
        print("Buzz(%5)")
    else:
        print(number)
```

---

---

---

# Function Basics

## Defining and Using Functions

### Documentation For This Video

[4. More Control Flow Tools - Python 3.8.1 documentation](https://docs.python.org/3/tutorial/controlflow.html#defining-functions)

### Function Basics

We can create functions in Python using the following:

- The `def` keyword
- The function name - lowercase starting with a letter or underscore (`_`)
- Left parenthesis (`(`)
- 0 or more parameter names
- Right parenthesis (`)`)
- A colon `:`
- An indented function body

Here's an example without any parameters:

```python
>>> def hello_world():
...     print("Hello, World!")
...
>>> hello_world()
Hello, World!
>>>
```

If we want to define a parameter, we will put the variable name we want it to have within the parentheses:

```python
>>> def print_name(name):
...     print(f"Name is {name}")
...
>>> print_name("Keith")
Name is Keith
```

Let's try to assign the value from `print_name` to a variable called `output`:

```python
>>> output = print_name("Keith")
Name is Keith
>>> output
>>>
```

Neither of these examples has a return value, but we will usually want to have a return value unless the
function is our "main" function or carries out a "side-effect" like printing. If we don't explicitly declare a `return` value, then the result will be `None` (as you saw when our body used `print`).

We can declare what we're returning from a function using the `return` keyword:

```python
>>> def add_two(num):
...     return num + 2
...
>>> result = add_two(2)
>>> result
4
```

### Working with Multiple Parameters

When we have a function that takes multiple parameters, we need to separate them using commas and give them unique names:

```python
>>> def add(num1, num2):
...     return num1 + num2
...
>>> result = add(1, 5)
>>> result
6
```

---

## Parameters vs. Arguments

### Documentation For This Video

[4. More Control Flow Tools - Python 3.8.1 documentation](https://docs.python.org/3/tutorial/controlflow.html#defining-functions)

### Parameters VS Aruguments

The difference between a parameter and an argument is all about timing. When we're working with the definition of a function, then the variables defined in the function declaration are the "parameters." When we're *calling* the function, the data that we provide for each parameter is the "argument." Accidentally using these words interchangeably in practice isn't an issue, because other programmers
will know exactly what you're talking about. But it is good to know that there is a distinction.

With the semantic differences covered, we're ready to move onto the more interesting topic of the various types of arguments that we can use: position and keyword arguments.

### Using Keyword Arguments

Every function call we've made up to this point has used what are known as positional arguments. But if we know the name of the parameters, and not necessarily the positions, we can all them *all* using keyword arguments like so:

```python
>>> def contact_card(name, age, car_model):
...     return f"{name} is {age} and drives a {car_model}"
...
>>> contact_card("Keith", 29, "Honda Civic")
'Keith is 29 and drives a Honda Civic'
>>> contact_card(age=29, car_model="Civic", name="Keith")
'Keith is 29 and drives a Civic'
>>> contact_card("Keith", car_model="Civic", age="29")
'Keith is 29 and drives a Civic'
>>> contact_card(age="29", "Keith", car_model="Civic")
  File "<stdin>", line 1
SyntaxError: positional argument follows keyword argument
```

When we're using position and keyword arguments, every argument after the first keyword argument *must* also be a keyword argument. It's sometimes useful to mix them, but oftentimes we'll use either all positional or all keyword.

### Defining Parameters with Default Arguments

Along with being able to use keyword arguments when we're calling a function, we're able to define default values for parameters to make them optional when the information is commonly known and the same. To do this, we use the assignment operator (`=`) when we're defining the parameter:

```python
>>> def can_drive(age, driving_age=16):
...     return age >= driving_age
...
>>> can_drive(16)
True
>>> can_drive(16, driving_age=18)
False
```

Parameters with default arguments need to go at the end of the parameters list when defining the function so that positional arguments can still be used to call the function.

---

## Recursion

It might not seem immediately obvious, but we're capable of calling a function from within itself. This practice is called recursion. In this lesson, we'll learn how we can use recursion and some of the pitfalls
that surround it.

### Documentation For This Video

[4. More Control Flow Tools - Python 3.8.1 documentation](https://docs.python.org/3/tutorial/controlflow.html#defining-functions)

[sys - System-specific parameters and functions - Python 3.8.1 documentation](https://docs.python.org/3.7/library/sys.html#sys.getrecursionlimit)

### Solving Problems with Recursion

Recursion is the practice of calling a function from within itself. This might not seem like something that you'd ever do at first, but occasionally the best way to solve a problem is to break it up into
smaller versions of the same problem. The canonical example of this is calculating the Fibonacci Sequence (1, 1, 2, 3, 5, 8, etc.). In the Fibonacci sequence, the next number is always the sum of the previous two numbers in the sequence. If we write this out as a mathematical function, then calculating the nth item in the Fibonacci sequence would look something like this:

```python
f(n) = f(n-2) + f(n-1)
```

So, for the 5th item in the sequence (which coincidently is also 5), we would expand it like this:

```python
f(5) = f(3) + f(4)
f(5) = f(1) + f(2) + f(2) + f(3)
f(5) = 1 + f(0) + f(1) + f(0) + f(1) + f(1) + f(2)
f(5) = 1 + 0 + 1 + 0 + 1 + 1 + f(0) + f(1)
f(5) = 1 + 0 + 1 + 0 + 1 + 1 + 0 + 1
f(5) = 5
```

For recursion to work, there has to be what is called a "base case," where something is returned other than the result of the function calling itself. In the case of our Fibonacci sequence function, the base case(s) are that `f(0)` will return `0`, and `f(1)` will return `1`. Now that we can visualize exactly what is going on, let's write this function in Python:

*`~/fib.py`*

```python
def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1

    return fib(n - 2) + fib(n - 1)

item_to_calculate = int(input("What Fibonnaci item would you like to calculate? "))

print(fib(item_to_calculate))
```

In writing our function, we needed to remember a few things:

1. We need to handle the base cases first.
2. We `return` what we would normally consider the implementation of the function.
This return allows us to essentially gather all of the results at the
end.

Let's run our script:

```python
$ python3.7 fib.py
What Fibonacci item would you like to calculate? 15
610
```

That was pretty fast, but as we increase the number from `15` to `30`, we should see it take significantly longer to return. This is because the number of recursive function calls that happen as we try to calculate higher and higher terms gets excessively large. Trying to calculate the 50th term using our implementation might not ever return.

### The Limits of Recursion

We've run into the main issue with recursion, every time we recurse it, we're adding more and more function calls to the stack of calls that need to be completed. Some languages are optimized to handle this by implementing something called "tail-call optimization," but Python is not one of those languages. Recursion is a useful tool at times, but it does require being delicate and layering in some manual optimization (which we won't be covering here).

---

## Defining and Using Python Functions - LAB

### Additional Information and Resources

Functions are one of the fundamental building blocks for writing well-factored, understandable code. Another benefit of functions is that we're able to package up code so that we don't need to think about the actual logic within the function. We can focus on the results, depending on our inputs. Viewing our functions as black boxes where we provide inputs and receive outputs means that we can also write automated tests to ensure that our functions (which might not even be written yet) behave the way
that we expect. This is known as Test-Driven Development. We can use the `assert` statement to write some basic "tests" that utilize a function and ensure that the output is what we expect. We're going to work through the `testing-functions.py` file, writing and modifying functions to get the assertions throughout the file so that it doesn't throw errors.When we run the `testing-functions.py` file we should see errors like this:

```python
$ python3.7 testing-functions.py
Traceback (most recent call last): File "testing-functions.py", line 3, in <module> assert split_name("Kevin Bacon") == {
NameError: name 'split_name' is not defined
```

This process will show us the line where the issue was encountered, and show us the differences between our expected and actual values.

### Script implementation (Solution)

```python
#!/usr/bin/python3

# Defining and Using Python Functions 
# 1) Write a `split_name` function that takes a string and returns a dictionary with first_name and last_name
**def split_name(name):
    first_name, last_name = name.split(maxsplit=1)
    return {
        'first_name': first_name,
        'last_name': last_name,
    }**

assert split_name("Kevin Bacon") == {
    "first_name": "Kevin",
    "last_name": "Bacon",
}, f"Expected {{'first_name': 'Kevin', 'last_name': 'Bacon'}} but received {split_name('Kevin Bacon')}"

# 2) Ensure that `split_name` can handle multi-word last names

assert split_name("Victor Von Doom") == {
    "first_name": "Victor",
    "last_name": "Von Doom",
}, f"Expected {{'first_name': 'Victor', 'last_name': 'Von Doom'}} but received {split_name('Victor Von Doom')}"

# 3) Write an `is_palindrome` function to check if a string is a palindrome (reads the same from left-to-right and right-to-left)
**def is_palindrome(item):
    item = str(item)
    return item == item[::-1]**

assert is_palindrome("radar") == True, f"Expected True but got {is_palindrome('radar')}"
assert is_palindrome("stop") == False, f"Expected False but got {is_palindrome('stop')}"

# 4) Make `is_palindrome` work with numbers

assert is_palindrome(101) == True, f"Expected True but got {is_palindrome(101)}"
assert is_palindrome(10) == False, f"Expected False but got {is_palindrome(10)}"

# 5) Write a `build_list` function that takes an item and a number to include in a list
**def build_list(item, count = 1):
    items = []
    for _ in range(count):
        items.append(item)
    return items**

assert build_list("Apple", 3) == [
    "Apple",
    "Apple",
    "Apple",
], f"Expected ['Apple', 'Apple', 'Apple'] but received {repr(build_list('Apple', 3))}"
assert build_list("Orange") == [
    "Orange"
], f"Expected ['Orange'] but received {repr(build_list('Orange'))}"
```

---

---

---

# Generators

## Creating and Using Generators

Normal functions are the primary way that we'll be bundling up logic that we want to use over and over, but Python also provides a way for us to define functions that behave like iterators. These functions are
called "generators." In this lesson, we'll learn why we might want to use generators and how to create and use them.

### Documentation For This Video

[Generators - Python Wiki](https://wiki.python.org/moin/Generators)

[Built-in Functions - Python 3.8.1 documentation](https://docs.python.org/3.7/library/functions.html#next)

### What is a Generator?

A generator is a function that behaves like an iterator. This means that we can ask a generator function for its "next" value and it will calculate it, and return it to us. Similar to how a `range`
doesn't calculate all of the values at once, a generator function essentially "pauses" its execution after returning a single result until the next result is requested.

To learn about generators, let's go ahead and implement a function that works like the built-in `range` type.

### Writing a Generator Function

Generator functions are defined the same way that traditional functions are, except that instead of using the `return` keyword to provide a result back to the caller, we use the keyword `yield`. When defining a generator, we will almost always include a loop in the body of the function, and then we'll `yield` from within the loop. Let's create a new file called `gen.py` to create our `gen_range` function.

```python
def gen_range(stop, start=1, step=1):
    num = start
    while num <= stop:
        yield num
        num += step
```

Unlike the built-in `range` function, if we call this function with three arguments, they're in the order of `stop`, `start`, and `step` instead of starting with `start`. But this function effectively works the same way (although not as performant). Let's load our file into the REPL to test out this function:

```python
$ python3.7 -i gen.py
>>> gen_range(10)
&lt;generator object gen_range at 0x1054a8550>
>>>
```

The first thing to note here is that when we call the generator function, it returns a `generator` object to us instead of giving us the result. To get each result, we'll use the built-in `[next` function](https://docs.python.org/3.7/library/functions.html#next) to execute the generator until it hits a `yield` statement. Let's assign the generator object to a variable and pass it to `next` a few times:

```python
>>> generator = gen_range(4)
>>> next(generator)
1
>>> next(generator)
2
>>> next(generator)
3
>>>
```

This is how a generator works. It loops internally, yielding a result each time it's passed to the `next` function until it reaches the end of the function because it stops looping. Here's what we see if we pass the generator to `next` too many times:

```python
>>> next(generator)
4
>>> next(generator)
Traceback (most recent call last):
  File "&lt;stdin>", line 1, in &lt;module>
StopIteration
```

In practice, we won't normally be calling the `next` function on our generators. We'll be using them with `for` loops like this:

```python
>>> for num in gen_range(10, step=2):
...     print(num)
...
1
3
5
7
9
>>>
```

The `for` loop automatically knows how to work with generators, so we don't have to worry about running into the `StopIteration` error.

---

## Converting Generators to Lists

Generators are functions that behave like iterators, and that means that they can be used to dynamically calculate items in a loop. But that also means that they can be converted into lists. In this lesson, we'll take a look when and how we can convert a generator into a list.

### Documentation For This Video

[Generators - Python Wiki](https://wiki.python.org/moin/Generators)

[Built-in Functions - Python 3.8.1 documentation](https://docs.python.org/3.7/library/functions.html#next)

### Converting a Generator to a List

When we're working with generators, we'll often write them in such a way that *eventually* they won't have anything left to yield. And in that case, we can turn the generator into a list. This might sound like it would be difficult, but it's as easy as passing the generator object into the `list` function that we've used many times before, to convert things like `dict_keys` objects to be lists.

Let's load our `gen.py` file into the REPL again so that we can utilize the `gen_range` function that we wrote in the previous lecture:

```python
$ python3.7 -i gen.py
>>> generator = gen_range(10)
>>> list(generator)
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

That was pretty simple. But, it is possible to run into issues with this. Let's say that we define an *infinite* generator that will always calculate the next item in the Fibonacci sequence we looked at in our recursion lesson.

*`gen.py`*

```python
def gen_range(stop, start=1, step=1):
    num = start
    while num <= stop:
        yield num
        num += step

def gen_fib():
    a, b = 0, 1
    while True:
        a, b = b, a + b
        yield a
```

This function might look a little weird, but to calculate the next item in the Fibonacci sequence, we combine the previous two items with 0 and 1 being our two starting points. This should yield us 1, 1, 2, 3, 5, 8, etc. as we continue to call `next` on an instance of this generator object:

```python
$ python3.7 -i gen.py
>>> fib = gen_fib()
>>> next(fib)
1
>>> next(fib)
1
>>> next(fib)
2
>>> next(fib)
3
>>> next(fib)
5
```

We'll never reach the end of this generator function because it includes an infinite loop, and we never use a `break` statement. Let's see what happens if we try to turn this into a list (don't follow along with this):

```python
>>> list(fib)
```

We'll see that the prompt hangs. That's because it's looping forever. This is the situation when you can't convert a generator to be a list because the `list` function will never return.

---

## Defining and Using Python Generators - LAB

### Additional Information and Resources

The `range` function returns an iterable object that makes it incredibly easy to iterate through a large list of integers, without needing to create the list up front. In this hands-on lab, we're going to create the `char_range` generator that will do the same thing, except it will provide us with a range of characters based on Unicode code point for the starting character and ending character, with an optional step value.Here's our ideal usage in the REPL with a `for` loop and turning the generator into a list:

```python
>>> for char in char_range('a', 'e'):
... print(char)
...
a
b
c
d
e
>>> list(char_range('a', 'e', 2))
['a', 'c', 'e']
>>> list(char_range('e', 'a', 2))
['e', 'c', 'a']
```

Notice that we're able to handle the case where the starting code point is larger than the ending code point. In these situations, we'll need to change the step value to be a negative number. Additionally, unlike the `range` function, we want the result of `char_range` to *include* the stop character instead of omitting it.We'll be implementing the `char_range` function in the `using-generators.py` file, and we can see if our implementation meets the expectations by running the file through the Python interpreter:

```python
$ python3.7 using-generators.py
Traceback (most recent call last): File "using-generators.py", line 12, in <module> char_range
NameError: name 'char_range' is not defined
```

If we run into an expectation that we don't meet, then the error should explain what is expected compared to what is happening.

### Original Script

```python
# Define the `char_range` generator here
**SOLUTION GOES THERE**

# Tests to verify the implementation of char_range
# *Do not modify
##################################################

# Ensure that `char_range` is a generator function
from inspect import isgeneratorfunction

assert isgeneratorfunction(
    char_range
), f"Expected char_range to be a generator function but was not."

# Ensure that the result *does* includes the stop character
assert list(char_range("a", "e")) == [
    "a",
    "b",
    "c",
    "d",
    "e",
], f"Expected ['a', 'b', 'c', 'd', 'e'] but got {repr(list(char_range('a', 'e')))}"

# Iterate backwards if the start code point is higher than the stop code point

assert list(char_range("e", "a")) == [
    "e",
    "d",
    "c",
    "b",
    "a",
], f"Expected ['e', 'd', 'c', 'b', 'a'] but got {repr(list(char_range('e', 'a')))}"

# Properly step if a step value is provided

assert list(char_range("a", "e", 2)) == [
    "a",
    "c",
    "e",
], f"Expected ['a', 'c', 'e'] but got {repr(list(char_range('a', 'e', 2)))}"

# Step properly if the start code point is higher than the stop code point

assert list(char_range("e", "a", 2)) == [
    "e",
    "c",
    "a",
], f"Expected ['e', 'c', 'a'] but got {repr(list(char_range('e', 'a', 2)))}"
```

### Solution

```python
def char_range(start, stop, step=1):
    stop_modifier = 1
    start_code = ord(start)
    stop_code = ord(stop)

    if start_code > stop_code:
        step *= -1
        stop_modifier *= -1

    for value in range(start_code, stop_code + stop_modifier, step):
        yield chr(value)
```

---

---

---

# Scoping

## Python Scopes

### What is a Scope?

When we say that we're working in a different "scope" in Python, we mean that we're within the boundaries of a function or a class. This is important because while within the body of a function or class, the variables that we create are not automatically accessible outside of
that context. Let's create a new file called `scopes.py` so that we can experiment with how scopes work. To start, let's see how variables work when dealing with conditionals and loops.

*scopes.py*

```python
if 1 < 2:
    x = 5

while x < 6:
    print(x)
    x += 1

print(x)
```

Here we're creating a variable (`x=5`) within the body of a conditional (`if 1 < 2:1`). Afterward, we attempt to access that variable within the context of a loop (`while x < 6:`) and at the highest level of our script. Will this work? Let's find out by running this through the interpreter:

```python
$ python3.7 scopes.py
5
6
$
```

We didn't run into an error because conditionals andloops do not create scopes. Now, let's change our conditional to be a function instead.

*scopes.py*

```python
def set_x():
    x = 5

set_x()

while x < 6:
    print(x)
    x += 1

print(x)
```

Now if we run this we'll see the following:

```python
$ python3.7 scopes.py
Traceback (most recent call last):
  File "scopes.py", line 7, in &lt;module>
    while x < 6:
NameError: name 'x' is not defined
$
```

We see this error because `x` is defined within the `set_x` function and only exists during the execution of the function.

---

## Name Hiding (Shadowing)

### Name Hiding in Action

We know that functions create scopes. But, what happens when a parameter name is the same as a variable that has already been defined?
Let's continue using `scopes.py` to see what happens when we set `y` before we define the `set_x` function, and then change our function to have a `y` parameter:

*scopes.py*

```python
y = 5

def set_x(y):
    print("Inner y:", y)
    x = y
    y = x

set_x(10)
print("Outer y:", y)
```

Now if we run this, we'll see the following:

```python
$ python3.7 scopes.py
Inner y: 10
Outer y: 5
```

Since our function defines the `y` parameter, it's as though the outer `y` variable doesn't exist within the `set_x` function. Name hiding makes it possible for us to be confident that our parameters won't be affected by values at a higher scope. That doesn't mean that name hiding is something that we should always use though because it can make our code a little harder for people to understand.

---

## The `global` Keyword

Occasionally, we want to be able to modify a global variable from within a more specific context. In this situation, Python provides us with the `global` keyword. In this lesson, we'll learn how to use the `global` keyword.

### Documentation For This Video

- [The `global` Statement](https://docs.python.org/3/reference/simple_stmts.html?highlight=global#the-global-statement)

### Modifying the Global State from a Nested Scope

If we would like one of our functions to have the side effect of changing or creating a global variable, we can utilize the `[global` statement](https://docs.python.org/3/reference/simple_stmts.html?highlight=global#the-global-statement). This isn't something that we'll use all that often since it is better
to keep global state to a minimum as we start working on larger and more complex programs. But it is useful now and then. Let's modify `scopes.py` so that we can change the global `y` variable from within our `set_x` function:

*scopes.py*

```python
y = 5

def set_x(y):
    print("Inner y:", y)
    x = y
    global y
    y = x

set_x(10)
print("Outer y:", y)
```

If we run this, we should see the following:

```python
python3.7 scopes.py
  File "scopes.py", line 7
    global y
    ^
SyntaxError: name 'y' is parameter and global
```

It's important to know that we can't utilize the `global` statement if we have a parameter with the same name. Let's change our parameter to be `z` before running this again:

*scopes.py*

```python
y = 5

def set_x(z):
    x = z
    global y
    global a
    y = x
    a = 7

print("y Before set_x:", y)
set_x(10)
print("y After set_x:", y)
print("a After set_x:", a)
```

We've also created a global variable from within our `set_x` function called `a`. This variable won't be available before the first time that `set_x` is called, but we should be able to print it after we've called our function for the first time. Let's run `scopes.py` again:

```python
$ python3.7 scopes.py
y Before set_x: 5
y After set_x: 10
a After set_x: 7
```

This example shows how potentially confusing using `global` can be. We have a function called `set_x` that will change the global state for the variable `y`. Someone who didn't write this code could be completely confused as to why the value of the variable `y` that they've been working with was changed right out from under them.
Keep this in mind when considering whether or not it's a good idea to
use the `global` statement.

---

# Final Steps

## How to Prepare for the Exam

---

## What's Next After Certification?

---

# Practice Exam

## Certified Entry-Level Python Programmer Certification

30 minutes