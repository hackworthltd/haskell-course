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

data Direction
  = North
  | South
  | East
  | West
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

Complete the definition below of a function named "or" that takes two
inputs, both of type Bool, and outputs a value of type Bool. The
output value should be True only if one or both of the input values
are True; otherwise, it should be False. Write the function using the
fewest number of equations you can. -}

or :: Bool -> Bool -> Bool
or _ _ = undefined

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

Given below is a type named Rotation, whose values represent rotations
of 90 degrees in either a clockwise or counter-clockwise direction.

Also given below is a function named "rotate". This function takes 2
arguments: a value of type Rotation, and a value of type Direction
(i.e., North, South, East, or West). Its output value is the Direction
transformed by the Rotation. In other words, if we're facing North and
we rotate clockwise by 90 degrees, now we're facing East. Or, if we're
facing West and we rotate counter-clockwise by 90 degrees, now we're
facing South.

Using the Rotation and Direction Types, write a function called
"rotate270" that takes as input a value of type Rotation and a value
of type Direction, and rotates the initial Direction value 270 degrees
(90 * 3; i.e., 3 rotations) using the given Rotation.

For example, the expression:

rotate270 Clockwise North

means, "facing North, rotate 270 degrees clockwise," and
should evaluate to West; whereas the expression

rotate270 CounterClockwise East

means "facing East, rotate 270 degrees counter-clockwise," and should
evaluate to South.

The type signature for "rotate270" is already written for you, as is
the left-hand side of the equation. You just need to write the
right-hand side of the equation.

Your equation should use the "rotate" function to transform the input
values to produce the correct output value.

Don't forget to test your function with a few inputs by using the
"rotate270" function from the GHCi window.

Note: you *could* write this function as an explicit equation for
every combination of Rotation value and Direction value, but you
should write it as a single equation, instead. -}

data Rotation
  = Clockwise
  | CounterClockwise
  deriving (Show)

rotate :: Rotation -> Direction -> Direction
rotate Clockwise North = East
rotate Clockwise East = South
rotate Clockwise South = West
rotate Clockwise West = North
rotate CounterClockwise North = West
rotate CounterClockwise West = South
rotate CounterClockwise South = East
rotate CounterClockwise East = North

rotate270 :: Rotation -> Direction -> Direction
rotate270 rot dir = undefined

{- Exercise 2.27

For this exercise, you don't need to write any Haskell.

In the following exercises, you're given a Haskell expression to
evaluate. Write the final value each expression evaluates to.

The functions and extra types used in these expressions are defined
below for your convenience. Refer to them to figure out what they do.

Note: Each one of these expressions is included in the evaluation
game, so use it to figure out your answers, rather than doing each by
hand!

(If you can't find the game that matches the exercise, let the
instructor know and they'll help you!)

2.27(a):

identitySeason (precedes (identitySeason (follows (identitySeason Summer))))

evaluates to: _

2.27(b):

midSeason (otherHemi NorthHemi) (follows Summer)

evaluates to: _

-}

identitySeason :: Season -> Season
identitySeason a = a

precedes :: Season -> Season
precedes Winter = Fall
precedes Fall = Summer
precedes Summer = Spring
precedes Spring = Winter

follows :: Season -> Season
follows Winter = Spring
follows Spring = Summer
follows Summer = Fall
follows Fall = Winter

data Hemi
  = NorthHemi
  | SouthHemi
  deriving (Show)

otherHemi :: Hemi -> Hemi
otherHemi NorthHemi = SouthHemi
otherHemi SouthHemi = NorthHemi

midSeason :: Hemi -> Season -> Month
midSeason NorthHemi Spring = April
midSeason NorthHemi Summer = July
midSeason NorthHemi Fall = October
midSeason NorthHemi Winter = January
midSeason SouthHemi Spring = October
midSeason SouthHemi Summer = January
midSeason SouthHemi Fall = April
midSeason SouthHemi Winter = January

{- Exercise 2.28

For this exercise, you don't need to write any Haskell.

Given below is the definition of a rather convoluted function that
takes as input 2 values of type Bool, and then transforms them using a
combination of the functions "or" (which you wrote earlier in Exercise
2.23), the function "and" from Lesson2 part 3 (given below), and the
function "not" from Lesson2 part 2 (also given below).

Using what you've learned about how Haskell evaluates expressions,
evaluate the following expression by hand, by writing the sequence of
substitutions/evaluations that Haskell performs when it evaluates this
expression. Don't worry about the order of evaluation of
subexpressions; you can write those in any order you like.

The expression to evaluate is:

convoluted False True

Step 1:
convoluted False True

Step 2: (substitution)
... (your steps start here)


-}

and :: Bool -> Bool -> Bool
and True x = x
and False _ = False

not :: Bool -> Bool
not True = False
not False = True

convoluted :: Bool -> Bool -> Bool
convoluted x y = and (or (and x y) y) (not x)


{- Exercise 2.29

This is a super-challenge! It might take some time to figure out, but
solving it will be well worth it.

Given below is a function called "repeat". It takes 3 inputs:

- The first input is of type Natural. (Natural is like Integer, except
that it only contains 0 and all the positive integers; there are no
negative Natural numbers.)

- The second input is of type Rotation.

- The third input is of type Direction.

The output of the function is of type Direction.

What this function does is, it takes a Rotation value and an initial
Direction, and then it rotates that initial direction n times, where n
is a Natural number (i.e., an integer between 0 and infinity). So, for
example, this expression:

repeat 1 Clockwise North

evaluates to East, because it rotates North 90 degrees clockwise one
time.

this expression:

repeat 3 CounterClockwise West

evaluates to North, because it rotates West 90 degrees
counter-clockwise 3 times.

And this expression:

repeat 0 Clockwise South

evaluates to South, because it rotates South by 90 degrees clockwise 0
times; i.e., the output value is the same as the input direction
(South).

Play around with this function a bit in GHCi to get a feeling for how
it works: write a few simple expressions with it. Make a few
predictions about the answers before you try them in GHCi.

Then, when you're ready, evaluate the following expression by hand,
showing the sequence of substitutions/evaluations that Haskell
performs when it evalutes this expression. Don't worry about the order
of evaluation of subexpressions; you can write those in any order you
like.

The expression to evaluate is:

repeat 4 Clockwise North

We'll get you started: the first few steps are as follows:

Step 1:
repeat 4 Clockwise North

Step 2: (substitution)
repeat (4 -1) Clockwise (rotate Clockwise North)

Step 3: (subexpression evaluation)
repeat (4 - 1) Clockwise East

Step 4: (subexpression evaluation)
repeat 3 Clockwise East

Step 5: ... (now you take over)

-}

repeat :: Natural -> Rotation -> Direction -> Direction
repeat 0 _ dir = dir
repeat n rot dir = repeat (n - 1) rot (rotate rot dir)
