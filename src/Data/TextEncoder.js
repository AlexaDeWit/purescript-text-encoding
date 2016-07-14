"use strict";

// `TextEncoder` is not available in `node`, use polyfill in that case
var TextEncoder =
  (typeof window === "object" && window.TextEncoder)
  || (typeof require === "function" && require("text-encoding").TextEncoder);

// Returns a `TextEncoder` with the specified `utfLabel` encoding.
exports._textEncoder = function (utfLabel) {
  return new TextEncoder(utfLabel);
};

// Encodes a `DOMString` via the given `TextEncoder`
exports._encode = function (encoder, str) {
  return encoder.encode(str);
};
