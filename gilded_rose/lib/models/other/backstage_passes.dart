part of '../../gilded_rose.dart';

final class BackstagePassesTAFKAL80ETC extends Item {
  BackstagePassesTAFKAL80ETC({
    required int sellIn,
    required int quality,
  }) : super(
          Item.backstagePasses,
          sellIn: sellIn,
          quality: quality,
        );

  @override
  updateQuality() {
    if (quality < 50) {
      upgrade(by: 1);

      if (sellIn < 11 && quality < 50) {
        upgrade(by: 1);
      }

      if (sellIn < 6 && quality < 50) {
        upgrade(by: 1);
      }
    }

    advanceOneDay();

    if (isExpired) {
      quality = 0;
    }
  }
}
