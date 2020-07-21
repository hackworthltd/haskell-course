module Lesson6_Part1 where

import Lib.Lesson6_Part1

{- Lesson6, Part1: Higher-order functions -- learning to map.

Let's start by defining some old friends. -}

data List r
  = EmptyList
  | Element r (List r)
  deriving (Show)

data Tree s
  = Leaf s
  | Branch (Tree s) (Tree s)
  deriving (Show)

data Maybe t
  = Nothing
  | Just t
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

{- Exercise 6.1

In Exercise 4.12, you wrote a function "ifThenElse" that acts like an
"if-then-else" statement in other languages. However, it only worked
with Integer input values.

Then, in Exercise 4.26, you wrote a function "ifThenElseList" which
did the same, except that it only worked with values of type
ListOfInteger, which we've subsequently replaced with our
parameterised List type.

Now that you know how to write polymorphic functions, you can write
the final "ifThenElse" function that works with *any* type. So let's
do that now.

Write a polymorphic function ifThenElse that takes 3 arguments:

- The first argument is always of type Bool.

- The second and third arguments can have any type "r" (for all types
  r).

- If the first argument evaluates to True, then ifThenElse outputs the
  value of the second argument.

- Otherwise, it outputs the value of the third argument.

Write the function and its type signature below. Then test it by
writing a few expressions. Each of your expressions should have a
different type. -}

-- Your definition of polymoprhic ifThenElse goes here.

{- Exercise 6.2

We'll need some example list and tree values, for use with testing our
examples. Let's define a few and give them convenient names, so that
we don't have to type them by hand each time we want to use them as
arguments to functions.

Recall that in Haskell, we can create convenient names for particular
values via a "binding." A binding does the following:

- Via a type signature, it gives the name a type, e.g., `List
  Integer`.

- Via an equation, it gives the name a value, e.g., `Element 0
  (Element 1 (Element 2 EmptyList))`.

Define the following bindings:

1. `integerList` of type `List Integer`, whose value is a list
containing integers 3,-1,0,8.

2. `boolList` of type `List Bool`, whose value is a list containing
truth values True,False,True.

3. `summerMonths` of type `List Bool` whose value is a list containing
the months June,July,August.

4. `integerTree` of type `Tree Integer`, whose value is a tree that
looks like this:

                  /\
                 /  \
                /    \
               3     /\
                    /  \
                   /    \
                 -1     /\
                       /  \
                      /    \
                     0      8

5. `boolTree` of type `Tree Bool`, whose value is a tree that looks
like this:

                          /\
                         /  \
                        /    \
                       /      \
                      /\      True
                     /  \
                    /    \
                   /      \
                True     False

-}

-- Your bindings go here.

{- Exercise 6.3

For this exercise, you don't need to write any Haskell.

Your colleague is trying to write a binding for a value of type `List
r`, but is running into problems. She's chosen a name for the binding,
and can write its type signature, but she's having trouble figuring
out how to write the value. She shows you what she's got so far:

exampleListOfR :: List r
exapmleListOfR = ?

Can you help her? What would you tell her?

-}

{- In Lesson6 Part1, we defined a function `map` that takes as input a
function of type `Integer -> Integer`, and a `List Integer`, and
transforms the input list by applying the function to each element of
the input list. The result is an output of type `List Integer` that
contains the transformed elements.

This `map` function is given below. -}

map :: (Integer -> Integer) -> List Integer -> List Integer
map _ EmptyList = EmptyList
map f (Element x l) = Element (f x) (map f l)

{- Exercise 6.4

As we saw in Lesson6 Part 1, `map` is nice and saves us some typing,
but it only works for `List Integer`. Surely we want to map functions
onto other types of lists, too.

Write a function `mapBool` that acts on lists of type `List Bool` just
like `map` does on lists of type `List Integer`. (The function that
`mapBool` maps onto each element of the input list should have type
`Bool -> Bool`.)

To test your `mapBool` function, map the function `not` (whose
definition is given below) onto the elements of a `List Bool`. This
will have the effect of inverting the truth value of every element of
the input list. For example:

mapBool not boolList
=> Element False (Element True (Element False EmptyList))

-}

not :: Bool -> Bool
not True = False
not False = True

-- Your definition of function mapBool goes here.

{- Exercise 6.5

Now write a function `mapMonth` that acts on lists of type `List
Month` just like `map` does on lists of type `List Integer` (and
`mapBool` does for lists of type `List Bool`.

Test your `mapMonth` function by mapping function `nextMonth` (whose
definition is given below) onto the elements of a `List Month`. For
example:

mapMonth nextMonth summerMonths
=> Element July (Element August (Element September EmptyList))

-}

nextMonth :: Month -> Month
nextMonth January = February
nextMonth February = March
nextMonth March = April
nextMonth April = May
nextMonth May = June
nextMonth June = July
nextMonth July = August
nextMonth August = September
nextMonth September = October
nextMonth October = November
nextMonth November = December
nextMonth December = January

-- Your definition of function mapMonth goes here.

{- Exercise 6.6

This is a bonus exercise.

Exercises 6.4 and 6.5 asked you to write versions of the `map`
function that work for `List Bool` and `List Month`, respectively.

In Lesson5, we learned about polymorphic functions, which are useful
precisely in situations like this. Wouldn't it be nice if there were
just a single polymorphic version of `map` that could work with *any*
type of list?

Write a polymorphic version of `map`. To avoid name conflicts, call it
`polyMap`.

To get you started, rememeber the technique we've used in the lessons
to spot opportunities for abstraction: take a look at your answers for
these exercises, along with the original version of `map`, and compare
them. Do you see a repeated pattern here? Separate out the bits that
repeat from the bits that vary, and replace the bits that vary with a
generic parameter.

Test your polyMap function with all of the examples you used to test
the various monomorphic versions in Exercises 6.4 and 6.5. Of course,
you'll want to make sure that polyMap works with values of type `List
Integer`, as well, so we've provided the example `increment` and
`square` functions from Lesson6 Part1. Use these to test polyMap on
values of type `List Integer`.

Here are some example expressions you should try with `polyMap`, along
with the values they should evaluate to:

polyMap square integerList
=> Element 9 (Element 1 (Element 0 (Element 64 EmptyList)))

polyMap increment integerList
=> Element 4 (Element 0 (Element 1 (Element 9 EmptyList)))

polyMap not boolList
=> Element False (Element True (Element False EmptyList))

polyMap nextMonth summerMonth
=> Element July (Element August (Element September EmptyList))

Good luck! -}

increment :: Integer -> Integer
increment x = x + 1

square :: Integer -> Integer
square x = x * x

-- Your definition of function polyMap goes here.
