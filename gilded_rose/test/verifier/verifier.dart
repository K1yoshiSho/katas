import 'package:approval_dart/approval_dart.dart';
import 'package:gilded_rose/gilded_rose.dart';

const allTestCases = [
  [
    "foo",
    "Aged Brie",
    "Backstage passes to a TAFKAL80ETC concert",
    "Sulfuras, Hand of Ragnaros",
  ],
  [-1, 0, 5, 6, 10, 11],
  [-1, 0, 1, 49, 50]
];

const conjuredTestCases = [
  ["Conjured Mana Cake"],
  [-1, 0, 2],
  [-1, 0, 1, 2],
];

void main() {
  runApprovalTests(allTestCases);
  runApprovalTests(conjuredTestCases, fileName: 'conjured_cases.g.dart');
}

void runApprovalTests(List<List<dynamic>> testCases, {String? fileName}) {
  ApprovalDart.verifyAllCombinations(testCases, (combinations) {
    final List<Item> initialItems = [];
    final List<Item> expectedItems = [];

    for (var combination in combinations) {
      String itemName = combination[0];
      int sellIn = combination[1];
      int quality = combination[2];

      Item testItem = Item.makeItem(itemName, sellIn: sellIn, quality: quality);

      initialItems.add(Item.makeItem(itemName, sellIn: sellIn, quality: quality));

      GildedRose app = GildedRose(items: [testItem]);
      app.updateQuality();

      expectedItems.add(Item.makeItem(itemName, sellIn: testItem.sellIn, quality: testItem.quality));
    }

    ApprovalDart.saveCases(initialItems, expectedItems, fileName: fileName);
  });
}
