"use strict";

// `TextDecoder` is not available in `node`, use polyfill in that case
var TextDecoder =
  (typeof window === "object" && window.TextDecoder)
  || (typeof require === "function" && require("text-encoding").TextDecoder);

exports._decode = function (Left, Right, utfLabel, buffer) {
  var result;
  var decoder = new TextDecoder(utfLabel);

  try {
    result = Right(decoder.decode(buffer));
  }
  catch (error) {
    result = Left(error);
  }

  return result;
};
