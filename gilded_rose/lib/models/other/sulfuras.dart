part of '../../gilded_rose.dart';

final class SulfurasHandOfRagnaros extends Item {
  SulfurasHandOfRagnaros({
    required int sellIn,
    required int quality,
  }) : super(
          Item.sulfuras,
          sellIn: sellIn,
          quality: quality,
        );

  @override
  updateQuality() {
    // Sulfuras never has to be sold or decreases in quality
  }
}
