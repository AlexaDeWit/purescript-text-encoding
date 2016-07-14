"use strict";

// `TextDecoder` is not available in `node`, use polyfill in that case
var TextDecoder =
  (typeof window === "object" && window.TextDecoder)
  || (typeof require === "function" && require("text-encoding").TextDecoder);

// Returns a `TextDecoder` with the specified `utfLabel` encoding.
exports._textDecoder = function (utfLabel) {
  return new TextDecoder(utfLabel);
};

// Decodes an `ArrayBufferView` via the given `Decoder`.
exports._decode = function (Left, Right, decoder, buffer) {
  var result;

  try {
    result = Right(decoder.decode(buffer));
  }
  catch (error) {
    result = Left(error);
  }

  return result;
};
