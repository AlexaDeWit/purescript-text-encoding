"use strict";

function importTextEncoding() {
  try {
    return require("text-encoding").TextDecoder;
  }
  catch (e) {
    console.log(
      "You appear to be trying to use the purescript-text-encoding in a node based " +
      "environment without having the text-encoding polyfill available in your node_modules.\n" +
      "This can be easily resolved by adding it to your package.json dependencies." +
      " if this is not sufficient, please feel free to contact the maintainer of this library via its github here:\n"  +
      "https://github.com/AlexaDeWit/purescript-text-encoding"
    );
    throw new Error("Text encoding polyfill library could not be imported.");
  }
}

// `TextDecoder` is not available in `node`, use polyfill in that case
var TextDecoder =
  (typeof window === "object" && window.TextDecoder)
  || (typeof require === "function" && importTextEncoding());

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
