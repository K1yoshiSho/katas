part 'models/item.dart';

final class GildedRose {
  final List<Item> items;

  GildedRose({
    required this.items,
  });

  void updateQuality() {
    items.forEach(_updateQuality);
  }

  void _updateQuality(Item item) {
    if (item.name == "Aged Brie") {
      _agedBrie(item);
    } else if (item.name == "Backstage passes to a TAFKAL80ETC concert") {
      _backstagePassesTAFKAL80ETC(item);
    } else if (item.name != "Sulfuras, Hand of Ragnaros") {
      _updateForNotLegendaryItems(item);
    }
  }

  void _updateForNotLegendaryItems(Item item) {
    if (item.quality > 0) {
      item.quality = item.quality - 1;
    }
    item.sellIn = item.sellIn - 1;
    if (item.sellIn < 0 && item.quality > 0) {
      item.quality = item.quality - 1;
    }
  }

  void _backstagePassesTAFKAL80ETC(Item item) {
    if (item.quality < 50) {
      item.quality = item.quality + 1;

      if (item.sellIn < 11 && item.quality < 50) {
        item.quality = item.quality + 1;
      }

      if (item.sellIn < 6 && item.quality < 50) {
        item.quality = item.quality + 1;
      }
    }

    item.sellIn = item.sellIn - 1;

    if (item.sellIn < 0) {
      item.quality = item.quality - item.quality;
    }
  }

  void _agedBrie(Item item) {
    if (item.quality < 50) {
      item.quality = item.quality + 1;
    }

    item.sellIn = item.sellIn - 1;

    if (item.sellIn < 0 && item.quality < 50) {
      item.quality = item.quality + 1;
    }
  }
}
