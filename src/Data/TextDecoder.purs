module Data.TextDecoder
  ( Encoding (..)
  , TextDecoder
  , decode
  , decodeUtf8
  , textDecoder
  )
where

import Control.Monad.Eff.Exception (Error)
import Data.ArrayBuffer.Types      (ArrayView)
import Data.Either                 (Either (Left, Right))
import Data.Function.Uncurried     (Fn4, runFn4)
import Prelude


{-
  ===============
    TextDecoder
  ===============
-}

-- | For further information see
-- | https://developer.mozilla.org/en-US/docs/Web/API/TextDecoder
foreign import data TextDecoder :: *

-- | Decodes an `ArrayBufferView` via a `TextDecoder`.
-- | Returns an `Error` if decoding fails.
-- |
-- | Example:
-- | ```purescript
-- | decode utf8Decoder TODO
-- | ```
decode :: ∀ a. TextDecoder -> (ArrayView a) -> Either Error String
decode txtDec buffer = runFn4 _decode Left Right txtDec buffer

-- | Decodes a UTF-8 encoded typed array to a (UTF-16) `String`.
-- | Returns an `Error` if decoding fails.
-- | This function is provided as a convenience as UTF-8 is the
-- | encoding you will probably be using most of the time.
decodeUtf8 :: ∀ a. (ArrayView a) -> Either Error String
decodeUtf8 = decode (textDecoder Utf8)

-- Internal helper function.
foreign import _decode ::
  ∀ a. Fn4
    (∀ x y. x -> Either x y)
    (∀ x y. y -> Either x y)
    TextDecoder
    (ArrayView a)
    (Either Error String)

-- | Create a `TextDecoder`.
-- |
-- | Example:
-- | ```purescript
-- | utf8Decoder = textDecoder Utf8
-- | ```
textDecoder :: Encoding -> TextDecoder
textDecoder = _textDecoder <<< toUtfLabel

-- Internal helper function.
foreign import _textDecoder :: String -> TextDecoder


{-
  =======================
    Character Encodings
  =======================
-}

-- | Possible character encodings.
-- | For further information see
-- | https://encoding.spec.whatwg.org/#names-and-labels
data Encoding
  = Utf8

  -- Legacy single-byte encodings
  | Ibm866
  | Iso_8859_2
  | Iso_8859_3
  | Iso_8859_4
  | Iso_8859_5
  | Iso_8859_6
  | Iso_8859_7
  | Iso_8859_8
  | Iso_8859_8_I
  | Iso_8859_10
  | Iso_8859_13
  | Iso_8859_14
  | Iso_8859_15
  | Iso_8859_16
  | Koi8_R
  | Koi8_U
  | Macintosh
  | Windows_874
  | Windows_1250
  | Windows_1251
  | Windows_1252
  | Windows_1253
  | Windows_1254
  | Windows_1255
  | Windows_1256
  | Windows_1257
  | Windows_1258
  | X_Mac_Cyrillic

  -- Legacy multi-byte Chinese (simplified) encodings
  | Gbk
  | Gb18030

  -- Legacy multi-byte Chinese (traditional) encodings
  | Big5

  -- Legacy multi-byte Japanese encodings
  | Euc_Jp
  | Iso_2022_Jp
  | Shift_Jis

  -- Legacy multi-byte Korean encodings
  | Euc_Kr

  -- Legacy miscellaneous encodings
  | Replacement
  | Utf_16Be
  | Utf_16Le
  | X_User_Defined

instance showEncoding :: Show Encoding where
  show = toUtfLabel

-- Converts an `Encoding` to a `String` (`utfLabel`) that can be passed
-- to a `TextDecoder`.
toUtfLabel :: Encoding -> String
toUtfLabel Utf8           = "utf-8"
toUtfLabel Ibm866         = "ibm866"
toUtfLabel Iso_8859_2     = "iso-8859-2"
toUtfLabel Iso_8859_3     = "iso-8859-3"
toUtfLabel Iso_8859_4     = "iso-8859-4"
toUtfLabel Iso_8859_5     = "iso-8859-5"
toUtfLabel Iso_8859_6     = "iso-8859-6"
toUtfLabel Iso_8859_7     = "iso-8859-8"
toUtfLabel Iso_8859_8     = "iso-8859-8"
toUtfLabel Iso_8859_8_I   = "iso-8859-8-i"
toUtfLabel Iso_8859_10    = "iso-8859-10"
toUtfLabel Iso_8859_13    = "iso-8859-13"
toUtfLabel Iso_8859_14    = "iso-8859-14"
toUtfLabel Iso_8859_15    = "iso-8859-15"
toUtfLabel Iso_8859_16    = "iso-8859-16"
toUtfLabel Koi8_R         = "koi8-r"
toUtfLabel Koi8_U         = "koi8-u"
toUtfLabel Macintosh      = "macintosh"
toUtfLabel Windows_874    = "windows-874"
toUtfLabel Windows_1250   = "windows-1250"
toUtfLabel Windows_1251   = "windows-1251"
toUtfLabel Windows_1252   = "windows-1252"
toUtfLabel Windows_1253   = "windows-1253"
toUtfLabel Windows_1254   = "windows-1254"
toUtfLabel Windows_1255   = "windows-1255"
toUtfLabel Windows_1256   = "windows-1256"
toUtfLabel Windows_1257   = "windows-1257"
toUtfLabel Windows_1258   = "windows-1258"
toUtfLabel X_Mac_Cyrillic = "x-max-cyrillic"
toUtfLabel Gbk            = "gbk"
toUtfLabel Gb18030        = "gb18030"
toUtfLabel Big5           = "big5"
toUtfLabel Euc_Jp         = "euc-jp"
toUtfLabel Iso_2022_Jp    = "iso-2022-jp"
toUtfLabel Shift_Jis      = "shift-jis"
toUtfLabel Euc_Kr         = "euc-kr"
toUtfLabel Replacement    = "iso-2022-kr"
toUtfLabel Utf_16Be       = "utf-16be"
toUtfLabel Utf_16Le       = "utf-16le"
toUtfLabel X_User_Defined = "x-user-defined"
