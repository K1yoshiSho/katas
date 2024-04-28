import 'package:parrot_speed/parrot_refactoring.dart';
import 'package:test/test.dart';

void main() {
  group('Parrot Tests', () {
    test('Speed of European Parrot', () {
      final parrot = EuropeanParrot(voltage: 0.0, isNailed: false);
      expect(parrot.speed, 12.0);
    });

    test('Speed of African Parrot with one coconut', () {
      final parrot = AfricanParrot(numberOfCoconuts: 1, voltage: 0.0, isNailed: false);
      expect(parrot.speed, 3.0);
    });

    test('Speed of African Parrot with two coconuts', () {
      final parrot = AfricanParrot(numberOfCoconuts: 2, voltage: 0.0, isNailed: false);
      expect(parrot.speed, 0.0);
    });

    test('Speed of African Parrot with no coconuts', () {
      final parrot = AfricanParrot(numberOfCoconuts: 0, voltage: 0.0, isNailed: false);
      expect(parrot.speed, 12.0);
    });

    test('Speed of Norwegian Blue Parrot, nailed', () {
      final parrot = NorwegianBlueParrot(voltage: 0.0, isNailed: true);
      expect(parrot.speed, 0.0);
    });

    test('Speed of Norwegian Blue Parrot, not nailed', () {
      final parrot = NorwegianBlueParrot(voltage: 1.5, isNailed: false);
      expect(parrot.speed, 18.0);
    });

    test('Speed of Norwegian Blue Parrot, not nailed, high voltage', () {
      final parrot = NorwegianBlueParrot(voltage: 4.0, isNailed: false);
      expect(parrot.speed, 24.0);
    });
  });
}