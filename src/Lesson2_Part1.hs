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

{- Exercise 2.0

Haskell's error messages have a (not entirely unfair) reputation for being daunting.
Let's have a look at some examples to get used to them.

These are all of the form
 - Here's some broken code
 - Let's look at the error message
 - Can you explain why it is broken, and how the error message relates to that
 - Please correct the code

There is no need to do all of this exercise before doing the other exercises in this file.
(But do ensure you eventually do all parts of this exercise.)
-}

{- 2.0(a): Consider the following broken definition.
What is wrong with it?
Uncomment it look at the error message - it is complaining that "Rotate" doesn't make sense as a <variable>.
Now fix my code.
-}
{-
Rotate :: Direction -> Direction
Rotate North = East
Rotate East = South
Rotate South = West
Rotate West = North
-}
{- 2.0(b): Let's do the same again
This time the RHS "North" is not accepted as GHC thought we needed something of type "Direction -> Direction".
Why did it think that?
Can you fix the code?
-}
{-
alwaysNorth :: Direction -> Direction
alwaysNorth = North
-}
{- 2.0(c): Let's have a type with fewer constructors so our examples are not so long.
However, I've messed it up - can you fix my mistakes?
Notice that there can be multiple errors, and sometimes GHC gets so confused about one error, it doesn't understand enough to report the others.

I suggest going step by step here to get a feel for the error messages, rather than trying to fix everything in one go.
  - Firstly, GHC complains that it doesn't understand the '=' at the start of the line.
    Whoops, indentation matters!
  - Now, GHC complains about the "| Red" line, and nothing I try to do to fix it helps.
    This is a prime candidate for "writing a smaller incorrect program, because that will be easier to debug", which is to say, let's comment out that line for now and get the rest of the definition working first.
  - Can you fix it from here?
-}
{-
Data colour
= blue
| Red
-}
{- 2.0(d): Error messages don't always point precicely to the problem
This complains about the `->`, but the mistake has already happened before we got there.
GHC is trying hard to understand what we wrote, and '->' is the point where it finally gave up.
Why here? (Hint, '->' only makes sense in a _type_).
Once you understand why, fix the code.
-}
{-
alwaysBlue : Colour -> Colour
alwaysBlue Blue = Blue
alwaysBlue Red = Blue
-}
{- 2.0(e): Errors can be rather verbose.
GHC has only one chance to give us useful feedback, so it errs on the side of including too much information, rather than too little.
Unfortunately this means that sometimes an error message is much longer than necessary (because some of the information is only useful in rather specific contexts, but GHC doesn't know whether we want it this time or not).
When one is just starting to learn a language this is compounded by the fact that sometimes (parts of) these errors only make sense when you know about specific features (in this case, polymorphism and what a "rigid type variable" is).
Generally, the key skill here is to not worry about the bits you don't understand - just extract the useful bits of the message.
Here that would be "Couldn't match expected type `colour' with actual type `Colour'", and the fact the error location is in the RHS of the first line.
However, recall that the error message location does not always point to the text you need to edit - only the point where GHC realised there is undeniablably an error.
Can you fix this code? (Hint: where does "colour" and "Colour" appear?)
-}
{-
alwaysRed :: Colour -> colour
alwaysRed Blue = Red
alwaysRed Red = Red
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
