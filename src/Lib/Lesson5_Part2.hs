module Lib.Lesson5_Part2
  ( module Lesson5_Part1
  , module Prelude
  , chr, ord
  , String
  , isValidEmailChar
  ) where

import Lesson5_Part1 hiding (Bool(..))
import Prelude (Maybe(Just,Nothing), Integer, Char, Bool, (&&), (||), undefined)
import Data.Char
import qualified Prelude as P
import Text.Read (readMaybe)
type String = List Char -- This line just says String is an abbreviation for List Char

-- This is not sensible for real-world applications, but is fine for an exercise
isValidEmailChar :: Char -> Bool
isValidEmailChar c = isAscii c && (isAlphaNum c || c `P.elem` ".-+")
