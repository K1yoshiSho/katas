// Importing necessary packages.
import 'package:approval_dart/approval_dart.dart';
import 'package:gilded_rose/gilded_rose.dart';

// Constant list of all test cases with different item names, sellIn values and quality values
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

void main() {
  // Using Approvals framework to verify all possible combinations of test cases
  ApprovalDart.verifyAllCombinations(allTestCases, (combinations) {
    // List to store items before their qualities are updated
    final List<Item> initialItems = [];
    // List to store items after their qualities have been updated
    final List<Item> expectedItems = [];

    for (var combination in combinations) {
      String itemName = combination[0]; // Getting the name from each combination
      int sellIn = combination[1]; // Getting the sellIn value from each combination
      int quality = combination[2]; // Getting the quality value from each combination

      // Creating new Item instance with given properties
      Item testItem = Item(itemName, sellIn: sellIn, quality: quality);

      // Add a clone of the item to actualItems for keeping a record of the initial state
      initialItems.add(Item(itemName, sellIn: sellIn, quality: quality));

      // Create an instance of the GildedRose app passing in the test item
      GildedRose app = GildedRose(items: [testItem]);
      // Updating quality of items using GildedRose app
      app.updateQuality();

      // After quality update, add the updated item to expectedItems list
      expectedItems.add(Item(itemName, sellIn: testItem.sellIn, quality: testItem.quality));
    }

    // Once all combinations are processed, save the state of
    // items before and after the quality update for approval testing.
    ApprovalDart.saveApprovedCases(initialItems, expectedItems);
  });
}
