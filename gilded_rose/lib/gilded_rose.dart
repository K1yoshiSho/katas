part 'models/item.dart';
part 'models/aged_brie.dart';
part 'models/backstage_passes.dart';
part 'models/conjured.dart';
part 'models/sulfuras.dart';

final class GildedRose {
  final List<Item> items;

  GildedRose({
    required this.items,
  });

  void updateQuality() {
    items.forEach(_updateQuality);
  }

  void _updateQuality(Item item) {
    if (item.name == Item.conjuredManaCake) {
      _updateForConjuredManaCake(item);
    } else if (item.name == Item.agedBrie) {
      _updateForAgedBrie(item);
    } else if (item.name == Item.backstagePasses) {
      _updateBackstagePassesTAFKAL80ETC(item);
    } else if (item.name != Item.sulfuras) {
      _updateForNotLegendaryItems(item);
    }
  }

  void _updateForConjuredManaCake(Item item) {
    if (item.quality > 0) {
      item.quality = item.quality - 2;
    }
    item.sellIn = item.sellIn - 1;
    if (item.sellIn < 0 && item.quality > 0) {
      item.quality = item.quality - 2;
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

  void _updateBackstagePassesTAFKAL80ETC(Item item) {
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

  void _updateForAgedBrie(Item item) {
    if (item.quality < 50) {
      item.quality = item.quality + 1;
    }

    item.sellIn = item.sellIn - 1;

    if (item.sellIn < 0 && item.quality < 50) {
      item.quality = item.quality + 1;
    }
  }
}
