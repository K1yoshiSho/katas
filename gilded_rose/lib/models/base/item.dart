part of '../../gilded_rose.dart';

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

  void updateQuality() {
    degrade(by: 1);
    advanceOneDay();
    if (isExpired) {
      degrade(by: 1);
    }
  }

  bool get isExpired => sellIn < 0;

  void degrade({required int by}) {
    if (quality > 0) {
      if (quality - by >= 0) {
        quality = quality - by;
      } else {
        quality = 0;
      }
    }
  }

  void upgrade({
    required int by,
  }) {
    quality = quality + by;
  }

  void advanceOneDay() {
    sellIn = sellIn - 1;
  }
}
