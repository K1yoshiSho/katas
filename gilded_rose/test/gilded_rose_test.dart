import 'package:gilded_rose/gilded_rose.dart';
import 'package:test/test.dart';

import 'verifier/all_scenarios.dart';

void main() {
  group('Gilded Rose Item Update Tests', () {
    for (var test in fooTests) {
      testItemUpdate(test[0], test[1], test[2], test[3]);
    }

    for (var test in agedBrieTests) {
      testItemUpdate(test[0], test[1], test[2], test[3]);
    }

    for (var test in backstagePassesTests) {
      testItemUpdate(test[0], test[1], test[2], test[3]);
    }

    for (var test in sulfurasTests) {
      testItemUpdate(test[0], test[1], test[2], test[3]);
    }
  });
}

void testItemUpdate(String name, int sellIn, int quality, String expectedOutput) {
  test('$name with sellIn $sellIn and quality $quality', () {
    Item item = Item(name, sellIn: sellIn, quality: quality);
    print("Actual: ${item.toString()}");
    GildedRose app = GildedRose(items: [item]);
    app.updateQuality();

    print("Expected: $expectedOutput");
    expect(item.toString(), equals(expectedOutput));
  });
}
