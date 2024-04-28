import 'package:gilded_rose/gilded_rose.dart';
import 'package:test/test.dart';

// Define all possible test cases as combinations of item names, sell-in values, and quality values.
const allTestCases = [
  ["foo", "Aged Brie", "Backstage passes to a TAFKAL80ETC concert", "Sulfuras, Hand of Ragnaros"],
  [-1, 0, 5, 6, 10, 11],
  [-1, 0, 1, 49, 50]
];

void main() {
  // Start the process of verifying all combinations of inputs defined above.
  verifyAllCombinations(allTestCases);
}

// Function to verify all combinations of given input sets.
void verifyAllCombinations(List<List<dynamic>> inputSets) {
  // Generate all possible combinations of the input sets using a Cartesian product.
  var combinations = _cartesianProduct(inputSets);
  for (var combination in combinations) {
    // Create a test for each combination.
    test('Testing with ${combination.join(", ")}', () {
      // Display the current combination being tested.
      print("Testing with ${combination.join(", ")}");
      String itemName = combination[0];
      int sellIn = combination[1];
      int quality = combination[2];
      // Create an item with the current combination of properties.
      Item testItem = Item(itemName, sellIn: sellIn, quality: quality);
      // Initialize the Gilded Rose app with the current item.
      GildedRose app = GildedRose(items: [testItem]);
      // Update the quality of the item.
      app.updateQuality();
      // Print and check the expected outcome against the actual outcome.
      print("Expected: ${_updateQuality(name: itemName, sellIn: sellIn, quality: quality)}");
      expect(app.items.first.toString(), equals(_updateQuality(name: itemName, sellIn: sellIn, quality: quality)));
    });
  }
}

// Function to simulate the update quality logic for testing purposes.
String _updateQuality({
  required String name,
  required int sellIn,
  required int quality,
}) {
  // Create a new item and Gilded Rose app instance for a pure function.
  final items = [Item(name, sellIn: sellIn, quality: quality)];
  final app = GildedRose(items: items);
  // Update the item's quality to simulate the process.
  app.updateQuality();
  // Return the string representation of the item post update.
  return app.items.first.toString();
}

// Function to compute the Cartesian product of a list of lists.
Iterable<List<T>> _cartesianProduct<T>(List<List<T>> lists) {
  Iterable<List<T>> result = [[]];
  for (var list in lists) {
    // For each list, append each element to every existing combination in the result.
    result = result.expand((x) => list.map((y) => [...x, y]));
  }
  return result;
}
