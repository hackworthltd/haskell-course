{-# OPTIONS_GHC -Wno-missing-signatures #-}

module Lesson2_Part1 where

import Lib.Lesson2_Part1

{- Exercises for Lesson2: Functions.

In this file, we'll sometimes refer to types you've seen in the
lessons, or in previous exercises. When we do, we'll provide the
definitions for those types so that you can use them in your
solutions.

Here's the Direction data type that was defined in Lesson2. -}

data Direction
  = Up
  | Down
  | Left
  | Right

{- Exercise 2.1

When you look in the mirror, only some directions are flipped. Here's
a function named "mirror" that takes as input a Direction, and outputs
the corresponding mirrored direction. Complete the definition. -}

mirror :: Direction -> Direction
mirror _ = undefined

{- Exercise 2.2

Given the following Seasons data type that is similar (or maybe
identical!) to the one that you defined in Exercise 1.5, define a
function "follows" that takes a Season as input, and outputs the
season that follows it in the yearly cycle. For example, what season
follows spring? Answer: summer.
-}

data Season
  = Winter
  | Spring
  | Summer
  | Fall

follows :: Season -> Season
follows _ = undefined

{- Exercise 2.3

Using the Seasons data type, define a function "precedes" that takes a
Season as input, and outputs the season that comes before it in the
yearly cycle. For example, what season precedes summer? Answer:
spring.
-}

precedes :: Season -> Season
precedes _ = undefined

{- Exercise 2.4

Define a type called Month whose values represent the months of the
Gregorian calendar year: January, March, etc.
-}

data Month = Undefined

{- Exercise 2.5

Using the Month type that you just defined, and the built-in Haskell
type Int that you learned about in Lesson2, define a function
"monthToInt" that takes as input a value of type Month, and outputs a
value of type Int, but not just any Int! Each Month input value should
produce an Int output value that corresponds to the integer that we
use to denote that month when we define dates as integers. For
example, January is denoted as month 1, February as month 2, etc.
-}

monthToInt :: Month -> Int
monthToInt _ = undefined

{- Exercise 2.6

Using the Month and Season types that you defined earlier, define a
function called "monthToSeason" that takes as input a value of type
Month, and outputs a value of type Season in which that month falls.
For example, the month of July is summer.

Note that some months mark the official change of one season to the
next, so you'll need to pick one season or the other for these months:
which one is up to you.
-}

monthToSeason :: Month -> Season
monthToSeason _ = undefined

{- Exercise 2.7

For these questions, you don't need to write any Haskell code; just
answer in English here in the comment.

2.7(a): Suppose someone asks you to define a function that takes as
input a value of type Season, and outputs a value of type Month that
the season corresponds to. They even give you the type signature of
this function, and then ask you to provide the definition:

seasonToMonth :: Season -> Month
seasonToMonth _ = undefined

Do you think you could define this function? What problems do you
foresee?

2.7(b): Now the same person asks you to define a function that takes
as input an Int, and outputs the Month that corresponds to the input
Int. For example, they say, the input value 3 indicates the 3rd month
of the year, which is March.

Once again, they give you the type signature of the function, and then
ask you to provide the definition:

numberToMonth :: Int -> Month
numberToMonth _ = undefined

Do you think you could define this function? What problems do you
foresee?
-}

{- Exercise 2.8

Define a function named "has31Days" that, given a Month, outputs True
if the month has 31 days, and False otherwise. Use a wildcard pattern
to make your function definition as short as possible.

Note that, for this exercise, we've given you just the incomplete
function definition, but not the function type signature. Provide the
missing function type signature, as well.
-}

data Bool
  = True
  | False

has31Days _ = undefined

{- Exercise 2.9

In Exercise 2.6, you defined a function called "monthToSeason" that,
given a value of type Month as input, outputs a value of type Season
that corresponds to that calendar month's season of the year.

Suppose someone from Australia uses your function and complains that
it's all wrong: July is a winter month! they say. And they're right --
the season a given month falls into depends on which hemisphere you're
in.

To fix the problem, first define a data type that represents the
Earth's two hemispheres: Northern and Southern.

Then, define a function called "globalMonthToSeason" that takes 2
input values, one of type Month and the other of type Hemisphere
(which you just defined), and outputs a value of type Season.

Here we provide you with the incomplete definition for function
"globalMonthToSeason", but you'll need to provide the rest.
-}

globalMonthToSeason _ _ = undefined

{- Exercise 2.10

Consider the function that you defined in the previous exercise,
"globalMonthToSeason". You probably had to write quite a few equations
to define it! Is there a way to reduce the number of equations
required using pattern wildcards? If so, write the shorter definition;
if not, explain why pattern wildcards can't help you here.

-}

{- Exercise 2.11

For these questions, you don't need to write any Haskell code; just
answer in English here in the comment.

(Hint: use GHCi to check your answers.)

2.11(a): What is the type of function you defined in Exercise 2.2, "follows"?

2.11(b): What is the type of the function you defined in Exercise 2.9, "globalMonthToSeason"?

2.11(c): What is the type of this function?

f True = Spring
f False = Winter

2.11(d): Given the definition of "g" below, is g a function? Why or why not?

g :: Bool
g = True

2.11(e): Haskell will not accept this function definition; why not?

not :: Bool -> Bool
not False = True
not True = _

2.11(f): Haskell will also not accept this function definition; why not?

f False = Spring
f True = March

2.11(g): Haskell will also not accept this function definition; why not?

g Fall = True
g September = True

-}
