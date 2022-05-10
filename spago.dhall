{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "text-encoding"
, dependencies =
    [ "arraybuffer-types"
    , "either"
    , "exceptions"
    , "functions"
    , "prelude"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", ]
, license = "Apache 2.0"
, repository = "https://github.com/AlexaDeWit/purescript-text-encoding.git"
}
