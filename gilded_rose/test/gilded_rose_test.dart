import 'package:gilded_rose/gilded_rose.dart';
import 'package:test/test.dart';

void main() {
  test('foo', () {
    final List<Item> items = [
      Item('foo', 0, 0),
    ];
    final app = GildedRose(items: items);
    app.updateQuality();
    expect("foo, -1, 0", app.items.first.toString());
  });

  test('foo with negative sellIn', () {
    final List<Item> items = [
      Item('foo', -1, 4),
    ];
    final app = GildedRose(items: items);
    app.updateQuality();
    expect("foo, -2, 2", app.items.first.toString());
  });

  test('+5 Dexterity Vest', () {
    final items = [
      Item('+5 Dexterity Vest', 10, 20),
    ];
    final app = GildedRose(items: items);
    app.updateQuality();
    expect("+5 Dexterity Vest, 9, 19", app.items.first.toString());
  });

  test('Aged Brie', () {
    final items = [
      Item('Aged Brie', 2, 0),
    ];
    final app = GildedRose(items: items);
    app.updateQuality();
    expect("Aged Brie, 1, 1", app.items.first.toString());
  });

  test('Aged Brie with negative sellIn', () {
    final List<Item> items = [
      Item('Aged Brie', -1, 4),
    ];
    final app = GildedRose(items: items);
    app.updateQuality();
    expect("Aged Brie, -2, 6", app.items.first.toString());
  });

  test('Elixir of the Mongoose', () {
    final items = [
      Item('Elixir of the Mongoose', 5, 7),
    ];
    final app = GildedRose(items: items);
    app.updateQuality();
    expect("Elixir of the Mongoose, 4, 6", app.items.first.toString());
  });

  test('Sulfuras, Hand of Ragnaros', () {
    final items = [
      Item('Sulfuras, Hand of Ragnaros', 0, 80),
    ];
    final app = GildedRose(items: items);
    app.updateQuality();
    expect("Sulfuras, Hand of Ragnaros, 0, 80", app.items.first.toString());
  });

  test('Sulfuras, Hand of Ragnaros with negative sellIn', () {
    final items = [
      Item('Sulfuras, Hand of Ragnaros', -1, 80),
    ];
    final app = GildedRose(items: items);
    app.updateQuality();
    expect("Sulfuras, Hand of Ragnaros, -1, 80", app.items.first.toString());
  });

  test('Backstage passes to a TAFKAL80ETC concert', () {
    final items = [
      Item('Backstage passes to a TAFKAL80ETC concert', 15, 20),
    ];
    final app = GildedRose(items: items);
    app.updateQuality();
    expect("Backstage passes to a TAFKAL80ETC concert, 14, 21", app.items.first.toString());
  });

  test('Backstage passes to a TAFKAL80ETC concert with negative sellIn', () {
    final List<Item> items = [
      Item('Backstage passes to a TAFKAL80ETC concert', -1, 4),
    ];
    final app = GildedRose(items: items);
    app.updateQuality();
    expect("Backstage passes to a TAFKAL80ETC concert, -2, 0", app.items.first.toString());
  });

  test('Conjured Mana Cake', () {
    final items = [
      Item('Conjured Mana Cake', 3, 6),
    ];
    final app = GildedRose(items: items);
    app.updateQuality();
    expect("Conjured Mana Cake, 2, 5", app.items.first.toString());
  });
}
