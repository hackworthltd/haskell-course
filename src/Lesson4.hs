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

a) For each of the following type definitions, answer the following
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

b) Using type ListOfInteger and its value constructors, write a
Haskell expression that builds a ListOfInteger list for each of the
following lists:

- the empty list

- A list with just the value 10 in it

- A list with the values 1, 3, 2, 4 in it.

Remember that you can test your expressions by running this file in
Repl.it and then writing the expressions in the GHCi window.

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

For this function, you don't need to write any Haskell.

Take a look at the function you just defined in Exercise 4.2. We know
from the Lesson4 that type ListOfInteger is a recursive type; is
function head a recursive *function*? Why or why not?


-}

{- ****

Now stop here and continue on with Lesson4, starting where you left
off at the section named "More recursive functions."

**** -}



{- Exercise 4.4

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

{- Exercise 4.5

For this exercise, you don't need to write any Haskell.

a) What is the base case of ListOfBool?

b) What is the inductive case of ListOfBool?

-}

{- Exercise 4.6

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

{- Exercise 4.7

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

{- Exercise 4.8

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

{- Exercise 4.9

Here's the incomplete definition of a function named "lastInteger",
which should output the last element of a ListOfInteger. The type
signature is provided for you. (Note that its output type is Integer.)

Try to complete the definition of lastInteger. What problem do you
encounter? How might you fix it?

-}

lastInteger :: ListOfInteger -> Integer
lastInteger _ = undefined

{- Challenge exercises.

The next two exercises are rather difficult. Give them a try and see
how you do, but don't be too concerned if you can't figure them out.
Feel free to ask the instructor for help, if you need it. -}

{- Exercise 4.10

Define a function named "appendList" which takes as input two lists of
type ListOfInteger, and appends the second list to the end of the
first.

For example, if you have a list of integers containing 4, 5, and 6;
and you append it to a list of integers containing 1, 2, and 3; you
will get a new list containing integers 1, 2, 3, 4, 5, and 6.

To help you write this function, here are a few expressions and the
values they should evaluate to once the function is working:

appendList EmptyList EmptyList

should evaluate to EmptyList

appendList EmptyList (Element 1 EmptyList)

should evaluate to Element 1 EmptyList

appendList (Element 1 EmptyList) EmptyList

should evaluate to Element 1 EmptyList

appendList (Element 1 EmptyList) (Element 2 EmptyList)

should evaluate to Element 1 (Element 2 EmptyList)

appendList (Element 2 EmptyList) (Element 1 EmptyList)

should evaluate to Element 2 (Element 1 EmptyList)

appendList (Element 1 (Element 2 (Element 3 EmptyList))) (Element 2 EmptyList)

should evaluate to Element 1 (Element 2 (Element 3 (Element 2 EmptyList)))

appendList (Element 1 (Element 2 (Element 3 EmptyList))) (Element 4 (Element 5 EmptyList))

should evaluate to Element 1 (Element 2 (Element 3 (Element 4 (Element 5 EmptyList))))

appendList (Element 4 (Element 5 EmptyList)) (Element 1 (Element 2 (Element 3 EmptyList)))

should evaluate to Element 4 (Element 5 (Element 1 (Element 2 (Element 3 EmptyList))))

The function type signature is provided for you.

Hint: Start by defining the equation for the case when the first
argument is the empty list. Then define the equation for the case
where the second argument is the empty list. Then write the remaining
equation where neither list is empty.

-}

appendList :: ListOfInteger -> ListOfInteger -> ListOfInteger
appendList _ _ = undefined

{- Here's the TreeOfInteger type you saw in Lesson 4. -}

data TreeOfInteger
  = Leaf Integer
  | Branch TreeOfInteger TreeOfInteger
  deriving (Show)

{- Exercise 4.11

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

Hint: use the function you defined in Exercise 4.10, "appendList", to
write this function. This function is actually quite easy once you
figure how how to use appendList!

-}

flatten :: TreeOfInteger -> ListOfInteger
flatten _ = undefined
