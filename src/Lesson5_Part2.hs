module Lesson5_Part2 where

import Lib.Lesson5_Part2

{- Here are the parameterised types for lists and trees again, for use
 in the remainder of these exercises.

The Tree type might look slightly different to the one you wrote in
Exercise 5.4, but the differences will be superficial: though the
names of the value constructors may differ, or even the order in which
they appear, they'll be functionally equivalent to the versions you
defined (assuming you defined it correctly in Exercise 5.4, that is!).

Also, note that we've started using different names for type
parameters here other than the usual "r" we've been using thus far.
Remember that the syntax for naming type parameters is identical to
the syntax for naming *function* parameters, and that so long as they
begin with a lower-case letter, you can name them whatever you like! -}

data List r
  = EmptyList
  | Element r (List r)
  deriving (Show)

data Tree s
  = Leaf s
  | Branch (Tree s) (Tree s)
  deriving (Show)

{- Exercise 5.6

You've probably noticed by now that writing lists and trees by hand is
a bit of a drag. But what are computers for, if not to automate
drudgery?

Write a function "list5" that creates a list from 5 elements, each of
parameterised type "r", where the value of each element is given as an
argument to the function. The elements should be ordered in the list
in the same order they appear as arguments to the function.

In other words, once you've successfully defined this function, this
expression:

list5 1 2 3 4 5

=> should evaluate to Element 1 (Element 2 (Element 3 (Element 4 (Element 5 EmptyList))))

and this expression:

list5 True False True False True

=> should evaluate to Element True (Element False (Element True (Element False (Element True EmptyList))))

The type signature for this function is provided for you. Note that
the type of each input value is "r", the same as the element type in
the List that the function will produce! -}

list5 :: forall r. r -> r -> r -> r -> r -> List r
list5 _ _ _ _ _ = undefined

{- Exercise 5.7

Now do something similar for trees, which are even more painful to
define by hand than lists! Write a function "tree3" that creates a
tree from 3 elements, each of parameterised type "s", where the value
of each element is given as an argument to the function.

Notice that with lists, there's a "natural" order that the elements
should appear in: we just stuff them into the list in the order they
appear as arguments, one after the other. However, with trees, there
are multiple ways to organize "n" elements in the tree (for some
number "n" > 0), due to the fact that trees have branches.

So to implement this function, we'll need to pick some particular
order in which the elements appear in the tree. We'll leave it up to
you to pick one. Whichever order you choose, draw a little tree
diagram in the comment below that represents, visually, the structure
of the tree that your tree3 function outputs.

(Note that, because our Tree type is parameterised, the elements of
the tree that you draw in the comment here could literally be *any
type*! For the sake of drawing this example diagram, assume it's a
Tree Integer.)

We've supplied neither the incomplete function definition here, nor
the type signature, so make sure you write both! -}

-- The defintion of function tree3 goes here.

{- Exercise 5.8

In Lesson 4, we worked out how to take the tail of a list (i.e. throw
away the first element, if any, and outputting the rest of the list).
However, it only worked for ListOfInteger. Generalise this to work on
any List. We've given you the type signature here to get started.

(Note that we've named the type parameter here "t". You might be
thinking that, because the definition of the parameterised List type
says that the parameter name is "r", shouldn't the type parameter here
also be named "r", to match what we wrote in the List definition? The
answer is: it doesn't matter. As long as you're consistent in the type
signature, and the name of the type parameter satisfies Haskell's
syntax for naming type parameters, you can choose any name you like.)

Test your tail function using a few example lists. Make use of your
nice new list5 function that you wrote in Exercise 5.6! For example:

tail EmpytList

=> should evaluate to EmptyList

tail (list5 1 2 3 4 5)

=> should evaluate to Element 2 (Element 3 (Element 4 (Element 5 EmptyList)))

-}

tail :: forall t. List t -> List t
tail _ = undefined

{- Exercise 5.9

For this exercise, you don't need to write any Haskell.

Given the tail function that you just implemented in Exercise 5.8,
what is the type of the expression:

tail EmptyList

(Are you at all surprised by the answer?)
-}

{- Exercise 5.10

In Lesson5 part2, we gave an example of a "reverse" function that can
reverse any list. However, in order to do so, it used an "append"
function, whose definition was not provided in the lesson.

Write a polymorphic append function. Given two lists, it should
combine them into one which contains all the elements of the first
list (in the same order as the original), followed by all the elements
of the second.

For example:

append EmptyList (list5 1 2 3 4 5)

=> should evaluate to Element 1 (Element 2 (Element 3 (Element 4 (Element 5 EmptyList))))

append (list5 True False False False True) EmtpyList

=> should evaluate to Element True (Element False (Element False (Element False (Element True EmptyList))))

append (list5 1 2 3 4 5) (list5 6 7 8 9 10)

=> should evaluate to Element 1 (Element 2 (Element 3 (Element 4 (Element 5 (Element 6 (Element 7 (Element 8 (Element 9 (Element 10 EmptyList)))))))))

-}

append :: forall r. List r -> List r -> List r
append _ _ = undefined

{- Exercise 5.11

For this exercise, you don't need to write any Haskell.

Given the new append function you've just written in Exercise 5.10,
does the following expression make any sense? Explain:

append (list5 1 2 3 4 5) (list5 True False False True False)

-}

{- This bit isn't an exercise, it's just for playing around with your
new append function, and seeing an example of how we can use
abstraction to build programs -- in this case, creating one function
that helps us implement another function more simply.

Here's that reverse function from the lesson. Once you've implemented
append per Exercise 5.10, this reverse function should work as
described. Test it out for yourself on a few lists. For example, the
expression:

reverse (list5 1 2 3 4 5)

=> should evaluate to Element 5 (Element 4 (Element 3 (Element 2 (Element 1 EmptyList))))

-}

reverse :: forall r. List r -> List r
reverse EmptyList = EmptyList
reverse (Element x l) = append (reverse l) (Element x EmptyList)

{- Exercise 5.12

Let's double a list.

What does "doubling a list" mean? Here are two possible interpretations:

  - duplicate each element in place, taking a list of integers 1,2,3
    to 1,1,2,2,3,3

  - duplicate the entire list, taking a list of integers 1,2,3 to
    1,2,3,1,2,3

For this exercise, implement these two methods for doubling a list.
The incomplete function definitions for each are given below. (If you
can think of more ways to double lists, feel free to write those, as
well.)

Don't forget to test your functions! -}

doubleInPlace :: forall r. List r -> List r
doubleInPlace _ = undefined

-- A hint for this version: can we have a very short definition for
-- this function by using another function we've previously defined?
doubleEntire :: forall r. List r -> List r
doubleEntire _ = undefined

{- Exercise 5.13

Exercise 4.11 asked you to write a function that would "flatten" a
tree to a list. Let's do that again, only this time for our new
parameterised Tree type.

Complete the following function to flatten a Tree r into a List r, for
all types r. The first element in the list should be the leftmost
element in the tree, and the last element in the list should be the
rightmost element in the tree.

For example, the tree

Branch (Branch (Leaf 1) (Leaf 3)) (Leaf 2)

          /\
         /  \
        / \  2
       /   \
      1     3

should flatten to the list 1,3,2:

Element 1 (Element 3 (Element 2 EmptyList))

You'll need to write both the type signature and the function
equations for this exercise.

When implementing the flattenTree function, feel free to use any
functions you've already defined in this lesson, of course!

As usual, don't forget to test your function! -}

-- Your definition of function flattenTree goes here.

{- Exercise 5.14

Think back to Exercise 5.2, where you defined two functions,
toListOfInteger and toListInteger, that converted values of our old
ListOfInteger type to our new List Integer type, and vice versa.

Now implement similar functions for our old ListOfBool type and our
new List Bool type.

A variant of our old ListOfBool type is given below, so that you don't
have to re-do it yourself. -}

data ListOfBool
  = EmptyListOfBool
  | BoolElement Bool ListOfBool
  deriving (Show)

-- Your definitions of functions toListOfBool and toListBool go here.

{- Exercise 5.15

For this exercise, you don't need to write any Haskell.

A co-worker has just learned about polymorphic functions, too, and
sees that you've now written two pairs of nearly-identical functions:
one pair of functions for converting back-and-forth between List
Integer and ListOfInteger; and one pair of functions for convering
back-and-forth between List Bool and ListOfBool.

Your co-worker says:

"Those functions are of limited use, because they only work with
specialized list types `List Bool` and `List Integer`. I just learned
about this thing called 'polymorphism', and you can use it to make
your code work with any type of List! You should consider rewriting
your functions so that they'll work with any type of list, too. I
think the type signatures would look something like this:

listToListOfBool :: forall r . List r -> ListOfBool
listToListOfInteger :: forall r . List r -> ListOfInteger

listOfBoolToList :: forall r . ListOfBool -> List r
listOfIntegerToList :: forall r . ListOfInteger -> List r

"

How would you respond?

-}

{- Exercise 5.16

Below is the incomplete definition of a seemingly silly function, with
a silly name. Can you complete the definition so that it's a valid
Haskell function, with no more information than we've already given
you?

Hint: start by asking yourself, first, "what is the type of the input
value for this function, and what do I know about it?". Then ask,
"What is the type of the output value for this function, and what do I
know about it?" Then work it out from there.

Hint 2: if you get a function that Haskell accepts, but it seems like
a rather pointless function, then you've almost certainly implemented
it correctly! -}

foo :: forall r. r -> r
foo _ = undefined

{- Exercise 5.17

For this exercise, you don't need to write any Haskell.

Are there any other ways to implement function "foo" from the previous
exercise, other than the implementation you've written? Explain.

-}

{- The parameterised type from the lesson for making pairs of values of
 type "r" and "s" is given below. -}

data Pair r s
  = MkPair r s

{- Exercise 5.18

Your colleague asks you to write a function "pairMax" that, given a
Pair r s for any type r and any type s, will output the larger value
of the two, just like the monomorphic "max" function that we wrote in
Exercise 4.15 did for values of type Integer.

Can you write this pairMax function? If so, do so below. If not,
explain why.

-}

{- Exercise 5.19

In Exercise 4.2, you wrote a function named "head", which outputs the
first element of a ListOfInteger, or a default value (provided by the
caller of the function) if the list is empty. This seems like a useful
function for any type, not just lists of Integer, so let's define it
polymorphically for our parameterised List type.

Write the polymorphic version of this function. Like its monomorphic
version, it should also take a default value to be used when the list
is empty.

You'll need to write the type signature for this function, as well as
the equations!

Make sure to test your function using both the EmptyList value
constructor for parametric List r, and also the nice list5 function
you wrote earlier, using at least 2 different types of list (e.g.,
List Bool and List Integer).
-}

-- Your definition of function head goes here.

{- Exercise 5.20

The "head" function you just wrote is kind of unwieldy, because the
user of the function always has to provide a default value, and they
might want to use that default value in a list. For example, if you
write, for List Integer:

head 0 x

where x's value is EmptyList, you'll get back 0. But also, if you
write:

head 0 x

where x's value is (Element 0 EmptyList), you'll *also* get back 0.

The problem, therefore, is that if "head" outputs the default value,
how can you be sure whether you're actually getting the head element
of the list, or the list is empty? There's no convenient way to tell!
If you need to know the difference, essentially the only way to know
is to check the output value of the "head" function and, if it's equal
to the default value, then do an extra check to see if the list is
empty.

One alternative is to tell Haskell to "crash the program" when you ask
for the head of an empty list. You can write that in Haskell like
this, using the very special (and very exceptional) function called
"error", which takes as an argument a message to display to the user
when their program crashes;

headCrash :: forall r . List r -> r
headCrash EmptyList = error "Whoops"
headCrash (Element x _) = ... -- this bit is the same as Exercise 5.18

This is very lazy programming, and puts almost all the burden on your
poor users. If you, the programmer, make a mistake and ask for the
head of an empty list, the user's program will crash, possibly taking
all the work they've done up to that point with it, or even worse.
(Imagine doing this in a program that helps keep an airplane flying!)

So we'd like a better way to write a polymorphic "head" function than
the two ways we've explored so far.

This is precisley the sort of scenario that our parametric Maybe type
is for (recall that you defined this type in Exercise 5.5). A Maybe
type is meant to represent the output of computations where maybe
there's a valid answer, and maybe there isn't.

Write a new function called "maybeHead" which takes as input a list of
type List r, for any type r, and uses the Maybe type to output a) a
value indicating that something went wrong, if the list is empty, or
b) a value that contains the head element of the list, if the list is
not empty.

Note that there's no need for an extra "default value" argument to
this function! If the list is empty, the Maybe type is sufficient to
indicate that without needing the "hack" of outputting a default value
of the input list's element type. Your maybeHead function only needs
an input of one type, namely parametric List r, for all types r.

The real trick to writing this function is figuring out the type
signature, so we'll leave that to you in this exercise. However, we
have supplied a parametric Maybe type below. (As with the Tree
definition we provided earlier, this Maybe type might look slightly
different than the one you defined in Exercise 5.5, depending on what
names you chose for the value constructors, but the semantics of the
two types will be the same.)

As always, make sure to test your function using both the EmptyList
value constructor for parametric List r, and also the nice list5
function you wrote earlier, using at least 2 different types of list
(e.g., List Bool and List Integer). -}

data Maybe t
  = Nothing
  | Just t
  deriving (Show)

-- Your definition of function maybeHead goes here.

{- Exercise 5.21

Sometimes we want to make lists that we, the programmer, *know* will
never by empty. In fact, we're so sure that our list values will never
be empty, that if we ever did somehow encounter an empty list in our
program, it would be a sign that something had seriously gone wrong.

In cases like this, if we want to stick with the standard
parameterised List r type that *can* represent empty lists, we really
only have two choices when we want to write a function that
pattern-matches on a `List ` valuer. Either we:

a) wrap our output value in a Maybe, and handle the EmptyList case as
a failed computation; or

b) do the `error` thing we described above, where we tell the program
to just immediately exit.

As we discussed above, we almost always try to avoid scenario b),
because when our program crashes, this means that the user pays the
price. But when we're sure that we'll never have an empty list, we're
*so certain* about it that we might actually be willing to crash the
program anyway, because it's (probably) not our fault, and perhaps
it's actually the user's computer that has a problem, and we can't do
anything to help them in this scenario, anyway.

On the other hand, if we do the responsible thing and handle the
EmptyList case in our program with a Maybe type, then this puts an
unnecessary burden on *us*, because again, we are *certain* that we
will never create empty lists. Dealing with values of type Maybe r
(for all types r) is a lot more complicated and burdensome than
dealing with values of just plain type r, so if we choose this
scenario, we end up writing a bunch of extra code to deal with a case
that should *never happen*. That, also, is not ideal.

What we'd really like is some way to guarantee that we cannot create
an empty list. The parameterised List type is too general for these
cases, because, even if you promise never to use its EmptyList
constructor, Haskell is unfortunately not smart enough to guarantee
that you (or someone else who uses bits of your program to write their
own programs) will never actually use it.

Basically what we're saying is, our parameterised List type is not a
good fit for this problem. But if you've learned nothing else in this
course, we hope you've learned that Haskell is really good for writing
custom types. So why not try to fix the problem ourselves by writing a
new list type that cannot be empty?

That's your task for this exercise: define a new type of paramterised
list named NonEmptyList that allows you to construct list values, but
only list values that have *at least one element*. Of course, this
list type should also support lists of many elements, as well!
Otherwise, it wouldn't be a proper list type!

Write your parameterised NonEmptyList type below. Be sure to add the
"deriving (Show)" magic at the end, so that Haskell can display values
of your new type.

Think carefully about the number of value constructors you'll need to
implement this type. As it's a list type, it will certainly need to be
a recursive, for starters. -}

data NonEmptyList r
  = Singleton r
  | NonEmptyListElement r (NonEmptyList r)
  deriving (Show)

{- Exercise 5.22

For this exercise, you don't need to write any code.

One of the drawbacks of writing a new list type like the NonEmptyList
type we defined in the previous exercise is that all of the nice code
we've written for our parametric List r type won't work with our new
NonEmptyList type! For example, the length function we wrote for `List
r` doesn't work with `NonEmptyList r`:

length :: forall r . List r -> Integer
length EmptyList = 0
length (Element _ l) = 1 + (length l)

Could you write a different polymorphic length function that works for
any type of list? In other words, a length function that works for
List r, or NonEmptyList r, or even other types of lists that we
haven't yet thought of? If so, write that length function below.
Otherwise, explain why not.

-}

{-Exercise 5.23

One nice thing about our parametric NonEmptyList type is that its
"head" function is really easy now! Because our lists of this type
always have at least one element, every list of this type has a head,
and we don't need to worry about error cases anymore.

To show why, define a function named "nonEmptyListHead" that takes a
value of type `NonEmptyList r`, for all types r, and outputs the input
list's head.

Note that the output type of this function should be `r` (or `s` or
`t` or whatever name you give to the type parameter for the list's
element type). You won't need to wrap it with the Maybe type. -}

{-Exercise 5.24

Now write the "tail" function for our new parametric NonEmptyList
type. You can choose whatever function name and type signature you
think is best.

-}
