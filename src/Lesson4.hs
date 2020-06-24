{-# OPTIONS_GHC -Wno-missing-signatures -Wno-incomplete-patterns #-}

module Lesson4 where

import Lib.Lesson4

{- Exercises for Lesson 4: Recursive types.

In this file, we'll sometimes refer to types you've seen in the
lessons, or in previous exercises. When we do, we'll provide the
definitions for those types so that you can use them in your
solutions.

Included here is the ListOfInteger type that was defined in Lesson4, in
addition to the Bool type we've been using since Lesson1. -}

data ListOfInteger
  = EmptyList
  | Element Integer ListOfInteger
  deriving (Show)

data Bool
  = False
  | True
  deriving (Show)

{- Exercise 4.1

For each of the following types, write down:
- is the type recursive?
- if it is:
  - which value constructor corresponds to the inductive case?
  - which value constructor corresponds to the base case (if there is one)?
  - write down a value of this type

Write your answer at the bottom of this comment.

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

Here's a function named "head" which returns the first element of an
ListOfInteger. Its first argument is the "default value", which should be returned
if the list is empty. Its second argument is the list itself.

Here is how head should behave:

head 7 EmptyList == 7
head 7 (Element 1 EmptyList) == 1
head 5 (Element 1 (Element 3 EmptyList)) == 1
head 5 EmptyList == 5

Complete the implementation. When you've completed it, test out your function by
calling it with the test arguments given above. -}

head :: Integer -> ListOfInteger -> Integer
head _ _ = undefined

{- Exercise 4.3

Here's a function named "product" which calculates the product of an ListOfInteger
(the result when you multiply all the numbers together). If given an empty list,
product should return 1.

Here is how product should behave:

product EmptyList == 1
product (Element 2 (Element 4 (Element 6))) == 48

a) Complete the implementation.

b) Use "product" to calculate the product of this list: 32,64,128

-}

product :: ListOfInteger -> Integer
product _ = undefined

{- Now we're going to define a new type which represents a list of boolean values.  -}

data BoolList
  = EmptyBoolList
  | BoolElement Bool BoolList
  deriving (Show)

{- Exercise 4.4

a) What is the base case of BoolList?
b) What is the inductive case of BoolList?

-}

{- Exercise 4.5

Complete the following function, which calculates the length of a BoolList.
-}

lengthBool :: BoolList -> Integer
lengthBool _ = undefined

{-
  Here are some functions you defined in Lesson 2, Part 2. We'll use them shortly.
-}

and :: Bool -> Bool -> Bool
and True True = True
and _ _ = False

or :: Bool -> Bool -> Bool
or True _ = True
or _ True = True
or _ _ = False

{- Exercise 4.6

Complete the following function, which returns True if all the elements of a
BoolList are True, and returns False otherwise.
-}

allTrue :: BoolList -> Bool
allTrue _ = undefined

{- Exercise 4.7

Complete the following function, which returns True if ANY of the elements of a
BoolList are True, and returns False otherwise.
-}

anyTrue :: BoolList -> Bool
anyTrue _ = undefined

{-

Here is the type signature of a function called "lastInteger", which returns the
last element of an ListOfInteger.

-}

lastInteger :: ListOfInteger -> Integer
lastInteger _ = undefined

{- Exercise 4.8

Try to complete the definition of lastInteger. What problem do you encounter?
How could you fix it?

-}

{- Here's the TreeOfInteger type you saw in Lesson 4 -}

data TreeOfInteger
  = Leaf Integer
  | Branch TreeOfInteger TreeOfInteger
  deriving (Show)

{- Exercise 4.9

Complete the following function, which calculates whether an TreeOfInteger contains a specific Integer.
If the Integer is somewhere in the tree, the function should return True.
Otherwise it should return False.

Here are some examples:

integerInTree 1 (Leaf 2) == False
integerInTree 1 (Branch (Leaf 2) (Branch (Leaf 1) (Leaf 3))) == True
integerInTree 4 (Branch (Leaf 2) (Branch (Leaf 1) (Leaf 3))) == False
-}

integerInTree :: Integer -> TreeOfInteger -> Bool
integerInTree _ _ = undefined

{- Exercise 4.10

Consider the unfinished function below, which combines two ListOfIntegers by adding their elements together.

a) How many equations will this function have, assuming we don't use any wildcard patterns?

b) Expand the function by writing out each equation, leaving holes for the right hand sides.

c) Assume that we will only call this function with ListOfIntegers of the same
length. Which equations will be used and which won't be used? For the equations
that won't be used, fill in their right hand sides with EmptyList.

d) Fill in the right hand sides of the remaining equations so that the function is fully defined. Test it on the following cases:

addLists EmptyList EmptyList == EmptyList
addLists (Element 1 EmptyList) (Element 2 EmptyList) == Element 3 EmptyList
addLists (Element 1 (Element 2 (Element 3 EmptyList))) (Element 2 (Element 3 (Element 4 EmptyList))) == (Element 3 (Element 5 (Element 7 EmptyList)))

e) The function we have written returns an empty list if its arguments have
different lengths. This is an arbitrary design choice: we could have made the
function do something else in this case instead. Can you think of a more useful
thing for the function to return if the lists have different lengths? Try to
write a new function addLists2 which implements the behaviour.

-}

addLists :: ListOfInteger -> ListOfInteger -> ListOfInteger
addLists _ _ = undefined

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
