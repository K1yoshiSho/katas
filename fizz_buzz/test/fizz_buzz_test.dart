import 'package:fizz_buzz/fizz_buzz.dart';
import 'package:test/test.dart';

void main() {
  group('Fizz Buzz Tests', () {
    test('Test Fizz Buzz output for n = 3', () {
      expect(fizzBuzz(3), equals(["1", "2", "Fizz"]));
    });

    test('Test Fizz Buzz output for n = 5', () {
      expect(fizzBuzz(5), equals(["1", "2", "Fizz", "4", "Buzz"]));
    });

    test('Test Fizz Buzz output for n = 15', () {
      expect(
          fizzBuzz(15),
          equals([
            "1",
            "2",
            "Fizz",
            "4",
            "Buzz",
            "Fizz",
            "7",
            "8",
            "Fizz",
            "Buzz",
            "11",
            "Fizz",
            "13",
            "14",
            "FizzBuzz"
          ]));
    });
  });
}
