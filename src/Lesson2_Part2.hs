{-# OPTIONS_GHC -Wno-missing-signatures -Wno-incomplete-patterns -Wno-overlapping-patterns -Wno-unused-matches #-}

module Lesson2_Part2 where

import Lib.Lesson2_Part2

{- Exercises for Lesson2, part2: More functions.

In this file, we'll sometimes refer to types you've seen in the
lessons, or in previous exercises. When we do, we'll provide the
definitions for those types so that you can use them in your
solutions. -}

data Bool
  = True
  | False
  deriving (Show)

data Season
  = Winter
  | Spring
  | Summer
  | Fall
  deriving (Show)

data Orientation
  = Top
  | Bottom
  | Left
  | Right
  deriving (Show)

data Month
  = January
  | February
  | March
  | April
  | May
  | June
  | July
  | August
  | September
  | October
  | November
  | December
  deriving (Show)

{- Recall from the Lesson2 part 1 exercises that "undefined" is used on
the right-hand side of function equations to indicate that the
function equation is not yet complete. In each case, your task is to
replace "undefined" with an appropriate equation(s).

Also recall that we use the underscore character (_) where the
function's input values should go, on the left-hand side of equations.
You should replace this underscore with the input values you want to
transform.

When writing your answers for these exercises, you might find the
following built-in Haskell functions useful:

- Addition on the Integer values is written +, as in 5 + 7

- Multiplication on the Integer values is written *, as in 5 * 7

Note that the syntax for using these built-in functions is exactly
like the syntax used in most other programming languages, such as
Python.

Finally, whenever you make changes to your answers for exercises that
require writing Haskell code, don't forget to re-run the program using
the green "run" button in Repl.it! This is the only way to make sure
that your functions are syntactically valid! -}

{- Exercise 2.9

Using the Month type defined above, and the built-in Haskell type
Integer that you learned about in Lesson2, part 2, define a function
"monthToInteger" that takes as input a value of type Month, and
outputs a value of type Integer, but not just any Integer! Each input
value of type Month should produce an Integer output value that
corresponds to the integer that we use to denote that month when we
define dates as by integers. For example, January is denoted as month
1, February as month 2, etc.
-}

monthToInteger :: Month -> Integer
monthToInteger _ = undefined

{- Exercise 2.10

For this question, you don't need to write any Haskell code; just
answer in English here in the comment.

Suppose someone asks you to review a function they've written that
they claim is the opposite of function "monthToInteger" from the
previous exercise. The function definition is given below:

integerToMonth :: Integer -> Month
integerToMonth 1 = January
integerToMonth 2 = February
integerToMonth 3 = March
integerToMonth 4 = April
integerToMonth 5 = May
integerToMonth 6 = June
integerToMonth 7 = July
integerToMonth 8 = August
integerToMonth 9 = September
integerToMonth 10 = October
integerToMonth 11 = November
integerToMonth 12 = December

Do you think this function is correct? If not, what problems do you
foresee in trying to use it?

-}

{- Exercise 2.11

The following functions are defined for you, but they lack type
signatures. For each one of these functions, provide the correct type
signature. You can test your answers by making changes and then
re-running this file in in Repl.it (or, equivalently, re-loading it in
GHCi): Haskell will print an error message if your type signatures are
incorrect.
-}

has30Days January = False
has30Days February = False
has30Days March = False
has30Days April = True
has30Days May = False
has30Days June = True
has30Days July = False
has30Days August = False
has30Days September = True
has30Days October = False
has30Days November = True
has30Days December = False

baz Winter = True
baz Spring = False
baz Summer = True
baz Fall = False

after January = February
after February = March
after March = April
after April = May
after May = June
after June = July
after July = August
after August = September
after September = October
after October = November
after November = December
after December = January



{- ****

Now stop here and continue on with Lesson2 part 2, starting where you
left off at the section named "Function parameters."

**** -}



{- Exercise 2.12

Write a function called "double" that takes an input value of type
Integer and produces an output value that is double the input value.
For example, if we double 5 we should get 10, if we double -7 we
should get -14, etc.

You'll need to provide both the type signature for function "double"
and its definition, written as one or more equations.

You can test your function by writing these examples in the GHCi
window:

double 5
double 20
double -3

Whenver you make changes to your function definition, remember to
re-run the program in Repl.it!
-}

double _ = undefined

{- Exercise 2.13

Write a function called "square" that takes an input value of type
Integer and produces an output value that is equal to the input value
squared. For example, if we square 5 we should get 25, if we square -7
we should get 49, etc.

You'll need to provide both the type signature for function "square"
and its definition, written as one or more equations.

You can test your function by writing these examples in the GHCi
window:

square 2
square -7
square 10

Whenver you make changes to your function definition, remember to
re-run the program in Repl.it!
-}

square _ = undefined

{- Exercise 2.14

Though it may seem silly the first time you see it, sometimes it's
useful to define a function that takes an input of some type (let's
just call it type "a" for now, because it could be any type), and
outputs a value of the same type "a", where the output value is
*identical* to the input value. We call such a function an "identity"
function.

So, for example, let's say we want to define the identity function for
values of type Month. We could write out all 12 explicit equations for
this function, like this:

identityMonth :: Month -> Month
identityMonth January = January
identityMonth February = February
identityMonth March = March
identityMonth April = April
identityMonth May = May
identityMonth June = June
identityMonth July = July
identityMonth August = August
identityMonth September = September
identityMonth October = October
identityMonth November = November
identityMonth December = December

But it's tedious to write out all of those cases by hand.

Use a function parameter to write a much shorter definition of the
"identityMonth" function. The type signature and an incomplete version
of the function are provided for you.

You can test your identify function by writing these examples in the
GHCi window:

identityMonth January
identityMonth October
identityMonth December

Whatever input value of type Month you give it, the output value
should always be identical to the input value.
-}

identityMonth :: Month -> Month
identityMonth _ = undefined

{- Exercise 2.15

Define the identity function for values of type Season. Make the
definition as short as possible. Choose your own name for this
function and make sure it's something descriptive. Don't forget to
test it by writing some examples in the GHCi window! -}

{- Exercise 2.16

Define the identity function for values of type Integer. Make the
definition as short as possible. Choose your own name for this
function and make sure it's something descriptive. Don't forget to
test it by writing some examples in the GHCi window! -}



{- ****

Now stop here and continue on with Lesson2 part 2, starting where you
left off at the section named "Mix & match."

**** -}



{- Exercise 2.17

Let's fix the "mirror" function from Lesson2, part 2. Below we've
provided the *broken* version that we left off with in the lesson.
Recall that this version of the function is broken because it should
transform an input value of Left to output value Right, and vice
versa, but currently, it just produces an output value identical to
its input value, for every input value.

Using what you learned about Haskell's semantics, fix the function
while preserving the equation that uses the function parameter named
"o". Note that your answer should still only have 3 equations (plus
the type signature)!

You can test your function by writing these examples in the GHCi
window:

mirror Top
mirror Bottom
mirror Left
mirror Right

If it's working, those examples should produce the following output
values, respectively:

Top
Bottom
Right
Left

Whenver you make changes to your function definition, remember to
re-run the program in Repl.it!
-}

mirror :: Orientation -> Orientation
mirror o = o
mirror Left = Right
mirror Right = Left

{- Exercise 2.18

Let's revisit the function you wrote in Exercise 2.6, "has31Days".
When you originally wrote this function, you probably didn't know
about function parameters yet, so you had to write out all 12 cases by
hand.

Rewrite this function by combining explicit equations with function
parameters. Use function parameters to reduce the definition to the
fewest number of equations possible.

Make sure you test your function!
-}

has31Days :: Month -> Bool
has31Days _ = undefined

{- Exercise 2.19

Assuming you completed Exercise 2.18 above using a function parameter
in at least one of the equations that defines function "has31Days", do
you notice anything peculiar about the equation with the function
parameter in it? Explain. (Hint: take a close look at the right-hand
side of this equation.)

-}

{- Exercise 2.20

Your colleague gives you a function definition that they've written.
The definition is given below, a function named "has28Days".

Your colleague asks you to review the function for correctness. What
would you tell them? If it's incorrect, how would you fix it, and can
you think of any advice you might give the original author about how
to avoid such errors in the future?

Write your answers to the question below, and then fix the provided
function definition for "has28Days", if needed.

-}

has28Days January = False
has28Days February = True
has28Days March = False
has28Days April = False
has28Days May = False
has28Days July = False
has28Days August = False
has28Days September = False
has28Days October = False
has28Days December = False
