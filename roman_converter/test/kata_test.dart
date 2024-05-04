import 'package:roman_converter/kata.dart';
import 'package:test/test.dart';

void main() {
  late RomanConvert converter;

  setUp(() {
    converter = RomanConvert();
  });
  group('Roman Convert |', () {
    test('Convert 6 to VI', () {
      expect(converter.convert(6), "VI");
    });
    test('Convert 99 to XCIX', () {
      expect(converter.convert(99), "XCIX");
    });

    test('Convert 47 to XLVII', () {
      expect(converter.convert(47), "XLVII");
    });

    test('Convert 325 to CCCXXV', () {
      expect(converter.convert(325), "CCCXXV");
    });
  });
}
