import 'package:gilded_rose/gilded_rose.dart';
import 'package:test/test.dart';

void main() {
  final tests = [
    _Test(
      name: '+5 Dexterity Vest:',
      items: [
        Item('+5 Dexterity Vest', sellIn: 5, quality: 7),
        Item('+5 Dexterity Vest', sellIn: -5, quality: 7),
      ],
      expectedResults: [
        "+5 Dexterity Vest, 4, 6",
        "+5 Dexterity Vest, -6, 5",
      ],
    ),
    _Test(
      name: 'Aged Brie:',
      items: [
        Item('Aged Brie', sellIn: 2, quality: 49),
        Item('Aged Brie', sellIn: 2, quality: 0),
        Item('Aged Brie', sellIn: -1, quality: 4),
      ],
      expectedResults: [
        "Aged Brie, 1, 50",
        "Aged Brie, 1, 1",
        "Aged Brie, -2, 6"
      ],
    ),
    _Test(
      name: 'Backstage Passes to a TAFKAL80ETC concert:',
      items: [
        Item('Backstage passes to a TAFKAL80ETC concert',
            sellIn: 10, quality: 10),
        Item('Backstage passes to a TAFKAL80ETC concert',
            sellIn: 5, quality: 10),
        Item('Backstage passes to a TAFKAL80ETC concert',
            sellIn: -1, quality: 4),
        Item('Backstage passes to a TAFKAL80ETC concert',
            sellIn: 9, quality: 2),
      ],
      expectedResults: [
        "Backstage passes to a TAFKAL80ETC concert, 9, 12",
        "Backstage passes to a TAFKAL80ETC concert, 4, 13",
        "Backstage passes to a TAFKAL80ETC concert, -2, 0",
        "Backstage passes to a TAFKAL80ETC concert, 8, 4"
      ],
    ),
    _Test(
      name: 'Conjured Mana Cake:',
      items: [Item('Conjured Mana Cake', sellIn: 3, quality: 6)],
      expectedResults: ["Conjured Mana Cake, 2, 5"],
    ),
  ];

  for (var testItem in tests) {
    group(testItem.name, () {
      for (var i = 0; i < testItem.items.length; i++) {
        test('Test item $i', () {
          final app = _addItems([testItem.items[i]]);
          expect(
              app.items.first.toString(), equals(testItem.expectedResults[i]));
        });
      }
    });
  }
}

/// `_Test` class is used to test the GildedRose app.
class _Test {
  final String name;
  final List<Item> items;
  final List<String> expectedResults;

  _Test({
    required this.name,
    required this.items,
    required this.expectedResults,
  });
}

/// `_addItems` function adds items to the GildedRose app and updates the quality.
GildedRose _addItems(List<Item> items) {
  final app = GildedRose(items: items);
  app.updateQuality();
  return app;
}
