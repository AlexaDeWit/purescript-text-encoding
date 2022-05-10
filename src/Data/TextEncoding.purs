-- | Encode from `String` to `Uint8Array` with the JavaScript
-- | [__TextEncoder__](https://developer.mozilla.org/en-US/docs/Web/API/TextEncoder/encode)
-- | interface.
-- |
-- | #### `USVString` Caveat
-- |
-- | The input `String` is treated as a `USVString`, which is essentially
-- | an array of `CodeUnit`s. This means that if there are any characters
-- | in the `String` which are not in the
-- | [Basic Multilingual Plane](https://en.wikipedia.org/wiki/Plane_(Unicode)#Basic_Multilingual_Plane)
-- | then they will be encoded with the replacement character ‘�’ (`U+FFFD`).
-- |
-- | #### *Node.js* Caveat
-- |
-- | The runtime environment
-- | [*Node.js* only supports Utf8 Encoding](https://nodejs.org/docs/latest-v18.x/api/util.html#class-utiltextencoder).
module Data.TextEncoding
  ( Encoding(..)
  , encode
  , encodeUtf8
  ) where

import Data.ArrayBuffer.Types (Uint8Array)
import Data.Function.Uncurried (Fn2, runFn2)
import Prelude

-- | Encodes a `String` to a `Uint8Array` with the given `Encoding`.
encode :: Encoding -> String -> Uint8Array
encode encoding str = runFn2 _encode (show encoding) str

foreign import _encode :: Fn2 String String Uint8Array

-- | Encodes a `String` to a `Uint8Array` using UTF-8 encoding.
-- | This function is provided as a convenience as UTF-8 is the
-- | encoding you will probably be using most of the time.
encodeUtf8 :: String -> Uint8Array
encodeUtf8 = encode Utf8

-- | Possible character encodings.
-- | For further information see
-- | https://encoding.spec.whatwg.org/#names-and-labels
data Encoding
  = Utf8
  -- Legacy encodings
  | Utf_16Be
  | Utf_16Le

-- The show instance is used to convert an `Encoding` to a suitable
-- `utfLabel` string that is used in the internal `_encode` helper function.
instance showEncoding :: Show Encoding where
  show Utf8 = "utf-8"
  show Utf_16Be = "utf-16be"
  show Utf_16Le = "utf-16le"
