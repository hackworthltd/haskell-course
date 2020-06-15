{-# OPTIONS_GHC -Wno-missing-signatures -Wno-incomplete-patterns #-}

module Lesson2_Part2 where

import Lib.Lesson2_Part2

{- More exercises for Lesson2: Functions.

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

{- Exercise 2.9

Using the Month type defined above, and the built-in Haskell type
Integer that you learned about in Lesson2, part 2, define a function
"monthToInteger" that takes as input a value of type Month, and
outputs a value of type Integer, but not just any Integer! Each Month
input value should produce an Integer output value that corresponds to
the integer that we use to denote that month when we define dates as
integers. For example, January is denoted as month 1, February as
month 2, etc.
-}

monthToInteger :: Month -> Integer
monthToInteger _ = undefined

{- Exercise 2.10

For this question, you don't need to write any Haskell code; just
answer in English here in the comment.

Suppose someone asks you to define a function that takes as input an
Integer, and outputs the Month that corresponds to the input Integer.
For example, they say, the input value 3 indicates the 3rd month of
the year, which is March.

They even give you the type signature of the function, and then ask
you to provide the definition:

numberToMonth :: Integer -> Month
numberToMonth _ = undefined

Do you think you could define this function? What problems do you
foresee?

-}

{- Exercise 2.11

Let's revisit the function you wrote in Exercise 2.6, "has31Days".
When you originally wrote this function, you probably didn't know
about wildcard patterns yet, so you had to write out all 12 cases by
hand.

Rewrite this function using wildcard patterns. Use the wildcard
patterns to reduce it to the smallest number of equations you can.
-}

has31Days :: Month -> Bool
has31Days _ = undefined

{- Exercise 2.12

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

{- Exercise 2.13

For this question, you don't need to write any Haskell code; just
answer in English here in the comment.

What is the type of the function you just defined above,
"globalMonthToSeason"?

-}

{- Exercise 2.14

Consider the function that you defined in the Exercise 2.12,
"globalMonthToSeason". You probably had to write quite a few equations
to define it! Is there a way to reduce the number of equations
required using pattern wildcards? If so, write the shorter definition;
if not, explain why pattern wildcards can't help you here.

-}

{- Exercise 2.15

Someone gives you a function definition written by one of your
colleagues and asks you to review it for correctness. The definition
is given below; it's for a function named "has28Days" that is similar
to the one you wrote in Exercise 2.11.

What would you tell them? If it's incorrect, how would you fix it, and
can you think of any advice you might give the original author about
how to avoid such errors in the future? -}

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

{- Exercise 2.16

The following functions are defined for you, but they lack type
signatures. For each one of these functions, provide the correct type
signature. You can test your answers by making changes and then
re-running this file in in Repl.it (or, equivalently, re-loading it in
GHCi): Haskell will print an error message if your type signatures are
incorrect.
-}

has30Days April = True
has30Days June = True
has30Days September = True
has30Days November = True
has30Days _ = False

baz Winter = True
baz Spring = False
baz Summer = True
baz Fall = False

follows January = February
follows February = March
follows March = April
follows April = May
follows May = June
follows June = July
follows July = August
follows August = September
follows September = October
follows October = November
follows November = December
follows December = January

baz' Winter True = March
baz' Summer _ = January
baz' _ _ = October

{- Exercise 2.17

Define a function named "and" that takes two inputs, both of type
Bool, and outputs a value of type Bool. The output value should be
True only if both inputs are True; otherwise, it should be false.

Provide the type signature for this function, as well.
-}

{- Exercise 2.18

Define a function named "or" that takes two inputs, both of type Bool,
and outputs a value of type Bool. The output value should be True only
if one or both of the input values are true; otherwise, it should be
false.

Provide the type signature for this function, as well.
-}

{- Exercise 2.19

For this question, you don't need to write any Haskell code; just
answer in English here in the comment.


Your colleague has been asked to define the function "has30Days" (from
Exercise 2.16). Their version looks like this:

has30Days _ = False
has30Days April = True
has30Days June = True
has30Days September = True
has30Days November = True

But it doesn't work! For example, they show you that this expression:

has30Days September

produces an output value of False, despite the fact that the equation
for the case where the input value says that September should produce
a value of True.

What is wrong with their function definition, and how would you tell
them to fix it?

-}
