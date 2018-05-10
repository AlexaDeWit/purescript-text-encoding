module Test.Main where

import Prelude
import Effect        (Effect)
import Test.Encoding (testEncoding)

main :: Effect Unit
main = do
  testEncoding
