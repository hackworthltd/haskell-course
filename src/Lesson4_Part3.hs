{-# OPTIONS_GHC -Wno-missing-signatures -Wno-incomplete-patterns #-}

module Lesson4_Part3 where

import Lib.Lesson4_Part3

{- Exercises for Lesson 4, part 3: Recursive types.

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

{- Exercise 4.26

In Exercise 4.12, you wrote a function "ifThenElse" that acts like an
"if-then-else" statement in other languages. But that version of the
function only worked with Integer input values.

Now write a variant called "ifThenElseList" which operates on
ListOfInteger values. In other words, ifThenElseList should take 3
inputs: one of type Bool, and 2 of type ListOfInteger. If the value of
the first argument is True, ifThenElseList should output the first
list; otherwise, it should output the second list. -}

ifThenElseList :: Bool -> ListOfInteger -> ListOfInteger -> ListOfInteger
ifThenElseList _ _ _ = undefined

{- Here are a few example lists that you can use to test some of the
 exercises that follow. -}

exampleList1 :: ListOfInteger
exampleList1 = EmptyList

exampleList2 :: ListOfInteger
exampleList2 = (Element 1 (Element 2 (Element 3 (Element 4 (Element 5 EmptyList)))))

exampleList3 :: ListOfInteger
exampleList3 = (Element 0 (Element -1 (Element -2 (Element 0 (Element 3 (Element 4 (Element -5 EmptyList)))))))

{- Exercise 4.27

Most of the recursive functions we've written so far on ListOfInteger
values have either transformed every element of the list (e.g.,
incrementList from Exercise 4.18) or "accumulated" a single value from
the whole list (e.g., allTrue from Exercise 4.7).

Now let's write some functions that take an input list and "filter"
its elements, producing an output list with only the elements from the
original input list that make it through the filter.

First, let's write a function "filterPositive" that takes an input
ListOfInteger, and produces an output ListOfInteger where only the
positive elements of the input list are present in the output list.

In other words, given an input list:

3 5 -3 7 -1 0 3

the function filterPositive should produce the output list:

3 5 7 3

Here are some examples in Haskell syntax, using the example lists
defined above:

filterPositive exampleList1

=> should evaluate to EmptyList

filterPositive exampleList2

=> should evaluate to Element 1 (Element 2 (Element 3 (Element 4 (Element 5 EmptyList))))

filterPositive exampleList3

=> shoud evaluate to Element 3 (Element 4 EmptyList)

Hint: to write this function, use the ifThenElseList you defined in
Exercise 4.26. -}

filterPositive :: ListOfInteger -> ListOfInteger
filterPositive _ = undefined

{- Exercise 4.28

Now write a function "filterNegative" that takes an input
ListOfInteger, and produces an output ListOfInteger where only the
negative elements of the input list are present in the output list.

In other words, given an input list:

3 5 -3 7 -1 0 3

the function filterNegative should produce the output list:

-3 -1

Here are some examples in Haskell syntax, using the example lists
defined above:

filterNegative exampleList1

=> should evaluate to EmptyList

filterNegative exampleList2

=> should evaluate to EmptyList

filterNegative exampleList3

=> should evaluate to Element (-1) (Element (-2) (Element (-5) EmptyList))

Note that you'll need to write the type signature for this function,
as well. -}

filterNegative _ = undefined

{- Exercise 4.29

Finally, write a function "filterEqual" that takes as input both an
Integer value and a ListOfInteger, and produces an output
ListOfInteger where only the elements of the input list that are equal
to the input Integer value are present inthe output list.

In other words:

filterEqual 3 exampleList1

=> should evaluate to EmptyList

filterEqual 3 exampleList2

=> should evaluate to Element 3 EmptyList

filterEqual 3 exampleList3

=> should evaluate to Element 3 EmptyList

filterEqual 0 exampleList3

=> should evaluate to Element 0 (Element 0 EmptyList)

Note that you'll need to write the type signature for this function,
as well. -}

filterEqual _ _ = undefined

{- Exercise 4.30

For this exercise, you don't need to write any Haskell.

Take a look at your answers for Exercises 4.27, 4.28, and 4.29. Do you
notice anything similar about them? Explain.

-}

{- Here are a few example TreeOfInteger's. You can use these to test
your answer to Exercise 4.31, so that you don't have to type the
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

{- Exercise 4.31

Here's the incomplete definition of a function called
"findInTreeOfInteger", which calculates whether a TreeOfInteger
contains a specific Integer value.

The first argument is a value of type Integer, and the second argument
is a TreeOfInteger. If the value of the first argument is found
anywhere in the tree, the function should output True. Otherwise it
should output False.

To help you write this function, here are a few expressions and the
values they should evaluate to once the function is working:

findInTreeOfInteger 1 exampleTree1

should evaluate to False.

findInTreeOfInteger 1 exampleTree2

should evaluate to True.

findInTreeOfInteger 1 exampleTree3

should evaluate to True.

findInTreeOfInteger 4 exampleTree3

should evaluate to False.

Complete the defintion of function findInTreeOfInteger. The type
signature is provided for you.

Test your function using the expressions given above.

Hint: you'll probably need to use the "or" function, which is
defined below. -}

or :: Bool -> Bool -> Bool
or True _ = True
or _ True = True
or _ _ = False

findInTreeOfInteger :: Integer -> TreeOfInteger -> Bool
findInTreeOfInteger _ _ = undefined
