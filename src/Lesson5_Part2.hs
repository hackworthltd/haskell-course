{-# LANGUAGE ExplicitForAll #-}
module Lesson5_Part2 where

import Lesson5_Part1
import Prelude (Integer, undefined)

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
