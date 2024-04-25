import 'package:multiple_of_3_or_5/multiple_of_3_or_5.dart';
import 'package:test/test.dart';

void main() {
  group('Multiples of 3 and 5', () {
    test('Should return 0 if the input is negative: 0', () {
      expect(solution(-1), equals(0));
    });

    test('Should return 0 if the input is less than 3: 0', () {
      expect(solution(2), equals(0));
    });

    test('Sum of multiples below 10: 23', () {
      expect(solution(10), equals(23));
    });

    test('Sum of multiples below 20: 78', () {
      expect(solution(20), equals(78));
    });

    test('Sum of multiples below 200: 9168', () {
      expect(solution(200), equals(9168));
    });
  });
}
