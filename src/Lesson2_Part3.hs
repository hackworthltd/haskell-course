{-# OPTIONS_GHC -Wno-missing-signatures -Wno-incomplete-patterns -Wno-overlapping-patterns -Wno-unused-matches #-}

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

{- Exercise 2.21

Let's once again revisit the function you first wrote in Exercise 2.6,
and then rewrote in Exercise 2.18, "has31Days".

Rewrite this function one last time, this time using wildcard patterns
(_). Use the wildcard patterns to reduce it to the smallest number of
equations you can. -}

has31Days :: Month -> Bool
has31Days _ = undefined

{- Exercise 2.22

Compare the version of "has31Days" that you wrote in Exericse 2.21 to
the version you wrote in Exercise 2.18. Does the latest version have
fewer equations than the previous one? If not, would you say that the
newer version is an improvement, and if so, how?

-}

{- Exercise 2.23

Define a function named "or" that takes two inputs, both of type Bool,
and outputs a value of type Bool. The output value should be True only
if one or both of the input values are True; otherwise, it should be
False. Write the function using the fewest number of equations you
can.

Provide the type signature for this function, as well. -}

{- Exercise 2.24

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
"globalMonthToSeason", but you'll need to provide the rest. -}

globalMonthToSeason _ _ = undefined

{- Exercise 2.25

Consider the function that you defined in the Exercise 2.24,
"globalMonthToSeason". You probably had to write quite a few equations
to define it! Is there a way to reduce the number of equations
required using wildcard patterns (_)? If so, write the shorter
definition; if not, explain why wildcard patterns can't help you here.

-}



{- ****

Now stop here and continue on with Lesson2 part 3, starting where you
left off at the section named "Using functions."

**** -}



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
