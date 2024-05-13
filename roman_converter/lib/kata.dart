// Define a class named RomanConvert.
final class RomanConvert {
  // Declare a constant list of integers representing all basic possible roman numerals in decimal form.
  static const List<int> values = [
    1000,
    900,
    500,
    400,
    100,
    90,
    50,
    40,
    10,
    9,
    5,
    4,
    1,
  ];

  // Declare a constant map that pairs each integer (key) with its corresponding roman numeral (value).
  static const Map<int, String> symbols = {
    1: "I",
    4: "IV",
    5: "V",
    9: "IX",
    10: "X",
    40: "XL",
    50: "L",
    90: "XC",
    100: "C",
    400: "CD",
    500: "D",
    900: "CM",
    1000: "M",
  };

  // Method that converts numbers to Roman numerals.
  String convert(int n) {
    int number = n;
    // Create an empty StringBuffer to build up our result.
    final StringBuffer result = StringBuffer();

    // Loop through each value in our 'values' list.
    for (final int value in values) {
      // While the number is more than or equal to the current value.
      while (number >= value) {
        // Subtract the value from our number.
        number -= value;
        // Append the matching Roman numeral to our result.
        result.write(symbols[value]);
      }
    }

    // Return the final converted Roman numeral as a string.
    return result.toString();
  }
}
