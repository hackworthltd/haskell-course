module Lesson1 where

import Lib.Lesson1

{- Exercises for Lesson1: Types.

In Haskell, everything between {- and -} is a comment. We'll use the
comments to guide you through the exercises. Make sure you read every
comment carefully.

In the following exercises, "undefined" is used to indicate that the
function or type is not yet defined. In each case, your task is to
complete the definition.

-}

{- Exercise 1.1

We can use Haskell's support for user-defined data types to define a
boolean type for values that are either "true" or "false." Complete
the Bool data type definition by replacing "Undefined" with data
constructors for true and false, like we did for the Direction data
type in the Lesson1 lecture.

Once you've defined the Bool type, you can check your work by pressing
the green "run" button and using the GHCi ":type" command.

Remember to indent the extra lines in the type definition! -}

data Bool = Undefined

{- Exercise 1.2

Sometimes it's useful to create alternative names for particular
values. In Haskell, we can do this by writing an equation that binds a
new name to a value that was already defined elsewhere.

Complete the definitions for these convenient names for the values
created by Bool's data constructors.

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
Complete the definitions for these French names for Bool's data
constructors. -}

vrai :: Bool
vrai = undefined

faux :: Bool
faux = undefined

{- Exercise 1.4

For this exercise, answer by adding your answer (in English) to the
corresponding comment. You don't need to write any Haskell code in
this exercise.

(Hint: use GHCi to check your answers.)

1.4(a): What is the type of the value True as defined in Exercise 1.1?

___Write your answer here.___

1.4(b): What is the type of the value true as defined in Exercise 1.2?

___Write your answer here.___

1.4(c): What is the type of the value vrai as defined in Exercise 1.3?

___etc.___

1.4(d): What is the type of the value False as defined in Exercise 1.1?

1.4(e): What is the type of the value false as defined in Exercise 1.2?

1.4(f): What is the type of the value faux as defined in Exercise 1.3?

1.4(g): What is the type of the value theSkyIs (from the Lesson1
lecture)?

1.4(h): What is the type of the value Up from the Lesson1 lecture?

1.4(i): What would happen if you tried to write:

down :: Bool
down = Down

1.4(j): In Exercise 1.2 above, you created a new name for the value
created by the data constructor True. What is the difference between
the value with the name "true" and the value created by the data
constructor True?

-}

{- Exercise 1.5

1.5(a): Given the definitions above of the data type Bool, and the
values true and vrai, are the values True, true, and vrai equivalent
in Haskell? Explain.

1.5(b): Given the definitions above of the data type Bool, and the
values false and faux, are the values False, false, and faux
equivalent in Haskell? Explain.

1.5(c): Given the definitions above of the data type Bool, and the
values true and vrai, are the values False, true, and vrai equivalent
in Haskell? Explain.

1.5(d): Given the defintions above of the data type Bool, and the name
true, does binding the name true to the value True change the value
True? Explain.

-}

{- Exercise 1.6

Define a Haskell data type whose values represent the 4 seasons of the
year. Remember to indent the extra lines! -}
