import 'package:parrot_speed/parrot_refactoring.dart';
import 'package:test/test.dart';

void main() {
  group('Parrot Refactoring Tests:', () {
    test('Speed of European Parrot', () {
      const parrot = EuropeanParrot();
      expect(parrot.speed, 12.0);
    });

    test('Speed of African Parrot with one coconut', () {
      const parrot = AfricanParrot(numberOfCoconuts: 1);
      expect(parrot.speed, 3.0);
    });

    test('Speed of African Parrot with two coconuts', () {
      const parrot = AfricanParrot(numberOfCoconuts: 2);
      expect(parrot.speed, 0.0);
    });

    test('Speed of African Parrot with no coconuts', () {
      const parrot = AfricanParrot(numberOfCoconuts: 0);
      expect(parrot.speed, 12.0);
    });

    test('Speed of Norwegian Blue Parrot, nailed', () {
      const parrot = NorwegianBlueParrot(voltage: 0.0, isNailed: true);
      expect(parrot.speed, 0.0);
    });

    test('Speed of Norwegian Blue Parrot, not nailed', () {
      const parrot = NorwegianBlueParrot(voltage: 1.5, isNailed: false);
      expect(parrot.speed, 18.0);
    });

    test('Speed of Norwegian Blue Parrot, not nailed, high voltage', () {
      const parrot = NorwegianBlueParrot(voltage: 4.0, isNailed: false);
      expect(parrot.speed, 24.0);
    });
  });
}
