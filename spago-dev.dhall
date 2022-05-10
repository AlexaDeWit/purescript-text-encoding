-- Spago configuration for testing, benchmarking, development.
--
-- See:
-- * ./CONTRIBUTING.md
-- * https://github.com/purescript/spago#devdependencies-testdependencies-or-in-general-a-situation-with-many-configurations
--

let conf = ./spago.dhall

in

conf //
{ sources = [ "src/**/*.purs", "test/**/*.purs", ]
, dependencies = conf.dependencies #
	[ "quickcheck"
	, "console"
	, "effect"
	, "psci-support"
	, "strings"
	, "unicode"
	, "arrays"
  ]
}