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
      if (item.quality < 50) {
        item.quality = item.quality + 1;
      }

      item.sellIn = item.sellIn - 1;

      if (item.sellIn < 0) {
        if (item.quality < 50) {
          item.quality = item.quality + 1;
        }
      }
    } else {
      if (item.name != "Backstage passes to a TAFKAL80ETC concert") {
        if (item.quality > 0) {
          if (item.name != "Sulfuras, Hand of Ragnaros") {
            item.quality = item.quality - 1;
          }
        }
      } else {
        if (item.quality < 50) {
          item.quality = item.quality + 1;

          if (item.name == "Backstage passes to a TAFKAL80ETC concert") {
            if (item.sellIn < 11) {
              if (item.quality < 50) {
                item.quality = item.quality + 1;
              }
            }

            if (item.sellIn < 6) {
              if (item.quality < 50) {
                item.quality = item.quality + 1;
              }
            }
          }
        }
      }

      /// ============ If the item is not Sulfuras, Hand of Ragnaros ============

      if (item.name != "Sulfuras, Hand of Ragnaros") {
        item.sellIn = item.sellIn - 1;
      }

      /// ============ If the sellIn value is less than 0 ============

      if (item.sellIn < 0) {
        if (item.name != "Backstage passes to a TAFKAL80ETC concert") {
          if (item.quality > 0) {
            if (item.name != "Sulfuras, Hand of Ragnaros") {
              item.quality = item.quality - 1;
            }
          }
        } else {
          item.quality = item.quality - item.quality;
        }
      }
    }
  }
}
