import 'package:roman_converter/kata.dart' as kata;

void main(List<String> arguments) {
  // Create an instance of the RomanConvert class.
  var converter = kata.RomanConvert();

  // Call the convert method on the instance with the number 6.
  print(converter.convert(6)); // Output: VI

  // Call the convert method on the instance with the number 99.
  print(converter.convert(99)); // Output: XCIX

  // Call the convert method on the instance with the number 47.
  print(converter.convert(47)); // Output: XLVII

  // Call the convert method on the instance with the number 325.
  print(converter.convert(325)); // Output: CCCXXV
}
