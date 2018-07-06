# purescript-text-encoding

[WHATWG/W3C Encoding Standard](https://encoding.spec.whatwg.org/)

## Installation

```
bower install purescript-encoding
```

This package relies on the `TextEncoder` and `TextDecoder` interfaces which are
not yet supported everywhere. If you want to use `purescript-encoding` in such
an environment, you will need to install a polyfill: `npm install
text-encoding`.

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-text-encoding).

## Notes on Purescript versions

This project is a continuation fork of the purescript-encoding package released by the user menelaos.

The first release for this package is v0.0.7 and supports purescript 0.12

For earlier purescript versions please see [the original upstream package](https://github.com/menelaos/purescript-encoding)
