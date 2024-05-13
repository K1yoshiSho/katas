part of '../../gilded_rose.dart';

final class AgedBrie extends Item {
  AgedBrie({
    required int sellIn,
    required int quality,
  }) : super(
          Item.agedBrie,
          sellIn: sellIn,
          quality: quality,
        );

  @override
  void updateQuality() {
    if (quality < 50) {
      upgrade(by: 1);
    }

    advanceOneDay();

    if (isExpired && quality < 50) {
      upgrade(by: 1);
    }
  }
}
