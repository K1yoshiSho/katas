part of '../../gilded_rose.dart';

final class Item {
  final String name;
  int sellIn;
  int quality;

  Item(this.name, {required this.sellIn, required this.quality});

  static const String agedBrie = 'Aged Brie';
  static const String backstagePasses =
      'Backstage passes to a TAFKAL80ETC concert';
  static const String sulfuras = 'Sulfuras, Hand of Ragnaros';
  static const String conjuredManaCake = 'Conjured Mana Cake';

  Item makeItem(
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

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        json['name'] as String? ?? '',
        sellIn: json['sellIn'] as int? ?? 0,
        quality: json['quality'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'sellIn': sellIn,
        'quality': quality,
      };

  @override
  String toString() => 'Item{name: $name, sellIn: $sellIn, quality: $quality}';

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
