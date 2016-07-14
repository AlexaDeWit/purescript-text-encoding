module Data.TextEncoder
  ( Encoding (..)
  , TextEncoder
  , encode
  , encodeUtf8
  , textEncoder
  )
where

import Data.ArrayBuffer.Types  (Uint8Array)
import Data.Function.Uncurried (Fn2, runFn2)
import Prelude


{-
  ===============
    TextEncoder
  ===============
-}

-- | For further information see
-- | https://developer.mozilla.org/en-US/docs/Web/API/TextEncoder
foreign import data TextEncoder :: *

-- | Encodes a `String` to a `Uint8Array` via the given `TextEncoder`.
encode :: TextEncoder -> String -> Uint8Array
encode txtEnc str = runFn2 _encode txtEnc str

-- | Encodes a `String` to a `Uint8Array` using UTF-8 encoding.
-- | This function is provided as a convenience as UTF-8 is the
-- | encoding you will probably be using most of the time.
encodeUtf8 :: String -> Uint8Array
encodeUtf8 = encode (textEncoder Utf8)

-- Internal helper function.
foreign import _encode :: Fn2 TextEncoder String Uint8Array

-- | Create a `TextEncoder`.
-- |
-- | Example:
-- | ```purescript
-- | utf8Encoder = textEncoder Utf8
-- | ```
textEncoder :: Encoding -> TextEncoder
textEncoder = _textEncoder <<< toUtfLabel

-- Internal helper function.
foreign import _textEncoder :: String -> TextEncoder


{-
  =======================
    Character Encodings
  =======================
-}

-- | Possible character encodings for `TextEncoder`.
-- | For further information see
-- | https://encoding.spec.whatwg.org/#names-and-labels
data Encoding
  = Utf8

  -- Legacy encodings
  | Utf_16Be
  | Utf_16Le

instance showEncoding :: Show Encoding where
  show = toUtfLabel

-- Converts an `Encoding` to a `String` (`utfLabel`) that is used to
-- create a `TextEncoder`.
toUtfLabel :: Encoding -> String
toUtfLabel Utf8     = "utf-8"
toUtfLabel Utf_16Be = "utf-16be"
toUtfLabel Utf_16Le = "utf-16le"
