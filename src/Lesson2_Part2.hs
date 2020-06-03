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

data Season
  = Winter
  | Spring
  | Summer
  | Fall

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

{- Exercise 2.12

Someone gives you a function definition written by one of your
colleagues and asks you to review it for correctness. The definition
is given below; it's for a function named "has28Days" that is similar
to the one you wrote in Exercise 2.9.

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

{- Exercise 2.13

The following functions are defined for you, but they lack type
signatures. For each one of these functions, provide the correct type
signature. You can test your answers by reloading this file in GHCi:
Haskell will print an error message if your type signatures are
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

{- Exercise 2.14

Define a function named "and" that takes two inputs, both of type
Bool, and outputs a value of type Bool. The output value should be
True only if both inputs are True; otherwise, it should be false.

Provide the type signature for this function, as well.
-}

{- Exercise 2.15

Define a function named "or" that takes two inputs, both of type Bool,
and outputs a value of type Bool. The output value should be True only
if one or both of the input values are true; otherwise, it should be
false.

Provide the type signature for this function, as well.
-}

{- Exercise 2.16

Define a function named "not" that takes one input of type Bool and
whose output value is the opposite of the input value.

Provide the type signature for this function, as well.
-}

{- Exercise 2.17

For this question, you don't need to write any Haskell code; just
answer in English here in the comment.


Your colleague has been asked to define the function "has30Days" (from
Exercise 2.13). Their version looks like this:

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
