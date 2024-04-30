part of '../gilded_rose.dart';

final class Item {
  final String name;
  int sellIn;
  int quality;

  Item(this.name, {required this.sellIn, required this.quality});

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
}
