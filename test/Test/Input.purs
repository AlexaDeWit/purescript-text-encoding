module Test.Input where

import Data.Array (filter)
import Data.CodePoint.Unicode (isPrint)
import Data.String (codePointFromChar)
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Prelude ((<$>), ($), (<<<))
import Test.QuickCheck.Arbitrary (class Arbitrary, arbitrary)


-- The TextDecoder interface uses `USVString`, not UTF-16
-- https://stackoverflow.com/questions/66298005/textencoder-textdecoder-not-round-tripping
-- which means that there are a lot of `String`s which will be
-- incorrectly encoded.
--
-- When UTF8-encoding a string, surrogate code points and other non-characters
-- are simply replaced by the replacement character � (U+FFFD).
-- This entails that the `encodeUtf8` function is not injective anymore and
-- thus the desired property `decodeUtf8 <<< encodeUtf8 == id` does not hold
-- in general.
--
-- For well-formed input strings, however, we can expect the property to hold.

-- Use a newtype in order to define an `Arbitrary` instance.
newtype WellFormedInput = WellFormedInput String

-- The `Arbitrary` instance for `String` currently simply chooses characters
-- out of the first 65536 unicode code points.
-- See `arbChar` in `purescript-quickcheck`.
instance arbWellFormedInput :: Arbitrary WellFormedInput where
  arbitrary =
    WellFormedInput <<< filterString (isPrint <<< codePointFromChar) <$> arbitrary

filterString :: (Char -> Boolean) -> String -> String
filterString f s = fromCharArray <<< filter f $ toCharArray s
