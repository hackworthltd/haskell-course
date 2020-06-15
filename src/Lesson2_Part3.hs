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

{- Exercise 2.19

Let's revisit the function you wrote in Exercise 2.6, "has31Days".
When you originally wrote this function, you probably didn't know
about wildcard patterns yet, so you had to write out all 12 cases by
hand.

Rewrite this function using wildcard patterns. Use the wildcard
patterns to reduce it to the smallest number of equations you can.
-}

has31Days :: Month -> Bool
has31Days _ = undefined

{- Exercise 2.20

Define a function named "and" that takes two inputs, both of type
Bool, and outputs a value of type Bool. The output value should be
True only if both inputs are True; otherwise, it should be false.

Provide the type signature for this function, as well.
-}

{- Exercise 2.21

Define a function named "or" that takes two inputs, both of type Bool,
and outputs a value of type Bool. The output value should be True only
if one or both of the input values are true; otherwise, it should be
false.

Provide the type signature for this function, as well.
-}

{- Exercise 2.22

In Exercise 2.4, you defined a function called "monthToSeason" that,
given a value of type Month as input, outputs a value of type Season
that corresponds to that calendar month's season of the year.

Suppose someone from Australia uses your function and complains that
it's all wrong: July is a winter month! they say. And they're right --
the season a given month falls into depends on which hemisphere you're
in.

To fix the problem, first define a type that represents the Earth's
two hemispheres: Northern and Southern.

Then, define a function called "globalMonthToSeason" that takes 2
input values, one of type Month and the other of type Hemisphere
(which you just defined), and outputs a value of type Season.

Here we provide you with the incomplete definition for function
"globalMonthToSeason", but you'll need to provide the rest.
-}

globalMonthToSeason _ _ = undefined

{- Exercise 2.23

For this question, you don't need to write any Haskell code; just
answer in English here in the comment.

What is the type of the function you just defined above,
"globalMonthToSeason"?

-}

{- Exercise 2.24

Consider the function that you defined in the Exercise 2.22,
"globalMonthToSeason". You probably had to write quite a few equations
to define it! Is there a way to reduce the number of equations
required using pattern wildcards? If so, write the shorter definition;
if not, explain why pattern wildcards can't help you here.

-}

{- NOTE: ****

For these and all future exercises, if we ask you to define a
function, you should provide the type signature for that function, as
well. This is a good habit to get into. -}

{- So far, all of the functions you've defined in these exercises have
taken an input type that has relatively few values. For example, the
function "follows" from Exercise 2.1 takes an input of type Season,
which contains only 4 unique values (Winter, Spring, Summer, and
Fall). Therefore, when defining these functions, we've been able to
write out all of the equations explicitly for each input value.

Now let's work with some functions that take inputs of type Integer. Type
Integer contains many, many unique values, so when defining such a
function, it's usually not possible to write out an explicit equation
for every case. We'll need to make use of variables in most cases.

To refresh your memory, recall that in Lesson2, part 2, we defined a
function named "increment" that takes an inputs of type Integer and
outputs a value of type Integer whose value is produced by adding one
to the input value. That function's type signature and definition
were:

increment :: Integer -> Integer
increment x = x + 1

And when defining it, we used Haskell's built-in function named "+" to
add the first input to the second. The + function's type signature is:

(+) :: Integer -> Integer -> Integer

-}

{- Exercise 2.25

Define a function named "subtract" that takes two inputs of type Integer,
and outputs a value of type Integer whose value is produced by subtracting
the value of the second input from the value of the first.

Use the built-in Haskell function "-" to implement the function. Note
that the "-" function has the type signature:

(-) :: Integer -> Integer -> Integer
-}

{- Exercise 2.26

Define a function named "multiply3" that takes three inputs of type Integer,
and outputs a value of type Integer whose value is produced by multiplying
the value of all three input values.

Use the built-in Haskell function "*" to implement the function. Note
that the "*" function has the type signature:

(*) :: Integer -> Integer -> Integer

-}

{- Exercise 2.27

Define a function named "multiplyAndAdd" that takes three inputs of
type Integer, and outputs a value of type Integer whose value is is produced
by multiplying the values of the first and second inputs, then adding
to that value the value of the third input.

Use the built-in Haskell functions "*" and "+" to implement the
function.

-}

{- Exercise 2.31

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
