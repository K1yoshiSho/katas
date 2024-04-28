import 'package:gilded_rose/gilded_rose.dart';

void main(List<String> args) {
  var items = [
    Item("+5 Dexterity Vest", sellIn: 10, quality: 20),
    Item("Aged Brie", sellIn: 2, quality: 0),
    Item("Elixir of the Mongoose", sellIn: 5, quality: 7),
    Item("Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
    Item("Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
    Item("Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
    Item("Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
    Item("Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
    // This conjured item does not work properly yet
    Item("Conjured Mana Cake", sellIn: 3, quality: 6)
  ];

  GildedRose app = GildedRose(items: items);

  int days = 2;
  if (args.isNotEmpty) {
    days = int.parse(args[0]) + 1;
  }

  for (int i = 0; i < days; i++) {
    print("\n=========== day $i ===========\n");
    print("name, sellIn, quality");
    for (var item in items) {
      print(item);
    }
    app.updateQuality();
  }
}
