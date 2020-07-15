module Lesson5_Part1 where

import Lib.Lesson5_Part1

{- Lesson5, Part1: Parametric types

At this point in the course we are going to give fewer type signatures
and function stubs etc for you in the exercises. This means some of
the questions will be entirely in the comments - be careful not to
miss any! -}

{- Exercise 5.1

For each of the following types:
  a) is it polymorphic?
  b) write down a value of (some instance of) that type
     (giving it a type signature)
     (e.g. if we give you the List type from lessons, you could write
       yup :: List Bool
       yup = Element True EmptyList
     )

Please write your answers below the corresponding data definition. -}

data List r
  = EmptyList
  | Element r (List r)
  deriving (Show)

data Zero r
  = Zero
  deriving (Show)

data One r
  = One r
  deriving (Show)

data Two r
  = Two r r
  deriving (Show)

data Bool
  = True
  | False
  deriving (Show)

-- For this type Odd r, can you also write a value that uses the More
-- constructor twice?
data Odd r
  = Done r
  | More (Odd (Two r)) (Odd (Two r))
  deriving (Show)

{- Exercise 5.2

The parameterised list type from the lesson (given above in Exercise
5.1) should be "the same" as the ListOfBool and ListOfInteger types
from Lesson4. By "the same," we mean that, for example, values of type
List Integer can be converted to values of type ListOfInteger, and
vice versa, without any loss of information.

To show they can be converted, there should be functions that take
List Integer and output ListOfInteger, and the other way around.

Implement these conversion functions for List Integer and
ListOfInteger. The ListOfInteger type from Lesson4 is given below,
though the names of its value constructors are slightly different now
in order to prevent name clashes with our new parameterised list type.

We've also provided a few example lists of each type, so that you can
easily test your functions. -}

data ListOfInteger
  = EmptyListOfInteger
  | IntegerElement Integer ListOfInteger
  deriving (Show)

exampleListInteger1 :: List Integer
exampleListInteger1 = EmptyList

exampleListInteger2 :: List Integer
exampleListInteger2 = Element 1 (Element 2 (Element 3 EmptyList))

exampleListOfInteger1 :: ListOfInteger
exampleListOfInteger1 = EmptyListOfInteger

exampleListOfInteger2 :: ListOfInteger
exampleListOfInteger2 = IntegerElement 1 (IntegerElement 2 (IntegerElement 3 EmptyListOfInteger))

toListOfInteger :: List Integer -> ListOfInteger
toListOfInteger _ = undefined

toListInteger :: ListOfInteger -> List Integer
toListInteger _ = undefined

{- Exericse 5.3

If you successfully wrote the functions in Exercise 5.2, this shows
that the two list representations can be converted. However, why are
they "the same"? (Note that we can have functions in each direction
between Integer and Bool, but they certainly are not the same!) We
would like that if we make a round trip (either way around), we should
end up with the value we started with (i.e. we didn't lose any
information)

Without writing any Haskell code (i.e., in plain English), could you
convince someone that the two functions you implemented are inverses?
That is to say: for any value "x" of type ListOfInteger, can you show
that

toListOfInteger (toListInteger x)

always evaluates to the original value x?

And also, for any value "y" of type List Integer, can you show that

toListInteger (toListOfInteger y)

always evaluates to the original value y?

(Hint: approach this problem like you would when writing a function
taking x (or y) as an argument. What if x was EmptyListOfInteger? What
if it was an IntegerElement?

Write your answer in a comment here.

(You may need to change your answer to Exercise 5.2 to make this true!
If so, please preserve your old answer - it will be really interesting
to see how you have interpreted our intentionally vague definition of
"the same"!)


-}

{- Here's the TreeOfInteger type from the Lesson4 exercises (again, with
the names of the value constructors slightly changed to avoid name
clashes). -}

data TreeOfInteger
  = IntegerLeaf Integer
  | IntegerBranch TreeOfInteger TreeOfInteger
  deriving (Show)

{- Exercise 5.4

Define a parameterised version of a Tree, one that can hold any type
of leaf.

Then, using your new parameteised Tree type, write a value of type
Tree Integer that represents this tree:

           /\
          /  \
         /\   2
        /  \
       1    3

-}

{- Here's the MaybeMonth type from Lesson3, along with our old friend
 the Month type. Recall that we used this MaybeMonth type to represent
 computations on values of type Month where the computation could
 potentially fail to produce a valid Month value (represented by the
 NothingMonth value). -}

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

data MaybeMonth
  = NothingMonth
  | JustMonth Month
  deriving (Show)

{- Exercise 5.5

Define a parameterised version of the Maybe type, one that can
represent failure or success for a computation on any type. -}
