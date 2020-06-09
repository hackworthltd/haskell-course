module Lesson1 where

import Lib.Lesson1

{- Exercises for Lesson1: Types.

In Haskell, everything between {- and -} is a comment. We'll use the
comments to guide you through the exercises. Make sure you read every
comment carefully! -}

{- Exercise 1.1

Define a type for boolean values, i.e., "true" and "false." Complete
the Bool type definition below by replacing "Undefined" with values
that correspond to true and false.

Once you've defined the Bool type, you can check your work by pressing
the green "run" button and using the GHCi ":type" command.

Remember to indent the extra lines in the type definition!

Also, leave the "deriving (Show)" bit at the end so that GHCi can
display the values of your new type. -}

data Bool
  = Undefined
  deriving (Show)

{- In the following exercises about bindings, "undefined" is used in the
binding equations to indicate that the binding equation not yet
complete. In each case, your task is to replace "undefined" with an
appropriate value. -}

{- Exercise 1.2

Now let's bind the Haskell names true and false to their corresponding
values from the Bool type we defined in Exercise 1.1. The bindings
below already have the correct type (Bool); now complete the
equations.

Once you've completed these bindings, you can check your work by
pressing the green "run" button, and then typing the binding names in
GHCi to see the values they're bound to. -}

true :: Bool
true = undefined

false :: Bool
false = undefined

{- Exercise 1.3

Now suppose you're writing a Haskell program for a native French
speaker. In French, "vrai" means "true," and "faux" means "false."
Complete the bindings for these French names for the values that
belong to type Bool. -}

vrai :: Bool
vrai = undefined

faux :: Bool
faux = undefined

{- Exercise 1.4

For this exercise, put your answer here in the comment (in English).
You don't need to write any Haskell code in this exercise.

(Hint: you can use GHCi to check your answers for most of these
questions.)

1.4(a): What type does the value True belong to?

___Write your answer here.___

1.4(b): What is the type of the name true, as defined in Exercise 1.2?

___Write your answer here.___

1.4(c): What is the type of the name vrai, as defined in Exercise 1.3?

___etc.___

1.4(d): What type does the value False belong to?

1.4(e): What is the type of the name false, as defined in Exercise
1.2?

1.4(f): What is the type of the name faux, as defined in Exercise 1.3?

1.4(g): What is the type of the name theSunSetsInThe from Lesson1?

1.4(h): What is the value that's bound to the name theSunSetsInThe
from Lesson1?

1.4(i): What is the type of the name theSunRisesInthe from Lesson1?

1.4(h): What is the value that's bound to the name theSunRisesInThe
from Lesson1?

1.4(j): What would happen if you tried to write this binding in
Haskell?

south :: Direction
south = True

1.4(k): In Exercise 1.2, you bound a new name to the value True. What
is the difference between the value bound to the name true and the
value True that belongs to type Bool? -}

{- Exercise 1.5

1.5(a): Given the definition of type Bool from Exercise 1.1, and the
bindings true and vrai from Exercises 1.2 and 1.3, are the values of
True, true, and vrai equivalent in Haskell? Explain.

1.5(b): Given the definition of the type Bool, and the the bindings
false and faux, are the values of False, false, and faux equivalent in
Haskell? Explain.

1.5(c): Given the definition of the type Bool, and the bindings true
and vrai, are the values of False, true, and vrai equivalent in
Haskell? Explain.

1.5(d): Given the defintion of the type Bool, and the binding true,
does binding the name vrai to the value True change the value True?
Does it change the value bound to true? Explain. -}

{- Exercise 1.6

Define a Haskell type whose values represent the 4 seasons of the
year. Remember to indent the extra lines! And don't forget to add

  deriving (Show)

at the end of your new type definition, so that GHCi can display its
values. -}
