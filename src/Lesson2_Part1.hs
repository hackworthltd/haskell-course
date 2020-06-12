{-# OPTIONS_GHC -Wno-missing-signatures #-}

module Lesson2_Part1 where

import Lib.Lesson2_Part1

{- Exercises for Lesson2, part 1: Functions.

In the following exercises about functions, "undefined" is used
in the function equations to indicate that the function equation not
yet complete. In each case, your task is to replace "undefined" with
an appropriate equation(s).

You'll notice our undefined function equations also use the underscore
character (_) where the function's input value should go. You should
replace this underscore with the input value you want to transform.

For example, suppose we gave you this incomplete definition of the
function from Lesson2 part 1, "opposite":

opposite :: Direction -> Direction
opposite _ = undefined

Now we ask you to complete the definition. You would this one
undefined equation:

opposite _ = undefined

with these 4 complete equations:

opposite North = South
opposite South = North
opposite East = West
opposite West = East

-}

{- Exercise 2.1

Given the following Seasons type that is similar (or maybe identical!)
to the one that you defined in Exercise 1.6, define a function named
"follows" that takes a Season as input, and outputs the season that
follows it in the yearly cycle. For example, what season follows
spring? Answer: summer.
-}

data Season
  = Winter
  | Spring
  | Summer
  | Fall
  deriving (Show)

follows :: Season -> Season
follows _ = undefined

{- Exercise 2.2

Using the Seasons type from above, define a function named "precedes"
that takes a Season as input, and outputs the season that comes before
it in the yearly cycle. For example, what season precedes summer?
Answer: spring.
-}

precedes :: Season -> Season
precedes _ = undefined

{- Exercise 2.3

Define a type called Month whose values represent the months of the
Gregorian calendar year: January, March, etc.

So that you can see the values of the Month type in GHCi, make sure
you add "deriving (Show)" at the end of your type definition. It's
already been added here for you, so just make sure you retain it when
you complete the definition of the type.
-}

data Month
  = Undefined
  deriving (Show)

{- Exercise 2.4

Using the Month and Season types from above, define a function named
"monthToSeason" that takes as input a value of type Month, and outputs
a value of type Season in which that month falls. For example, the
month of July is summer.

Note that some months mark the official change of one season to the
next, so you'll need to pick one season or the other for these months:
which one is up to you!
-}

monthToSeason :: Month -> Season
monthToSeason _ = undefined

{- Exercise 2.5

For these questions, you don't need to write any Haskell code; just
answer in English here in the comment.

2.5(a): Suppose someone asks you to define a function that takes as
input a value of type Season, and outputs a value of type Month that
the season corresponds to. They even give you the type signature of
this function, and then ask you to provide the definition:

seasonToMonth :: Season -> Month
seasonToMonth _ = undefined

Do you think you could define this function? What problems do you
foresee?

-}

{- Exercise 2.6

Define a function named "has31Days" that, given a Month, outputs True
if the month has 31 days, and False otherwise.

Note that, for this exercise, we've given you just the incomplete
function definition, but not the function type signature. Provide the
missing function type signature, as well.

We've provided the type definition for type Bool below, which you can
use in your answer. -}

data Bool
  = True
  | False
  deriving (Show)

has31Days _ = undefined

{- Exercise 2.7

For these questions, you don't need to write any Haskell code; just
answer in English here in the comment.

(Hint: use GHCi to check your answers.)

2.7(a): What is the type of function you defined in Exercise 2.1, "follows"?

2.7(b): What is the type of this function? (Answer by writing its
type signature.)

f True = Spring
f False = Winter

2.7(c): Given the definition of "g" below, is g a function? Why or why not?

g :: Bool
g = True

2.7(d): Haskell will not accept this function definition; why not?

not :: Bool -> Bool
not False = True
not True = _

2.7(e): Haskell will also not accept this function definition; why not?

f False = Spring
f True = March

2.7(f): Haskell will also not accept this function definition; why not?

g Fall = True
g September = True

-}

{- Exericse 2.8

On a sheet of paper, for the function "monthToSeason" that you defined
earlier, draw a diagram similar to the one given in Lesson2, part 1
for function "opposite".

Your diagram should represent:

a) the type signature of monthToSeason, and
b) the transformation of values from input type Month to output type Season.

-}
