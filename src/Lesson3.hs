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



{- Exercise 3.8

Let's return to the definitions of product types A and B from exercise
3.4. These two types are very similar, but not the same. However, it's
easy to convert one to the other and then back again.

Define a function aToB that takes an input value of type A and converts
it to a value of type B.

Then define a function bToA that takes an input value of type B and
converts it to a value of type A.

Once you've written both functions, evaluate the following expression
and give its value below. (You don't need to write the evaluation
steps; just show the final value.)

bToA (aToB (MakeA 10 West))

-}

aToB :: A -> B
aToB _ = undefined

bToA :: B -> A
bToA _ = undefined


{- Given below are the functions defined at the end of Lesson3, along
with the type Movement. (The other types used in these functions are
defined at the top of this file, so refer to those if you need to.) -}

data Movement
  = Face Direction
  | Walk Integer
  deriving (Show)

move :: Position -> Direction -> Integer -> Position
move (MakePosition x y) North distance = MakePosition x (y + distance)
move (MakePosition x y) South distance = MakePosition x (y - distance)
move (MakePosition x y) East distance = MakePosition (x + distance) y
move (MakePosition x y) West distance = MakePosition (x - distance) y

doOneMove :: Location -> Movement -> Location
doOneMove (MakeLocation p _) (Face d) = MakeLocation p d
doOneMove (MakeLocation p d) (Walk n) = MakeLocation (move p d n) d


{- Exercise 3.9

Imagine there's a robot on a 2D grid, and it can run Haskell programs
using the functions and types given above. You want to teach it to
zig-zag from a given location on the grid by calculating its new
location after making the following movements.

- face north, then

- walk 1 unit, then

- face east, and finally

- walk 1 unit

(Note that the robot's initial direction doesn't matter; it will
always turn to face north first, no matter which way it's facing at
the start.)

Define a function called "zigZag" which takes an input value of type
Location and outputs a value of type Location, where the input
Location is transformed according to the above movements. Use the
"doOneMove" function and the value constructors of product type
Movement to implement zigZag.

The type signature for function zigZag is already given below. You
just need to define the equation that implements the function. Make
sure you test your function on a few Location values!

Hint: if you're having trouble figuring out how to compose everything
together, just start with the first movement, which is "face north".
Then, use the *output* location produced by that movement as the
*input* to the next movement, and so on, until you get to the last
movement, whose output is your final value. -}

zigZag:: Location -> Location
zigZag location = undefined


{- Exercise 3.10

For this exercise, you don't need to write any Haskell.

Using the function zigZag that you just wrote, evaluate the following
expression by hand. Show each step by evaluating a single
sub-expression at a time:

zigZag startingLocation

Hint: remember the steps for evaluating a Haskell expression:

1. Identify all the sub-expressions, including the entire expression
itself. If there's only one expression and it's already a value that
can't be reduced any further, you're done!

2. Look for a sub-expression that matches a pattern on the left-hand
side of any rule (where "rule" means a function equation). Keep in
mind that built-in functions like (+) and (*) have implicit rules.

3a. If the matching function is built-in, calculate the
sub-expression's value according to the function's meaning (addition
for (+), multiplication for (*), etc.) and replace the sub-expression
with its value.

3b. Otherwise, replace the sub-expression with the right-hand side of
the matching rule, after substituting the function arguments for the
corresponding function parameters on the right-hand side of the rule.

4. Go back to step 1.

-}



{- Exercise 3.11

Define a function for the robot called "zigZagTwice" that, given a
Location value as input, calculates the robot's Location after
zig-zag'ing *twice* and outputs this new Location.

-}




{- Exercise 3.11

Define a product type named "MaybeMonth" that has 2 value
constructors:

- The first value constructor is called Nothing, and it takes no
  arguments.

- The second value constructor is called Just, and it takes one
  argument of type Month.

Refer back the Lesson3 if you need help with the syntax!

(Don't forget to add the "deriving (Show)" magic bit at the
end so that you can display values of this type in GHCi!) -}



{- Exercise 3.12

Way back in Exercise 2.10, we asked you about a function named
"integerToMonth", which takes an input value of type Integer and
outputs a value of type Month, where the Month value that the function
outputs corresponds to the number given as the input: for example, the
expression

integerToMonth 1

should evaluate to January; and

integerToMonth 10

should evaluate to October, etc. (The function definition is given
below.)

We suggested that this wasn't a well-formed function, because what
should it output for expressions such as

integerToMonth 9000

or integerToMonth 0

?

There's no obvious month that corresponds to these integers. In these
cases, we need a way to indicate to the user of the function that the
input they've provided is invalid.

Let's use our new type MaybeMonth to fix this function. Re-define the
function integerToMonth given below so that, rather than outputing a
value of type Month, it outputs a value of type MaybeMonth.

For "good" input values (i.e., integers 1 through 12), it should
output the corresponding Just Month value; and for "bad" input values,
it should output the value Nothing.

Note that, in addition to changing (and perhaps adding to) the
function's equations, you'll also need to change the type signature so
that it outputs a value of type MaybeMonth. -}

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



{- Exercise 3.13

3.13a) Take a look at the definition of the product type Position
again. Its value constructor, MakePosition, takes two arguments, both
of type Integer. We've been treating the value constructor's first
argument as the Position's x-coordinate, and the second argument as
the Position's y-coordinate; but is there anything in the definition
of the type that forbids us from using the value constructor's first
argument as the *y-coordinate*, and the second argument as the
*x-coordinate*, instead? (Just write your answer in the space below.)


3.13b) Let's say we did decide to switch the order of the x- and
y-coordinates in the Position product type, but we'd already written a
bunch of functions that use them in the original order, with
x-coordinate first and y-coordinate second.

Given below is the original definition of the function moveRight.

First, change its definition so that it uses the new interpretation of
the Position type, with y-coordinate first and x-coordinate second.

Then, test the new definition by evaluating the expression:

moveRight (MakePosition 3 2)

which takes an initial position with x-coordinate 2 and y-coordinate 3
and moves it one unit to the right. What is the value of this
expression? (You don't need to show the evaluation steps here; just
write the final value in the space below.


-}

moveRight :: Position -> Position
moveRight (MakePosition x y) = MakePosition (x + 1) y
