part of '../../gilded_rose.dart';

final class ConjuredManaCake extends Item {
  ConjuredManaCake({
    required int sellIn,
    required int quality,
  }) : super(
          Item.conjuredManaCake,
          sellIn: sellIn,
          quality: quality,
        );

  @override
  updateQuality() {
    degrade(by: 2);
    advanceOneDay();

    if (isExpired) {
      degrade(by: 2);
    }
  }
}
