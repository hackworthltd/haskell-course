module Lesson2_Part3 where

import Lib.Lesson2_Part3

{- Even more exercises for Lesson2: Functions.

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

{- NOTE: ****

For these and all future exercises, if we ask you to define a
function, you should provide the type signature for that function, as
well. This is a good habit to get into. -}

{- So far, all of the functions you've defined in these exercises have
taken an input type that has relatively few values. For example, the
function "follows" from Exercise 2.2 takes an input of type Month,
which contains only 12 unique values (January to December). Therefore,
when defining these functions, we've been able to write out all of the
equations explicitly for each input value.

Now let's work with some functions that take inputs of type Integer. Type
Integer contains many, many unique values, so when defining such a
function, it's usually not possible to write out an explicit equation
for every case. We'll need to make use of variables in most cases.

To refresh your memory, recall that in Lesson2, we defined a function
named "add" that takes two inputs of type Integer and outputs a value of
type Integer whose value is produced by adding the value of the first
input to the value of the second input. That function's type signature
and definition were:

add :: Integer -> Integer -> Integer
add x y = x + y

And when defining it, we used Haskell's built-in function named "+" to
add the first input to the second. The + function's type signature is:

(+) :: Integer -> Integer -> Integer

-}

{- Exercise 2.18

Define a function named "subtract" that takes two inputs of type Integer,
and outputs a value of type Integer whose value is produced by subtracting
the value of the second input from the value of the first.

Use the built-in Haskell function "-" to implement the function. Note
that the "-" function has the type signature:

(-) :: Integer -> Integer -> Integer
-}

{- Exercise 2.19

Define a function named "multiply3" that takes three inputs of type Integer,
and outputs a value of type Integer whose value is produced by multiplying
the value of all three input values.

Use the built-in Haskell function "*" to implement the function. Note
that the "*" function has the type signature:

(*) :: Integer -> Integer -> Integer

-}

{- Exercise 2.20

Define a function named "multiplyAndAdd" that takes three inputs of
type Integer, and outputs a value of type Integer whose value is is produced
by multiplying the values of the first and second inputs, then adding
to that value the value of the third input.

Use the built-in Haskell functions "*" and "+" to implement the
function.

-}

{- Exercise 2.21

Function input variables can sometimes be useful for representing
types other than Integer, as well. Let's explore that idea now.

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

Use an input variable to write a much shorter definition of the
"identityMonth" function. The type signature and an incomplete version
of the function are provided for you. -}

identityMonth :: Month -> Month
identityMonth _ = undefined

{- Exercise 2.22

Define the identity function for values of type Season. Make the
definition as short as possible. Choose your own name for this
function and make sure it's something descriptive. -}

{- Exercise 2.23

Define the identity function for values of type Integer. Make the
definition as short as possible. Choose your own name for this
function and make sure it's something descriptive. -}

{- Exercise 2.24

Someone asks you to define a function called "strange" that works like
this:

- It takes 2 inputs. The first input is of type Bool, and the second
  input is of type Integer.
- The output is of type Integer.
- If the first input is False, then the output value should be 0.
- If the first input is True and the second input value is 0, then the
  output value should be 1.
- If the first input is True and the second input value is 1, then the
  output value should be 0.
- Otherwise, the output value should be the second input value
  squared; e.g., if the first input value is True and the second input
  value is 3, then the output value should be 9.

Define this strange function as succinctly as you can. Make sure you
test your function by trying out some examples in GHCi. -}
