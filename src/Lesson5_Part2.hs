{-# LANGUAGE ExplicitForAll, NoImplicitPrelude #-}
module Lesson5_Part2 where

import Lib.Lesson5_Part2

{- Exercise 5.11
As mentioned in the lesson, all elements of a list must have the same type.
Usually this is what we want, but sometimes we do want to have values of
different types in a list. Luckily it is rare to want elements of literally any
type, and Haskell makes it easy to define a type that wraps a choice.

Part a: define a polymorphic type `Either` with two parameters `r` and `s`.  It
should have two constructors: one containing an `r`; the other containing an
`s`.
-}
data Either r s
  = Undefined

{-
Part b: define a list containing (in some appropriate sense) 17, True, False, 42, 3
-}

{-
Part c:
Given a list of integers and another list, combine them into one list
containing all the integers first and all the other values second.
Hint: create two helpers to wrap each list in Either individually, then call
a function to combine the two wrapped lists.
-}
combine :: forall r . List Integer -> List r -> List (Either Integer r)
combine = undefined

{-
Part d:
Given a list of (Either r s), partition it into two lists, one of `r`s, one of `s`s

Hint: how is the `partition (Element x l)` related to `partition l` and `x`?
Can you write helper functions to bottle this pattern?
-}
data Pair r s
  = MkPair r s

partition :: forall r s . List (Either r s) -> Pair (List r) (List s)
partition = undefined


{- Exercise 5.12
The rest of the exercises are building up to the idea of parsing and validating
some user input.  To set the scene, imagine we have a web form (for, say
signing up for an account) which requires a name, an age, an email address and a
list of numbers (let's say lottery numbers). We have been asked to write a
function that takes the user's input (as strings), and processes it into a
nice-to-use format.  However, we should ensure that the input is valid (the
user is old enough, the email address looks sane, and the interests are ones
from the list of options).

Before we jump into it, we will build some useful tools!

To start with, let us generalise the ifThenElse functions we have seen to work
for any type. (Bonus question: why do we ask for both the "then" case and the
"else" case to be of the same type?)
-}

ifThenElse :: forall r . Bool -> r -> r -> r
ifThenElse = undefined

{- Exercise 5.13
We will need to parse numbers, i.e. change the string "123" into the number
123. As a first step, let's parse one digit: we convert the character '0' into
the Integer 0, and similarly up to '9' and 9. However, we need to return
something for other characters. We could return some magic number that means
failure, but it is much nicer to return a Maybe - that way it is clear that
this function may have a "failure case", and the compiler will ensure we deal
with it.

Use pattern matching (or fancy ascii-tricks if you wish: lookup `chr` and
`ord`) to implement the below function

`Maybe` is like `MaybeMonth` from exercise set 3, but polymorphic.
This type has one parameter (let's call it `r`), and two constructors:
 - The first constructor is called Nothing, and it takes no arguments.
   This will represent failure, i.e. the input was invalid.
 - The second constructor is called Just, and it takes one argument, of type
   `r`. This represents success (i.e. the input was valid).

We reproduce the definition in a comment here
data Maybe r
  = Nothing
  | Just r

-}

readDigit :: Char -> Maybe Integer
readDigit = undefined

{- Exercise 5.14
Let's get comfortable with combining Maybes. Unfortunately we cannot yet do
this generally enough to be reusable nicely, but we will see that next lesson.

Complete the following definition. This takes two things which may have
failed, and produces a pair if possible, but may fail. In particular,
maybeBoth (Just True) (Just 2) == maybeBoth (Just (MkPair True 2))

What we would really like to do is also be able to specify how to combine the
things, rather than just making a pair.  However, doing this nicely requires
higher order functions.
-}
maybeBoth :: forall r s . Maybe r -> Maybe s -> Maybe (Pair r s)
maybeBoth = undefined


{- Exercise 5.15
Let's use readDigit to read an entire number (i.e. non-negative integer).
Recall that `String`s are just `List Char`s and implement readInt
Hints:
 - it turns out to be be easier to write this considering the digits in reverse
   order (you may want to have a helper function 'readReversedInt')
 - if 'reverse' is not in scope, go back to exercise 5.5
 - how does the result of readInt "123" relate to readInt "12" and 3?
 - you are going to need to combine two Maybe Integer into one Maybe Integer
   following the above this can be done by pattern matching in a helper
   function.
-}
readInt :: String -> Maybe Integer
readInt = undefined

{- Exercise 5.16
There are multiple strategies for doing the validation and parsing. One would
be to do them seperately and have one function that parses, and returns a
(value of a) nice data type, and a different function that takes this output
and returns a boolean - whether it is valid or not.

However, it is rather easy to mess up and not check the validity before further
processing, which could lead to horrible bugs elsewhere (imagine we store
invalid data in a database somewhere; two years later someone else is using
this database for something else and just assumes that all records are
valid...).

Instead, let's take an integrated approach: we will do it all in one step,
returing a Maybe.

The user's input is given via a value of type Input, shown below.
(NB: a String is just a List of Char)

Define a type that represents the output. This should have one constructor
wrapping 4 fields:
 - a name of type Name
 - an age of type Integer
 - an email of type String
 - some lottery numbers of type List Integer.
This will require defining two auxillary types: Name (one constructor, wrapping two String fields: first and last name)

Note: to keep the exercise simple we will
 - do no validation on names (name validation is hard! Even assuming "first-name, last-name" is not really a good idea...)
 - check the age is between 18 and 150
 - do simple checking of the email: it should look something like abc.def-hi.j@foo.bar.baz
   (we'll specify more formal rules later. Again, email validation is hard, but this makes a nice exercise!)
 - check the numbers are between 1 and 60, but we won't care how many there are.
-}

data Input
  = Input String String String String (List String)
-- The 4 strings represent first-name, last-name, age and email address
-- The List String represents the interests

data Name
  = NameIsAsYetUndefined

data Output
  = OutputIsAsYetUndefined

{- Exercise 5.17
Of course, we don't want to write one big function to parse-and-validate, we
want to split it up into multiple bits, one for each field.  Thankfully, there
is a clear correspondence between input fields and output fields, so this
splitting is easy!

Part a: Create a function to "validate" names (recall, we don't actually do any
validation, so this should be a trivial function)
-}
validateName :: String -> String -> Maybe Name
validateName firstName lastName = undefined

{-
Part b: create a function to validate ages.
Hint: use readInt to convert from a string to an Maybe Integer,
 and write a utility function to ensure a Maybe Integer is in some range
 using (<=) to compare two integers and (&&) for 'and' on booleans.
-}

{-
Part c: create a function to validate the email.
To keep it simple, let's just enforce:
- The address has two bits, seperated by an @
- Each bit is made up of characters satisfying a provided isValidEmailChar :: Char -> Bool
- The rhs has at least one '.' in it

This is a tough exercise, but is independent of the rest of the exercises in
this file. Don't spend too much time on it at the expense of later exercises -
feel free to stub out it with
validateEmail :: String -> Maybe String
validateEmail s = Just s
-}
validateEmail :: String -> Maybe String
validateEmail = undefined


{- Exercise 5.18
Now let's validate lottery numbers.

Part a:
We already know how to parse an age, i.e. an integer which must be at least 18,
so we should be able to reuse some of those functions to parse a number between
1 and 60.

Write a function to parse one individual lottery number.


Part b:
Now use the function from part a to parse each of a list of strings into numbers
-}

parseEachNumber :: List String -> List (Maybe Integer)
parseEachNumber = undefined

{-
Part c:
It is not very helpful to have a list of numbers, each of which may have failed
to parse. We want a Maybe (List Integer): a whole list of numbers, where the
list as a whole may have failed to parse. Write a function invertListMaybe to
do this transformation.

Hints:
- Write this function polymorphically, rather than just for Integer. This both
  makes it more reusable, and makes it easier to write since we are not
  distracted by the details of Integers.
- This is similar to readInt: how does the result of invertListMaybe (Element x l)
  relate to x and invertListMaybe l ?
- You will want another helper function to combine Maybes (Yes, this is
  repetitive, but we will do it better next lesson!)


Part d:
Plumb things together to create
-}
validateLotteryNumbers :: List String -> Maybe (List Integer)
validateLotteryNumbers = undefined


{- Exercise 5.19
Tie everything together to create our required validation function
-}
validate :: Input -> Maybe Output
validate = undefined
