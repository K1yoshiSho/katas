# Gilded Rose Refactoring Kata
Coding Dojo: https://codingdojo.org/kata/gilded-rose/

---

Hi and welcome to team `Gilded Rose`. As you know, we are a small inn with a prime location in a prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:   

- All items have a SellIn value which denotes the number of days we have to sell the item
- All items have a Quality value which denotes how valuable the item is
- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:   
- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:
- “Conjured” items degrade in Quality twice as fast as normal items   

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership *(you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)*.

---

### Simulate `Verify` and `Approval Tests` with the following instructions:

---
in `test/verifier/verify_all_combinations.dart`:

 This file contains utility functions to simulate the CombinationApprovals.VerifyAllCombinations()
 method from the `Verify` or `ApprovalTests` libraries used in other programming languages.
 It's designed to facilitate exhaustive testing with multiple inputs to ensure comprehensive `coverage`.
 This code only for `Girled Rose kata`. For other katas, you may need to modify the code.

 Steps to use:
 1. Define a list of possible input sets.
 2. Call `verifyAllCombinations()` with the list of inputs.
 3. Each combination of inputs generates a test case.
 4. Optionally, save the test results to another file and manually compare them with expected results.

 Example Usage:
 ```dart
 void main() {
   final allTestCases = [
     ["foo", "Aged Brie", "Backstage passes to a TAFKAL80ETC concert", "Sulfuras, Hand of Ragnaros"],
     [-1, 0, 5, 6, 10, 11],
     [-1, 0, 1, 49, 50]
   ];
   verifyAllCombinations(allTestCases);
 }
 ```
 This function will generate tests for all combinations of the inputs provided.

 Example Output:
 ```bash
 Testing with Backstage passes to a TAFKAL80ETC concert, 5, 0
 Expected: Backstage passes to a TAFKAL80ETC concert, 4, 3
 ```

 To save and reuse test results:
 ```dart
 const List<List<dynamic>> backstageTests = [
   ["Backstage passes to a TAFKAL80ETC concert", 5, 0, "Backstage passes to a TAFKAL80ETC concert, 4, 3"],
 ];
 ```

 Using saved results in your tests:
 ```dart
 void main() {
   group('Gilded Rose tests: backstageTests', () {
     for (var test in backstageTests) {
       testItemUpdate(test[0], test[1], test[2], test[3]);
     }
   });
 }

 void testItemUpdate(String name, int sellIn, int quality, String expectedOutput) {
   test('$name with sellIn $sellIn and quality $quality', () {
     Item item = Item(name, sellIn: sellIn, quality: quality);
     GildedRose app = GildedRose(items: [item]);
     app.updateQuality();
     expect(item.toString(), equals(expectedOutput));
   });
 }
 ```

 This documentation ensures you can systematically test combinations of input parameters and verify the behavior of your system against expected outcomes.

 So, after that we have **`120` test cases** for the `Gilded Rose` kata.