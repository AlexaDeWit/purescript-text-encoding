"use strict";

// `TextEncoder` is not available in `node`, use polyfill in that case
var TextEncoder =
  (typeof window === "object" && window.TextEncoder)
  || (typeof require === "function" && require("text-encoding").TextEncoder);

exports._encode = function (utfLabel, str) {
  var encoder = new TextEncoder(utfLabel);

  return encoder.encode(str);
};
