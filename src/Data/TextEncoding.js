// TextEncoder is a Node.js global starting in v11
// https://nodejs.org/docs/latest-v11.x/api/globals.html#globals_textencoder

// Node.js only supports UTF-8 encoding.
// https://nodejs.org/docs/latest-v18.x/api/util.html#class-utiltextencoder

export function _encode (utfLabel, str) {
  let encoder = new TextEncoder(utfLabel)

  return encoder.encode(str)
}
