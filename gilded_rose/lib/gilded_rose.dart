part 'models/base/item.dart';
part 'models/other/aged_brie.dart';
part 'models/other/backstage_passes.dart';
part 'models/other/conjured.dart';
part 'models/other/sulfuras.dart';

final class GildedRose {
  final List<Item> items;

  GildedRose({
    required this.items,
  });

  void updateQuality() {
    for (final element in items) {
      element.updateQuality();
    }
  }
}
