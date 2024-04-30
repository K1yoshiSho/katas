// ignore_for_file: depend_on_referenced_packages

import 'package:gilded_rose/gilded_rose.dart';
import 'package:test/test.dart';

import 'verifier/approved_cases.g.dart';
import 'verifier/conjured_cases.g.dart';

void main() {
  group('Gilded Rose |', () {
    for (var test in approvedCases) {
      testItemUpdate(test);
    }
  });

  group('Gilded Rose | Conjured Tests:', () {
    for (var test in conjuredCases) {
      testItemUpdate(test);
    }
  });
}

void testItemUpdate(Map<String, dynamic> map) {
  final actualItem = Item.makeItem(
    map['initial']['name'],
    sellIn: map['initial']['sellIn'],
    quality: map['initial']['quality'],
  );

  final expectedItem = Item.makeItem(
    map['expected']['name'],
    sellIn: map['expected']['sellIn'],
    quality: map['expected']['quality'],
  );

  test('${actualItem.name} with sellIn ${actualItem.sellIn} and quality ${actualItem.quality}', () {
    print("Initial: ${actualItem.toString()}");
    GildedRose app = GildedRose(items: [actualItem]);
    app.updateQuality();

    print("Expected: ${expectedItem.toString()}");
    expect(actualItem.toString(), equals(expectedItem.toString()));
  });
}
