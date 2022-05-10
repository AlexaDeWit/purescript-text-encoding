// TextDecoder is a Node.js global starting in v11
// https://nodejs.org/docs/latest-v11.x/api/globals.html#globals_textdecoder

export function _decode(Left, Right, utfLabel, buffer) {
  let result
  let decoder = new TextDecoder(utfLabel)

  try {
    result = Right(decoder.decode(buffer))
  } catch (error) {
    result = Left(error)
  }

  return result
}
