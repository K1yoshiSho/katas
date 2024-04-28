part of '../gilded_rose.dart';

final class Item {
  final String name;
  int sellIn;
  int quality;

  Item(this.name, this.sellIn, this.quality);

  @override
  String toString() => '$name, $sellIn, $quality';

  factory Item.fromString(String input) {
    final parts = input.split(',');
    return Item(parts[0], int.parse(parts[1]), int.parse(parts[2]));
  }

  Item copyWith({String? name, int? sellIn, int? quality}) {
    return Item(name ?? this.name, sellIn ?? this.sellIn, quality ?? this.quality);
  }
}
