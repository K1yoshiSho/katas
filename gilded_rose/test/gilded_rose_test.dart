import 'package:approval_tests/approval_tests.dart';
import 'package:gilded_rose/gilded_rose.dart';
import 'package:test/test.dart';

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
  group('Approval Tests for Gilded Rose', () {
    test('should verify all combinations of common test cases', () {
      // Perform the verification for all combinations
      Approvals.verifyAllCombinations(
        allTestCases,
        options: const Options(
          comparator: IDEComparator(
            ide: ComparatorIDE.visualStudioCode,
          ),
          filesPath: "test/verifier/test_cases",
          deleteReceivedFile: true,
        ),
        processor: processItemCombination,
      );
    });

    test('should verify all combinations of conjured test cases', () {
      // Perform the verification for conjured combinations
      Approvals.verifyAllCombinations(
        conjuredTestCases,
        options: const Options(
          comparator: IDEComparator(
            ide: ComparatorIDE.visualStudioCode,
          ),
          filesPath: "test/verifier/conjured_test_cases",
          deleteReceivedFile: true,
        ),
        processor: processItemCombination,
      );
    });
  });
}

// Function to process each combination and generate output for verification
String processItemCombination(Iterable<List<dynamic>> combinations) {
  final receivedBuffer = StringBuffer();

  for (final combination in combinations) {
    // Extract data from the current combination
    final String itemName = combination[0] as String;
    final int sellIn = combination[1] as int;
    final int quality = combination[2] as int;

    // Create an Item object representing the current combination
    final Item testItem = Item(itemName, sellIn: sellIn, quality: quality);

    // Passing testItem to the application
    final GildedRose app = GildedRose(items: [testItem]);

    // Updating quality of testItem
    app.updateQuality();

    // Adding the updated item to expectedItems
    receivedBuffer.writeln(testItem.toString());
  }

  // Return a string representation of the updated item
  return receivedBuffer.toString();
}
