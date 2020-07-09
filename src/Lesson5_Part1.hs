{-# LANGUAGE ExplicitForAll #-}
module Lesson5_Part1 where
-- TODO: do the no implicit prelude mangling to this.

{- Exercises on polymorphism

At this point in the course we are going to give fewer type signatures and
function stubs etc for you in the exercises. This means some of the questions
will be entirely in the comments - be careful not to miss any! Of course, we
still hope to see type signatures in your answers.
-}

{- Section 1: Review of the lesson -}

{- Exercise 5.1

For each of the following types:
  a) is it polymorphic?
  b) write down a value of (some instance of) that type
     (giving it a type signature)
     (e.g. if we give you the List type from lessons, you could write
       yup :: List Bool
       yup = Element True EmptyList
     )
  c) can you write a polymorphic value of that type?
     (e.g. if we gave you the List type, could you write a value of type
       forall r. List r
     )
     If so, the do so!
     If not, can you explain why not?

Please write your answers below the corresponding data definition
-}

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

data Odd r
  = Done r
  | More (Odd (Two r)) (Odd (Two r))
  deriving (Show)
-- For this one, can you also give a value that uses the More constructor
-- twice?


{- Exercise 5.2
The List from the lesson (replicated above) should be "the same" as ListOfBool
and ListOfInteger which we have previously seen. By "the same" we mean that
they can be converted into each other with no loss of information.

To show they can be converted into each other, there should be functions that
take List Bool and return ListOfBool, and the other way around.

Part a: implement these functions (replace the 'undefined' in the rhs of the
below)
-}
-- The old data definition for Integer was (renaming the constructors to avoid
-- clashing with the polymorphic List):
data ListOfInteger
  = EmptyListOfInteger
  | IntegerElement Integer ListOfInteger
  deriving (Show)

toOldListInteger :: List Integer -> ListOfInteger
toOldListInteger = undefined

toNewListInteger :: ListOfInteger -> List Integer
toNewListInteger = undefined

{-
This shows the two representations can be converted. However, why are they "the
same"?  (Note that we can have functions in each direction between Integer and
Bool, but they certainly are not the same!) We would like that if we make a
round trip (either way around), we should end up with the value we started with
(i.e.  we didn't lose any information)

Part b: unfortunately Haskell is not expressive enough to answer this question
with code (although with a good testing framework you can come close...), so
can you convince us that the two functions you implemented are inverses? That
is to say: for any 'x :: ListOfInteger', show that 'toOldListInteger
(toNewListInteger x)' is identical to 'x', and also for 'y :: List Integer' is
identical to 'toNewListInteger (toOldListInteger y)'.

(Hint: approach it similarly to writing a function taking 'x' (or 'y') as an
argument. What if 'x' was the empty list? What if it was an 'IntegerElement'?

Write your answer in a comment here.

(You may need to change your answer to part (a) to make this true! If so,
please preserve your old answer - it will be really interesting to see how you
have interpreted our intentionally vague definition of "the same"!)
-}


{- Section 2: Recapitulation

Let us revisit our old friends of lists and trees, taking advantage of
polymorphism to not repeat ourselves -}

{- Exercise 5.3

In Lesson 4 we saw how to take the tail of a list (i.e. throw away the first
element, if any, returning the rest of the list). However, it only worked for
ListOfInteger. Generalise this to work on any List.
-}
tail :: forall r. List r -> List r
tail = undefined

{- Exercise 5.4
Similarly, sameLength tested whether two lists have the same length, returning
a Bool, but only for ListOfInteger. Generalise it to work on any List. This
time we won't even give you the signature!
-}

{- Exercise 5.5
Write a polymorphic append function. Given two lists, it should combine them
into one which contains all the elements of the first list (in the same order
as the original), followed by all the elements of the second.
-}

-- TODO: DREW: 5.6 are new - should be added to the extra-lesson4 exercises
{- Exercise 5.6
Doubling a list. There are two ways to "double a list" that spring to my mind:
  - duplicate each element in place: taking 1,2,3 to 1,1,2,2,3,3
  - duplicate the entire list: taking 1,2,3 to 1,2,3,1,2,3
Write two functions - one for each of the above.
Bonus question: if any other way spring to mind, implement that also!
-}
doubleInPlace :: forall r . List r -> List r
doubleInPlace = undefined

doubleEntire :: forall r . List r -> List r
-- Hint: can we have a very short definition by calling another function we
-- have defined?
doubleEntire = undefined

{- Exercise 5.7
Recall the definition of 

data TreeOfInteger
  = Leaf Integer
  | Branch TreeOfInteger TreeOfInteger
  deriving (Show)

and Exercise 4.11, which asked you to flatten a tree to a list.

Generalise this tree type to hold values of any leaf type, and write a
flattening function for it.
-}


-- TODO: DREW: this is new (one of the ones cut from Lesson 4) - should be added to the extra-lesson4 exercises
{- Exercise 5.8
(Write a function to) calculate the height of a tree.
This is the furthest away a leaf can be from the root.
For example in the tree
  / \
/ \ C
A B
the height is 2 (reached by A and B).

Hint: whilst this description specifies the behaviour we want from your answer,
it is perhaps not the best way to think about the problem. It may be easier
to think recursively: how does the height of a node, say Node tLeft tRight
relate to the height of tLeft and the height of tRight?

The function should have the following type, which is left in the comment since
'Tree' is only defined in an exercise.

height :: forall r . Tree r -> Integer
-}



{- Exercise 5.9
Surprise return of 5.2!
  Part c: How would your answer change for ListOfBool?
-}


{- Section 3: More exercises -}

{- Exercise 5.10
Part a: implement any function of the below type
-}
foo :: forall r . r -> r
foo = undefined

{-
Part b: Are there any other functions of the same type? Why / why not?
(answer in a comment here)
-}
