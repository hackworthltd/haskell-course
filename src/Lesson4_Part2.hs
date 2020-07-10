{-# OPTIONS_GHC -Wno-missing-signatures -Wno-incomplete-patterns #-}

module Lesson4_Part2 where

import Lib.Lesson4_Part2

{- Exercises for Lesson 4, part 2: Recursive types.

In this file, we'll sometimes refer to types and functions you've seen
in the lessons, or in previous exercises. When we do, we'll provide
the definitions for those types so that you can use them in your
solutions.

Included here are the ListOfInteger of TreeOfInteger types that were
defined in Lesson4. -}

data ListOfInteger
  = EmptyList
  | Element Integer ListOfInteger
  deriving (Show)

data TreeOfInteger
  = Leaf Integer
  | Branch TreeOfInteger TreeOfInteger
  deriving (Show)

{- Exercise 4.12

One of the interesting things about Haskell is that you can define for
yourself many of the things that other programming languages "bake
in." We've already seen this as far back as Lesson1, when we defined
our own Bool type that behaves exactly like Haskell's own built-in
Bool type.

Speaking of Bool, from this point forward, we're going to use
Haskell's own built-in Bool type, rather than the one we've been
defining ourselves. We do this so that we can use Haskell's built-in
functions that make use of its own Bool type.

For your reference, Haskell's built-in Bool type looks like this,
which by now should look very familiar to you:

data Bool
  = False
  | True

Now back to defining things for ourselves in Haskell that other
programming languages have to bake in:

Given below is the incomplete definition of a function named
"ifThenElse", which behaves (mostly) the same as "if-then-else"
statements in other languages such as Python. The only differences are
a) the syntax; and b) this ifThenElse only works with Integer values,
rather than typical if-then-else statements that can operate on values
of any type.

We'll see how to make an "if-then-else" function that works with any
type in Lesson5, which will address difference b).

The syntax of this if-then-else implementation is different than in
other languages because it's just a normal Haskell function, so
whereas in Python we would write:

if x:
  7
else:
  0

in Haskell, we would write the same expression like this:

ifThenElse x 7 0

Both the Python and the Haskell expressions evaluate "x" and, if its
value is True, ouput 7; otherwise, they output 0.

Now it's your turn: write the missing equations for ifThenElse below.
From the type signature, we can see that ifThenElse takes 3 arguments.
The first argument is a value of type Bool. Its value determines the
output of the function:

- If the value of the first argument is True, ifThenElse outputs the
value of its second argument (this is the "then" part of the
if-then-else).

- Otherwise, ifThenElse outputs the value of its third argument (this
  is the "else" part of the if-then-else).

To test your function, evaluate the following expressions in GHCi.:

ifThenElse True 3 0

=> should evaluate to 3

ifThenElse False 3 0

=> should evaluate to 0

ifThenElse True 8 15

=> should evaluate to 8

ifThenElse False 8 15

=> should evaluate to 15

-}

ifThenElse :: Bool -> Integer -> Integer -> Integer
ifThenElse _ _ _ = undefined

{- So far, we've used functions to add (+) and multiply (*) values of
type Integer, but what if we want to compare them?

As you might expect, Haskell provides functions for checking two
Integer values for equality (==). It also includes functions for
inequality (/=), less than (<), greater than (>), less-than-or-equal
(<=), and greater-than-or-equal (>=). All of these functions can be
used infix style and output a value of type Bool, like so:

3 < 2

=> evaluates to False

3 > 2

=> evaluates to True

3 == 2

=> evaluates to False

3 /= 2

=> evaluates to True

2 > 2

=> evaluates to False

2 >= 2

=> evaluates to True

2 < 2

=> evaluates to False

2 <= 2

=> evaluates to True

Now let's use these operators to write a few functions. -}

{- Exercise 4.13

Using the ifThenElse function we defined in Exericse 4.12 and one of
the inequality functions, write a function "abs" which takes an input
value of type Integer and outputs the absolute value of its input.
That is:

abs 3

=> evaluates to 3

abs -3

=> evaluates to 3

abs 0

=> evaluates to 0

Note: to "invert" an Integer value -- that is, to make a positive
Integer negative and a negative Integer positive, you can use the "-"
function, but due to quirks of Haskell's syntax, you'll need to
surround it with (). In other words, given a value of type Integer
named "x", you can invert x by writing:

(- x)

-}

abs :: Integer -> Integer
abs _ = undefined

{- Exercise 4.14

For this exercise, you don't need to write any Haskell.

In Exercise 4.13, we asked you to use the "ifThenElse" function to
implement function "abs". Could you implement "abs" using pattern
matches, instead? Explain why or why not.

-}

{- Exercise 4.15

Using the ifThenElse function we defined in Exercise 4.12 and one of
the inequality functions, write a function "max" which takes two
inputs of type Integer and outputs the value that is the greater of
the two inputs. That is:

max 3 2

=> evaluates to 3

max 2 3

=> evaluates to 3

max 2 2

=> evaluates to 2

max -3 -5

=> evaluates to -3.

max -5 -3

=> evaluates to -3.

-}

max :: Integer -> Integer -> Integer
max _ _ = undefined

{- Exercise 4.16

Now write a function "min" which takes two inputs of type Integer and
outputs the value that is the lesser of the two inputs. That is:

min 3 2

=> evaluates to 2

min 2 3

=> evaluates to 2

min 2 2

=> evaluates to 2

min -3 -5

=> evaluates to -5.

min -5 -3

=> evaluates to -5.

Note: you'll need to provide the type signature for this function!
-}

min _ _ = undefined

{- Exercise 4.17

Now write a function "equal" which takes two inputs of type Integer
and outputs True, if the inputs are equal, and False otherwise. That
is:

equal 0 3

=> evaluates to False

equal 3 0

=> evaluates to False

equal -3 -3

=> evaluates to true

equal 3 3

=> evaluates to True

equal 0 0

=> evaluates to True

Note: you'll need to provide the type signature for this function!
-}

equal _ _ = undefined

{- Here are a few example ListOfInteger's. You can use these to test the
 answers to subsequent exercises, so that you don't have to type the
 inconvenient list definitions each time you want to run a test in
 GHCi.

-}

{- exampleList1 is an empty list. -}

exampleList1 :: ListOfInteger
exampleList1 = EmptyList

{- exampleList2 is a list with a single element, containing the value 1. -}

exampleList2 :: ListOfInteger
exampleList2 = (Element 1 EmptyList)

{- exampleList3 is a list with 5 elements, 1 through 5 in order; e.g.:

1 2 3 4 5

-}

exampleList3 :: ListOfInteger
exampleList3 = (Element 1 (Element 2 (Element 3 (Element 4 (Element 5 EmptyList)))))

{- Exercise 4.18

Write a function "incrementList" which takes as input a ListOfInteger
and outputs a new ListOfInteger by incrementing the value of each
element by 1. For example:

incrementList exampleList1

=> should evaluate to EmptyList

incrementList exampleList2

=> should evaluate to (Element 2 EmptyList)

incrementList exampleList3

=> should evaluate to (Element 2 (Element 3 (Element 4 (Element 5 (Element 6 EmptyList)))))

-}

incrementList :: ListOfInteger -> ListOfInteger
incrementList _ = undefined

{- Exercise 4.19

Write a function "decrementList" which takes as input a ListOfInteger
and outputs a new ListOfInteger by decrementing the value of each
element by 1. For example:

decrementList exampleList1

=> should evaluate to EmptyList

decrementList exampleList2

=> should evaluate to (Element 0 EmptyList)

decrementList exampleList3

=> should evaluate to (Element 0 (Element 1 (Element 2 (Element 3 (Element 4 EmptyList)))))

Note: you'll need to provide the type signature for this function!
-}

decrementList _ = undefined

{- Exercise 4.20

Write a function called squareList which takes as input a
ListOfInteger and outputs a new ListOfInteger by squaring the value of
each element. For example:

squareList exampleList1

=> should evaluate to EmptyList

squareList exampleList2

=> should evaluate to (Element 1 EmptyList)

squareList exampleList3

=> should evaluate to (Element 1 (Element 4 (Element 9 (Element 16 (Element 25 EmptyList)))))

Note: you'll need to provide the type signature for this function!
-}

squareList _ = undefined

{- Exercise 4.21

For this exercise, you don't need to write any Haskell.

Take a look at your answers for Exercises 4.18, 4.19, and 4.29. Do you
notice anything in common across your solutions? Explain.

-}

{- Here are a few example TreeOfInteger's. You can use these to test the
answers to your exercises, so that you don't have to type the
inconvenient tree defintions each time you want to run a test in GHCi. -}

{- exampleTree1 is just a leaf with value 2. -}

exampleTree1 :: TreeOfInteger
exampleTree1 = Leaf 2

{- exampleTree2 looks like this:

        /\
       /  \
      2   /\
         /  \
        3    1
-}

exampleTree2 :: TreeOfInteger
exampleTree2 = (Branch (Leaf 2) (Branch (Leaf 3) (Leaf 1)))

{- exampleTree3 is just the mirror of exampleTree2:

           /\
          /  \
         /\   2
        /  \
       1    3

-}

exampleTree3 :: TreeOfInteger
exampleTree3 = Branch (Branch (Leaf 1) (Leaf 3)) (Leaf 2)

{- Exercise 4.22

Write a function "incrementTree" which takes as input a TreeOfInteger
and outputs a new TreeOfInteger by incrementing the value of each
leaf by 1. For example:

incrementTree exampleTree2

=> should evaluate to Leaf 3

incrementTree exampleTree2

=> should evaluate to Branch (Leaf 3) (Branch (Leaf 4) (Leaf 2))

incrementTree exampleTree3

=> should evaluate to Branch (Branch (Leaf 2) (Leaf 4)) (Leaf 3)

-}

incrementTree :: TreeOfInteger -> TreeOfInteger
incrementTree _ = undefined

{- Exercise 4.23

Write a function "decrementTree" which takes as input a TreeOfInteger
and outputs a new TreeOfInteger by decrementing the value of each leaf
by 1. For example:

decrementTree exampleTree1

=> should evaluate to Leaf 1

decrementTree exampleTree2

=> should evaluate to Branch (Leaf 1) (Branch (Leaf 2) (Leaf 0))
decrementTree exampleTree3

=> should evaluate to Branch (Branch (Leaf 0) (Leaf 2)) (Leaf 1)

Note: you'll need to provide the type signature for this function!
-}

decrementTree _ = undefined

{- Exercise 4.24

Write a function "squareTree" which takes as input a TreeOfInteger
and outputs a new TreeOfInteger by decrementing the value of each leaf
by 1. For example:

squareTree exampleTree1

=> should evaluate to Leaf 4

squareTree exampleTree2

=> should evaluate to Branch (Leaf 4) (Branch (Leaf 9) (Leaf 1))

squareTree exampleTree3

=> should evaluate to Branch (Branch (Leaf 1) (Leaf 9)) (Leaf 4)

Note: you'll need to provide the type signature for this function!
-}

squareTree _ = undefined

{- Exercise 4.25

For this exercise, you don't need to write any Haskell.

Take a look at your answers for Exercises 4.22, 4.23, and 4.24. Do you
notice anything in common across your solutions? Explain.

-}
