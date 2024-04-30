part of '../gilded_rose.dart';

final class Item {
  final String name;
  int sellIn;
  int quality;

  Item(this.name, {required this.sellIn, required this.quality});

  static const String agedBrie = 'Aged Brie';
  static const String backstagePasses = 'Backstage passes to a TAFKAL80ETC concert';
  static const String sulfuras = 'Sulfuras, Hand of Ragnaros';
  static const String conjuredManaCake = 'Conjured Mana Cake';

  static Item makeItem(
    String name, {
    required int sellIn,
    required int quality,
  }) {
    switch (name) {
      case Item.agedBrie:
        return AgedBrie(sellIn: sellIn, quality: quality);
      case Item.backstagePasses:
        return BackstagePassesTAFKAL80ETC(sellIn: sellIn, quality: quality);
      case Item.sulfuras:
        return SulfurasHandOfRagnaros(sellIn: sellIn, quality: quality);
      case Item.conjuredManaCake:
        return ConjuredManaCake(sellIn: sellIn, quality: quality);
      default:
        return Item(name, sellIn: sellIn, quality: quality);
    }
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      json['name'],
      sellIn: json['sellIn'],
      quality: json['quality'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sellIn': sellIn,
      'quality': quality,
    };
  }

  @override
  String toString() {
    return 'Item{name: $name, sellIn: $sellIn, quality: $quality}';
  }

  void _updateForAgedBrie() {
    if (quality < 50) {
      quality = quality + 1;
    }

    sellIn = sellIn - 1;

    if (sellIn < 0 && quality < 50) {
      quality = quality + 1;
    }
  }
}
