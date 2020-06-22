{-# OPTIONS_GHC -Wno-missing-signatures -Wno-incomplete-patterns -Wno-overlapping-patterns -Wno-unused-matches #-}

module Lesson3 where

import Lib.Lesson3

{- Exercises for Lesson3: Product types.

In this file, we'll sometimes refer to types and functions you've seen
in the lessons, or in previous exercises. When we do, we'll provide
the definitions for those types so that you can use them in your
solutions. -}

data Bool
  = True
  | False
  deriving (Show)

data Direction
  = North
  | South
  | East
  | West
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

data Position
  = MakePosition Integer Integer
  deriving (Show)


{- Exercise 3.1

For this exercise, you don't need to write any Haskell.

Show the evaluation steps for the following expressions, like you did
in Exercise 2.28. (It's in the file Lesson2_Part3.hs, if you want to
refresh your memory.)

Don't forget to use GHCi to test your answers! It won't show you the
*steps* in the evaluation process, but it will show you the *final
value*, which you can check against your final step.

Remember to only evaluate (reduce) one sub-expression per step. Also
recall that you can evaluate sub-expressions in whatever order you
prefer.


3.1a) MakePosition 2 1


3.1b) MakePosition (1 + 1) (3 - 2)


-}


{- Immediately following this comment is a type definition for a new
product type, Location. This is not an exercise, so we're not asking
you to do anything with type Location yet; just read this comment to
understand how the Location type is defined, and why it might be
useful.

Imagine again that we have a 2D game on a Cartesian coordinate grid.
As discussed in Lesson3, we can represent the player's position on the
2D grid as a value of product type Position (given above), and we can
construct Position values using the MakePosition value constructor by
writing expressions like these:

MakePosition 0 0

MakePosition (2 + x) (y - 3)

What if, in addition to representing the user's position on the grid,
we also want to represent the direction that the user is facing --
north, south, east, or west? It would be useful to bundle two values
-- one for the player's Position, and one for their Direction -- into
a single, larger value. That's what the Location product type does for
us.

The Location type is defined below. Its value constructor,
MakeLocation, takes two arguments: the first is of type Position, and
the second is of type Direction. MakeLocation constructs values of
type Location that bundle the user's Position and Direction into a
single Location value.

So, for example, if the player's position is a value p of type
Position, and the player is facing East, we can construct a Location
value with these "smaller" values like so:

MakeLocation p East

Or, if we want to start the player off at the origin, facing North, we
could create a value representing the user's initial value and give it
a convenient name via a couple of bindings, also given below. -}

data Location
  = MakeLocation Position Direction
  deriving (Show)

-- Note: a line that begins with "--" is also a comment!
--
-- This binding represents the origin in the Cartesian coordinate
-- system.
origin :: Position
origin = MakePosition 0 0

-- This binding represents the player's initial Location in a 2D grid
-- game. They begin at the origin, facing North.
startingLocation :: Location
startingLocation = MakeLocation origin North


{- Exercise 3.2

For this exercise, you don't need to write any Haskell.

Show the evaluation steps for the following expressions, like you did
in Exercise 3.1.


3.2a) MakeLocation origin North


3.2b) MakeLocation (MakePosition 2 1) East


3.2c) MakeLocation (MakePosition (1 + 1) (3 - 2)) West


3.2d) MakeLocation origin (rotate CounterClockwise East)


-}


{- Exercise 3.3

For this exercise, you don't need to write any Haskell.

Like functions, value constructors have a type. The difference is that
with functions, we define the function's type signature explicitly, so
that we can see at a glance what their type is. The types of value
constructors are *implicit*, in that we don't define them, but they
are simple enough that Haskell can figure them out on its own. This
saves the programmer some typing, but can sometimes lead to confusion
as to what, exactly, a value constructor is.

We think it's important that you understand the type of everything!
Therefore, let's ask GHCi for some value constructor type signatures.

Using the :type command in GHCi, refer to the types given at the
beginning of the file and answer the following:


3.3a) What is the type of the value constructor "MakePosition" ?


3.3b) What is the type of the value constructor "MakeLocation" ?


3.3c) What is the type of the value "MakePosition 3 5" ?


3.3d) What is the type of the value "MakeLocation (MakePosition 3 5) West" ?


3.3e) What is the type of the value "North" ?


3.3f) What is the type of the value "True" ?


3.3g) Can you make the case that values North, South, East, West,
True, and False are just value constructors that don't take any
arguments? Explain.


3.3h) What is the type of the binding named "origin" ?


3.3i) What is the type of the binding named "startingLocation" ?


-}


{- Exercise 3.4

For this exercise, you don't need to write any Haskell.

The two types given below, named A and B, have different names, but
very similar definitions. Are they equivalent? Explain.

-}

data A
  = MakeA Integer Direction
  deriving (Show)


data B
  = MakeB Direction Integer
  deriving (Show)


{- Exercise 3.5

Define a product type named Triple that bundles together three Integer
values.

(Hint: this should be really easy if you look at the definition of the
product type Position and think of it as a pair of integers.)

(Don't forget to add the "deriving (Show)" magic bit at the
end so that you can display values of this type in GHCi!) -}


{- Exercise 3.6

Using the product type Triple that you just defined in Exercise 3.5,
define a function named "f" that takes a single argument "n" of type
Integer, and constructs an output value of type Triple where the first
element of the triple is n + 1, the second element is n + 2, and the
third element is n + 3.

For example, after defining this function, the expression

f 3

should evaluate to a value of type Triple with elements 4, 5, and 6.

We've provided an incomplete function definition for you. Don't forget
to define the function's type signature as well as finishing its
equation!

After you've defined function f, don't forget to Run this file in
GHCi, switch back to it using the

:load Lesson3

command, and test
your function by writing some expressions with it in GHCi! -}

f n = undefined


{- Exercise 3.7

For this exercise, you don't need to write any Haskell.

Consider again the expression

f 3

Show the evaluation steps for that expression, like you did in
Exercise 3.1.


-}



{- ****

Now stop here and continue on with Lesson3, starting where you left
off at the section named "Pattern matching on product types."

**** -}
