# purescript-text-encoding

[WHATWG/W3C Encoding Standard](https://encoding.spec.whatwg.org/)

## Installation

```
spago install text-encoding
```

This package relies on the `TextEncoder` and `TextDecoder` interfaces which are
not yet supported everywhere. If you want to use `text-encoding` in such
an environment, you will need to install a polyfill: `yarn add text-encoding`.

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-text-encoding).

## Notes on Purescript versions

This project is a continuation fork of the purescript-encoding package released by the user menelaos.

The first release for this package is v0.0.7 and supports purescript 0.12

For earlier purescript versions please see [the original upstream package](https://github.com/menelaos/purescript-encoding)

## Version v1.0.0 Release

Going forward the v1.0.0 package line here will be reorganized in terms of the module names, 

as a previous version had a name conflict in package-sets

Going forward on the v1.0.0 branch, I would like to rely on the native node environment instead
