{-# OPTIONS_GHC -Wno-missing-signatures -Wno-incomplete-patterns #-}

module Lesson4 where

import Lib.Lesson4

{- Exercises for Lesson 4: Recursive types.

In this file, we'll sometimes refer to types you've seen in the
lessons, or in previous exercises. When we do, we'll provide the
definitions for those types so that you can use them in your
solutions.

Included here is the ListOfInteger type that was defined in Lesson4,
in addition to the Bool type we've been using since Lesson1. -}

data ListOfInteger
  = EmptyList
  | Element Integer ListOfInteger
  deriving (Show)

data Bool
  = False
  | True
  deriving (Show)

{- Exercise 4.1

For this exercise, you don't need to write any Haskell.

For each of the following type definitions, answer the following
questions. Write your answers below each definition:
- is the type recursive?
- if it is:
  - which value constructor corresponds to the inductive case?
  - which value constructor corresponds to the base case (if there is one)?
  - write down a value of this type

data A
  = MakeA Integer

data B
  = MakeB Integer
  | StopB

data C
  = MakeC C
  | StopC

data D
  = MakeD Integer D Integer
  | EmptyD

data E
  = MakeE E

-}

{- Exercise 4.2

Here's a function named "head" which outputs the first element of an
ListOfInteger. Its first argument is the "default value", which should
be output if the list is empty. Its second argument is the list
itself.

To help you write this function, here are a few expressions and the
values they should evaluate to once the function is working:

head 7 EmptyList

should evaluate to 7.

head 7 (Element 1 EmptyList)

should evaluate to 1.

head 5 (Element 0 (Element 3 EmptyList))

should evaluate to 0.

head 5 EmptyList

should evalute to 5.

Complete the definition of the function. The type signature is
provided for you.

Test your function by evaluating the expressions given above. -}

head :: Integer -> ListOfInteger -> Integer
head _ _ = undefined

{- Exercise 4.3

Here's a function named "product" which calculates the product of an
ListOfInteger by multiplying all of the numbers in the list together.
If the value of its argument is an empty list, product should output
1.

To help you write this function, here are a few expressions and the
values they should evaluate to once the function is working:

product EmptyList

should evaluate to 1.

product (Element 2 (Element 4 (Element 6 EmptyList)))

should evaluate to 48.

Complete the definition of the function. The type signature is
provided for you.

Then use the function to calculate the product of a list containing
the values 32, 64, and 128. -}

product :: ListOfInteger -> Integer
product _ = undefined

{- Now we're going to define a new type which represents a list of boolean values.  -}

data ListOfBool
  = EmptyListOfBool
  | BoolElement Bool ListOfBool
  deriving (Show)

{- Exercise 4.4

For this exercise, you don't need to write any Haskell.

a) What is the base case of ListOfBool?

b) What is the inductive case of ListOfBool?

-}

{- Exercise 4.5

Complete the definition of the following function named "lengthBool",
which calculates the length of a ListOfBool. The type signature is
provided for you.

Test your function by evaluating a few expressions! -}

lengthBool :: ListOfBool -> Integer
lengthBool _ = undefined

{- Here are some functions you defined in Lesson 2, Part 2. We'll use
 them shortly. -}

and :: Bool -> Bool -> Bool
and True True = True
and _ _ = False

or :: Bool -> Bool -> Bool
or True _ = True
or _ True = True
or _ _ = False

{- Exercise 4.6

Complete the definition of the following function named "allTrue",
which outputs True if all the elements of a ListOfBool are True, and
outputs False otherwise. The type signature is provided for you.

To help you write this function, here are a few expressions and the
values they should evaluate to once the function is working:

allTrue (BoolElement True (BoolElement True EmptyListOfBool))

should evaluate to True.

allTrue (BoolElement False (BoolElement True EmptyListOfBool))

should evaluate to False.

allTrue (BoolElement True EmptyListOfBool)

should evaluate to True.

allTrue (BoolElement False (BoolElement False EmptyListOfBool))

should evaluate to False.

allTrue EmptyListOfBool

should evaluate to False.

-}

allTrue :: ListOfBool -> Bool
allTrue _ = undefined

{- Exercise 4.7

Complete the definition of the following function named "anyTrue",
which outputs True if ANY of the elements of a ListOfBool are True,
and outputs False otherwise. The type signature is provided for you.

To help you write this function, here are a few expressions and the
values they should evaluate to once the function is working:

anyTrue (BoolElement True (BoolElement True EmptyListOfBool))

should evaluate to True.

anyTrue (BoolElement False (BoolElement True EmptyListOfBool))

should evaluate to True.

anyTrue (BoolElement True EmptyListOfBool)

should evaluate to True.

anyTrue (BoolElement False (BoolElement False EmptyListOfBool))

should evaluate to False.

anyTrue EmptyListOfBool

should evaluate to False.

-}

anyTrue :: ListOfBool -> Bool
anyTrue _ = undefined

{- Exercise 4.8

Here's the incomplete definition of a function named "lastInteger",
which should output the last element of a ListOfInteger. The type
signature is provided for you. (Note that its output type is Integer.)

Try to complete the definition of lastInteger. What problem do you
encounter? How might you fix it?

-}

lastInteger :: ListOfInteger -> Integer
lastInteger _ = undefined

{- Here's the TreeOfInteger type you saw in Lesson 4. -}

data TreeOfInteger
  = Leaf Integer
  | Branch TreeOfInteger TreeOfInteger
  deriving (Show)

{- Exercise 4.11

Complete the following function to calculate the height of an TreeOfInteger. The
height of a tree is equal to the maximum amount of nesting it contains.  For
example, the tree

Branch (Branch (Leaf 1) (Leaf 3)) (Leaf 2)

has a height of 2, as indicated by this drawing:

            /\        |- 2
          /    \      |
        / \      2    |- 1
      /     \         |
     1       3        |- 0

The height of a leaf is 0.

-}

height :: TreeOfInteger -> Integer
height _ = undefined

{- Exercise 4.12

Complete the following function to flatten an TreeOfInteger into an ListOfInteger.
The first integer in the list should be the leftmost integer in the tree, and
the last integer in the list should be the rightmost integer in the tree.

For example, the tree

Branch (Branch (Leaf 1) (Leaf 3)) (Leaf 2)

            /\
          /    \
        / \      2
      /     \
     1       3

should flatten to the list 1,3,2:

Element 1 (Element 3 (Element 2 EmptyList))

-}

flatten :: TreeOfInteger -> ListOfInteger
flatten _ = undefined
